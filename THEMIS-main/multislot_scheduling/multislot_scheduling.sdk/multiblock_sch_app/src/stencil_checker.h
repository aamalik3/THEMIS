/*
 * stencil_checker.h
 *
 *  Created on: Sep 20, 2022
 *      Author: aamalik3
 */

#ifndef SRC_STENCIL_CHECKER_H_
#define SRC_STENCIL_CHECKER_H_


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

#define STNCL_CRTL0 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR
#define STNCL_filter0 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x00040
#define STNCL_orig0   	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x08000
#define STNCL_sol0 		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x10000

#define STNCL_CRTL1 	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR
#define STNCL_filter1 	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x00040
#define STNCL_orig1   	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x08000
#define STNCL_sol1 		XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x10000

#define STNCL_CRTL2 	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR
#define STNCL_filter2 	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x00040
#define STNCL_orig2   	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x08000
#define STNCL_sol2 		XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x10000



void stencil_operation (bool PR,uint8_t pblock,uint8_t messages);


#endif /* SRC_STENCIL_CHECKER_H_ */
