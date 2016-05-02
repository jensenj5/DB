/*  Name: Sean Pope
 *  Date: 8/6/13
 *  Assignment: Project 4
 *  Implement prefix product on floating point numbers between 0 and 1.
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
	
	float* theList = malloc(sizeof(float) * process_count);
	float* productList = malloc(sizeof(float) * process_count);
	int runs = 0;
	float processNum = 0.0;
	float processProduct = 0.0;
	float interval = 1 / ((float)process_count + 1);
	
	if(process_rank == 0)
	{
		printf("\nThe numbers generated in process %d are:\n", process_rank);
		for(runs = 0; runs < process_count; runs++)
		{
			theList[runs] = interval;
			printf("%f ", interval);
			interval += (1 / ((float)process_count + 1));
		}
	}
	
	MPI_Scatter(theList, 1, MPI_FLOAT, &processNum, 1, MPI_FLOAT, 0, MPI_COMM_WORLD);
	
	MPI_Scan(&processNum, &processProduct, 1, MPI_FLOAT, MPI_PROD, MPI_COMM_WORLD);
	
	MPI_Gather(&processProduct, 1, MPI_FLOAT, productList, 1, MPI_FLOAT, 0, MPI_COMM_WORLD);
	
	if(process_rank == 0)
	{
		printf("\n\nThe prefix products are:\n");
		for(runs = 0; runs < process_count; runs++)
			printf("%f ", productList[runs]);
			
		printf("\n\n");
	}
	
	MPI_Finalize();
	return 0;
}
