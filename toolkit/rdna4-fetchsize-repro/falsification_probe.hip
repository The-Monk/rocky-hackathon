// Falsification test for "RDNA4 EA read requests are a fixed 256 B".
// Sparse gather: one 4-byte element per 256 B stride, so a fixed-256B-request
// machine reads 256 B per useful 4 B. If GL2C_EA_RDREQ_sum still reports
// bytes_touched/256, the constant is pattern-independent. If it reports
// ~one request per element, the "fixed 256 B" reading was a coalescing artifact.
#include <hip/hip_runtime.h>
#include <cstdio>
__global__ void gather(const int* __restrict__ src, int* __restrict__ sink, size_t n, size_t stride_elems) {
    size_t i = blockIdx.x * (size_t)blockDim.x + threadIdx.x;
    int acc = 0;
    for (; i < n; i += (size_t)gridDim.x * blockDim.x) acc += src[i * stride_elems];
    if (acc == 0x7fffffff) sink[0] = acc;
}
int main(int argc, char** argv) {
    const size_t STRIDE_B = 128;    // SMALLER than a putative 256B request -- now size is discriminable
    const size_t STRIDE_E = STRIDE_B / sizeof(int);
    const size_t N        = 1u << 20;             // 1,048,576 elements touched
    const size_t SPAN_B   = N * STRIDE_B;         // 256 MiB spanned
    int *d=nullptr,*sink=nullptr;
    if (hipMalloc(&d, SPAN_B) != hipSuccess) { printf("alloc failed\n"); return 1; }
    hipMalloc(&sink, 4); hipMemset(d, 1, SPAN_B);
    gather<<<2048,256>>>(d, sink, N, STRIDE_E);
    hipDeviceSynchronize();
    printf("touched %zu elements (%zu B useful) across %.0f MiB span\n",
           N, N*sizeof(int), SPAN_B/1048576.0);
    printf("  H1 one-request-per-element : %zu\n", N);
    printf("  H2 bytes-touched/256       : %zu  (4x H1)\n", SPAN_B/256);
    hipFree(d); hipFree(sink); return 0;
}
