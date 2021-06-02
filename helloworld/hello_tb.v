`timescale 1ns / 1ns
`include "hello.v"

module hello_tb;
reg a;
wire b;

hello uut(a,b);

initial begin

$dumpfile("hello_tb.vcd");
$dumpvars(0, hello_tb);

a=0;
#20;
a=1;
#20;
a=0;
#20;

$display("test complete");



end
endmodule
