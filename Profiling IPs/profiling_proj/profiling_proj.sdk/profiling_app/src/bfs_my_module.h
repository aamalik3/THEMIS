/*
 * bfs_my_module.h
 *
 *  Created on: Sep 7, 2022
 *      Author: ekarabu
 */

#ifndef SRC_BFS_MY_MODULE_H_
#define SRC_BFS_MY_MODULE_H_


#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "sleep.h"
#include <time.h>
#include "xtime_l.h"
#include <stdlib.h>

#define BFS_CRTL			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0000
#define BFS_starting_node	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0010
#define BFS_level_counts 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0080
#define BFS_level	 		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0100
#define BFS_nodes		 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x1000
#define BFS_edges		 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x8000

void bfs_operation();

#endif /* SRC_BFS_MY_MODULE_H_ */
