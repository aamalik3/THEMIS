onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+backprop_ap_dsub_3_full_dsp_64 -L xbip_utils_v3_0_8 -L axi_utils_v2_0_4 -L xbip_pipe_v3_0_4 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_4 -L xbip_dsp48_multadd_v3_0_4 -L xbip_bram18k_v3_0_4 -L mult_gen_v12_0_13 -L floating_point_v7_1_5 -L xil_defaultlib -L secureip -O5 xil_defaultlib.backprop_ap_dsub_3_full_dsp_64

do {wave.do}

view wave
view structure

do {backprop_ap_dsub_3_full_dsp_64.udo}

run -all

endsim

quit -force
