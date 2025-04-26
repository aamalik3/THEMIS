/*
 * common.h
 *
 *  Created on: Sep 9, 2022
 *      Author: ekarabu
 */

#ifndef SRC_COMMON_H_
#define SRC_COMMON_H_

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include <stdlib.h>

typedef struct WorkLoad {
	char name [20];
	uint8_t demandedResource; // 1 to 3
	uint32_t latency;
	//uint8_t securityLevel;
	int priority;
	float successRate;
} workload;

uint8_t totalSlot;
uint32_t interval;
uint8_t remainingSlot;


#endif /* SRC_COMMON_H_ */
