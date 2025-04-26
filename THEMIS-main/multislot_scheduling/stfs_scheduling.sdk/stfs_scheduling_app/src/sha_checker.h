/*
 * sha_checker.h
 *
 *  Created on: Sep 20, 2022
 *      Author: aamalik3
 */

#ifndef SRC_SHA_CHECKER_H_
#define SRC_SHA_CHECKER_H_

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

#define SHA_CRTL0			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x000C
#define SHA_RDY0			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0008
#define SHA_Slave_IN0		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0010
#define SHA_Slave_OUT0		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0020

#define SHA_CRTL1			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x000C
#define SHA_RDY1			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0008
#define SHA_Slave_IN1		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0010
#define SHA_Slave_OUT1		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0020

#define SHA_CRTL2			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x000C
#define SHA_RDY2			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0008
#define SHA_Slave_IN2		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0010
#define SHA_Slave_OUT2		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0020


void sha_operation (bool PR,uint8_t pblock,uint8_t messages);


#endif /* SRC_SHA_CHECKER_H_ */
