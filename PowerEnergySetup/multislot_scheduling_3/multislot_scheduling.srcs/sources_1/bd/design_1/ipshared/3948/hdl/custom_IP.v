`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2022 06:19:06 PM
// Design Name: 
// Module Name: custom_IP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

parameter C_S_AXI_BUS_A_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);
parameter    C_S_AXI_BUS_A_DATA_WIDTH = 32;
parameter    C_S_AXI_BUS_A_ADDR_WIDTH = 15;
parameter    C_S_AXI_DATA_WIDTH = 32;
module custom_IP(
input   s_axi_clk,
input   s_axi_rst_n,
input   s_axi_BUS_A_AWVALID,
output   s_axi_BUS_A_AWREADY,
input  [31:0] s_axi_BUS_A_AWADDR,
input   s_axi_BUS_A_WVALID,
output   s_axi_BUS_A_WREADY,
input  [C_S_AXI_BUS_A_DATA_WIDTH - 1:0] s_axi_BUS_A_WDATA,
input  [C_S_AXI_BUS_A_WSTRB_WIDTH - 1:0] s_axi_BUS_A_WSTRB,
input   s_axi_BUS_A_ARVALID,
output   s_axi_BUS_A_ARREADY,
input  [31:0] s_axi_BUS_A_ARADDR,
output   s_axi_BUS_A_RVALID,
input   s_axi_BUS_A_RREADY,
output  [C_S_AXI_BUS_A_DATA_WIDTH - 1:0] s_axi_BUS_A_RDATA,
output  [1:0] s_axi_BUS_A_RRESP,
output   s_axi_BUS_A_BVALID,
input   s_axi_BUS_A_BREADY,
output  [1:0] s_axi_BUS_A_BRESP,
output   interrupt
    );
endmodule
