vlog asyncfifo_gray_tb.v

vsim -novopt tb -suppress 12110 +testname=concurrent_rd_wr

add wave -position insertpoint sim:/tb/dut/*

run -all






