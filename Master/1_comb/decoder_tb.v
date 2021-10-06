`include "4x1decoder.v"
module tb;


reg [1:0] i;
reg en;
wire [3:0] y;

decoder dut(i,en,y);

initial begin
en=0;
#10
en=1;
#1 i=0;
#1 i=1;
#1 i=2;
#1 i=1;
#1 i=3;
end
initial begin 
$monitor("i=%b,en=%b,y=%b",i,en,y);
end
endmodule
