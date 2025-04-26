# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS_A {
m1 { 
	dir I
	width 64
	depth 4096
	mode ap_memory
	offset 32768
	offset_end 65535
}
m2 { 
	dir I
	width 64
	depth 4096
	mode ap_memory
	offset 65536
	offset_end 98303
}
prod { 
	dir IO
	width 64
	depth 4096
	mode ap_memory
	offset 98304
	offset_end 131071
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
}
dict set axilite_register_dict BUS_A $port_BUS_A


