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
#include "PR_executer.h"
#include <stdbool.h>
#include "common.h"

#define BFS_CRTL0			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0000
#define BFS_starting_node0	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0010
#define BFS_level_counts0 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0080
#define BFS_level0	 		XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x0100
#define BFS_nodes0		 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x1000
#define BFS_edges0		 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x8000

#define BFS_CRTL1			XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x0000
#define BFS_starting_node1	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x0010
#define BFS_level_counts1 	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x0080
#define BFS_level1	 		XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x0100
#define BFS_nodes1		 	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x1000
#define BFS_edges1		 	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x8000

#define BFS_CRTL2			XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x0000
#define BFS_starting_node2	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x0010
#define BFS_level_counts2 	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x0080
#define BFS_level2	 		XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x0100
#define BFS_nodes2		 	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x1000
#define BFS_edges2		 	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x8000

void bfs_operation(bool PR,uint8_t pblock,uint8_t messages);

#endif /* SRC_BFS_MY_MODULE_H_ */
