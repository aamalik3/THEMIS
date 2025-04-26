/*
 * gemm.h
 *
 *  Created on: Sep 8, 2022
 *      Author: aamalik3
 */

#ifndef SRC_GEMM_PROFILING_H_
#define SRC_GEMM_PROFILING_H_


#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "sleep.h"
#include <time.h>
#include "xtime_l.h"
#include <stdlib.h>

#define gemm_CRTL			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x00000
#define gemm_m1				XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x08000
#define gemm_m2 			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x10000
#define gemm_product 		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x18000


void gemm_operation();

#endif /* SRC_GEMM_PROFILING_H_ */
