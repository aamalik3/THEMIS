/*
 * sort_checker.h
 *
 *  Created on: Sep 20, 2022
 *      Author: aamalik3
 */

#ifndef SRC_SORT_CHECKER_H_
#define SRC_SORT_CHECKER_H_


#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "sleep.h"
#include <time.h>
#include "xtime_l.h"
#include <stdlib.h>
#include "PR_executer.h"
#include <stdbool.h>
#include "common.h"

#define SORT_CRTL0			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0000
#define SORT_A0				XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x2000

#define SORT_CRTL1			XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x0000
#define SORT_A1				XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x2000

#define SORT_CRTL2			XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x0000
#define SORT_A2				XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x2000


void sort_operation(bool PR,uint8_t pblock,uint8_t messages);



#endif /* SRC_SORT_CHECKER_H_ */
