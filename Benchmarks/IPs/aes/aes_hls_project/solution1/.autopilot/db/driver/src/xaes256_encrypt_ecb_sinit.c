// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xaes256_encrypt_ecb.h"

extern XAes256_encrypt_ecb_Config XAes256_encrypt_ecb_ConfigTable[];

XAes256_encrypt_ecb_Config *XAes256_encrypt_ecb_LookupConfig(u16 DeviceId) {
	XAes256_encrypt_ecb_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XAES256_ENCRYPT_ECB_NUM_INSTANCES; Index++) {
		if (XAes256_encrypt_ecb_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAes256_encrypt_ecb_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAes256_encrypt_ecb_Initialize(XAes256_encrypt_ecb *InstancePtr, u16 DeviceId) {
	XAes256_encrypt_ecb_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAes256_encrypt_ecb_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAes256_encrypt_ecb_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

