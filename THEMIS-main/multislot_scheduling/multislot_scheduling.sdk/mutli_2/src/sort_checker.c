/*
 * sort_checker.c
 *
 *  Created on: Sep 20, 2022
 *      Author: aamalik3
 */

#include "sort_checker.h"

void sort_operation(bool PR,uint8_t pblock,uint8_t messages)
{
    xil_printf("\n");
	uint32_t	i;

    switch (pblock)
        	{
        		default: //case 0,
        			{
        				if (PR)
        				{
        					PR_execution("sort0.bin");
        					xil_printf("\nPR Operation, Performed\n ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped\n ");
        			    for (int j = 0; j < (messages); j++)
        			    {
        			        /* put a test vector in starting nodes */
        			        for (i = 0; i < 2048;i++){
        			        	Xil_Out32 (SORT_A0 + i*4,2048-i);
        			        }


        			        //xil_printf("Start signal is sent:\n");
        			        Xil_Out32 (SORT_CRTL0, 0x00000001 );

        			        int cnt =0;
        			        while ( !((Xil_In32 (SORT_CRTL0)) & 0x2) && cnt< 10000)
        			        	cnt++;
        			        uint32_t tmp;
        			        for (i = 0; i < 2048; i++){
        			        	tmp = Xil_In32 (SORT_A0+i*4);
//        			        	xil_printf("0x%x\n",tmp);
        			        }
        					cnt =0;
        					xil_printf("\nSORT0-----Done ");
        				}
        			    i=0;

        			break;
        			}
        		case 1: //case 1,
        			{
        				if (PR)
        				{
        					PR_execution("sort1.bin");
        					xil_printf("\nPR Operation, Performed\n ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped\n ");
        			    for (int j = 0; j < (messages); j++)
        			    {
        			        /* put a test vector in starting nodes */
        			        for (i = 0; i < 2048;i++){
        			        	Xil_Out32 (SORT_A1 + i*4,4096-i);
        			        }


        			        //xil_printf("Start signal is sent:\n");
        			        Xil_Out32 (SORT_CRTL1, 0x00000001 );

        			        int cnt =0;
        			        while ( !((Xil_In32 (SORT_CRTL1)) & 0x2) && cnt< 10000)
        			        	cnt++;
        			        uint32_t tmp;
        			        for (i = 0; i < 2048; i++){
        			        	tmp = Xil_In32 (SORT_A1+i*4);
        			        	//xil_printf("0x%x\n",tmp);
        			        }
        					cnt =0;
        					   xil_printf("\nSORT1-----Done ");
        				}
        			    i=0;

        			break;
        			}
        		case 2: //case 2,
        			{
        				if (PR)
        				{
        					PR_execution("sort2.bin");
        					xil_printf("\nPR Operation, Performed\n ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped\n ");
        			    for (int j = 0; j < (messages); j++)
        			    {
        			        /* put a test vector in starting nodes */
        			        for (i = 0; i < 2048;i++){
        			        	Xil_Out32 (SORT_A2 + i*4,8192-i);
        			        }


        			        //xil_printf("Start signal is sent:\n");
        			        Xil_Out32 (SORT_CRTL2, 0x00000001 );

        			        int cnt =0;
        			        while ( !((Xil_In32 (SORT_CRTL2)) & 0x2) && cnt< 10000)
        			        	cnt++;
        			        uint32_t tmp;
        			        for (i = 0; i < 2048; i++){
        			        	tmp = Xil_In32 (SORT_A2+i*4);
        			        	//xil_printf("0x%x\n",tmp);
        			        }
        					cnt =0;
        					 xil_printf("\nSORT2-----Done ");
        				}
        			    i=0;

        			break;
        			}
        	}
}
