/*  Name: Sean Pope
 *  Date: 8/3/13
 *  Assignment: Lab 2
 *  Implement Monte Carlo Integration
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include "mpi.h"
#define PI 3.141592

// Generate a random number between x1 and x2
double randD(int x1, int x2)
{
	int percision = 1000000;
	double newRand = 0.0;
	int base = rand() % ((x2 * percision) - (x1 * percision)) + (x1 * percision);
	newRand = (double)base / (double)percision;
	return newRand;
}

int main(int argc, char* argv[])
{
	MPI_Init(&argc, &argv); // Start up MPI
	
	int process_rank;
	int process_count;
	
	MPI_Comm_rank(MPI_COMM_WORLD, &process_rank); // Find process rank
	MPI_Comm_size(MPI_COMM_WORLD, &process_count); // Stores the number of processes
	
	int x1 = 1;
	int x2 = 3;
	int runs = 0;
	int samplesPerProcess = 10000;
	double a = ((double)x1 + (double)x2) / 2;
	double dx = x2 - x1;
	double r = dx/2;
	double fx = 0.0;
	double usingPi = 0.0;
	double totalArea = 0.0;
	double area = 0.0;
	double sum = 0.0;
	double fault = 0.01;
	double* randomNumbers = malloc(sizeof(double) * process_count * samplesPerProcess);
	if(process_rank == 0)
		srand(time(NULL));
	
	do{
		// Fill the array with random numbers between x1 and x2
		if(process_rank == 0)
		{
			printf("\nFinding the area of a circle from x1 = %d to x2 = %d with %d samples per process and %d processes.", x1, x2, samplesPerProcess, process_count);
			printf("\nThe integrated area will be recalculated if the actual area differs by more than %f.", fault);
			for(runs = 0; runs < process_count * samplesPerProcess; runs++)
			{
				randomNumbers[runs] = randD(x1, x2);
			}
		}
		
		// Send the array to all processes from process 0
		MPI_Bcast(randomNumbers, samplesPerProcess * process_count, MPI_DOUBLE, 0, MPI_COMM_WORLD);
		
		// Math for calculating sum for process 0
		if(process_rank == 0)
		{
			for(runs = 0; runs < samplesPerProcess; runs++)
			{
				fx = 2 * sqrt(((dx/2) * (dx/2)) - ((randomNumbers[runs] - a) * (randomNumbers[runs] - a)));
				sum = sum + (fx * dx);
			}
			area = (sum / samplesPerProcess);
		}
		else // Math for calculating sum for other processes
		{
			for(runs = (process_rank * samplesPerProcess) - 1; runs < (process_rank * samplesPerProcess) + samplesPerProcess; runs++)
			{
				fx = 2 * sqrt(((dx/2) * (dx/2)) - ((randomNumbers[runs] - a) * (randomNumbers[runs] - a)));
				sum = sum + (fx * dx);
			}
			area = (sum / samplesPerProcess);
		}
		
		// Im process 0, add all areas together and store in the totalArea variable
		MPI_Reduce(&area, &totalArea, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
		
		// Print and compare results
		if(process_rank == 0)
		{
			usingPi = PI * r * r;
			totalArea = totalArea / (double)process_count;
			printf("\nThe area of a circle between %d and %d calculated using Monte Carlo Integration is %f.", x1, x2, totalArea);
			printf("\nUsing the formula A = Pi*r*r, the calculated area is %f.\n\n", usingPi);
		}
	}while( sqrt((usingPi - totalArea) * (usingPi - totalArea)) > fault);
	free(randomNumbers);
	MPI_Finalize();
	return 0;
}
