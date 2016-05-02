/* Name: Sean Pope
 * Date: 7/23/13
 * Assignment: Project 2
 * Implement Bucket Sort
 */
#include <stdio.h>
#include <string.h>
#include "mpi.h"

int main(int argc, char* argv[])
{
	MPI_Init(&argc, &argv); // Start up MPI
	
	int process_rank;
	int process_count;
	
	MPI_Comm_rank(MPI_COMM_WORLD, &process_rank); // Find process rank
	MPI_Comm_size(MPI_COMM_WORLD, &process_count); // Stores the number of processes
	
	int runs = 0; // A control variable for loop runs
	int innerRuns = 0; // A control variable for inner loop runs
	int deepRuns = 0;
	int maxNumber = 10000; // Range of numbers to generate
	int listSize = 1000; // Number of elements to sort
	int tempBucket_count = 0;
	
	int smallBucket_lowerrange = -1;
	int smallBucket_upperrange = (maxNumber / process_count); // Highest number the left bucket will hold
	int bigBucket_size = (listSize / process_count) + 2; // Number of elements given to each process to handle.  Two is added to compensate for odd number of processes, and set an end point.
	int* smallBucket_count = malloc(sizeof(int) * process_count); // A variable that controls the current count of elements in the smallBuckets
	
	int*** locallyUnsortedBuckets = malloc(sizeof(int**) * process_count);
	int*** locallySortedBuckets = malloc(sizeof(int**) * process_count);
	
	int* grandBucket = malloc(sizeof(int) * listSize); // Array to hold all numbers generated
	int* sortedGrandBucket = malloc(sizeof(int) * listSize);
	int* finalSortedGrandBucket = malloc(sizeof(int) * listSize);
	
	int* bigBucket = malloc(sizeof(int) * bigBucket_size); // Array to hold the processes share of numbers
	int* sortedBigBuckets = malloc(sizeof(int) * listSize);
	
	int** smallBuckets = malloc(sizeof(int*) * process_count); // Array to hold array of small buckets
	int** sortedSmallBuckets = malloc(sizeof(int*) * process_count);
	
	
	for(runs = 0; runs < process_count; runs++)
		smallBuckets[runs] = malloc(sizeof(int) * bigBucket_size);
	
	for(runs = 0; runs < process_count; runs++)
		sortedSmallBuckets[runs] = malloc(sizeof(int) * listSize);
	
	for(runs = 0; runs < process_count; runs++)
		locallySortedBuckets[runs] = malloc(sizeof(int) * bigBucket_size);
	
	for(runs = 0; runs < process_count; runs++)
		for(innerRuns = 0; innerRuns <  bigBucket_size; innerRuns++)
			locallySortedBuckets[runs][innerRuns] = malloc(sizeof(int) * bigBucket_size);
			
	for(runs = 0; runs < process_count; runs++)
		locallyUnsortedBuckets[runs] = malloc(sizeof(int) * bigBucket_size);
	
	for(runs = 0; runs < process_count; runs++)
		for(innerRuns = 0; innerRuns <  bigBucket_size; innerRuns++)
			locallyUnsortedBuckets[runs][innerRuns] = malloc(sizeof(int) * bigBucket_size);
	
	for(runs = 0; runs < bigBucket_size; runs++)
		bigBucket[runs] = -1;
	
	for(runs = 0; runs < bigBucket_size; runs++)
		sortedBigBuckets[runs] = -1;
	
	for(runs = 0; runs < process_count; runs++)
		smallBucket_count[runs] = 0;
		
	for(runs = 0; runs < listSize; runs++)
		grandBucket[runs] = -1;
		
	for(runs = 0; runs < listSize; runs++)
		sortedGrandBucket[runs] = -1;	
		
	for(runs = 0; runs < process_count; runs++)
		for(innerRuns = 0; innerRuns <  bigBucket_size; innerRuns++)
			smallBuckets[runs][innerRuns] = -1;
			
	for(runs = 0; runs < process_count; runs++)
		for(innerRuns = 0; innerRuns <  listSize; innerRuns++)
			sortedSmallBuckets[runs][innerRuns] = -1;
	
	for(runs = 0; runs < process_count; runs++)
		for(innerRuns = 0; innerRuns <  bigBucket_size; innerRuns++)
			for(deepRuns = 0; deepRuns < bigBucket_size; deepRuns++)
				locallySortedBuckets[runs][innerRuns][deepRuns] = -1;
	
	if(process_rank == 0)
	{
		printf("\nGenerating %d random numbers, ranging from 0 to %d.", listSize, maxNumber - 1);
		for(runs = 0; runs < listSize; runs++)
			grandBucket[runs] = rand() % maxNumber;
	}
	
	printf("\nSending %d numbers to all %d processes.", bigBucket_size, process_count);
	MPI_Scatter(grandBucket, bigBucket_size, MPI_INT, bigBucket, bigBucket_size, MPI_INT, 0, MPI_COMM_WORLD);
	
	for(runs = 0; bigBucket[runs] != -1; runs++)
	{
		smallBucket_lowerrange = -1;
		tempBucket_count = 0;
		for(innerRuns = 0; innerRuns < process_count; innerRuns++)
		{
			if(bigBucket[runs] > smallBucket_lowerrange && bigBucket[runs] < (smallBucket_upperrange * (innerRuns + 1)))
			{
				smallBuckets[innerRuns][smallBucket_count][tempBucket_count] = bigBucket[runs];
				smallBucket_count[innerRuns]++;
				tempBucket_count++;
			}
			smallBucket_lowerrange = smallBucket_upperrange;
		}
	}
	
	MPI_Alltoall(&smallBuckets, process_count, MPI_INT, &locallyUnsortedBuckets, process_count, MPI_INT, MPI_COMM_WORLD);
	
	int tempcount = 0;	
	int soDeep = 0;
	for(innerRuns = 0; innerRuns < bigBucket_size; innerRuns++)
	{
		for(deepRuns = 0; deepRuns < bigBucket_size && locallyUnsortedBuckets[process_rank][innerRuns][deepRuns] != -1; deepRuns++)
		{
			tempcount = deepRuns;
			for(soDeep = deepRuns + 1; locallyUnsortedBuckets[soDeep] != -1 ; soDeep++)
			{
				if(locallyUnsortedBuckets[process_rank][innerRuns][soDeep] < locallyUnsortedBuckets[process_rank][innerRuns][tempcount])
					tempcount = soDeep;
			}
		}
	}
	
	soDeep = 0;
	tempBucket_count = 0;
	for(innerRuns = 0; innerRuns <  bigBucket_size; innerRuns++)
	{
		for(deepRuns = 0; deepRuns < bigBucket_size && locallySortedBuckets[deepRuns] != -1; deepRuns++)
		{
			sortedSmallBuckets[process_rank][tempBucket_count] = locallyUnsortedBuckets[process_rank][innerRuns][deepRuns];
			tempBucket_count++;
		}
	}
	
	tempcount = 0;
	for(innerRuns = 0; innerRuns < bigBucket_size; innerRuns++)
	{
		tempcount = innerRuns;
		for(deepRuns = innerRuns + 1; deepRuns < bigBucket_size && locallyUnsortedBuckets[process_rank][deepRuns] != -1; deepRuns++)
		{
			if(sortedSmallBuckets[process_rank][deepRuns] < locallyUnsortedBuckets[process_rank][tempcount])
				tempcount = deepRuns;
		}
	}

	tempBucket_count = 0;
	for(innerRuns = 0; innerRuns <  listSize && sortedSmallBuckets[process_rank][innerRuns] != -1; innerRuns++)
	{
		sortedGrandBucket[tempBucket_count] = sortedSmallBuckets[process_rank][innerRuns];
		tempBucket_count++;
	}
	
	//MPI_Gather(&sortedGrandBucket);
	
	if(process_rank == 0)
	{
		printf("\n");
	}
	
	MPI_Finalize(); // Shut down MPI
	
	return 0;
}
