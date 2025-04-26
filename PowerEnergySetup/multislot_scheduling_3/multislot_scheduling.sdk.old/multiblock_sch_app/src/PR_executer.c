
#include "PR_executer.h"




static FATFS fatfs;
static XHwIcap HwIcap;	// The instance of the HWICAP device
static XDcfg_Config *XDcfg_0;

char PR_FileNames[32][24] = {
		"aes0.bin",
		"aes1.bin",
		"aes2.bin",
		"bfs0.bin",
		"bfs1.bin",
		"bfs2.bin",
		"fft0.bin",
		"gemm0.bin",
		"gemm1.bin",
		"kmp0.bin",
		"kmp1.bin",
		"kmp2.bin",
		"sha0.bin",
		"sha1.bin",
		"sha2.bin",
		"sort0.bin",
		"sort1.bin",
		"sort2.bin",
		"spmv0.bin",
		"spmv1.bin",
		"spmv2.bin",
		"stencil0.bin",
		"stencil1.bin",
		"stencil2.bin"
};


int SD_Init()
{
	FRESULT rc;
	rc = f_mount(&fatfs, "", 0);
	if (rc) {
		xil_printf(" ERROR : f_mount returned %d\r\n", rc);
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int SD_TransferPartial(char *FileName, u32 DestinationAddress, u32 ByteLength)
{
	FIL fil;
	FRESULT rc;
	UINT br;

	rc = f_open(&fil, FileName, FA_READ);
	if (rc) {
		xil_printf(" ERROR : f_open returned %d\r\n", rc);
		return XST_FAILURE;
	}

	rc = f_lseek(&fil, 0);
	if (rc) {
		xil_printf(" ERROR : f_lseek returned %d\r\n", rc);
		return XST_FAILURE;
	}

	rc = f_read(&fil, (void*)DestinationAddress, ByteLength, &br);
	if (rc) {
		xil_printf(" ERROR : f_read returned %d\r\n", rc);
		return XST_FAILURE;
	}

	rc = f_close(&fil);
	if (rc) {
		xil_printf(" ERROR : f_close returned %d\r\n", rc);
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int XDcfg_TransferBitfile(XHwIcap *HwIcapInstPtr, u32 *PartialAddress, u32 bitfile_length_words)
{
	u32 Status = 0;
//	bitfile_length_words = PARTIAL_AES_BITFILE_LEN;

	Status = XHwIcap_DeviceWrite(HwIcapInstPtr, PartialAddress, bitfile_length_words);
	if (Status != XST_SUCCESS)
	{
		xil_printf("error writing to ICAP (%d)\r\n", Status);
		return -1;
	}
	while (XHwIcap_IsDeviceBusy(HwIcapInstPtr));

	return XST_SUCCESS;
}


int PR_Init()
{

	XHwIcap_Config *ConfigPtr;
	// Invalidate and enable Data Cache


	// Initialize Device Configuration Interface
	DcfgInstPtr = &DcfgInstance;
	XDcfg_0 = XDcfg_LookupConfig(XPAR_XDCFG_0_DEVICE_ID);
	PR_Status = XDcfg_CfgInitialize(DcfgInstPtr, XDcfg_0, XDcfg_0->BaseAddr);
	if (PR_Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	// Deselect PCAP as the configuration device as we are going to use the ICAP
	XDcfg_ClearControlRegister(DcfgInstPtr, XDCFG_CTRL_PCAP_PR_MASK);

	ConfigPtr = XHwIcap_LookupConfig(XPAR_AXI_HWICAP_0_DEVICE_ID);
	if (ConfigPtr == NULL) {
		return XST_FAILURE;
	}

	HwIcapInstPtr = &HwIcap;
	PR_Status = XHwIcap_CfgInitialize(HwIcapInstPtr, ConfigPtr,
		ConfigPtr->BaseAddress);
	if (PR_Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	XHwIcap_Reset(HwIcapInstPtr);
	//	while(!XHwIcap_IsDeviceBusy(HwIcapInstPtr));
	print("HWICAP Initialized\r\n");

	read_bitstreams ();


	return XST_SUCCESS;

}



int PR_execution(char* file_name)
{
	int i, result=1;
	for ( i = 0; i < TOTAL_NUMBER_OF_PARTIAL_BITSTREAMS; i++ ){
		result = strcmp(file_name, (char *)PR_FileNames[i]);
		if (result==0)
			break;
	}

	//PartialAddress = partial_bitstream_buffers[0];
	//xil_printf("Starting %s Reconfiguration\n\r",(char *)PR_FileNames[i]);
	XTime tStart, tEnd;
	XTime_GetTime(&tStart);
	PR_Status = XDcfg_TransferBitfile(HwIcapInstPtr, (u32*)partial_bitstream_buffers[i], partial_bitstream_FileSizes[i]);
	XTime_GetTime(&tEnd);
	printf("0th PR took %.2f clock cycles.\n", ((double)((tEnd - tStart)))/66.66666);
	printf("Output took %.2f us.\n",
	           1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND/1000000));
	if (PR_Status != XST_SUCCESS) {
		xil_printf("Error : FPGA configuration failed!\n\r");
		exit(EXIT_FAILURE);
	}
	//xil_printf("%s Reconfiguration Completed!\n\r",file_name);

	return XST_SUCCESS;
}


///////////////////////////////////////////////////////////////
//
// sd card access - read bitstreams
//
///////////////////////////////////////////////////////////////
// read bitstream files from sd card and put them on
// dram memory.

void read_bitstreams (  )  {

	char *file_name;
	Xil_DCacheDisable();
	int i;
	for ( i = 0; i < TOTAL_NUMBER_OF_PARTIAL_BITSTREAMS; i++ )  {
		partial_bitstream_buffers[i] = (u32 *) malloc ( SIZE_OF_PARTIAL_BITSTREAM_BUFFER * sizeof(u32));
	}
	// Initialize SD controller and transfer partials to DDR
	u32 PARTIAL_BITFILE_LEN;
	SD_Init();
	for ( i = 0; i < TOTAL_NUMBER_OF_PARTIAL_BITSTREAMS; i++ )
	{
		file_name = (char *)PR_FileNames[i];
		char * location;
		int   j, ch = '0';
		for (j=0;j<3;j++)
		{
			if (j==0)
			{
				ch = '0';
				PARTIAL_BITFILE_LEN = 0x4B949;
			}
			else if (j==1)
			{
				ch = '1';
				PARTIAL_BITFILE_LEN = 0x56617;
			}
			else
			{
				ch = '2';
				PARTIAL_BITFILE_LEN = 0x345A3;
			}
			location = strrchr( file_name, ch );
			if (location != NULL)
				break;
		}
		partial_bitstream_FileSizes[i] = PARTIAL_BITFILE_LEN;
		SD_TransferPartial(file_name, (u32)partial_bitstream_buffers[i], (PARTIAL_BITFILE_LEN << 2));
		printf ("%s bitstream reading\n\r",file_name);
	}
	xil_printf("Partial Binaries transferred successfully!\r\n");
	Xil_DCacheEnable();

	printf ("done reading bitstream files. \n\r");

}

