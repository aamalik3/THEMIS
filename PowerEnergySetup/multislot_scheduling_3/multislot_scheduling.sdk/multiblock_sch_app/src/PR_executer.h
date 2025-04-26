/*
 * PR_executer.h
 *
 *  Created on: Sep 4, 2022
 *      Author: ekarabu
 */

#ifndef SRC_PR_EXECUTER_H_
#define SRC_PR_EXECUTER_H_

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "xparameters.h"
#include "xil_printf.h"
#include "xil_cache.h"
#include "ff.h"
#include "xdevcfg.h"
#include "xhwicap.h"
#include "xil_io.h"
#include "xil_types.h"
#include "common.h"

// Turn on/off Debug messages
#ifdef DEBUG_PRINT
#define  debug_printf  xil_printf
#else
#define  debug_printf(msg, args...) do {  } while (0)
#endif

#define TOTAL_NUMBER_OF_PARTIAL_BITSTREAMS 24
#define SIZE_OF_PARTIAL_BITSTREAM_BUFFER 	353815

// Read function for STDIN
extern char inbyte(void);



// Driver Instantiations

XDcfg DcfgInstance;
XDcfg *DcfgInstPtr;

XHwIcap *HwIcapInstPtr;
u32 * partial_bitstream_buffers[24];
u32 partial_bitstream_FileSizes[24];

int PR_Status;



int SD_Init();
int PR_execution(char* file_name);
int SD_TransferPartial(char *FileName, u32 DestinationAddress, u32 ByteLength);
int PR_Init();
void read_bitstreams (  ) ;



#endif /* SRC_PR_EXECUTER_H_ */
