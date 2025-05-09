/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "scheduler.h"
#include "stfs_scheduling.h"
#include "xtime_l.h"



int main()
{
	  uint32_t test_time;
	  uint32_t idx;

	  XTime gbl_time_before_test;
	  XTime *p_gbl_time_before_test = &gbl_time_before_test;
	  XTime gbl_time_after_test;
	  XTime *p_gbl_time_after_test = &gbl_time_after_test;


    init_platform();
    print("\nProgram Started\n\r");
    XTime_GetTime(p_gbl_time_before_test);


//    u32 Status = PR_Init();
//    if (Status != XST_SUCCESS)
//    {
//    	xil_printf("error in ICAP \n");
//    	return -1;
//    }
//    /*PR Required		, pblock number	, number of messages*/
//    aes_256_operation	(true ,0,2);
//    aes_256_operation	(false,0,2);
//    aes_256_operation	(true ,1,2);
//    aes_256_operation	(true ,2,2);

//    uint8_t Resource[] = {1,3,1,4};
//    uint8_t PR_Resource[] = {8,6,4};
//    uint32_t latency[] = {2,2,4,3};

//    uint8_t Resource[] = {4, 5, 5, 1,1, 2, 4, 4};
//    uint8_t PR_Resource[] = {8,6,4};
//    uint32_t latency[] = {3,1, 1, 1, 2, 3, 3, 1};

    uint8_t Resource[] = {2, 17, 6, 12,3, 14, 1, 5};
    uint32_t latency[] = {7,5, 8, 15, 9, 28, 14, 14};

//    uint8_t Resource[] = {2, 3, 4};
//    uint32_t latency[] = {5, 2, 1};
//
//    uint8_t PR_Resource[] = {17,17};
    uint8_t PR_Resource[] = {4,10,18};
//    uint8_t PR_Resource[] = {12,18,28};
//    uint8_t PR_Resource[] = {17,17,17};
//    uint32_t latency[] = {7,5, 8, 15, 9, 28, 14, 14};
    int Quantum=0;
    float target_allocation=1.243;
    for (Quantum =36;Quantum<=36;Quantum++)
//    	scheduling(Resource, PR_Resource, latency,Quantum,target_allocation);
    	stfs_scheduling(Resource, PR_Resource, latency,Quantum,target_allocation);
    XTime_GetTime(p_gbl_time_after_test);
    test_time = (u64) gbl_time_after_test - (u64) gbl_time_before_test;

    xil_printf("Test time = 0x%08x\n\r", test_time);
//    float cost_time = (float) (gbl_time_after_test - gbl_time_before_test)/((float) COUNTS_PER_SECOND);
//    xil_printf("cost_time  = %.4f secs\r\n", cost_time);
//    printf("cost_time =%.8f ",cost_time);


//
//    fft_operation		(true ,0,1);
//    fft_operation		(false,0,1);
//
//    sort_operation 		(true ,0,1);
//    sort_operation 		(false,0,1);
//    sort_operation 		(true ,1,2);
//    sort_operation 		(false,1,2);
//    sort_operation 		(true ,2,3);
//    sort_operation 		(false,2,3);
//
//    sha_operation 		(true ,0,1);
//    sha_operation 		(false,0,1);
//    sha_operation 		(true ,1,2);
//    sha_operation 		(false,1,2);
//    sha_operation 		(true ,2,3);
//    sha_operation 		(false,2,3);
//
//    gemm_operation 		(true ,0,1);
//    gemm_operation 		(false,0,1);
//    gemm_operation 		(true ,1,2);
//    gemm_operation 		(false,1,2);
//
//    bfs_operation		(true ,0,1);
//    bfs_operation		(false,0,2);
//    bfs_operation		(true ,1,5);
//    bfs_operation		(false,1,5);
//
//
//    spmv_operation 		(true ,0,1);
//    spmv_operation 		(false,0,1);
//    spmv_operation 		(true ,1,2);
//    spmv_operation 		(false,1,2);
//    spmv_operation 		(true ,2,3);
//    spmv_operation 		(false,2,3);
//
//    kmp_operation 		(true ,0,1);
//    kmp_operation 		(false,0,1);
//    kmp_operation 		(true ,1,2);
//    kmp_operation 		(false,1,2);
//    kmp_operation 		(true ,2,3);
//    kmp_operation 		(false,2,3);
//
//
//    stencil_operation 	(true ,0,1);
//    stencil_operation 	(false,0,1);
//    stencil_operation 	(true ,1,2);
//    stencil_operation 	(false,1,2);

    print("\nProgram Finished\n\r");

    cleanup_platform();
    return 0;
}
