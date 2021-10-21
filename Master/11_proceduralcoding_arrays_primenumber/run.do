vlog rand_array_norep.v

vsim -novopt tb -suppress 12110

add wave -position insertpoint sim:/tb/*

run -all



