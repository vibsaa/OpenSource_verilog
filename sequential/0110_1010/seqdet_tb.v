`timescale 1ns / 1ns
`include "seqdet.v"

module seqdet_tb;
reg clk, x, rst;
wire z;

seqdet s1(x,rst, clk, z);

initial begin
    $dumpfile("sequence.vcd");
    $dumpvars(0, seqdet_tb);
    rst=1'b1; clk=1'b0;
    #15 rst=1'b0;


end

always #5 clk=~clk;

initial begin
    #12 x=0; #10 x=1; #10 x=1; #10 x=0; #10 x=1; #10 x=0; #10 x=1; #10 x=1; #10 x=0; #10 x=1; #10 x=0; #10 x=1; #10 x=0;
    #10 $finish;
end

endmodule