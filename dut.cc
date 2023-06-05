#include "dut.h"
using namespace std;

// The thread function for the design
void dut::thread1()
{
	// Reset the interfaces
	// Also initialize any variables that are part of the module class here
	{
		HLS_DEFINE_PROTOCOL("reset");
		din.reset();
		dout.reset();
		wait();
	}

while_1:
	while (true)
	{
		input_t in_val[arraySize][arraySize];
		output_t out_val[arraySize][arraySize];

	GETVALUE_loop:
		for (unsigned int v = 0; v < arraySize; v++)
		{
			for (unsigned int u = 0; u < arraySize; u++)
			{
				in_val[v][u] = din.get(); // get the next value
				cout << in_val[v][u] << endl;
				wait();
			}
		}
	SHORTEST_loop:
		for (unsigned int k = 0; k < arraySize; k++)
		{
			// Pick all vertices as source one by one
			for (unsigned int i = 0; i < arraySize; i++)
			{
				// Pick all vertices as destination for the
				// above picked source
				for (unsigned int j = 0; j < arraySize; j++)
				{
					if ((in_val[i][j] > (in_val[i][k] + in_val[k][j])) && (in_val[i][k] != 99 && in_val[k][j] != 99))
					{
						in_val[i][j] = in_val[i][k] + in_val[k][j];
						wait();
					}
				}
			}
		}
	OUTPUT_loop:
		for (unsigned int m = 0; m < arraySize; m++)
		{

			for (unsigned int n = 0; n < arraySize; n++)
			{
				dout.put(in_val[m][n]); // output the result
				wait();
			}
		}
	}
}
