/*
 * sha_profiling.c
 *
 *  Created on: Sep 8, 2022
 *      Author: aamalik3
 */


#include "sha_profiling.h"


void sha_operation_profile(workload* app_load)
{
    xil_printf("\n");
	xil_printf("Back in SHA: ");
	uint32_t	i;

    /* put a test vector in starting nodes */
    for (i = 0; i < 16;i++){
    	Xil_Out32 (SHA_Slave_IN,0xDEADBEEF);
    }

    //xil_printf("Start signal is sent:\n");
    Xil_Out32 (SHA_CRTL, 0x00000001 );

    int cnt =0;
    while ( !((Xil_In32 (SHA_RDY)) & 0x2) && cnt< 10000)
    	cnt++;

    uint32_t tmp;
    for (i = 0; i < 8; i++){
    	tmp = Xil_In32 (SHA_Slave_OUT);
    	//xil_printf("0x%x\n",tmp[i]);
    }
    tmp = Xil_In32 (SHA_Slave_OUT+4);

    xil_printf("SHA: ");
    xil_printf("SHA: %u",tmp);


}
