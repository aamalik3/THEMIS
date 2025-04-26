onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib backprop_ap_dsub_3_full_dsp_64_opt

do {wave.do}

view wave
view structure
view signals

do {backprop_ap_dsub_3_full_dsp_64.udo}

run -all

quit -force
