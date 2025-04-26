# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS_A {
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
ap_return { 
	dir o
	width 32
	depth 1
	mode ap_ctrl_hs
	offset 16
	offset_end 0
}
obs { 
	dir I
	width 8
	depth 140
	mode ap_memory
	offset 256
	offset_end 511
}
init { 
	dir I
	width 64
	depth 64
	mode ap_memory
	offset 512
	offset_end 1023
}
path { 
	dir O
	width 8
	depth 140
	mode ap_memory
	offset 1024
	offset_end 1279
}
transition { 
	dir I
	width 64
	depth 4096
	mode ap_memory
	offset 32768
	offset_end 65535
}
emission { 
	dir I
	width 64
	depth 4096
	mode ap_memory
	offset 65536
	offset_end 98303
}
}
dict set axilite_register_dict BUS_A $port_BUS_A


