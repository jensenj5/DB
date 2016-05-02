/* Name: Sean Pope
 * Date: 8/2/13
 * Assignment: Project3
 * Implement parallel threaded summation
 */
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include "mpi.h"

#define array_size 1000
#define no_threads 10

int a[array_size];
int global_index = 0;
int sum = 0;
pthread_mutex_t mutex1;

// Operations for the slave process to perform
void *slave(void *ignored)
{
	int local_index, partial_sum = 0;
	
	do{
		pthread_mutex_lock(&mutex1);
		local_index = global_index;
		global_index++;
		pthread_mutex_unlock(&mutex1);
		if(local_index < array_size)
			partial_sum += *(a + local_index);
	}while(local_index < array_size);
	
	return;
}

int main(int argc, char *argv[])
{
	MPI_Init(&argc, &argv); // Start up MPI
	pthread_mutex_init(&mutex1, NULL); // Start Pthreads

	int process_rank;
	int process_count;
	
	MPI_Comm_rank(MPI_COMM_WORLD, &process_rank); // Find process rank
	MPI_Comm_size(MPI_COMM_WORLD, &process_count); // Stores the number of processes
	
	pthread_t thread[10]; // Array to threads to handle pieces of the sums
	int runs = 0; // Variable to control loop runs
	int result = 0; // Holds total for even indexes
	int total = 0; // Holds total for odd indexes 
	
	// In process 0, initialize the array
	if(process_rank == 0)
	{
		printf("\nFinding the sum from 1 to %d, using %d threads and 2 processes.", array_size, no_threads);
		for(runs = 0; runs < array_size; runs++)
		{
			a[runs] = runs + 1;
		}
		MPI_Send(&a, array_size, MPI_INT, 1, 0, MPI_COMM_WORLD);
	}
	
	// Send the array to process 1
	if(process_rank == 1)
	{
		MPI_Recv(&a, array_size, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
	}
	
	// In process 0, fill the odd indexes of the array using threads
	if(process_rank == 0)
	{
		for(runs = 0; runs < no_threads; runs ++)
		{
			if(runs % 2 == 0)
			{
				if(pthread_create(&thread[runs], NULL, slave, NULL) != 0)
					perror("Pthread_create failed.");
			}
		}
		for(runs = 0; runs < array_size; runs += 2)
		{
			total += a[runs];
		}
	}
	
	// In process 1, fill the even indexes of the array using threads
	if(process_rank == 1)
	{
		for(runs = 0; runs < no_threads; runs ++)
		{
			if(runs % 2 == 1)
			{
				if(pthread_create(&thread[runs], NULL, slave, NULL) != 0)
					perror("Pthread_create failed.");
			}
		}
		
		for(runs = 1; runs < array_size; runs += 2)
		{
			result += a[runs];
		}
		MPI_Send(&result, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
	}
	
	// Get the final summation in process 0 and 
	if(process_rank == 0)
	{
		MPI_Recv(&result, 1, MPI_INT, 1, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		
		sum = result + total;
		printf("\nTotal from even indexes (computed in process 0): %d\nTotal from odd indexes (computed in process 1): %d", total, result);
		printf("\nThe sum of 1 to %d is %d.\n\n", array_size, sum);	
	}
	
	MPI_Finalize(); // Shut down MPI
	return 0;
}
