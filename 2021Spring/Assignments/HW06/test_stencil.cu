#include <cuda.h>
#include <iostream>
#include "stencil.cuh"

int main(int argc, char* argv[]) {
    unsigned int n = std::strtoul(argv[1], nullptr, 10);
    unsigned int R = std::atoi(argv[2]);
    unsigned int threads_per_block = std::atoi(argv[3]);

    std::cout << n << std::endl;

    float* h_image = new float[n];
    float* h_output = new float[n];
    float* h_mask = new float[2 * R + 1];

    float* image;
    cudaMalloc(&image, n * sizeof(float));
    for (unsigned int i = 0; i < n; i++) {
        h_image[i] = 1.f;
    }
    cudaMemcpy(image, h_image, n * sizeof(float), cudaMemcpyHostToDevice);

    float* mask;
    cudaMalloc(&mask, (2 * R + 1) * sizeof(float));
    for (unsigned int i = 0; i < 2 * R + 1; i++) {
        h_mask[i] = 1.f;
    }
    cudaMemcpy(mask, h_mask, (2 * R + 1) * sizeof(float), cudaMemcpyHostToDevice);

    float* output;
    cudaMalloc(&output, n * sizeof(float));

    stencil(image, mask, output, n, R, threads_per_block);

    cudaMemcpy(h_output, output, n * sizeof(float), cudaMemcpyDeviceToHost);
    std::cout << h_output[0] << " " << h_output[n/2] << " " << h_output[n - 1] << std::endl;

    cudaFree(image);
    cudaFree(mask);
    cudaFree(output);

    delete[] h_image;
    delete[] h_output;
    delete[] h_mask;

    return 0;
}
