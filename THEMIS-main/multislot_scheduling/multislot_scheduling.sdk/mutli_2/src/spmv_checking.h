/*
 * spmv_checking.h
 *
 *  Created on: Sep 20, 2022
 *      Author: aamalik3
 */

#ifndef SRC_SPMV_CHECKING_H_
#define SRC_SPMV_CHECKING_H_


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

#define SPMV_CRTL0			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0000
#define SPMV_rowDelimiters0	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0800
#define SPMV_vec0 			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x1000
#define SPMV_cols0	 		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x2000
#define SPMV_val_r0		 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x4000
#define SPMV_out_r0		 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x8000

#define SPMV_CRTL1			XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x0000
#define SPMV_rowDelimiters1	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x0800
#define SPMV_vec1 			XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x1000
#define SPMV_cols1	 		XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x2000
#define SPMV_val_r1		 	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x4000
#define SPMV_out_r1		 	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x8000

#define SPMV_CRTL2			XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x0000
#define SPMV_rowDelimiters2	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x0800
#define SPMV_vec2 			XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x1000
#define SPMV_cols2	 		XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x2000
#define SPMV_val_r2		 	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x4000
#define SPMV_out_r2		 	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x8000

void spmv_operation		(bool PR,uint8_t pblock,uint8_t messages);


#endif /* SRC_SPMV_CHECKING_H_ */
