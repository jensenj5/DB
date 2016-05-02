/*  Name: Sean Pope
 *  Date: 8/6/13
 *  Assignment: Project 4
 *  Implement prefix sum on floating point numbers between 0 and 1.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "mpi.h"

// Generate a random number between x1 and x2
float randF(int x1, int x2)
{
	int percision = 1000;
	float newRand = 0.0;
	int base = rand() % ((x2 * percision) - (x1 * percision)) + (x1 * percision);
	newRand = (float)base / (float)percision;
	return newRand;
}

int main(int argc, char* argv[])
{
	MPI_Init(&argc, &argv);
	
	int process_rank;
	int process_count;
	
	MPI_Comm_rank(MPI_COMM_WORLD, &process_rank); // Find process rank
	MPI_Comm_size(MPI_COMM_WORLD, &process_count); // Stores the number of processes
	
	float* theList = malloc(sizeof(float) * process_count);
	int runs = 0;
	float processNum = 0.0;
	
	if(process_rank == 0)
	{
		printf("\nThe numbers generated in process %d are:\n", process_rank);
		for(runs = 0; runs < process_count; runs++)
		{
			theList[runs] = randF(0, 1);
			printf("%f ", theList[runs]);
		}
	}
	
	MPI_Scatter(theList, 1, MPI_FLOAT, processNum, 1, MPI_FLOAT, 0, MPI_COMM_WORLD);
	
	
	
	MPI_Finalize();
	return 0;
}
