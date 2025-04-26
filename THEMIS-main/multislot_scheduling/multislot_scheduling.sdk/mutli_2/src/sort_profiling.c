/*
 * sort_profiling.c
 *
 *  Created on: Sep 8, 2022
 *      Author: aamalik3
 */

#include "sort_profiling.h"

void sort_operation_profiling()
{
    xil_printf("\n");
	//PR_execution("sort.bin");
	xil_printf("Back in SORT: ");
	uint32_t	i;

    /* put a test vector in starting nodes */
    for (i = 0; i < 2048;i++){
    	Xil_Out32 (SORT_A + i*4,i*0xDEADBEEF);
    }


    //xil_printf("Start signal is sent:\n");
    Xil_Out32 (SORT_CRTL, 0x00000001 );

    int cnt =0;
    while ( !((Xil_In32 (SORT_CRTL)) & 0x2) && cnt< 10000)
    	cnt++;

    uint32_t tmp;
    for (i = 0; i < 2048; i++){
    	tmp = Xil_In32 (SORT_A+i*4);
    	//xil_printf("0x%x\n",tmp[i]);
    }

    xil_printf("SORT: ");
    xil_printf("SORT: %u",tmp);

}
