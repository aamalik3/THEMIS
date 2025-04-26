############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project viterbi_HLS
set_top viterbi
add_files CCode/check.data
add_files CCode/input.data
add_files CCode/viterbi.c
add_files -tb CCode/harness.c
open_solution "viterbi_hls" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.1
#source "./viterbi_HLS/viterbi_hls/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -flow syn -rtl verilog -format ip_catalog -output C:/Users/aamalik3/Desktop/IPs/viterbi/IP/viterbi.zip
