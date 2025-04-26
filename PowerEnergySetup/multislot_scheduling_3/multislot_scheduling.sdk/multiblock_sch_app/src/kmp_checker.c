/*
 * kmp_checker.c
 *
 *  Created on: Sep 20, 2022
 *      Author: aamalik3
 */
#include "kmp_checker.h"

void kmp_operation(bool PR,uint8_t pblock,uint8_t messages)
{
	uint32_t	i,j;

    switch (pblock)
        	{
        		default: //case 0
        			{
        				if (PR)
        				{
        					PR_execution("kmp0.bin");
        					xil_printf("\nPR Operation, Performed ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped ");
        			    for (j = 0; j < (messages); j++)
        			    {
        			    /* put a test vector in starting nodes */
        			    for (i = 0; i < 1;i++){
        			    	Xil_Out32 (KMP_pattern0 + i*4,0);
        			    }
        			    /* put a test vector in nodes */
        			    for (i = 0; i < 4; i++){
        			    	Xil_Out32 (KMP_Next0 + i*4, 0);
        			    }
        			    /* put a test vector in nodes */
        			    for (i = 0; i < 8102; i++){
        			    	Xil_Out32 (KMP_input_r0 + i*4, 0 );
        			    }
        			    //xil_printf("Start signal is sent:\n");
        			    Xil_Out32 (KMP_CRTL0, 0x00000001 );

        			    int cnt =0;
        			    while ( !((Xil_In32 (KMP_CRTL0)) & 0x2) && cnt< 10000)
        			    	cnt++;
        			    uint32_t tmp;
        			    for (i = 0; i < 1; i++){
        			    	tmp = Xil_In32 (KMP_matches0+i*4);
//        			    	xil_printf("\n0x%x\n",tmp);
        			    }
        			    for (i = 0; i < 1; i++){
        			    	tmp = Xil_In32 (KMP_CTRL_match0+i*4);
//        			    	xil_printf("0x%x\n",tmp);
        			    }
        			    	xil_printf("\nKMP0-----Done ");
        			    }
        			    i=0;j=0;
        			break;
        			}
        		case 1: //case 1
					{
						if (PR)
						{
							PR_execution("kmp1.bin");
							xil_printf("\nPR Operation, Performed ");
						}
						else
						xil_printf("\nPR Operation, Skipped ");
						for (j = 0; j < (messages); j++)
						{
						/* put a test vector in starting nodes */
						for (i = 0; i < 1;i++){
							Xil_Out32 (KMP_pattern1 + i*4,0xDEADBEEF);
						}
						/* put a test vector in nodes */
						for (i = 0; i < 4; i++){
							Xil_Out32 (KMP_Next1 + i*4, 0xDEADBEEF );
						}
						/* put a test vector in nodes */
						for (i = 0; i < 1012; i++){
							Xil_Out32 (KMP_input_r1 + i*4, 0xDEADBEEF );
						}
						//xil_printf("Start signal is sent:\n");
						Xil_Out32 (KMP_CRTL1, 0x00000001 );

						int cnt =0;
						while ( !((Xil_In32 (KMP_CRTL1)) & 0x2) && cnt< 10000)
							cnt++;
						uint32_t tmp;
						for (i = 0; i < 1; i++){
							tmp = Xil_In32 (KMP_matches1+i*4);
							//xil_printf("0x%x\n",tmp[i]);
						}
						for (i = 0; i < 1; i++){
							tmp = Xil_In32 (KMP_CTRL_match1+i*4);
							//xil_printf("0x%x\n",tmp[i]);
						}
							xil_printf("\nKMP1-----Done ");
						}
						i=0;j=0;
					break;
					}
        		case 2: //case 0
					{
						if (PR)
						{
							PR_execution("kmp2.bin");
							xil_printf("\nPR Operation, Performed ");
						}
						else
						xil_printf("\nPR Operation, Skipped ");
						for (j = 0; j < (messages); j++)
						{
						/* put a test vector in starting nodes */
						for (i = 0; i < 1;i++){
							Xil_Out32 (KMP_pattern2 + i*4,0xDEADBEEF);
						}
						/* put a test vector in nodes */
						for (i = 0; i < 4; i++){
							Xil_Out32 (KMP_Next2 + i*4, 0xDEADBEEF );
						}
						/* put a test vector in nodes */
						for (i = 0; i < 1012; i++){
							Xil_Out32 (KMP_input_r2 + i*4, 0xDEADBEEF );
						}
						//xil_printf("Start signal is sent:\n");
						Xil_Out32 (KMP_CRTL2, 0x00000001 );

						int cnt =0;
						while ( !((Xil_In32 (KMP_CRTL2)) & 0x2) && cnt< 10000)
							cnt++;
						uint32_t tmp;
						for (i = 0; i < 1; i++){
							tmp = Xil_In32 (KMP_matches2+i*4);
							//xil_printf("0x%x\n",tmp[i]);
						}
						for (i = 0; i < 1; i++){
							tmp = Xil_In32 (KMP_CTRL_match2+i*4);
							//xil_printf("0x%x\n",tmp[i]);
						}
							xil_printf("\nKMP2-----Done ");
						}
						i=0;j=0;
					break;
					}
        	}
}
