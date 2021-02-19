// Author: Nic Olsen

#ifndef MATMUL_CUH
#define MATMUL_CUH

// Computes the matrix product of A and B, storing the result in C.
// Each thread should compute _one_ element of output.
// Does not use shared memory.
//
// A, B, and C are row major representations of nxn matrices.
//
// Assumptions:
// - 1D kernel configuration
__global__ void matmul_kernel(const float* A, const float* B, float* C, size_t n);

// Makes one call to matmul_kernel with threads_per_block threads per block.
// The kernel call should be followed by a call to cudaDeviceSynchronize for timing purposes.
void matmul(const float* A, const float* B, float* C, size_t n, unsigned int threads_per_block);

#endif
