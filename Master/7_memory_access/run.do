vlog memory2_tb2.v

vsim -novopt tb -suppress 12110 +testname=fd_wr_bd_rd

add wave -position insertpoint sim:/tb/*

run -all

