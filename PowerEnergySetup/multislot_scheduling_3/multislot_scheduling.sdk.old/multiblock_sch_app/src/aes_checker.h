/*
 * aes_profiling.h
 *
 *  Created on: Sep 4, 2022
 *      Author: ekarabu
 */

#ifndef SRC_AES_CHECKER_H_
#define SRC_AES_CHECKER_H_


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

#define AES256_CRTL_0 			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR
#define AES256_KEY_0 			XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x20
#define AES256_Plain_Cipher_0 	XPAR_IP_WRAPPER_0_S00_AXI_BASEADDR + 0x40

#define AES256_CRTL_1 			XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR
#define AES256_KEY_1 			XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x20
#define AES256_Plain_Cipher_1 	XPAR_IP_WRAPPER_1_S00_AXI_BASEADDR + 0x40

#define AES256_CRTL_2 			XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR
#define AES256_KEY_2 			XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x20
#define AES256_Plain_Cipher_2 	XPAR_IP_WRAPPER_2_S00_AXI_BASEADDR + 0x40
void aes_256_operation(bool PR,uint8_t pblock,uint8_t messages);



#endif /* SRC_AES_CHECKER_H_ */
