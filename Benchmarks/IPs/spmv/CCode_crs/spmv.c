/*
Based on algorithm described here:
http://www.cs.berkeley.edu/~mhoemmen/matrix-seminar/slides/UCB_sparse_tutorial_1.pdf
*/

#include "spmv.h"

void spmv(TYPE val[NNZ], int32_t cols[NNZ], int32_t rowDelimiters[N+1], TYPE vec[N], TYPE out[N]){

#pragma HLS INTERFACE s_axilite port=val bundle=BUS_A
#pragma HLS INTERFACE s_axilite port=cols bundle=BUS_A
#pragma HLS INTERFACE s_axilite port=rowDelimiters bundle=BUS_A
#pragma HLS INTERFACE s_axilite port=vec bundle=BUS_A
#pragma HLS INTERFACE s_axilite port=out bundle=BUS_A
#pragma HLS INTERFACE s_axilite port=return bundle=BUS_A


    int i, j;
    TYPE sum, Si;

    spmv_1 : for(i = 0; i < N; i++){
        sum = 0; Si = 0;
        int tmp_begin = rowDelimiters[i];
        int tmp_end = rowDelimiters[i+1];
        spmv_2 : for (j = tmp_begin; j < tmp_end; j++){
            Si = val[j] * vec[cols[j]];
            sum = sum + Si;
        }
        out[i] = sum;
    }
}


