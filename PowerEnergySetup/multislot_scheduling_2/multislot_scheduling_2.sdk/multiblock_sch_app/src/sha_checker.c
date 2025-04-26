/*
 * sha_checker.c
 *
 *  Created on: Sep 20, 2022
 *      Author: aamalik3
 */

#include "sha_checker.h"
void sha_operation (bool PR,uint8_t pblock,uint8_t messages)
{
	uint32_t	i,j;


    switch (pblock)
        	{
        		default: //case 0
        			{
        				if (PR)
        				{
        					PR_execution("sha0.bin");
        					xil_printf("\nPR Operation, Performed ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped ");
        			    for (j = 0; j < (messages); j++)
        			    {
								/* put a test vector in starting nodes */
								for (i = 0; i < 15;i++){
									Xil_Out32 (SHA_Slave_IN0+i*4,0x0);
								}
								Xil_Out32 (SHA_Slave_IN0+16*4,0x1);

								//xil_printf("Start signal is sent:\n");
								Xil_Out32 (SHA_RDY0, 0x00000005);
//								Xil_Out32 (SHA_RDY0, 0x00000004);
								int cnt =0;
								while ( !((Xil_In32 (SHA_RDY0)) & 0x2) && cnt< 100000)
									cnt++;
								uint32_t tmp;
								for (i = 0; i < 8; i++){
									tmp = Xil_In32 (SHA_Slave_OUT0+i*4);
//									xil_printf("0x%x\n",tmp);
								}

        					xil_printf("\nSHA0-----Done ");
        					cnt =0;
        				}
        			    i=0;j=0;
        			break;
        			}
        		case 1: //case 0
        			{
        				if (PR)
        				{
        					PR_execution("sha1.bin");
        					xil_printf("\nPR Operation, Performed ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped ");
        			    for (j = 0; j < (messages); j++)
        			    {
								/* put a test vector in starting nodes */
								for (i = 0; i < 16;i++){
									Xil_Out32 (SHA_Slave_IN1,0xDEADBEEF);
								}

								//xil_printf("Start signal is sent:\n");
								Xil_Out32 (SHA_CRTL1, 0x00000001 );
								int cnt =0;
								while ( !((Xil_In32 (SHA_RDY1)) & 0x2) && cnt< 10000)
									cnt++;
								uint32_t tmp;
								for (i = 0; i < 8; i++){
									tmp = Xil_In32 (SHA_Slave_OUT1);
								}
								tmp = Xil_In32 (SHA_Slave_OUT1+4);
        					xil_printf("\nSHA1-----Done ");
        					cnt =0;
        				}
        			    i=0;j=0;
        			break;
        			}
        		case 2: //case 0
        			{
        				if (PR)
        				{
        					PR_execution("sha2.bin");
        					xil_printf("\nPR Operation, Performed ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped ");
        			    for (j = 0; j < (messages); j++)
        			    {
								/* put a test vector in starting nodes */
								for (i = 0; i < 16;i++){
									Xil_Out32 (SHA_Slave_IN2,0xDEADBEEF);
								}

								//xil_printf("Start signal is sent:\n");
								Xil_Out32 (SHA_CRTL2, 0x00000001 );
								int cnt =0;
								while ( !((Xil_In32 (SHA_RDY2)) & 0x2) && cnt< 10000)
									cnt++;
								uint32_t tmp;
								for (i = 0; i < 8; i++){
									tmp = Xil_In32 (SHA_Slave_OUT2);
								}
								tmp = Xil_In32 (SHA_Slave_OUT2+4);
        					xil_printf("\nSHA2-----Done ");
        					cnt =0;
        				}
        			    i=0;j=0;
        			break;
        			}
        	}
}
