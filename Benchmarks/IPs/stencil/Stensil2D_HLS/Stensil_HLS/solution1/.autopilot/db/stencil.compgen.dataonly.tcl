# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS_A {
filter { 
	dir I
	width 32
	depth 9
	mode ap_memory
	offset 64
	offset_end 127
}
orig { 
	dir I
	width 32
	depth 8192
	mode ap_memory
	offset 32768
	offset_end 65535
}
sol { 
	dir O
	width 32
	depth 8192
	mode ap_memory
	offset 65536
	offset_end 98303
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
}
dict set axilite_register_dict BUS_A $port_BUS_A


