`timescale 1 ns / 1 ps 


parameter    C_S_AXI_BUS_A_DATA_WIDTH = 32;
parameter    C_S_AXI_BUS_A_ADDR_WIDTH = 8;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_BUS_A_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

`default_nettype wire

module custom_IP 
(
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






  sha256_axi4 dut(
                  .hash_complete    (interrupt),
                  .s00_axi_aclk     (s_axi_clk),
                  .s00_axi_aresetn  (s_axi_rst_n),
                  .s00_axi_awaddr   (s_axi_BUS_A_AWADDR),
                  .s00_axi_awprot   (0),
                  .s00_axi_awvalid  (s_axi_BUS_A_AWVALID),
                  .s00_axi_awready  (s_axi_BUS_A_AWREADY),
                  .s00_axi_wdata    (s_axi_BUS_A_WDATA),
                  .s00_axi_wstrb    (s_axi_BUS_A_WSTRB),
                  .s00_axi_wvalid   (s_axi_BUS_A_WVALID),
                  .s00_axi_wready   (s_axi_BUS_A_WREADY),
                  .s00_axi_bresp  	(s_axi_BUS_A_BRESP),
                  .s00_axi_bvalid 	(s_axi_BUS_A_BVALID),
                  .s00_axi_bready 	(s_axi_BUS_A_BREADY),
                  .s00_axi_araddr 	(s_axi_BUS_A_ARADDR),
                  .s00_axi_arprot 	(0),
                  .s00_axi_arvalid	(s_axi_BUS_A_ARVALID),
                  .s00_axi_arready	(s_axi_BUS_A_ARREADY),
                  .s00_axi_rdata  	(s_axi_BUS_A_RDATA),
                  .s00_axi_rresp  	(s_axi_BUS_A_RRESP),
                  .s00_axi_rvalid 	(s_axi_BUS_A_RVALID),
                  .s00_axi_rready 	(s_axi_BUS_A_RREADY)
                 );
				 
endmodule
