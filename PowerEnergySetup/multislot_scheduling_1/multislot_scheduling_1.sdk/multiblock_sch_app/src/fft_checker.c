#include "fft_checker.h"


void fft_operation(bool PR,uint8_t pblock,uint8_t messages)
{
	 int i=0,j=0;

    switch (pblock)
        	{
        		default: //case 0, Only works for Partition 0 since that is where it was able to fit
        			{
        				if (PR)
        				{
        					PR_execution("fft0.bin");
        					xil_printf("\nPR Operation Performed ");
        				}
        				else
    					xil_printf("\nPR Operation, Skipped ");
        			    for (j = 0; j < (messages); j++)
        			    {
        					for (i = 0; i < 1024; i++)
        					{
        						Xil_Out32 (FFT_REAL_TWD0 + i*4, i*i);
        					}
        					for (i = 0; i < 2048; i++)
        					{
        						Xil_Out32 (FFT_REAL_R0 + i*4, i*2);
        					}
        					for (i = 0; i < 2048; i++)
        					{
        						Xil_Out32 (FFT_REAL_IMG0 + i*4, (i*3));
        					}

        					Xil_Out32 (FFT_CRTL0, 0x00000001 );
        					int cnt =0;
        					while ( !((Xil_In32 (FFT_CRTL0)) & 0x2) && cnt< 10000)
        						cnt++;
        					uint32_t tmp;
        					for (i = 0; i < 1024; i++){
        						tmp = Xil_In32 (FFT_REAL_RSLT0+i*4);
//        						xil_printf("0x%x\n",tmp);
        					}
        					xil_printf("\nFFT0-----Done ");
        					cnt =0;
        				}
        			break;
        			}
        	}
}
