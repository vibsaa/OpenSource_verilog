vlog clock.v

vsim -novopt tb -suppress 12110 +freq=25 +dc=25 +jit=7 +simu_time=300

add wave -position insertpoint sim:/tb/*

run -all

