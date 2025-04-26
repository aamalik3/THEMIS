# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS_A {
biases3 { 
	dir IO
	width 64
	depth 3
	mode ap_memory
	offset 32
	offset_end 63
}
biases1 { 
	dir IO
	width 64
	depth 64
	mode ap_memory
	offset 512
	offset_end 1023
}
biases2 { 
	dir IO
	width 64
	depth 64
	mode ap_memory
	offset 1024
	offset_end 1535
}
weights3 { 
	dir IO
	width 64
	depth 192
	mode ap_memory
	offset 2048
	offset_end 4095
}
training_targets { 
	dir I
	width 64
	depth 489
	mode ap_memory
	offset 4096
	offset_end 8191
}
weights1 { 
	dir IO
	width 64
	depth 832
	mode ap_memory
	offset 8192
	offset_end 16383
}
weights2 { 
	dir IO
	width 64
	depth 4096
	mode ap_memory
	offset 32768
	offset_end 65535
}
training_data { 
	dir I
	width 64
	depth 2119
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


