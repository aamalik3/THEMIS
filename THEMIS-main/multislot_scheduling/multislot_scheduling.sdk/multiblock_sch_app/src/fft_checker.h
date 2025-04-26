/*
 * fft_checker.h
 *
 *  Created on: Sep 20, 2022
 *      Author: aamalik3
 */

#ifndef SRC_FFT_CHECKER_H_
#define SRC_FFT_CHECKER_H_


#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "sleep.h"
#include <time.h>
#include "xtime_l.h"
#include <stdlib.h>
#include "common.h"
#include "PR_executer.h"
#include <stdbool.h>

#define FFT_CRTL0 		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR
#define FFT_REAL_TWD0 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x1000
#define FFT_REAL_R0   	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x2000
#define FFT_REAL_IMG0 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x4000
#define FFT_REAL_RSLT0 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x6000

//#define FFT_CRTL1 		XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR
//#define FFT_REAL_TWD1 	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x1000
//#define FFT_REAL_R1   	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x2000
//#define FFT_REAL_IMG1 	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x4000
//#define FFT_REAL_RSLT1 	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x6000
//
//#define FFT_CRTL2 		XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR
//#define FFT_REAL_TWD2 	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x1000
//#define FFT_REAL_R2   	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x2000
//#define FFT_REAL_IMG2 	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x4000
//#define FFT_REAL_RSLT2 	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x6000

void fft_operation (bool PR,uint8_t pblock,uint8_t messages);

#endif /* SRC_FFT_CHECKER_H_ */
