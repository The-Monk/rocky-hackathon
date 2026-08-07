// fetch_size_repro.hip -- minimal reproducer: FETCH_SIZE reads 0 on gfx1201.
//
// Streams a known number of bytes from device memory, so the expected DRAM read
// traffic is exact and independent of the profiler.
//
//   hipcc --offload-arch=gfx1201 -O3 fetch_size_repro.hip -o fetch_size_repro
//   sudo amd-smi set --gpu 0 --perf-level STABLE_STD      # documented requirement
//   rocprofv3 --pmc FETCH_SIZE GL2C_EA_RDREQ_sum GL2C_EA_RDREQ_32B_sum \
//             GL2C_EA_RDREQ_64B_sum GRBM_COUNT \
//             --output-format csv -d out -- ./fetch_size_repro
//
// Expected: FETCH_SIZE ~= 256 MiB per launch.
// Actual on gfx1201: FETCH_SIZE = 0, and every GL2C_EA_RDREQ_<size>B_sum = 0,
// while GL2C_EA_RDREQ_sum and GRBM_COUNT report plausible non-zero values in the
// SAME run -- so profiling is demonstrably active.

#include <hip/hip_runtime.h>
#include <cstdio>

__global__ void stream_read(const float4* __restrict__ src, float* __restrict__ sink, size_t n4) {
    size_t i = blockIdx.x * (size_t)blockDim.x + threadIdx.x;
    float acc = 0.0f;
    for (; i < n4; i += (size_t)gridDim.x * blockDim.x) {
        float4 v = src[i];                       // 16 B per thread per step
        acc += v.x + v.y + v.z + v.w;
    }
    if (acc == 1.2345e-31f) sink[0] = acc;       // never true; defeats DCE
}

int main() {
    const size_t BYTES = 256ull << 20;           // 256 MiB, well past any cache
    const size_t n4    = BYTES / sizeof(float4);
    float4* d = nullptr; float* sink = nullptr;
    if (hipMalloc(&d, BYTES) != hipSuccess) { printf("alloc failed\n"); return 1; }
    hipMalloc(&sink, sizeof(float));
    hipMemset(d, 1, BYTES);

    stream_read<<<2048, 256>>>(d, sink, n4);     // one launch, one known read
    hipDeviceSynchronize();

    printf("streamed %.1f MiB from device memory in 1 launch\n", BYTES / 1048576.0);
    printf("FETCH_SIZE should report ~%.0f KB\n", BYTES / 1024.0);
    hipFree(d); hipFree(sink);
    return 0;
}
