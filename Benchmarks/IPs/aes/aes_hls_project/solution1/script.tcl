############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project aes_hls_project
set_top aes256_encrypt_ecb
add_files aes/aes.c
add_files aes/check.data
add_files aes/input.data
add_files ../common/support.c
add_files -tb ../common/harness.c
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
config_export -display_name aes_ip_bench -format ip_catalog -output C:/Users/ekarabu/Desktop/Aydin_amro/DMA_Prefetch_Sch/HLS_IPs/aes/aes_hls_project/rtl/aes256_encrypt_ecb.zip -rtl verilog -vendor ekarabu
set_clock_uncertainty 1.0
source "./aes_hls_project/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -vendor "ekarabu" -display_name "aes_ip_bench" -output C:/Users/ekarabu/Desktop/Aydin_amro/DMA_Prefetch_Sch/HLS_IPs/aes/aes_hls_project/rtl/aes256_encrypt_ecb.zip
