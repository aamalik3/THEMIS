
`timescale 1 ns / 1 ps

	module IP_wrapper_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [31 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [31 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready,
		output wire interrupt
	);
// Instantiation of Axi Bus Interface S00_AXI
	custom_IP # ( 
	) custom_IP (
		.s_axi_clk          		(s00_axi_aclk),
            .s_axi_rst_n                (s00_axi_aresetn),
            .s_axi_BUS_A_AWADDR            (s00_axi_awaddr),
            .s_axi_BUS_A_AWVALID        (s00_axi_awvalid),
            .s_axi_BUS_A_AWREADY        (s00_axi_awready),
            .s_axi_BUS_A_WDATA            (s00_axi_wdata),
            .s_axi_BUS_A_WSTRB            (s00_axi_wstrb),
            .s_axi_BUS_A_WVALID            (s00_axi_wvalid),
            .s_axi_BUS_A_WREADY            (s00_axi_wready),
            .s_axi_BUS_A_BRESP            (s00_axi_bresp),
            .s_axi_BUS_A_BVALID            (s00_axi_bvalid),
            .s_axi_BUS_A_BREADY            (s00_axi_bready),
            .s_axi_BUS_A_ARADDR            (s00_axi_araddr),
            .s_axi_BUS_A_ARVALID        (s00_axi_arvalid),
            .s_axi_BUS_A_ARREADY        (s00_axi_arready),
            .s_axi_BUS_A_RDATA            (s00_axi_rdata),
            .s_axi_BUS_A_RRESP            (s00_axi_rresp),
            .s_axi_BUS_A_RVALID            (s00_axi_rvalid),
            .s_axi_BUS_A_RREADY            (s00_axi_rready),    
            .interrupt                    (interrupt)
	);

	// Add user logic here

	// User logic ends

	endmodule
