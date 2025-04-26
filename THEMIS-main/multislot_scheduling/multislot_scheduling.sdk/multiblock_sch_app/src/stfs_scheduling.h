/*
 * stfs_scheduling.h
 *
 *  Created on: Nov 10, 2022
 *      Author: ekarabu
 */

#ifndef SRC_STFS_SCHEDULING_H_
#define SRC_STFS_SCHEDULING_H_



#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "PR_executer.h"
#include "aes_checker.h"
#include "fft_checker.h"
#include "bfs_checker.h"
#include "sort_checker.h"
#include "stencil_checker.h"
#include "gemm_checker.h"
#include "kmp_checker.h"
#include "sha_checker.h"
#include "spmv_checking.h"
#include "PR_executer.h"
#include "sha_profiling.h"
#include "sort_profiling.h"
#include "common.h"
#include "fft_profiling.h"
#include <stdlib.h>






void stfs_scheduling(uint8_t *Resource, uint8_t *PR_Resource, uint32_t *latency, int QUANTUM,float target_allocation);
bool stfs_avail_slot(slot Slots[]);
//void update_slot(workload row, slot Slots[]);

void stfs_init_PRs(slot Slots[], uint8_t* Resource);
void stfs_init_IPs(workload IPs[], uint8_t* Resource, uint32_t* latency);
void stfs_reset_PRs(slot* Slots, workload IPs[]);
bool stfs_find_smallest_PR(slot Slots[], workload *IP, int IP_order);
bool stfs_swaping(slot SLOT[], slot *Slots, workload *IP, int IP_order, workload IPs[]);
void stfs_Update_PRs(slot* Slots);
void stfs_Update_IPs_and_PRs(slot Slots[], workload IPs[]);
void stfs_xorshift3232();



#endif /* SRC_STFS_SCHEDULING_H_ */
