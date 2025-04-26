-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Fri Sep  2 14:58:46 2022
-- Host        : diomedes running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/aamalik3/Desktop/GitHub/Scheduling-PR/Custom_IP/custom_IP/custom_IP.srcs/sources_1/ip/backprop_ap_dsub_3_full_dsp_64_1/backprop_ap_dsub_3_full_dsp_64_stub.vhdl
-- Design      : backprop_ap_dsub_3_full_dsp_64
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity backprop_ap_dsub_3_full_dsp_64 is
  Port ( 
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );

end backprop_ap_dsub_3_full_dsp_64;

architecture stub of backprop_ap_dsub_3_full_dsp_64 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,aclken,s_axis_a_tvalid,s_axis_a_tdata[63:0],s_axis_b_tvalid,s_axis_b_tdata[63:0],m_axis_result_tvalid,m_axis_result_tdata[63:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "floating_point_v7_1_5,Vivado 2017.4";
begin
end;
