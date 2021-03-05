#include "stencil.cuh"

__global__ void stencil_kernel(const float *image, const float *mask, float *output, unsigned int n, unsigned int R) {
    const unsigned int tid = threadIdx.x;
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;

    extern __shared__ float shmem[];
    float *s_mask = shmem;
    float *s_image = shmem + 2 * R + 1;
    float *s_output = shmem + 2 * R + 1 + (blockDim.x + 2 * R);
    // Needs (2 * R + 1 + blockDim.x + 2 * R + blockDim.x) * sizeof(float) shared memory

    // NOTE: assumes blockDim.x >= 2R+1
    if (tid < 2 * R + 1) {
        s_mask[tid] = mask[tid];
    }
    
    // Section of image and padding
    if (index < n) {
        s_image[tid + R] = image[index];
        s_output[tid] = 0.f;
    }
    if (tid < R) {
        const unsigned int block_start = blockIdx.x * blockDim.x;
        if (block_start >= R - tid) {
            s_image[tid] = image[block_start - R + tid];
        } else {
            s_image[tid] = 1.f;
        }
    
        const unsigned int next_block = (blockIdx.x + 1) * blockDim.x;
        if (next_block + tid < n) {
            s_image[R + blockDim.x + tid] = image[next_block + tid];
        } else {
            s_image[R + blockDim.x + tid] = 1.f;
        }
    }

    __syncthreads();
    
    float res = 0.0;
    for (unsigned int j = 0; j <= 2 * R; j++) {
        res += s_mask[j] * s_image[tid + j];
    }

    s_output[tid] = res;
    output[index] = s_output[tid];
}

__host__ void stencil(const float *image, const float *mask, float *output, unsigned int n, unsigned int R, unsigned int threads_per_block) {
    unsigned int shmem = (2 * R + 1 + threads_per_block + 2 * R + threads_per_block) * sizeof(float);
    stencil_kernel<<<(n + threads_per_block - 1) / threads_per_block, threads_per_block, shmem>>>(image, mask, output, n, R);
    cudaDeviceSynchronize();
}
