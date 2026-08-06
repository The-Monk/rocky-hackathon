#define FMT_Q4
#include "quant_common.h"
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <vector>
// Compare golden vs agent, and report error against the MAGNITUDE of each row.
// If the worst relative errors sit on near-zero rows, the metric is inflating a
// rounding difference, not exposing a wrong kernel.
#include "agent_kernel_Q4_ACCEPTED.cuh"
static std::vector<char> slurp(const char*p,size_t n){FILE*f=fopen(p,"rb");std::vector<char>v(n);
  if(!f||fread(v.data(),1,n,f)!=n){fprintf(stderr,"bad %s\n",p);exit(2);}fclose(f);return v;}
int main(){
    const int N=2048,Kb=32;
    auto hW=slurp("golden_Q4_0_w.bin",(size_t)N*Kb*sizeof(block_lowbit));
    auto hA=slurp("golden_Q4_0_a.bin",(size_t)Kb*QK_LOWBIT*4);
    auto hG=slurp("golden_Q4_0_o.bin",(size_t)N*4);
    const float* g=(const float*)hG.data();
    block_lowbit* dW; float *dA,*dO;
    hipMalloc(&dW,hW.size());hipMalloc(&dA,hA.size());hipMalloc(&dO,(size_t)N*4);
    hipMemcpy(dW,hW.data(),hW.size(),hipMemcpyHostToDevice);
    hipMemcpy(dA,hA.data(),hA.size(),hipMemcpyHostToDevice);
    agent_kernel<<<N,64,64*sizeof(float)>>>(dW,dA,dO,(int64_t)Kb);
    hipDeviceSynchronize();
    std::vector<float> got(N);hipMemcpy(got.data(),dO,(size_t)N*4,hipMemcpyDeviceToHost);
    double worst_rel=0,worst_abs=0,at_mag=0; int idx=-1;
    double sum_abs=0, mean_mag=0;
    for(int i=0;i<N;++i){
        double d=fabs((double)got[i]-g[i]), s=fabs((double)g[i]);
        sum_abs+=d; mean_mag+=s;
        double rel = s>1e-6? d/s : d;
        if(rel>worst_rel){worst_rel=rel;worst_abs=d;at_mag=s;idx=i;}
    }
    printf("worst RELATIVE err = %.3e  at row %d\n", worst_rel, idx);
    printf("  that row: |golden| = %.6f   absolute diff = %.3e\n", at_mag, worst_abs);
    printf("  mean |golden| across rows = %.6f\n", mean_mag/N);
    printf("  mean absolute diff        = %.3e\n", sum_abs/N);
    printf("\nInterpretation: if |golden| at the worst row is far below the mean,\n"
           "the relative metric is dividing by a near-zero and inflating a rounding\n"
           "difference rather than exposing a decode error.\n");
    return 0;
}
