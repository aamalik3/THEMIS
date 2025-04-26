/*
 * sort_profiling.h
 *
 *  Created on: Sep 8, 2022
 *      Author: aamalik3
 */

#ifndef SRC_SORT_PROFILING_H_
#define SRC_SORT_PROFILING_H_

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
#include "common.h"

#define SORT_CRTL			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0000
#define SORT_A				XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x2000


void sort_operation_profiling();

#endif /* SRC_SORT_PROFILING_H_ */
