# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS_A {
rowDelimiters { 
	dir I
	width 32
	depth 495
	mode ap_memory
	offset 2048
	offset_end 4095
}
vec { 
	dir I
	width 64
	depth 494
	mode ap_memory
	offset 4096
	offset_end 8191
}
cols { 
	dir I
	width 32
	depth 1666
	mode ap_memory
	offset 8192
	offset_end 16383
}
val_r { 
	dir I
	width 64
	depth 1666
	mode ap_memory
	offset 16384
	offset_end 32767
}
out_r { 
	dir O
	width 64
	depth 494
	mode ap_memory
	offset 32768
	offset_end 36863
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
}
dict set axilite_register_dict BUS_A $port_BUS_A


