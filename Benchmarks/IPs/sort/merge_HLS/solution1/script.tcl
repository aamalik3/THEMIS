############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project merge_HLS
set_top ms_mergesort
add_files check.data
add_files input.data
add_files sort.c
add_files -tb harness.c -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -output C:/Users/aamalik3/Desktop/merge_sort/hdl_ip/ms_mergesort.zip -rtl verilog
set_clock_uncertainty 0.1
source "./merge_HLS/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -flow syn -rtl verilog -format ip_catalog -output C:/Users/aamalik3/Desktop/merge_sort/hdl_ip/ms_mergesort.zip
