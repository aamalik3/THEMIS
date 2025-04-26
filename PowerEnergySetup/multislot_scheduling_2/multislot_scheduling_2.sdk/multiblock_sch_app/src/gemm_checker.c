/*
 * gemm_checker.c
 *
 *  Created on: Sep 20, 2022
 *      Author: aamalik3
 */
#include "gemm_checker.h"

void gemm_operation(bool PR, uint8_t pblock,uint8_t messages)
{
	uint32_t	i,j;
    switch (pblock)
        	{
        		default: //case 0
        			{
        				if (PR)
        				{
        					PR_execution("gemm0.bin");
        					xil_printf("\nPR Operation, Performed ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped ");
        			    for (j = 0; j < (messages); j++)
        			    {        			        /* put a test vector in starting nodes */
        			        for (i = 0; i < 8192;i++){
        			        	Xil_Out32 (gemm_m1_0 + i*4,i);
        			        }
//        			        Xil_Out32 (gemm_m1_0 + (i-1)*4,i*2);

        			        /* put a test vector in nodes */
        			        for (i = 0; i < 8192; i++){
        			        	Xil_Out32 (gemm_m2_0 + i*4,i );
        			        }
//        			        Xil_Out32 (gemm_m2_0 + (i-1)*4,0xDEADBEEF);
        			        //xil_printf("Start signal is sent:\n");
        			        Xil_Out32 (gemm_CRTL_0, 0x00000001 );

        			        int cnt =0;
        			        while ( !((Xil_In32 (gemm_CRTL_0)) & 0x2) && cnt< 10000)
        			        	cnt++;

        			        uint32_t tmp;
        			        for (i = 0; i < 8192; i++){
        			        	tmp = Xil_In32 (gemm_product_0+i*4);
//        			        	xil_printf("0x%x\n",tmp);
        			        };
        					xil_printf("\nGEMM0-----Done ");
        					cnt =0;
        				}
        			    i=0;j=0;
        			break;
        			}
        		case 1: //case 1
        			{
        				if (PR)
        				{
        					PR_execution("gemm1.bin");
        					xil_printf("\nPR Operation, Performed ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped ");
        			    for (j = 0; j < (messages); j++)
        			    {
        			        /* put a test vector in starting nodes */
        			        for (i = 0; i < 8192;i++){
        			        	Xil_Out32 (gemm_m1_1 + i*4,i*2);
        			        }
//        			        Xil_Out32 (gemm_m1_1 + (i-1)*4,0xDEADBEEF);

        			        /* put a test vector in nodes */
        			        for (i = 0; i < 8192; i++){
        			        	Xil_Out32 (gemm_m2_1 + i*4, i*4 );
        			        }
//        			        Xil_Out32 (gemm_m2_1 + (i-1)*4,0xDEADBEEF);
        			        //xil_printf("Start signal is sent:\n");
        			        Xil_Out32 (gemm_CRTL_1, 0x00000001 );

        			        int cnt =0;
        			        while ( !((Xil_In32 (gemm_CRTL_1)) & 0x2) && cnt< 10000)
        			        	cnt++;

        			        uint32_t tmp;
        			        for (i = 0; i < 8192; i++){
        			        	tmp = Xil_In32 (gemm_product_1+i*4);
        			        };
        					xil_printf("\nGEMM1-----Done ");
        					cnt =0;
        				}
        			    i=0;j=0;
        			break;
        			}
        	}
}
