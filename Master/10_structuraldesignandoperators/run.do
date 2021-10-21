vlog operators.v

vsim -novopt tb -suppress 12110 +a=1001 +b=0110 +operation=equality

add wave -position insertpoint sim:/tb/*

run -all






