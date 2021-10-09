vlog memory2_tb2.v

vsim -novopt tb -suppress 12110 +testname=fd_wr_rd_by4

add wave -position insertpoint sim:/tb/*

run -all

