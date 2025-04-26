#include "aes_checker.h"
//#include "latency_counter.h"
/*
Plain-Texts
00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000
Key
00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000
 */
void aes_256_operation(bool PR, uint8_t pblock,uint8_t messages)
{
	uint32_t cnt =0;
    uint8_t i,j;
    uint32_t res0;
    uint32_t res1;
    uint32_t res2;

switch (pblock)
	{
		default: //case 0
			{
				if (PR){
					xil_printf("\n-------------AES0-----\n");
					PR_execution("aes0.bin");

				xil_printf("\nPR Operation Performed ");
			}
			else
				xil_printf("\nPR Operation, Skipped ");
				for (i = 0; i < 8; i++)
				{
					Xil_Out32 (AES256_KEY_0 + i*4, 0x00000000 );
				}
				for (i = 0; i < (4*messages); i++)
				{
					Xil_Out32 (AES256_Plain_Cipher_0 + i*4, 0x00000000 );
				}
				for (j = 0; j < (messages); j++)
				{
					Xil_Out32 (AES256_CRTL_0, 0x00000001 );
					while ( !((Xil_In32 (AES256_CRTL_0)) & 0x2) && cnt< (10000*2))
						cnt++;
//					xil_printf(" AES_0 Ciphertext=> \n");
					for (i = 0; i < 4; i++){
						res0 = Xil_In32 (AES256_Plain_Cipher_0+i*4);
//						xil_printf(" %x \n ",Xil_EndianSwap32(res0));
					}
					xil_printf("\nAES0-----Done ");
					cnt =0;
				}
			break;
			}
		case 1:
			{
				if (PR) {
				xil_printf("\n-------------AES1-----\n");
				PR_execution("aes1.bin");
				xil_printf("\nPR Operation Performed ");
				}
				else
					xil_printf("\nPR Operation, Skipped ");
				for (i = 0; i < 8; i++)
				{
					Xil_Out32 (AES256_KEY_1 + i*4, 0x00000000 );
				}
				for (i = 0; i < 4*messages; i++)
				{
					Xil_Out32 (AES256_Plain_Cipher_1 + i*4, 0x00000000 );
				}
				for (j = 0; j < (messages); j++)
				{
					Xil_Out32 (AES256_CRTL_1, 0x00000001 );
					while ( !((Xil_In32 (AES256_CRTL_1)) & 0x2) && cnt< 10000*2)
						cnt++;

//					xil_printf("AES_1 Ciphertext=> \n");
					for (i = 0; i < 4; i++){
						res1 = Xil_In32 (AES256_Plain_Cipher_1+i*4);
//						xil_printf(" %x \n",Xil_EndianSwap32(res1));

					}
					xil_printf("\nAES1-----Done ");
					cnt =0;
				}
				break;
			}
		case 2:
			{
				if (PR){
				xil_printf("\n-------------AES2-----\n");
				PR_execution("aes2.bin");

				xil_printf("\nPR Operation Performed ");
				}
				else
					xil_printf("\nPR Operation, Skipped ");
				for (i = 0; i < 8; i++)
				{
					Xil_Out32 (AES256_KEY_2 + i*4, 0x00000000 );
				}
				for (i = 0; i < 4*messages; i++)
				{
					Xil_Out32 (AES256_Plain_Cipher_2 + i*4, 0x00000000 );
				}
				for (j = 0; j < (messages); j++)
				{
					Xil_Out32 (AES256_CRTL_2, 0x00000001 );

					while ( !((Xil_In32 (AES256_CRTL_2)) & 0x2) && cnt< 10000*2)
						cnt++;
//					xil_printf("AES_2 Ciphertext=> \n");
					for (i = 0; i < 4; i++){
						res2 = Xil_In32 (AES256_Plain_Cipher_2+i*4);
						xil_printf(" %x \n",Xil_EndianSwap32(res2));
					}
//					xil_printf("\n----------------------------------------------------\n ");
					xil_printf("\nAES2-----Done");
					cnt =0;
				}
				break;
			}

	}

}
