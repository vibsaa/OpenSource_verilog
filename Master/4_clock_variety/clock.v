`timescale 1ns/1ps
module tb;

reg clk;
real freq, tp, dc, jit, jit_value,tp_jit;
real prev_edge_time,curr_edge_time,calc_freq;
real simu_time;
always begin

jit_value=$urandom_range(100-jit,100+jit)/100.0;
tp_jit=tp*jit_value;
clk=0; #(((100-dc)/100)*tp_jit);
clk=1; #((dc/100)*tp_jit);

end

initial begin
$value$plusargs("freq=%f", freq);
tp=1000/freq;
$value$plusargs("jit=%f", jit);
$value$plusargs("dc=%f", dc);
$value$plusargs("simu_time=%f", simu_time);



#(simu_time) $finish;
end
always @(negedge clk) begin //negedge because in my clock 0 is coming first then 1 is coming
prev_edge_time=curr_edge_time;
curr_edge_time=$realtime;
calc_freq=1000/(curr_edge_time-prev_edge_time);

$display("calc_freq=%f", calc_freq);
end
endmodule
