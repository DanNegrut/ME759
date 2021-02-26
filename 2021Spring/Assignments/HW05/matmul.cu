// Author: Nic Olsen

#include <cuda.h>
#include <iostream>

#include "matmul.cuh"
#include "matmul_kernel.cuh"

// NOTE that each test function below calls the template matmul_kernel<TYPE>;
// The template function must meet the following requirements.
//  - Computes the matrix product C = AB using the tiled method from Lecture 11
//  - A, B, and C are row-major representations of nxn matrices in managed memory
//  - n need not be a multiple of blockDim.x
//  - Expects 2D configuration as in the slides
//  - Uses only dynamically allocated shared memory
// Function Prototype:
// __global__ void matmul_kernel(const TYPE* A, const TYPE* B, TYPE* C, unsigned int n)

__host__ void matmul_1(const int* A, const int* B, int* C, unsigned int n, unsigned int block_dim) {
    unsigned int grid_dim = (n + block_dim - 1) / block_dim;
    matmul_kernel<int><<<dim3(grid_dim, grid_dim), dim3(block_dim, block_dim), 2 * block_dim * block_dim * sizeof(int)>>>(
        A, B, C, n);

    cudaDeviceSynchronize();
}


__host__ void matmul_2(const float* A, const float* B, float* C, unsigned int n, unsigned int block_dim) {
    unsigned int grid_dim = (n + block_dim - 1) / block_dim;
    matmul_kernel<float><<<dim3(grid_dim, grid_dim), dim3(block_dim, block_dim), 2 * block_dim * block_dim * sizeof(float)>>>(
        A, B, C, n);

    cudaDeviceSynchronize();
}


__host__ void matmul_3(const double* A, const double* B, double* C, unsigned int n, unsigned int block_dim) {
    unsigned int grid_dim = (n + block_dim - 1) / block_dim;
    matmul_kernel<double><<<dim3(grid_dim, grid_dim), dim3(block_dim, block_dim), 2 * block_dim * block_dim * sizeof(double)>>>(
        A, B, C, n);

    cudaDeviceSynchronize();
}