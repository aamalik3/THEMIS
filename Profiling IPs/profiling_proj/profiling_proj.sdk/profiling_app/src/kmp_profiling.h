/*
 * kmp_profiling.h
 *
 *  Created on: Sep 8, 2022
 *      Author: aamalik3
 */

#ifndef SRC_KMP_PROFILING_H_
#define SRC_KMP_PROFILING_H_

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "sleep.h"
#include <time.h>
#include "xtime_l.h"
#include <stdlib.h>

#define KMP_CRTL			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0000
#define KMP_pattern			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0018
#define KMP_Next 			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0020
#define KMP_input_r	 		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x8000
#define KMP_matches		 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0030
#define KMP_CTRL_match		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0034

void kmp_operation();

#endif /* SRC_KMP_PROFILING_H_ */
