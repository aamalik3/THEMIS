
`timescale 1 ns / 1 ps

	module profiler_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 5,

		// Parameters of Axi Slave Bus Interface S01_AXI
		parameter integer C_S01_AXI_DATA_WIDTH	= 32,
		parameter integer C_S01_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
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
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready,

		// Ports of Axi Slave Bus Interface S01_AXI
		input wire  s01_axi_aclk,
		input wire  s01_axi_aresetn,
		input wire [31 : 0] s01_axi_awaddr,
		input wire [2 : 0] s01_axi_awprot,
		input wire  s01_axi_awvalid,
		input wire  s01_axi_awready,
		input wire [C_S01_AXI_DATA_WIDTH-1 : 0] s01_axi_wdata,
		input wire [(C_S01_AXI_DATA_WIDTH/8)-1 : 0] s01_axi_wstrb,
		input wire  s01_axi_wvalid,
		input wire  s01_axi_wready,
		input wire [1 : 0] s01_axi_bresp,
		input wire  s01_axi_bvalid,
		input wire  s01_axi_bready,
		input wire [31: 0] s01_axi_araddr,
		input wire [2 : 0] s01_axi_arprot,
		input wire  s01_axi_arvalid,
		input wire  s01_axi_arready,
		input wire [C_S01_AXI_DATA_WIDTH-1 : 0] s01_axi_rdata,
		input wire [1 : 0] s01_axi_rresp,
		input wire  s01_axi_rvalid,
		input wire  s01_axi_rready
	);
	
	
    wire [31:0] start_address;
    wire [31:0] end_address;
    wire [31:0] restart_counter;
    reg [31:0] counter;
    
// Instantiation of Axi Bus Interface S00_AXI
	profiler_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) profiler_v1_0_S00_AXI_inst (
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready),
        .start_address(start_address),
        .end_address(end_address),
        .restart_counter(restart_counter),
        .counter(counter) 
	);



	// Add user logic here
	reg [1:0] state;
	
	always @( posedge s00_axi_aclk )
    begin
      if ( s00_axi_aresetn == 1'b0 )
        begin
            state <= 2'h0;
            counter <= 32'h0000_0000;
        end 
      else begin
            case ( state )
              2'h0:
              begin
                counter <= 32'h0000_0000;
                if (start_address == s01_axi_awaddr && s01_axi_awvalid && s01_axi_awready)
                    state <= 2'h1;
                else 
                    state <= 2'h0;
              end
              2'h1:
              begin
                if (counter != 32'hFFFF_FFFF)
                  counter <= counter+1;
                if (end_address == s01_axi_araddr && s01_axi_arvalid && s01_axi_arready)
                    state <= 2'h2;
                else 
                    state <= 2'h1;
              end
              2'h2:
              begin
                counter <= counter;
                if (restart_counter == 32'h1)
                    state <= 2'h0;
                else 
                    state <= 2'h2;
              end
             endcase
       end
     end

	// User logic ends

	endmodule
