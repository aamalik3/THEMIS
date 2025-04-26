#include "spmv_checking.h"

void spmv_operation		(bool PR,uint8_t pblock,uint8_t messages)
{
	uint32_t	i,j;
    switch (pblock)
        	{
        		default: //case 0
        			{
        				if (PR)
        				{
        					PR_execution("spmv0.bin");
        					xil_printf("\nPR Operation, Performed ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped ");
        			    for (j = 0; j < (messages); j++)
        			    {
        			        /* put a test vector */
        			        for (i = 0; i < 495;i++){
        			        	Xil_Out32 (SPMV_rowDelimiters0 + i*4,i*0xDEADBEEF);
        			        }
        			        /* put a test vector*/
        			        for (i = 0; i < 988;i++){
        			        	Xil_Out32 (SPMV_vec0 + i*4,i*0xDEADBEEF);
        			        }

        			        /* put a test vector*/
        			        for (i = 0; i < 1666;i++){
        			        	Xil_Out32 (SPMV_cols0 + i*4,i*0xDEADBEEF);
        			        }

        			        /* put a test vector*/
        			        for (i = 0; i < 3332;i++){
        			        	Xil_Out32 (SPMV_val_r0 + i*4,i*0xDEADBEEF);
        			        }
        			        //xil_printf("Start signal is sent:\n");
        			        Xil_Out32 (SPMV_CRTL0, 0x00000001 );
        			        int cnt =0;
        			        while ( !((Xil_In32 (SPMV_CRTL0)) & 0x2) && cnt< 10000)
        			        	cnt++;
        			        uint32_t tmp;
        			        for (i = 0; i < 988; i++){
        			        	tmp = Xil_In32 (SPMV_out_r0+i*4);
        			        }
        					xil_printf("\nSPMV0-----Done ");
        					cnt =0;
        				}
        			    i=0;j=0;
        			break;
        			}
        		case 1: //case 1
        			{
        				if (PR)
        				{
        					PR_execution("spmv1.bin");
        					xil_printf("\nPR Operation, Performed ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped ");
        			    for (j = 0; j < (messages); j++)
        			    {
        			        /* put a test vector */
        			        for (i = 0; i < 495;i++){
        			        	Xil_Out32 (SPMV_rowDelimiters1 + i*4,i*0xDEADBEEF);
        			        }
        			        /* put a test vector*/
        			        for (i = 0; i < 988;i++){
        			        	Xil_Out32 (SPMV_vec1 + i*4,i*0xDEADBEEF);
        			        }

        			        /* put a test vector*/
        			        for (i = 0; i < 1666;i++){
        			        	Xil_Out32 (SPMV_cols1 + i*4,i*0xDEADBEEF);
        			        }

        			        /* put a test vector*/
        			        for (i = 0; i < 3332;i++){
        			        	Xil_Out32 (SPMV_val_r1 + i*4,i*0xDEADBEEF);
        			        }
        			        //xil_printf("Start signal is sent:\n");
        			        Xil_Out32 (SPMV_CRTL1, 0x00000001 );
        			        int cnt =0;
        			        while ( !((Xil_In32 (SPMV_CRTL1)) & 0x2) && cnt< 10000)
        			        	cnt++;
        			        uint32_t tmp;
        			        for (i = 0; i < 988; i++){
        			        	tmp = Xil_In32 (SPMV_out_r1+i*4);
        			        }
        					xil_printf("\nSPMV1-----Done ");
        					cnt =0;
        				}
        			    i=0;j=0;
        			break;
        			}
        		case 2: //case 2
        			{
        				if (PR)
        				{
        					PR_execution("spmv2.bin");
        					xil_printf("\nPR Operation, Performed ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped ");
        			    for (j = 0; j < (messages); j++)
        			    {
        			        /* put a test vector */
        			        for (i = 0; i < 495;i++){
        			        	Xil_Out32 (SPMV_rowDelimiters2 + i*4,i*0xDEADBEEF);
        			        }
        			        /* put a test vector*/
        			        for (i = 0; i < 988;i++){
        			        	Xil_Out32 (SPMV_vec2 + i*4,i*0xDEADBEEF);
        			        }

        			        /* put a test vector*/
        			        for (i = 0; i < 1666;i++){
        			        	Xil_Out32 (SPMV_cols2 + i*4,i*0xDEADBEEF);
        			        }

        			        /* put a test vector*/
        			        for (i = 0; i < 3332;i++){
        			        	Xil_Out32 (SPMV_val_r2 + i*4,i*0xDEADBEEF);
        			        }
        			        //xil_printf("Start signal is sent:\n");
        			        Xil_Out32 (SPMV_CRTL2, 0x00000001 );
        			        int cnt =0;
        			        while ( !((Xil_In32 (SPMV_CRTL2)) & 0x2) && cnt< 10000)
        			        	cnt++;
        			        uint32_t tmp;
        			        for (i = 0; i < 988; i++){
        			        	tmp = Xil_In32 (SPMV_out_r2+i*4);
        			        }
        					xil_printf("\nSPMV2-----Done ");
        					cnt =0;
        				}
        			    i=0;j=0;
        			break;
        			}
        	}
}
