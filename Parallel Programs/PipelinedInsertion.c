/*  Name: Sean Pope
 *  Date: 8/4/13
 *  Assignment: Lab 3
 *  Implement piplelined insertion sort
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "mpi.h"

int main(int argc, char* argv[])
{
	MPI_Init(&argc, &argv);
	
	int process_rank;
	int process_count;
	
	MPI_Comm_rank(MPI_COMM_WORLD, &process_rank); // Find process rank
	MPI_Comm_size(MPI_COMM_WORLD, &process_count); // Stores the number of processes
	
	int maxNumber = 100; // Range of numbers to generate
	int listSize = process_count; // Quantity of numbers to generate
	int runs = 0;
	int numberToHold;
	int numberToPass;
	int tempNumber;
	int sender = process_rank - 1;
	int receiver = process_rank + 1;
	int* theList = malloc(sizeof(int) * listSize);
	
	// Generate random numbers in process 0 to fill the list and to be sorted
	if(process_rank == 0) 
	{
		printf("\nGenerating %d random numbers, ranging from 0 to %d.", listSize, maxNumber - 1);
		printf("\nThe unsorted list is:\n");
		srand(time(NULL));
		for(runs = 0; runs < listSize; runs++)
		{
			theList[runs] = rand() % maxNumber;
			printf("%d ", theList[runs]);
		}
	}
	
	// In each process, pass along a number if it is less than the current one it is holding.
	for(runs = 0; runs < process_count - process_rank; runs++)
	{
		if(process_rank == 0)
		{
			if(runs == 0)
				numberToHold = theList[runs];
			else
			{
				numberToPass = theList[runs];
				if(numberToHold < numberToPass)
				{
					tempNumber = numberToHold;
					numberToHold = numberToPass;
					numberToPass = tempNumber;
				}
				MPI_Send(&numberToPass, 1, MPI_INT, receiver, 0, MPI_COMM_WORLD);
			}
		}
		else
		{
			if(runs == 0)
				MPI_Recv(&numberToHold, 1, MPI_INT, sender, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
			else
			{
				MPI_Recv(&numberToPass, 1, MPI_INT, sender, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
				if(numberToHold < numberToPass)
				{
					tempNumber = numberToHold;
					numberToHold = numberToPass;
					numberToPass = tempNumber;
				}
				MPI_Send(&numberToPass, 1, MPI_INT, receiver, 0, MPI_COMM_WORLD);
			}
		}
	}

	numberToPass = 0;
	if(process_rank == 0)
		printf("\nThe numbers in order, sorted by the pipelined insertion sort are:\n");
	
	// Pipeline all numbers back to process 0 to print.
	for(runs = 0; runs < process_count - process_rank; runs++)
	{
		if(process_rank == 0)
		{
			if(runs == 0)
			{
				printf("%d ", numberToHold);
			}
			else
			{
				MPI_Recv(&numberToPass, 1, MPI_INT, receiver, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
				printf("%d ", numberToPass);
			}
		}
		else
		{
			if(runs == 0)
				MPI_Send(&numberToHold, 1, MPI_INT, sender, 0, MPI_COMM_WORLD);
			else
			{
				MPI_Recv(&numberToPass, 1, MPI_INT, receiver, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
				MPI_Send(&numberToPass, 1, MPI_INT, sender, 0, MPI_COMM_WORLD);
			}
		}
	}
	
	if(process_rank == 0)
		printf("\n\n");
	MPI_Finalize();
	return 0;
}
