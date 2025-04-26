/*
 * scheduler.h
 *
 *  Created on: Sep 9, 2022
 *      Author: ekarabu
 */

#ifndef SRC_SCHEDULER_H_
#define SRC_SCHEDULER_H_

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






void scheduling(uint8_t *Resource, uint8_t *PR_Resource, uint32_t *latency);
//int find_highest_priority (workload row[], int length, int *IP_order);
//int find_least_priority (workload row[], int length, int *IP_order);
//int find_next_priority (workload  row[], int length, int least_IP, int least_priority, int current_order, int current_priorty, int *IP_order, int *IP_priority);
void executer(int IP_number, bool PR_needed, uint8_t pblock,uint8_t messages);
bool avail_slot(slot Slots[]);
//void update_slot(workload row, slot Slots[]);

void init_PRs(slot Slots[], uint8_t* Resource);
void init_IPs(workload IPs[], uint8_t* Resource, uint32_t* latency);
void reset_PRs(slot* Slots, workload IPs[]);
bool find_smallest_PR(slot Slots[], workload *IP, int IP_order);
bool swaping(slot *Slots, workload *IP, int IP_order, workload IPs[]);
void Update_PRs(slot* Slots);
void Update_IPs_and_PRs(slot Slots[], workload IPs[]);
void xorshift3232();

#endif /* SRC_SCHEDULER_H_ */
