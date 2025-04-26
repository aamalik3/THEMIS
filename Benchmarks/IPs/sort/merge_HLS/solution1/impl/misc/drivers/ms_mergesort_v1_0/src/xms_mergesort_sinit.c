// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xms_mergesort.h"

extern XMs_mergesort_Config XMs_mergesort_ConfigTable[];

XMs_mergesort_Config *XMs_mergesort_LookupConfig(u16 DeviceId) {
	XMs_mergesort_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMS_MERGESORT_NUM_INSTANCES; Index++) {
		if (XMs_mergesort_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMs_mergesort_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMs_mergesort_Initialize(XMs_mergesort *InstancePtr, u16 DeviceId) {
	XMs_mergesort_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMs_mergesort_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMs_mergesort_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

