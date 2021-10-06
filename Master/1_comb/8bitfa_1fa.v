`include"priorityen.v"
module tb;


reg [3:0]i;
reg en;
wire [1:0]y;

prioren p1(i,en, y);

initial begin
en=0
#10
en=1
/*
#5 i=4'b0101;
#5 i=4'b1101;
#5 i=4'b0110;
#5 i=4'b0001;
#5 i=4'b1100;
#5 i=4'b1010; */

//we dont need to give input in above manner instead we can use $random

repeat(10) begin
#1 i=$random;
end
$finish;
end

//we are using $monitor therefore we are defining it into a separate initial block.
// if we use $display we have to write the line in repeat block
initial begin
$monitor("i=%b,en=%b, y=%b",i,en,y);
end
