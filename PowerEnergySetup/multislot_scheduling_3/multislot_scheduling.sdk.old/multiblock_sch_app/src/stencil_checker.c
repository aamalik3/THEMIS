/*
 * stencil_checker.c
 *
 *  Created on: Sep 20, 2022
 *      Author: aamalik3
 */

#include "stencil_checker.h"

void stencil_operation (bool PR,uint8_t pblock,uint8_t messages)
{
	uint32_t	i,j;
    switch (pblock)
        	{
        		default: //case 0
        			{
        				if (PR)
        				{
        					PR_execution("stencil0.bin");
        					xil_printf("\nPR Operation, Performed ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped ");
        			    for (j = 0; j < (messages); j++)
        			    {
        			        /* put a test vector */
        			        for (i = 0; i < 9;i++){
        			        	Xil_Out32 (STNCL_filter0 + i*4,i);
        			        }
        			        /* put a test vector*/
        			        for (i = 0; i < 8192;i++){
        			        	Xil_Out32 (STNCL_orig0 + i*4,i);
        			        }

        			        //xil_printf("Start signal is sent:\n");
        			        Xil_Out32 (STNCL_CRTL0, 0x00000001 );
        			        int cnt =0;
        			        while ( !((Xil_In32 (STNCL_CRTL0)) & 0x2) && cnt< 10000)
        			        	cnt++;
        			        uint32_t tmp;
        			        for (i = 0; i < 8192; i++){
        			        	tmp = Xil_In32 (STNCL_sol0+i*4);
//        			        	xil_printf("0x%x\n",tmp);
        			        }
        					xil_printf("\nSTENCIL0-----Done ");
        					cnt =0;
        				}
        			    i=0;j=0;
        			break;
        			}
        		case 1: //case 1
        			{
        				if (PR)
        				{
        					PR_execution("stencil1.bin");
        					xil_printf("\nPR Operation, Performed ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped ");
        			    for (j = 0; j < (messages); j++)
        			    {
        			        /* put a test vector */
        			        for (i = 0; i < 9;i++){
        			        	Xil_Out32 (STNCL_filter1 + i*4,i*0xDEADBEEF);
        			        }
        			        /* put a test vector*/
        			        for (i = 0; i < 8192;i++){
        			        	Xil_Out32 (STNCL_orig1 + i*4,i*0xDEADBEEF);
        			        }

        			        //xil_printf("Start signal is sent:\n");
        			        Xil_Out32 (STNCL_CRTL1, 0x00000001 );
        			        int cnt =0;
        			        while ( !((Xil_In32 (STNCL_CRTL1)) & 0x2) && cnt< 10000)
        			        	cnt++;
        			        uint32_t tmp;
        			        for (i = 0; i < 8192; i++){
        			        	tmp = Xil_In32 (STNCL_sol1+i*4);
        			        }
        					xil_printf("\nSTENCIL1-----Done ");
        					cnt =0;
        				}
        			    i=0;j=0;
        			break;
        			}
//        		case 2: //case 2
//        			{
//        				if (PR)
//        				{
//        					PR_execution("stencil2.bin");
//        					xil_printf("\nPR Operation, Performed ");
//        				}
//        				else
//    					xil_printf("\nPR Operation, Skipped ");
//        			    for (j = 0; j < (messages); j++)
//        			    {
//        			        /* put a test vector */
//        			        for (i = 0; i < 9;i++){
//        			        	Xil_Out32 (STNCL_filter2 + i*4,i*0xDEADBEEF);
//        			        }
//        			        /* put a test vector*/
//        			        for (i = 0; i < 8192;i++){
//        			        	Xil_Out32 (STNCL_orig2 + i*4,i*0xDEADBEEF);
//        			        }
//
//        			        //xil_printf("Start signal is sent:\n");
//        			        Xil_Out32 (STNCL_CRTL2, 0x00000001 );
//        			        int cnt =0;
//        			        while ( !((Xil_In32 (STNCL_CRTL2)) & 0x2) && cnt< 10000)
//        			        	cnt++;
//        			        uint32_t tmp;
//        			        for (i = 0; i < 8192; i++){
//        			        	tmp = Xil_In32 (STNCL_sol2+i*4);
//        			        }
//        					xil_printf("\nSTENCIL2-----Done ");
//        					cnt =0;
//        				}
//        			    i=0;j=0;
//        			break;
//        			}
        	}
}
