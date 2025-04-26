/*
 * gemm_checker.h
 *
 *  Created on: Sep 20, 2022
 *      Author: aamalik3
 */

#ifndef SRC_GEMM_CHECKER_H_
#define SRC_GEMM_CHECKER_H_


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

#define gemm_CRTL_0			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x00000
#define gemm_m1_0			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x08000
#define gemm_m2_0 			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x10000
#define gemm_product_0 		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x18000

#define gemm_CRTL_1			XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x00000
#define gemm_m1_1			XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x08000
#define gemm_m2_1 			XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x10000
#define gemm_product_1 		XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x18000


void gemm_operation(bool PR, uint8_t pblock,uint8_t messages);


#endif /* SRC_GEMM_CHECKER_H_ */
