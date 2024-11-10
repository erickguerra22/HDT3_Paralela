/*
 ============================================================================
 Author        : G. Barlas
 Version       : 1.0
 Modified by   : G. Erick - 21781
 Last modified : November 2024
 License       : Released under the GNU GPL 3.0
 Description   :
 To build use  : nvcc hello2.cu -o hello2 -arch=sm_20
 ============================================================================
 */
#include <stdio.h>
#include <cuda.h>

__global__ void hello ()
{
   int myID = ( blockIdx.z * gridDim.x * gridDim.y  +
                blockIdx.y * gridDim.x +
                blockIdx.x ) * blockDim.x * blockDim.y * blockDim.z +
                threadIdx.z *  blockDim.x * blockDim.y +
                threadIdx.y * blockDim.x +
                threadIdx.x;

//  Simplification of above
  //grid: 3D --- z,y,x: all dims and blockids
  //block: 1D -- x
//  int myID = ( blockIdx.z * gridDim.x * gridDim.y  +
//               blockIdx.y * gridDim.x +
//               blockIdx.x ) * blockDim.x +
//               threadIdx.x;
   
    int maxThread = gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z;
    int maxID = maxThread - 1;

    if (myID == maxID)
    {
        printf ("Erick Guerra - 21781. MAX ID: %i\n", myID);
    }
}

int main ()
{
  dim3 g (10,10,10);
  dim3 b (100,10);
  hello <<< g, b >>> ();
  cudaThreadSynchronize ();
  //cudaDeviceSynchronize();  //use instead, ^ is deprecated
  return 0;
}
