/*
 * spmv_profiling.h
 *
 *  Created on: Sep 8, 2022
 *      Author: aamalik3
 */

#ifndef SRC_SPMV_PROFILING_H_
#define SRC_SPMV_PROFILING_H_


#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "sleep.h"
#include <time.h>
#include "xtime_l.h"
#include <stdlib.h>

#define SPMV_CRTL			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0000
#define SPMV_rowDelimiters	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0800
#define SPMV_vec 			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x1000
#define SPMV_cols	 		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x2000
#define SPMV_val_r		 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x4000
#define SPMV_out_r		 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x8000

void spmv_operation();
#endif /* SRC_SPMV_PROFILING_H_ */
