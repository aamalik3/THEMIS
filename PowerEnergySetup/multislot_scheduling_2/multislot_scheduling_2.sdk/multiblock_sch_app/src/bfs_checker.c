/*
 * bfs_my_module.c
 *
 *  Created on: Sep 7, 2022
 *      Author: ekarabu
 */

#include "bfs_checker.h"

void bfs_operation(bool PR, uint8_t pblock,uint8_t messages)
{
	int cnt =0;
	uint32_t tmp;
	xil_printf("\n");
	uint32_t	i;

    switch (pblock)
    	{
    		default: //case 0
    			{
    				if (PR){
    					PR_execution("bfs0.bin");
    					xil_printf("\nPR Operation Performed ");
    					}
    				else
    					xil_printf("\nPR Operation, Skipped ");
    				for (int j = 0; j < (messages); j++)
    				{
						for (i = 0; i < 2; i++){
							Xil_Out32 (BFS_starting_node0 + i*4, i*2 );
						}
						for (i = 0; i < (2048); i++){
							Xil_Out32 (BFS_nodes0 + i*4, i*3);
						}
						for (i = 0; i < 16384; i++){
							Xil_Out32 (BFS_edges0 + i*4, i*4);
						}
						for (i = 0; i < 64; i++){
							Xil_Out32 (BFS_level_counts0 + i*4, i*5);
						}

							Xil_Out32 (BFS_CRTL0, 0x00000001 );
							while ( !((Xil_In32 (BFS_CRTL0)) & 0x2) && cnt< 10000)
							cnt++;
							tmp =0;
							cnt =0;
							for (i = 0; i < 128; i++){
								tmp = Xil_In32 (BFS_level0+i*4);
								xil_printf("0x%x\n",tmp);
							}
							xil_printf("\nBFS2-----Done ");
							cnt =0;
    				}
    			break;
    			}
    		case 1:
    			{
    				if (PR){
    					PR_execution("bfs1.bin");
    					xil_printf("\nPR Operation Performed ");
					}
    				else
					xil_printf("\nPR Operation, Skipped ");
    				for (int j = 0; j < (messages); j++)
    				{
						for (i = 0; i < 2; i++){
							Xil_Out32 (BFS_starting_node1 + i*4, 0x00000000 );
						}
						for (i = 0; i < (2048); i++){
							Xil_Out32 (BFS_nodes1 + i*4, 0x00000000 );
						}
						for (i = 0; i < 16384; i++){
							Xil_Out32 (BFS_edges1 + i*4, 0xDEADBEEF);
						}
						for (i = 0; i < 64; i++){
							Xil_Out32 (BFS_level_counts1 + i*4, 0xDEADBEEF);
						}

							Xil_Out32 (BFS_CRTL1, 0x00000001 );
							while ( !((Xil_In32 (BFS_CRTL1)) & 0x2) && cnt< 10000)
							cnt++;
							tmp =0;
							cnt =0;
							for (i = 0; i < 128; i++){
								tmp = Xil_In32 (BFS_level1+i*4);
								//xil_printf("0x%x\n",tmp[i]);
							}
							xil_printf("\nBFS1-----Done ");
							cnt =0;
    				}
    			break;
    			}
//    		case 2:
//    			{
//    				if (PR){
//    					PR_execution("bfs2.bin");
//    					xil_printf("\nPR Operation Performed ");
//    				}
//    				else
//    					xil_printf("\nPR Operation, Skipped ");
//    				for (int j = 0; j < (messages); j++)
//    				{
//						for (i = 0; i < 2; i++){
//							Xil_Out32 (BFS_starting_node2 + i*4, 0x00000000 );
//						}
//						for (i = 0; i < (2048); i++){
//							Xil_Out32 (BFS_nodes2 + i*4, 0x00000000 );
//						}
//						for (i = 0; i < 16384; i++){
//							Xil_Out32 (BFS_edges2 + i*4, 0xDEADBEEF);
//						}
//						for (i = 0; i < 64; i++){
//							Xil_Out32 (BFS_level_counts2 + i*4, 0xDEADBEEF);
//						}
//
//							Xil_Out32 (BFS_CRTL2, 0x00000001 );
//							while ( !((Xil_In32 (BFS_CRTL2)) & 0x2) && cnt< 10000)
//							cnt++;
//							tmp =0;
//							cnt =0;
//							for (i = 0; i < 128; i++){
//								tmp = Xil_In32 (BFS_level2+i*4);
//								//xil_printf("0x%x\n",tmp[i]);
//							}
//							xil_printf("\nBFS2-----Done ");
//							cnt =0;
//    				}
//    			break;
//    			}
    	}
}


