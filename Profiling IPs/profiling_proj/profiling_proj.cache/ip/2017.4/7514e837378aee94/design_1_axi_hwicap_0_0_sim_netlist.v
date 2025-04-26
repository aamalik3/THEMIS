// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sun Sep  4 19:28:04 2022
// Host        : diomedes running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_axi_hwicap_0_0_sim_netlist.v
// Design      : design_1_axi_hwicap_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder
   (ip2bus_rdack_i_reg,
    p_8_in,
    intr2bus_rdack_reg,
    intr2bus_rdack_reg_0,
    ipif_glbl_irpt_enable_reg_reg,
    s_axi_arready,
    s_axi_wready,
    intr2bus_rdack0,
    irpt_rdack,
    irpt_wrack,
    ip2bus_rdack_i_reg_0,
    ip2bus_wrack_i_reg,
    \ip2bus_data_i_reg[31] ,
    interrupt_wrce_strb,
    \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ,
    IP2Bus_WrAck0,
    IP2Bus_RdAck0,
    D,
    \IP2Bus_Data_reg[31] ,
    p_10_in,
    p_11_in,
    \ip2bus_data_i_reg[0] ,
    ipif_glbl_irpt_enable_reg_reg_0,
    E,
    \sz_i_reg[0] ,
    \ip_irpt_enable_reg_reg[3] ,
    start2,
    s_axi_aclk,
    s_axi_aresetn,
    Q,
    is_read,
    ip2bus_rdack_i,
    is_write_reg,
    ip2bus_wrack_i,
    irpt_rdack_d1,
    IP2Bus_RdAck_reg,
    p_5_out,
    intr2bus_wrack,
    irpt_wrack_d1,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ,
    busip_1,
    ipbus_ack_fifo,
    ipbus_ack,
    p_5_out_0,
    \Size_counter_i3_reg[0] ,
    scndry_vect_out,
    \wr_data_count_i_reg[5] ,
    \rd_dc_i_reg[6] ,
    \cr_i_reg[0] ,
    scndry_out,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ,
    ipif_glbl_irpt_enable_reg,
    \IP2Bus_Data_reg[0] ,
    s_axi_wdata,
    \bus2ip_addr_i_reg[8] ,
    bus2ip_rnw_i);
  output ip2bus_rdack_i_reg;
  output p_8_in;
  output intr2bus_rdack_reg;
  output intr2bus_rdack_reg_0;
  output ipif_glbl_irpt_enable_reg_reg;
  output s_axi_arready;
  output s_axi_wready;
  output intr2bus_rdack0;
  output irpt_rdack;
  output irpt_wrack;
  output ip2bus_rdack_i_reg_0;
  output ip2bus_wrack_i_reg;
  output [0:0]\ip2bus_data_i_reg[31] ;
  output interrupt_wrce_strb;
  output \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ;
  output IP2Bus_WrAck0;
  output IP2Bus_RdAck0;
  output [31:0]D;
  output \IP2Bus_Data_reg[31] ;
  output p_10_in;
  output p_11_in;
  output [0:0]\ip2bus_data_i_reg[0] ;
  output ipif_glbl_irpt_enable_reg_reg_0;
  output [0:0]E;
  output [0:0]\sz_i_reg[0] ;
  output [0:0]\ip_irpt_enable_reg_reg[3] ;
  input start2;
  input s_axi_aclk;
  input s_axi_aresetn;
  input [4:0]Q;
  input is_read;
  input ip2bus_rdack_i;
  input is_write_reg;
  input ip2bus_wrack_i;
  input irpt_rdack_d1;
  input IP2Bus_RdAck_reg;
  input p_5_out;
  input intr2bus_wrack;
  input irpt_wrack_d1;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ;
  input busip_1;
  input ipbus_ack_fifo;
  input ipbus_ack;
  input [31:0]p_5_out_0;
  input [11:0]\Size_counter_i3_reg[0] ;
  input [31:0]scndry_vect_out;
  input [5:0]\wr_data_count_i_reg[5] ;
  input [6:0]\rd_dc_i_reg[6] ;
  input [4:0]\cr_i_reg[0] ;
  input scndry_out;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ;
  input ipif_glbl_irpt_enable_reg;
  input [0:0]\IP2Bus_Data_reg[0] ;
  input [0:0]s_axi_wdata;
  input [6:0]\bus2ip_addr_i_reg[8] ;
  input bus2ip_rnw_i;

  wire Bus_RNW_reg_i_1_n_0;
  wire [31:0]D;
  wire [0:0]E;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ;
  wire \GEN_BKEND_CE_REGISTERS[16].ce_out_i[16]_i_1_n_0 ;
  wire \GEN_BKEND_CE_REGISTERS[17].ce_out_i[17]_i_1_n_0 ;
  wire \GEN_BKEND_CE_REGISTERS[18].ce_out_i[18]_i_1_n_0 ;
  wire \GEN_BKEND_CE_REGISTERS[19].ce_out_i[19]_i_1_n_0 ;
  wire \GEN_BKEND_CE_REGISTERS[20].ce_out_i[20]_i_1_n_0 ;
  wire \GEN_BKEND_CE_REGISTERS[21].ce_out_i[21]_i_1_n_0 ;
  wire \GEN_BKEND_CE_REGISTERS[22].ce_out_i[22]_i_1_n_0 ;
  wire \GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ;
  wire \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_1_n_0 ;
  wire \GEN_BKEND_CE_REGISTERS[8].ce_out_i[8]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ;
  wire \IP2Bus_Data[20]_i_2_n_0 ;
  wire \IP2Bus_Data[20]_i_3_n_0 ;
  wire \IP2Bus_Data[25]_i_2_n_0 ;
  wire \IP2Bus_Data[26]_i_2_n_0 ;
  wire \IP2Bus_Data[26]_i_3_n_0 ;
  wire \IP2Bus_Data[26]_i_4_n_0 ;
  wire \IP2Bus_Data[27]_i_2_n_0 ;
  wire \IP2Bus_Data[27]_i_3_n_0 ;
  wire \IP2Bus_Data[28]_i_2_n_0 ;
  wire \IP2Bus_Data[28]_i_3_n_0 ;
  wire \IP2Bus_Data[29]_i_2_n_0 ;
  wire \IP2Bus_Data[29]_i_3_n_0 ;
  wire \IP2Bus_Data[30]_i_2_n_0 ;
  wire \IP2Bus_Data[30]_i_3_n_0 ;
  wire \IP2Bus_Data[31]_i_2_n_0 ;
  wire \IP2Bus_Data[31]_i_3_n_0 ;
  wire [0:0]\IP2Bus_Data_reg[0] ;
  wire \IP2Bus_Data_reg[31] ;
  wire IP2Bus_RdAck0;
  wire IP2Bus_RdAck_i_2_n_0;
  wire IP2Bus_RdAck_reg;
  wire IP2Bus_WrAck0;
  wire [4:0]Q;
  wire [11:0]\Size_counter_i3_reg[0] ;
  wire [6:0]\bus2ip_addr_i_reg[8] ;
  wire bus2ip_rnw_i;
  wire busip_1;
  wire [4:0]\cr_i_reg[0] ;
  wire cs_ce_clr;
  wire interrupt_wrce_strb;
  wire intr2bus_rdack0;
  wire intr2bus_rdack_reg;
  wire intr2bus_rdack_reg_0;
  wire intr2bus_wrack;
  wire \ip2bus_data_i[0]_i_3_n_0 ;
  wire [0:0]\ip2bus_data_i_reg[0] ;
  wire [0:0]\ip2bus_data_i_reg[31] ;
  wire ip2bus_rdack_i;
  wire ip2bus_rdack_i_i_3_n_0;
  wire ip2bus_rdack_i_i_4_n_0;
  wire ip2bus_rdack_i_i_5_n_0;
  wire ip2bus_rdack_i_i_6_n_0;
  wire ip2bus_rdack_i_reg;
  wire ip2bus_rdack_i_reg_0;
  wire ip2bus_wrack_i;
  wire ip2bus_wrack_i_reg;
  wire [0:0]\ip_irpt_enable_reg_reg[3] ;
  wire ipbus_1_i_2_n_0;
  wire ipbus_ack;
  wire ipbus_ack_fifo;
  wire ipif_glbl_irpt_enable_reg;
  wire ipif_glbl_irpt_enable_reg_reg;
  wire ipif_glbl_irpt_enable_reg_reg_0;
  wire irpt_rdack;
  wire irpt_rdack_d1;
  wire irpt_wrack;
  wire irpt_wrack_d1;
  wire is_read;
  wire is_write_reg;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ;
  wire p_10_in;
  wire p_10_in_0;
  wire p_10_out;
  wire p_11_in;
  wire p_11_in_1;
  wire p_11_out;
  wire p_12_in;
  wire p_12_out;
  wire p_13_in;
  wire p_13_out;
  wire p_14_out;
  wire p_15_in;
  wire p_15_out;
  wire p_17_in;
  wire p_18_in;
  wire p_19_in;
  wire p_1_out;
  wire p_20_in;
  wire p_21_in;
  wire p_22_in;
  wire p_23_in;
  wire p_23_out;
  wire p_24_in;
  wire p_2_in;
  wire p_2_out;
  wire p_3_in;
  wire p_3_out;
  wire p_4_in;
  wire p_4_out;
  wire p_5_in;
  wire p_5_out;
  wire [31:0]p_5_out_0;
  wire p_5_out_2;
  wire p_6_in;
  wire p_6_out;
  wire p_7_out;
  wire p_8_in;
  wire p_9_in;
  wire p_9_out;
  wire pselect_hit_i_0;
  wire pselect_hit_i_1;
  wire [6:0]\rd_dc_i_reg[6] ;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire [0:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wready_INST_0_i_1_n_0;
  wire scndry_out;
  wire [31:0]scndry_vect_out;
  wire start2;
  wire [0:0]\sz_i_reg[0] ;
  wire [5:0]\wr_data_count_i_reg[5] ;

  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Bus_RNW_reg_i_1
       (.I0(bus2ip_rnw_i),
        .I1(start2),
        .I2(ipif_glbl_irpt_enable_reg_reg),
        .O(Bus_RNW_reg_i_1_n_0));
  FDRE Bus_RNW_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Bus_RNW_reg_i_1_n_0),
        .Q(ipif_glbl_irpt_enable_reg_reg),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i[0]_i_1 
       (.I0(pselect_hit_i_1),
        .I1(\bus2ip_addr_i_reg[8] [2]),
        .I2(\bus2ip_addr_i_reg[8] [1]),
        .I3(\bus2ip_addr_i_reg[8] [3]),
        .I4(\bus2ip_addr_i_reg[8] [0]),
        .O(p_15_out));
  FDRE \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_15_out),
        .Q(p_24_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h00400000)) 
    \GEN_BKEND_CE_REGISTERS[10].ce_out_i[10]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [2]),
        .I1(\bus2ip_addr_i_reg[8] [1]),
        .I2(pselect_hit_i_1),
        .I3(\bus2ip_addr_i_reg[8] [0]),
        .I4(\bus2ip_addr_i_reg[8] [3]),
        .O(p_5_out_2));
  FDRE \GEN_BKEND_CE_REGISTERS[10].ce_out_i_reg[10] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_5_out_2),
        .Q(intr2bus_rdack_reg),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    \GEN_BKEND_CE_REGISTERS[11].ce_out_i[11]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [2]),
        .I1(\bus2ip_addr_i_reg[8] [1]),
        .I2(\bus2ip_addr_i_reg[8] [0]),
        .I3(\bus2ip_addr_i_reg[8] [3]),
        .I4(pselect_hit_i_1),
        .O(p_4_out));
  FDRE \GEN_BKEND_CE_REGISTERS[11].ce_out_i_reg[11] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_4_out),
        .Q(p_13_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h00400000)) 
    \GEN_BKEND_CE_REGISTERS[12].ce_out_i[12]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [1]),
        .I1(\bus2ip_addr_i_reg[8] [2]),
        .I2(pselect_hit_i_1),
        .I3(\bus2ip_addr_i_reg[8] [0]),
        .I4(\bus2ip_addr_i_reg[8] [3]),
        .O(p_3_out));
  FDRE \GEN_BKEND_CE_REGISTERS[12].ce_out_i_reg[12] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_3_out),
        .Q(p_12_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    \GEN_BKEND_CE_REGISTERS[13].ce_out_i[13]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [1]),
        .I1(pselect_hit_i_1),
        .I2(\bus2ip_addr_i_reg[8] [0]),
        .I3(\bus2ip_addr_i_reg[8] [3]),
        .I4(\bus2ip_addr_i_reg[8] [2]),
        .O(p_2_out));
  FDRE \GEN_BKEND_CE_REGISTERS[13].ce_out_i_reg[13] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_2_out),
        .Q(p_11_in_1),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    \GEN_BKEND_CE_REGISTERS[14].ce_out_i[14]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [0]),
        .I1(\bus2ip_addr_i_reg[8] [1]),
        .I2(pselect_hit_i_1),
        .I3(\bus2ip_addr_i_reg[8] [3]),
        .I4(\bus2ip_addr_i_reg[8] [2]),
        .O(p_1_out));
  FDRE \GEN_BKEND_CE_REGISTERS[14].ce_out_i_reg[14] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_1_out),
        .Q(p_10_in_0),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \GEN_BKEND_CE_REGISTERS[15].ce_out_i[15]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [3]),
        .I1(\bus2ip_addr_i_reg[8] [1]),
        .I2(\bus2ip_addr_i_reg[8] [0]),
        .I3(pselect_hit_i_1),
        .I4(\bus2ip_addr_i_reg[8] [2]),
        .O(p_23_out));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \GEN_BKEND_CE_REGISTERS[15].ce_out_i[15]_i_2 
       (.I0(\bus2ip_addr_i_reg[8] [4]),
        .I1(\bus2ip_addr_i_reg[8] [6]),
        .I2(start2),
        .I3(\bus2ip_addr_i_reg[8] [5]),
        .O(pselect_hit_i_1));
  FDRE \GEN_BKEND_CE_REGISTERS[15].ce_out_i_reg[15] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_23_out),
        .Q(p_9_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \GEN_BKEND_CE_REGISTERS[16].ce_out_i[16]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [0]),
        .I1(\bus2ip_addr_i_reg[8] [2]),
        .I2(pselect_hit_i_0),
        .I3(\bus2ip_addr_i_reg[8] [1]),
        .O(\GEN_BKEND_CE_REGISTERS[16].ce_out_i[16]_i_1_n_0 ));
  FDRE \GEN_BKEND_CE_REGISTERS[16].ce_out_i_reg[16] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(\GEN_BKEND_CE_REGISTERS[16].ce_out_i[16]_i_1_n_0 ),
        .Q(p_8_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \GEN_BKEND_CE_REGISTERS[17].ce_out_i[17]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [1]),
        .I1(\bus2ip_addr_i_reg[8] [2]),
        .I2(\bus2ip_addr_i_reg[8] [0]),
        .I3(pselect_hit_i_0),
        .O(\GEN_BKEND_CE_REGISTERS[17].ce_out_i[17]_i_1_n_0 ));
  FDRE \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(\GEN_BKEND_CE_REGISTERS[17].ce_out_i[17]_i_1_n_0 ),
        .Q(ip2bus_rdack_i_reg),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \GEN_BKEND_CE_REGISTERS[18].ce_out_i[18]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [0]),
        .I1(\bus2ip_addr_i_reg[8] [2]),
        .I2(\bus2ip_addr_i_reg[8] [1]),
        .I3(pselect_hit_i_0),
        .O(\GEN_BKEND_CE_REGISTERS[18].ce_out_i[18]_i_1_n_0 ));
  FDRE \GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(\GEN_BKEND_CE_REGISTERS[18].ce_out_i[18]_i_1_n_0 ),
        .Q(p_6_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \GEN_BKEND_CE_REGISTERS[19].ce_out_i[19]_i_1 
       (.I0(pselect_hit_i_0),
        .I1(\bus2ip_addr_i_reg[8] [2]),
        .I2(\bus2ip_addr_i_reg[8] [0]),
        .I3(\bus2ip_addr_i_reg[8] [1]),
        .O(\GEN_BKEND_CE_REGISTERS[19].ce_out_i[19]_i_1_n_0 ));
  FDRE \GEN_BKEND_CE_REGISTERS[19].ce_out_i_reg[19] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(\GEN_BKEND_CE_REGISTERS[19].ce_out_i[19]_i_1_n_0 ),
        .Q(p_5_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i[1]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [0]),
        .I1(\bus2ip_addr_i_reg[8] [2]),
        .I2(pselect_hit_i_1),
        .I3(\bus2ip_addr_i_reg[8] [3]),
        .I4(\bus2ip_addr_i_reg[8] [1]),
        .O(p_14_out));
  FDRE \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_14_out),
        .Q(p_23_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \GEN_BKEND_CE_REGISTERS[20].ce_out_i[20]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [0]),
        .I1(\bus2ip_addr_i_reg[8] [1]),
        .I2(pselect_hit_i_0),
        .I3(\bus2ip_addr_i_reg[8] [2]),
        .O(\GEN_BKEND_CE_REGISTERS[20].ce_out_i[20]_i_1_n_0 ));
  FDRE \GEN_BKEND_CE_REGISTERS[20].ce_out_i_reg[20] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(\GEN_BKEND_CE_REGISTERS[20].ce_out_i[20]_i_1_n_0 ),
        .Q(p_4_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \GEN_BKEND_CE_REGISTERS[21].ce_out_i[21]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [2]),
        .I1(\bus2ip_addr_i_reg[8] [1]),
        .I2(\bus2ip_addr_i_reg[8] [0]),
        .I3(pselect_hit_i_0),
        .O(\GEN_BKEND_CE_REGISTERS[21].ce_out_i[21]_i_1_n_0 ));
  FDRE \GEN_BKEND_CE_REGISTERS[21].ce_out_i_reg[21] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(\GEN_BKEND_CE_REGISTERS[21].ce_out_i[21]_i_1_n_0 ),
        .Q(p_3_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \GEN_BKEND_CE_REGISTERS[22].ce_out_i[22]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [2]),
        .I1(\bus2ip_addr_i_reg[8] [0]),
        .I2(pselect_hit_i_0),
        .I3(\bus2ip_addr_i_reg[8] [1]),
        .O(\GEN_BKEND_CE_REGISTERS[22].ce_out_i[22]_i_1_n_0 ));
  FDRE \GEN_BKEND_CE_REGISTERS[22].ce_out_i_reg[22] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(\GEN_BKEND_CE_REGISTERS[22].ce_out_i[22]_i_1_n_0 ),
        .Q(p_2_in),
        .R(cs_ce_clr));
  LUT3 #(
    .INIT(8'hFD)) 
    \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_1 
       (.I0(s_axi_aresetn),
        .I1(s_axi_arready),
        .I2(s_axi_wready),
        .O(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2 
       (.I0(pselect_hit_i_0),
        .I1(\bus2ip_addr_i_reg[8] [2]),
        .I2(\bus2ip_addr_i_reg[8] [0]),
        .I3(\bus2ip_addr_i_reg[8] [1]),
        .O(p_7_out));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_3 
       (.I0(start2),
        .I1(\bus2ip_addr_i_reg[8] [5]),
        .I2(\bus2ip_addr_i_reg[8] [6]),
        .I3(\bus2ip_addr_i_reg[8] [4]),
        .I4(\bus2ip_addr_i_reg[8] [3]),
        .O(pselect_hit_i_0));
  FDRE \GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg[23] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_7_out),
        .Q(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i[2]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [1]),
        .I1(\bus2ip_addr_i_reg[8] [2]),
        .I2(pselect_hit_i_1),
        .I3(\bus2ip_addr_i_reg[8] [3]),
        .I4(\bus2ip_addr_i_reg[8] [0]),
        .O(p_13_out));
  FDRE \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_13_out),
        .Q(p_22_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h00400000)) 
    \GEN_BKEND_CE_REGISTERS[3].ce_out_i[3]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [3]),
        .I1(\bus2ip_addr_i_reg[8] [1]),
        .I2(\bus2ip_addr_i_reg[8] [0]),
        .I3(\bus2ip_addr_i_reg[8] [2]),
        .I4(pselect_hit_i_1),
        .O(p_12_out));
  FDRE \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_12_out),
        .Q(p_21_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \GEN_BKEND_CE_REGISTERS[4].ce_out_i[4]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [2]),
        .I1(\bus2ip_addr_i_reg[8] [0]),
        .I2(pselect_hit_i_1),
        .I3(\bus2ip_addr_i_reg[8] [3]),
        .I4(\bus2ip_addr_i_reg[8] [1]),
        .O(p_11_out));
  FDRE \GEN_BKEND_CE_REGISTERS[4].ce_out_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_11_out),
        .Q(p_20_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h00400000)) 
    \GEN_BKEND_CE_REGISTERS[5].ce_out_i[5]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [3]),
        .I1(\bus2ip_addr_i_reg[8] [2]),
        .I2(\bus2ip_addr_i_reg[8] [0]),
        .I3(\bus2ip_addr_i_reg[8] [1]),
        .I4(pselect_hit_i_1),
        .O(p_10_out));
  FDRE \GEN_BKEND_CE_REGISTERS[5].ce_out_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_10_out),
        .Q(p_19_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h00400000)) 
    \GEN_BKEND_CE_REGISTERS[6].ce_out_i[6]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [3]),
        .I1(\bus2ip_addr_i_reg[8] [1]),
        .I2(\bus2ip_addr_i_reg[8] [2]),
        .I3(\bus2ip_addr_i_reg[8] [0]),
        .I4(pselect_hit_i_1),
        .O(p_9_out));
  FDRE \GEN_BKEND_CE_REGISTERS[6].ce_out_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_9_out),
        .Q(p_18_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [1]),
        .I1(\bus2ip_addr_i_reg[8] [0]),
        .I2(pselect_hit_i_1),
        .I3(\bus2ip_addr_i_reg[8] [2]),
        .I4(\bus2ip_addr_i_reg[8] [3]),
        .O(\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_1_n_0 ));
  FDRE \GEN_BKEND_CE_REGISTERS[7].ce_out_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_1_n_0 ),
        .Q(p_17_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \GEN_BKEND_CE_REGISTERS[8].ce_out_i[8]_i_1 
       (.I0(pselect_hit_i_1),
        .I1(\bus2ip_addr_i_reg[8] [2]),
        .I2(\bus2ip_addr_i_reg[8] [3]),
        .I3(\bus2ip_addr_i_reg[8] [1]),
        .I4(\bus2ip_addr_i_reg[8] [0]),
        .O(\GEN_BKEND_CE_REGISTERS[8].ce_out_i[8]_i_1_n_0 ));
  FDRE \GEN_BKEND_CE_REGISTERS[8].ce_out_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(\GEN_BKEND_CE_REGISTERS[8].ce_out_i[8]_i_1_n_0 ),
        .Q(intr2bus_rdack_reg_0),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h00400000)) 
    \GEN_BKEND_CE_REGISTERS[9].ce_out_i[9]_i_1 
       (.I0(\bus2ip_addr_i_reg[8] [2]),
        .I1(pselect_hit_i_1),
        .I2(\bus2ip_addr_i_reg[8] [0]),
        .I3(\bus2ip_addr_i_reg[8] [1]),
        .I4(\bus2ip_addr_i_reg[8] [3]),
        .O(p_6_out));
  FDRE \GEN_BKEND_CE_REGISTERS[9].ce_out_i_reg[9] 
       (.C(s_axi_aclk),
        .CE(start2),
        .D(p_6_out),
        .Q(p_15_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_3 
       (.I0(ipif_glbl_irpt_enable_reg_reg),
        .I1(irpt_wrack_d1),
        .I2(intr2bus_rdack_reg_0),
        .O(\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[0]_i_1 
       (.I0(p_5_out_0[31]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[31]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[31]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[10]_i_1 
       (.I0(p_5_out_0[21]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[21]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[21]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[11]_i_1 
       (.I0(p_5_out_0[20]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[20]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[20]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[12]_i_1 
       (.I0(p_5_out_0[19]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[19]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[19]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[13]_i_1 
       (.I0(p_5_out_0[18]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[18]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[18]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[14]_i_1 
       (.I0(p_5_out_0[17]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[17]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[17]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[15]_i_1 
       (.I0(p_5_out_0[16]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[16]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[16]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[16]_i_1 
       (.I0(p_5_out_0[15]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[15]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[17]_i_1 
       (.I0(p_5_out_0[14]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[14]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[14]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[18]_i_1 
       (.I0(p_5_out_0[13]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[13]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[13]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[19]_i_1 
       (.I0(p_5_out_0[12]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[12]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[12]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[1]_i_1 
       (.I0(p_5_out_0[30]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[30]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[30]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \IP2Bus_Data[20]_i_1 
       (.I0(\IP2Bus_Data[20]_i_2_n_0 ),
        .I1(scndry_vect_out[11]),
        .I2(\IP2Bus_Data[20]_i_3_n_0 ),
        .I3(\Size_counter_i3_reg[0] [11]),
        .I4(p_5_out_0[11]),
        .I5(\IP2Bus_Data_reg[31] ),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \IP2Bus_Data[20]_i_2 
       (.I0(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I1(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data[20]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \IP2Bus_Data[20]_i_3 
       (.I0(p_6_in),
        .I1(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data[20]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \IP2Bus_Data[21]_i_1 
       (.I0(\IP2Bus_Data[20]_i_2_n_0 ),
        .I1(scndry_vect_out[10]),
        .I2(\IP2Bus_Data[20]_i_3_n_0 ),
        .I3(\Size_counter_i3_reg[0] [10]),
        .I4(p_5_out_0[10]),
        .I5(\IP2Bus_Data_reg[31] ),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \IP2Bus_Data[22]_i_1 
       (.I0(\IP2Bus_Data[20]_i_2_n_0 ),
        .I1(scndry_vect_out[9]),
        .I2(\IP2Bus_Data[20]_i_3_n_0 ),
        .I3(\Size_counter_i3_reg[0] [9]),
        .I4(p_5_out_0[9]),
        .I5(\IP2Bus_Data_reg[31] ),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \IP2Bus_Data[23]_i_1 
       (.I0(\IP2Bus_Data[20]_i_2_n_0 ),
        .I1(scndry_vect_out[8]),
        .I2(\IP2Bus_Data[20]_i_3_n_0 ),
        .I3(\Size_counter_i3_reg[0] [8]),
        .I4(p_5_out_0[8]),
        .I5(\IP2Bus_Data_reg[31] ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \IP2Bus_Data[24]_i_1 
       (.I0(\IP2Bus_Data[20]_i_2_n_0 ),
        .I1(scndry_vect_out[7]),
        .I2(\IP2Bus_Data[20]_i_3_n_0 ),
        .I3(\Size_counter_i3_reg[0] [7]),
        .I4(p_5_out_0[7]),
        .I5(\IP2Bus_Data_reg[31] ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFFF0808080)) 
    \IP2Bus_Data[25]_i_1 
       (.I0(p_5_out_0[6]),
        .I1(ip2bus_rdack_i_reg),
        .I2(ipif_glbl_irpt_enable_reg_reg),
        .I3(p_6_in),
        .I4(\Size_counter_i3_reg[0] [6]),
        .I5(\IP2Bus_Data[25]_i_2_n_0 ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[25]_i_2 
       (.I0(\rd_dc_i_reg[6] [6]),
        .I1(p_2_in),
        .I2(scndry_vect_out[6]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAAAAAAAAA)) 
    \IP2Bus_Data[26]_i_1 
       (.I0(\IP2Bus_Data[26]_i_2_n_0 ),
        .I1(p_6_in),
        .I2(\Size_counter_i3_reg[0] [5]),
        .I3(p_5_out_0[5]),
        .I4(ip2bus_rdack_i_reg),
        .I5(ipif_glbl_irpt_enable_reg_reg),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \IP2Bus_Data[26]_i_2 
       (.I0(\IP2Bus_Data[26]_i_3_n_0 ),
        .I1(\wr_data_count_i_reg[5] [5]),
        .I2(\IP2Bus_Data[20]_i_2_n_0 ),
        .I3(scndry_vect_out[5]),
        .I4(\rd_dc_i_reg[6] [5]),
        .I5(\IP2Bus_Data[26]_i_4_n_0 ),
        .O(\IP2Bus_Data[26]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \IP2Bus_Data[26]_i_3 
       (.I0(p_3_in),
        .I1(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data[26]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \IP2Bus_Data[26]_i_4 
       (.I0(p_2_in),
        .I1(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data[26]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF8F8F8)) 
    \IP2Bus_Data[27]_i_1 
       (.I0(\IP2Bus_Data_reg[31] ),
        .I1(p_5_out_0[4]),
        .I2(\IP2Bus_Data[27]_i_2_n_0 ),
        .I3(\IP2Bus_Data[20]_i_2_n_0 ),
        .I4(scndry_vect_out[4]),
        .I5(\IP2Bus_Data[27]_i_3_n_0 ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[27]_i_2 
       (.I0(\Size_counter_i3_reg[0] [4]),
        .I1(p_6_in),
        .I2(\rd_dc_i_reg[6] [4]),
        .I3(p_2_in),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data[27]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'hF4440000)) 
    \IP2Bus_Data[27]_i_3 
       (.I0(\wr_data_count_i_reg[5] [4]),
        .I1(p_3_in),
        .I2(\cr_i_reg[0] [4]),
        .I3(p_5_in),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data[27]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF8F8F8)) 
    \IP2Bus_Data[28]_i_1 
       (.I0(\IP2Bus_Data_reg[31] ),
        .I1(p_5_out_0[3]),
        .I2(\IP2Bus_Data[28]_i_2_n_0 ),
        .I3(\IP2Bus_Data[20]_i_2_n_0 ),
        .I4(scndry_vect_out[3]),
        .I5(\IP2Bus_Data[28]_i_3_n_0 ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[28]_i_2 
       (.I0(\Size_counter_i3_reg[0] [3]),
        .I1(p_6_in),
        .I2(\rd_dc_i_reg[6] [3]),
        .I3(p_2_in),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data[28]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'hF4440000)) 
    \IP2Bus_Data[28]_i_3 
       (.I0(\wr_data_count_i_reg[5] [3]),
        .I1(p_3_in),
        .I2(\cr_i_reg[0] [3]),
        .I3(p_5_in),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEAFFEAFFEA)) 
    \IP2Bus_Data[29]_i_1 
       (.I0(\IP2Bus_Data[29]_i_2_n_0 ),
        .I1(\IP2Bus_Data_reg[31] ),
        .I2(p_5_out_0[2]),
        .I3(\IP2Bus_Data[29]_i_3_n_0 ),
        .I4(\IP2Bus_Data[20]_i_3_n_0 ),
        .I5(\Size_counter_i3_reg[0] [2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \IP2Bus_Data[29]_i_2 
       (.I0(\IP2Bus_Data[26]_i_3_n_0 ),
        .I1(\wr_data_count_i_reg[5] [2]),
        .I2(\IP2Bus_Data[20]_i_2_n_0 ),
        .I3(scndry_vect_out[2]),
        .I4(\rd_dc_i_reg[6] [2]),
        .I5(\IP2Bus_Data[26]_i_4_n_0 ),
        .O(\IP2Bus_Data[29]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[29]_i_3 
       (.I0(\cr_i_reg[0] [2]),
        .I1(p_5_in),
        .I2(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ),
        .I3(p_4_in),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data[29]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[2]_i_1 
       (.I0(p_5_out_0[29]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[29]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[29]));
  LUT6 #(
    .INIT(64'hFFFFFFEAFFEAFFEA)) 
    \IP2Bus_Data[30]_i_1 
       (.I0(\IP2Bus_Data[30]_i_2_n_0 ),
        .I1(\IP2Bus_Data_reg[31] ),
        .I2(p_5_out_0[1]),
        .I3(\IP2Bus_Data[30]_i_3_n_0 ),
        .I4(\IP2Bus_Data[20]_i_3_n_0 ),
        .I5(\Size_counter_i3_reg[0] [1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \IP2Bus_Data[30]_i_2 
       (.I0(\IP2Bus_Data[26]_i_3_n_0 ),
        .I1(\wr_data_count_i_reg[5] [1]),
        .I2(\IP2Bus_Data[20]_i_2_n_0 ),
        .I3(scndry_vect_out[1]),
        .I4(\rd_dc_i_reg[6] [1]),
        .I5(\IP2Bus_Data[26]_i_4_n_0 ),
        .O(\IP2Bus_Data[30]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[30]_i_3 
       (.I0(\cr_i_reg[0] [1]),
        .I1(p_5_in),
        .I2(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .I3(p_4_in),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEAFFEAFFEA)) 
    \IP2Bus_Data[31]_i_1 
       (.I0(\IP2Bus_Data[31]_i_2_n_0 ),
        .I1(\IP2Bus_Data_reg[31] ),
        .I2(p_5_out_0[0]),
        .I3(\IP2Bus_Data[31]_i_3_n_0 ),
        .I4(\IP2Bus_Data[20]_i_3_n_0 ),
        .I5(\Size_counter_i3_reg[0] [0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \IP2Bus_Data[31]_i_2 
       (.I0(\IP2Bus_Data[26]_i_3_n_0 ),
        .I1(\wr_data_count_i_reg[5] [0]),
        .I2(\IP2Bus_Data[20]_i_2_n_0 ),
        .I3(scndry_vect_out[0]),
        .I4(\rd_dc_i_reg[6] [0]),
        .I5(\IP2Bus_Data[26]_i_4_n_0 ),
        .O(\IP2Bus_Data[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[31]_i_3 
       (.I0(\cr_i_reg[0] [0]),
        .I1(p_5_in),
        .I2(scndry_out),
        .I3(p_4_in),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[3]_i_1 
       (.I0(p_5_out_0[28]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[28]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[28]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[4]_i_1 
       (.I0(p_5_out_0[27]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[27]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[27]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[5]_i_1 
       (.I0(p_5_out_0[26]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[26]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[26]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[6]_i_1 
       (.I0(p_5_out_0[25]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[25]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[25]));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[7]_i_1 
       (.I0(p_5_out_0[24]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[24]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[24]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[8]_i_1 
       (.I0(p_5_out_0[23]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[23]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[23]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'hF8880000)) 
    \IP2Bus_Data[9]_i_1 
       (.I0(p_5_out_0[22]),
        .I1(ip2bus_rdack_i_reg),
        .I2(scndry_vect_out[22]),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(D[22]));
  LUT6 #(
    .INIT(64'hFFEAC0C000000000)) 
    IP2Bus_RdAck_i_1
       (.I0(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I1(ip2bus_rdack_i_reg),
        .I2(ipbus_ack_fifo),
        .I3(IP2Bus_RdAck_i_2_n_0),
        .I4(ipbus_ack),
        .I5(ipif_glbl_irpt_enable_reg_reg),
        .O(IP2Bus_RdAck0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    IP2Bus_RdAck_i_2
       (.I0(p_6_in),
        .I1(p_3_in),
        .I2(p_2_in),
        .I3(p_4_in),
        .I4(p_5_in),
        .O(IP2Bus_RdAck_i_2_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAFFFE)) 
    IP2Bus_WrAck_i_1
       (.I0(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ),
        .I1(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I2(ip2bus_rdack_i_reg),
        .I3(IP2Bus_RdAck_i_2_n_0),
        .I4(busip_1),
        .I5(ipif_glbl_irpt_enable_reg_reg),
        .O(IP2Bus_WrAck0));
  LUT4 #(
    .INIT(16'h00FE)) 
    busip_1_i_1
       (.I0(ipbus_1_i_2_n_0),
        .I1(ip2bus_rdack_i_reg),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I3(ipif_glbl_irpt_enable_reg_reg),
        .O(p_11_in));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cr_i[0]_i_2 
       (.I0(p_5_in),
        .I1(ipif_glbl_irpt_enable_reg_reg),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h44444440)) 
    intr2bus_rdack_i_1
       (.I0(irpt_rdack_d1),
        .I1(ipif_glbl_irpt_enable_reg_reg),
        .I2(p_17_in),
        .I3(intr2bus_rdack_reg_0),
        .I4(intr2bus_rdack_reg),
        .O(intr2bus_rdack0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h000000FE)) 
    intr2bus_wrack_i_1
       (.I0(p_17_in),
        .I1(intr2bus_rdack_reg_0),
        .I2(intr2bus_rdack_reg),
        .I3(ipif_glbl_irpt_enable_reg_reg),
        .I4(irpt_wrack_d1),
        .O(interrupt_wrce_strb));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \ip2bus_data_i[0]_i_1 
       (.I0(s_axi_aresetn),
        .I1(ipif_glbl_irpt_enable_reg_reg),
        .I2(\ip2bus_data_i[0]_i_3_n_0 ),
        .O(\ip2bus_data_i_reg[31] ));
  LUT5 #(
    .INIT(32'hFFFF1000)) 
    \ip2bus_data_i[0]_i_2 
       (.I0(intr2bus_rdack_reg_0),
        .I1(intr2bus_rdack_reg),
        .I2(p_17_in),
        .I3(ipif_glbl_irpt_enable_reg),
        .I4(\IP2Bus_Data_reg[0] ),
        .O(\ip2bus_data_i_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \ip2bus_data_i[0]_i_3 
       (.I0(ip2bus_rdack_i_i_3_n_0),
        .I1(ipbus_1_i_2_n_0),
        .I2(ip2bus_rdack_i_reg),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .O(\ip2bus_data_i[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF000000FE000000)) 
    ip2bus_rdack_i_i_1
       (.I0(ip2bus_rdack_i_reg),
        .I1(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .I2(ipbus_1_i_2_n_0),
        .I3(IP2Bus_RdAck_reg),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .I5(ip2bus_rdack_i_i_3_n_0),
        .O(ip2bus_rdack_i_reg_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    ip2bus_rdack_i_i_3
       (.I0(ip2bus_rdack_i_i_4_n_0),
        .I1(ip2bus_rdack_i_i_5_n_0),
        .I2(p_9_in),
        .I3(p_10_in_0),
        .I4(p_24_in),
        .I5(ip2bus_rdack_i_i_6_n_0),
        .O(ip2bus_rdack_i_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    ip2bus_rdack_i_i_4
       (.I0(p_20_in),
        .I1(p_21_in),
        .I2(p_18_in),
        .I3(p_19_in),
        .O(ip2bus_rdack_i_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    ip2bus_rdack_i_i_5
       (.I0(p_22_in),
        .I1(p_23_in),
        .I2(p_17_in),
        .I3(intr2bus_rdack_reg_0),
        .I4(intr2bus_rdack_reg),
        .O(ip2bus_rdack_i_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    ip2bus_rdack_i_i_6
       (.I0(p_13_in),
        .I1(p_15_in),
        .I2(p_11_in_1),
        .I3(p_12_in),
        .O(ip2bus_rdack_i_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h0000A800)) 
    ip2bus_wrack_i_i_1
       (.I0(\ip2bus_data_i[0]_i_3_n_0 ),
        .I1(p_5_out),
        .I2(intr2bus_wrack),
        .I3(s_axi_aresetn),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .O(ip2bus_wrack_i_reg));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ip_irpt_enable_reg[3]_i_1 
       (.I0(intr2bus_rdack_reg),
        .I1(ipif_glbl_irpt_enable_reg_reg),
        .O(\ip_irpt_enable_reg_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'hF0E0)) 
    ipbus_1_i_1
       (.I0(ipbus_1_i_2_n_0),
        .I1(ip2bus_rdack_i_reg),
        .I2(ipif_glbl_irpt_enable_reg_reg),
        .I3(\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg_n_0_[23] ),
        .O(p_10_in));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    ipbus_1_i_2
       (.I0(p_5_in),
        .I1(p_4_in),
        .I2(p_2_in),
        .I3(p_3_in),
        .I4(p_6_in),
        .I5(p_8_in),
        .O(ipbus_1_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    ipif_glbl_irpt_enable_reg_i_1
       (.I0(s_axi_wdata),
        .I1(p_17_in),
        .I2(ipif_glbl_irpt_enable_reg_reg),
        .I3(ipif_glbl_irpt_enable_reg),
        .O(ipif_glbl_irpt_enable_reg_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    irpt_rdack_d1_i_1
       (.I0(p_17_in),
        .I1(intr2bus_rdack_reg_0),
        .I2(intr2bus_rdack_reg),
        .I3(ipif_glbl_irpt_enable_reg_reg),
        .O(irpt_rdack));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h00FE)) 
    irpt_wrack_d1_i_1
       (.I0(p_17_in),
        .I1(intr2bus_rdack_reg_0),
        .I2(intr2bus_rdack_reg),
        .I3(ipif_glbl_irpt_enable_reg_reg),
        .O(irpt_wrack));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    ram_empty_i_i_3__0
       (.I0(ip2bus_rdack_i_reg),
        .I1(ipif_glbl_irpt_enable_reg_reg),
        .O(\IP2Bus_Data_reg[31] ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000020)) 
    s_axi_arready_INST_0
       (.I0(s_axi_wready_INST_0_i_1_n_0),
        .I1(Q[0]),
        .I2(is_read),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(ip2bus_rdack_i),
        .O(s_axi_arready));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000020)) 
    s_axi_wready_INST_0
       (.I0(s_axi_wready_INST_0_i_1_n_0),
        .I1(Q[0]),
        .I2(is_write_reg),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(ip2bus_wrack_i),
        .O(s_axi_wready));
  LUT2 #(
    .INIT(4'h2)) 
    s_axi_wready_INST_0_i_1
       (.I0(Q[4]),
        .I1(Q[3]),
        .O(s_axi_wready_INST_0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \sz_i[0]_i_2 
       (.I0(p_6_in),
        .I1(ipif_glbl_irpt_enable_reg_reg),
        .O(\sz_i_reg[0] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_fifo_fg
   (\syncstages_ff_reg[0] ,
    D,
    prmry_in,
    ENA_dly_D,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ,
    ram_full_fb_i_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ,
    \SAFETY_CKT_GEN.POR_B_reg ,
    src_rst,
    s_axi_aclk,
    ram_rstram_b,
    s_axi_wdata,
    POR_B,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ,
    wrfifo_rden,
    sw_reset_reg,
    p_8_in,
    Bus_RNW_reg,
    busip_1,
    Bus_RNW_reg_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 );
  output \syncstages_ff_reg[0] ;
  output [31:0]D;
  output prmry_in;
  output ENA_dly_D;
  output [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  output ram_full_fb_i_reg;
  output \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  input src_rst;
  input s_axi_aclk;
  input ram_rstram_b;
  input [31:0]s_axi_wdata;
  input POR_B;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  input wrfifo_rden;
  input sw_reset_reg;
  input p_8_in;
  input Bus_RNW_reg;
  input busip_1;
  input Bus_RNW_reg_reg;
  input \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire [31:0]D;
  wire ENA_dly_D;
  wire [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  wire POR_B;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  wire busip_1;
  wire p_8_in;
  wire prmry_in;
  wire ram_full_fb_i_reg;
  wire ram_rstram_b;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;
  wire src_rst;
  wire sw_reset_reg;
  wire \syncstages_ff_reg[0] ;
  wire wrfifo_rden;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_1 \lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .D(D),
        .ENA_dly_D(ENA_dly_D),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ),
        .POR_B(POR_B),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ),
        .SS(\syncstages_ff_reg[0] ),
        .busip_1(busip_1),
        .out(prmry_in),
        .p_8_in(p_8_in),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata),
        .src_rst(src_rst),
        .sw_reset_reg(sw_reset_reg),
        .wrfifo_rden(wrfifo_rden));
endmodule

(* ORIG_REF_NAME = "async_fifo_fg" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_fifo_fg__parameterized0
   (src_rst,
    p_5_out_0,
    POR_B,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstram_b,
    prmry_in,
    ipbus_ack,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ,
    gate_signal_p_reg,
    s_axi_aclk,
    Q,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    rdfifo_wren,
    ENA_dly_D,
    \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ,
    p_7_in,
    Bus_RNW_reg,
    ipbus_2,
    ipbus_1,
    sw_reset_reg,
    fifo_rst,
    abort_onreset,
    Bus_RNW_reg_reg,
    s_axi_wdata,
    p_1_in5_in,
    gate_signal_p_reg_0);
  output src_rst;
  output [31:0]p_5_out_0;
  output POR_B;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  output ram_rstram_b;
  output prmry_in;
  output ipbus_ack;
  output \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  output [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  output gate_signal_p_reg;
  input s_axi_aclk;
  input [31:0]Q;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input rdfifo_wren;
  input ENA_dly_D;
  input \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  input p_7_in;
  input Bus_RNW_reg;
  input ipbus_2;
  input ipbus_1;
  input sw_reset_reg;
  input fifo_rst;
  input abort_onreset;
  input Bus_RNW_reg_reg;
  input [0:0]s_axi_wdata;
  input p_1_in5_in;
  input gate_signal_p_reg_0;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire ENA_dly_D;
  wire \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  wire \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  wire [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  wire POR_B;
  wire [31:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  wire abort_onreset;
  wire fifo_rst;
  wire gate_signal_p_reg;
  wire gate_signal_p_reg_0;
  wire ipbus_1;
  wire ipbus_2;
  wire ipbus_ack;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire p_1_in5_in;
  wire [31:0]p_5_out_0;
  wire p_7_in;
  wire prmry_in;
  wire ram_rstram_b;
  wire rdfifo_wren;
  wire s_axi_aclk;
  wire [0:0]s_axi_wdata;
  wire src_rst;
  wire sw_reset_reg;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_1__parameterized0 \lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .ENA_dly_D(ENA_dly_D),
        .\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] (\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ),
        .abort_onreset(abort_onreset),
        .fifo_rst(fifo_rst),
        .gate_signal_p_reg(gate_signal_p_reg),
        .gate_signal_p_reg_0(gate_signal_p_reg_0),
        .ipbus_1(ipbus_1),
        .ipbus_2(ipbus_2),
        .ipbus_ack(ipbus_ack),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .p_1_in5_in(p_1_in5_in),
        .p_5_out_0(p_5_out_0),
        .p_7_in(p_7_in),
        .prmry_in(prmry_in),
        .ram_rstram_b(ram_rstram_b),
        .rdfifo_wren(rdfifo_wren),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata),
        .src_rst(src_rst),
        .sw_reset_reg(sw_reset_reg));
endmodule

(* C_BRAM_SRL_FIFO_TYPE = "1" *) (* C_DEVICE_ID = "69353619" *) (* C_ENABLE_ASYNC = "0" *) 
(* C_FAMILY = "zynq" *) (* C_ICAP_EXTERNAL = "0" *) (* C_ICAP_WIDTH_S = "X32" *) 
(* C_INCLUDE_STARTUP = "0" *) (* C_MODE = "0" *) (* C_NOREAD = "0" *) 
(* C_OPERATION = "0" *) (* C_READ_FIFO_DEPTH = "128" *) (* C_SHARED_STARTUP = "0" *) 
(* C_SIMULATION = "2" *) (* C_S_AXI_ADDR_WIDTH = "9" *) (* C_S_AXI_DATA_WIDTH = "32" *) 
(* C_WRITE_FIFO_DEPTH = "64" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_hwicap
   (icap_clk,
    eos_in,
    s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    ip2intc_irpt,
    cfgclk,
    cfgmclk,
    preq,
    clk,
    gsr,
    gts,
    keyclearb,
    pack,
    usrcclko,
    usrcclkts,
    usrdoneo,
    usrdonets,
    icap_i,
    icap_o,
    icap_csib,
    icap_rdwrb,
    cap_req,
    cap_gnt,
    cap_rel,
    icap_avail);
  input icap_clk;
  input eos_in;
  input s_axi_aclk;
  input s_axi_aresetn;
  input [8:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [8:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  output ip2intc_irpt;
  output cfgclk;
  output cfgmclk;
  output preq;
  input clk;
  input gsr;
  input gts;
  input keyclearb;
  input pack;
  input usrcclko;
  input usrcclkts;
  input usrdoneo;
  input usrdonets;
  input [31:0]icap_i;
  output [31:0]icap_o;
  output icap_csib;
  output icap_rdwrb;
  output cap_req;
  input cap_gnt;
  input cap_rel;
  input icap_avail;

  wire \<const0> ;
  wire \ICAP_NOT_SHARED.HWICAP_CTRL_I_n_35 ;
  wire \ICAP_NOT_SHARED.HWICAP_CTRL_I_n_36 ;
  wire \ICAP_NOT_SHARED.HWICAP_CTRL_I_n_37 ;
  wire \ICAP_NOT_SHARED.HWICAP_CTRL_I_n_38 ;
  wire \ICAP_NOT_SHARED.HWICAP_CTRL_I_n_49 ;
  wire \ICAP_NOT_SHARED.HWICAP_CTRL_I_n_50 ;
  wire \ICAP_NOT_SHARED.HWICAP_CTRL_I_n_51 ;
  wire \ICAP_NOT_SHARED.HWICAP_CTRL_I_n_52 ;
  wire \ICAP_NOT_SHARED.HWICAP_CTRL_I_n_60 ;
  wire \ICAP_NOT_SHARED.HWICAP_CTRL_I_n_61 ;
  wire INTERRUPT_CONTROL_I_n_1;
  wire INTERRUPT_CONTROL_I_n_10;
  wire INTERRUPT_CONTROL_I_n_11;
  wire INTERRUPT_CONTROL_I_n_12;
  wire INTERRUPT_CONTROL_I_n_13;
  wire \IPIC_IF_I/IP2Bus_RdAck0 ;
  wire \IPIC_IF_I/IP2Bus_WrAck0 ;
  wire [0:11]\IPIC_IF_I/Size_counter_i3 ;
  wire \IPIC_IF_I/busip_1 ;
  wire \IPIC_IF_I/eos_status_i2 ;
  wire \IPIC_IF_I/hang_status_i2 ;
  wire \IPIC_IF_I/ipbus_ack ;
  wire \IPIC_IF_I/ipbus_ack_fifo ;
  wire \IPIC_IF_I/p_0_in9_in ;
  wire \IPIC_IF_I/p_10_in ;
  wire \IPIC_IF_I/p_11_in ;
  wire [31:0]\IPIC_IF_I/p_5_out ;
  wire [0:6]\IPIC_IF_I/rd_occy_i ;
  wire \IPIC_IF_I/send_done_icap2bus ;
  wire [0:31]\IPIC_IF_I/sr_icap2bus_3 ;
  wire \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg ;
  wire \I_SLAVE_ATTACHMENT/I_DECODER/p_14_in ;
  wire \I_SLAVE_ATTACHMENT/I_DECODER/p_16_in ;
  wire \I_SLAVE_ATTACHMENT/I_DECODER/p_7_in ;
  wire \I_SLAVE_ATTACHMENT/I_DECODER/p_8_in ;
  wire XI4_LITE_I_n_12;
  wire XI4_LITE_I_n_13;
  wire XI4_LITE_I_n_14;
  wire XI4_LITE_I_n_16;
  wire XI4_LITE_I_n_19;
  wire XI4_LITE_I_n_20;
  wire XI4_LITE_I_n_21;
  wire XI4_LITE_I_n_22;
  wire XI4_LITE_I_n_23;
  wire XI4_LITE_I_n_24;
  wire XI4_LITE_I_n_25;
  wire XI4_LITE_I_n_26;
  wire XI4_LITE_I_n_27;
  wire XI4_LITE_I_n_28;
  wire XI4_LITE_I_n_29;
  wire XI4_LITE_I_n_30;
  wire XI4_LITE_I_n_31;
  wire XI4_LITE_I_n_32;
  wire XI4_LITE_I_n_33;
  wire XI4_LITE_I_n_34;
  wire XI4_LITE_I_n_35;
  wire XI4_LITE_I_n_36;
  wire XI4_LITE_I_n_37;
  wire XI4_LITE_I_n_38;
  wire XI4_LITE_I_n_39;
  wire XI4_LITE_I_n_40;
  wire XI4_LITE_I_n_41;
  wire XI4_LITE_I_n_42;
  wire XI4_LITE_I_n_43;
  wire XI4_LITE_I_n_44;
  wire XI4_LITE_I_n_45;
  wire XI4_LITE_I_n_46;
  wire XI4_LITE_I_n_47;
  wire XI4_LITE_I_n_48;
  wire XI4_LITE_I_n_49;
  wire XI4_LITE_I_n_50;
  wire XI4_LITE_I_n_51;
  wire XI4_LITE_I_n_54;
  wire XI4_LITE_I_n_55;
  wire XI4_LITE_I_n_56;
  wire XI4_LITE_I_n_57;
  wire XI4_LITE_I_n_58;
  wire bus2ip_reset;
  wire eos_in;
  wire interrupt_wrce_strb;
  wire intr2bus_rdack;
  wire intr2bus_rdack0;
  wire intr2bus_wrack;
  wire intr_rst;
  wire [0:31]ip2bus_data_i;
  wire ip2bus_rdack_i;
  wire ip2bus_wrack_i;
  wire ip2intc_irpt;
  wire ipif_glbl_irpt_enable_reg;
  wire irpt_rdack;
  wire irpt_rdack_d1;
  wire irpt_wrack;
  wire irpt_wrack_d1;
  wire p_1_in;
  wire p_1_in2_in;
  wire p_1_in5_in;
  wire p_5_out;
  wire [0:31]p_8_out;
  wire s_axi_aclk;
  wire [8:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [8:0]s_axi_awaddr;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire [5:0]wr_data_count_i;

  assign cap_req = \<const0> ;
  assign cfgclk = \<const0> ;
  assign cfgmclk = \<const0> ;
  assign icap_csib = \<const0> ;
  assign icap_o[31] = \<const0> ;
  assign icap_o[30] = \<const0> ;
  assign icap_o[29] = \<const0> ;
  assign icap_o[28] = \<const0> ;
  assign icap_o[27] = \<const0> ;
  assign icap_o[26] = \<const0> ;
  assign icap_o[25] = \<const0> ;
  assign icap_o[24] = \<const0> ;
  assign icap_o[23] = \<const0> ;
  assign icap_o[22] = \<const0> ;
  assign icap_o[21] = \<const0> ;
  assign icap_o[20] = \<const0> ;
  assign icap_o[19] = \<const0> ;
  assign icap_o[18] = \<const0> ;
  assign icap_o[17] = \<const0> ;
  assign icap_o[16] = \<const0> ;
  assign icap_o[15] = \<const0> ;
  assign icap_o[14] = \<const0> ;
  assign icap_o[13] = \<const0> ;
  assign icap_o[12] = \<const0> ;
  assign icap_o[11] = \<const0> ;
  assign icap_o[10] = \<const0> ;
  assign icap_o[9] = \<const0> ;
  assign icap_o[8] = \<const0> ;
  assign icap_o[7] = \<const0> ;
  assign icap_o[6] = \<const0> ;
  assign icap_o[5] = \<const0> ;
  assign icap_o[4] = \<const0> ;
  assign icap_o[3] = \<const0> ;
  assign icap_o[2] = \<const0> ;
  assign icap_o[1] = \<const0> ;
  assign icap_o[0] = \<const0> ;
  assign icap_rdwrb = \<const0> ;
  assign preq = \<const0> ;
  assign s_axi_awready = s_axi_wready;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hwicap \ICAP_NOT_SHARED.HWICAP_CTRL_I 
       (.Bus_RNW_reg(\I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg ),
        .Bus_RNW_reg_reg(XI4_LITE_I_n_16),
        .D({XI4_LITE_I_n_19,XI4_LITE_I_n_20,XI4_LITE_I_n_21,XI4_LITE_I_n_22,XI4_LITE_I_n_23,XI4_LITE_I_n_24,XI4_LITE_I_n_25,XI4_LITE_I_n_26,XI4_LITE_I_n_27,XI4_LITE_I_n_28,XI4_LITE_I_n_29,XI4_LITE_I_n_30,XI4_LITE_I_n_31,XI4_LITE_I_n_32,XI4_LITE_I_n_33,XI4_LITE_I_n_34,XI4_LITE_I_n_35,XI4_LITE_I_n_36,XI4_LITE_I_n_37,XI4_LITE_I_n_38,XI4_LITE_I_n_39,XI4_LITE_I_n_40,XI4_LITE_I_n_41,XI4_LITE_I_n_42,XI4_LITE_I_n_43,XI4_LITE_I_n_44,XI4_LITE_I_n_45,XI4_LITE_I_n_46,XI4_LITE_I_n_47,XI4_LITE_I_n_48,XI4_LITE_I_n_49,XI4_LITE_I_n_50}),
        .E(XI4_LITE_I_n_56),
        .\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] (XI4_LITE_I_n_51),
        .\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] (XI4_LITE_I_n_57),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] (wr_data_count_i),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 (\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_51 ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 (INTERRUPT_CONTROL_I_n_1),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] (\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_52 ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ({\IPIC_IF_I/rd_occy_i [0],\IPIC_IF_I/rd_occy_i [1],\IPIC_IF_I/rd_occy_i [2],\IPIC_IF_I/rd_occy_i [3],\IPIC_IF_I/rd_occy_i [4],\IPIC_IF_I/rd_occy_i [5],\IPIC_IF_I/rd_occy_i [6]}),
        .\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] (\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_60 ),
        .\GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3] (\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_61 ),
        .\IP2Bus_Data_reg[20] ({\IPIC_IF_I/Size_counter_i3 [0],\IPIC_IF_I/Size_counter_i3 [1],\IPIC_IF_I/Size_counter_i3 [2],\IPIC_IF_I/Size_counter_i3 [3],\IPIC_IF_I/Size_counter_i3 [4],\IPIC_IF_I/Size_counter_i3 [5],\IPIC_IF_I/Size_counter_i3 [6],\IPIC_IF_I/Size_counter_i3 [7],\IPIC_IF_I/Size_counter_i3 [8],\IPIC_IF_I/Size_counter_i3 [9],\IPIC_IF_I/Size_counter_i3 [10],\IPIC_IF_I/Size_counter_i3 [11]}),
        .\IP2Bus_Data_reg[29] (\IPIC_IF_I/eos_status_i2 ),
        .\IP2Bus_Data_reg[30] (\IPIC_IF_I/hang_status_i2 ),
        .IP2Bus_RdAck0(\IPIC_IF_I/IP2Bus_RdAck0 ),
        .IP2Bus_WrAck0(\IPIC_IF_I/IP2Bus_WrAck0 ),
        .Q({\IPIC_IF_I/p_0_in9_in ,\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_35 ,\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_36 ,\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_37 ,\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_38 }),
        .SR(bus2ip_reset),
        .busip_1(\IPIC_IF_I/busip_1 ),
        .eos_in(eos_in),
        .intr2bus_rdack(intr2bus_rdack),
        .intr_rst(intr_rst),
        .\ip2bus_data_i_reg[0] ({p_8_out[0],p_8_out[1],p_8_out[2],p_8_out[3],p_8_out[4],p_8_out[5],p_8_out[6],p_8_out[7],p_8_out[8],p_8_out[9],p_8_out[10],p_8_out[11],p_8_out[12],p_8_out[13],p_8_out[14],p_8_out[15],p_8_out[16],p_8_out[17],p_8_out[18],p_8_out[19],p_8_out[20],p_8_out[21],p_8_out[22],p_8_out[23],p_8_out[24],p_8_out[25],p_8_out[26],p_8_out[27],p_8_out[28],p_8_out[29],p_8_out[30],p_8_out[31]}),
        .ip2bus_rdack_i_reg(\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_50 ),
        .ipbus_ack(\IPIC_IF_I/ipbus_ack ),
        .ipbus_ack_fifo(\IPIC_IF_I/ipbus_ack_fifo ),
        .p_10_in(\IPIC_IF_I/p_10_in ),
        .p_11_in(\IPIC_IF_I/p_11_in ),
        .p_1_in(p_1_in),
        .p_1_in2_in(p_1_in2_in),
        .p_1_in5_in(p_1_in5_in),
        .p_5_out(p_5_out),
        .p_5_out_0(\IPIC_IF_I/p_5_out ),
        .p_7_in(\I_SLAVE_ATTACHMENT/I_DECODER/p_7_in ),
        .p_8_in(\I_SLAVE_ATTACHMENT/I_DECODER/p_8_in ),
        .ram_full_fb_i_reg(\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_49 ),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_wdata(s_axi_wdata),
        .scndry_out(\IPIC_IF_I/send_done_icap2bus ),
        .scndry_vect_out({\IPIC_IF_I/sr_icap2bus_3 [0],\IPIC_IF_I/sr_icap2bus_3 [1],\IPIC_IF_I/sr_icap2bus_3 [2],\IPIC_IF_I/sr_icap2bus_3 [3],\IPIC_IF_I/sr_icap2bus_3 [4],\IPIC_IF_I/sr_icap2bus_3 [5],\IPIC_IF_I/sr_icap2bus_3 [6],\IPIC_IF_I/sr_icap2bus_3 [7],\IPIC_IF_I/sr_icap2bus_3 [8],\IPIC_IF_I/sr_icap2bus_3 [9],\IPIC_IF_I/sr_icap2bus_3 [10],\IPIC_IF_I/sr_icap2bus_3 [11],\IPIC_IF_I/sr_icap2bus_3 [12],\IPIC_IF_I/sr_icap2bus_3 [13],\IPIC_IF_I/sr_icap2bus_3 [14],\IPIC_IF_I/sr_icap2bus_3 [15],\IPIC_IF_I/sr_icap2bus_3 [16],\IPIC_IF_I/sr_icap2bus_3 [17],\IPIC_IF_I/sr_icap2bus_3 [18],\IPIC_IF_I/sr_icap2bus_3 [19],\IPIC_IF_I/sr_icap2bus_3 [20],\IPIC_IF_I/sr_icap2bus_3 [21],\IPIC_IF_I/sr_icap2bus_3 [22],\IPIC_IF_I/sr_icap2bus_3 [23],\IPIC_IF_I/sr_icap2bus_3 [24],\IPIC_IF_I/sr_icap2bus_3 [25],\IPIC_IF_I/sr_icap2bus_3 [26],\IPIC_IF_I/sr_icap2bus_3 [27],\IPIC_IF_I/sr_icap2bus_3 [28],\IPIC_IF_I/sr_icap2bus_3 [29],\IPIC_IF_I/sr_icap2bus_3 [30],\IPIC_IF_I/sr_icap2bus_3 [31]}));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_interrupt_control INTERRUPT_CONTROL_I
       (.D({INTERRUPT_CONTROL_I_n_10,INTERRUPT_CONTROL_I_n_11,INTERRUPT_CONTROL_I_n_12,INTERRUPT_CONTROL_I_n_13}),
        .E(XI4_LITE_I_n_58),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 (\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_60 ),
        .\GEN_BKEND_CE_REGISTERS[7].ce_out_i_reg[7] (XI4_LITE_I_n_55),
        .\IP2Bus_Data_reg[28] ({p_8_out[28],p_8_out[29],p_8_out[30],p_8_out[31]}),
        .\RD_FIFO.rdfifo_full_d1_reg (\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_61 ),
        .interrupt_wrce_strb(interrupt_wrce_strb),
        .intr2bus_rdack(intr2bus_rdack),
        .intr2bus_rdack0(intr2bus_rdack0),
        .intr2bus_wrack(intr2bus_wrack),
        .intr_rst(intr_rst),
        .\ip2bus_data_i_reg[31] (INTERRUPT_CONTROL_I_n_1),
        .ip2intc_irpt(ip2intc_irpt),
        .ipif_glbl_irpt_enable_reg(ipif_glbl_irpt_enable_reg),
        .irpt_rdack(irpt_rdack),
        .irpt_rdack_d1(irpt_rdack_d1),
        .irpt_wrack(irpt_wrack),
        .irpt_wrack_d1(irpt_wrack_d1),
        .p_14_in(\I_SLAVE_ATTACHMENT/I_DECODER/p_14_in ),
        .p_16_in(\I_SLAVE_ATTACHMENT/I_DECODER/p_16_in ),
        .p_1_in(p_1_in),
        .p_1_in2_in(p_1_in2_in),
        .p_1_in5_in(p_1_in5_in),
        .\rd_dc_i_reg[6] (\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_52 ),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata[3:0]),
        .\wr_data_count_i_reg[5] (\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_51 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif XI4_LITE_I
       (.Bus_RNW_reg(\I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg ),
        .D({XI4_LITE_I_n_19,XI4_LITE_I_n_20,XI4_LITE_I_n_21,XI4_LITE_I_n_22,XI4_LITE_I_n_23,XI4_LITE_I_n_24,XI4_LITE_I_n_25,XI4_LITE_I_n_26,XI4_LITE_I_n_27,XI4_LITE_I_n_28,XI4_LITE_I_n_29,XI4_LITE_I_n_30,XI4_LITE_I_n_31,XI4_LITE_I_n_32,XI4_LITE_I_n_33,XI4_LITE_I_n_34,XI4_LITE_I_n_35,XI4_LITE_I_n_36,XI4_LITE_I_n_37,XI4_LITE_I_n_38,XI4_LITE_I_n_39,XI4_LITE_I_n_40,XI4_LITE_I_n_41,XI4_LITE_I_n_42,XI4_LITE_I_n_43,XI4_LITE_I_n_44,XI4_LITE_I_n_45,XI4_LITE_I_n_46,XI4_LITE_I_n_47,XI4_LITE_I_n_48,XI4_LITE_I_n_49,XI4_LITE_I_n_50}),
        .E(XI4_LITE_I_n_56),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 (\IPIC_IF_I/hang_status_i2 ),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 (\IPIC_IF_I/eos_status_i2 ),
        .\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] (XI4_LITE_I_n_16),
        .\IP2Bus_Data_reg[0] (p_8_out[0]),
        .\IP2Bus_Data_reg[31] (XI4_LITE_I_n_51),
        .IP2Bus_RdAck0(\IPIC_IF_I/IP2Bus_RdAck0 ),
        .IP2Bus_RdAck_reg(\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_50 ),
        .IP2Bus_WrAck0(\IPIC_IF_I/IP2Bus_WrAck0 ),
        .Q({\IPIC_IF_I/p_0_in9_in ,\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_35 ,\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_36 ,\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_37 ,\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_38 }),
        .SR(bus2ip_reset),
        .\Size_counter_i3_reg[0] ({\IPIC_IF_I/Size_counter_i3 [0],\IPIC_IF_I/Size_counter_i3 [1],\IPIC_IF_I/Size_counter_i3 [2],\IPIC_IF_I/Size_counter_i3 [3],\IPIC_IF_I/Size_counter_i3 [4],\IPIC_IF_I/Size_counter_i3 [5],\IPIC_IF_I/Size_counter_i3 [6],\IPIC_IF_I/Size_counter_i3 [7],\IPIC_IF_I/Size_counter_i3 [8],\IPIC_IF_I/Size_counter_i3 [9],\IPIC_IF_I/Size_counter_i3 [10],\IPIC_IF_I/Size_counter_i3 [11]}),
        .busip_1(\IPIC_IF_I/busip_1 ),
        .interrupt_wrce_strb(interrupt_wrce_strb),
        .intr2bus_rdack0(intr2bus_rdack0),
        .intr2bus_wrack(intr2bus_wrack),
        .\ip2bus_data_i_reg[0] (XI4_LITE_I_n_54),
        .\ip2bus_data_i_reg[0]_0 ({ip2bus_data_i[0],ip2bus_data_i[1],ip2bus_data_i[2],ip2bus_data_i[3],ip2bus_data_i[4],ip2bus_data_i[5],ip2bus_data_i[6],ip2bus_data_i[7],ip2bus_data_i[8],ip2bus_data_i[9],ip2bus_data_i[10],ip2bus_data_i[11],ip2bus_data_i[12],ip2bus_data_i[13],ip2bus_data_i[14],ip2bus_data_i[15],ip2bus_data_i[16],ip2bus_data_i[17],ip2bus_data_i[18],ip2bus_data_i[19],ip2bus_data_i[20],ip2bus_data_i[21],ip2bus_data_i[22],ip2bus_data_i[23],ip2bus_data_i[24],ip2bus_data_i[25],ip2bus_data_i[26],ip2bus_data_i[27],ip2bus_data_i[28],ip2bus_data_i[29],ip2bus_data_i[30],ip2bus_data_i[31]}),
        .\ip2bus_data_i_reg[31] (XI4_LITE_I_n_14),
        .ip2bus_rdack_i(ip2bus_rdack_i),
        .ip2bus_rdack_i_reg(XI4_LITE_I_n_12),
        .ip2bus_wrack_i(ip2bus_wrack_i),
        .ip2bus_wrack_i_reg(XI4_LITE_I_n_13),
        .\ip_irpt_enable_reg_reg[3] (XI4_LITE_I_n_58),
        .ipbus_ack(\IPIC_IF_I/ipbus_ack ),
        .ipbus_ack_fifo(\IPIC_IF_I/ipbus_ack_fifo ),
        .ipif_glbl_irpt_enable_reg(ipif_glbl_irpt_enable_reg),
        .ipif_glbl_irpt_enable_reg_reg(XI4_LITE_I_n_55),
        .irpt_rdack(irpt_rdack),
        .irpt_rdack_d1(irpt_rdack_d1),
        .irpt_wrack(irpt_wrack),
        .irpt_wrack_d1(irpt_wrack_d1),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg (\ICAP_NOT_SHARED.HWICAP_CTRL_I_n_49 ),
        .p_10_in(\IPIC_IF_I/p_10_in ),
        .p_11_in(\IPIC_IF_I/p_11_in ),
        .p_14_in(\I_SLAVE_ATTACHMENT/I_DECODER/p_14_in ),
        .p_16_in(\I_SLAVE_ATTACHMENT/I_DECODER/p_16_in ),
        .p_5_out(p_5_out),
        .p_5_out_0(\IPIC_IF_I/p_5_out ),
        .p_7_in(\I_SLAVE_ATTACHMENT/I_DECODER/p_7_in ),
        .p_8_in(\I_SLAVE_ATTACHMENT/I_DECODER/p_8_in ),
        .\rd_dc_i_reg[6] ({\IPIC_IF_I/rd_occy_i [0],\IPIC_IF_I/rd_occy_i [1],\IPIC_IF_I/rd_occy_i [2],\IPIC_IF_I/rd_occy_i [3],\IPIC_IF_I/rd_occy_i [4],\IPIC_IF_I/rd_occy_i [5],\IPIC_IF_I/rd_occy_i [6]}),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[8:2]),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr[8:2]),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata[31]),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid),
        .scndry_out(\IPIC_IF_I/send_done_icap2bus ),
        .scndry_vect_out({\IPIC_IF_I/sr_icap2bus_3 [0],\IPIC_IF_I/sr_icap2bus_3 [1],\IPIC_IF_I/sr_icap2bus_3 [2],\IPIC_IF_I/sr_icap2bus_3 [3],\IPIC_IF_I/sr_icap2bus_3 [4],\IPIC_IF_I/sr_icap2bus_3 [5],\IPIC_IF_I/sr_icap2bus_3 [6],\IPIC_IF_I/sr_icap2bus_3 [7],\IPIC_IF_I/sr_icap2bus_3 [8],\IPIC_IF_I/sr_icap2bus_3 [9],\IPIC_IF_I/sr_icap2bus_3 [10],\IPIC_IF_I/sr_icap2bus_3 [11],\IPIC_IF_I/sr_icap2bus_3 [12],\IPIC_IF_I/sr_icap2bus_3 [13],\IPIC_IF_I/sr_icap2bus_3 [14],\IPIC_IF_I/sr_icap2bus_3 [15],\IPIC_IF_I/sr_icap2bus_3 [16],\IPIC_IF_I/sr_icap2bus_3 [17],\IPIC_IF_I/sr_icap2bus_3 [18],\IPIC_IF_I/sr_icap2bus_3 [19],\IPIC_IF_I/sr_icap2bus_3 [20],\IPIC_IF_I/sr_icap2bus_3 [21],\IPIC_IF_I/sr_icap2bus_3 [22],\IPIC_IF_I/sr_icap2bus_3 [23],\IPIC_IF_I/sr_icap2bus_3 [24],\IPIC_IF_I/sr_icap2bus_3 [25],\IPIC_IF_I/sr_icap2bus_3 [26],\IPIC_IF_I/sr_icap2bus_3 [27],\IPIC_IF_I/sr_icap2bus_3 [28],\IPIC_IF_I/sr_icap2bus_3 [29],\IPIC_IF_I/sr_icap2bus_3 [30],\IPIC_IF_I/sr_icap2bus_3 [31]}),
        .\sz_i_reg[0] (XI4_LITE_I_n_57),
        .\wr_data_count_i_reg[5] (wr_data_count_i));
  FDRE \ip2bus_data_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(XI4_LITE_I_n_54),
        .Q(ip2bus_data_i[0]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[10]),
        .Q(ip2bus_data_i[10]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[11]),
        .Q(ip2bus_data_i[11]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[12]),
        .Q(ip2bus_data_i[12]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[13]),
        .Q(ip2bus_data_i[13]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[14]),
        .Q(ip2bus_data_i[14]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[15]),
        .Q(ip2bus_data_i[15]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[16]),
        .Q(ip2bus_data_i[16]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[17]),
        .Q(ip2bus_data_i[17]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[18]),
        .Q(ip2bus_data_i[18]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[19]),
        .Q(ip2bus_data_i[19]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[1]),
        .Q(ip2bus_data_i[1]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[20]),
        .Q(ip2bus_data_i[20]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[21]),
        .Q(ip2bus_data_i[21]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[22]),
        .Q(ip2bus_data_i[22]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[23]),
        .Q(ip2bus_data_i[23]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[24]),
        .Q(ip2bus_data_i[24]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[25]),
        .Q(ip2bus_data_i[25]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[26]),
        .Q(ip2bus_data_i[26]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[27]),
        .Q(ip2bus_data_i[27]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(INTERRUPT_CONTROL_I_n_10),
        .Q(ip2bus_data_i[28]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(INTERRUPT_CONTROL_I_n_11),
        .Q(ip2bus_data_i[29]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[2]),
        .Q(ip2bus_data_i[2]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(INTERRUPT_CONTROL_I_n_12),
        .Q(ip2bus_data_i[30]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(INTERRUPT_CONTROL_I_n_13),
        .Q(ip2bus_data_i[31]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[3]),
        .Q(ip2bus_data_i[3]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[4]),
        .Q(ip2bus_data_i[4]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[5]),
        .Q(ip2bus_data_i[5]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[6]),
        .Q(ip2bus_data_i[6]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[7]),
        .Q(ip2bus_data_i[7]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[8]),
        .Q(ip2bus_data_i[8]),
        .R(XI4_LITE_I_n_14));
  FDRE \ip2bus_data_i_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_8_out[9]),
        .Q(ip2bus_data_i[9]),
        .R(XI4_LITE_I_n_14));
  FDRE ip2bus_rdack_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(XI4_LITE_I_n_12),
        .Q(ip2bus_rdack_i),
        .R(1'b0));
  FDRE ip2bus_wrack_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(XI4_LITE_I_n_13),
        .Q(ip2bus_wrack_i),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif
   (p_7_in,
    p_8_in,
    p_14_in,
    p_16_in,
    Bus_RNW_reg,
    s_axi_rvalid,
    s_axi_bvalid,
    s_axi_arready,
    s_axi_wready,
    intr2bus_rdack0,
    irpt_rdack,
    irpt_wrack,
    ip2bus_rdack_i_reg,
    ip2bus_wrack_i_reg,
    \ip2bus_data_i_reg[31] ,
    interrupt_wrce_strb,
    \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ,
    IP2Bus_WrAck0,
    IP2Bus_RdAck0,
    D,
    \IP2Bus_Data_reg[31] ,
    p_10_in,
    p_11_in,
    \ip2bus_data_i_reg[0] ,
    ipif_glbl_irpt_enable_reg_reg,
    E,
    \sz_i_reg[0] ,
    \ip_irpt_enable_reg_reg[3] ,
    s_axi_rdata,
    SR,
    s_axi_aclk,
    s_axi_arvalid,
    s_axi_aresetn,
    ip2bus_rdack_i,
    ip2bus_wrack_i,
    s_axi_bready,
    s_axi_rready,
    s_axi_awvalid,
    s_axi_wvalid,
    irpt_rdack_d1,
    IP2Bus_RdAck_reg,
    p_5_out,
    intr2bus_wrack,
    irpt_wrack_d1,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ,
    busip_1,
    ipbus_ack_fifo,
    ipbus_ack,
    p_5_out_0,
    \Size_counter_i3_reg[0] ,
    scndry_vect_out,
    \wr_data_count_i_reg[5] ,
    \rd_dc_i_reg[6] ,
    Q,
    scndry_out,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ,
    s_axi_awaddr,
    s_axi_araddr,
    ipif_glbl_irpt_enable_reg,
    \IP2Bus_Data_reg[0] ,
    s_axi_wdata,
    \ip2bus_data_i_reg[0]_0 );
  output p_7_in;
  output p_8_in;
  output p_14_in;
  output p_16_in;
  output Bus_RNW_reg;
  output s_axi_rvalid;
  output s_axi_bvalid;
  output s_axi_arready;
  output s_axi_wready;
  output intr2bus_rdack0;
  output irpt_rdack;
  output irpt_wrack;
  output ip2bus_rdack_i_reg;
  output ip2bus_wrack_i_reg;
  output [0:0]\ip2bus_data_i_reg[31] ;
  output interrupt_wrce_strb;
  output \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ;
  output IP2Bus_WrAck0;
  output IP2Bus_RdAck0;
  output [31:0]D;
  output \IP2Bus_Data_reg[31] ;
  output p_10_in;
  output p_11_in;
  output [0:0]\ip2bus_data_i_reg[0] ;
  output ipif_glbl_irpt_enable_reg_reg;
  output [0:0]E;
  output [0:0]\sz_i_reg[0] ;
  output [0:0]\ip_irpt_enable_reg_reg[3] ;
  output [31:0]s_axi_rdata;
  input [0:0]SR;
  input s_axi_aclk;
  input s_axi_arvalid;
  input s_axi_aresetn;
  input ip2bus_rdack_i;
  input ip2bus_wrack_i;
  input s_axi_bready;
  input s_axi_rready;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input irpt_rdack_d1;
  input IP2Bus_RdAck_reg;
  input p_5_out;
  input intr2bus_wrack;
  input irpt_wrack_d1;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ;
  input busip_1;
  input ipbus_ack_fifo;
  input ipbus_ack;
  input [31:0]p_5_out_0;
  input [11:0]\Size_counter_i3_reg[0] ;
  input [31:0]scndry_vect_out;
  input [5:0]\wr_data_count_i_reg[5] ;
  input [6:0]\rd_dc_i_reg[6] ;
  input [4:0]Q;
  input scndry_out;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ;
  input [6:0]s_axi_awaddr;
  input [6:0]s_axi_araddr;
  input ipif_glbl_irpt_enable_reg;
  input [0:0]\IP2Bus_Data_reg[0] ;
  input [0:0]s_axi_wdata;
  input [31:0]\ip2bus_data_i_reg[0]_0 ;

  wire Bus_RNW_reg;
  wire [31:0]D;
  wire [0:0]E;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ;
  wire [0:0]\IP2Bus_Data_reg[0] ;
  wire \IP2Bus_Data_reg[31] ;
  wire IP2Bus_RdAck0;
  wire IP2Bus_RdAck_reg;
  wire IP2Bus_WrAck0;
  wire [4:0]Q;
  wire [0:0]SR;
  wire [11:0]\Size_counter_i3_reg[0] ;
  wire busip_1;
  wire interrupt_wrce_strb;
  wire intr2bus_rdack0;
  wire intr2bus_wrack;
  wire [0:0]\ip2bus_data_i_reg[0] ;
  wire [31:0]\ip2bus_data_i_reg[0]_0 ;
  wire [0:0]\ip2bus_data_i_reg[31] ;
  wire ip2bus_rdack_i;
  wire ip2bus_rdack_i_reg;
  wire ip2bus_wrack_i;
  wire ip2bus_wrack_i_reg;
  wire [0:0]\ip_irpt_enable_reg_reg[3] ;
  wire ipbus_ack;
  wire ipbus_ack_fifo;
  wire ipif_glbl_irpt_enable_reg;
  wire ipif_glbl_irpt_enable_reg_reg;
  wire irpt_rdack;
  wire irpt_rdack_d1;
  wire irpt_wrack;
  wire irpt_wrack_d1;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ;
  wire p_10_in;
  wire p_11_in;
  wire p_14_in;
  wire p_16_in;
  wire p_5_out;
  wire [31:0]p_5_out_0;
  wire p_7_in;
  wire p_8_in;
  wire [6:0]\rd_dc_i_reg[6] ;
  wire s_axi_aclk;
  wire [6:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [6:0]s_axi_awaddr;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [0:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire scndry_out;
  wire [31:0]scndry_vect_out;
  wire [0:0]\sz_i_reg[0] ;
  wire [5:0]\wr_data_count_i_reg[5] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment I_SLAVE_ATTACHMENT
       (.D(D),
        .E(E),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 (\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 (\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ),
        .\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] (\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ),
        .\IP2Bus_Data_reg[0] (\IP2Bus_Data_reg[0] ),
        .\IP2Bus_Data_reg[31] (\IP2Bus_Data_reg[31] ),
        .IP2Bus_RdAck0(IP2Bus_RdAck0),
        .IP2Bus_RdAck_reg(IP2Bus_RdAck_reg),
        .IP2Bus_WrAck0(IP2Bus_WrAck0),
        .Q(Q),
        .SR(SR),
        .\Size_counter_i3_reg[0] (\Size_counter_i3_reg[0] ),
        .busip_1(busip_1),
        .interrupt_wrce_strb(interrupt_wrce_strb),
        .intr2bus_rdack0(intr2bus_rdack0),
        .intr2bus_rdack_reg(p_14_in),
        .intr2bus_rdack_reg_0(p_16_in),
        .intr2bus_wrack(intr2bus_wrack),
        .\ip2bus_data_i_reg[0] (\ip2bus_data_i_reg[0] ),
        .\ip2bus_data_i_reg[0]_0 (\ip2bus_data_i_reg[0]_0 ),
        .\ip2bus_data_i_reg[31] (\ip2bus_data_i_reg[31] ),
        .ip2bus_rdack_i(ip2bus_rdack_i),
        .ip2bus_rdack_i_reg(p_7_in),
        .ip2bus_rdack_i_reg_0(ip2bus_rdack_i_reg),
        .ip2bus_wrack_i(ip2bus_wrack_i),
        .ip2bus_wrack_i_reg(ip2bus_wrack_i_reg),
        .\ip_irpt_enable_reg_reg[3] (\ip_irpt_enable_reg_reg[3] ),
        .ipbus_ack(ipbus_ack),
        .ipbus_ack_fifo(ipbus_ack_fifo),
        .ipif_glbl_irpt_enable_reg(ipif_glbl_irpt_enable_reg),
        .ipif_glbl_irpt_enable_reg_reg(Bus_RNW_reg),
        .ipif_glbl_irpt_enable_reg_reg_0(ipif_glbl_irpt_enable_reg_reg),
        .irpt_rdack(irpt_rdack),
        .irpt_rdack_d1(irpt_rdack_d1),
        .irpt_wrack(irpt_wrack),
        .irpt_wrack_d1(irpt_wrack_d1),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ),
        .p_10_in(p_10_in),
        .p_11_in(p_11_in),
        .p_5_out(p_5_out),
        .p_5_out_0(p_5_out_0),
        .p_8_in(p_8_in),
        .\rd_dc_i_reg[6] (\rd_dc_i_reg[6] ),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid),
        .scndry_out(scndry_out),
        .scndry_vect_out(scndry_vect_out),
        .\sz_i_reg[0] (\sz_i_reg[0] ),
        .\wr_data_count_i_reg[5] (\wr_data_count_i_reg[5] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync
   (scndry_vect_out,
    Q,
    s_axi_aclk);
  output [11:0]scndry_vect_out;
  input [11:0]Q;
  input s_axi_aclk;

  wire [11:0]Q;
  wire s_axi_aclk;
  wire s_level_out_bus_d1_cdc_to_0;
  wire s_level_out_bus_d1_cdc_to_1;
  wire s_level_out_bus_d1_cdc_to_10;
  wire s_level_out_bus_d1_cdc_to_11;
  wire s_level_out_bus_d1_cdc_to_2;
  wire s_level_out_bus_d1_cdc_to_3;
  wire s_level_out_bus_d1_cdc_to_4;
  wire s_level_out_bus_d1_cdc_to_5;
  wire s_level_out_bus_d1_cdc_to_6;
  wire s_level_out_bus_d1_cdc_to_7;
  wire s_level_out_bus_d1_cdc_to_8;
  wire s_level_out_bus_d1_cdc_to_9;
  wire s_level_out_bus_d2_0;
  wire s_level_out_bus_d2_1;
  wire s_level_out_bus_d2_10;
  wire s_level_out_bus_d2_11;
  wire s_level_out_bus_d2_2;
  wire s_level_out_bus_d2_3;
  wire s_level_out_bus_d2_4;
  wire s_level_out_bus_d2_5;
  wire s_level_out_bus_d2_6;
  wire s_level_out_bus_d2_7;
  wire s_level_out_bus_d2_8;
  wire s_level_out_bus_d2_9;
  wire s_level_out_bus_d3_0;
  wire s_level_out_bus_d3_1;
  wire s_level_out_bus_d3_10;
  wire s_level_out_bus_d3_11;
  wire s_level_out_bus_d3_2;
  wire s_level_out_bus_d3_3;
  wire s_level_out_bus_d3_4;
  wire s_level_out_bus_d3_5;
  wire s_level_out_bus_d3_6;
  wire s_level_out_bus_d3_7;
  wire s_level_out_bus_d3_8;
  wire s_level_out_bus_d3_9;
  wire [11:0]scndry_vect_out;

  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[0].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_0),
        .Q(s_level_out_bus_d2_0),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[10].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_10),
        .Q(s_level_out_bus_d2_10),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[11].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_11),
        .Q(s_level_out_bus_d2_11),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[1].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_1),
        .Q(s_level_out_bus_d2_1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[2].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_2),
        .Q(s_level_out_bus_d2_2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[3].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_3),
        .Q(s_level_out_bus_d2_3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[4].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_4),
        .Q(s_level_out_bus_d2_4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[5].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_5),
        .Q(s_level_out_bus_d2_5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[6].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_6),
        .Q(s_level_out_bus_d2_6),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[7].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_7),
        .Q(s_level_out_bus_d2_7),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[8].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_8),
        .Q(s_level_out_bus_d2_8),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[9].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_9),
        .Q(s_level_out_bus_d2_9),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[0].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_0),
        .Q(s_level_out_bus_d3_0),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[10].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_10),
        .Q(s_level_out_bus_d3_10),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[11].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_11),
        .Q(s_level_out_bus_d3_11),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[1].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_1),
        .Q(s_level_out_bus_d3_1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[2].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_2),
        .Q(s_level_out_bus_d3_2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[3].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_3),
        .Q(s_level_out_bus_d3_3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[4].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_4),
        .Q(s_level_out_bus_d3_4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[5].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_5),
        .Q(s_level_out_bus_d3_5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[6].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_6),
        .Q(s_level_out_bus_d3_6),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[7].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_7),
        .Q(s_level_out_bus_d3_7),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[8].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_8),
        .Q(s_level_out_bus_d3_8),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[9].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_9),
        .Q(s_level_out_bus_d3_9),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[0].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_0),
        .Q(scndry_vect_out[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[10].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_10),
        .Q(scndry_vect_out[10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[11].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_11),
        .Q(scndry_vect_out[11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[1].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_1),
        .Q(scndry_vect_out[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[2].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_2),
        .Q(scndry_vect_out[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[3].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_3),
        .Q(scndry_vect_out[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[4].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_4),
        .Q(scndry_vect_out[4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[5].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_5),
        .Q(scndry_vect_out[5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[6].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_6),
        .Q(scndry_vect_out[6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[7].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_7),
        .Q(scndry_vect_out[7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[8].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_8),
        .Q(scndry_vect_out[8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[9].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_9),
        .Q(scndry_vect_out[9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[0].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[0]),
        .Q(s_level_out_bus_d1_cdc_to_0),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[10].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[10]),
        .Q(s_level_out_bus_d1_cdc_to_10),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[11].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[11]),
        .Q(s_level_out_bus_d1_cdc_to_11),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[1].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[1]),
        .Q(s_level_out_bus_d1_cdc_to_1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[2].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[2]),
        .Q(s_level_out_bus_d1_cdc_to_2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[3].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[3]),
        .Q(s_level_out_bus_d1_cdc_to_3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[4].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[4]),
        .Q(s_level_out_bus_d1_cdc_to_4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[5].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[5]),
        .Q(s_level_out_bus_d1_cdc_to_5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[6].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[6]),
        .Q(s_level_out_bus_d1_cdc_to_6),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[7].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[7]),
        .Q(s_level_out_bus_d1_cdc_to_7),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[8].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[8]),
        .Q(s_level_out_bus_d1_cdc_to_8),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[9].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[9]),
        .Q(s_level_out_bus_d1_cdc_to_9),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync_4
   (scndry_vect_out,
    \size_cs_reg[0] ,
    s_axi_aclk);
  output [11:0]scndry_vect_out;
  input [11:0]\size_cs_reg[0] ;
  input s_axi_aclk;

  wire s_axi_aclk;
  wire s_level_out_bus_d1_cdc_to_0;
  wire s_level_out_bus_d1_cdc_to_1;
  wire s_level_out_bus_d1_cdc_to_10;
  wire s_level_out_bus_d1_cdc_to_11;
  wire s_level_out_bus_d1_cdc_to_2;
  wire s_level_out_bus_d1_cdc_to_3;
  wire s_level_out_bus_d1_cdc_to_4;
  wire s_level_out_bus_d1_cdc_to_5;
  wire s_level_out_bus_d1_cdc_to_6;
  wire s_level_out_bus_d1_cdc_to_7;
  wire s_level_out_bus_d1_cdc_to_8;
  wire s_level_out_bus_d1_cdc_to_9;
  wire s_level_out_bus_d2_0;
  wire s_level_out_bus_d2_1;
  wire s_level_out_bus_d2_10;
  wire s_level_out_bus_d2_11;
  wire s_level_out_bus_d2_2;
  wire s_level_out_bus_d2_3;
  wire s_level_out_bus_d2_4;
  wire s_level_out_bus_d2_5;
  wire s_level_out_bus_d2_6;
  wire s_level_out_bus_d2_7;
  wire s_level_out_bus_d2_8;
  wire s_level_out_bus_d2_9;
  wire s_level_out_bus_d3_0;
  wire s_level_out_bus_d3_1;
  wire s_level_out_bus_d3_10;
  wire s_level_out_bus_d3_11;
  wire s_level_out_bus_d3_2;
  wire s_level_out_bus_d3_3;
  wire s_level_out_bus_d3_4;
  wire s_level_out_bus_d3_5;
  wire s_level_out_bus_d3_6;
  wire s_level_out_bus_d3_7;
  wire s_level_out_bus_d3_8;
  wire s_level_out_bus_d3_9;
  wire [11:0]scndry_vect_out;
  wire [11:0]\size_cs_reg[0] ;

  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[0].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_0),
        .Q(s_level_out_bus_d2_0),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[10].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_10),
        .Q(s_level_out_bus_d2_10),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[11].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_11),
        .Q(s_level_out_bus_d2_11),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[1].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_1),
        .Q(s_level_out_bus_d2_1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[2].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_2),
        .Q(s_level_out_bus_d2_2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[3].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_3),
        .Q(s_level_out_bus_d2_3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[4].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_4),
        .Q(s_level_out_bus_d2_4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[5].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_5),
        .Q(s_level_out_bus_d2_5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[6].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_6),
        .Q(s_level_out_bus_d2_6),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[7].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_7),
        .Q(s_level_out_bus_d2_7),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[8].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_8),
        .Q(s_level_out_bus_d2_8),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[9].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_9),
        .Q(s_level_out_bus_d2_9),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[0].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_0),
        .Q(s_level_out_bus_d3_0),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[10].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_10),
        .Q(s_level_out_bus_d3_10),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[11].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_11),
        .Q(s_level_out_bus_d3_11),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[1].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_1),
        .Q(s_level_out_bus_d3_1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[2].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_2),
        .Q(s_level_out_bus_d3_2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[3].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_3),
        .Q(s_level_out_bus_d3_3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[4].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_4),
        .Q(s_level_out_bus_d3_4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[5].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_5),
        .Q(s_level_out_bus_d3_5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[6].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_6),
        .Q(s_level_out_bus_d3_6),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[7].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_7),
        .Q(s_level_out_bus_d3_7),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[8].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_8),
        .Q(s_level_out_bus_d3_8),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[9].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_9),
        .Q(s_level_out_bus_d3_9),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[0].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_0),
        .Q(scndry_vect_out[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[10].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_10),
        .Q(scndry_vect_out[10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[11].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_11),
        .Q(scndry_vect_out[11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[1].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_1),
        .Q(scndry_vect_out[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[2].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_2),
        .Q(scndry_vect_out[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[3].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_3),
        .Q(scndry_vect_out[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[4].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_4),
        .Q(scndry_vect_out[4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[5].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_5),
        .Q(scndry_vect_out[5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[6].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_6),
        .Q(scndry_vect_out[6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[7].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_7),
        .Q(scndry_vect_out[7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[8].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_8),
        .Q(scndry_vect_out[8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[9].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_9),
        .Q(scndry_vect_out[9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[0].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\size_cs_reg[0] [0]),
        .Q(s_level_out_bus_d1_cdc_to_0),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[10].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\size_cs_reg[0] [10]),
        .Q(s_level_out_bus_d1_cdc_to_10),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[11].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\size_cs_reg[0] [11]),
        .Q(s_level_out_bus_d1_cdc_to_11),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[1].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\size_cs_reg[0] [1]),
        .Q(s_level_out_bus_d1_cdc_to_1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[2].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\size_cs_reg[0] [2]),
        .Q(s_level_out_bus_d1_cdc_to_2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[3].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\size_cs_reg[0] [3]),
        .Q(s_level_out_bus_d1_cdc_to_3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[4].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\size_cs_reg[0] [4]),
        .Q(s_level_out_bus_d1_cdc_to_4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[5].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\size_cs_reg[0] [5]),
        .Q(s_level_out_bus_d1_cdc_to_5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[6].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\size_cs_reg[0] [6]),
        .Q(s_level_out_bus_d1_cdc_to_6),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[7].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\size_cs_reg[0] [7]),
        .Q(s_level_out_bus_d1_cdc_to_7),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[8].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\size_cs_reg[0] [8]),
        .Q(s_level_out_bus_d1_cdc_to_8),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[9].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\size_cs_reg[0] [9]),
        .Q(s_level_out_bus_d1_cdc_to_9),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized0
   (\IP2Bus_Data_reg[0] ,
    Q,
    s_axi_aclk);
  output [31:0]\IP2Bus_Data_reg[0] ;
  input [31:0]Q;
  input s_axi_aclk;

  wire [31:0]\IP2Bus_Data_reg[0] ;
  wire [31:0]Q;
  wire s_axi_aclk;
  wire s_level_out_bus_d1_cdc_to_0;
  wire s_level_out_bus_d1_cdc_to_1;
  wire s_level_out_bus_d1_cdc_to_10;
  wire s_level_out_bus_d1_cdc_to_11;
  wire s_level_out_bus_d1_cdc_to_12;
  wire s_level_out_bus_d1_cdc_to_13;
  wire s_level_out_bus_d1_cdc_to_14;
  wire s_level_out_bus_d1_cdc_to_15;
  wire s_level_out_bus_d1_cdc_to_16;
  wire s_level_out_bus_d1_cdc_to_17;
  wire s_level_out_bus_d1_cdc_to_18;
  wire s_level_out_bus_d1_cdc_to_19;
  wire s_level_out_bus_d1_cdc_to_2;
  wire s_level_out_bus_d1_cdc_to_20;
  wire s_level_out_bus_d1_cdc_to_21;
  wire s_level_out_bus_d1_cdc_to_22;
  wire s_level_out_bus_d1_cdc_to_23;
  wire s_level_out_bus_d1_cdc_to_24;
  wire s_level_out_bus_d1_cdc_to_25;
  wire s_level_out_bus_d1_cdc_to_26;
  wire s_level_out_bus_d1_cdc_to_27;
  wire s_level_out_bus_d1_cdc_to_28;
  wire s_level_out_bus_d1_cdc_to_29;
  wire s_level_out_bus_d1_cdc_to_3;
  wire s_level_out_bus_d1_cdc_to_30;
  wire s_level_out_bus_d1_cdc_to_31;
  wire s_level_out_bus_d1_cdc_to_4;
  wire s_level_out_bus_d1_cdc_to_5;
  wire s_level_out_bus_d1_cdc_to_6;
  wire s_level_out_bus_d1_cdc_to_7;
  wire s_level_out_bus_d1_cdc_to_8;
  wire s_level_out_bus_d1_cdc_to_9;
  wire s_level_out_bus_d2_0;
  wire s_level_out_bus_d2_1;
  wire s_level_out_bus_d2_10;
  wire s_level_out_bus_d2_11;
  wire s_level_out_bus_d2_12;
  wire s_level_out_bus_d2_13;
  wire s_level_out_bus_d2_14;
  wire s_level_out_bus_d2_15;
  wire s_level_out_bus_d2_16;
  wire s_level_out_bus_d2_17;
  wire s_level_out_bus_d2_18;
  wire s_level_out_bus_d2_19;
  wire s_level_out_bus_d2_2;
  wire s_level_out_bus_d2_20;
  wire s_level_out_bus_d2_21;
  wire s_level_out_bus_d2_22;
  wire s_level_out_bus_d2_23;
  wire s_level_out_bus_d2_24;
  wire s_level_out_bus_d2_25;
  wire s_level_out_bus_d2_26;
  wire s_level_out_bus_d2_27;
  wire s_level_out_bus_d2_28;
  wire s_level_out_bus_d2_29;
  wire s_level_out_bus_d2_3;
  wire s_level_out_bus_d2_30;
  wire s_level_out_bus_d2_31;
  wire s_level_out_bus_d2_4;
  wire s_level_out_bus_d2_5;
  wire s_level_out_bus_d2_6;
  wire s_level_out_bus_d2_7;
  wire s_level_out_bus_d2_8;
  wire s_level_out_bus_d2_9;
  wire s_level_out_bus_d3_0;
  wire s_level_out_bus_d3_1;
  wire s_level_out_bus_d3_10;
  wire s_level_out_bus_d3_11;
  wire s_level_out_bus_d3_12;
  wire s_level_out_bus_d3_13;
  wire s_level_out_bus_d3_14;
  wire s_level_out_bus_d3_15;
  wire s_level_out_bus_d3_16;
  wire s_level_out_bus_d3_17;
  wire s_level_out_bus_d3_18;
  wire s_level_out_bus_d3_19;
  wire s_level_out_bus_d3_2;
  wire s_level_out_bus_d3_20;
  wire s_level_out_bus_d3_21;
  wire s_level_out_bus_d3_22;
  wire s_level_out_bus_d3_23;
  wire s_level_out_bus_d3_24;
  wire s_level_out_bus_d3_25;
  wire s_level_out_bus_d3_26;
  wire s_level_out_bus_d3_27;
  wire s_level_out_bus_d3_28;
  wire s_level_out_bus_d3_29;
  wire s_level_out_bus_d3_3;
  wire s_level_out_bus_d3_30;
  wire s_level_out_bus_d3_31;
  wire s_level_out_bus_d3_4;
  wire s_level_out_bus_d3_5;
  wire s_level_out_bus_d3_6;
  wire s_level_out_bus_d3_7;
  wire s_level_out_bus_d3_8;
  wire s_level_out_bus_d3_9;

  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[0].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_0),
        .Q(s_level_out_bus_d2_0),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[10].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_10),
        .Q(s_level_out_bus_d2_10),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[11].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_11),
        .Q(s_level_out_bus_d2_11),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[12].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_12),
        .Q(s_level_out_bus_d2_12),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[13].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_13),
        .Q(s_level_out_bus_d2_13),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[14].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_14),
        .Q(s_level_out_bus_d2_14),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[15].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_15),
        .Q(s_level_out_bus_d2_15),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[16].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_16),
        .Q(s_level_out_bus_d2_16),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[17].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_17),
        .Q(s_level_out_bus_d2_17),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[18].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_18),
        .Q(s_level_out_bus_d2_18),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[19].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_19),
        .Q(s_level_out_bus_d2_19),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[1].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_1),
        .Q(s_level_out_bus_d2_1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[20].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_20),
        .Q(s_level_out_bus_d2_20),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[21].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_21),
        .Q(s_level_out_bus_d2_21),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[22].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_22),
        .Q(s_level_out_bus_d2_22),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[23].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_23),
        .Q(s_level_out_bus_d2_23),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[24].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_24),
        .Q(s_level_out_bus_d2_24),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[25].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_25),
        .Q(s_level_out_bus_d2_25),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[26].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_26),
        .Q(s_level_out_bus_d2_26),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[27].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_27),
        .Q(s_level_out_bus_d2_27),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[28].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_28),
        .Q(s_level_out_bus_d2_28),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[29].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_29),
        .Q(s_level_out_bus_d2_29),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[2].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_2),
        .Q(s_level_out_bus_d2_2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[30].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_30),
        .Q(s_level_out_bus_d2_30),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[31].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_31),
        .Q(s_level_out_bus_d2_31),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[3].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_3),
        .Q(s_level_out_bus_d2_3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[4].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_4),
        .Q(s_level_out_bus_d2_4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[5].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_5),
        .Q(s_level_out_bus_d2_5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[6].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_6),
        .Q(s_level_out_bus_d2_6),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[7].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_7),
        .Q(s_level_out_bus_d2_7),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[8].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_8),
        .Q(s_level_out_bus_d2_8),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d2[9].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d1_cdc_to_9),
        .Q(s_level_out_bus_d2_9),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[0].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_0),
        .Q(s_level_out_bus_d3_0),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[10].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_10),
        .Q(s_level_out_bus_d3_10),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[11].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_11),
        .Q(s_level_out_bus_d3_11),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[12].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_12),
        .Q(s_level_out_bus_d3_12),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[13].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_13),
        .Q(s_level_out_bus_d3_13),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[14].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_14),
        .Q(s_level_out_bus_d3_14),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[15].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_15),
        .Q(s_level_out_bus_d3_15),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[16].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_16),
        .Q(s_level_out_bus_d3_16),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[17].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_17),
        .Q(s_level_out_bus_d3_17),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[18].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_18),
        .Q(s_level_out_bus_d3_18),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[19].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_19),
        .Q(s_level_out_bus_d3_19),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[1].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_1),
        .Q(s_level_out_bus_d3_1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[20].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_20),
        .Q(s_level_out_bus_d3_20),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[21].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_21),
        .Q(s_level_out_bus_d3_21),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[22].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_22),
        .Q(s_level_out_bus_d3_22),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[23].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_23),
        .Q(s_level_out_bus_d3_23),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[24].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_24),
        .Q(s_level_out_bus_d3_24),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[25].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_25),
        .Q(s_level_out_bus_d3_25),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[26].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_26),
        .Q(s_level_out_bus_d3_26),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[27].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_27),
        .Q(s_level_out_bus_d3_27),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[28].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_28),
        .Q(s_level_out_bus_d3_28),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[29].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_29),
        .Q(s_level_out_bus_d3_29),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[2].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_2),
        .Q(s_level_out_bus_d3_2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[30].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_30),
        .Q(s_level_out_bus_d3_30),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[31].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_31),
        .Q(s_level_out_bus_d3_31),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[3].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_3),
        .Q(s_level_out_bus_d3_3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[4].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_4),
        .Q(s_level_out_bus_d3_4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[5].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_5),
        .Q(s_level_out_bus_d3_5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[6].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_6),
        .Q(s_level_out_bus_d3_6),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[7].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_7),
        .Q(s_level_out_bus_d3_7),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[8].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_8),
        .Q(s_level_out_bus_d3_8),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d3[9].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d2_9),
        .Q(s_level_out_bus_d3_9),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[0].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_0),
        .Q(\IP2Bus_Data_reg[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[10].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_10),
        .Q(\IP2Bus_Data_reg[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[11].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_11),
        .Q(\IP2Bus_Data_reg[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[12].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_12),
        .Q(\IP2Bus_Data_reg[0] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[13].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_13),
        .Q(\IP2Bus_Data_reg[0] [13]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[14].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_14),
        .Q(\IP2Bus_Data_reg[0] [14]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[15].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_15),
        .Q(\IP2Bus_Data_reg[0] [15]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[16].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_16),
        .Q(\IP2Bus_Data_reg[0] [16]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[17].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_17),
        .Q(\IP2Bus_Data_reg[0] [17]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[18].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_18),
        .Q(\IP2Bus_Data_reg[0] [18]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[19].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_19),
        .Q(\IP2Bus_Data_reg[0] [19]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[1].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_1),
        .Q(\IP2Bus_Data_reg[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[20].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_20),
        .Q(\IP2Bus_Data_reg[0] [20]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[21].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_21),
        .Q(\IP2Bus_Data_reg[0] [21]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[22].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_22),
        .Q(\IP2Bus_Data_reg[0] [22]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[23].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_23),
        .Q(\IP2Bus_Data_reg[0] [23]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[24].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_24),
        .Q(\IP2Bus_Data_reg[0] [24]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[25].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_25),
        .Q(\IP2Bus_Data_reg[0] [25]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[26].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_26),
        .Q(\IP2Bus_Data_reg[0] [26]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[27].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_27),
        .Q(\IP2Bus_Data_reg[0] [27]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[28].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_28),
        .Q(\IP2Bus_Data_reg[0] [28]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[29].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_29),
        .Q(\IP2Bus_Data_reg[0] [29]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[2].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_2),
        .Q(\IP2Bus_Data_reg[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[30].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_30),
        .Q(\IP2Bus_Data_reg[0] [30]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[31].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_31),
        .Q(\IP2Bus_Data_reg[0] [31]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[3].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_3),
        .Q(\IP2Bus_Data_reg[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[4].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_4),
        .Q(\IP2Bus_Data_reg[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[5].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_5),
        .Q(\IP2Bus_Data_reg[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[6].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_6),
        .Q(\IP2Bus_Data_reg[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[7].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_7),
        .Q(\IP2Bus_Data_reg[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[8].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_8),
        .Q(\IP2Bus_Data_reg[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_CROSS_PLEVEL_IN2SCNDRY_bus_d4[9].CROSS2_PLEVEL_IN2SCNDRY_s_level_out_bus_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_bus_d3_9),
        .Q(\IP2Bus_Data_reg[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[0].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[0]),
        .Q(s_level_out_bus_d1_cdc_to_0),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[10].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[10]),
        .Q(s_level_out_bus_d1_cdc_to_10),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[11].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[11]),
        .Q(s_level_out_bus_d1_cdc_to_11),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[12].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[12]),
        .Q(s_level_out_bus_d1_cdc_to_12),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[13].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[13]),
        .Q(s_level_out_bus_d1_cdc_to_13),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[14].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[14]),
        .Q(s_level_out_bus_d1_cdc_to_14),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[15].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[15]),
        .Q(s_level_out_bus_d1_cdc_to_15),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[16].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[16]),
        .Q(s_level_out_bus_d1_cdc_to_16),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[17].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[17]),
        .Q(s_level_out_bus_d1_cdc_to_17),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[18].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[18]),
        .Q(s_level_out_bus_d1_cdc_to_18),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[19].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[19]),
        .Q(s_level_out_bus_d1_cdc_to_19),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[1].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[1]),
        .Q(s_level_out_bus_d1_cdc_to_1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[20].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[20]),
        .Q(s_level_out_bus_d1_cdc_to_20),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[21].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[21]),
        .Q(s_level_out_bus_d1_cdc_to_21),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[22].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[22]),
        .Q(s_level_out_bus_d1_cdc_to_22),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[23].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[23]),
        .Q(s_level_out_bus_d1_cdc_to_23),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[24].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[24]),
        .Q(s_level_out_bus_d1_cdc_to_24),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[25].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[25]),
        .Q(s_level_out_bus_d1_cdc_to_25),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[26].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[26]),
        .Q(s_level_out_bus_d1_cdc_to_26),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[27].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[27]),
        .Q(s_level_out_bus_d1_cdc_to_27),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[28].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[28]),
        .Q(s_level_out_bus_d1_cdc_to_28),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[29].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[29]),
        .Q(s_level_out_bus_d1_cdc_to_29),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[2].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[2]),
        .Q(s_level_out_bus_d1_cdc_to_2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[30].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[30]),
        .Q(s_level_out_bus_d1_cdc_to_30),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[31].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[31]),
        .Q(s_level_out_bus_d1_cdc_to_31),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[3].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[3]),
        .Q(s_level_out_bus_d1_cdc_to_3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[4].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[4]),
        .Q(s_level_out_bus_d1_cdc_to_4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[5].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[5]),
        .Q(s_level_out_bus_d1_cdc_to_5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[6].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[6]),
        .Q(s_level_out_bus_d1_cdc_to_6),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[7].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[7]),
        .Q(s_level_out_bus_d1_cdc_to_7),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[8].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[8]),
        .Q(s_level_out_bus_d1_cdc_to_8),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.MULTI_BIT.FOR_IN_cdc_to[9].CROSS2_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[9]),
        .Q(s_level_out_bus_d1_cdc_to_9),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1
   (scndry_out,
    prmry_in,
    s_axi_aclk);
  output scndry_out;
  input prmry_in;
  input s_axi_aclk;

  wire prmry_in;
  wire s_axi_aclk;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;
  wire scndry_out;

  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(prmry_in),
        .Q(s_level_out_d1_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(scndry_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_0
   (\IP2Bus_Data_reg[31] ,
    prmry_in,
    s_axi_aclk);
  output \IP2Bus_Data_reg[31] ;
  input prmry_in;
  input s_axi_aclk;

  wire \IP2Bus_Data_reg[31] ;
  wire prmry_in;
  wire s_axi_aclk;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;

  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(prmry_in),
        .Q(s_level_out_d1_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(\IP2Bus_Data_reg[31] ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_1
   (SR,
    abort_onreset0,
    s_axi_aresetn,
    \cr_i_reg[0] ,
    reset_cr_cs_reg,
    s_axi_aclk);
  output [0:0]SR;
  output abort_onreset0;
  input s_axi_aresetn;
  input [0:0]\cr_i_reg[0] ;
  input reset_cr_cs_reg;
  input s_axi_aclk;

  wire [0:0]SR;
  wire abort_onreset0;
  wire [0:0]\cr_i_reg[0] ;
  wire reset_cr_cs_reg;
  wire reset_cr_icap2bus;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;

  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(reset_cr_cs_reg),
        .Q(s_level_out_d1_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(reset_cr_icap2bus),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    abort_onreset_i_1
       (.I0(reset_cr_icap2bus),
        .I1(\cr_i_reg[0] ),
        .O(abort_onreset0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \cr_i[0]_i_1 
       (.I0(reset_cr_icap2bus),
        .I1(s_axi_aresetn),
        .O(SR));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_2
   (\IP2Bus_Data_reg[30] ,
    hang_status_cs_reg,
    s_axi_aclk);
  output \IP2Bus_Data_reg[30] ;
  input hang_status_cs_reg;
  input s_axi_aclk;

  wire \IP2Bus_Data_reg[30] ;
  wire hang_status_cs_reg;
  wire s_axi_aclk;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;

  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(hang_status_cs_reg),
        .Q(s_level_out_d1_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(\IP2Bus_Data_reg[30] ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_3
   (\IP2Bus_Data_reg[29] ,
    eos_in,
    s_axi_aclk);
  output \IP2Bus_Data_reg[29] ;
  input eos_in;
  input s_axi_aclk;

  wire \IP2Bus_Data_reg[29] ;
  wire eos_in;
  wire s_axi_aclk;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;

  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(eos_in),
        .Q(s_level_out_d1_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(\IP2Bus_Data_reg[29] ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_5
   (\size_cs_reg[11] ,
    scndry_out,
    \FSM_sequential_icap_nstate_cs_reg[1] ,
    gate_signal_p_reg,
    rnc,
    \cr_i_reg[0] ,
    s_axi_aclk);
  output \size_cs_reg[11] ;
  output scndry_out;
  input [1:0]\FSM_sequential_icap_nstate_cs_reg[1] ;
  input gate_signal_p_reg;
  input [0:1]rnc;
  input [0:0]\cr_i_reg[0] ;
  input s_axi_aclk;

  wire [1:0]\FSM_sequential_icap_nstate_cs_reg[1] ;
  wire [0:0]\cr_i_reg[0] ;
  wire gate_signal_p_reg;
  wire [0:1]rnc;
  wire s_axi_aclk;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;
  wire scndry_out;
  wire \size_cs_reg[11] ;

  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cr_i_reg[0] ),
        .Q(s_level_out_d1_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(scndry_out),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \size_cs[0]_i_3 
       (.I0(\FSM_sequential_icap_nstate_cs_reg[1] [0]),
        .I1(\FSM_sequential_icap_nstate_cs_reg[1] [1]),
        .I2(gate_signal_p_reg),
        .I3(scndry_out),
        .I4(rnc[0]),
        .I5(rnc[1]),
        .O(\size_cs_reg[11] ));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_6
   (Send_done_cs_reg,
    scndry_out,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    \FSM_sequential_icap_nstate_cs_reg[1] ,
    \FSM_sequential_icap_nstate_cs_reg[0] ,
    gate_signal_p_reg,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ,
    prmry_in,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ,
    \FSM_sequential_icap_nstate_cs_reg[1]_0 ,
    \cr_i_reg[3] ,
    s_axi_aclk);
  output Send_done_cs_reg;
  output scndry_out;
  output \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  output \FSM_sequential_icap_nstate_cs_reg[1] ;
  output \FSM_sequential_icap_nstate_cs_reg[0] ;
  input gate_signal_p_reg;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ;
  input prmry_in;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ;
  input [1:0]\FSM_sequential_icap_nstate_cs_reg[1]_0 ;
  input [0:0]\cr_i_reg[3] ;
  input s_axi_aclk;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire \FSM_sequential_icap_nstate_cs_reg[0] ;
  wire \FSM_sequential_icap_nstate_cs_reg[1] ;
  wire [1:0]\FSM_sequential_icap_nstate_cs_reg[1]_0 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ;
  wire Send_done_cs_reg;
  wire [0:0]\cr_i_reg[3] ;
  wire gate_signal_p_reg;
  wire prmry_in;
  wire s_axi_aclk;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;
  wire scndry_out;

  LUT6 #(
    .INIT(64'h0000000000FF0010)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_6 
       (.I0(scndry_out),
        .I1(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ),
        .I2(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ),
        .I3(prmry_in),
        .I4(\FSM_sequential_icap_nstate_cs_reg[1]_0 [1]),
        .I5(\FSM_sequential_icap_nstate_cs_reg[1]_0 [0]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ));
  LUT6 #(
    .INIT(64'hAAAA0000AABA0510)) 
    \FSM_sequential_icap_nstate_cs[1]_i_5 
       (.I0(\FSM_sequential_icap_nstate_cs_reg[1]_0 [1]),
        .I1(gate_signal_p_reg),
        .I2(scndry_out),
        .I3(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ),
        .I4(prmry_in),
        .I5(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ),
        .O(\FSM_sequential_icap_nstate_cs_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \FSM_sequential_icap_nstate_cs[2]_i_5 
       (.I0(gate_signal_p_reg),
        .I1(scndry_out),
        .I2(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ),
        .O(\FSM_sequential_icap_nstate_cs_reg[0] ));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cr_i_reg[3] ),
        .Q(s_level_out_d1_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(scndry_out),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFDAD)) 
    Send_done_cs_i_2
       (.I0(scndry_out),
        .I1(gate_signal_p_reg),
        .I2(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ),
        .I3(prmry_in),
        .O(Send_done_cs_reg));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_7
   (\FSM_sequential_icap_nstate_cs_reg[2] ,
    scndry_out,
    Send_done_cs_reg,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ,
    \FSM_sequential_icap_nstate_cs_reg[1] ,
    gate_signal_p_reg,
    prmry_in,
    \cr_i_reg[4] ,
    s_axi_aclk);
  output \FSM_sequential_icap_nstate_cs_reg[2] ;
  output scndry_out;
  output Send_done_cs_reg;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ;
  input [1:0]\FSM_sequential_icap_nstate_cs_reg[1] ;
  input gate_signal_p_reg;
  input prmry_in;
  input [0:0]\cr_i_reg[4] ;
  input s_axi_aclk;

  wire [1:0]\FSM_sequential_icap_nstate_cs_reg[1] ;
  wire \FSM_sequential_icap_nstate_cs_reg[2] ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ;
  wire Send_done_cs_reg;
  wire [0:0]\cr_i_reg[4] ;
  wire gate_signal_p_reg;
  wire prmry_in;
  wire s_axi_aclk;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;
  wire scndry_out;

  LUT5 #(
    .INIT(32'h0000FEFF)) 
    \FSM_sequential_icap_nstate_cs[3]_i_2 
       (.I0(scndry_out),
        .I1(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ),
        .I2(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ),
        .I3(\FSM_sequential_icap_nstate_cs_reg[1] [0]),
        .I4(\FSM_sequential_icap_nstate_cs_reg[1] [1]),
        .O(\FSM_sequential_icap_nstate_cs_reg[2] ));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cr_i_reg[4] ),
        .Q(s_level_out_d1_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(scndry_out),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000DD003F)) 
    Send_done_cs_i_4
       (.I0(gate_signal_p_reg),
        .I1(scndry_out),
        .I2(prmry_in),
        .I3(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ),
        .I4(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ),
        .I5(\FSM_sequential_icap_nstate_cs_reg[1] [1]),
        .O(Send_done_cs_reg));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_8
   (\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ,
    Bus_RNW_reg_reg,
    s_axi_wdata,
    p_1_in2_in,
    prmry_in,
    s_axi_aclk);
  output \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ;
  input Bus_RNW_reg_reg;
  input [0:0]s_axi_wdata;
  input p_1_in2_in;
  input prmry_in;
  input s_axi_aclk;

  wire Bus_RNW_reg_reg;
  wire \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ;
  wire p_1_in2_in;
  wire prmry_in;
  wire s_axi_aclk;
  wire [0:0]s_axi_wdata;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;
  wire wrfifo_empty;

  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(prmry_in),
        .Q(s_level_out_d1_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(wrfifo_empty),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hEFBA)) 
    \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg[2]_i_1 
       (.I0(wrfifo_empty),
        .I1(Bus_RNW_reg_reg),
        .I2(s_axi_wdata),
        .I3(p_1_in2_in),
        .O(\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized2
   (\RD_FIFO.fifo_full_mask_reg ,
    scndry_out,
    fifo_rst,
    abort_onreset,
    sw_reset_reg,
    rdfifo_full_d1,
    fifo_full_mask,
    prmry_in,
    s_axi_aclk);
  output \RD_FIFO.fifo_full_mask_reg ;
  output scndry_out;
  input fifo_rst;
  input abort_onreset;
  input sw_reset_reg;
  input rdfifo_full_d1;
  input fifo_full_mask;
  input prmry_in;
  input s_axi_aclk;

  wire \RD_FIFO.fifo_full_mask_reg ;
  wire abort_onreset;
  wire fifo_full_mask;
  wire fifo_rst;
  wire prmry_in;
  wire rdfifo_full_d1;
  wire s_axi_aclk;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire scndry_out;
  wire sw_reset_reg;

  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(prmry_in),
        .Q(s_level_out_d1_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(scndry_out),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0101010100010000)) 
    \RD_FIFO.fifo_full_mask_i_1 
       (.I0(fifo_rst),
        .I1(abort_onreset),
        .I2(sw_reset_reg),
        .I3(scndry_out),
        .I4(rdfifo_full_d1),
        .I5(fifo_full_mask),
        .O(\RD_FIFO.fifo_full_mask_reg ));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_axi_hwicap_0_0,axi_hwicap,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axi_hwicap,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (icap_clk,
    eos_in,
    s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    ip2intc_irpt);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ICAP_CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ICAP_CLK, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0" *) input icap_clk;
  input eos_in;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI_LITE, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0" *) input s_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW" *) input s_axi_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_LITE, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 9, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) input [8:0]s_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWVALID" *) input s_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWREADY" *) output s_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WDATA" *) input [31:0]s_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WSTRB" *) input [3:0]s_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WVALID" *) input s_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WREADY" *) output s_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BRESP" *) output [1:0]s_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BVALID" *) output s_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BREADY" *) input s_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARADDR" *) input [8:0]s_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARVALID" *) input s_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARREADY" *) output s_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RDATA" *) output [31:0]s_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RRESP" *) output [1:0]s_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RVALID" *) output s_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RREADY" *) input s_axi_rready;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 IP2INTC_IRPT INTERRUPT" *) (* x_interface_parameter = "XIL_INTERFACENAME IP2INTC_IRPT, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output ip2intc_irpt;

  wire eos_in;
  wire icap_clk;
  wire ip2intc_irpt;
  wire s_axi_aclk;
  wire [8:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [8:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire NLW_U0_cap_req_UNCONNECTED;
  wire NLW_U0_cfgclk_UNCONNECTED;
  wire NLW_U0_cfgmclk_UNCONNECTED;
  wire NLW_U0_icap_csib_UNCONNECTED;
  wire NLW_U0_icap_rdwrb_UNCONNECTED;
  wire NLW_U0_preq_UNCONNECTED;
  wire [31:0]NLW_U0_icap_o_UNCONNECTED;

  (* C_BRAM_SRL_FIFO_TYPE = "1" *) 
  (* C_DEVICE_ID = "69353619" *) 
  (* C_ENABLE_ASYNC = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_ICAP_EXTERNAL = "0" *) 
  (* C_ICAP_WIDTH_S = "X32" *) 
  (* C_INCLUDE_STARTUP = "0" *) 
  (* C_MODE = "0" *) 
  (* C_NOREAD = "0" *) 
  (* C_OPERATION = "0" *) 
  (* C_READ_FIFO_DEPTH = "128" *) 
  (* C_SHARED_STARTUP = "0" *) 
  (* C_SIMULATION = "2" *) 
  (* C_S_AXI_ADDR_WIDTH = "9" *) 
  (* C_S_AXI_DATA_WIDTH = "32" *) 
  (* C_WRITE_FIFO_DEPTH = "64" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_hwicap U0
       (.cap_gnt(1'b0),
        .cap_rel(1'b0),
        .cap_req(NLW_U0_cap_req_UNCONNECTED),
        .cfgclk(NLW_U0_cfgclk_UNCONNECTED),
        .cfgmclk(NLW_U0_cfgmclk_UNCONNECTED),
        .clk(1'b0),
        .eos_in(eos_in),
        .gsr(1'b0),
        .gts(1'b0),
        .icap_avail(1'b0),
        .icap_clk(icap_clk),
        .icap_csib(NLW_U0_icap_csib_UNCONNECTED),
        .icap_i({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .icap_o(NLW_U0_icap_o_UNCONNECTED[31:0]),
        .icap_rdwrb(NLW_U0_icap_rdwrb_UNCONNECTED),
        .ip2intc_irpt(ip2intc_irpt),
        .keyclearb(1'b0),
        .pack(1'b0),
        .preq(NLW_U0_preq_UNCONNECTED),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .usrcclko(1'b0),
        .usrcclkts(1'b0),
        .usrdoneo(1'b0),
        .usrdonets(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hwicap
   (p_5_out_0,
    intr_rst,
    SR,
    Q,
    ipbus_ack_fifo,
    ipbus_ack,
    busip_1,
    p_5_out,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ,
    ram_full_fb_i_reg,
    ip2bus_rdack_i_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ,
    \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ,
    \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3] ,
    scndry_vect_out,
    scndry_out,
    \IP2Bus_Data_reg[30] ,
    \IP2Bus_Data_reg[29] ,
    \IP2Bus_Data_reg[20] ,
    \ip2bus_data_i_reg[0] ,
    s_axi_aclk,
    s_axi_wdata,
    p_10_in,
    IP2Bus_RdAck0,
    p_11_in,
    IP2Bus_WrAck0,
    p_8_in,
    Bus_RNW_reg,
    \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ,
    p_7_in,
    s_axi_aresetn,
    intr2bus_rdack,
    Bus_RNW_reg_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ,
    p_1_in5_in,
    p_1_in2_in,
    p_1_in,
    eos_in,
    E,
    D,
    \GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] );
  output [31:0]p_5_out_0;
  output intr_rst;
  output [0:0]SR;
  output [4:0]Q;
  output ipbus_ack_fifo;
  output ipbus_ack;
  output busip_1;
  output p_5_out;
  output [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  output ram_full_fb_i_reg;
  output ip2bus_rdack_i_reg;
  output \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  output \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  output [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  output \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ;
  output \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3] ;
  output [31:0]scndry_vect_out;
  output scndry_out;
  output \IP2Bus_Data_reg[30] ;
  output \IP2Bus_Data_reg[29] ;
  output [11:0]\IP2Bus_Data_reg[20] ;
  output [31:0]\ip2bus_data_i_reg[0] ;
  input s_axi_aclk;
  input [31:0]s_axi_wdata;
  input p_10_in;
  input IP2Bus_RdAck0;
  input p_11_in;
  input IP2Bus_WrAck0;
  input p_8_in;
  input Bus_RNW_reg;
  input \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  input p_7_in;
  input s_axi_aresetn;
  input intr2bus_rdack;
  input Bus_RNW_reg_reg;
  input \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  input p_1_in5_in;
  input p_1_in2_in;
  input p_1_in;
  input eos_in;
  input [0:0]E;
  input [31:0]D;
  input [0:0]\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire [31:0]D;
  wire [0:0]E;
  wire \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  wire [0:0]\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ;
  wire \GEN_FUNCTIONAL_UNISIM.abort_detect_reg_n_0 ;
  wire [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  wire \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  wire [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ;
  wire \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3] ;
  wire ICAP_Reset;
  wire [11:0]\IP2Bus_Data_reg[20] ;
  wire \IP2Bus_Data_reg[29] ;
  wire \IP2Bus_Data_reg[30] ;
  wire IP2Bus_RdAck0;
  wire IP2Bus_WrAck0;
  wire IPIC_IF_I_n_100;
  wire IPIC_IF_I_n_101;
  wire IPIC_IF_I_n_102;
  wire IPIC_IF_I_n_103;
  wire IPIC_IF_I_n_104;
  wire IPIC_IF_I_n_77;
  wire IPIC_IF_I_n_85;
  wire IPIC_IF_I_n_98;
  wire [4:0]Q;
  wire [0:0]SR;
  wire abort;
  wire abort_cs2;
  wire abort_del1;
  wire abort_del2;
  wire abort_del3;
  wire busip_1;
  wire ce_del1;
  wire ce_del2;
  wire ce_del3;
  wire eos_in;
  wire gate_icap_p;
  wire gtOp;
  wire hang_status;
  wire icap_ce;
  wire [0:31]icap_datain;
  wire [31:0]icap_dataout;
  wire icap_statemachine_I1_n_119;
  wire icap_statemachine_I1_n_120;
  wire icap_statemachine_I1_n_121;
  wire icap_statemachine_I1_n_40;
  wire icap_statemachine_I1_n_41;
  wire [0:31]icap_status_i;
  wire icap_we;
  wire intr2bus_rdack;
  wire intr_rst;
  wire [31:0]\ip2bus_data_i_reg[0] ;
  wire ip2bus_rdack_i_reg;
  wire ipbus_ack;
  wire ipbus_ack_fifo;
  wire p_10_in;
  wire p_11_in;
  wire p_1_in;
  wire p_1_in2_in;
  wire p_1_in5_in;
  wire p_5_out;
  wire [31:0]p_5_out_0;
  wire p_7_in;
  wire p_8_in;
  wire ram_full_fb_i_reg;
  wire [0:31]rdfifo_datain;
  wire rdfifo_wren;
  wire rdwr_int1;
  wire reset_cr;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [31:0]s_axi_wdata;
  wire same_cycle;
  wire scndry_out;
  wire [31:0]scndry_vect_out;
  wire send_done;
  wire [0:11]size;
  wire [0:11]size_counter;
  wire [0:31]wrfifo_dataout;
  wire wrfifo_rden;
  wire writefifo_empty;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1 GEN_BUS2ICAP_RESET
       (.prmry_in(SR),
        .s_axi_aclk(s_axi_aclk),
        .scndry_out(ICAP_Reset));
  (* box_type = "PRIMITIVE" *) 
  ICAPE2 #(
    .DEVICE_ID(32'h04224093),
    .ICAP_WIDTH("X32"),
    .SIM_CFG_FILE_NAME("NONE")) 
    \GEN_FUNCTIONAL_UNISIM.GEN_VIRTEX7_ICAP.ICAP_VIRTEX7_I 
       (.CLK(s_axi_aclk),
        .CSIB(icap_ce),
        .I({icap_datain[0],icap_datain[1],icap_datain[2],icap_datain[3],icap_datain[4],icap_datain[5],icap_datain[6],icap_datain[7],icap_datain[8],icap_datain[9],icap_datain[10],icap_datain[11],icap_datain[12],icap_datain[13],icap_datain[14],icap_datain[15],icap_datain[16],icap_datain[17],icap_datain[18],icap_datain[19],icap_datain[20],icap_datain[21],icap_datain[22],icap_datain[23],icap_datain[24],icap_datain[25],icap_datain[26],icap_datain[27],icap_datain[28],icap_datain[29],icap_datain[30],icap_datain[31]}),
        .O(icap_dataout),
        .RDWRB(icap_we));
  FDRE \GEN_FUNCTIONAL_UNISIM.abort_del1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_FUNCTIONAL_UNISIM.abort_detect_reg_n_0 ),
        .Q(abort_del1),
        .R(ICAP_Reset));
  FDRE \GEN_FUNCTIONAL_UNISIM.abort_del2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(abort_del1),
        .Q(abort_del2),
        .R(ICAP_Reset));
  FDRE \GEN_FUNCTIONAL_UNISIM.abort_del3_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(abort_del2),
        .Q(abort_del3),
        .R(ICAP_Reset));
  FDRE \GEN_FUNCTIONAL_UNISIM.abort_detect_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(icap_statemachine_I1_n_120),
        .Q(\GEN_FUNCTIONAL_UNISIM.abort_detect_reg_n_0 ),
        .R(1'b0));
  FDRE \GEN_FUNCTIONAL_UNISIM.ce_del1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(icap_ce),
        .Q(ce_del1),
        .R(ICAP_Reset));
  FDRE \GEN_FUNCTIONAL_UNISIM.ce_del2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ce_del1),
        .Q(ce_del2),
        .R(ICAP_Reset));
  FDRE \GEN_FUNCTIONAL_UNISIM.ce_del3_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ce_del2),
        .Q(ce_del3),
        .R(ICAP_Reset));
  FDSE \GEN_FUNCTIONAL_UNISIM.rdwr_int1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(icap_statemachine_I1_n_119),
        .Q(rdwr_int1),
        .S(ICAP_Reset));
  FDRE \GEN_FUNCTIONAL_UNISIM.same_cycle_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(icap_statemachine_I1_n_121),
        .Q(same_cycle),
        .R(ICAP_Reset));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ipic_if IPIC_IF_I
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .CO(gtOp),
        .D({wrfifo_dataout[0],wrfifo_dataout[1],wrfifo_dataout[2],wrfifo_dataout[3],wrfifo_dataout[4],wrfifo_dataout[5],wrfifo_dataout[6],wrfifo_dataout[7],wrfifo_dataout[8],wrfifo_dataout[9],wrfifo_dataout[10],wrfifo_dataout[11],wrfifo_dataout[12],wrfifo_dataout[13],wrfifo_dataout[14],wrfifo_dataout[15],wrfifo_dataout[16],wrfifo_dataout[17],wrfifo_dataout[18],wrfifo_dataout[19],wrfifo_dataout[20],wrfifo_dataout[21],wrfifo_dataout[22],wrfifo_dataout[23],wrfifo_dataout[24],wrfifo_dataout[25],wrfifo_dataout[26],wrfifo_dataout[27],wrfifo_dataout[28],wrfifo_dataout[29],wrfifo_dataout[30],wrfifo_dataout[31]}),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (IPIC_IF_I_n_102),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 (D),
        .E(E),
        .\FSM_sequential_icap_nstate_cs_reg[0] (IPIC_IF_I_n_104),
        .\FSM_sequential_icap_nstate_cs_reg[1] (IPIC_IF_I_n_103),
        .\FSM_sequential_icap_nstate_cs_reg[1]_0 ({icap_statemachine_I1_n_40,icap_statemachine_I1_n_41}),
        .\FSM_sequential_icap_nstate_cs_reg[2] (IPIC_IF_I_n_98),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to (Q),
        .\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] (\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ),
        .\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] (\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ),
        .\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] (\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ),
        .\GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3] (\GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3] ),
        .\IP2Bus_Data_reg[0]_0 (scndry_vect_out),
        .\IP2Bus_Data_reg[20]_0 (\IP2Bus_Data_reg[20] ),
        .\IP2Bus_Data_reg[29]_0 (\IP2Bus_Data_reg[29] ),
        .\IP2Bus_Data_reg[30]_0 (\IP2Bus_Data_reg[30] ),
        .\IP2Bus_Data_reg[31]_0 (scndry_out),
        .IP2Bus_RdAck0(IP2Bus_RdAck0),
        .IP2Bus_WrAck0(IP2Bus_WrAck0),
        .Q({rdfifo_datain[7],rdfifo_datain[6],rdfifo_datain[5],rdfifo_datain[4],rdfifo_datain[3],rdfifo_datain[2],rdfifo_datain[1],rdfifo_datain[0],rdfifo_datain[15],rdfifo_datain[14],rdfifo_datain[13],rdfifo_datain[12],rdfifo_datain[11],rdfifo_datain[10],rdfifo_datain[9],rdfifo_datain[8],rdfifo_datain[23],rdfifo_datain[22],rdfifo_datain[21],rdfifo_datain[20],rdfifo_datain[19],rdfifo_datain[18],rdfifo_datain[17],rdfifo_datain[16],rdfifo_datain[31],rdfifo_datain[30],rdfifo_datain[29],rdfifo_datain[28],rdfifo_datain[27],rdfifo_datain[26],rdfifo_datain[25],rdfifo_datain[24]}),
        .SR(intr_rst),
        .Send_done_cs_reg(IPIC_IF_I_n_77),
        .Send_done_cs_reg_0(IPIC_IF_I_n_101),
        .abort_cs2_reg(abort_cs2),
        .abort_i_cs_reg(abort),
        .busip_1(busip_1),
        .eos_in(eos_in),
        .fifo_rst_reg_0(SR),
        .gate_icap_p(gate_icap_p),
        .hang_status_cs_reg(hang_status),
        .\icap_status_i_reg[0] ({icap_status_i[0],icap_status_i[1],icap_status_i[2],icap_status_i[3],icap_status_i[4],icap_status_i[5],icap_status_i[6],icap_status_i[7],icap_status_i[8],icap_status_i[9],icap_status_i[10],icap_status_i[11],icap_status_i[12],icap_status_i[13],icap_status_i[14],icap_status_i[15],icap_status_i[16],icap_status_i[17],icap_status_i[18],icap_status_i[19],icap_status_i[20],icap_status_i[21],icap_status_i[22],icap_status_i[23],icap_status_i[24],icap_status_i[25],icap_status_i[26],icap_status_i[27],icap_status_i[28],icap_status_i[29],icap_status_i[30],icap_status_i[31]}),
        .intr2bus_rdack(intr2bus_rdack),
        .\ip2bus_data_i_reg[0] (\ip2bus_data_i_reg[0] ),
        .ip2bus_rdack_i_reg(ip2bus_rdack_i_reg),
        .ipbus_ack(ipbus_ack),
        .ipbus_ack_fifo(ipbus_ack_fifo),
        .out(writefifo_empty),
        .p_10_in(p_10_in),
        .p_11_in(p_11_in),
        .p_1_in(p_1_in),
        .p_1_in2_in(p_1_in2_in),
        .p_1_in5_in(p_1_in5_in),
        .p_5_out(p_5_out),
        .p_5_out_0(p_5_out_0),
        .p_7_in(p_7_in),
        .p_8_in(p_8_in),
        .prmry_in(send_done),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .rdfifo_wren(rdfifo_wren),
        .rdfifo_wren_cs_reg(IPIC_IF_I_n_85),
        .reset_cr_cs_reg(reset_cr),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_wdata(s_axi_wdata),
        .scndry_out(ICAP_Reset),
        .scndry_vect_out({size[0],size[1],size[2],size[3],size[4],size[5],size[6],size[7],size[8],size[9],size[10],size[11]}),
        .\size_cs_reg[0] ({size_counter[0],size_counter[1],size_counter[2],size_counter[3],size_counter[4],size_counter[5],size_counter[6],size_counter[7],size_counter[8],size_counter[9],size_counter[10],size_counter[11]}),
        .\size_cs_reg[11] (IPIC_IF_I_n_100),
        .wrfifo_rden(wrfifo_rden));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_icap_statemachine icap_statemachine_I1
       (.CO(gtOp),
        .D({wrfifo_dataout[0],wrfifo_dataout[1],wrfifo_dataout[2],wrfifo_dataout[3],wrfifo_dataout[4],wrfifo_dataout[5],wrfifo_dataout[6],wrfifo_dataout[7],wrfifo_dataout[8],wrfifo_dataout[9],wrfifo_dataout[10],wrfifo_dataout[11],wrfifo_dataout[12],wrfifo_dataout[13],wrfifo_dataout[14],wrfifo_dataout[15],wrfifo_dataout[16],wrfifo_dataout[17],wrfifo_dataout[18],wrfifo_dataout[19],wrfifo_dataout[20],wrfifo_dataout[21],wrfifo_dataout[22],wrfifo_dataout[23],wrfifo_dataout[24],wrfifo_dataout[25],wrfifo_dataout[26],wrfifo_dataout[27],wrfifo_dataout[28],wrfifo_dataout[29],wrfifo_dataout[30],wrfifo_dataout[31]}),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ({rdfifo_datain[7],rdfifo_datain[6],rdfifo_datain[5],rdfifo_datain[4],rdfifo_datain[3],rdfifo_datain[2],rdfifo_datain[1],rdfifo_datain[0],rdfifo_datain[15],rdfifo_datain[14],rdfifo_datain[13],rdfifo_datain[12],rdfifo_datain[11],rdfifo_datain[10],rdfifo_datain[9],rdfifo_datain[8],rdfifo_datain[23],rdfifo_datain[22],rdfifo_datain[21],rdfifo_datain[20],rdfifo_datain[19],rdfifo_datain[18],rdfifo_datain[17],rdfifo_datain[16],rdfifo_datain[31],rdfifo_datain[30],rdfifo_datain[29],rdfifo_datain[28],rdfifo_datain[27],rdfifo_datain[26],rdfifo_datain[25],rdfifo_datain[24]}),
        .\FSM_sequential_icap_nstate_cs_reg[0]_0 (IPIC_IF_I_n_100),
        .\FSM_sequential_icap_nstate_cs_reg[1]_0 (IPIC_IF_I_n_103),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to (reset_cr),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to_0 (hang_status),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 (abort),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 (IPIC_IF_I_n_77),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 (IPIC_IF_I_n_98),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_2 (IPIC_IF_I_n_102),
        .\GEN_FUNCTIONAL_UNISIM.abort_detect_reg (icap_statemachine_I1_n_120),
        .\GEN_FUNCTIONAL_UNISIM.abort_detect_reg_0 (\GEN_FUNCTIONAL_UNISIM.abort_detect_reg_n_0 ),
        .\GEN_FUNCTIONAL_UNISIM.rdwr_int1_reg (icap_statemachine_I1_n_119),
        .\GEN_FUNCTIONAL_UNISIM.same_cycle_reg (icap_statemachine_I1_n_121),
        .Q({size_counter[0],size_counter[1],size_counter[2],size_counter[3],size_counter[4],size_counter[5],size_counter[6],size_counter[7],size_counter[8],size_counter[9],size_counter[10],size_counter[11]}),
        .abort_del1(abort_del1),
        .abort_del2(abort_del2),
        .abort_del3(abort_del3),
        .abort_i_cs_reg_0({icap_statemachine_I1_n_40,icap_statemachine_I1_n_41}),
        .ce_del3(ce_del3),
        .gate_icap_p(gate_icap_p),
        .gate_signal_p_reg(IPIC_IF_I_n_85),
        .gate_signal_p_reg_0(IPIC_IF_I_n_101),
        .gate_signal_p_reg_1(IPIC_IF_I_n_104),
        .\icap_dataout_i_reg[0]_0 ({icap_datain[0],icap_datain[1],icap_datain[2],icap_datain[3],icap_datain[4],icap_datain[5],icap_datain[6],icap_datain[7],icap_datain[8],icap_datain[9],icap_datain[10],icap_datain[11],icap_datain[12],icap_datain[13],icap_datain[14],icap_datain[15],icap_datain[16],icap_datain[17],icap_datain[18],icap_datain[19],icap_datain[20],icap_datain[21],icap_datain[22],icap_datain[23],icap_datain[24],icap_datain[25],icap_datain[26],icap_datain[27],icap_datain[28],icap_datain[29],icap_datain[30],icap_datain[31]}),
        .\icap_status_i_reg[8]_0 ({icap_status_i[0],icap_status_i[1],icap_status_i[2],icap_status_i[3],icap_status_i[4],icap_status_i[5],icap_status_i[6],icap_status_i[7],icap_status_i[8],icap_status_i[9],icap_status_i[10],icap_status_i[11],icap_status_i[12],icap_status_i[13],icap_status_i[14],icap_status_i[15],icap_status_i[16],icap_status_i[17],icap_status_i[18],icap_status_i[19],icap_status_i[20],icap_status_i[21],icap_status_i[22],icap_status_i[23],icap_status_i[24],icap_status_i[25],icap_status_i[26],icap_status_i[27],icap_status_i[28],icap_status_i[29],icap_status_i[30],icap_status_i[31]}),
        .icap_we_cs_reg_0(icap_we),
        .in0({icap_dataout[31],icap_dataout[30],icap_dataout[29],icap_dataout[28],icap_dataout[27],icap_dataout[26],icap_dataout[25],icap_dataout[24],icap_dataout[23],icap_dataout[22],icap_dataout[21],icap_dataout[20],icap_dataout[19],icap_dataout[18],icap_dataout[17],icap_dataout[16],icap_dataout[15],icap_dataout[14],icap_dataout[13],icap_dataout[12],icap_dataout[11],icap_dataout[10],icap_dataout[9],icap_dataout[8],icap_dataout[7],icap_dataout[6],icap_dataout[5],icap_dataout[4],icap_dataout[3],icap_dataout[2],icap_dataout[1],icap_dataout[0]}),
        .out(icap_ce),
        .prmry_in(send_done),
        .ram_empty_i_reg(writefifo_empty),
        .rdfifo_wren(rdfifo_wren),
        .rdwr_int1(rdwr_int1),
        .s_axi_aclk(s_axi_aclk),
        .same_cycle(same_cycle),
        .scndry_out(ICAP_Reset),
        .scndry_vect_out({size[0],size[1],size[2],size[3],size[4],size[5],size[6],size[7],size[8],size[9],size[10],size[11]}),
        .\sr_i_reg[0] (abort_cs2),
        .wrfifo_rden(wrfifo_rden));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_icap_statemachine
   (out,
    icap_we_cs_reg_0,
    \icap_dataout_i_reg[0]_0 ,
    \sr_i_reg[0] ,
    rdfifo_wren,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to ,
    CO,
    prmry_in,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to_0 ,
    abort_i_cs_reg_0,
    Q,
    wrfifo_rden,
    \icap_status_i_reg[8]_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    \GEN_FUNCTIONAL_UNISIM.rdwr_int1_reg ,
    \GEN_FUNCTIONAL_UNISIM.abort_detect_reg ,
    \GEN_FUNCTIONAL_UNISIM.same_cycle_reg ,
    in0,
    s_axi_aclk,
    ram_empty_i_reg,
    scndry_out,
    gate_icap_p,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ,
    \FSM_sequential_icap_nstate_cs_reg[0]_0 ,
    gate_signal_p_reg,
    gate_signal_p_reg_0,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_2 ,
    \FSM_sequential_icap_nstate_cs_reg[1]_0 ,
    gate_signal_p_reg_1,
    scndry_vect_out,
    D,
    \GEN_FUNCTIONAL_UNISIM.abort_detect_reg_0 ,
    same_cycle,
    rdwr_int1,
    abort_del1,
    abort_del3,
    abort_del2,
    ce_del3);
  output out;
  output icap_we_cs_reg_0;
  output [31:0]\icap_dataout_i_reg[0]_0 ;
  output [0:0]\sr_i_reg[0] ;
  output rdfifo_wren;
  output \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to ;
  output [0:0]CO;
  output prmry_in;
  output \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to_0 ;
  output [1:0]abort_i_cs_reg_0;
  output [11:0]Q;
  output wrfifo_rden;
  output [31:0]\icap_status_i_reg[8]_0 ;
  output [31:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  output \GEN_FUNCTIONAL_UNISIM.rdwr_int1_reg ;
  output \GEN_FUNCTIONAL_UNISIM.abort_detect_reg ;
  output \GEN_FUNCTIONAL_UNISIM.same_cycle_reg ;
  input [0:31]in0;
  input s_axi_aclk;
  input ram_empty_i_reg;
  input scndry_out;
  input gate_icap_p;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ;
  input \FSM_sequential_icap_nstate_cs_reg[0]_0 ;
  input gate_signal_p_reg;
  input gate_signal_p_reg_0;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_2 ;
  input \FSM_sequential_icap_nstate_cs_reg[1]_0 ;
  input gate_signal_p_reg_1;
  input [11:0]scndry_vect_out;
  input [31:0]D;
  input \GEN_FUNCTIONAL_UNISIM.abort_detect_reg_0 ;
  input same_cycle;
  input rdwr_int1;
  input abort_del1;
  input abort_del3;
  input abort_del2;
  input ce_del3;

  wire [0:0]CO;
  wire [31:0]D;
  wire [31:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_7_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[0]_i_1_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[0]_i_3_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[0]_i_4_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[0]_i_5_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[1]_i_1_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[1]_i_2_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[1]_i_3_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[1]_i_4_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[2]_i_1_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[2]_i_3_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[2]_i_4_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[3]_i_1_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[3]_i_3_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[3]_i_4_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[3]_i_5_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[3]_i_7_n_0 ;
  wire \FSM_sequential_icap_nstate_cs[3]_i_8_n_0 ;
  wire \FSM_sequential_icap_nstate_cs_reg[0]_0 ;
  wire \FSM_sequential_icap_nstate_cs_reg[0]_i_2_n_0 ;
  wire \FSM_sequential_icap_nstate_cs_reg[1]_0 ;
  wire \FSM_sequential_icap_nstate_cs_reg[2]_i_2_n_0 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to_0 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_2 ;
  wire \GEN_FUNCTIONAL_UNISIM.abort_detect_reg ;
  wire \GEN_FUNCTIONAL_UNISIM.abort_detect_reg_0 ;
  wire \GEN_FUNCTIONAL_UNISIM.rdwr_int1_reg ;
  wire \GEN_FUNCTIONAL_UNISIM.same_cycle_reg ;
  wire Icap_busy_inferred_i_2_n_0;
  wire [11:0]Q;
  wire Send_done_cs_i_1_n_0;
  wire Send_done_ns;
  wire Wrfifo_empty_r;
  wire Wrfifo_empty_r1;
  wire abort_cs;
  wire abort_del1;
  wire abort_del2;
  wire abort_del3;
  wire abort_i_cs;
  wire abort_i_cs2;
  wire abort_i_cs_i_2_n_0;
  (* RTL_KEEP = "yes" *) wire [1:0]abort_i_cs_reg_0;
  wire abort_i_ns;
  wire abort_ns;
  wire ce_del3;
  wire [2:0]count;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire count_enable_cs;
  wire count_enable_cs_i_1_n_0;
  wire count_enable_cs_i_2_n_0;
  wire count_reset_cs;
  wire count_reset_cs_i_1_n_0;
  wire count_reset_ns;
  wire eqOp16_in;
  wire gate_icap_p;
  wire gate_signal_p_reg;
  wire gate_signal_p_reg_0;
  wire gate_signal_p_reg_1;
  wire gtOp_carry__0_i_1_n_0;
  wire gtOp_carry__0_i_2_n_0;
  wire gtOp_carry__0_i_3_n_0;
  wire gtOp_carry__0_i_4_n_0;
  wire gtOp_carry__0_n_3;
  wire gtOp_carry_i_1_n_0;
  wire gtOp_carry_i_2_n_0;
  wire gtOp_carry_i_3_n_0;
  wire gtOp_carry_i_4_n_0;
  wire gtOp_carry_i_5_n_0;
  wire gtOp_carry_i_6_n_0;
  wire gtOp_carry_i_7_n_0;
  wire gtOp_carry_i_8_n_0;
  wire gtOp_carry_n_0;
  wire gtOp_carry_n_1;
  wire gtOp_carry_n_2;
  wire gtOp_carry_n_3;
  wire hang_status_cs_i_1_n_0;
  wire hang_status_cs_i_2_n_0;
  wire hang_status_cs_i_3_n_0;
  wire hang_status_cs_i_4_n_0;
  wire icap_ce_cs_i_1_n_0;
  wire icap_ce_cs_i_2_n_0;
  wire icap_ce_cs_i_4_n_0;
  wire icap_ce_cs_i_5_n_0;
  wire icap_ce_cs_i_6_n_0;
  wire icap_ce_cs_i_7_n_0;
  wire icap_ce_cs_i_8_n_0;
  wire icap_ce_cs_i_9_n_0;
  wire icap_ce_ns;
  (* RTL_KEEP = "true" *) wire [31:0]\icap_dataout_i_reg[0]_0 ;
  (* RTL_KEEP = "yes" *) wire [3:2]icap_nstate_cs;
  wire [31:0]\icap_status_i_reg[8]_0 ;
  wire icap_we_cs_i_1_n_0;
  wire icap_we_cs_i_2_n_0;
  (* RTL_KEEP = "true" *) wire icap_we_cs_reg_0;
  (* RTL_KEEP = "true" *) wire [0:31]in0;
  wire [0:31]int1;
  (* RTL_KEEP = "true" *) wire out;
  (* RTL_KEEP = "true" *) wire p_0_in2_in;
  wire prmry_in;
  wire ram_empty_i_reg;
  wire rdfifo_wren;
  wire rdfifo_wren_cs_i_2_n_0;
  wire rdfifo_wren_cs_i_4_n_0;
  wire rdfifo_wren_ns;
  wire rdwr_int1;
  wire reset_cr_cs_i_2_n_0;
  wire reset_cr_ns;
  wire s_axi_aclk;
  wire same_cycle;
  wire scndry_out;
  wire [11:0]scndry_vect_out;
  wire \size_cs[0]_i_2_n_0 ;
  wire \size_cs[0]_i_4_n_0 ;
  wire \size_cs[0]_i_6_n_0 ;
  wire \size_cs[0]_i_7_n_0 ;
  wire \size_cs[0]_i_8_n_0 ;
  wire \size_cs[10]_i_1_n_0 ;
  wire \size_cs[11]_i_1_n_0 ;
  wire \size_cs[1]_i_1_n_0 ;
  wire \size_cs[2]_i_1_n_0 ;
  wire \size_cs[3]_i_1_n_0 ;
  wire \size_cs[3]_i_3_n_0 ;
  wire \size_cs[3]_i_4_n_0 ;
  wire \size_cs[3]_i_5_n_0 ;
  wire \size_cs[3]_i_6_n_0 ;
  wire \size_cs[4]_i_1_n_0 ;
  wire \size_cs[5]_i_1_n_0 ;
  wire \size_cs[6]_i_1_n_0 ;
  wire \size_cs[7]_i_1_n_0 ;
  wire \size_cs[7]_i_3_n_0 ;
  wire \size_cs[7]_i_4_n_0 ;
  wire \size_cs[7]_i_5_n_0 ;
  wire \size_cs[7]_i_6_n_0 ;
  wire \size_cs[8]_i_1_n_0 ;
  wire \size_cs[9]_i_1_n_0 ;
  wire \size_cs_reg[0]_i_5_n_2 ;
  wire \size_cs_reg[0]_i_5_n_3 ;
  wire \size_cs_reg[0]_i_5_n_5 ;
  wire \size_cs_reg[0]_i_5_n_6 ;
  wire \size_cs_reg[0]_i_5_n_7 ;
  wire \size_cs_reg[3]_i_2_n_0 ;
  wire \size_cs_reg[3]_i_2_n_1 ;
  wire \size_cs_reg[3]_i_2_n_2 ;
  wire \size_cs_reg[3]_i_2_n_3 ;
  wire \size_cs_reg[3]_i_2_n_4 ;
  wire \size_cs_reg[3]_i_2_n_5 ;
  wire \size_cs_reg[3]_i_2_n_6 ;
  wire \size_cs_reg[3]_i_2_n_7 ;
  wire \size_cs_reg[7]_i_2_n_0 ;
  wire \size_cs_reg[7]_i_2_n_1 ;
  wire \size_cs_reg[7]_i_2_n_2 ;
  wire \size_cs_reg[7]_i_2_n_3 ;
  wire \size_cs_reg[7]_i_2_n_4 ;
  wire \size_cs_reg[7]_i_2_n_5 ;
  wire \size_cs_reg[7]_i_2_n_6 ;
  wire \size_cs_reg[7]_i_2_n_7 ;
  wire size_ns;
  wire [0:0]\sr_i_reg[0] ;
  wire wrfifo_rden;
  wire [3:0]NLW_gtOp_carry_O_UNCONNECTED;
  wire [3:2]NLW_gtOp_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_gtOp_carry__0_O_UNCONNECTED;
  wire [3:2]\NLW_size_cs_reg[0]_i_5_CO_UNCONNECTED ;
  wire [3:3]\NLW_size_cs_reg[0]_i_5_O_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h00E2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_5 
       (.I0(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_2 ),
        .I1(icap_nstate_cs[2]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_7_n_0 ),
        .I3(icap_nstate_cs[3]),
        .O(wrfifo_rden));
  LUT6 #(
    .INIT(64'h0000003044444444)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_7 
       (.I0(ram_empty_i_reg),
        .I1(abort_i_cs_reg_0[0]),
        .I2(rdfifo_wren_cs_i_4_n_0),
        .I3(Wrfifo_empty_r),
        .I4(Wrfifo_empty_r1),
        .I5(abort_i_cs_reg_0[1]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hB8BBFFFFB8BB0000)) 
    \FSM_sequential_icap_nstate_cs[0]_i_1 
       (.I0(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ),
        .I1(icap_nstate_cs[2]),
        .I2(abort_i_cs_reg_0[1]),
        .I3(abort_i_cs_reg_0[0]),
        .I4(icap_nstate_cs[3]),
        .I5(\FSM_sequential_icap_nstate_cs_reg[0]_i_2_n_0 ),
        .O(\FSM_sequential_icap_nstate_cs[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBBBBFFFC)) 
    \FSM_sequential_icap_nstate_cs[0]_i_3 
       (.I0(p_0_in2_in),
        .I1(abort_i_cs_reg_0[0]),
        .I2(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .I3(gate_signal_p_reg_1),
        .I4(abort_i_cs_reg_0[1]),
        .O(\FSM_sequential_icap_nstate_cs[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hDFD00F0F)) 
    \FSM_sequential_icap_nstate_cs[0]_i_4 
       (.I0(CO),
        .I1(\FSM_sequential_icap_nstate_cs[0]_i_5_n_0 ),
        .I2(abort_i_cs_reg_0[0]),
        .I3(Wrfifo_empty_r1),
        .I4(abort_i_cs_reg_0[1]),
        .O(\FSM_sequential_icap_nstate_cs[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF7FFF0000)) 
    \FSM_sequential_icap_nstate_cs[0]_i_5 
       (.I0(p_0_in2_in),
        .I1(count[1]),
        .I2(count[0]),
        .I3(count[2]),
        .I4(rdfifo_wren_cs_i_4_n_0),
        .I5(gate_icap_p),
        .O(\FSM_sequential_icap_nstate_cs[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0F006F6F0F006060)) 
    \FSM_sequential_icap_nstate_cs[1]_i_1 
       (.I0(abort_i_cs_reg_0[1]),
        .I1(abort_i_cs_reg_0[0]),
        .I2(icap_nstate_cs[3]),
        .I3(\FSM_sequential_icap_nstate_cs[1]_i_2_n_0 ),
        .I4(icap_nstate_cs[2]),
        .I5(\FSM_sequential_icap_nstate_cs[1]_i_3_n_0 ),
        .O(\FSM_sequential_icap_nstate_cs[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8B8B888BCCCCCCCC)) 
    \FSM_sequential_icap_nstate_cs[1]_i_2 
       (.I0(\FSM_sequential_icap_nstate_cs[1]_i_4_n_0 ),
        .I1(abort_i_cs_reg_0[0]),
        .I2(Wrfifo_empty_r1),
        .I3(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .I4(out),
        .I5(abort_i_cs_reg_0[1]),
        .O(\FSM_sequential_icap_nstate_cs[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8F80)) 
    \FSM_sequential_icap_nstate_cs[1]_i_3 
       (.I0(p_0_in2_in),
        .I1(abort_i_cs_reg_0[1]),
        .I2(abort_i_cs_reg_0[0]),
        .I3(\FSM_sequential_icap_nstate_cs_reg[1]_0 ),
        .O(\FSM_sequential_icap_nstate_cs[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFD1000000)) 
    \FSM_sequential_icap_nstate_cs[1]_i_4 
       (.I0(eqOp16_in),
        .I1(p_0_in2_in),
        .I2(hang_status_cs_i_2_n_0),
        .I3(rdfifo_wren_cs_i_4_n_0),
        .I4(CO),
        .I5(gate_icap_p),
        .O(\FSM_sequential_icap_nstate_cs[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \FSM_sequential_icap_nstate_cs[2]_i_1 
       (.I0(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ),
        .I1(icap_nstate_cs[2]),
        .I2(abort_i_cs_reg_0[1]),
        .I3(abort_i_cs_reg_0[0]),
        .I4(icap_nstate_cs[3]),
        .I5(\FSM_sequential_icap_nstate_cs_reg[2]_i_2_n_0 ),
        .O(\FSM_sequential_icap_nstate_cs[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4700470047334700)) 
    \FSM_sequential_icap_nstate_cs[2]_i_3 
       (.I0(p_0_in2_in),
        .I1(abort_i_cs_reg_0[0]),
        .I2(ram_empty_i_reg),
        .I3(abort_i_cs_reg_0[1]),
        .I4(gate_signal_p_reg_1),
        .I5(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .O(\FSM_sequential_icap_nstate_cs[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFDFFFD0FFFFFFFF)) 
    \FSM_sequential_icap_nstate_cs[2]_i_4 
       (.I0(CO),
        .I1(gate_icap_p),
        .I2(abort_i_cs_reg_0[0]),
        .I3(rdfifo_wren_cs_i_4_n_0),
        .I4(Wrfifo_empty_r1),
        .I5(abort_i_cs_reg_0[1]),
        .O(\FSM_sequential_icap_nstate_cs[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB8CC)) 
    \FSM_sequential_icap_nstate_cs[3]_i_1 
       (.I0(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 ),
        .I1(icap_nstate_cs[3]),
        .I2(\FSM_sequential_icap_nstate_cs[3]_i_3_n_0 ),
        .I3(icap_nstate_cs[2]),
        .I4(\FSM_sequential_icap_nstate_cs[3]_i_4_n_0 ),
        .O(\FSM_sequential_icap_nstate_cs[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBB8B8833333333)) 
    \FSM_sequential_icap_nstate_cs[3]_i_3 
       (.I0(\FSM_sequential_icap_nstate_cs[3]_i_5_n_0 ),
        .I1(abort_i_cs_reg_0[0]),
        .I2(out),
        .I3(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .I4(Wrfifo_empty_r1),
        .I5(abort_i_cs_reg_0[1]),
        .O(\FSM_sequential_icap_nstate_cs[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \FSM_sequential_icap_nstate_cs[3]_i_4 
       (.I0(abort_i_cs_reg_0[1]),
        .I1(abort_i_cs_reg_0[0]),
        .I2(out),
        .I3(p_0_in2_in),
        .O(\FSM_sequential_icap_nstate_cs[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000002EFFFFFF)) 
    \FSM_sequential_icap_nstate_cs[3]_i_5 
       (.I0(eqOp16_in),
        .I1(p_0_in2_in),
        .I2(hang_status_cs_i_2_n_0),
        .I3(rdfifo_wren_cs_i_4_n_0),
        .I4(CO),
        .I5(gate_icap_p),
        .O(\FSM_sequential_icap_nstate_cs[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \FSM_sequential_icap_nstate_cs[3]_i_6 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[7]),
        .I3(Q[6]),
        .I4(\FSM_sequential_icap_nstate_cs[3]_i_7_n_0 ),
        .I5(\FSM_sequential_icap_nstate_cs[3]_i_8_n_0 ),
        .O(eqOp16_in));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FSM_sequential_icap_nstate_cs[3]_i_7 
       (.I0(Q[4]),
        .I1(Q[5]),
        .I2(Q[10]),
        .I3(Q[11]),
        .I4(Q[9]),
        .I5(Q[8]),
        .O(\FSM_sequential_icap_nstate_cs[3]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_icap_nstate_cs[3]_i_8 
       (.I0(Q[2]),
        .I1(Q[3]),
        .O(\FSM_sequential_icap_nstate_cs[3]_i_8_n_0 ));
  (* FSM_ENCODED_STATES = "icap_idle:0000,icap_write1:0010,icap_write5:0101,icap_write2:0110,icap_write3:0011,icap_write4:0100,icap_read1:0111,icap_abort0:0001,icap_abort_hang:1100,icap_abort1:1000,icap_abort2:1001,icap_abort3:1010,icap_abort4:1011,done:1101" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_icap_nstate_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_icap_nstate_cs[0]_i_1_n_0 ),
        .Q(abort_i_cs_reg_0[0]),
        .R(scndry_out));
  MUXF7 \FSM_sequential_icap_nstate_cs_reg[0]_i_2 
       (.I0(\FSM_sequential_icap_nstate_cs[0]_i_3_n_0 ),
        .I1(\FSM_sequential_icap_nstate_cs[0]_i_4_n_0 ),
        .O(\FSM_sequential_icap_nstate_cs_reg[0]_i_2_n_0 ),
        .S(icap_nstate_cs[2]));
  (* FSM_ENCODED_STATES = "icap_idle:0000,icap_write1:0010,icap_write5:0101,icap_write2:0110,icap_write3:0011,icap_write4:0100,icap_read1:0111,icap_abort0:0001,icap_abort_hang:1100,icap_abort1:1000,icap_abort2:1001,icap_abort3:1010,icap_abort4:1011,done:1101" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_icap_nstate_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_icap_nstate_cs[1]_i_1_n_0 ),
        .Q(abort_i_cs_reg_0[1]),
        .R(scndry_out));
  (* FSM_ENCODED_STATES = "icap_idle:0000,icap_write1:0010,icap_write5:0101,icap_write2:0110,icap_write3:0011,icap_write4:0100,icap_read1:0111,icap_abort0:0001,icap_abort_hang:1100,icap_abort1:1000,icap_abort2:1001,icap_abort3:1010,icap_abort4:1011,done:1101" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_icap_nstate_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_icap_nstate_cs[2]_i_1_n_0 ),
        .Q(icap_nstate_cs[2]),
        .R(scndry_out));
  MUXF7 \FSM_sequential_icap_nstate_cs_reg[2]_i_2 
       (.I0(\FSM_sequential_icap_nstate_cs[2]_i_3_n_0 ),
        .I1(\FSM_sequential_icap_nstate_cs[2]_i_4_n_0 ),
        .O(\FSM_sequential_icap_nstate_cs_reg[2]_i_2_n_0 ),
        .S(icap_nstate_cs[2]));
  (* FSM_ENCODED_STATES = "icap_idle:0000,icap_write1:0010,icap_write5:0101,icap_write2:0110,icap_write3:0011,icap_write4:0100,icap_read1:0111,icap_abort0:0001,icap_abort_hang:1100,icap_abort1:1000,icap_abort2:1001,icap_abort3:1010,icap_abort4:1011,done:1101" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_icap_nstate_cs_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_icap_nstate_cs[3]_i_1_n_0 ),
        .Q(icap_nstate_cs[3]),
        .R(scndry_out));
  LUT6 #(
    .INIT(64'h000000008ABABA8A)) 
    \GEN_FUNCTIONAL_UNISIM.abort_detect_i_1 
       (.I0(\GEN_FUNCTIONAL_UNISIM.abort_detect_reg_0 ),
        .I1(out),
        .I2(same_cycle),
        .I3(rdwr_int1),
        .I4(icap_we_cs_reg_0),
        .I5(scndry_out),
        .O(\GEN_FUNCTIONAL_UNISIM.abort_detect_reg ));
  LUT2 #(
    .INIT(4'hE)) 
    \GEN_FUNCTIONAL_UNISIM.rdwr_int1_i_1 
       (.I0(out),
        .I1(icap_we_cs_reg_0),
        .O(\GEN_FUNCTIONAL_UNISIM.rdwr_int1_reg ));
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_FUNCTIONAL_UNISIM.same_cycle_i_1 
       (.I0(out),
        .O(\GEN_FUNCTIONAL_UNISIM.same_cycle_reg ));
  LUT2 #(
    .INIT(4'hE)) 
    Icap_busy_inferred_i_1
       (.I0(abort_del1),
        .I1(Icap_busy_inferred_i_2_n_0),
        .O(p_0_in2_in));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFEFEEE)) 
    Icap_busy_inferred_i_2
       (.I0(abort_del3),
        .I1(abort_del2),
        .I2(icap_we_cs_reg_0),
        .I3(out),
        .I4(ce_del3),
        .I5(\GEN_FUNCTIONAL_UNISIM.abort_detect_reg_0 ),
        .O(Icap_busy_inferred_i_2_n_0));
  LUT6 #(
    .INIT(64'h7770FFFF77700000)) 
    Send_done_cs_i_1
       (.I0(abort_i_cs_reg_0[1]),
        .I1(icap_nstate_cs[3]),
        .I2(icap_nstate_cs[2]),
        .I3(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ),
        .I4(Send_done_ns),
        .I5(prmry_in),
        .O(Send_done_cs_i_1_n_0));
  LUT6 #(
    .INIT(64'h7400740030333000)) 
    Send_done_cs_i_3
       (.I0(abort_i_cs_reg_0[1]),
        .I1(icap_nstate_cs[3]),
        .I2(reset_cr_cs_i_2_n_0),
        .I3(icap_nstate_cs[2]),
        .I4(gate_signal_p_reg_0),
        .I5(abort_i_cs_reg_0[0]),
        .O(Send_done_ns));
  FDSE Send_done_cs_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Send_done_cs_i_1_n_0),
        .Q(prmry_in),
        .S(scndry_out));
  FDRE Wrfifo_empty_r1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Wrfifo_empty_r),
        .Q(Wrfifo_empty_r1),
        .R(1'b0));
  FDRE Wrfifo_empty_r_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ram_empty_i_reg),
        .Q(Wrfifo_empty_r),
        .R(1'b0));
  FDRE abort_cs2_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(abort_cs),
        .Q(\sr_i_reg[0] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h5400)) 
    abort_cs_i_1
       (.I0(icap_nstate_cs[2]),
        .I1(abort_i_cs_reg_0[0]),
        .I2(abort_i_cs_reg_0[1]),
        .I3(icap_nstate_cs[3]),
        .O(abort_ns));
  FDRE abort_cs_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(abort_ns),
        .Q(abort_cs),
        .R(1'b0));
  FDRE abort_i_cs2_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(abort_i_cs),
        .Q(abort_i_cs2),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h404A404A4F4F4F4A)) 
    abort_i_cs_i_1
       (.I0(icap_nstate_cs[3]),
        .I1(abort_i_cs_i_2_n_0),
        .I2(icap_nstate_cs[2]),
        .I3(abort_i_cs_reg_0[0]),
        .I4(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .I5(abort_i_cs_reg_0[1]),
        .O(abort_i_ns));
  LUT6 #(
    .INIT(64'h0000404F00000000)) 
    abort_i_cs_i_2
       (.I0(gate_icap_p),
        .I1(CO),
        .I2(abort_i_cs_reg_0[0]),
        .I3(Wrfifo_empty_r1),
        .I4(rdfifo_wren_cs_i_4_n_0),
        .I5(abort_i_cs_reg_0[1]),
        .O(abort_i_cs_i_2_n_0));
  FDRE abort_i_cs_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(abort_i_ns),
        .Q(abort_i_cs),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h000000000000D5AA)) 
    \count[0]_i_1 
       (.I0(count[0]),
        .I1(count[2]),
        .I2(count[1]),
        .I3(count_enable_cs),
        .I4(count_reset_cs),
        .I5(scndry_out),
        .O(\count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000EC6C)) 
    \count[1]_i_1 
       (.I0(count_enable_cs),
        .I1(count[1]),
        .I2(count[0]),
        .I3(count[2]),
        .I4(count_reset_cs),
        .I5(scndry_out),
        .O(\count[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000FF80)) 
    \count[2]_i_1 
       (.I0(count_enable_cs),
        .I1(count[1]),
        .I2(count[0]),
        .I3(count[2]),
        .I4(count_reset_cs),
        .I5(scndry_out),
        .O(\count[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEF3FFF3C20000000)) 
    count_enable_cs_i_1
       (.I0(count_enable_cs_i_2_n_0),
        .I1(icap_nstate_cs[3]),
        .I2(icap_nstate_cs[2]),
        .I3(abort_i_cs_reg_0[1]),
        .I4(abort_i_cs_reg_0[0]),
        .I5(count_enable_cs),
        .O(count_enable_cs_i_1_n_0));
  LUT5 #(
    .INIT(32'h00008A00)) 
    count_enable_cs_i_2
       (.I0(p_0_in2_in),
        .I1(out),
        .I2(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .I3(CO),
        .I4(gate_icap_p),
        .O(count_enable_cs_i_2_n_0));
  FDRE count_enable_cs_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(count_enable_cs_i_1_n_0),
        .Q(count_enable_cs),
        .R(scndry_out));
  FDRE \count_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\count[0]_i_1_n_0 ),
        .Q(count[0]),
        .R(1'b0));
  FDRE \count_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\count[1]_i_1_n_0 ),
        .Q(count[1]),
        .R(1'b0));
  FDRE \count_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\count[2]_i_1_n_0 ),
        .Q(count[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h404FFFFF404F0000)) 
    count_reset_cs_i_1
       (.I0(icap_nstate_cs[3]),
        .I1(gate_icap_p),
        .I2(abort_i_cs_reg_0[0]),
        .I3(abort_i_cs_reg_0[1]),
        .I4(count_reset_ns),
        .I5(count_reset_cs),
        .O(count_reset_cs_i_1_n_0));
  LUT5 #(
    .INIT(32'h40AA0005)) 
    count_reset_cs_i_2
       (.I0(icap_nstate_cs[3]),
        .I1(count_enable_cs_i_2_n_0),
        .I2(abort_i_cs_reg_0[0]),
        .I3(abort_i_cs_reg_0[1]),
        .I4(icap_nstate_cs[2]),
        .O(count_reset_ns));
  FDRE count_reset_cs_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(count_reset_cs_i_1_n_0),
        .Q(count_reset_cs),
        .R(scndry_out));
  CARRY4 gtOp_carry
       (.CI(1'b0),
        .CO({gtOp_carry_n_0,gtOp_carry_n_1,gtOp_carry_n_2,gtOp_carry_n_3}),
        .CYINIT(1'b0),
        .DI({gtOp_carry_i_1_n_0,gtOp_carry_i_2_n_0,gtOp_carry_i_3_n_0,gtOp_carry_i_4_n_0}),
        .O(NLW_gtOp_carry_O_UNCONNECTED[3:0]),
        .S({gtOp_carry_i_5_n_0,gtOp_carry_i_6_n_0,gtOp_carry_i_7_n_0,gtOp_carry_i_8_n_0}));
  CARRY4 gtOp_carry__0
       (.CI(gtOp_carry_n_0),
        .CO({NLW_gtOp_carry__0_CO_UNCONNECTED[3:2],CO,gtOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,gtOp_carry__0_i_1_n_0,gtOp_carry__0_i_2_n_0}),
        .O(NLW_gtOp_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,gtOp_carry__0_i_3_n_0,gtOp_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    gtOp_carry__0_i_1
       (.I0(Q[10]),
        .I1(Q[11]),
        .O(gtOp_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    gtOp_carry__0_i_2
       (.I0(Q[8]),
        .I1(Q[9]),
        .O(gtOp_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    gtOp_carry__0_i_3
       (.I0(Q[11]),
        .I1(Q[10]),
        .O(gtOp_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    gtOp_carry__0_i_4
       (.I0(Q[9]),
        .I1(Q[8]),
        .O(gtOp_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    gtOp_carry_i_1
       (.I0(Q[6]),
        .I1(Q[7]),
        .O(gtOp_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    gtOp_carry_i_2
       (.I0(Q[4]),
        .I1(Q[5]),
        .O(gtOp_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    gtOp_carry_i_3
       (.I0(Q[2]),
        .I1(Q[3]),
        .O(gtOp_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    gtOp_carry_i_4
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(gtOp_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    gtOp_carry_i_5
       (.I0(Q[7]),
        .I1(Q[6]),
        .O(gtOp_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    gtOp_carry_i_6
       (.I0(Q[5]),
        .I1(Q[4]),
        .O(gtOp_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    gtOp_carry_i_7
       (.I0(Q[3]),
        .I1(Q[2]),
        .O(gtOp_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    gtOp_carry_i_8
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(gtOp_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'h10FFFFFF10FF0000)) 
    hang_status_cs_i_1
       (.I0(icap_nstate_cs[3]),
        .I1(hang_status_cs_i_2_n_0),
        .I2(hang_status_cs_i_3_n_0),
        .I3(abort_i_cs_reg_0[1]),
        .I4(hang_status_cs_i_4_n_0),
        .I5(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to_0 ),
        .O(hang_status_cs_i_1_n_0));
  LUT3 #(
    .INIT(8'h7F)) 
    hang_status_cs_i_2
       (.I0(count[1]),
        .I1(count[0]),
        .I2(count[2]),
        .O(hang_status_cs_i_2_n_0));
  LUT3 #(
    .INIT(8'hD0)) 
    hang_status_cs_i_3
       (.I0(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .I1(out),
        .I2(p_0_in2_in),
        .O(hang_status_cs_i_3_n_0));
  LUT6 #(
    .INIT(64'h100000AA00000000)) 
    hang_status_cs_i_4
       (.I0(icap_nstate_cs[3]),
        .I1(gate_icap_p),
        .I2(CO),
        .I3(abort_i_cs_reg_0[1]),
        .I4(abort_i_cs_reg_0[0]),
        .I5(icap_nstate_cs[2]),
        .O(hang_status_cs_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    hang_status_cs_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(hang_status_cs_i_1_n_0),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to_0 ),
        .R(scndry_out));
  LUT6 #(
    .INIT(64'h7400FFFF74000000)) 
    icap_ce_cs_i_1
       (.I0(abort_i_cs_reg_0[1]),
        .I1(icap_nstate_cs[3]),
        .I2(icap_ce_cs_i_2_n_0),
        .I3(icap_nstate_cs[2]),
        .I4(icap_ce_ns),
        .I5(out),
        .O(icap_ce_cs_i_1_n_0));
  LUT6 #(
    .INIT(64'hABFFAB0000FF00FF)) 
    icap_ce_cs_i_2
       (.I0(icap_ce_cs_i_4_n_0),
        .I1(CO),
        .I2(gate_icap_p),
        .I3(abort_i_cs_reg_0[0]),
        .I4(Wrfifo_empty_r1),
        .I5(abort_i_cs_reg_0[1]),
        .O(icap_ce_cs_i_2_n_0));
  LUT5 #(
    .INIT(32'h77774410)) 
    icap_ce_cs_i_3
       (.I0(icap_nstate_cs[3]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .I3(abort_i_cs_reg_0[0]),
        .I4(icap_nstate_cs[2]),
        .O(icap_ce_ns));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    icap_ce_cs_i_4
       (.I0(icap_ce_cs_i_5_n_0),
        .I1(gate_icap_p),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(icap_ce_cs_i_6_n_0),
        .I5(icap_ce_cs_i_7_n_0),
        .O(icap_ce_cs_i_4_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    icap_ce_cs_i_5
       (.I0(Q[6]),
        .I1(Q[7]),
        .O(icap_ce_cs_i_5_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    icap_ce_cs_i_6
       (.I0(Q[4]),
        .I1(Q[5]),
        .O(icap_ce_cs_i_6_n_0));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    icap_ce_cs_i_7
       (.I0(icap_ce_cs_i_8_n_0),
        .I1(rdfifo_wren_cs_i_4_n_0),
        .I2(icap_ce_cs_i_9_n_0),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(p_0_in2_in),
        .O(icap_ce_cs_i_7_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    icap_ce_cs_i_8
       (.I0(Q[8]),
        .I1(Q[9]),
        .O(icap_ce_cs_i_8_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    icap_ce_cs_i_9
       (.I0(Q[10]),
        .I1(Q[11]),
        .O(icap_ce_cs_i_9_n_0));
  FDSE icap_ce_cs_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(icap_ce_cs_i_1_n_0),
        .Q(out),
        .S(scndry_out));
  FDRE \icap_datain_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[0]),
        .Q(\icap_dataout_i_reg[0]_0 [24]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[10]),
        .Q(\icap_dataout_i_reg[0]_0 [18]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[11]),
        .Q(\icap_dataout_i_reg[0]_0 [19]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[12]),
        .Q(\icap_dataout_i_reg[0]_0 [20]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[13]),
        .Q(\icap_dataout_i_reg[0]_0 [21]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[14]),
        .Q(\icap_dataout_i_reg[0]_0 [22]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[15]),
        .Q(\icap_dataout_i_reg[0]_0 [23]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[16]),
        .Q(\icap_dataout_i_reg[0]_0 [8]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[17]),
        .Q(\icap_dataout_i_reg[0]_0 [9]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[18]),
        .Q(\icap_dataout_i_reg[0]_0 [10]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[19]),
        .Q(\icap_dataout_i_reg[0]_0 [11]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[1]),
        .Q(\icap_dataout_i_reg[0]_0 [25]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[20]),
        .Q(\icap_dataout_i_reg[0]_0 [12]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[21]),
        .Q(\icap_dataout_i_reg[0]_0 [13]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[22]),
        .Q(\icap_dataout_i_reg[0]_0 [14]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[23]),
        .Q(\icap_dataout_i_reg[0]_0 [15]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[24]),
        .Q(\icap_dataout_i_reg[0]_0 [0]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[25]),
        .Q(\icap_dataout_i_reg[0]_0 [1]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[26]),
        .Q(\icap_dataout_i_reg[0]_0 [2]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[27]),
        .Q(\icap_dataout_i_reg[0]_0 [3]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[28]),
        .Q(\icap_dataout_i_reg[0]_0 [4]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[29]),
        .Q(\icap_dataout_i_reg[0]_0 [5]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[2]),
        .Q(\icap_dataout_i_reg[0]_0 [26]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[30]),
        .Q(\icap_dataout_i_reg[0]_0 [6]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[31]),
        .Q(\icap_dataout_i_reg[0]_0 [7]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[3]),
        .Q(\icap_dataout_i_reg[0]_0 [27]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[4]),
        .Q(\icap_dataout_i_reg[0]_0 [28]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[5]),
        .Q(\icap_dataout_i_reg[0]_0 [29]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[6]),
        .Q(\icap_dataout_i_reg[0]_0 [30]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[7]),
        .Q(\icap_dataout_i_reg[0]_0 [31]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[8]),
        .Q(\icap_dataout_i_reg[0]_0 [16]),
        .R(scndry_out));
  FDRE \icap_datain_cs_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(int1[9]),
        .Q(\icap_dataout_i_reg[0]_0 [17]),
        .R(scndry_out));
  FDRE \icap_dataout_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[0]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [31]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[10]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [21]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[11]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [20]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[12]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [19]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[13]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [18]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[14]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [17]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[15]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [16]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[16]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [15]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[17]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [14]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[18]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [13]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[19]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [12]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[1]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [30]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[20]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [11]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[21]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [10]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[22]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [9]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[23]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [8]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[24]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [7]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[25]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [6]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[26]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [5]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[27]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [4]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[28]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [3]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[29]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [2]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[2]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [29]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[30]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [1]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[31]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [0]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[3]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [28]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[4]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [27]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[5]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [26]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[6]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [25]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[7]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [24]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[8]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [23]),
        .R(1'b0));
  FDRE \icap_dataout_i_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(in0[9]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [22]),
        .R(1'b0));
  FDRE \icap_status_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(in0[24]),
        .Q(\icap_status_i_reg[8]_0 [31]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[10] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [29]),
        .Q(\icap_status_i_reg[8]_0 [21]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[11] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [28]),
        .Q(\icap_status_i_reg[8]_0 [20]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[12] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [27]),
        .Q(\icap_status_i_reg[8]_0 [19]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[13] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [26]),
        .Q(\icap_status_i_reg[8]_0 [18]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[14] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [25]),
        .Q(\icap_status_i_reg[8]_0 [17]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[15] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [24]),
        .Q(\icap_status_i_reg[8]_0 [16]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[16] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [23]),
        .Q(\icap_status_i_reg[8]_0 [15]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[17] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [22]),
        .Q(\icap_status_i_reg[8]_0 [14]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[18] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [21]),
        .Q(\icap_status_i_reg[8]_0 [13]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[19] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [20]),
        .Q(\icap_status_i_reg[8]_0 [12]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(in0[25]),
        .Q(\icap_status_i_reg[8]_0 [30]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[20] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [19]),
        .Q(\icap_status_i_reg[8]_0 [11]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[21] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [18]),
        .Q(\icap_status_i_reg[8]_0 [10]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[22] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [17]),
        .Q(\icap_status_i_reg[8]_0 [9]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[23] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [16]),
        .Q(\icap_status_i_reg[8]_0 [8]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[24] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [15]),
        .Q(\icap_status_i_reg[8]_0 [7]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[25] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [14]),
        .Q(\icap_status_i_reg[8]_0 [6]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[26] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [13]),
        .Q(\icap_status_i_reg[8]_0 [5]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[27] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [12]),
        .Q(\icap_status_i_reg[8]_0 [4]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[28] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [11]),
        .Q(\icap_status_i_reg[8]_0 [3]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[29] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [10]),
        .Q(\icap_status_i_reg[8]_0 [2]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(in0[26]),
        .Q(\icap_status_i_reg[8]_0 [29]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[30] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [9]),
        .Q(\icap_status_i_reg[8]_0 [1]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[31] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [8]),
        .Q(\icap_status_i_reg[8]_0 [0]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(in0[27]),
        .Q(\icap_status_i_reg[8]_0 [28]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(in0[28]),
        .Q(\icap_status_i_reg[8]_0 [27]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(in0[29]),
        .Q(\icap_status_i_reg[8]_0 [26]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(in0[30]),
        .Q(\icap_status_i_reg[8]_0 [25]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(in0[31]),
        .Q(\icap_status_i_reg[8]_0 [24]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [31]),
        .Q(\icap_status_i_reg[8]_0 [23]),
        .R(scndry_out));
  FDRE \icap_status_i_reg[9] 
       (.C(s_axi_aclk),
        .CE(abort_i_cs2),
        .D(\icap_status_i_reg[8]_0 [30]),
        .Q(\icap_status_i_reg[8]_0 [22]),
        .R(scndry_out));
  LUT6 #(
    .INIT(64'hEEEECCCF2E2E0000)) 
    icap_we_cs_i_1
       (.I0(icap_we_cs_i_2_n_0),
        .I1(icap_nstate_cs[3]),
        .I2(abort_i_cs_reg_0[1]),
        .I3(abort_i_cs_reg_0[0]),
        .I4(icap_nstate_cs[2]),
        .I5(icap_we_cs_reg_0),
        .O(icap_we_cs_i_1_n_0));
  LUT6 #(
    .INIT(64'hF0F0B0BF00000000)) 
    icap_we_cs_i_2
       (.I0(gate_icap_p),
        .I1(CO),
        .I2(abort_i_cs_reg_0[0]),
        .I3(Wrfifo_empty_r1),
        .I4(rdfifo_wren_cs_i_4_n_0),
        .I5(abort_i_cs_reg_0[1]),
        .O(icap_we_cs_i_2_n_0));
  FDSE icap_we_cs_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(icap_we_cs_i_1_n_0),
        .Q(icap_we_cs_reg_0),
        .S(scndry_out));
  FDRE \int1_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[31]),
        .Q(int1[0]),
        .R(scndry_out));
  FDRE \int1_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[21]),
        .Q(int1[10]),
        .R(scndry_out));
  FDRE \int1_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[20]),
        .Q(int1[11]),
        .R(scndry_out));
  FDRE \int1_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[19]),
        .Q(int1[12]),
        .R(scndry_out));
  FDRE \int1_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[18]),
        .Q(int1[13]),
        .R(scndry_out));
  FDRE \int1_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[17]),
        .Q(int1[14]),
        .R(scndry_out));
  FDRE \int1_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[16]),
        .Q(int1[15]),
        .R(scndry_out));
  FDRE \int1_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[15]),
        .Q(int1[16]),
        .R(scndry_out));
  FDRE \int1_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[14]),
        .Q(int1[17]),
        .R(scndry_out));
  FDRE \int1_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[13]),
        .Q(int1[18]),
        .R(scndry_out));
  FDRE \int1_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[12]),
        .Q(int1[19]),
        .R(scndry_out));
  FDRE \int1_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[30]),
        .Q(int1[1]),
        .R(scndry_out));
  FDRE \int1_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[11]),
        .Q(int1[20]),
        .R(scndry_out));
  FDRE \int1_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[10]),
        .Q(int1[21]),
        .R(scndry_out));
  FDRE \int1_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[9]),
        .Q(int1[22]),
        .R(scndry_out));
  FDRE \int1_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[8]),
        .Q(int1[23]),
        .R(scndry_out));
  FDRE \int1_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[7]),
        .Q(int1[24]),
        .R(scndry_out));
  FDRE \int1_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[6]),
        .Q(int1[25]),
        .R(scndry_out));
  FDRE \int1_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[5]),
        .Q(int1[26]),
        .R(scndry_out));
  FDRE \int1_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[4]),
        .Q(int1[27]),
        .R(scndry_out));
  FDRE \int1_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[3]),
        .Q(int1[28]),
        .R(scndry_out));
  FDRE \int1_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[2]),
        .Q(int1[29]),
        .R(scndry_out));
  FDRE \int1_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[29]),
        .Q(int1[2]),
        .R(scndry_out));
  FDRE \int1_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[1]),
        .Q(int1[30]),
        .R(scndry_out));
  FDRE \int1_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[0]),
        .Q(int1[31]),
        .R(scndry_out));
  FDRE \int1_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[28]),
        .Q(int1[3]),
        .R(scndry_out));
  FDRE \int1_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[27]),
        .Q(int1[4]),
        .R(scndry_out));
  FDRE \int1_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[26]),
        .Q(int1[5]),
        .R(scndry_out));
  FDRE \int1_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[25]),
        .Q(int1[6]),
        .R(scndry_out));
  FDRE \int1_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[24]),
        .Q(int1[7]),
        .R(scndry_out));
  FDRE \int1_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[23]),
        .Q(int1[8]),
        .R(scndry_out));
  FDRE \int1_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[22]),
        .Q(int1[9]),
        .R(scndry_out));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    rdfifo_wren_cs_i_1
       (.I0(icap_nstate_cs[2]),
        .I1(rdfifo_wren_cs_i_2_n_0),
        .I2(gate_signal_p_reg),
        .I3(rdfifo_wren_cs_i_4_n_0),
        .I4(p_0_in2_in),
        .I5(icap_nstate_cs[3]),
        .O(rdfifo_wren_ns));
  LUT2 #(
    .INIT(4'h8)) 
    rdfifo_wren_cs_i_2
       (.I0(abort_i_cs_reg_0[1]),
        .I1(abort_i_cs_reg_0[0]),
        .O(rdfifo_wren_cs_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    rdfifo_wren_cs_i_4
       (.I0(out),
        .I1(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .O(rdfifo_wren_cs_i_4_n_0));
  FDRE rdfifo_wren_cs_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rdfifo_wren_ns),
        .Q(rdfifo_wren),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h4F400000)) 
    reset_cr_cs_i_1
       (.I0(abort_i_cs_reg_0[1]),
        .I1(abort_i_cs_reg_0[0]),
        .I2(icap_nstate_cs[3]),
        .I3(reset_cr_cs_i_2_n_0),
        .I4(icap_nstate_cs[2]),
        .O(reset_cr_ns));
  LUT5 #(
    .INIT(32'h1F100F0F)) 
    reset_cr_cs_i_2
       (.I0(gate_icap_p),
        .I1(CO),
        .I2(abort_i_cs_reg_0[0]),
        .I3(Wrfifo_empty_r1),
        .I4(abort_i_cs_reg_0[1]),
        .O(reset_cr_cs_i_2_n_0));
  FDRE reset_cr_cs_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(reset_cr_ns),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h00E2)) 
    \size_cs[0]_i_1 
       (.I0(\FSM_sequential_icap_nstate_cs_reg[0]_0 ),
        .I1(icap_nstate_cs[2]),
        .I2(\size_cs[0]_i_4_n_0 ),
        .I3(icap_nstate_cs[3]),
        .O(size_ns));
  LUT3 #(
    .INIT(8'hE2)) 
    \size_cs[0]_i_2 
       (.I0(scndry_vect_out[11]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(\size_cs_reg[0]_i_5_n_5 ),
        .O(\size_cs[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \size_cs[0]_i_4 
       (.I0(abort_i_cs_reg_0[0]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(gate_icap_p),
        .I3(CO),
        .I4(rdfifo_wren_cs_i_4_n_0),
        .I5(p_0_in2_in),
        .O(\size_cs[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \size_cs[0]_i_6 
       (.I0(Q[11]),
        .O(\size_cs[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \size_cs[0]_i_7 
       (.I0(Q[10]),
        .O(\size_cs[0]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \size_cs[0]_i_8 
       (.I0(Q[9]),
        .O(\size_cs[0]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \size_cs[10]_i_1 
       (.I0(scndry_vect_out[1]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(\size_cs_reg[7]_i_2_n_7 ),
        .O(\size_cs[10]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h2E)) 
    \size_cs[11]_i_1 
       (.I0(scndry_vect_out[0]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(Q[0]),
        .O(\size_cs[11]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \size_cs[1]_i_1 
       (.I0(scndry_vect_out[10]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(\size_cs_reg[0]_i_5_n_6 ),
        .O(\size_cs[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \size_cs[2]_i_1 
       (.I0(scndry_vect_out[9]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(\size_cs_reg[0]_i_5_n_7 ),
        .O(\size_cs[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \size_cs[3]_i_1 
       (.I0(scndry_vect_out[8]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(\size_cs_reg[3]_i_2_n_4 ),
        .O(\size_cs[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \size_cs[3]_i_3 
       (.I0(Q[8]),
        .O(\size_cs[3]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \size_cs[3]_i_4 
       (.I0(Q[7]),
        .O(\size_cs[3]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \size_cs[3]_i_5 
       (.I0(Q[6]),
        .O(\size_cs[3]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \size_cs[3]_i_6 
       (.I0(Q[5]),
        .O(\size_cs[3]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \size_cs[4]_i_1 
       (.I0(scndry_vect_out[7]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(\size_cs_reg[3]_i_2_n_5 ),
        .O(\size_cs[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \size_cs[5]_i_1 
       (.I0(scndry_vect_out[6]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(\size_cs_reg[3]_i_2_n_6 ),
        .O(\size_cs[5]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \size_cs[6]_i_1 
       (.I0(scndry_vect_out[5]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(\size_cs_reg[3]_i_2_n_7 ),
        .O(\size_cs[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \size_cs[7]_i_1 
       (.I0(scndry_vect_out[4]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(\size_cs_reg[7]_i_2_n_4 ),
        .O(\size_cs[7]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \size_cs[7]_i_3 
       (.I0(Q[4]),
        .O(\size_cs[7]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \size_cs[7]_i_4 
       (.I0(Q[3]),
        .O(\size_cs[7]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \size_cs[7]_i_5 
       (.I0(Q[2]),
        .O(\size_cs[7]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \size_cs[7]_i_6 
       (.I0(Q[1]),
        .O(\size_cs[7]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \size_cs[8]_i_1 
       (.I0(scndry_vect_out[3]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(\size_cs_reg[7]_i_2_n_5 ),
        .O(\size_cs[8]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \size_cs[9]_i_1 
       (.I0(scndry_vect_out[2]),
        .I1(abort_i_cs_reg_0[1]),
        .I2(\size_cs_reg[7]_i_2_n_6 ),
        .O(\size_cs[9]_i_1_n_0 ));
  FDRE \size_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(size_ns),
        .D(\size_cs[0]_i_2_n_0 ),
        .Q(Q[11]),
        .R(scndry_out));
  CARRY4 \size_cs_reg[0]_i_5 
       (.CI(\size_cs_reg[3]_i_2_n_0 ),
        .CO({\NLW_size_cs_reg[0]_i_5_CO_UNCONNECTED [3:2],\size_cs_reg[0]_i_5_n_2 ,\size_cs_reg[0]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Q[10:9]}),
        .O({\NLW_size_cs_reg[0]_i_5_O_UNCONNECTED [3],\size_cs_reg[0]_i_5_n_5 ,\size_cs_reg[0]_i_5_n_6 ,\size_cs_reg[0]_i_5_n_7 }),
        .S({1'b0,\size_cs[0]_i_6_n_0 ,\size_cs[0]_i_7_n_0 ,\size_cs[0]_i_8_n_0 }));
  FDRE \size_cs_reg[10] 
       (.C(s_axi_aclk),
        .CE(size_ns),
        .D(\size_cs[10]_i_1_n_0 ),
        .Q(Q[1]),
        .R(scndry_out));
  FDRE \size_cs_reg[11] 
       (.C(s_axi_aclk),
        .CE(size_ns),
        .D(\size_cs[11]_i_1_n_0 ),
        .Q(Q[0]),
        .R(scndry_out));
  FDRE \size_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(size_ns),
        .D(\size_cs[1]_i_1_n_0 ),
        .Q(Q[10]),
        .R(scndry_out));
  FDRE \size_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(size_ns),
        .D(\size_cs[2]_i_1_n_0 ),
        .Q(Q[9]),
        .R(scndry_out));
  FDRE \size_cs_reg[3] 
       (.C(s_axi_aclk),
        .CE(size_ns),
        .D(\size_cs[3]_i_1_n_0 ),
        .Q(Q[8]),
        .R(scndry_out));
  CARRY4 \size_cs_reg[3]_i_2 
       (.CI(\size_cs_reg[7]_i_2_n_0 ),
        .CO({\size_cs_reg[3]_i_2_n_0 ,\size_cs_reg[3]_i_2_n_1 ,\size_cs_reg[3]_i_2_n_2 ,\size_cs_reg[3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(Q[8:5]),
        .O({\size_cs_reg[3]_i_2_n_4 ,\size_cs_reg[3]_i_2_n_5 ,\size_cs_reg[3]_i_2_n_6 ,\size_cs_reg[3]_i_2_n_7 }),
        .S({\size_cs[3]_i_3_n_0 ,\size_cs[3]_i_4_n_0 ,\size_cs[3]_i_5_n_0 ,\size_cs[3]_i_6_n_0 }));
  FDRE \size_cs_reg[4] 
       (.C(s_axi_aclk),
        .CE(size_ns),
        .D(\size_cs[4]_i_1_n_0 ),
        .Q(Q[7]),
        .R(scndry_out));
  FDRE \size_cs_reg[5] 
       (.C(s_axi_aclk),
        .CE(size_ns),
        .D(\size_cs[5]_i_1_n_0 ),
        .Q(Q[6]),
        .R(scndry_out));
  FDRE \size_cs_reg[6] 
       (.C(s_axi_aclk),
        .CE(size_ns),
        .D(\size_cs[6]_i_1_n_0 ),
        .Q(Q[5]),
        .R(scndry_out));
  FDRE \size_cs_reg[7] 
       (.C(s_axi_aclk),
        .CE(size_ns),
        .D(\size_cs[7]_i_1_n_0 ),
        .Q(Q[4]),
        .R(scndry_out));
  CARRY4 \size_cs_reg[7]_i_2 
       (.CI(1'b0),
        .CO({\size_cs_reg[7]_i_2_n_0 ,\size_cs_reg[7]_i_2_n_1 ,\size_cs_reg[7]_i_2_n_2 ,\size_cs_reg[7]_i_2_n_3 }),
        .CYINIT(Q[0]),
        .DI(Q[4:1]),
        .O({\size_cs_reg[7]_i_2_n_4 ,\size_cs_reg[7]_i_2_n_5 ,\size_cs_reg[7]_i_2_n_6 ,\size_cs_reg[7]_i_2_n_7 }),
        .S({\size_cs[7]_i_3_n_0 ,\size_cs[7]_i_4_n_0 ,\size_cs[7]_i_5_n_0 ,\size_cs[7]_i_6_n_0 }));
  FDRE \size_cs_reg[8] 
       (.C(s_axi_aclk),
        .CE(size_ns),
        .D(\size_cs[8]_i_1_n_0 ),
        .Q(Q[3]),
        .R(scndry_out));
  FDRE \size_cs_reg[9] 
       (.C(s_axi_aclk),
        .CE(size_ns),
        .D(\size_cs[9]_i_1_n_0 ),
        .Q(Q[2]),
        .R(scndry_out));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_interrupt_control
   (irpt_wrack_d1,
    \ip2bus_data_i_reg[31] ,
    p_1_in5_in,
    p_1_in2_in,
    p_1_in,
    intr2bus_wrack,
    irpt_rdack_d1,
    intr2bus_rdack,
    ipif_glbl_irpt_enable_reg,
    ip2intc_irpt,
    D,
    intr_rst,
    irpt_wrack,
    s_axi_aclk,
    \wr_data_count_i_reg[5] ,
    \rd_dc_i_reg[6] ,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ,
    \RD_FIFO.rdfifo_full_d1_reg ,
    interrupt_wrce_strb,
    irpt_rdack,
    intr2bus_rdack0,
    \GEN_BKEND_CE_REGISTERS[7].ce_out_i_reg[7] ,
    \IP2Bus_Data_reg[28] ,
    p_16_in,
    p_14_in,
    E,
    s_axi_wdata);
  output irpt_wrack_d1;
  output \ip2bus_data_i_reg[31] ;
  output p_1_in5_in;
  output p_1_in2_in;
  output p_1_in;
  output intr2bus_wrack;
  output irpt_rdack_d1;
  output intr2bus_rdack;
  output ipif_glbl_irpt_enable_reg;
  output ip2intc_irpt;
  output [3:0]D;
  input intr_rst;
  input irpt_wrack;
  input s_axi_aclk;
  input \wr_data_count_i_reg[5] ;
  input \rd_dc_i_reg[6] ;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ;
  input \RD_FIFO.rdfifo_full_d1_reg ;
  input interrupt_wrce_strb;
  input irpt_rdack;
  input intr2bus_rdack0;
  input \GEN_BKEND_CE_REGISTERS[7].ce_out_i_reg[7] ;
  input [3:0]\IP2Bus_Data_reg[28] ;
  input p_16_in;
  input p_14_in;
  input [0:0]E;
  input [3:0]s_axi_wdata;

  wire [3:0]D;
  wire [0:0]E;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ;
  wire \GEN_BKEND_CE_REGISTERS[7].ce_out_i_reg[7] ;
  wire [3:0]\IP2Bus_Data_reg[28] ;
  wire \RD_FIFO.rdfifo_full_d1_reg ;
  wire interrupt_wrce_strb;
  wire intr2bus_rdack;
  wire intr2bus_rdack0;
  wire intr2bus_wrack;
  wire intr_rst;
  wire \ip2bus_data_i_reg[31] ;
  wire ip2intc_irpt;
  wire ip2intc_irpt_INST_0_i_1_n_0;
  wire \ip_irpt_enable_reg_reg_n_0_[0] ;
  wire ipif_glbl_irpt_enable_reg;
  wire irpt_rdack;
  wire irpt_rdack_d1;
  wire irpt_wrack;
  wire irpt_wrack_d1;
  wire p_0_in;
  wire p_0_in1_in;
  wire p_0_in4_in;
  wire p_14_in;
  wire p_16_in;
  wire p_1_in;
  wire p_1_in2_in;
  wire p_1_in5_in;
  wire \rd_dc_i_reg[6] ;
  wire s_axi_aclk;
  wire [3:0]s_axi_wdata;
  wire \wr_data_count_i_reg[5] ;

  FDRE \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\wr_data_count_i_reg[5] ),
        .Q(\ip2bus_data_i_reg[31] ),
        .R(intr_rst));
  FDRE \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\rd_dc_i_reg[6] ),
        .Q(p_1_in5_in),
        .R(intr_rst));
  FDRE \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .Q(p_1_in2_in),
        .R(intr_rst));
  FDRE \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RD_FIFO.rdfifo_full_d1_reg ),
        .Q(p_1_in),
        .R(intr_rst));
  FDRE intr2bus_rdack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(intr2bus_rdack0),
        .Q(intr2bus_rdack),
        .R(intr_rst));
  FDRE intr2bus_wrack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(interrupt_wrce_strb),
        .Q(intr2bus_wrack),
        .R(intr_rst));
  LUT5 #(
    .INIT(32'hEEFAEEAA)) 
    \ip2bus_data_i[28]_i_1 
       (.I0(\IP2Bus_Data_reg[28] [3]),
        .I1(p_1_in),
        .I2(p_0_in4_in),
        .I3(p_16_in),
        .I4(p_14_in),
        .O(D[3]));
  LUT5 #(
    .INIT(32'hEEFAEEAA)) 
    \ip2bus_data_i[29]_i_1 
       (.I0(\IP2Bus_Data_reg[28] [2]),
        .I1(p_1_in2_in),
        .I2(p_0_in1_in),
        .I3(p_16_in),
        .I4(p_14_in),
        .O(D[2]));
  LUT5 #(
    .INIT(32'hEEFAEEAA)) 
    \ip2bus_data_i[30]_i_1 
       (.I0(\IP2Bus_Data_reg[28] [1]),
        .I1(p_1_in5_in),
        .I2(p_0_in),
        .I3(p_16_in),
        .I4(p_14_in),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hEEFAEEAA)) 
    \ip2bus_data_i[31]_i_1 
       (.I0(\IP2Bus_Data_reg[28] [0]),
        .I1(\ip2bus_data_i_reg[31] ),
        .I2(\ip_irpt_enable_reg_reg_n_0_[0] ),
        .I3(p_16_in),
        .I4(p_14_in),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFAAEAAAEAAAEAAA)) 
    ip2intc_irpt_INST_0
       (.I0(ip2intc_irpt_INST_0_i_1_n_0),
        .I1(p_1_in2_in),
        .I2(p_0_in1_in),
        .I3(ipif_glbl_irpt_enable_reg),
        .I4(p_0_in4_in),
        .I5(p_1_in),
        .O(ip2intc_irpt));
  LUT5 #(
    .INIT(32'hF0808080)) 
    ip2intc_irpt_INST_0_i_1
       (.I0(p_0_in),
        .I1(p_1_in5_in),
        .I2(ipif_glbl_irpt_enable_reg),
        .I3(\ip_irpt_enable_reg_reg_n_0_[0] ),
        .I4(\ip2bus_data_i_reg[31] ),
        .O(ip2intc_irpt_INST_0_i_1_n_0));
  FDRE \ip_irpt_enable_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[0]),
        .Q(\ip_irpt_enable_reg_reg_n_0_[0] ),
        .R(intr_rst));
  FDRE \ip_irpt_enable_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[1]),
        .Q(p_0_in),
        .R(intr_rst));
  FDRE \ip_irpt_enable_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[2]),
        .Q(p_0_in1_in),
        .R(intr_rst));
  FDRE \ip_irpt_enable_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[3]),
        .Q(p_0_in4_in),
        .R(intr_rst));
  FDRE ipif_glbl_irpt_enable_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_BKEND_CE_REGISTERS[7].ce_out_i_reg[7] ),
        .Q(ipif_glbl_irpt_enable_reg),
        .R(intr_rst));
  FDRE irpt_rdack_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(irpt_rdack),
        .Q(irpt_rdack_d1),
        .R(intr_rst));
  FDRE irpt_wrack_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(irpt_wrack),
        .Q(irpt_wrack_d1),
        .R(intr_rst));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ipic_if
   (D,
    out,
    p_5_out_0,
    SR,
    fifo_rst_reg_0,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to ,
    ipbus_ack_fifo,
    ipbus_ack,
    busip_1,
    p_5_out,
    gate_icap_p,
    Send_done_cs_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ,
    ram_full_fb_i_reg,
    rdfifo_wren_cs_reg,
    ip2bus_rdack_i_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ,
    \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ,
    \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3] ,
    \FSM_sequential_icap_nstate_cs_reg[2] ,
    abort_i_cs_reg,
    \size_cs_reg[11] ,
    Send_done_cs_reg_0,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    \FSM_sequential_icap_nstate_cs_reg[1] ,
    \FSM_sequential_icap_nstate_cs_reg[0] ,
    scndry_vect_out,
    \IP2Bus_Data_reg[0]_0 ,
    \IP2Bus_Data_reg[31]_0 ,
    \IP2Bus_Data_reg[30]_0 ,
    \IP2Bus_Data_reg[29]_0 ,
    \IP2Bus_Data_reg[20]_0 ,
    \ip2bus_data_i_reg[0] ,
    s_axi_aclk,
    s_axi_wdata,
    Q,
    p_10_in,
    IP2Bus_RdAck0,
    p_11_in,
    IP2Bus_WrAck0,
    scndry_out,
    wrfifo_rden,
    p_8_in,
    Bus_RNW_reg,
    rdfifo_wren,
    \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ,
    p_7_in,
    s_axi_aresetn,
    CO,
    intr2bus_rdack,
    Bus_RNW_reg_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ,
    p_1_in5_in,
    p_1_in2_in,
    p_1_in,
    \FSM_sequential_icap_nstate_cs_reg[1]_0 ,
    prmry_in,
    reset_cr_cs_reg,
    hang_status_cs_reg,
    eos_in,
    \size_cs_reg[0] ,
    E,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ,
    abort_cs2_reg,
    \icap_status_i_reg[0] ,
    \GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] );
  output [31:0]D;
  output out;
  output [31:0]p_5_out_0;
  output [0:0]SR;
  output [0:0]fifo_rst_reg_0;
  output [4:0]\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to ;
  output ipbus_ack_fifo;
  output ipbus_ack;
  output busip_1;
  output p_5_out;
  output gate_icap_p;
  output Send_done_cs_reg;
  output [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  output ram_full_fb_i_reg;
  output rdfifo_wren_cs_reg;
  output ip2bus_rdack_i_reg;
  output \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  output \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  output [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  output \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ;
  output \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3] ;
  output \FSM_sequential_icap_nstate_cs_reg[2] ;
  output abort_i_cs_reg;
  output \size_cs_reg[11] ;
  output Send_done_cs_reg_0;
  output \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  output \FSM_sequential_icap_nstate_cs_reg[1] ;
  output \FSM_sequential_icap_nstate_cs_reg[0] ;
  output [11:0]scndry_vect_out;
  output [31:0]\IP2Bus_Data_reg[0]_0 ;
  output \IP2Bus_Data_reg[31]_0 ;
  output \IP2Bus_Data_reg[30]_0 ;
  output \IP2Bus_Data_reg[29]_0 ;
  output [11:0]\IP2Bus_Data_reg[20]_0 ;
  output [31:0]\ip2bus_data_i_reg[0] ;
  input s_axi_aclk;
  input [31:0]s_axi_wdata;
  input [31:0]Q;
  input p_10_in;
  input IP2Bus_RdAck0;
  input p_11_in;
  input IP2Bus_WrAck0;
  input scndry_out;
  input wrfifo_rden;
  input p_8_in;
  input Bus_RNW_reg;
  input rdfifo_wren;
  input \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  input p_7_in;
  input s_axi_aresetn;
  input [0:0]CO;
  input intr2bus_rdack;
  input Bus_RNW_reg_reg;
  input \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  input p_1_in5_in;
  input p_1_in2_in;
  input p_1_in;
  input [1:0]\FSM_sequential_icap_nstate_cs_reg[1]_0 ;
  input prmry_in;
  input reset_cr_cs_reg;
  input hang_status_cs_reg;
  input eos_in;
  input [11:0]\size_cs_reg[0] ;
  input [0:0]E;
  input [31:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  input [0:0]abort_cs2_reg;
  input [31:0]\icap_status_i_reg[0] ;
  input [0:0]\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire [0:0]CO;
  wire [31:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [31:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  wire [0:0]E;
  wire \FSM_sequential_icap_nstate_cs_reg[0] ;
  wire \FSM_sequential_icap_nstate_cs_reg[1] ;
  wire [1:0]\FSM_sequential_icap_nstate_cs_reg[1]_0 ;
  wire \FSM_sequential_icap_nstate_cs_reg[2] ;
  wire [4:0]\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to ;
  wire \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  wire [0:0]\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ;
  wire [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  wire \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  wire [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ;
  wire \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3] ;
  wire [31:0]\IP2Bus_Data_reg[0]_0 ;
  wire [11:0]\IP2Bus_Data_reg[20]_0 ;
  wire \IP2Bus_Data_reg[29]_0 ;
  wire \IP2Bus_Data_reg[30]_0 ;
  wire \IP2Bus_Data_reg[31]_0 ;
  wire IP2Bus_RdAck0;
  wire IP2Bus_WrAck0;
  wire [31:0]Q;
  wire \RD_FIFO.RDDATA_FIFO_I_n_34 ;
  wire \RD_FIFO.RDDATA_FIFO_I_n_36 ;
  wire \RD_FIFO.RDDATA_FIFO_I_n_46 ;
  wire \RD_FIFO.RDFULL_SYNCH_n_0 ;
  wire [0:0]SR;
  wire Send_done_cs_reg;
  wire Send_done_cs_reg_0;
  wire [0:11]Size_counter_i2;
  wire \WRFIFO.WRDATA_FIFO_I_n_0 ;
  wire \WRFIFO.WRDATA_FIFO_I_n_43 ;
  wire [0:0]abort_cs2_reg;
  wire abort_i_cs_reg;
  wire abort_onreset;
  wire abort_onreset0;
  wire busip_1;
  wire cr_i0;
  wire eos_in;
  wire fifo_clear;
  wire fifo_full_mask;
  wire fifo_rst;
  wire [0:0]fifo_rst_reg_0;
  wire gate_icap_p;
  wire hang_status_cs_reg;
  wire [31:0]\icap_status_i_reg[0] ;
  wire intr2bus_rdack;
  wire [31:0]\ip2bus_data_i_reg[0] ;
  wire ip2bus_rdack_i_reg;
  wire ipbus_1;
  wire ipbus_2;
  wire ipbus_ack;
  wire ipbus_ack_fifo;
  wire \lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENA_dly_D ;
  wire \lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/POR_B ;
  wire \lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ram_rstram_b ;
  wire out;
  wire p_10_in;
  wire p_11_in;
  wire p_1_in;
  wire p_1_in2_in;
  wire p_1_in5_in;
  wire p_5_out;
  wire [31:0]p_5_out_0;
  wire p_6_out;
  wire p_7_in;
  wire p_8_in;
  wire prmry_in;
  wire ram_full_fb_i_reg;
  wire rdfifo_full_d1;
  wire rdfifo_full_ip2bus;
  wire rdfifo_wren;
  wire rdfifo_wren_cs_reg;
  wire reset_cr_cs_reg;
  wire [0:1]rnc;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [31:0]s_axi_wdata;
  wire scndry_out;
  wire [11:0]scndry_vect_out;
  wire [11:0]\size_cs_reg[0] ;
  wire \size_cs_reg[11] ;
  wire [0:31]sr_i;
  wire [0:11]sz_i;
  wire sz_i0;
  wire wrfifo_rden;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync BUS2ICAP_SIZE_REGISTER_PROCESS
       (.Q({sz_i[0],sz_i[1],sz_i[2],sz_i[3],sz_i[4],sz_i[5],sz_i[6],sz_i[7],sz_i[8],sz_i[9],sz_i[10],sz_i[11]}),
        .s_axi_aclk(s_axi_aclk),
        .scndry_vect_out(scndry_vect_out));
  LUT1 #(
    .INIT(2'h1)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to_i_1__0 
       (.I0(s_axi_aresetn),
        .O(fifo_rst_reg_0));
  LUT5 #(
    .INIT(32'hF8FF8F88)) 
    \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg[3]_i_1 
       (.I0(rdfifo_full_d1),
        .I1(fifo_full_mask),
        .I2(Bus_RNW_reg_reg),
        .I3(s_axi_wdata[3]),
        .I4(p_1_in),
        .O(\GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized0 ICAP2BUS_STATUS_REGISTER_PROCESS
       (.\IP2Bus_Data_reg[0] (\IP2Bus_Data_reg[0]_0 ),
        .Q({sr_i[0],sr_i[1],sr_i[2],sr_i[3],sr_i[4],sr_i[5],sr_i[6],sr_i[7],sr_i[8],sr_i[9],sr_i[10],sr_i[11],sr_i[12],sr_i[13],sr_i[14],sr_i[15],sr_i[16],sr_i[17],sr_i[18],sr_i[19],sr_i[20],sr_i[21],sr_i[22],sr_i[23],sr_i[24],sr_i[25],sr_i[26],sr_i[27],sr_i[28],sr_i[29],sr_i[30],sr_i[31]}),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_0 ICAP2PLB_SYNCH1
       (.\IP2Bus_Data_reg[31] (\IP2Bus_Data_reg[31]_0 ),
        .prmry_in(prmry_in),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_1 ICAP2PLB_SYNCH2
       (.SR(cr_i0),
        .abort_onreset0(abort_onreset0),
        .\cr_i_reg[0] (\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to [4]),
        .reset_cr_cs_reg(reset_cr_cs_reg),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_2 ICAP2PLB_SYNCH3
       (.\IP2Bus_Data_reg[30] (\IP2Bus_Data_reg[30]_0 ),
        .hang_status_cs_reg(hang_status_cs_reg),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_3 ICAP2PLB_SYNCH4
       (.\IP2Bus_Data_reg[29] (\IP2Bus_Data_reg[29]_0 ),
        .eos_in(eos_in),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync_4 ICAP2PLB_SYNCH5
       (.s_axi_aclk(s_axi_aclk),
        .scndry_vect_out({Size_counter_i2[0],Size_counter_i2[1],Size_counter_i2[2],Size_counter_i2[3],Size_counter_i2[4],Size_counter_i2[5],Size_counter_i2[6],Size_counter_i2[7],Size_counter_i2[8],Size_counter_i2[9],Size_counter_i2[10],Size_counter_i2[11]}),
        .\size_cs_reg[0] (\size_cs_reg[0] ));
  FDRE \IP2Bus_Data_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [31]),
        .Q(\ip2bus_data_i_reg[0] [31]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [21]),
        .Q(\ip2bus_data_i_reg[0] [21]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [20]),
        .Q(\ip2bus_data_i_reg[0] [20]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [19]),
        .Q(\ip2bus_data_i_reg[0] [19]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [18]),
        .Q(\ip2bus_data_i_reg[0] [18]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [17]),
        .Q(\ip2bus_data_i_reg[0] [17]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [16]),
        .Q(\ip2bus_data_i_reg[0] [16]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [15]),
        .Q(\ip2bus_data_i_reg[0] [15]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [14]),
        .Q(\ip2bus_data_i_reg[0] [14]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [13]),
        .Q(\ip2bus_data_i_reg[0] [13]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [12]),
        .Q(\ip2bus_data_i_reg[0] [12]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [30]),
        .Q(\ip2bus_data_i_reg[0] [30]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [11]),
        .Q(\ip2bus_data_i_reg[0] [11]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [10]),
        .Q(\ip2bus_data_i_reg[0] [10]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [9]),
        .Q(\ip2bus_data_i_reg[0] [9]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [8]),
        .Q(\ip2bus_data_i_reg[0] [8]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [7]),
        .Q(\ip2bus_data_i_reg[0] [7]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [6]),
        .Q(\ip2bus_data_i_reg[0] [6]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [5]),
        .Q(\ip2bus_data_i_reg[0] [5]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [4]),
        .Q(\ip2bus_data_i_reg[0] [4]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [3]),
        .Q(\ip2bus_data_i_reg[0] [3]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [2]),
        .Q(\ip2bus_data_i_reg[0] [2]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [29]),
        .Q(\ip2bus_data_i_reg[0] [29]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [1]),
        .Q(\ip2bus_data_i_reg[0] [1]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [0]),
        .Q(\ip2bus_data_i_reg[0] [0]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [28]),
        .Q(\ip2bus_data_i_reg[0] [28]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [27]),
        .Q(\ip2bus_data_i_reg[0] [27]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [26]),
        .Q(\ip2bus_data_i_reg[0] [26]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [25]),
        .Q(\ip2bus_data_i_reg[0] [25]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [24]),
        .Q(\ip2bus_data_i_reg[0] [24]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [23]),
        .Q(\ip2bus_data_i_reg[0] [23]),
        .R(SR));
  FDRE \IP2Bus_Data_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 [22]),
        .Q(\ip2bus_data_i_reg[0] [22]),
        .R(SR));
  FDRE IP2Bus_RdAck_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(IP2Bus_RdAck0),
        .Q(p_6_out),
        .R(SR));
  FDRE IP2Bus_WrAck_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(IP2Bus_WrAck0),
        .Q(p_5_out),
        .R(SR));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_5 PLB2ICAP_SYNCH1
       (.\FSM_sequential_icap_nstate_cs_reg[1] (\FSM_sequential_icap_nstate_cs_reg[1]_0 ),
        .\cr_i_reg[0] (\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to [4]),
        .gate_signal_p_reg(gate_icap_p),
        .rnc(rnc),
        .s_axi_aclk(s_axi_aclk),
        .scndry_out(abort_i_cs_reg),
        .\size_cs_reg[11] (\size_cs_reg[11] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_6 PLB2ICAP_SYNCH2
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .\FSM_sequential_icap_nstate_cs_reg[0] (\FSM_sequential_icap_nstate_cs_reg[0] ),
        .\FSM_sequential_icap_nstate_cs_reg[1] (\FSM_sequential_icap_nstate_cs_reg[1] ),
        .\FSM_sequential_icap_nstate_cs_reg[1]_0 (\FSM_sequential_icap_nstate_cs_reg[1]_0 ),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 (rnc[1]),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 (abort_i_cs_reg),
        .Send_done_cs_reg(Send_done_cs_reg),
        .\cr_i_reg[3] (\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to [1]),
        .gate_signal_p_reg(gate_icap_p),
        .prmry_in(out),
        .s_axi_aclk(s_axi_aclk),
        .scndry_out(rnc[0]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_7 PLB2ICAP_SYNCH3
       (.\FSM_sequential_icap_nstate_cs_reg[1] (\FSM_sequential_icap_nstate_cs_reg[1]_0 ),
        .\FSM_sequential_icap_nstate_cs_reg[2] (\FSM_sequential_icap_nstate_cs_reg[2] ),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 (rnc[0]),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_1 (abort_i_cs_reg),
        .Send_done_cs_reg(Send_done_cs_reg_0),
        .\cr_i_reg[4] (\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to [0]),
        .gate_signal_p_reg(gate_icap_p),
        .prmry_in(out),
        .s_axi_aclk(s_axi_aclk),
        .scndry_out(rnc[1]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_fifo_fg__parameterized0 \RD_FIFO.RDDATA_FIFO_I 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .ENA_dly_D(\lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENA_dly_D ),
        .\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] (\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ),
        .POR_B(\lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/POR_B ),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\RD_FIFO.RDDATA_FIFO_I_n_34 ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] (\WRFIFO.WRDATA_FIFO_I_n_43 ),
        .abort_onreset(abort_onreset),
        .fifo_rst(fifo_rst),
        .gate_signal_p_reg(\RD_FIFO.RDDATA_FIFO_I_n_46 ),
        .gate_signal_p_reg_0(gate_icap_p),
        .ipbus_1(ipbus_1),
        .ipbus_2(ipbus_2),
        .ipbus_ack(ipbus_ack),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\WRFIFO.WRDATA_FIFO_I_n_0 ),
        .p_1_in5_in(p_1_in5_in),
        .p_5_out_0(p_5_out_0),
        .p_7_in(p_7_in),
        .prmry_in(\RD_FIFO.RDDATA_FIFO_I_n_36 ),
        .ram_rstram_b(\lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ram_rstram_b ),
        .rdfifo_wren(rdfifo_wren),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata[1]),
        .src_rst(fifo_clear),
        .sw_reset_reg(SR));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized2 \RD_FIFO.RDFULL_SYNCH 
       (.\RD_FIFO.fifo_full_mask_reg (\RD_FIFO.RDFULL_SYNCH_n_0 ),
        .abort_onreset(abort_onreset),
        .fifo_full_mask(fifo_full_mask),
        .fifo_rst(fifo_rst),
        .prmry_in(\RD_FIFO.RDDATA_FIFO_I_n_36 ),
        .rdfifo_full_d1(rdfifo_full_d1),
        .s_axi_aclk(s_axi_aclk),
        .scndry_out(rdfifo_full_ip2bus),
        .sw_reset_reg(SR));
  FDRE \RD_FIFO.fifo_full_mask_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RD_FIFO.RDFULL_SYNCH_n_0 ),
        .Q(fifo_full_mask),
        .R(1'b0));
  FDRE \RD_FIFO.rdfifo_full_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rdfifo_full_ip2bus),
        .Q(rdfifo_full_d1),
        .R(1'b0));
  FDRE \Size_counter_i3_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Size_counter_i2[0]),
        .Q(\IP2Bus_Data_reg[20]_0 [11]),
        .R(fifo_rst_reg_0));
  FDRE \Size_counter_i3_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Size_counter_i2[10]),
        .Q(\IP2Bus_Data_reg[20]_0 [1]),
        .R(fifo_rst_reg_0));
  FDRE \Size_counter_i3_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Size_counter_i2[11]),
        .Q(\IP2Bus_Data_reg[20]_0 [0]),
        .R(fifo_rst_reg_0));
  FDRE \Size_counter_i3_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Size_counter_i2[1]),
        .Q(\IP2Bus_Data_reg[20]_0 [10]),
        .R(fifo_rst_reg_0));
  FDRE \Size_counter_i3_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Size_counter_i2[2]),
        .Q(\IP2Bus_Data_reg[20]_0 [9]),
        .R(fifo_rst_reg_0));
  FDRE \Size_counter_i3_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Size_counter_i2[3]),
        .Q(\IP2Bus_Data_reg[20]_0 [8]),
        .R(fifo_rst_reg_0));
  FDRE \Size_counter_i3_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Size_counter_i2[4]),
        .Q(\IP2Bus_Data_reg[20]_0 [7]),
        .R(fifo_rst_reg_0));
  FDRE \Size_counter_i3_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Size_counter_i2[5]),
        .Q(\IP2Bus_Data_reg[20]_0 [6]),
        .R(fifo_rst_reg_0));
  FDRE \Size_counter_i3_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Size_counter_i2[6]),
        .Q(\IP2Bus_Data_reg[20]_0 [5]),
        .R(fifo_rst_reg_0));
  FDRE \Size_counter_i3_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Size_counter_i2[7]),
        .Q(\IP2Bus_Data_reg[20]_0 [4]),
        .R(fifo_rst_reg_0));
  FDRE \Size_counter_i3_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Size_counter_i2[8]),
        .Q(\IP2Bus_Data_reg[20]_0 [3]),
        .R(fifo_rst_reg_0));
  FDRE \Size_counter_i3_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Size_counter_i2[9]),
        .Q(\IP2Bus_Data_reg[20]_0 [2]),
        .R(fifo_rst_reg_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_fifo_fg \WRFIFO.WRDATA_FIFO_I 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .D(D),
        .ENA_dly_D(\lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENA_dly_D ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ),
        .POR_B(\lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/POR_B ),
        .\SAFETY_CKT_GEN.POR_B_reg (\WRFIFO.WRDATA_FIFO_I_n_43 ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] (\RD_FIFO.RDDATA_FIFO_I_n_34 ),
        .busip_1(busip_1),
        .p_8_in(p_8_in),
        .prmry_in(out),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .ram_rstram_b(\lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ram_rstram_b ),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata),
        .src_rst(fifo_clear),
        .sw_reset_reg(SR),
        .\syncstages_ff_reg[0] (\WRFIFO.WRDATA_FIFO_I_n_0 ),
        .wrfifo_rden(wrfifo_rden));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync__parameterized1_8 \WRFIFO.WREMPTY_SYNCH 
       (.Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] (\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ),
        .p_1_in2_in(p_1_in2_in),
        .prmry_in(out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata[2]));
  FDSE abort_onreset_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(abort_onreset0),
        .Q(abort_onreset),
        .S(fifo_rst_reg_0));
  FDRE busip_1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_11_in),
        .Q(busip_1),
        .R(1'b0));
  FDRE \cr_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[4]),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to [4]),
        .R(cr_i0));
  FDRE \cr_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[3]),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to [3]),
        .R(cr_i0));
  FDRE \cr_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[2]),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to [2]),
        .R(cr_i0));
  FDRE \cr_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[1]),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to [1]),
        .R(cr_i0));
  FDRE \cr_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[0]),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to [0]),
        .R(cr_i0));
  FDSE fifo_rst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to [2]),
        .Q(fifo_rst),
        .S(fifo_rst_reg_0));
  FDRE gate_signal_p_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RD_FIFO.RDDATA_FIFO_I_n_46 ),
        .Q(gate_icap_p),
        .R(scndry_out));
  LUT3 #(
    .INIT(8'hE0)) 
    ip2bus_rdack_i_i_2
       (.I0(p_6_out),
        .I1(intr2bus_rdack),
        .I2(s_axi_aresetn),
        .O(ip2bus_rdack_i_reg));
  FDRE ipbus_1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_10_in),
        .Q(ipbus_1),
        .R(1'b0));
  FDRE ipbus_2_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ipbus_1),
        .Q(ipbus_2),
        .R(1'b0));
  FDRE ipbus_ack_fifo_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ipbus_ack),
        .Q(ipbus_ack_fifo),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hB)) 
    rdfifo_wren_cs_i_3
       (.I0(gate_icap_p),
        .I1(CO),
        .O(rdfifo_wren_cs_reg));
  FDRE \sr_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [31]),
        .Q(sr_i[0]),
        .R(scndry_out));
  FDRE \sr_i_reg[10] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [21]),
        .Q(sr_i[10]),
        .R(scndry_out));
  FDRE \sr_i_reg[11] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [20]),
        .Q(sr_i[11]),
        .R(scndry_out));
  FDRE \sr_i_reg[12] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [19]),
        .Q(sr_i[12]),
        .R(scndry_out));
  FDRE \sr_i_reg[13] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [18]),
        .Q(sr_i[13]),
        .R(scndry_out));
  FDRE \sr_i_reg[14] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [17]),
        .Q(sr_i[14]),
        .R(scndry_out));
  FDRE \sr_i_reg[15] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [16]),
        .Q(sr_i[15]),
        .R(scndry_out));
  FDRE \sr_i_reg[16] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [15]),
        .Q(sr_i[16]),
        .R(scndry_out));
  FDRE \sr_i_reg[17] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [14]),
        .Q(sr_i[17]),
        .R(scndry_out));
  FDRE \sr_i_reg[18] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [13]),
        .Q(sr_i[18]),
        .R(scndry_out));
  FDRE \sr_i_reg[19] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [12]),
        .Q(sr_i[19]),
        .R(scndry_out));
  FDRE \sr_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [30]),
        .Q(sr_i[1]),
        .R(scndry_out));
  FDRE \sr_i_reg[20] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [11]),
        .Q(sr_i[20]),
        .R(scndry_out));
  FDRE \sr_i_reg[21] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [10]),
        .Q(sr_i[21]),
        .R(scndry_out));
  FDRE \sr_i_reg[22] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [9]),
        .Q(sr_i[22]),
        .R(scndry_out));
  FDRE \sr_i_reg[23] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [8]),
        .Q(sr_i[23]),
        .R(scndry_out));
  FDRE \sr_i_reg[24] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [7]),
        .Q(sr_i[24]),
        .R(scndry_out));
  FDRE \sr_i_reg[25] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [6]),
        .Q(sr_i[25]),
        .R(scndry_out));
  FDRE \sr_i_reg[26] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [5]),
        .Q(sr_i[26]),
        .R(scndry_out));
  FDRE \sr_i_reg[27] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [4]),
        .Q(sr_i[27]),
        .R(scndry_out));
  FDRE \sr_i_reg[28] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [3]),
        .Q(sr_i[28]),
        .R(scndry_out));
  FDRE \sr_i_reg[29] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [2]),
        .Q(sr_i[29]),
        .R(scndry_out));
  FDRE \sr_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [29]),
        .Q(sr_i[2]),
        .R(scndry_out));
  FDRE \sr_i_reg[30] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [1]),
        .Q(sr_i[30]),
        .R(scndry_out));
  FDRE \sr_i_reg[31] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [0]),
        .Q(sr_i[31]),
        .R(scndry_out));
  FDRE \sr_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [28]),
        .Q(sr_i[3]),
        .R(scndry_out));
  FDRE \sr_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [27]),
        .Q(sr_i[4]),
        .R(scndry_out));
  FDRE \sr_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [26]),
        .Q(sr_i[5]),
        .R(scndry_out));
  FDRE \sr_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [25]),
        .Q(sr_i[6]),
        .R(scndry_out));
  FDRE \sr_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [24]),
        .Q(sr_i[7]),
        .R(scndry_out));
  FDRE \sr_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [23]),
        .Q(sr_i[8]),
        .R(scndry_out));
  FDRE \sr_i_reg[9] 
       (.C(s_axi_aclk),
        .CE(abort_cs2_reg),
        .D(\icap_status_i_reg[0] [22]),
        .Q(sr_i[9]),
        .R(scndry_out));
  FDSE sw_reset_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to [3]),
        .Q(SR),
        .S(fifo_rst_reg_0));
  LUT2 #(
    .INIT(4'hB)) 
    \sz_i[0]_i_1 
       (.I0(SR),
        .I1(s_axi_aresetn),
        .O(sz_i0));
  FDRE \sz_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .D(s_axi_wdata[11]),
        .Q(sz_i[0]),
        .R(sz_i0));
  FDRE \sz_i_reg[10] 
       (.C(s_axi_aclk),
        .CE(\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .D(s_axi_wdata[1]),
        .Q(sz_i[10]),
        .R(sz_i0));
  FDRE \sz_i_reg[11] 
       (.C(s_axi_aclk),
        .CE(\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .D(s_axi_wdata[0]),
        .Q(sz_i[11]),
        .R(sz_i0));
  FDRE \sz_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .D(s_axi_wdata[10]),
        .Q(sz_i[1]),
        .R(sz_i0));
  FDRE \sz_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .D(s_axi_wdata[9]),
        .Q(sz_i[2]),
        .R(sz_i0));
  FDRE \sz_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .D(s_axi_wdata[8]),
        .Q(sz_i[3]),
        .R(sz_i0));
  FDRE \sz_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .D(s_axi_wdata[7]),
        .Q(sz_i[4]),
        .R(sz_i0));
  FDRE \sz_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .D(s_axi_wdata[6]),
        .Q(sz_i[5]),
        .R(sz_i0));
  FDRE \sz_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .D(s_axi_wdata[5]),
        .Q(sz_i[6]),
        .R(sz_i0));
  FDRE \sz_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .D(s_axi_wdata[4]),
        .Q(sz_i[7]),
        .R(sz_i0));
  FDRE \sz_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .D(s_axi_wdata[3]),
        .Q(sz_i[8]),
        .R(sz_i0));
  FDRE \sz_i_reg[9] 
       (.C(s_axi_aclk),
        .CE(\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] ),
        .D(s_axi_wdata[2]),
        .Q(sz_i[9]),
        .R(sz_i0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment
   (ip2bus_rdack_i_reg,
    p_8_in,
    intr2bus_rdack_reg,
    intr2bus_rdack_reg_0,
    ipif_glbl_irpt_enable_reg_reg,
    s_axi_rvalid,
    s_axi_bvalid,
    s_axi_arready,
    s_axi_wready,
    intr2bus_rdack0,
    irpt_rdack,
    irpt_wrack,
    ip2bus_rdack_i_reg_0,
    ip2bus_wrack_i_reg,
    \ip2bus_data_i_reg[31] ,
    interrupt_wrce_strb,
    \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ,
    IP2Bus_WrAck0,
    IP2Bus_RdAck0,
    D,
    \IP2Bus_Data_reg[31] ,
    p_10_in,
    p_11_in,
    \ip2bus_data_i_reg[0] ,
    ipif_glbl_irpt_enable_reg_reg_0,
    E,
    \sz_i_reg[0] ,
    \ip_irpt_enable_reg_reg[3] ,
    s_axi_rdata,
    SR,
    s_axi_aclk,
    s_axi_arvalid,
    s_axi_aresetn,
    ip2bus_rdack_i,
    ip2bus_wrack_i,
    s_axi_bready,
    s_axi_rready,
    s_axi_awvalid,
    s_axi_wvalid,
    irpt_rdack_d1,
    IP2Bus_RdAck_reg,
    p_5_out,
    intr2bus_wrack,
    irpt_wrack_d1,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ,
    busip_1,
    ipbus_ack_fifo,
    ipbus_ack,
    p_5_out_0,
    \Size_counter_i3_reg[0] ,
    scndry_vect_out,
    \wr_data_count_i_reg[5] ,
    \rd_dc_i_reg[6] ,
    Q,
    scndry_out,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ,
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ,
    s_axi_awaddr,
    s_axi_araddr,
    ipif_glbl_irpt_enable_reg,
    \IP2Bus_Data_reg[0] ,
    s_axi_wdata,
    \ip2bus_data_i_reg[0]_0 );
  output ip2bus_rdack_i_reg;
  output p_8_in;
  output intr2bus_rdack_reg;
  output intr2bus_rdack_reg_0;
  output ipif_glbl_irpt_enable_reg_reg;
  output s_axi_rvalid;
  output s_axi_bvalid;
  output s_axi_arready;
  output s_axi_wready;
  output intr2bus_rdack0;
  output irpt_rdack;
  output irpt_wrack;
  output ip2bus_rdack_i_reg_0;
  output ip2bus_wrack_i_reg;
  output [0:0]\ip2bus_data_i_reg[31] ;
  output interrupt_wrce_strb;
  output \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ;
  output IP2Bus_WrAck0;
  output IP2Bus_RdAck0;
  output [31:0]D;
  output \IP2Bus_Data_reg[31] ;
  output p_10_in;
  output p_11_in;
  output [0:0]\ip2bus_data_i_reg[0] ;
  output ipif_glbl_irpt_enable_reg_reg_0;
  output [0:0]E;
  output [0:0]\sz_i_reg[0] ;
  output [0:0]\ip_irpt_enable_reg_reg[3] ;
  output [31:0]s_axi_rdata;
  input [0:0]SR;
  input s_axi_aclk;
  input s_axi_arvalid;
  input s_axi_aresetn;
  input ip2bus_rdack_i;
  input ip2bus_wrack_i;
  input s_axi_bready;
  input s_axi_rready;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input irpt_rdack_d1;
  input IP2Bus_RdAck_reg;
  input p_5_out;
  input intr2bus_wrack;
  input irpt_wrack_d1;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ;
  input busip_1;
  input ipbus_ack_fifo;
  input ipbus_ack;
  input [31:0]p_5_out_0;
  input [11:0]\Size_counter_i3_reg[0] ;
  input [31:0]scndry_vect_out;
  input [5:0]\wr_data_count_i_reg[5] ;
  input [6:0]\rd_dc_i_reg[6] ;
  input [4:0]Q;
  input scndry_out;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ;
  input \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ;
  input [6:0]s_axi_awaddr;
  input [6:0]s_axi_araddr;
  input ipif_glbl_irpt_enable_reg;
  input [0:0]\IP2Bus_Data_reg[0] ;
  input [0:0]s_axi_wdata;
  input [31:0]\ip2bus_data_i_reg[0]_0 ;

  wire [31:0]D;
  wire [0:0]E;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ;
  wire [4:0]\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 ;
  wire [0:0]\IP2Bus_Data_reg[0] ;
  wire \IP2Bus_Data_reg[31] ;
  wire IP2Bus_RdAck0;
  wire IP2Bus_RdAck_reg;
  wire IP2Bus_WrAck0;
  wire [4:0]Q;
  wire [0:0]SR;
  wire [11:0]\Size_counter_i3_reg[0] ;
  wire [0:6]bus2ip_addr;
  wire \bus2ip_addr_i[2]_i_1_n_0 ;
  wire \bus2ip_addr_i[3]_i_1_n_0 ;
  wire \bus2ip_addr_i[4]_i_1_n_0 ;
  wire \bus2ip_addr_i[5]_i_1_n_0 ;
  wire \bus2ip_addr_i[6]_i_1_n_0 ;
  wire \bus2ip_addr_i[7]_i_1_n_0 ;
  wire \bus2ip_addr_i[8]_i_1_n_0 ;
  wire bus2ip_rnw_i;
  wire busip_1;
  wire clear;
  wire interrupt_wrce_strb;
  wire intr2bus_rdack0;
  wire intr2bus_rdack_reg;
  wire intr2bus_rdack_reg_0;
  wire intr2bus_wrack;
  wire [0:0]\ip2bus_data_i_reg[0] ;
  wire [31:0]\ip2bus_data_i_reg[0]_0 ;
  wire [0:0]\ip2bus_data_i_reg[31] ;
  wire ip2bus_rdack_i;
  wire ip2bus_rdack_i_reg;
  wire ip2bus_rdack_i_reg_0;
  wire ip2bus_wrack_i;
  wire ip2bus_wrack_i_reg;
  wire [0:0]\ip_irpt_enable_reg_reg[3] ;
  wire ipbus_ack;
  wire ipbus_ack_fifo;
  wire ipif_glbl_irpt_enable_reg;
  wire ipif_glbl_irpt_enable_reg_reg;
  wire ipif_glbl_irpt_enable_reg_reg_0;
  wire irpt_rdack;
  wire irpt_rdack_d1;
  wire irpt_wrack;
  wire irpt_wrack_d1;
  wire is_read;
  wire is_read_i_1_n_0;
  wire is_write;
  wire is_write_i_1_n_0;
  wire is_write_reg_n_0;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ;
  wire p_10_in;
  wire p_11_in;
  wire p_5_out;
  wire [31:0]p_5_out_0;
  wire p_8_in;
  wire [4:0]plusOp;
  wire [6:0]\rd_dc_i_reg[6] ;
  wire rst;
  wire s_axi_aclk;
  wire [6:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [6:0]s_axi_awaddr;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire s_axi_bvalid_i_i_1_n_0;
  wire [31:0]s_axi_rdata;
  wire s_axi_rdata_i;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire s_axi_rvalid_i_i_1_n_0;
  wire [0:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire scndry_out;
  wire [31:0]scndry_vect_out;
  wire start2;
  wire start2_i_1_n_0;
  wire [1:0]state;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state[1]_i_2_n_0 ;
  wire \state[1]_i_3_n_0 ;
  wire [0:0]\sz_i_reg[0] ;
  wire [5:0]\wr_data_count_i_reg[5] ;

  LUT1 #(
    .INIT(2'h1)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[0]_i_1 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[1]_i_1 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [0]),
        .I1(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[2]_i_1 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [1]),
        .I1(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [0]),
        .I2(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[3]_i_1 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [0]),
        .I1(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [1]),
        .I2(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [2]),
        .I3(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [3]),
        .O(plusOp[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[4]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .O(clear));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[4]_i_2 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [2]),
        .I1(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [3]),
        .I2(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [0]),
        .I3(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [1]),
        .I4(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [4]),
        .O(plusOp[4]));
  FDRE \INCLUDE_DPHASE_TIMER.dpto_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(plusOp[0]),
        .Q(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [0]),
        .R(clear));
  FDRE \INCLUDE_DPHASE_TIMER.dpto_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [1]),
        .R(clear));
  FDRE \INCLUDE_DPHASE_TIMER.dpto_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [2]),
        .R(clear));
  FDRE \INCLUDE_DPHASE_TIMER.dpto_cnt_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [3]),
        .R(clear));
  FDRE \INCLUDE_DPHASE_TIMER.dpto_cnt_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(plusOp[4]),
        .Q(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 [4]),
        .R(clear));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder I_DECODER
       (.D(D),
        .E(E),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 (\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 ),
        .\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 (\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4_0 ),
        .\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] (\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] ),
        .\IP2Bus_Data_reg[0] (\IP2Bus_Data_reg[0] ),
        .\IP2Bus_Data_reg[31] (\IP2Bus_Data_reg[31] ),
        .IP2Bus_RdAck0(IP2Bus_RdAck0),
        .IP2Bus_RdAck_reg(IP2Bus_RdAck_reg),
        .IP2Bus_WrAck0(IP2Bus_WrAck0),
        .Q(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg__0 ),
        .\Size_counter_i3_reg[0] (\Size_counter_i3_reg[0] ),
        .\bus2ip_addr_i_reg[8] ({bus2ip_addr[0],bus2ip_addr[1],bus2ip_addr[2],bus2ip_addr[3],bus2ip_addr[4],bus2ip_addr[5],bus2ip_addr[6]}),
        .bus2ip_rnw_i(bus2ip_rnw_i),
        .busip_1(busip_1),
        .\cr_i_reg[0] (Q),
        .interrupt_wrce_strb(interrupt_wrce_strb),
        .intr2bus_rdack0(intr2bus_rdack0),
        .intr2bus_rdack_reg(intr2bus_rdack_reg),
        .intr2bus_rdack_reg_0(intr2bus_rdack_reg_0),
        .intr2bus_wrack(intr2bus_wrack),
        .\ip2bus_data_i_reg[0] (\ip2bus_data_i_reg[0] ),
        .\ip2bus_data_i_reg[31] (\ip2bus_data_i_reg[31] ),
        .ip2bus_rdack_i(ip2bus_rdack_i),
        .ip2bus_rdack_i_reg(ip2bus_rdack_i_reg),
        .ip2bus_rdack_i_reg_0(ip2bus_rdack_i_reg_0),
        .ip2bus_wrack_i(ip2bus_wrack_i),
        .ip2bus_wrack_i_reg(ip2bus_wrack_i_reg),
        .\ip_irpt_enable_reg_reg[3] (\ip_irpt_enable_reg_reg[3] ),
        .ipbus_ack(ipbus_ack),
        .ipbus_ack_fifo(ipbus_ack_fifo),
        .ipif_glbl_irpt_enable_reg(ipif_glbl_irpt_enable_reg),
        .ipif_glbl_irpt_enable_reg_reg(ipif_glbl_irpt_enable_reg_reg),
        .ipif_glbl_irpt_enable_reg_reg_0(ipif_glbl_irpt_enable_reg_reg_0),
        .irpt_rdack(irpt_rdack),
        .irpt_rdack_d1(irpt_rdack_d1),
        .irpt_wrack(irpt_wrack),
        .irpt_wrack_d1(irpt_wrack_d1),
        .is_read(is_read),
        .is_write_reg(is_write_reg_n_0),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ),
        .p_10_in(p_10_in),
        .p_11_in(p_11_in),
        .p_5_out(p_5_out),
        .p_5_out_0(p_5_out_0),
        .p_8_in(p_8_in),
        .\rd_dc_i_reg[6] (\rd_dc_i_reg[6] ),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .scndry_out(scndry_out),
        .scndry_vect_out(scndry_vect_out),
        .start2(start2),
        .\sz_i_reg[0] (\sz_i_reg[0] ),
        .\wr_data_count_i_reg[5] (\wr_data_count_i_reg[5] ));
  LUT3 #(
    .INIT(8'hE2)) 
    \bus2ip_addr_i[2]_i_1 
       (.I0(s_axi_awaddr[0]),
        .I1(s_axi_arvalid),
        .I2(s_axi_araddr[0]),
        .O(\bus2ip_addr_i[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \bus2ip_addr_i[3]_i_1 
       (.I0(s_axi_awaddr[1]),
        .I1(s_axi_arvalid),
        .I2(s_axi_araddr[1]),
        .O(\bus2ip_addr_i[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \bus2ip_addr_i[4]_i_1 
       (.I0(s_axi_awaddr[2]),
        .I1(s_axi_arvalid),
        .I2(s_axi_araddr[2]),
        .O(\bus2ip_addr_i[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \bus2ip_addr_i[5]_i_1 
       (.I0(s_axi_awaddr[3]),
        .I1(s_axi_arvalid),
        .I2(s_axi_araddr[3]),
        .O(\bus2ip_addr_i[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \bus2ip_addr_i[6]_i_1 
       (.I0(s_axi_awaddr[4]),
        .I1(s_axi_arvalid),
        .I2(s_axi_araddr[4]),
        .O(\bus2ip_addr_i[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \bus2ip_addr_i[7]_i_1 
       (.I0(s_axi_awaddr[5]),
        .I1(s_axi_arvalid),
        .I2(s_axi_araddr[5]),
        .O(\bus2ip_addr_i[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \bus2ip_addr_i[8]_i_1 
       (.I0(s_axi_awaddr[6]),
        .I1(s_axi_arvalid),
        .I2(s_axi_araddr[6]),
        .O(\bus2ip_addr_i[8]_i_1_n_0 ));
  FDRE \bus2ip_addr_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(start2_i_1_n_0),
        .D(\bus2ip_addr_i[2]_i_1_n_0 ),
        .Q(bus2ip_addr[6]),
        .R(rst));
  FDRE \bus2ip_addr_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(start2_i_1_n_0),
        .D(\bus2ip_addr_i[3]_i_1_n_0 ),
        .Q(bus2ip_addr[5]),
        .R(rst));
  FDRE \bus2ip_addr_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(start2_i_1_n_0),
        .D(\bus2ip_addr_i[4]_i_1_n_0 ),
        .Q(bus2ip_addr[4]),
        .R(rst));
  FDRE \bus2ip_addr_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(start2_i_1_n_0),
        .D(\bus2ip_addr_i[5]_i_1_n_0 ),
        .Q(bus2ip_addr[3]),
        .R(rst));
  FDRE \bus2ip_addr_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(start2_i_1_n_0),
        .D(\bus2ip_addr_i[6]_i_1_n_0 ),
        .Q(bus2ip_addr[2]),
        .R(rst));
  FDRE \bus2ip_addr_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(start2_i_1_n_0),
        .D(\bus2ip_addr_i[7]_i_1_n_0 ),
        .Q(bus2ip_addr[1]),
        .R(rst));
  FDRE \bus2ip_addr_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(start2_i_1_n_0),
        .D(\bus2ip_addr_i[8]_i_1_n_0 ),
        .Q(bus2ip_addr[0]),
        .R(rst));
  FDRE bus2ip_rnw_i_reg
       (.C(s_axi_aclk),
        .CE(start2_i_1_n_0),
        .D(s_axi_arvalid),
        .Q(bus2ip_rnw_i),
        .R(rst));
  LUT5 #(
    .INIT(32'h3FFA000A)) 
    is_read_i_1
       (.I0(s_axi_arvalid),
        .I1(\state[1]_i_2_n_0 ),
        .I2(state[1]),
        .I3(state[0]),
        .I4(is_read),
        .O(is_read_i_1_n_0));
  FDRE is_read_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(is_read_i_1_n_0),
        .Q(is_read),
        .R(rst));
  LUT6 #(
    .INIT(64'h1000FFFF10000000)) 
    is_write_i_1
       (.I0(state[1]),
        .I1(s_axi_arvalid),
        .I2(s_axi_wvalid),
        .I3(s_axi_awvalid),
        .I4(is_write),
        .I5(is_write_reg_n_0),
        .O(is_write_i_1_n_0));
  LUT6 #(
    .INIT(64'hF88800000000FFFF)) 
    is_write_i_2
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid),
        .I2(s_axi_rready),
        .I3(s_axi_rvalid),
        .I4(state[1]),
        .I5(state[0]),
        .O(is_write));
  FDRE is_write_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(is_write_i_1_n_0),
        .Q(is_write_reg_n_0),
        .R(rst));
  FDRE rst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(SR),
        .Q(rst),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h40FF4040)) 
    s_axi_bvalid_i_i_1
       (.I0(state[0]),
        .I1(state[1]),
        .I2(s_axi_wready),
        .I3(s_axi_bready),
        .I4(s_axi_bvalid),
        .O(s_axi_bvalid_i_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_axi_bvalid_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_bvalid_i_i_1_n_0),
        .Q(s_axi_bvalid),
        .R(rst));
  LUT2 #(
    .INIT(4'h2)) 
    \s_axi_rdata_i[31]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .O(s_axi_rdata_i));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [0]),
        .Q(s_axi_rdata[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[10] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [10]),
        .Q(s_axi_rdata[10]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[11] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [11]),
        .Q(s_axi_rdata[11]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[12] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [12]),
        .Q(s_axi_rdata[12]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[13] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [13]),
        .Q(s_axi_rdata[13]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[14] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [14]),
        .Q(s_axi_rdata[14]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[15] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [15]),
        .Q(s_axi_rdata[15]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[16] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [16]),
        .Q(s_axi_rdata[16]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[17] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [17]),
        .Q(s_axi_rdata[17]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[18] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [18]),
        .Q(s_axi_rdata[18]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[19] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [19]),
        .Q(s_axi_rdata[19]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [1]),
        .Q(s_axi_rdata[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[20] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [20]),
        .Q(s_axi_rdata[20]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[21] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [21]),
        .Q(s_axi_rdata[21]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[22] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [22]),
        .Q(s_axi_rdata[22]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[23] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [23]),
        .Q(s_axi_rdata[23]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[24] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [24]),
        .Q(s_axi_rdata[24]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[25] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [25]),
        .Q(s_axi_rdata[25]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[26] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [26]),
        .Q(s_axi_rdata[26]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[27] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [27]),
        .Q(s_axi_rdata[27]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[28] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [28]),
        .Q(s_axi_rdata[28]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[29] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [29]),
        .Q(s_axi_rdata[29]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [2]),
        .Q(s_axi_rdata[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[30] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [30]),
        .Q(s_axi_rdata[30]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[31] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [31]),
        .Q(s_axi_rdata[31]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [3]),
        .Q(s_axi_rdata[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [4]),
        .Q(s_axi_rdata[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [5]),
        .Q(s_axi_rdata[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [6]),
        .Q(s_axi_rdata[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [7]),
        .Q(s_axi_rdata[7]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [8]),
        .Q(s_axi_rdata[8]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[9] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata_i),
        .D(\ip2bus_data_i_reg[0]_0 [9]),
        .Q(s_axi_rdata[9]),
        .R(rst));
  LUT5 #(
    .INIT(32'h40FF4040)) 
    s_axi_rvalid_i_i_1
       (.I0(state[1]),
        .I1(state[0]),
        .I2(s_axi_arready),
        .I3(s_axi_rready),
        .I4(s_axi_rvalid),
        .O(s_axi_rvalid_i_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_axi_rvalid_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_rvalid_i_i_1_n_0),
        .Q(s_axi_rvalid),
        .R(rst));
  LUT5 #(
    .INIT(32'h000000F8)) 
    start2_i_1
       (.I0(s_axi_awvalid),
        .I1(s_axi_wvalid),
        .I2(s_axi_arvalid),
        .I3(state[0]),
        .I4(state[1]),
        .O(start2_i_1_n_0));
  FDRE start2_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(start2_i_1_n_0),
        .Q(start2),
        .R(rst));
  LUT5 #(
    .INIT(32'h0FAAFFCC)) 
    \state[0]_i_1 
       (.I0(s_axi_wready),
        .I1(s_axi_arvalid),
        .I2(\state[1]_i_2_n_0 ),
        .I3(state[0]),
        .I4(state[1]),
        .O(\state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2E2E2E2ECCCCFFCC)) 
    \state[1]_i_1 
       (.I0(s_axi_arready),
        .I1(state[1]),
        .I2(\state[1]_i_2_n_0 ),
        .I3(\state[1]_i_3_n_0 ),
        .I4(s_axi_arvalid),
        .I5(state[0]),
        .O(\state[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \state[1]_i_2 
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid),
        .I2(s_axi_rready),
        .I3(s_axi_rvalid),
        .O(\state[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \state[1]_i_3 
       (.I0(s_axi_awvalid),
        .I1(s_axi_wvalid),
        .O(\state[1]_i_3_n_0 ));
  FDRE \state_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(rst));
  FDRE \state_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(rst));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "6" *) (* XPM_MODULE = "TRUE" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [5:0]src_in_bin;
  input dest_clk;
  output [5:0]dest_out_bin;

  wire [5:0]async_path;
  wire [4:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [5:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [5:0]\dest_graysync_ff[1] ;
  wire [5:0]dest_out_bin;
  wire [4:0]gray_enc;
  wire src_clk;
  wire [5:0]src_in_bin;

  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [1]),
        .I3(\dest_graysync_ff[1] [0]),
        .I4(\dest_graysync_ff[1] [3]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [1]),
        .I3(\dest_graysync_ff[1] [4]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [2]),
        .I3(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [4]),
        .O(binval[4]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[0]),
        .I1(src_in_bin[1]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[2]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[3]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[4]),
        .O(gray_enc[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[5]),
        .O(gray_enc[4]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[5]),
        .Q(async_path[5]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "6" *) (* XPM_MODULE = "TRUE" *) 
(* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [5:0]src_in_bin;
  input dest_clk;
  output [5:0]dest_out_bin;

  wire [5:0]async_path;
  wire [4:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [5:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [5:0]\dest_graysync_ff[1] ;
  wire [5:0]dest_out_bin;
  wire [4:0]gray_enc;
  wire src_clk;
  wire [5:0]src_in_bin;

  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [1]),
        .I3(\dest_graysync_ff[1] [0]),
        .I4(\dest_graysync_ff[1] [3]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [1]),
        .I3(\dest_graysync_ff[1] [4]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [2]),
        .I3(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [4]),
        .O(binval[4]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[0]),
        .I1(src_in_bin[1]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[2]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[3]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[4]),
        .O(gray_enc[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[5]),
        .O(gray_enc[4]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[5]),
        .Q(async_path[5]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "7" *) (* XPM_MODULE = "TRUE" *) 
(* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__parameterized0
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [6:0]src_in_bin;
  input dest_clk;
  output [6:0]dest_out_bin;

  wire [6:0]async_path;
  wire [5:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[1] ;
  wire [6:0]dest_out_bin;
  wire [5:0]gray_enc;
  wire src_clk;
  wire [6:0]src_in_bin;

  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(binval[4]),
        .I1(\dest_graysync_ff[1] [1]),
        .I2(\dest_graysync_ff[1] [0]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [2]),
        .O(binval[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [2]),
        .I3(\dest_graysync_ff[1] [1]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [3]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [4]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [5]),
        .O(binval[5]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[0]),
        .I1(src_in_bin[1]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[2]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[3]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[4]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[5]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[6]),
        .O(gray_enc[5]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[6]),
        .Q(async_path[6]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "7" *) (* XPM_MODULE = "TRUE" *) 
(* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__parameterized0__1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [6:0]src_in_bin;
  input dest_clk;
  output [6:0]dest_out_bin;

  wire [6:0]async_path;
  wire [5:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[1] ;
  wire [6:0]dest_out_bin;
  wire [5:0]gray_enc;
  wire src_clk;
  wire [6:0]src_in_bin;

  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(binval[4]),
        .I1(\dest_graysync_ff[1] [1]),
        .I2(\dest_graysync_ff[1] [0]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [2]),
        .O(binval[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [2]),
        .I3(\dest_graysync_ff[1] [1]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [3]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [4]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [5]),
        .O(binval[5]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[0]),
        .I1(src_in_bin[1]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[2]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[3]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[4]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[5]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[6]),
        .O(gray_enc[5]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[6]),
        .Q(async_path[6]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) 
(* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) 
(* xpm_cdc = "SINGLE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SINGLE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SINGLE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__3
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SINGLE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__4
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__3
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__4
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr
   (D,
    ENA_dly_D,
    ENB_dly_D,
    \SAFETY_CKT_GEN.POR_B_reg ,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    ram_rstram_b,
    \gc1.count_d2_reg[5] ,
    Q,
    s_axi_wdata,
    E,
    POR_B,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] );
  output [31:0]D;
  output ENA_dly_D;
  output ENB_dly_D;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input ram_rstram_b;
  input [5:0]\gc1.count_d2_reg[5] ;
  input [5:0]Q;
  input [31:0]s_axi_wdata;
  input [0:0]E;
  input POR_B;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;

  wire [31:0]D;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_dly_D;
  wire POR_B;
  wire [5:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  wire [5:0]\gc1.count_d2_reg[5] ;
  wire ram_rstram_b;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.D(D),
        .E(E),
        .ENA_I(ENA_I),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ),
        .\gc1.count_d2_reg[5] (\gc1.count_d2_reg[5] ),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr__parameterized0
   (p_5_out_0,
    POR_B,
    ENB_dly_D,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstram_b,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    \gc1.count_d2_reg[6] ,
    Q,
    \icap_dataout_i_reg[0] ,
    E,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 );
  output [31:0]p_5_out_0;
  output POR_B;
  output ENB_dly_D;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  output ram_rstram_b;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input [6:0]\gc1.count_d2_reg[6] ;
  input [6:0]Q;
  input [31:0]\icap_dataout_i_reg[0] ;
  input [0:0]E;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire ENB_dly_D;
  wire POR_B;
  wire [6:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  wire [6:0]\gc1.count_d2_reg[6] ;
  wire [31:0]\icap_dataout_i_reg[0] ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;
  wire [31:0]p_5_out_0;
  wire ram_rstram_b;
  wire s_axi_aclk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized0 \ramloop[0].ram.r 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg_0 (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ),
        .\gc1.count_d2_reg[6] (\gc1.count_d2_reg[6] ),
        .\icap_dataout_i_reg[0] (\icap_dataout_i_reg[0] ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .p_5_out_0(p_5_out_0),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width
   (D,
    ENA_dly_D,
    ENB_dly_D,
    \SAFETY_CKT_GEN.POR_B_reg ,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    ram_rstram_b,
    \gc1.count_d2_reg[5] ,
    Q,
    s_axi_wdata,
    E,
    POR_B,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] );
  output [31:0]D;
  output ENA_dly_D;
  output ENB_dly_D;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input ram_rstram_b;
  input [5:0]\gc1.count_d2_reg[5] ;
  input [5:0]Q;
  input [31:0]s_axi_wdata;
  input [0:0]E;
  input POR_B;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;

  wire [31:0]D;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_dly;
  wire ENB_dly_D;
  wire POR_B;
  wire [5:0]Q;
  wire [4:4]RSTB_SHFT_REG;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ;
  wire [5:0]\gc1.count_d2_reg[5] ;
  wire ram_rstram_b;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;

  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_D_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ENA_dly),
        .Q(ENA_dly_D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(POR_B),
        .Q(ENA_dly),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_NO_REG.ENB_dly_D_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ENB_dly),
        .Q(ENB_dly_D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_NO_REG.ENB_dly_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ram_rstram_b),
        .Q(ENB_dly),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \SAFETY_CKT_GEN.POR_B_i_1 
       (.I0(RSTB_SHFT_REG),
        .I1(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ),
        .O(\SAFETY_CKT_GEN.POR_B_reg ));
  (* srl_bus_name = "U0/\ICAP_NOT_SHARED.HWICAP_CTRL_I/IPIC_IF_I/WRFIFO.WRDATA_FIFO_I/lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.RSTB_SHFT_REG_reg " *) 
  (* srl_name = "U0/\ICAP_NOT_SHARED.HWICAP_CTRL_I/IPIC_IF_I/WRFIFO.WRDATA_FIFO_I/lib_fifo_instance.USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(s_axi_aclk),
        .D(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ),
        .Q(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ),
        .Q(RSTB_SHFT_REG),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.D(D),
        .E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .Q(Q),
        .\gc1.count_d2_reg[5] (\gc1.count_d2_reg[5] ),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized0
   (p_5_out_0,
    POR_B,
    ENB_dly_D,
    \SAFETY_CKT_GEN.POR_B_reg_0 ,
    ram_rstram_b,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    \gc1.count_d2_reg[6] ,
    Q,
    \icap_dataout_i_reg[0] ,
    E,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 );
  output [31:0]p_5_out_0;
  output POR_B;
  output ENB_dly_D;
  output \SAFETY_CKT_GEN.POR_B_reg_0 ;
  output ram_rstram_b;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input [6:0]\gc1.count_d2_reg[6] ;
  input [6:0]Q;
  input [31:0]\icap_dataout_i_reg[0] ;
  input [0:0]E;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire ENB_dly;
  wire ENB_dly_D;
  wire POR_B;
  wire [6:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg_0 ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  wire [6:0]\gc1.count_d2_reg[6] ;
  wire [31:0]\icap_dataout_i_reg[0] ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;
  wire [31:0]p_5_out_0;
  wire ram_rstram_b;
  wire ram_rstram_b_0;
  wire s_axi_aclk;

  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_NO_REG.ENB_dly_D_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ENB_dly),
        .Q(ENB_dly_D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_NO_REG.ENB_dly_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ram_rstram_b_0),
        .Q(ENB_dly),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.POR_B_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ),
        .Q(POR_B),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(\SAFETY_CKT_GEN.POR_B_reg_0 ),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper__parameterized0 \prim_noinit.ram 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_B(POR_B),
        .Q(Q),
        .\gc1.count_d2_reg[6] (\gc1.count_d2_reg[6] ),
        .\icap_dataout_i_reg[0] (\icap_dataout_i_reg[0] ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .p_5_out_0(p_5_out_0),
        .ram_rstram_b(ram_rstram_b),
        .ram_rstram_b_0(ram_rstram_b_0),
        .s_axi_aclk(s_axi_aclk));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper
   (D,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    ram_rstram_b,
    \gc1.count_d2_reg[5] ,
    Q,
    s_axi_wdata,
    E);
  output [31:0]D;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input ram_rstram_b;
  input [5:0]\gc1.count_d2_reg[5] ;
  input [5:0]Q;
  input [31:0]s_axi_wdata;
  input [0:0]E;

  wire [31:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_33 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_34 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_35 ;
  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire [5:0]Q;
  wire [5:0]\gc1.count_d2_reg[5] ;
  wire ram_rstram_b;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(36)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram 
       (.ADDRARDADDR({1'b0,1'b0,1'b0,\gc1.count_d2_reg[5] ,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(s_axi_aclk),
        .CLKBWRCLK(s_axi_aclk),
        .DIADI(s_axi_wdata[15:0]),
        .DIBDI(s_axi_wdata[31:16]),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(D[15:0]),
        .DOBDO(D[31:16]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_33 }),
        .DOPBDOP({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_34 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_35 }),
        .ENARDEN(ENB_I),
        .ENBWREN(ENA_I),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(ram_rstram_b),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({E,E,E,E}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper__parameterized0
   (p_5_out_0,
    ram_rstram_b_0,
    ram_rstram_b,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    \gc1.count_d2_reg[6] ,
    Q,
    \icap_dataout_i_reg[0] ,
    E,
    POR_B,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 );
  output [31:0]p_5_out_0;
  output ram_rstram_b_0;
  output ram_rstram_b;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input [6:0]\gc1.count_d2_reg[6] ;
  input [6:0]Q;
  input [31:0]\icap_dataout_i_reg[0] ;
  input [0:0]E;
  input POR_B;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_33 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_34 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_35 ;
  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_B;
  wire [6:0]Q;
  wire [6:0]\gc1.count_d2_reg[6] ;
  wire [31:0]\icap_dataout_i_reg[0] ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;
  wire [31:0]p_5_out_0;
  wire ram_rstram_b;
  wire ram_rstram_b_0;
  wire s_axi_aclk;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(36)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram 
       (.ADDRARDADDR({1'b0,1'b0,\gc1.count_d2_reg[6] ,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(s_axi_aclk),
        .CLKBWRCLK(s_axi_aclk),
        .DIADI({\icap_dataout_i_reg[0] [8],\icap_dataout_i_reg[0] [9],\icap_dataout_i_reg[0] [10],\icap_dataout_i_reg[0] [11],\icap_dataout_i_reg[0] [12],\icap_dataout_i_reg[0] [13],\icap_dataout_i_reg[0] [14],\icap_dataout_i_reg[0] [15],\icap_dataout_i_reg[0] [0],\icap_dataout_i_reg[0] [1],\icap_dataout_i_reg[0] [2],\icap_dataout_i_reg[0] [3],\icap_dataout_i_reg[0] [4],\icap_dataout_i_reg[0] [5],\icap_dataout_i_reg[0] [6],\icap_dataout_i_reg[0] [7]}),
        .DIBDI({\icap_dataout_i_reg[0] [24],\icap_dataout_i_reg[0] [25],\icap_dataout_i_reg[0] [26],\icap_dataout_i_reg[0] [27],\icap_dataout_i_reg[0] [28],\icap_dataout_i_reg[0] [29],\icap_dataout_i_reg[0] [30],\icap_dataout_i_reg[0] [31],\icap_dataout_i_reg[0] [16],\icap_dataout_i_reg[0] [17],\icap_dataout_i_reg[0] [18],\icap_dataout_i_reg[0] [19],\icap_dataout_i_reg[0] [20],\icap_dataout_i_reg[0] [21],\icap_dataout_i_reg[0] [22],\icap_dataout_i_reg[0] [23]}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(p_5_out_0[15:0]),
        .DOBDO(p_5_out_0[31:16]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_33 }),
        .DOPBDOP({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_34 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_n_35 }),
        .ENARDEN(ENB_I),
        .ENBWREN(ENA_I),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(ram_rstram_b_0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({E,E,E,E}));
  LUT2 #(
    .INIT(4'hE)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_3 
       (.I0(POR_B),
        .I1(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .O(ram_rstram_b));
  LUT2 #(
    .INIT(4'hE)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_3__0 
       (.I0(POR_B),
        .I1(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .O(ram_rstram_b_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top
   (D,
    ENA_dly_D,
    ENB_dly_D,
    \SAFETY_CKT_GEN.POR_B_reg ,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    ram_rstram_b,
    \gc1.count_d2_reg[5] ,
    Q,
    s_axi_wdata,
    E,
    POR_B,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] );
  output [31:0]D;
  output ENA_dly_D;
  output ENB_dly_D;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input ram_rstram_b;
  input [5:0]\gc1.count_d2_reg[5] ;
  input [5:0]Q;
  input [31:0]s_axi_wdata;
  input [0:0]E;
  input POR_B;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;

  wire [31:0]D;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_dly_D;
  wire POR_B;
  wire [5:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  wire [5:0]\gc1.count_d2_reg[5] ;
  wire ram_rstram_b;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr \valid.cstr 
       (.D(D),
        .E(E),
        .ENA_I(ENA_I),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ),
        .\gc1.count_d2_reg[5] (\gc1.count_d2_reg[5] ),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top__parameterized0
   (p_5_out_0,
    POR_B,
    ENB_dly_D,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstram_b,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    \gc1.count_d2_reg[6] ,
    Q,
    \icap_dataout_i_reg[0] ,
    E,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 );
  output [31:0]p_5_out_0;
  output POR_B;
  output ENB_dly_D;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  output ram_rstram_b;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input [6:0]\gc1.count_d2_reg[6] ;
  input [6:0]Q;
  input [31:0]\icap_dataout_i_reg[0] ;
  input [0:0]E;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire ENB_dly_D;
  wire POR_B;
  wire [6:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  wire [6:0]\gc1.count_d2_reg[6] ;
  wire [31:0]\icap_dataout_i_reg[0] ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;
  wire [31:0]p_5_out_0;
  wire ram_rstram_b;
  wire s_axi_aclk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr__parameterized0 \valid.cstr 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ),
        .\gc1.count_d2_reg[6] (\gc1.count_d2_reg[6] ),
        .\icap_dataout_i_reg[0] (\icap_dataout_i_reg[0] ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .p_5_out_0(p_5_out_0),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_1
   (D,
    ENA_dly_D,
    ENB_dly_D,
    \SAFETY_CKT_GEN.POR_B_reg ,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    ram_rstram_b,
    \gc1.count_d2_reg[5] ,
    Q,
    s_axi_wdata,
    E,
    POR_B,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] );
  output [31:0]D;
  output ENA_dly_D;
  output ENB_dly_D;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input ram_rstram_b;
  input [5:0]\gc1.count_d2_reg[5] ;
  input [5:0]Q;
  input [31:0]s_axi_wdata;
  input [0:0]E;
  input POR_B;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;

  wire [31:0]D;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_dly_D;
  wire POR_B;
  wire [5:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  wire [5:0]\gc1.count_d2_reg[5] ;
  wire ram_rstram_b;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_1_synth inst_blk_mem_gen
       (.D(D),
        .E(E),
        .ENA_I(ENA_I),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ),
        .\gc1.count_d2_reg[5] (\gc1.count_d2_reg[5] ),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_1" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_1__parameterized1
   (p_5_out_0,
    POR_B,
    ENB_dly_D,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstram_b,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    \gc1.count_d2_reg[6] ,
    Q,
    \icap_dataout_i_reg[0] ,
    E,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 );
  output [31:0]p_5_out_0;
  output POR_B;
  output ENB_dly_D;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  output ram_rstram_b;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input [6:0]\gc1.count_d2_reg[6] ;
  input [6:0]Q;
  input [31:0]\icap_dataout_i_reg[0] ;
  input [0:0]E;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire ENB_dly_D;
  wire POR_B;
  wire [6:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  wire [6:0]\gc1.count_d2_reg[6] ;
  wire [31:0]\icap_dataout_i_reg[0] ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;
  wire [31:0]p_5_out_0;
  wire ram_rstram_b;
  wire s_axi_aclk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_1_synth__parameterized0 inst_blk_mem_gen
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ),
        .\gc1.count_d2_reg[6] (\gc1.count_d2_reg[6] ),
        .\icap_dataout_i_reg[0] (\icap_dataout_i_reg[0] ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .p_5_out_0(p_5_out_0),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_1_synth
   (D,
    ENA_dly_D,
    ENB_dly_D,
    \SAFETY_CKT_GEN.POR_B_reg ,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    ram_rstram_b,
    \gc1.count_d2_reg[5] ,
    Q,
    s_axi_wdata,
    E,
    POR_B,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] );
  output [31:0]D;
  output ENA_dly_D;
  output ENB_dly_D;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input ram_rstram_b;
  input [5:0]\gc1.count_d2_reg[5] ;
  input [5:0]Q;
  input [31:0]s_axi_wdata;
  input [0:0]E;
  input POR_B;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;

  wire [31:0]D;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_dly_D;
  wire POR_B;
  wire [5:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  wire [5:0]\gc1.count_d2_reg[5] ;
  wire ram_rstram_b;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.D(D),
        .E(E),
        .ENA_I(ENA_I),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ),
        .\gc1.count_d2_reg[5] (\gc1.count_d2_reg[5] ),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_1_synth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_1_synth__parameterized0
   (p_5_out_0,
    POR_B,
    ENB_dly_D,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstram_b,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    \gc1.count_d2_reg[6] ,
    Q,
    \icap_dataout_i_reg[0] ,
    E,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 );
  output [31:0]p_5_out_0;
  output POR_B;
  output ENB_dly_D;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  output ram_rstram_b;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input [6:0]\gc1.count_d2_reg[6] ;
  input [6:0]Q;
  input [31:0]\icap_dataout_i_reg[0] ;
  input [0:0]E;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire ENB_dly_D;
  wire POR_B;
  wire [6:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  wire [6:0]\gc1.count_d2_reg[6] ;
  wire [31:0]\icap_dataout_i_reg[0] ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;
  wire [31:0]p_5_out_0;
  wire ram_rstram_b;
  wire s_axi_aclk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top__parameterized0 \gnbram.gnativebmg.native_blk_mem_gen 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ),
        .\gc1.count_d2_reg[6] (\gc1.count_d2_reg[6] ),
        .\icap_dataout_i_reg[0] (\icap_dataout_i_reg[0] ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .p_5_out_0(p_5_out_0),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_x_pntrs
   (ram_empty_fb_i_reg,
    RD_PNTR_WR,
    out,
    ram_empty_fb_i_reg_0,
    wrfifo_rden,
    Q,
    \gc1.count_d2_reg[5] ,
    SS,
    s_axi_aclk,
    \gic0.gc1.count_d3_reg[5] );
  output ram_empty_fb_i_reg;
  output [5:0]RD_PNTR_WR;
  input out;
  input ram_empty_fb_i_reg_0;
  input wrfifo_rden;
  input [5:0]Q;
  input [5:0]\gc1.count_d2_reg[5] ;
  input [0:0]SS;
  input s_axi_aclk;
  input [5:0]\gic0.gc1.count_d3_reg[5] ;

  wire [5:0]Q;
  wire [5:0]RD_PNTR_WR;
  wire [0:0]SS;
  wire [5:0]\gc1.count_d2_reg[5] ;
  wire [5:0]\gic0.gc1.count_d3_reg[5] ;
  wire out;
  wire [5:0]p_24_out;
  wire ram_empty_fb_i_reg;
  wire ram_empty_fb_i_reg_0;
  wire ram_empty_i_i_2_n_0;
  wire ram_empty_i_i_3_n_0;
  wire ram_empty_i_i_4_n_0;
  wire ram_empty_i_i_5_n_0;
  wire ram_empty_i_i_6_n_0;
  wire ram_empty_i_i_7_n_0;
  wire s_axi_aclk;
  wire wrfifo_rden;

  LUT6 #(
    .INIT(64'hAAAEAAAAAAAAAAAA)) 
    ram_empty_i_i_1
       (.I0(ram_empty_i_i_2_n_0),
        .I1(ram_empty_i_i_3_n_0),
        .I2(out),
        .I3(ram_empty_fb_i_reg_0),
        .I4(ram_empty_i_i_4_n_0),
        .I5(wrfifo_rden),
        .O(ram_empty_fb_i_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFF90090000)) 
    ram_empty_i_i_2
       (.I0(p_24_out[1]),
        .I1(\gc1.count_d2_reg[5] [1]),
        .I2(p_24_out[0]),
        .I3(\gc1.count_d2_reg[5] [0]),
        .I4(ram_empty_i_i_5_n_0),
        .I5(SS),
        .O(ram_empty_i_i_2_n_0));
  LUT5 #(
    .INIT(32'h90090000)) 
    ram_empty_i_i_3
       (.I0(Q[2]),
        .I1(p_24_out[2]),
        .I2(Q[3]),
        .I3(p_24_out[3]),
        .I4(ram_empty_i_i_6_n_0),
        .O(ram_empty_i_i_3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_empty_i_i_4
       (.I0(p_24_out[4]),
        .I1(Q[4]),
        .I2(p_24_out[5]),
        .I3(Q[5]),
        .O(ram_empty_i_i_4_n_0));
  LUT5 #(
    .INIT(32'h90090000)) 
    ram_empty_i_i_5
       (.I0(\gc1.count_d2_reg[5] [5]),
        .I1(p_24_out[5]),
        .I2(\gc1.count_d2_reg[5] [4]),
        .I3(p_24_out[4]),
        .I4(ram_empty_i_i_7_n_0),
        .O(ram_empty_i_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_empty_i_i_6
       (.I0(p_24_out[1]),
        .I1(Q[1]),
        .I2(p_24_out[0]),
        .I3(Q[0]),
        .O(ram_empty_i_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_empty_i_i_7
       (.I0(p_24_out[3]),
        .I1(\gc1.count_d2_reg[5] [3]),
        .I2(p_24_out[2]),
        .I3(\gc1.count_d2_reg[5] [2]),
        .O(ram_empty_i_i_7_n_0));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* REG_OUTPUT = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "6" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray rd_pntr_cdc_inst
       (.dest_clk(s_axi_aclk),
        .dest_out_bin(RD_PNTR_WR),
        .src_clk(s_axi_aclk),
        .src_in_bin(\gc1.count_d2_reg[5] ));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* REG_OUTPUT = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "6" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__1 wr_pntr_cdc_inst
       (.dest_clk(s_axi_aclk),
        .dest_out_bin(p_24_out),
        .src_clk(s_axi_aclk),
        .src_in_bin(\gic0.gc1.count_d3_reg[5] ));
endmodule

(* ORIG_REF_NAME = "clk_x_pntrs" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_x_pntrs__parameterized0
   (ram_empty_fb_i_reg,
    WR_PNTR_RD,
    S,
    \rd_dc_i_reg[3] ,
    RD_PNTR_WR,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    \gc1.count_d1_reg[6] ,
    ipbus_ack,
    \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ,
    Q,
    out,
    \gc1.count_d1_reg[4] ,
    s_axi_aclk,
    \gic0.gc1.count_d3_reg[6] );
  output ram_empty_fb_i_reg;
  output [6:0]WR_PNTR_RD;
  output [2:0]S;
  output [3:0]\rd_dc_i_reg[3] ;
  output [6:0]RD_PNTR_WR;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input \gc1.count_d1_reg[6] ;
  input ipbus_ack;
  input \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  input [6:0]Q;
  input out;
  input [4:0]\gc1.count_d1_reg[4] ;
  input s_axi_aclk;
  input [6:0]\gic0.gc1.count_d3_reg[6] ;

  wire \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  wire [6:0]Q;
  wire [6:0]RD_PNTR_WR;
  wire [2:0]S;
  wire [6:0]WR_PNTR_RD;
  wire [4:0]\gc1.count_d1_reg[4] ;
  wire \gc1.count_d1_reg[6] ;
  wire [6:0]\gic0.gc1.count_d3_reg[6] ;
  wire ipbus_ack;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire out;
  wire ram_empty_fb_i_reg;
  wire ram_empty_i_i_10_n_0;
  wire ram_empty_i_i_4__0_n_0;
  wire ram_empty_i_i_5__0_n_0;
  wire ram_empty_i_i_6__0_n_0;
  wire ram_empty_i_i_7__0_n_0;
  wire ram_empty_i_i_8_n_0;
  wire ram_empty_i_i_9_n_0;
  wire [3:0]\rd_dc_i_reg[3] ;
  wire s_axi_aclk;

  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_1__1
       (.I0(WR_PNTR_RD[6]),
        .I1(Q[6]),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_2__1
       (.I0(WR_PNTR_RD[5]),
        .I1(Q[5]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_3__0
       (.I0(WR_PNTR_RD[4]),
        .I1(Q[4]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_1__1
       (.I0(WR_PNTR_RD[3]),
        .I1(Q[3]),
        .O(\rd_dc_i_reg[3] [3]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_2__1
       (.I0(WR_PNTR_RD[2]),
        .I1(Q[2]),
        .O(\rd_dc_i_reg[3] [2]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_3__1
       (.I0(WR_PNTR_RD[1]),
        .I1(Q[1]),
        .O(\rd_dc_i_reg[3] [1]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_4__1
       (.I0(WR_PNTR_RD[0]),
        .I1(Q[0]),
        .O(\rd_dc_i_reg[3] [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_empty_i_i_10
       (.I0(WR_PNTR_RD[3]),
        .I1(Q[3]),
        .I2(WR_PNTR_RD[2]),
        .I3(Q[2]),
        .O(ram_empty_i_i_10_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFEAAAAAAA)) 
    ram_empty_i_i_1__0
       (.I0(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .I1(\gc1.count_d1_reg[6] ),
        .I2(ipbus_ack),
        .I3(\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ),
        .I4(ram_empty_i_i_4__0_n_0),
        .I5(ram_empty_i_i_5__0_n_0),
        .O(ram_empty_fb_i_reg));
  LUT5 #(
    .INIT(32'h08000008)) 
    ram_empty_i_i_4__0
       (.I0(ram_empty_i_i_6__0_n_0),
        .I1(ram_empty_i_i_7__0_n_0),
        .I2(out),
        .I3(\gc1.count_d1_reg[4] [0]),
        .I4(WR_PNTR_RD[0]),
        .O(ram_empty_i_i_4__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000000000)) 
    ram_empty_i_i_5__0
       (.I0(WR_PNTR_RD[1]),
        .I1(Q[1]),
        .I2(WR_PNTR_RD[0]),
        .I3(Q[0]),
        .I4(ram_empty_i_i_8_n_0),
        .I5(ram_empty_i_i_9_n_0),
        .O(ram_empty_i_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_empty_i_i_6__0
       (.I0(WR_PNTR_RD[2]),
        .I1(\gc1.count_d1_reg[4] [2]),
        .I2(WR_PNTR_RD[1]),
        .I3(\gc1.count_d1_reg[4] [1]),
        .O(ram_empty_i_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_empty_i_i_7__0
       (.I0(WR_PNTR_RD[4]),
        .I1(\gc1.count_d1_reg[4] [4]),
        .I2(WR_PNTR_RD[3]),
        .I3(\gc1.count_d1_reg[4] [3]),
        .O(ram_empty_i_i_7__0_n_0));
  LUT5 #(
    .INIT(32'h90090000)) 
    ram_empty_i_i_8
       (.I0(Q[4]),
        .I1(WR_PNTR_RD[4]),
        .I2(Q[6]),
        .I3(WR_PNTR_RD[6]),
        .I4(ram_empty_i_i_10_n_0),
        .O(ram_empty_i_i_8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    ram_empty_i_i_9
       (.I0(WR_PNTR_RD[5]),
        .I1(Q[5]),
        .O(ram_empty_i_i_9_n_0));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* REG_OUTPUT = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "7" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__parameterized0 rd_pntr_cdc_inst
       (.dest_clk(s_axi_aclk),
        .dest_out_bin(RD_PNTR_WR),
        .src_clk(s_axi_aclk),
        .src_in_bin(Q));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* REG_OUTPUT = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "7" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__parameterized0__1 wr_pntr_cdc_inst
       (.dest_clk(s_axi_aclk),
        .dest_out_bin(WR_PNTR_RD),
        .src_clk(s_axi_aclk),
        .src_in_bin(\gic0.gc1.count_d3_reg[6] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_ramfifo
   (\syncstages_ff_reg[0] ,
    D,
    out,
    ENA_dly_D,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ,
    ram_full_fb_i_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ,
    \SAFETY_CKT_GEN.POR_B_reg ,
    src_rst,
    s_axi_aclk,
    ram_rstram_b,
    s_axi_wdata,
    POR_B,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ,
    wrfifo_rden,
    sw_reset_reg,
    p_8_in,
    Bus_RNW_reg,
    busip_1,
    Bus_RNW_reg_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 );
  output \syncstages_ff_reg[0] ;
  output [31:0]D;
  output out;
  output ENA_dly_D;
  output [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  output ram_full_fb_i_reg;
  output \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  input src_rst;
  input s_axi_aclk;
  input ram_rstram_b;
  input [31:0]s_axi_wdata;
  input POR_B;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  input wrfifo_rden;
  input sw_reset_reg;
  input p_8_in;
  input Bus_RNW_reg;
  input busip_1;
  input Bus_RNW_reg_reg;
  input \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire [31:0]D;
  wire ENA_dly_D;
  wire [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  wire POR_B;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  wire busip_1;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENA_I ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_0 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_1 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_16 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_17 ;
  wire out;
  wire [5:0]p_0_out;
  wire p_10_out;
  wire [5:0]p_13_out;
  wire p_20_out;
  wire [5:0]p_25_out;
  wire p_2_out;
  wire p_8_in;
  wire p_9_out;
  wire ram_full_fb_i_reg;
  wire ram_rstram_b;
  wire [5:0]rd_pntr_plus1;
  wire rstblk_n_0;
  wire rstblk_n_3;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;
  wire src_rst;
  wire sw_reset_reg;
  wire \syncstages_ff_reg[0] ;
  wire wrfifo_rden;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_x_pntrs \gntv_or_sync_fifo.gcx.clkx 
       (.Q(rd_pntr_plus1),
        .RD_PNTR_WR(p_25_out),
        .SS(\syncstages_ff_reg[0] ),
        .\gc1.count_d2_reg[5] (p_0_out),
        .\gic0.gc1.count_d3_reg[5] (p_13_out),
        .out(out),
        .ram_empty_fb_i_reg(\gntv_or_sync_fifo.gcx.clkx_n_0 ),
        .ram_empty_fb_i_reg_0(p_2_out),
        .s_axi_aclk(s_axi_aclk),
        .wrfifo_rden(wrfifo_rden));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (p_2_out),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 (p_0_out),
        .ENB_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ),
        .ENB_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ),
        .Q(rd_pntr_plus1),
        .SS(\syncstages_ff_reg[0] ),
        .out(out),
        .ram_empty_i_reg(\gntv_or_sync_fifo.gcx.clkx_n_0 ),
        .s_axi_aclk(s_axi_aclk),
        .wrfifo_rden(wrfifo_rden));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .E(p_20_out),
        .ENA_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENA_I ),
        .ENA_dly_D(ENA_dly_D),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ),
        .Q(p_13_out),
        .RD_PNTR_WR(p_25_out),
        .busip_1(busip_1),
        .\gic0.gc1.count_reg[5] (\gntv_or_sync_fifo.gl0.wr_n_1 ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg (rstblk_n_3),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 (rstblk_n_0),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg (p_9_out),
        .out(p_10_out),
        .p_8_in(p_8_in),
        .ram_full_fb_i_reg(\gntv_or_sync_fifo.gl0.wr_n_16 ),
        .ram_full_fb_i_reg_0(\gntv_or_sync_fifo.gl0.wr_n_17 ),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata[0]),
        .sw_reset_reg(sw_reset_reg));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_memory \gntv_or_sync_fifo.mem 
       (.D(D),
        .E(p_20_out),
        .ENA_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENA_I ),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ),
        .ENB_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ),
        .POR_B(POR_B),
        .Q(p_13_out),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ),
        .\gc1.count_d2_reg[5] (p_0_out),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_reset_blk_ramfifo rstblk
       (.Bus_RNW_reg(Bus_RNW_reg),
        .SS(\syncstages_ff_reg[0] ),
        .busip_1(busip_1),
        .\gic0.gc1.count_d1_reg[4] (\gntv_or_sync_fifo.gl0.wr_n_16 ),
        .\gic0.gc1.count_d2_reg[4] (\gntv_or_sync_fifo.gl0.wr_n_17 ),
        .out(p_9_out),
        .p_8_in(p_8_in),
        .ram_full_fb_i_reg(rstblk_n_3),
        .ram_full_fb_i_reg_0(ram_full_fb_i_reg),
        .ram_full_fb_i_reg_1(\gntv_or_sync_fifo.gl0.wr_n_1 ),
        .ram_full_i_reg(p_10_out),
        .s_axi_aclk(s_axi_aclk),
        .src_rst(src_rst),
        .\syncstages_ff_reg[0] (rstblk_n_0));
endmodule

(* ORIG_REF_NAME = "fifo_generator_ramfifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_ramfifo__parameterized0
   (src_rst,
    p_5_out_0,
    POR_B,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstram_b,
    prmry_in,
    ipbus_ack,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ,
    gate_signal_p_reg,
    s_axi_aclk,
    Q,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    rdfifo_wren,
    ENA_dly_D,
    \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ,
    p_7_in,
    Bus_RNW_reg,
    ipbus_2,
    ipbus_1,
    sw_reset_reg,
    fifo_rst,
    abort_onreset,
    Bus_RNW_reg_reg,
    s_axi_wdata,
    p_1_in5_in,
    gate_signal_p_reg_0);
  output src_rst;
  output [31:0]p_5_out_0;
  output POR_B;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  output ram_rstram_b;
  output prmry_in;
  output ipbus_ack;
  output \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  output [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  output gate_signal_p_reg;
  input s_axi_aclk;
  input [31:0]Q;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input rdfifo_wren;
  input ENA_dly_D;
  input \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  input p_7_in;
  input Bus_RNW_reg;
  input ipbus_2;
  input ipbus_1;
  input sw_reset_reg;
  input fifo_rst;
  input abort_onreset;
  input Bus_RNW_reg_reg;
  input [0:0]s_axi_wdata;
  input p_1_in5_in;
  input gate_signal_p_reg_0;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire ENA_dly_D;
  wire \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  wire \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  wire [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  wire POR_B;
  wire [31:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  wire abort_onreset;
  wire fifo_rst;
  wire gate_signal_p_reg;
  wire gate_signal_p_reg_0;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENA_I ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_0 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_10 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_11 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_12 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_13 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_14 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_8 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_9 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_3 ;
  wire ipbus_1;
  wire ipbus_2;
  wire ipbus_ack;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire [6:0]p_0_out;
  wire [6:0]p_13_out;
  wire p_1_in5_in;
  wire p_20_out;
  wire [6:0]p_24_out;
  wire [6:0]p_25_out;
  wire p_2_out;
  wire [31:0]p_5_out_0;
  wire p_7_in;
  wire p_8_out;
  wire p_9_out;
  wire prmry_in;
  wire ram_rstram_b;
  wire [4:0]rd_pntr_plus1;
  wire rdfifo_wren;
  wire rst_full_gen_i;
  wire rstblk_n_1;
  wire rstblk_n_2;
  wire s_axi_aclk;
  wire [0:0]s_axi_wdata;
  wire src_rst;
  wire sw_reset_reg;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_x_pntrs__parameterized0 \gntv_or_sync_fifo.gcx.clkx 
       (.\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] (\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ),
        .Q(p_0_out),
        .RD_PNTR_WR(p_25_out),
        .S({\gntv_or_sync_fifo.gcx.clkx_n_8 ,\gntv_or_sync_fifo.gcx.clkx_n_9 ,\gntv_or_sync_fifo.gcx.clkx_n_10 }),
        .WR_PNTR_RD(p_24_out),
        .\gc1.count_d1_reg[4] (rd_pntr_plus1),
        .\gc1.count_d1_reg[6] (\gntv_or_sync_fifo.gl0.rd_n_3 ),
        .\gic0.gc1.count_d3_reg[6] (p_13_out),
        .ipbus_ack(ipbus_ack),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (rstblk_n_2),
        .out(p_2_out),
        .ram_empty_fb_i_reg(\gntv_or_sync_fifo.gcx.clkx_n_0 ),
        .\rd_dc_i_reg[3] ({\gntv_or_sync_fifo.gcx.clkx_n_11 ,\gntv_or_sync_fifo.gcx.clkx_n_12 ,\gntv_or_sync_fifo.gcx.clkx_n_13 ,\gntv_or_sync_fifo.gcx.clkx_n_14 }),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_logic__parameterized0 \gntv_or_sync_fifo.gl0.rd 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (p_0_out),
        .E(p_8_out),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ),
        .Q(rd_pntr_plus1),
        .S({\gntv_or_sync_fifo.gcx.clkx_n_8 ,\gntv_or_sync_fifo.gcx.clkx_n_9 ,\gntv_or_sync_fifo.gcx.clkx_n_10 }),
        .WR_PNTR_RD(p_24_out),
        .\dest_out_bin_ff_reg[3] ({\gntv_or_sync_fifo.gcx.clkx_n_11 ,\gntv_or_sync_fifo.gcx.clkx_n_12 ,\gntv_or_sync_fifo.gcx.clkx_n_13 ,\gntv_or_sync_fifo.gcx.clkx_n_14 }),
        .ipbus_1(ipbus_1),
        .ipbus_2(ipbus_2),
        .ipbus_ack(ipbus_ack),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\gntv_or_sync_fifo.gcx.clkx_n_0 ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 (rstblk_n_2),
        .out(p_2_out),
        .p_1_in5_in(p_1_in5_in),
        .p_7_in(p_7_in),
        .ram_empty_fb_i_reg(\gntv_or_sync_fifo.gl0.rd_n_3 ),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_logic__parameterized0 \gntv_or_sync_fifo.gl0.wr 
       (.E(p_20_out),
        .ENA_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENA_I ),
        .ENA_dly_D(ENA_dly_D),
        .Q(p_13_out),
        .RD_PNTR_WR(p_25_out),
        .gate_signal_p_reg(gate_signal_p_reg),
        .gate_signal_p_reg_0(gate_signal_p_reg_0),
        .\grstd1.grst_full.grst_f.rst_d3_reg (rst_full_gen_i),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg (rstblk_n_1),
        .out(p_9_out),
        .prmry_in(prmry_in),
        .rdfifo_wren(rdfifo_wren),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_memory__parameterized0 \gntv_or_sync_fifo.mem 
       (.E(p_20_out),
        .ENA_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENA_I ),
        .ENB_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ),
        .ENB_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ),
        .POR_B(POR_B),
        .Q(p_13_out),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ),
        .\gc1.count_d2_reg[6] (p_0_out),
        .\icap_dataout_i_reg[0] (Q),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 (rstblk_n_2),
        .p_5_out_0(p_5_out_0),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_reset_blk_ramfifo__xdcDup__1 rstblk
       (.E(p_8_out),
        .ENB_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_I ),
        .ENB_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/ENB_dly_D ),
        .abort_onreset(abort_onreset),
        .fifo_rst(fifo_rst),
        .out(p_9_out),
        .ram_full_i_reg(rst_full_gen_i),
        .s_axi_aclk(s_axi_aclk),
        .src_rst(src_rst),
        .sw_reset_reg(sw_reset_reg),
        .\syncstages_ff_reg[0] (rstblk_n_1),
        .\syncstages_ff_reg[0]_0 (rstblk_n_2));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_top
   (SS,
    D,
    out,
    ENA_dly_D,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ,
    ram_full_fb_i_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ,
    \SAFETY_CKT_GEN.POR_B_reg ,
    src_rst,
    s_axi_aclk,
    ram_rstram_b,
    s_axi_wdata,
    POR_B,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ,
    wrfifo_rden,
    sw_reset_reg,
    p_8_in,
    Bus_RNW_reg,
    busip_1,
    Bus_RNW_reg_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 );
  output [0:0]SS;
  output [31:0]D;
  output out;
  output ENA_dly_D;
  output [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  output ram_full_fb_i_reg;
  output \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  input src_rst;
  input s_axi_aclk;
  input ram_rstram_b;
  input [31:0]s_axi_wdata;
  input POR_B;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  input wrfifo_rden;
  input sw_reset_reg;
  input p_8_in;
  input Bus_RNW_reg;
  input busip_1;
  input Bus_RNW_reg_reg;
  input \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire [31:0]D;
  wire ENA_dly_D;
  wire [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  wire POR_B;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  wire [0:0]SS;
  wire busip_1;
  wire out;
  wire p_8_in;
  wire ram_full_fb_i_reg;
  wire ram_rstram_b;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;
  wire src_rst;
  wire sw_reset_reg;
  wire wrfifo_rden;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_ramfifo \grf.rf 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .D(D),
        .ENA_dly_D(ENA_dly_D),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ),
        .POR_B(POR_B),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ),
        .busip_1(busip_1),
        .out(out),
        .p_8_in(p_8_in),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata),
        .src_rst(src_rst),
        .sw_reset_reg(sw_reset_reg),
        .\syncstages_ff_reg[0] (SS),
        .wrfifo_rden(wrfifo_rden));
endmodule

(* ORIG_REF_NAME = "fifo_generator_top" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_top__parameterized0
   (src_rst,
    p_5_out_0,
    POR_B,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstram_b,
    prmry_in,
    ipbus_ack,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ,
    gate_signal_p_reg,
    s_axi_aclk,
    Q,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    rdfifo_wren,
    ENA_dly_D,
    \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ,
    p_7_in,
    Bus_RNW_reg,
    ipbus_2,
    ipbus_1,
    sw_reset_reg,
    fifo_rst,
    abort_onreset,
    Bus_RNW_reg_reg,
    s_axi_wdata,
    p_1_in5_in,
    gate_signal_p_reg_0);
  output src_rst;
  output [31:0]p_5_out_0;
  output POR_B;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  output ram_rstram_b;
  output prmry_in;
  output ipbus_ack;
  output \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  output [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  output gate_signal_p_reg;
  input s_axi_aclk;
  input [31:0]Q;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input rdfifo_wren;
  input ENA_dly_D;
  input \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  input p_7_in;
  input Bus_RNW_reg;
  input ipbus_2;
  input ipbus_1;
  input sw_reset_reg;
  input fifo_rst;
  input abort_onreset;
  input Bus_RNW_reg_reg;
  input [0:0]s_axi_wdata;
  input p_1_in5_in;
  input gate_signal_p_reg_0;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire ENA_dly_D;
  wire \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  wire \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  wire [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  wire POR_B;
  wire [31:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  wire abort_onreset;
  wire fifo_rst;
  wire gate_signal_p_reg;
  wire gate_signal_p_reg_0;
  wire ipbus_1;
  wire ipbus_2;
  wire ipbus_ack;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire p_1_in5_in;
  wire [31:0]p_5_out_0;
  wire p_7_in;
  wire prmry_in;
  wire ram_rstram_b;
  wire rdfifo_wren;
  wire s_axi_aclk;
  wire [0:0]s_axi_wdata;
  wire src_rst;
  wire sw_reset_reg;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_ramfifo__parameterized0 \grf.rf 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .ENA_dly_D(ENA_dly_D),
        .\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] (\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ),
        .abort_onreset(abort_onreset),
        .fifo_rst(fifo_rst),
        .gate_signal_p_reg(gate_signal_p_reg),
        .gate_signal_p_reg_0(gate_signal_p_reg_0),
        .ipbus_1(ipbus_1),
        .ipbus_2(ipbus_2),
        .ipbus_ack(ipbus_ack),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .p_1_in5_in(p_1_in5_in),
        .p_5_out_0(p_5_out_0),
        .p_7_in(p_7_in),
        .prmry_in(prmry_in),
        .ram_rstram_b(ram_rstram_b),
        .rdfifo_wren(rdfifo_wren),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata),
        .src_rst(src_rst),
        .sw_reset_reg(sw_reset_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_1
   (SS,
    D,
    out,
    ENA_dly_D,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ,
    ram_full_fb_i_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ,
    \SAFETY_CKT_GEN.POR_B_reg ,
    src_rst,
    s_axi_aclk,
    ram_rstram_b,
    s_axi_wdata,
    POR_B,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ,
    wrfifo_rden,
    sw_reset_reg,
    p_8_in,
    Bus_RNW_reg,
    busip_1,
    Bus_RNW_reg_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 );
  output [0:0]SS;
  output [31:0]D;
  output out;
  output ENA_dly_D;
  output [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  output ram_full_fb_i_reg;
  output \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  input src_rst;
  input s_axi_aclk;
  input ram_rstram_b;
  input [31:0]s_axi_wdata;
  input POR_B;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  input wrfifo_rden;
  input sw_reset_reg;
  input p_8_in;
  input Bus_RNW_reg;
  input busip_1;
  input Bus_RNW_reg_reg;
  input \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire [31:0]D;
  wire ENA_dly_D;
  wire [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  wire POR_B;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  wire [0:0]SS;
  wire busip_1;
  wire out;
  wire p_8_in;
  wire ram_full_fb_i_reg;
  wire ram_rstram_b;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;
  wire src_rst;
  wire sw_reset_reg;
  wire wrfifo_rden;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_1_synth inst_fifo_gen
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .D(D),
        .ENA_dly_D(ENA_dly_D),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ),
        .POR_B(POR_B),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ),
        .busip_1(busip_1),
        .out(out),
        .p_8_in(p_8_in),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata),
        .src_rst(src_rst),
        .sw_reset_reg(sw_reset_reg),
        .\syncstages_ff_reg[0] (SS),
        .wrfifo_rden(wrfifo_rden));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v13_2_1" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_1__parameterized0
   (src_rst,
    p_5_out_0,
    POR_B,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstram_b,
    prmry_in,
    ipbus_ack,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ,
    gate_signal_p_reg,
    s_axi_aclk,
    Q,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    rdfifo_wren,
    ENA_dly_D,
    \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ,
    p_7_in,
    Bus_RNW_reg,
    ipbus_2,
    ipbus_1,
    sw_reset_reg,
    fifo_rst,
    abort_onreset,
    Bus_RNW_reg_reg,
    s_axi_wdata,
    p_1_in5_in,
    gate_signal_p_reg_0);
  output src_rst;
  output [31:0]p_5_out_0;
  output POR_B;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  output ram_rstram_b;
  output prmry_in;
  output ipbus_ack;
  output \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  output [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  output gate_signal_p_reg;
  input s_axi_aclk;
  input [31:0]Q;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input rdfifo_wren;
  input ENA_dly_D;
  input \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  input p_7_in;
  input Bus_RNW_reg;
  input ipbus_2;
  input ipbus_1;
  input sw_reset_reg;
  input fifo_rst;
  input abort_onreset;
  input Bus_RNW_reg_reg;
  input [0:0]s_axi_wdata;
  input p_1_in5_in;
  input gate_signal_p_reg_0;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire ENA_dly_D;
  wire \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  wire \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  wire [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  wire POR_B;
  wire [31:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  wire abort_onreset;
  wire fifo_rst;
  wire gate_signal_p_reg;
  wire gate_signal_p_reg_0;
  wire ipbus_1;
  wire ipbus_2;
  wire ipbus_ack;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire p_1_in5_in;
  wire [31:0]p_5_out_0;
  wire p_7_in;
  wire prmry_in;
  wire ram_rstram_b;
  wire rdfifo_wren;
  wire s_axi_aclk;
  wire [0:0]s_axi_wdata;
  wire src_rst;
  wire sw_reset_reg;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_1_synth__parameterized0 inst_fifo_gen
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .ENA_dly_D(ENA_dly_D),
        .\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] (\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ),
        .abort_onreset(abort_onreset),
        .fifo_rst(fifo_rst),
        .gate_signal_p_reg(gate_signal_p_reg),
        .gate_signal_p_reg_0(gate_signal_p_reg_0),
        .ipbus_1(ipbus_1),
        .ipbus_2(ipbus_2),
        .ipbus_ack(ipbus_ack),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .p_1_in5_in(p_1_in5_in),
        .p_5_out_0(p_5_out_0),
        .p_7_in(p_7_in),
        .prmry_in(prmry_in),
        .ram_rstram_b(ram_rstram_b),
        .rdfifo_wren(rdfifo_wren),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata),
        .src_rst(src_rst),
        .sw_reset_reg(sw_reset_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_1_synth
   (\syncstages_ff_reg[0] ,
    D,
    out,
    ENA_dly_D,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ,
    ram_full_fb_i_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ,
    \SAFETY_CKT_GEN.POR_B_reg ,
    src_rst,
    s_axi_aclk,
    ram_rstram_b,
    s_axi_wdata,
    POR_B,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ,
    wrfifo_rden,
    sw_reset_reg,
    p_8_in,
    Bus_RNW_reg,
    busip_1,
    Bus_RNW_reg_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 );
  output \syncstages_ff_reg[0] ;
  output [31:0]D;
  output out;
  output ENA_dly_D;
  output [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  output ram_full_fb_i_reg;
  output \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  input src_rst;
  input s_axi_aclk;
  input ram_rstram_b;
  input [31:0]s_axi_wdata;
  input POR_B;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  input wrfifo_rden;
  input sw_reset_reg;
  input p_8_in;
  input Bus_RNW_reg;
  input busip_1;
  input Bus_RNW_reg_reg;
  input \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire [31:0]D;
  wire ENA_dly_D;
  wire [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  wire POR_B;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  wire busip_1;
  wire out;
  wire p_8_in;
  wire ram_full_fb_i_reg;
  wire ram_rstram_b;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;
  wire src_rst;
  wire sw_reset_reg;
  wire \syncstages_ff_reg[0] ;
  wire wrfifo_rden;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_top \gconvfifo.rf 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .D(D),
        .ENA_dly_D(ENA_dly_D),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ),
        .POR_B(POR_B),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ),
        .SS(\syncstages_ff_reg[0] ),
        .busip_1(busip_1),
        .out(out),
        .p_8_in(p_8_in),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata),
        .src_rst(src_rst),
        .sw_reset_reg(sw_reset_reg),
        .wrfifo_rden(wrfifo_rden));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v13_2_1_synth" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_1_synth__parameterized0
   (src_rst,
    p_5_out_0,
    POR_B,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstram_b,
    prmry_in,
    ipbus_ack,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ,
    gate_signal_p_reg,
    s_axi_aclk,
    Q,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    rdfifo_wren,
    ENA_dly_D,
    \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ,
    p_7_in,
    Bus_RNW_reg,
    ipbus_2,
    ipbus_1,
    sw_reset_reg,
    fifo_rst,
    abort_onreset,
    Bus_RNW_reg_reg,
    s_axi_wdata,
    p_1_in5_in,
    gate_signal_p_reg_0);
  output src_rst;
  output [31:0]p_5_out_0;
  output POR_B;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  output ram_rstram_b;
  output prmry_in;
  output ipbus_ack;
  output \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  output [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  output gate_signal_p_reg;
  input s_axi_aclk;
  input [31:0]Q;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input rdfifo_wren;
  input ENA_dly_D;
  input \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  input p_7_in;
  input Bus_RNW_reg;
  input ipbus_2;
  input ipbus_1;
  input sw_reset_reg;
  input fifo_rst;
  input abort_onreset;
  input Bus_RNW_reg_reg;
  input [0:0]s_axi_wdata;
  input p_1_in5_in;
  input gate_signal_p_reg_0;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire ENA_dly_D;
  wire \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ;
  wire \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  wire [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  wire POR_B;
  wire [31:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  wire abort_onreset;
  wire fifo_rst;
  wire gate_signal_p_reg;
  wire gate_signal_p_reg_0;
  wire ipbus_1;
  wire ipbus_2;
  wire ipbus_ack;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire p_1_in5_in;
  wire [31:0]p_5_out_0;
  wire p_7_in;
  wire prmry_in;
  wire ram_rstram_b;
  wire rdfifo_wren;
  wire s_axi_aclk;
  wire [0:0]s_axi_wdata;
  wire src_rst;
  wire sw_reset_reg;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_top__parameterized0 \gconvfifo.rf 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .ENA_dly_D(ENA_dly_D),
        .\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] (\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ),
        .abort_onreset(abort_onreset),
        .fifo_rst(fifo_rst),
        .gate_signal_p_reg(gate_signal_p_reg),
        .gate_signal_p_reg_0(gate_signal_p_reg_0),
        .ipbus_1(ipbus_1),
        .ipbus_2(ipbus_2),
        .ipbus_ack(ipbus_ack),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .p_1_in5_in(p_1_in5_in),
        .p_5_out_0(p_5_out_0),
        .p_7_in(p_7_in),
        .prmry_in(prmry_in),
        .ram_rstram_b(ram_rstram_b),
        .rdfifo_wren(rdfifo_wren),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata),
        .src_rst(src_rst),
        .sw_reset_reg(sw_reset_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_memory
   (D,
    ENA_dly_D,
    ENB_dly_D,
    \SAFETY_CKT_GEN.POR_B_reg ,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    ram_rstram_b,
    \gc1.count_d2_reg[5] ,
    Q,
    s_axi_wdata,
    E,
    POR_B,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] );
  output [31:0]D;
  output ENA_dly_D;
  output ENB_dly_D;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input ram_rstram_b;
  input [5:0]\gc1.count_d2_reg[5] ;
  input [5:0]Q;
  input [31:0]s_axi_wdata;
  input [0:0]E;
  input POR_B;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;

  wire [31:0]D;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_dly_D;
  wire POR_B;
  wire [5:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ;
  wire [5:0]\gc1.count_d2_reg[5] ;
  wire ram_rstram_b;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_1 \gbm.gbmg.gbmga.ngecc.bmg 
       (.D(D),
        .E(E),
        .ENA_I(ENA_I),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] ),
        .\gc1.count_d2_reg[5] (\gc1.count_d2_reg[5] ),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata));
endmodule

(* ORIG_REF_NAME = "memory" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_memory__parameterized0
   (p_5_out_0,
    POR_B,
    ENB_dly_D,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstram_b,
    s_axi_aclk,
    ENB_I,
    ENA_I,
    \gc1.count_d2_reg[6] ,
    Q,
    \icap_dataout_i_reg[0] ,
    E,
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 );
  output [31:0]p_5_out_0;
  output POR_B;
  output ENB_dly_D;
  output \SAFETY_CKT_GEN.POR_B_reg ;
  output ram_rstram_b;
  input s_axi_aclk;
  input ENB_I;
  input ENA_I;
  input [6:0]\gc1.count_d2_reg[6] ;
  input [6:0]Q;
  input [31:0]\icap_dataout_i_reg[0] ;
  input [0:0]E;
  input \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire ENB_dly_D;
  wire POR_B;
  wire [6:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ;
  wire [6:0]\gc1.count_d2_reg[6] ;
  wire [31:0]\icap_dataout_i_reg[0] ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;
  wire [31:0]p_5_out_0;
  wire ram_rstram_b;
  wire s_axi_aclk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_1__parameterized1 \gbm.gbmg.gbmga.ngecc.bmg 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .POR_B(POR_B),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] (\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] ),
        .\gc1.count_d2_reg[6] (\gc1.count_d2_reg[6] ),
        .\icap_dataout_i_reg[0] (\icap_dataout_i_reg[0] ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .p_5_out_0(p_5_out_0),
        .ram_rstram_b(ram_rstram_b),
        .s_axi_aclk(s_axi_aclk));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_bin_cntr
   (Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    SS,
    E,
    s_axi_aclk);
  output [5:0]Q;
  output [5:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [0:0]SS;
  input [0:0]E;
  input s_axi_aclk;

  wire [5:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire [5:0]Q;
  wire [0:0]SS;
  wire [5:0]plusOp__2;
  wire [5:0]rd_pntr_plus2;
  wire s_axi_aclk;

  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gc1.count[0]_i_1__0 
       (.I0(rd_pntr_plus2[0]),
        .O(plusOp__2[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \gc1.count[1]_i_1__0 
       (.I0(rd_pntr_plus2[0]),
        .I1(rd_pntr_plus2[1]),
        .O(plusOp__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gc1.count[2]_i_1__0 
       (.I0(rd_pntr_plus2[1]),
        .I1(rd_pntr_plus2[0]),
        .I2(rd_pntr_plus2[2]),
        .O(plusOp__2[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc1.count[3]_i_1__0 
       (.I0(rd_pntr_plus2[2]),
        .I1(rd_pntr_plus2[0]),
        .I2(rd_pntr_plus2[1]),
        .I3(rd_pntr_plus2[3]),
        .O(plusOp__2[3]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gc1.count[4]_i_1__0 
       (.I0(rd_pntr_plus2[0]),
        .I1(rd_pntr_plus2[1]),
        .I2(rd_pntr_plus2[2]),
        .I3(rd_pntr_plus2[3]),
        .I4(rd_pntr_plus2[4]),
        .O(plusOp__2[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gc1.count[5]_i_1__0 
       (.I0(rd_pntr_plus2[0]),
        .I1(rd_pntr_plus2[1]),
        .I2(rd_pntr_plus2[4]),
        .I3(rd_pntr_plus2[3]),
        .I4(rd_pntr_plus2[2]),
        .I5(rd_pntr_plus2[5]),
        .O(plusOp__2[5]));
  FDSE #(
    .INIT(1'b1)) 
    \gc1.count_d1_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[0]),
        .Q(Q[0]),
        .S(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[1]),
        .Q(Q[1]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[2]),
        .Q(Q[2]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[3]),
        .Q(Q[3]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[4]),
        .Q(Q[4]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[5]),
        .Q(Q[5]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(Q[0]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [0]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(Q[1]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [1]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(Q[2]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [2]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(Q[3]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [3]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(Q[4]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [4]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(Q[5]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [5]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__2[0]),
        .Q(rd_pntr_plus2[0]),
        .R(SS));
  FDSE #(
    .INIT(1'b1)) 
    \gc1.count_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__2[1]),
        .Q(rd_pntr_plus2[1]),
        .S(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__2[2]),
        .Q(rd_pntr_plus2[2]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__2[3]),
        .Q(rd_pntr_plus2[3]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__2[4]),
        .Q(rd_pntr_plus2[4]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__2[5]),
        .Q(rd_pntr_plus2[5]),
        .R(SS));
endmodule

(* ORIG_REF_NAME = "rd_bin_cntr" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_bin_cntr__parameterized0
   (ram_empty_fb_i_reg,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    WR_PNTR_RD,
    out,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    E,
    s_axi_aclk);
  output ram_empty_fb_i_reg;
  output [4:0]Q;
  output [6:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input [1:0]WR_PNTR_RD;
  input out;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input [0:0]E;
  input s_axi_aclk;

  wire [6:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire [4:0]Q;
  wire [1:0]WR_PNTR_RD;
  wire \gc1.count[6]_i_2_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire out;
  wire [6:0]plusOp__1;
  wire ram_empty_fb_i_reg;
  wire [6:5]rd_pntr_plus1;
  wire [6:0]rd_pntr_plus2;
  wire s_axi_aclk;

  LUT1 #(
    .INIT(2'h1)) 
    \gc1.count[0]_i_1 
       (.I0(rd_pntr_plus2[0]),
        .O(plusOp__1[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \gc1.count[1]_i_1 
       (.I0(rd_pntr_plus2[0]),
        .I1(rd_pntr_plus2[1]),
        .O(plusOp__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gc1.count[2]_i_1 
       (.I0(rd_pntr_plus2[1]),
        .I1(rd_pntr_plus2[0]),
        .I2(rd_pntr_plus2[2]),
        .O(plusOp__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc1.count[3]_i_1 
       (.I0(rd_pntr_plus2[2]),
        .I1(rd_pntr_plus2[0]),
        .I2(rd_pntr_plus2[1]),
        .I3(rd_pntr_plus2[3]),
        .O(plusOp__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gc1.count[4]_i_1 
       (.I0(rd_pntr_plus2[3]),
        .I1(rd_pntr_plus2[1]),
        .I2(rd_pntr_plus2[0]),
        .I3(rd_pntr_plus2[2]),
        .I4(rd_pntr_plus2[4]),
        .O(plusOp__1[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gc1.count[5]_i_1 
       (.I0(rd_pntr_plus2[1]),
        .I1(rd_pntr_plus2[0]),
        .I2(rd_pntr_plus2[2]),
        .I3(rd_pntr_plus2[3]),
        .I4(rd_pntr_plus2[4]),
        .I5(rd_pntr_plus2[5]),
        .O(plusOp__1[5]));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gc1.count[6]_i_1 
       (.I0(\gc1.count[6]_i_2_n_0 ),
        .I1(rd_pntr_plus2[5]),
        .I2(rd_pntr_plus2[4]),
        .I3(rd_pntr_plus2[3]),
        .I4(rd_pntr_plus2[6]),
        .O(plusOp__1[6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \gc1.count[6]_i_2 
       (.I0(rd_pntr_plus2[1]),
        .I1(rd_pntr_plus2[0]),
        .I2(rd_pntr_plus2[2]),
        .O(\gc1.count[6]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gc1.count_d1_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[0]),
        .Q(Q[0]),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[1]),
        .Q(Q[1]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[2]),
        .Q(Q[2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[3]),
        .Q(Q[3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[4]),
        .Q(Q[4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[5]),
        .Q(rd_pntr_plus1[5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus2[6]),
        .Q(rd_pntr_plus1[6]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(Q[0]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [0]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(Q[1]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [1]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(Q[2]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(Q[3]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(Q[4]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus1[5]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(rd_pntr_plus1[6]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [6]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__1[0]),
        .Q(rd_pntr_plus2[0]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDSE #(
    .INIT(1'b1)) 
    \gc1.count_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__1[1]),
        .Q(rd_pntr_plus2[1]),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__1[2]),
        .Q(rd_pntr_plus2[2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__1[3]),
        .Q(rd_pntr_plus2[3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__1[4]),
        .Q(rd_pntr_plus2[4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__1[5]),
        .Q(rd_pntr_plus2[5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__1[6]),
        .Q(rd_pntr_plus2[6]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  LUT5 #(
    .INIT(32'h00009009)) 
    ram_empty_i_i_2__0
       (.I0(rd_pntr_plus1[6]),
        .I1(WR_PNTR_RD[1]),
        .I2(rd_pntr_plus1[5]),
        .I3(WR_PNTR_RD[0]),
        .I4(out),
        .O(ram_empty_fb_i_reg));
endmodule

(* ORIG_REF_NAME = "rd_dc_as" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_dc_as__parameterized0
   (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ,
    WR_PNTR_RD,
    \dest_out_bin_ff_reg[3] ,
    S,
    Bus_RNW_reg_reg,
    s_axi_wdata,
    p_1_in5_in,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    s_axi_aclk);
  output \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  output [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  input [5:0]WR_PNTR_RD;
  input [3:0]\dest_out_bin_ff_reg[3] ;
  input [2:0]S;
  input Bus_RNW_reg_reg;
  input [0:0]s_axi_wdata;
  input p_1_in5_in;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input s_axi_aclk;

  wire Bus_RNW_reg_reg;
  wire \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  wire [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  wire [2:0]S;
  wire [5:0]WR_PNTR_RD;
  wire [3:0]\dest_out_bin_ff_reg[3] ;
  wire minusOp_carry__0_n_2;
  wire minusOp_carry__0_n_3;
  wire minusOp_carry__0_n_5;
  wire minusOp_carry__0_n_6;
  wire minusOp_carry__0_n_7;
  wire minusOp_carry_n_0;
  wire minusOp_carry_n_1;
  wire minusOp_carry_n_2;
  wire minusOp_carry_n_3;
  wire minusOp_carry_n_4;
  wire minusOp_carry_n_5;
  wire minusOp_carry_n_6;
  wire minusOp_carry_n_7;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire p_1_in5_in;
  wire s_axi_aclk;
  wire [0:0]s_axi_wdata;
  wire [3:2]NLW_minusOp_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_minusOp_carry__0_O_UNCONNECTED;

  LUT4 #(
    .INIT(16'hEFBA)) 
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg[1]_i_1 
       (.I0(\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 [6]),
        .I1(Bus_RNW_reg_reg),
        .I2(s_axi_wdata),
        .I3(p_1_in5_in),
        .O(\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ));
  CARRY4 minusOp_carry
       (.CI(1'b0),
        .CO({minusOp_carry_n_0,minusOp_carry_n_1,minusOp_carry_n_2,minusOp_carry_n_3}),
        .CYINIT(1'b1),
        .DI(WR_PNTR_RD[3:0]),
        .O({minusOp_carry_n_4,minusOp_carry_n_5,minusOp_carry_n_6,minusOp_carry_n_7}),
        .S(\dest_out_bin_ff_reg[3] ));
  CARRY4 minusOp_carry__0
       (.CI(minusOp_carry_n_0),
        .CO({NLW_minusOp_carry__0_CO_UNCONNECTED[3:2],minusOp_carry__0_n_2,minusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,WR_PNTR_RD[5:4]}),
        .O({NLW_minusOp_carry__0_O_UNCONNECTED[3],minusOp_carry__0_n_5,minusOp_carry__0_n_6,minusOp_carry__0_n_7}),
        .S({1'b0,S}));
  FDRE #(
    .INIT(1'b0)) 
    \rd_dc_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_7),
        .Q(\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 [0]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_dc_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_6),
        .Q(\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 [1]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_dc_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_5),
        .Q(\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 [2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_dc_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_4),
        .Q(\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 [3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_dc_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry__0_n_7),
        .Q(\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 [4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_dc_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry__0_n_6),
        .Q(\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 [5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_dc_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry__0_n_5),
        .Q(\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 [6]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_logic
   (out,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    ENB_I,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ,
    ram_empty_i_reg,
    s_axi_aclk,
    wrfifo_rden,
    SS,
    ENB_dly_D);
  output out;
  output \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  output ENB_I;
  output [5:0]Q;
  output [5:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  input ram_empty_i_reg;
  input s_axi_aclk;
  input wrfifo_rden;
  input [0:0]SS;
  input ENB_dly_D;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [5:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  wire ENB_I;
  wire ENB_dly_D;
  wire [5:0]Q;
  wire [0:0]SS;
  wire out;
  wire p_8_out;
  wire ram_empty_i_reg;
  wire s_axi_aclk;
  wire wrfifo_rden;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_status_flags_as \gras.rsts 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(p_8_out),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .SS(SS),
        .out(out),
        .ram_empty_i_reg_0(ram_empty_i_reg),
        .s_axi_aclk(s_axi_aclk),
        .wrfifo_rden(wrfifo_rden));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_bin_cntr rpntr
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ),
        .E(p_8_out),
        .Q(Q),
        .SS(SS),
        .s_axi_aclk(s_axi_aclk));
endmodule

(* ORIG_REF_NAME = "rd_logic" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_logic__parameterized0
   (out,
    E,
    ipbus_ack,
    ram_empty_fb_i_reg,
    Q,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ,
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    s_axi_aclk,
    WR_PNTR_RD,
    \dest_out_bin_ff_reg[3] ,
    S,
    p_7_in,
    Bus_RNW_reg,
    ipbus_2,
    ipbus_1,
    Bus_RNW_reg_reg,
    s_axi_wdata,
    p_1_in5_in,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 );
  output out;
  output [0:0]E;
  output ipbus_ack;
  output ram_empty_fb_i_reg;
  output [4:0]Q;
  output \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  output [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  output [6:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input s_axi_aclk;
  input [6:0]WR_PNTR_RD;
  input [3:0]\dest_out_bin_ff_reg[3] ;
  input [2:0]S;
  input p_7_in;
  input Bus_RNW_reg;
  input ipbus_2;
  input ipbus_1;
  input Bus_RNW_reg_reg;
  input [0:0]s_axi_wdata;
  input p_1_in5_in;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire [6:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ;
  wire [6:0]\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ;
  wire [4:0]Q;
  wire [2:0]S;
  wire [6:0]WR_PNTR_RD;
  wire [3:0]\dest_out_bin_ff_reg[3] ;
  wire ipbus_1;
  wire ipbus_2;
  wire ipbus_ack;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ;
  wire out;
  wire p_1_in5_in;
  wire p_7_in;
  wire ram_empty_fb_i_reg;
  wire readfifo_empty;
  wire s_axi_aclk;
  wire [0:0]s_axi_wdata;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_dc_as__parameterized0 \gras.grdc1.rdc 
       (.Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] ),
        .\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 (\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]_0 ),
        .S(S),
        .WR_PNTR_RD(WR_PNTR_RD[5:0]),
        .\dest_out_bin_ff_reg[3] (\dest_out_bin_ff_reg[3] ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .p_1_in5_in(p_1_in5_in),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_status_flags_as__parameterized0 \gras.rsts 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .E(E),
        .\gc1.count_reg[6] (out),
        .ipbus_1(ipbus_1),
        .ipbus_2(ipbus_2),
        .ipbus_ack(ipbus_ack),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .out(readfifo_empty),
        .p_7_in(p_7_in),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_bin_cntr__parameterized0 rpntr
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .E(E),
        .Q(Q),
        .WR_PNTR_RD(WR_PNTR_RD[6:5]),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg_0 ),
        .out(readfifo_empty),
        .ram_empty_fb_i_reg(ram_empty_fb_i_reg),
        .s_axi_aclk(s_axi_aclk));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_status_flags_as
   (out,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    E,
    ENB_I,
    ram_empty_i_reg_0,
    s_axi_aclk,
    wrfifo_rden,
    SS,
    ENB_dly_D);
  output out;
  output \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  output [0:0]E;
  output ENB_I;
  input ram_empty_i_reg_0;
  input s_axi_aclk;
  input wrfifo_rden;
  input [0:0]SS;
  input ENB_dly_D;

  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire [0:0]SS;
  (* DONT_TOUCH *) wire ram_empty_fb_i;
  (* DONT_TOUCH *) wire ram_empty_i;
  wire ram_empty_i_reg_0;
  wire s_axi_aclk;
  wire wrfifo_rden;

  assign \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram  = ram_empty_fb_i;
  assign out = ram_empty_i;
  LUT5 #(
    .INIT(32'hFFFFFF10)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_1__0 
       (.I0(ram_empty_i),
        .I1(ram_empty_fb_i),
        .I2(wrfifo_rden),
        .I3(SS),
        .I4(ENB_dly_D),
        .O(ENB_I));
  LUT3 #(
    .INIT(8'h10)) 
    \gc1.count_d1[5]_i_1 
       (.I0(ram_empty_i),
        .I1(ram_empty_fb_i),
        .I2(wrfifo_rden),
        .O(E));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ram_empty_i_reg_0),
        .Q(ram_empty_fb_i),
        .R(1'b0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_empty_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ram_empty_i_reg_0),
        .Q(ram_empty_i),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "rd_status_flags_as" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_status_flags_as__parameterized0
   (out,
    \gc1.count_reg[6] ,
    E,
    ipbus_ack,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ,
    s_axi_aclk,
    p_7_in,
    Bus_RNW_reg,
    ipbus_2,
    ipbus_1);
  output out;
  output \gc1.count_reg[6] ;
  output [0:0]E;
  output ipbus_ack;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  input s_axi_aclk;
  input p_7_in;
  input Bus_RNW_reg;
  input ipbus_2;
  input ipbus_1;

  wire Bus_RNW_reg;
  wire [0:0]E;
  wire ipbus_1;
  wire ipbus_2;
  wire ipbus_ack;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ;
  wire p_7_in;
  (* DONT_TOUCH *) wire ram_empty_fb_i;
  (* DONT_TOUCH *) wire ram_empty_i;
  wire s_axi_aclk;

  assign \gc1.count_reg[6]  = ram_empty_fb_i;
  assign out = ram_empty_i;
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \gc1.count_d1[6]_i_1 
       (.I0(p_7_in),
        .I1(Bus_RNW_reg),
        .I2(ram_empty_i),
        .I3(ram_empty_fb_i),
        .I4(ipbus_2),
        .I5(ipbus_1),
        .O(E));
  LUT2 #(
    .INIT(4'h2)) 
    ipbus_ack_fifo_i_1
       (.I0(ipbus_1),
        .I1(ipbus_2),
        .O(ipbus_ack));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .Q(ram_empty_fb_i),
        .R(1'b0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_empty_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg ),
        .Q(ram_empty_i),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_reset_blk_ramfifo
   (\syncstages_ff_reg[0] ,
    SS,
    out,
    ram_full_fb_i_reg,
    ram_full_fb_i_reg_0,
    src_rst,
    s_axi_aclk,
    \gic0.gc1.count_d2_reg[4] ,
    \gic0.gc1.count_d1_reg[4] ,
    ram_full_fb_i_reg_1,
    busip_1,
    Bus_RNW_reg,
    ram_full_i_reg,
    p_8_in);
  output \syncstages_ff_reg[0] ;
  output [0:0]SS;
  output out;
  output ram_full_fb_i_reg;
  output ram_full_fb_i_reg_0;
  input src_rst;
  input s_axi_aclk;
  input \gic0.gc1.count_d2_reg[4] ;
  input \gic0.gc1.count_d1_reg[4] ;
  input ram_full_fb_i_reg_1;
  input busip_1;
  input Bus_RNW_reg;
  input ram_full_i_reg;
  input p_8_in;

  wire Bus_RNW_reg;
  wire [0:0]SS;
  wire arst_sync_rd_rst;
  wire busip_1;
  wire dest_out;
  wire dest_rst;
  wire \gic0.gc1.count_d1_reg[4] ;
  wire \gic0.gc1.count_d2_reg[4] ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1_n_0 ;
  wire p_8_in;
  wire ram_full_fb_i_reg;
  wire ram_full_fb_i_reg_0;
  wire ram_full_fb_i_reg_1;
  wire ram_full_i_reg;
  wire [3:0]rd_rst_wr_ext;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d2;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d3;
  wire s_axi_aclk;
  wire sckt_rd_rst_wr;
  wire src_rst;
  wire \syncstages_ff_reg[0] ;
  wire wr_rst_busy_i;
  wire [1:0]wr_rst_rd_ext;

  assign out = wr_rst_busy_i;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(wr_rst_busy_i),
        .Q(rst_d1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rst_d1),
        .Q(rst_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDSE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d3_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rst_d2),
        .Q(rst_d3),
        .S(\syncstages_ff_reg[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(sckt_rd_rst_wr),
        .Q(rd_rst_wr_ext[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[0]),
        .Q(rd_rst_wr_ext[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[1]),
        .Q(rd_rst_wr_ext[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[2]),
        .Q(rd_rst_wr_ext[3]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hF4)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1 
       (.I0(wr_rst_rd_ext[1]),
        .I1(SS),
        .I2(arst_sync_rd_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1_n_0 ),
        .Q(SS),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFF8A)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1 
       (.I0(\syncstages_ff_reg[0] ),
        .I1(rd_rst_wr_ext[0]),
        .I2(rd_rst_wr_ext[1]),
        .I3(dest_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1_n_0 ),
        .Q(\syncstages_ff_reg[0] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFF040F0F0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1 
       (.I0(rd_rst_wr_ext[0]),
        .I1(rd_rst_wr_ext[1]),
        .I2(wr_rst_busy_i),
        .I3(rd_rst_wr_ext[2]),
        .I4(rd_rst_wr_ext[3]),
        .I5(dest_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1_n_0 ),
        .Q(wr_rst_busy_i),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(dest_out),
        .Q(wr_rst_rd_ext[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(wr_rst_rd_ext[0]),
        .Q(wr_rst_rd_ext[1]),
        .R(1'b0));
  (* DEST_SYNC_FF = "5" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__3 \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr 
       (.dest_clk(s_axi_aclk),
        .dest_out(sckt_rd_rst_wr),
        .src_clk(s_axi_aclk),
        .src_in(SS));
  (* DEST_SYNC_FF = "5" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__2 \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd 
       (.dest_clk(s_axi_aclk),
        .dest_out(dest_out),
        .src_clk(s_axi_aclk),
        .src_in(\syncstages_ff_reg[0] ));
  (* DEF_VAL = "1'b1" *) 
  (* DEST_SYNC_FF = "5" *) 
  (* INIT = "1" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__3 \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst 
       (.dest_clk(s_axi_aclk),
        .dest_rst(arst_sync_rd_rst),
        .src_rst(src_rst));
  (* DEF_VAL = "1'b1" *) 
  (* DEST_SYNC_FF = "5" *) 
  (* INIT = "1" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__2 \ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst 
       (.dest_clk(s_axi_aclk),
        .dest_rst(dest_rst),
        .src_rst(src_rst));
  LUT6 #(
    .INIT(64'hAAAAEEFEAAAAEEEE)) 
    ram_full_i_i_1
       (.I0(\syncstages_ff_reg[0] ),
        .I1(\gic0.gc1.count_d2_reg[4] ),
        .I2(\gic0.gc1.count_d1_reg[4] ),
        .I3(ram_full_fb_i_reg_1),
        .I4(rst_d3),
        .I5(ram_full_fb_i_reg_0),
        .O(ram_full_fb_i_reg));
  LUT5 #(
    .INIT(32'h00010000)) 
    ram_full_i_i_4
       (.I0(wr_rst_busy_i),
        .I1(busip_1),
        .I2(Bus_RNW_reg),
        .I3(ram_full_i_reg),
        .I4(p_8_in),
        .O(ram_full_fb_i_reg_0));
endmodule

(* ORIG_REF_NAME = "reset_blk_ramfifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_reset_blk_ramfifo__xdcDup__1
   (src_rst,
    \syncstages_ff_reg[0] ,
    \syncstages_ff_reg[0]_0 ,
    out,
    ram_full_i_reg,
    ENB_I,
    s_axi_aclk,
    ENB_dly_D,
    E,
    sw_reset_reg,
    fifo_rst,
    abort_onreset);
  output src_rst;
  output \syncstages_ff_reg[0] ;
  output \syncstages_ff_reg[0]_0 ;
  output out;
  output ram_full_i_reg;
  output ENB_I;
  input s_axi_aclk;
  input ENB_dly_D;
  input [0:0]E;
  input sw_reset_reg;
  input fifo_rst;
  input abort_onreset;

  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_D;
  wire abort_onreset;
  wire arst_sync_rd_rst;
  wire dest_out;
  wire dest_rst;
  wire fifo_rst;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1__0_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1__0_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1__0_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg_n_0_[0] ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg_n_0_[1] ;
  wire [3:0]rd_rst_wr_ext;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d2;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d3;
  wire s_axi_aclk;
  wire sckt_rd_rst_wr;
  wire src_rst;
  wire sw_reset_reg;
  wire \syncstages_ff_reg[0] ;
  wire \syncstages_ff_reg[0]_0 ;
  wire wr_rst_busy_i;

  assign out = wr_rst_busy_i;
  assign ram_full_i_reg = rst_d3;
  LUT3 #(
    .INIT(8'hFE)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_1 
       (.I0(\syncstages_ff_reg[0]_0 ),
        .I1(ENB_dly_D),
        .I2(E),
        .O(ENB_I));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(wr_rst_busy_i),
        .Q(rst_d1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rst_d1),
        .Q(rst_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDSE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d3_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rst_d2),
        .Q(rst_d3),
        .S(\syncstages_ff_reg[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(sckt_rd_rst_wr),
        .Q(rd_rst_wr_ext[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[0]),
        .Q(rd_rst_wr_ext[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[1]),
        .Q(rd_rst_wr_ext[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[2]),
        .Q(rd_rst_wr_ext[3]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hF4)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1__0 
       (.I0(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg_n_0_[1] ),
        .I1(\syncstages_ff_reg[0]_0 ),
        .I2(arst_sync_rd_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1__0_n_0 ),
        .Q(\syncstages_ff_reg[0]_0 ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFF8A)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1__0 
       (.I0(\syncstages_ff_reg[0] ),
        .I1(rd_rst_wr_ext[0]),
        .I2(rd_rst_wr_ext[1]),
        .I3(dest_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1__0_n_0 ),
        .Q(\syncstages_ff_reg[0] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFF040F0F0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1__0 
       (.I0(rd_rst_wr_ext[0]),
        .I1(rd_rst_wr_ext[1]),
        .I2(wr_rst_busy_i),
        .I3(rd_rst_wr_ext[2]),
        .I4(rd_rst_wr_ext[3]),
        .I5(dest_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_i_1__0_n_0 ),
        .Q(wr_rst_busy_i),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(dest_out),
        .Q(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg_n_0_[0] ),
        .Q(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg_n_0_[1] ),
        .R(1'b0));
  (* DEST_SYNC_FF = "5" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr 
       (.dest_clk(s_axi_aclk),
        .dest_out(sckt_rd_rst_wr),
        .src_clk(s_axi_aclk),
        .src_in(\syncstages_ff_reg[0]_0 ));
  (* DEST_SYNC_FF = "5" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__4 \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd 
       (.dest_clk(s_axi_aclk),
        .dest_out(dest_out),
        .src_clk(s_axi_aclk),
        .src_in(\syncstages_ff_reg[0] ));
  (* DEF_VAL = "1'b1" *) 
  (* DEST_SYNC_FF = "5" *) 
  (* INIT = "1" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst 
       (.dest_clk(s_axi_aclk),
        .dest_rst(arst_sync_rd_rst),
        .src_rst(src_rst));
  (* DEF_VAL = "1'b1" *) 
  (* DEST_SYNC_FF = "5" *) 
  (* INIT = "1" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__4 \ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst 
       (.dest_clk(s_axi_aclk),
        .dest_rst(dest_rst),
        .src_rst(src_rst));
  LUT3 #(
    .INIT(8'hFE)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst_i_1 
       (.I0(sw_reset_reg),
        .I1(fifo_rst),
        .I2(abort_onreset),
        .O(src_rst));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_bin_cntr
   (ram_full_fb_i_reg,
    ram_full_fb_i_reg_0,
    \wr_data_count_i_reg[5] ,
    Q,
    S,
    RD_PNTR_WR,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ,
    E,
    s_axi_aclk);
  output ram_full_fb_i_reg;
  output ram_full_fb_i_reg_0;
  output [1:0]\wr_data_count_i_reg[5] ;
  output [5:0]Q;
  output [3:0]S;
  input [5:0]RD_PNTR_WR;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  input [0:0]E;
  input s_axi_aclk;

  wire [0:0]E;
  wire [5:0]Q;
  wire [5:0]RD_PNTR_WR;
  wire [3:0]S;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  wire [5:0]p_14_out;
  wire [5:0]plusOp;
  wire ram_full_fb_i_reg;
  wire ram_full_fb_i_reg_0;
  wire ram_full_i_i_5_n_0;
  wire ram_full_i_i_6_n_0;
  wire ram_full_i_i_7_n_0;
  wire ram_full_i_i_8_n_0;
  wire s_axi_aclk;
  wire [1:0]\wr_data_count_i_reg[5] ;
  wire [5:0]wr_pntr_plus2;
  wire [5:0]wr_pntr_plus3;

  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gic0.gc1.count[0]_i_1 
       (.I0(wr_pntr_plus3[0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gic0.gc1.count[1]_i_1 
       (.I0(wr_pntr_plus3[0]),
        .I1(wr_pntr_plus3[1]),
        .O(plusOp[1]));
  LUT3 #(
    .INIT(8'h78)) 
    \gic0.gc1.count[2]_i_1 
       (.I0(wr_pntr_plus3[1]),
        .I1(wr_pntr_plus3[0]),
        .I2(wr_pntr_plus3[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gic0.gc1.count[3]_i_1 
       (.I0(wr_pntr_plus3[2]),
        .I1(wr_pntr_plus3[0]),
        .I2(wr_pntr_plus3[1]),
        .I3(wr_pntr_plus3[3]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gic0.gc1.count[4]_i_1 
       (.I0(wr_pntr_plus3[0]),
        .I1(wr_pntr_plus3[1]),
        .I2(wr_pntr_plus3[2]),
        .I3(wr_pntr_plus3[3]),
        .I4(wr_pntr_plus3[4]),
        .O(plusOp[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gic0.gc1.count[5]_i_1 
       (.I0(wr_pntr_plus3[0]),
        .I1(wr_pntr_plus3[1]),
        .I2(wr_pntr_plus3[4]),
        .I3(wr_pntr_plus3[3]),
        .I4(wr_pntr_plus3[2]),
        .I5(wr_pntr_plus3[5]),
        .O(plusOp[5]));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d1_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[0]),
        .Q(wr_pntr_plus2[0]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc1.count_d1_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[1]),
        .Q(wr_pntr_plus2[1]),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d1_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[2]),
        .Q(wr_pntr_plus2[2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d1_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[3]),
        .Q(wr_pntr_plus2[3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d1_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[4]),
        .Q(wr_pntr_plus2[4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d1_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[5]),
        .Q(wr_pntr_plus2[5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc1.count_d2_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus2[0]),
        .Q(p_14_out[0]),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d2_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus2[1]),
        .Q(p_14_out[1]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d2_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus2[2]),
        .Q(p_14_out[2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d2_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus2[3]),
        .Q(p_14_out[3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d2_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus2[4]),
        .Q(p_14_out[4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d2_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus2[5]),
        .Q(p_14_out[5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[0]),
        .Q(Q[0]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[1]),
        .Q(Q[1]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[2]),
        .Q(Q[2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[3]),
        .Q(Q[3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[4]),
        .Q(Q[4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[5]),
        .Q(Q[5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc1.count_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp[0]),
        .Q(wr_pntr_plus3[0]),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc1.count_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp[1]),
        .Q(wr_pntr_plus3[1]),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp[2]),
        .Q(wr_pntr_plus3[2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp[3]),
        .Q(wr_pntr_plus3[3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp[4]),
        .Q(wr_pntr_plus3[4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp[5]),
        .Q(wr_pntr_plus3[5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_1
       (.I0(Q[5]),
        .I1(RD_PNTR_WR[5]),
        .O(\wr_data_count_i_reg[5] [1]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_2
       (.I0(Q[4]),
        .I1(RD_PNTR_WR[4]),
        .O(\wr_data_count_i_reg[5] [0]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_1
       (.I0(Q[3]),
        .I1(RD_PNTR_WR[3]),
        .O(S[3]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_2
       (.I0(Q[2]),
        .I1(RD_PNTR_WR[2]),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_3
       (.I0(Q[1]),
        .I1(RD_PNTR_WR[1]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_4
       (.I0(Q[0]),
        .I1(RD_PNTR_WR[0]),
        .O(S[0]));
  LUT6 #(
    .INIT(64'h8200008200000000)) 
    ram_full_i_i_2
       (.I0(ram_full_i_i_5_n_0),
        .I1(p_14_out[4]),
        .I2(RD_PNTR_WR[4]),
        .I3(p_14_out[5]),
        .I4(RD_PNTR_WR[5]),
        .I5(ram_full_i_i_6_n_0),
        .O(ram_full_fb_i_reg_0));
  LUT6 #(
    .INIT(64'h8200008200000000)) 
    ram_full_i_i_3
       (.I0(ram_full_i_i_7_n_0),
        .I1(wr_pntr_plus2[4]),
        .I2(RD_PNTR_WR[4]),
        .I3(wr_pntr_plus2[5]),
        .I4(RD_PNTR_WR[5]),
        .I5(ram_full_i_i_8_n_0),
        .O(ram_full_fb_i_reg));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_full_i_i_5
       (.I0(p_14_out[3]),
        .I1(RD_PNTR_WR[3]),
        .I2(p_14_out[2]),
        .I3(RD_PNTR_WR[2]),
        .O(ram_full_i_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_full_i_i_6
       (.I0(p_14_out[1]),
        .I1(RD_PNTR_WR[1]),
        .I2(p_14_out[0]),
        .I3(RD_PNTR_WR[0]),
        .O(ram_full_i_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_full_i_i_7
       (.I0(wr_pntr_plus2[3]),
        .I1(RD_PNTR_WR[3]),
        .I2(wr_pntr_plus2[2]),
        .I3(RD_PNTR_WR[2]),
        .O(ram_full_i_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_full_i_i_8
       (.I0(wr_pntr_plus2[1]),
        .I1(RD_PNTR_WR[1]),
        .I2(wr_pntr_plus2[0]),
        .I3(RD_PNTR_WR[0]),
        .O(ram_full_i_i_8_n_0));
endmodule

(* ORIG_REF_NAME = "wr_bin_cntr" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_bin_cntr__parameterized0
   (ram_full_i_reg,
    Q,
    \wr_data_count_i_reg[6] ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    S,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ,
    \grstd1.grst_full.grst_f.rst_d3_reg ,
    RD_PNTR_WR,
    \grstd1.grst_full.grst_f.rst_d3_reg_0 ,
    E,
    s_axi_aclk);
  output ram_full_i_reg;
  output [0:0]Q;
  output [2:0]\wr_data_count_i_reg[6] ;
  output [6:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  output [3:0]S;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  input \grstd1.grst_full.grst_f.rst_d3_reg ;
  input [6:0]RD_PNTR_WR;
  input \grstd1.grst_full.grst_f.rst_d3_reg_0 ;
  input [0:0]E;
  input s_axi_aclk;

  wire [6:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [0:0]E;
  wire [0:0]Q;
  wire [6:0]RD_PNTR_WR;
  wire [3:0]S;
  wire \gic0.gc1.count[6]_i_2_n_0 ;
  wire \grstd1.grst_full.grst_f.rst_d3_reg ;
  wire \grstd1.grst_full.grst_f.rst_d3_reg_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  wire [6:0]p_14_out;
  wire [6:0]plusOp__0;
  wire ram_full_i_i_2__0_n_0;
  wire ram_full_i_i_3__0_n_0;
  wire ram_full_i_i_5__0_n_0;
  wire ram_full_i_i_6__0_n_0;
  wire ram_full_i_i_7__0_n_0;
  wire ram_full_i_i_8__0_n_0;
  wire ram_full_i_reg;
  wire s_axi_aclk;
  wire [2:0]\wr_data_count_i_reg[6] ;
  wire [6:0]wr_pntr_plus2;
  wire [6:0]wr_pntr_plus3;

  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gic0.gc1.count[0]_i_1__0 
       (.I0(wr_pntr_plus3[0]),
        .O(plusOp__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gic0.gc1.count[1]_i_1__0 
       (.I0(wr_pntr_plus3[0]),
        .I1(wr_pntr_plus3[1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gic0.gc1.count[2]_i_1__0 
       (.I0(wr_pntr_plus3[1]),
        .I1(wr_pntr_plus3[0]),
        .I2(wr_pntr_plus3[2]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gic0.gc1.count[3]_i_1__0 
       (.I0(wr_pntr_plus3[2]),
        .I1(wr_pntr_plus3[0]),
        .I2(wr_pntr_plus3[1]),
        .I3(wr_pntr_plus3[3]),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gic0.gc1.count[4]_i_1__0 
       (.I0(wr_pntr_plus3[3]),
        .I1(wr_pntr_plus3[1]),
        .I2(wr_pntr_plus3[0]),
        .I3(wr_pntr_plus3[2]),
        .I4(wr_pntr_plus3[4]),
        .O(plusOp__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gic0.gc1.count[5]_i_1__0 
       (.I0(wr_pntr_plus3[1]),
        .I1(wr_pntr_plus3[0]),
        .I2(wr_pntr_plus3[2]),
        .I3(wr_pntr_plus3[3]),
        .I4(wr_pntr_plus3[4]),
        .I5(wr_pntr_plus3[5]),
        .O(plusOp__0[5]));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gic0.gc1.count[6]_i_1 
       (.I0(\gic0.gc1.count[6]_i_2_n_0 ),
        .I1(wr_pntr_plus3[5]),
        .I2(wr_pntr_plus3[4]),
        .I3(wr_pntr_plus3[3]),
        .I4(wr_pntr_plus3[6]),
        .O(plusOp__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \gic0.gc1.count[6]_i_2 
       (.I0(wr_pntr_plus3[1]),
        .I1(wr_pntr_plus3[0]),
        .I2(wr_pntr_plus3[2]),
        .O(\gic0.gc1.count[6]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d1_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[0]),
        .Q(wr_pntr_plus2[0]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc1.count_d1_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[1]),
        .Q(wr_pntr_plus2[1]),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d1_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[2]),
        .Q(wr_pntr_plus2[2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d1_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[3]),
        .Q(wr_pntr_plus2[3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d1_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[4]),
        .Q(wr_pntr_plus2[4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d1_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[5]),
        .Q(Q),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d1_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus3[6]),
        .Q(wr_pntr_plus2[6]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc1.count_d2_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus2[0]),
        .Q(p_14_out[0]),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d2_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus2[1]),
        .Q(p_14_out[1]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d2_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus2[2]),
        .Q(p_14_out[2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d2_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus2[3]),
        .Q(p_14_out[3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d2_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus2[4]),
        .Q(p_14_out[4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d2_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(Q),
        .Q(p_14_out[5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d2_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wr_pntr_plus2[6]),
        .Q(p_14_out[6]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[0]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [0]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[1]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [1]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[2]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[3]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[4]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[5]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_d3_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_14_out[6]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [6]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc1.count_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__0[0]),
        .Q(wr_pntr_plus3[0]),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc1.count_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__0[1]),
        .Q(wr_pntr_plus3[1]),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__0[2]),
        .Q(wr_pntr_plus3[2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__0[3]),
        .Q(wr_pntr_plus3[3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__0[4]),
        .Q(wr_pntr_plus3[4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__0[5]),
        .Q(wr_pntr_plus3[5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc1.count_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(plusOp__0[6]),
        .Q(wr_pntr_plus3[6]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_1__0
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [6]),
        .I1(RD_PNTR_WR[6]),
        .O(\wr_data_count_i_reg[6] [2]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_2__0
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [5]),
        .I1(RD_PNTR_WR[5]),
        .O(\wr_data_count_i_reg[6] [1]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_3
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [4]),
        .I1(RD_PNTR_WR[4]),
        .O(\wr_data_count_i_reg[6] [0]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_1__0
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [3]),
        .I1(RD_PNTR_WR[3]),
        .O(S[3]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_2__0
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [2]),
        .I1(RD_PNTR_WR[2]),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_3__0
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [1]),
        .I1(RD_PNTR_WR[1]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_4__0
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram [0]),
        .I1(RD_PNTR_WR[0]),
        .O(S[0]));
  LUT6 #(
    .INIT(64'hEEFEEEEEEEEEEEFE)) 
    ram_full_i_i_1__0
       (.I0(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ),
        .I1(ram_full_i_i_2__0_n_0),
        .I2(ram_full_i_i_3__0_n_0),
        .I3(\grstd1.grst_full.grst_f.rst_d3_reg ),
        .I4(p_14_out[5]),
        .I5(RD_PNTR_WR[5]),
        .O(ram_full_i_reg));
  LUT6 #(
    .INIT(64'h8200008200000000)) 
    ram_full_i_i_2__0
       (.I0(\grstd1.grst_full.grst_f.rst_d3_reg_0 ),
        .I1(wr_pntr_plus2[1]),
        .I2(RD_PNTR_WR[1]),
        .I3(wr_pntr_plus2[0]),
        .I4(RD_PNTR_WR[0]),
        .I5(ram_full_i_i_5__0_n_0),
        .O(ram_full_i_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h8200008200000000)) 
    ram_full_i_i_3__0
       (.I0(ram_full_i_i_6__0_n_0),
        .I1(p_14_out[6]),
        .I2(RD_PNTR_WR[6]),
        .I3(p_14_out[4]),
        .I4(RD_PNTR_WR[4]),
        .I5(ram_full_i_i_7__0_n_0),
        .O(ram_full_i_i_3__0_n_0));
  LUT5 #(
    .INIT(32'h90090000)) 
    ram_full_i_i_5__0
       (.I0(RD_PNTR_WR[4]),
        .I1(wr_pntr_plus2[4]),
        .I2(RD_PNTR_WR[6]),
        .I3(wr_pntr_plus2[6]),
        .I4(ram_full_i_i_8__0_n_0),
        .O(ram_full_i_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_full_i_i_6__0
       (.I0(p_14_out[3]),
        .I1(RD_PNTR_WR[3]),
        .I2(p_14_out[2]),
        .I3(RD_PNTR_WR[2]),
        .O(ram_full_i_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_full_i_i_7__0
       (.I0(p_14_out[1]),
        .I1(RD_PNTR_WR[1]),
        .I2(p_14_out[0]),
        .I3(RD_PNTR_WR[0]),
        .O(ram_full_i_i_7__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_full_i_i_8__0
       (.I0(wr_pntr_plus2[3]),
        .I1(RD_PNTR_WR[3]),
        .I2(wr_pntr_plus2[2]),
        .I3(RD_PNTR_WR[2]),
        .O(ram_full_i_i_8__0_n_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_dc_as
   (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ,
    Q,
    S,
    \gic0.gc1.count_d3_reg[5] ,
    sw_reset_reg,
    s_axi_wdata,
    Bus_RNW_reg_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ,
    s_axi_aclk);
  output [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  output \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  input [4:0]Q;
  input [3:0]S;
  input [1:0]\gic0.gc1.count_d3_reg[5] ;
  input sw_reset_reg;
  input [0:0]s_axi_wdata;
  input Bus_RNW_reg_reg;
  input \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  input s_axi_aclk;

  wire Bus_RNW_reg_reg;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_2_n_0 ;
  wire [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  wire [4:0]Q;
  wire [3:0]S;
  wire [1:0]\gic0.gc1.count_d3_reg[5] ;
  wire minusOp_carry__0_n_3;
  wire minusOp_carry__0_n_6;
  wire minusOp_carry__0_n_7;
  wire minusOp_carry_n_0;
  wire minusOp_carry_n_1;
  wire minusOp_carry_n_2;
  wire minusOp_carry_n_3;
  wire minusOp_carry_n_4;
  wire minusOp_carry_n_5;
  wire minusOp_carry_n_6;
  wire minusOp_carry_n_7;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  wire s_axi_aclk;
  wire [0:0]s_axi_wdata;
  wire sw_reset_reg;
  wire [3:1]NLW_minusOp_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_minusOp_carry__0_O_UNCONNECTED;

  LUT5 #(
    .INIT(32'hFFF7F5FD)) 
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_1 
       (.I0(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] [5]),
        .I1(s_axi_wdata),
        .I2(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_2_n_0 ),
        .I3(Bus_RNW_reg_reg),
        .I4(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ),
        .O(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_2 
       (.I0(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] [2]),
        .I1(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] [3]),
        .I2(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] [0]),
        .I3(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] [1]),
        .I4(sw_reset_reg),
        .I5(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] [4]),
        .O(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_2_n_0 ));
  CARRY4 minusOp_carry
       (.CI(1'b0),
        .CO({minusOp_carry_n_0,minusOp_carry_n_1,minusOp_carry_n_2,minusOp_carry_n_3}),
        .CYINIT(1'b1),
        .DI(Q[3:0]),
        .O({minusOp_carry_n_4,minusOp_carry_n_5,minusOp_carry_n_6,minusOp_carry_n_7}),
        .S(S));
  CARRY4 minusOp_carry__0
       (.CI(minusOp_carry_n_0),
        .CO({NLW_minusOp_carry__0_CO_UNCONNECTED[3:1],minusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,Q[4]}),
        .O({NLW_minusOp_carry__0_O_UNCONNECTED[3:2],minusOp_carry__0_n_6,minusOp_carry__0_n_7}),
        .S({1'b0,1'b0,\gic0.gc1.count_d3_reg[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_7),
        .Q(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] [0]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_6),
        .Q(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] [1]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_5),
        .Q(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] [2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_4),
        .Q(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] [3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry__0_n_7),
        .Q(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] [4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry__0_n_6),
        .Q(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] [5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
endmodule

(* ORIG_REF_NAME = "wr_dc_as" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_dc_as__parameterized0
   (gate_signal_p_reg,
    Q,
    S,
    \gic0.gc1.count_d3_reg[6] ,
    gate_signal_p_reg_0,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ,
    s_axi_aclk);
  output gate_signal_p_reg;
  input [5:0]Q;
  input [3:0]S;
  input [2:0]\gic0.gc1.count_d3_reg[6] ;
  input gate_signal_p_reg_0;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  input s_axi_aclk;

  wire [5:0]Q;
  wire [3:0]S;
  wire gate_signal_p_i_2_n_0;
  wire gate_signal_p_i_3_n_0;
  wire gate_signal_p_reg;
  wire gate_signal_p_reg_0;
  wire [2:0]\gic0.gc1.count_d3_reg[6] ;
  wire minusOp_carry__0_n_2;
  wire minusOp_carry__0_n_3;
  wire minusOp_carry__0_n_5;
  wire minusOp_carry__0_n_6;
  wire minusOp_carry__0_n_7;
  wire minusOp_carry_n_0;
  wire minusOp_carry_n_1;
  wire minusOp_carry_n_2;
  wire minusOp_carry_n_3;
  wire minusOp_carry_n_4;
  wire minusOp_carry_n_5;
  wire minusOp_carry_n_6;
  wire minusOp_carry_n_7;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  wire s_axi_aclk;
  wire \wr_data_count_i_reg_n_0_[0] ;
  wire \wr_data_count_i_reg_n_0_[1] ;
  wire \wr_data_count_i_reg_n_0_[2] ;
  wire \wr_data_count_i_reg_n_0_[3] ;
  wire \wr_data_count_i_reg_n_0_[4] ;
  wire \wr_data_count_i_reg_n_0_[5] ;
  wire \wr_data_count_i_reg_n_0_[6] ;
  wire [3:2]NLW_minusOp_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_minusOp_carry__0_O_UNCONNECTED;

  LUT4 #(
    .INIT(16'hAEAA)) 
    gate_signal_p_i_1
       (.I0(gate_signal_p_i_2_n_0),
        .I1(\wr_data_count_i_reg_n_0_[6] ),
        .I2(gate_signal_p_i_3_n_0),
        .I3(gate_signal_p_reg_0),
        .O(gate_signal_p_reg));
  LUT5 #(
    .INIT(32'h80000000)) 
    gate_signal_p_i_2
       (.I0(\wr_data_count_i_reg_n_0_[5] ),
        .I1(\wr_data_count_i_reg_n_0_[3] ),
        .I2(\wr_data_count_i_reg_n_0_[2] ),
        .I3(\wr_data_count_i_reg_n_0_[4] ),
        .I4(\wr_data_count_i_reg_n_0_[6] ),
        .O(gate_signal_p_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    gate_signal_p_i_3
       (.I0(\wr_data_count_i_reg_n_0_[4] ),
        .I1(\wr_data_count_i_reg_n_0_[2] ),
        .I2(\wr_data_count_i_reg_n_0_[0] ),
        .I3(\wr_data_count_i_reg_n_0_[1] ),
        .I4(\wr_data_count_i_reg_n_0_[3] ),
        .I5(\wr_data_count_i_reg_n_0_[5] ),
        .O(gate_signal_p_i_3_n_0));
  CARRY4 minusOp_carry
       (.CI(1'b0),
        .CO({minusOp_carry_n_0,minusOp_carry_n_1,minusOp_carry_n_2,minusOp_carry_n_3}),
        .CYINIT(1'b1),
        .DI(Q[3:0]),
        .O({minusOp_carry_n_4,minusOp_carry_n_5,minusOp_carry_n_6,minusOp_carry_n_7}),
        .S(S));
  CARRY4 minusOp_carry__0
       (.CI(minusOp_carry_n_0),
        .CO({NLW_minusOp_carry__0_CO_UNCONNECTED[3:2],minusOp_carry__0_n_2,minusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Q[5:4]}),
        .O({NLW_minusOp_carry__0_O_UNCONNECTED[3],minusOp_carry__0_n_5,minusOp_carry__0_n_6,minusOp_carry__0_n_7}),
        .S({1'b0,\gic0.gc1.count_d3_reg[6] }));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_7),
        .Q(\wr_data_count_i_reg_n_0_[0] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_6),
        .Q(\wr_data_count_i_reg_n_0_[1] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_5),
        .Q(\wr_data_count_i_reg_n_0_[2] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry_n_4),
        .Q(\wr_data_count_i_reg_n_0_[3] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry__0_n_7),
        .Q(\wr_data_count_i_reg_n_0_[4] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry__0_n_6),
        .Q(\wr_data_count_i_reg_n_0_[5] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(minusOp_carry__0_n_5),
        .Q(\wr_data_count_i_reg_n_0_[6] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_logic
   (out,
    \gic0.gc1.count_reg[5] ,
    Q,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ,
    ENA_I,
    E,
    ram_full_fb_i_reg,
    ram_full_fb_i_reg_0,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ,
    s_axi_aclk,
    sw_reset_reg,
    ENA_dly_D,
    p_8_in,
    Bus_RNW_reg,
    busip_1,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ,
    RD_PNTR_WR,
    s_axi_wdata,
    Bus_RNW_reg_reg,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 );
  output out;
  output \gic0.gc1.count_reg[5] ;
  output [5:0]Q;
  output [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  output ENA_I;
  output [0:0]E;
  output ram_full_fb_i_reg;
  output ram_full_fb_i_reg_0;
  output \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  input s_axi_aclk;
  input sw_reset_reg;
  input ENA_dly_D;
  input p_8_in;
  input Bus_RNW_reg;
  input busip_1;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ;
  input [5:0]RD_PNTR_WR;
  input [0:0]s_axi_wdata;
  input Bus_RNW_reg_reg;
  input \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly_D;
  wire [5:0]\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ;
  wire [5:0]Q;
  wire [5:0]RD_PNTR_WR;
  wire busip_1;
  wire \gic0.gc1.count_reg[5] ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ;
  wire out;
  wire p_8_in;
  wire ram_full_fb_i_reg;
  wire ram_full_fb_i_reg_0;
  wire s_axi_aclk;
  wire [0:0]s_axi_wdata;
  wire sw_reset_reg;
  wire wpntr_n_10;
  wire wpntr_n_11;
  wire wpntr_n_12;
  wire wpntr_n_13;
  wire wpntr_n_2;
  wire wpntr_n_3;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_dc_as \gwas.gwdc0.wdc 
       (.Bus_RNW_reg_reg(Bus_RNW_reg_reg),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 (\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_1 ),
        .Q(Q[4:0]),
        .S({wpntr_n_10,wpntr_n_11,wpntr_n_12,wpntr_n_13}),
        .\gic0.gc1.count_d3_reg[5] ({wpntr_n_2,wpntr_n_3}),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata),
        .sw_reset_reg(sw_reset_reg));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_status_flags_as \gwas.wsts 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .E(E),
        .ENA_I(ENA_I),
        .ENA_dly_D(ENA_dly_D),
        .busip_1(busip_1),
        .\gic0.gc1.count_reg[5] (\gic0.gc1.count_reg[5] ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ),
        .out(out),
        .p_8_in(p_8_in),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_bin_cntr wpntr
       (.E(E),
        .Q(Q),
        .RD_PNTR_WR(RD_PNTR_WR),
        .S({wpntr_n_10,wpntr_n_11,wpntr_n_12,wpntr_n_13}),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg_0 ),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .ram_full_fb_i_reg_0(ram_full_fb_i_reg_0),
        .s_axi_aclk(s_axi_aclk),
        .\wr_data_count_i_reg[5] ({wpntr_n_2,wpntr_n_3}));
endmodule

(* ORIG_REF_NAME = "wr_logic" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_logic__parameterized0
   (Q,
    ENA_I,
    E,
    prmry_in,
    gate_signal_p_reg,
    s_axi_aclk,
    out,
    rdfifo_wren,
    ENA_dly_D,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ,
    \grstd1.grst_full.grst_f.rst_d3_reg ,
    RD_PNTR_WR,
    gate_signal_p_reg_0);
  output [6:0]Q;
  output ENA_I;
  output [0:0]E;
  output prmry_in;
  output gate_signal_p_reg;
  input s_axi_aclk;
  input out;
  input rdfifo_wren;
  input ENA_dly_D;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  input \grstd1.grst_full.grst_f.rst_d3_reg ;
  input [6:0]RD_PNTR_WR;
  input gate_signal_p_reg_0;

  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly_D;
  wire [6:0]Q;
  wire [6:0]RD_PNTR_WR;
  wire gate_signal_p_reg;
  wire gate_signal_p_reg_0;
  wire \grstd1.grst_full.grst_f.rst_d3_reg ;
  wire \gwas.wsts_n_2 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  wire out;
  wire prmry_in;
  wire rdfifo_wren;
  wire s_axi_aclk;
  wire wpntr_n_0;
  wire wpntr_n_12;
  wire wpntr_n_13;
  wire wpntr_n_14;
  wire wpntr_n_15;
  wire wpntr_n_2;
  wire wpntr_n_3;
  wire wpntr_n_4;
  wire [5:5]wr_pntr_plus2;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_dc_as__parameterized0 \gwas.gwdc0.wdc 
       (.Q(Q[5:0]),
        .S({wpntr_n_12,wpntr_n_13,wpntr_n_14,wpntr_n_15}),
        .gate_signal_p_reg(gate_signal_p_reg),
        .gate_signal_p_reg_0(gate_signal_p_reg_0),
        .\gic0.gc1.count_d3_reg[6] ({wpntr_n_2,wpntr_n_3,wpntr_n_4}),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_status_flags_as__parameterized0 \gwas.wsts 
       (.E(E),
        .ENA_I(ENA_I),
        .ENA_dly_D(ENA_dly_D),
        .Q(wr_pntr_plus2),
        .RD_PNTR_WR(RD_PNTR_WR[5]),
        .\grstd1.grst_full.grst_f.rst_d3_reg (\grstd1.grst_full.grst_f.rst_d3_reg ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg (wpntr_n_0),
        .out(out),
        .prmry_in(prmry_in),
        .ram_full_i_reg_0(\gwas.wsts_n_2 ),
        .rdfifo_wren(rdfifo_wren),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_bin_cntr__parameterized0 wpntr
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (Q),
        .E(E),
        .Q(wr_pntr_plus2),
        .RD_PNTR_WR(RD_PNTR_WR),
        .S({wpntr_n_12,wpntr_n_13,wpntr_n_14,wpntr_n_15}),
        .\grstd1.grst_full.grst_f.rst_d3_reg (\grstd1.grst_full.grst_f.rst_d3_reg ),
        .\grstd1.grst_full.grst_f.rst_d3_reg_0 (\gwas.wsts_n_2 ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ),
        .ram_full_i_reg(wpntr_n_0),
        .s_axi_aclk(s_axi_aclk),
        .\wr_data_count_i_reg[6] ({wpntr_n_2,wpntr_n_3,wpntr_n_4}));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_status_flags_as
   (out,
    \gic0.gc1.count_reg[5] ,
    ENA_I,
    E,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ,
    s_axi_aclk,
    ENA_dly_D,
    p_8_in,
    Bus_RNW_reg,
    busip_1,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg );
  output out;
  output \gic0.gc1.count_reg[5] ;
  output ENA_I;
  output [0:0]E;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  input s_axi_aclk;
  input ENA_dly_D;
  input p_8_in;
  input Bus_RNW_reg;
  input busip_1;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ;

  wire Bus_RNW_reg;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly_D;
  wire busip_1;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ;
  wire p_8_in;
  (* DONT_TOUCH *) wire ram_full_fb_i;
  (* DONT_TOUCH *) wire ram_full_i;
  wire s_axi_aclk;

  assign \gic0.gc1.count_reg[5]  = ram_full_fb_i;
  assign out = ram_full_i;
  LUT2 #(
    .INIT(4'hE)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_2 
       (.I0(E),
        .I1(ENA_dly_D),
        .O(ENA_I));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_4 
       (.I0(p_8_in),
        .I1(ram_full_i),
        .I2(Bus_RNW_reg),
        .I3(busip_1),
        .I4(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg ),
        .I5(ram_full_fb_i),
        .O(E));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    ram_full_fb_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ),
        .Q(ram_full_fb_i),
        .R(1'b0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    ram_full_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ),
        .Q(ram_full_i),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "wr_status_flags_as" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_status_flags_as__parameterized0
   (ENA_I,
    E,
    ram_full_i_reg_0,
    prmry_in,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ,
    s_axi_aclk,
    out,
    rdfifo_wren,
    ENA_dly_D,
    \grstd1.grst_full.grst_f.rst_d3_reg ,
    Q,
    RD_PNTR_WR);
  output ENA_I;
  output [0:0]E;
  output ram_full_i_reg_0;
  output prmry_in;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  input s_axi_aclk;
  input out;
  input rdfifo_wren;
  input ENA_dly_D;
  input \grstd1.grst_full.grst_f.rst_d3_reg ;
  input [0:0]Q;
  input [0:0]RD_PNTR_WR;

  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly_D;
  wire [0:0]Q;
  wire [0:0]RD_PNTR_WR;
  wire \grstd1.grst_full.grst_f.rst_d3_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  wire out;
  wire prmry_in;
  (* DONT_TOUCH *) wire ram_full_fb_i;
  (* DONT_TOUCH *) wire ram_full_i;
  wire ram_full_i_reg_0;
  wire rdfifo_wren;
  wire s_axi_aclk;

  LUT5 #(
    .INIT(32'hFFFF0010)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_2__0 
       (.I0(ram_full_i),
        .I1(out),
        .I2(rdfifo_wren),
        .I3(ram_full_fb_i),
        .I4(ENA_dly_D),
        .O(ENA_I));
  LUT4 #(
    .INIT(16'h0004)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_4__0 
       (.I0(ram_full_fb_i),
        .I1(rdfifo_wren),
        .I2(out),
        .I3(ram_full_i),
        .O(E));
  LUT2 #(
    .INIT(4'hE)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to_i_1 
       (.I0(ram_full_i),
        .I1(out),
        .O(prmry_in));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    ram_full_fb_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ),
        .Q(ram_full_fb_i),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000004100)) 
    ram_full_i_i_4__0
       (.I0(\grstd1.grst_full.grst_f.rst_d3_reg ),
        .I1(Q),
        .I2(RD_PNTR_WR),
        .I3(rdfifo_wren),
        .I4(ram_full_fb_i),
        .I5(prmry_in),
        .O(ram_full_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    ram_full_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ),
        .Q(ram_full_i),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
