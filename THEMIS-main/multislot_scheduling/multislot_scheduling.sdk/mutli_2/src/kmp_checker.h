/*
 * kmp_checker.h
 *
 *  Created on: Sep 20, 2022
 *      Author: aamalik3
 */

#ifndef SRC_KMP_CHECKER_H_
#define SRC_KMP_CHECKER_H_



#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "sleep.h"
#include <time.h>
#include "xtime_l.h"
#include <stdlib.h>
#include <stdbool.h>
#include "common.h"

#define KMP_CRTL0				XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0000
#define KMP_pattern0			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0018
#define KMP_Next0 				XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0020
#define KMP_input_r0	 		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x8000
#define KMP_matches0		 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0030
#define KMP_CTRL_match0			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0034

#define KMP_CRTL1				XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x0000
#define KMP_pattern1			XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x0018
#define KMP_Next1 				XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x0020
#define KMP_input_r1	 		XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x8000
#define KMP_matches1		 	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x0030
#define KMP_CTRL_match1			XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x0034

#define KMP_CRTL2				XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x0000
#define KMP_pattern2			XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x0018
#define KMP_Next2 				XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x0020
#define KMP_input_r2	 		XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x8000
#define KMP_matches2		 	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x0030
#define KMP_CTRL_match2			XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x0034

void kmp_operation(bool PR,uint8_t pblock,uint8_t messages);

#endif /* SRC_KMP_CHECKER_H_ */
