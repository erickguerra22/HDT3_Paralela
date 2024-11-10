/*
 ============================================================================
 Author        : G. Barlas
 Version       : 1.0
 Modified by   : G. Erick - 21781
 Last modified : November 2024
 License       : Released under the GNU GPL 3.0
 Description   :
 To build use  : nvcc hello.cu -o hello -arch=sm_20
 ============================================================================
 */
#include <stdio.h>
#include <cuda.h>

__global__ void hello()
{
   printf("Bloque: %d | Hilo: %d. Erick Guerra - 21781\n", blockIdx.x, threadIdx.x);
}

int main()
{
  hello<<<1,2048>>>();
  cudaThreadSynchronize(); //deprecated
  return 0;
}
