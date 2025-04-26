onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib DAcc_opt

do {wave.do}

view wave
view structure
view signals

do {DAcc.udo}

run -all

quit -force
