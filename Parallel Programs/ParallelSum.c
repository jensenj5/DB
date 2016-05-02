#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

// A function to add numbers together to get a partial sum
int add(int process_rank, int numberOfElements, int* data, int process_count)
{
	int runs = 0;
	int sum = 0;
	int low = process_rank * (numberOfElements / process_count);
	int high = low + (numberOfElements / process_count);
	
	for(runs = low; runs < high; runs++)
		sum += data[runs];
	
	return sum;
}

int main(int argc, char* argv[])
{
	int runs = 0; // A loop counter
	int total = 0; // Holds the total from partial sums
	int result = 0; // Result from local add function call
	int* partial_sums; // Array to hold the partial sums for all processes
	int* data; // Array to hold data initially generated numbers
	int process_rank;
	int process_count;
	int numberOfElements = 48;

	data = malloc(sizeof(int) * numberOfElements);
	
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &process_count);
	MPI_Comm_rank(MPI_COMM_WORLD, &process_rank);
	
	if (process_rank == 0) {
		for (runs = 0; runs < numberOfElements; runs++)
			data[runs] = 1;
	}
	
	MPI_Bcast(data, numberOfElements, MPI_INT, 0, MPI_COMM_WORLD);
	result = add(process_rank, numberOfElements, data, process_count);
	
	if (process_rank == 0)
	{
		partial_sums = malloc(sizeof(int) * process_count);
		partial_sums[0] = result;
	}
	else
	{
		MPI_Send(&result, 1, MPI_INT, 0, 1, MPI_COMM_WORLD );
	}
	
	if (process_rank == 0)
	{
		printf("\nReceived %d from process %d.", partial_sums[process_rank], process_rank);
		
		for (runs = 0; runs < process_count - 1; runs++)
		{
			MPI_Recv(&partial_sums[runs + 1], 1, MPI_INT, runs + 1, 1, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
			printf("\nReceived %d from process %d.", partial_sums[runs + 1], runs + 1);
		}
		
		for (runs = 0; runs < process_count; runs++)
			total += partial_sums[runs];
			
		printf("\nThe total is %d.\n\n", total);
	}
	
	free(data);
	free(partial_sums);
	MPI_Finalize();
	return 0;
}
