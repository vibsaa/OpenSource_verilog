`include "jkff.v"
module tb;
reg j,k,clk;
wire q;
jk dut(j,k,q,clk);

always begin
#5 clk=~clk;
end

initial begin
clk=0;
repeat(20) begin
#7 {j,k}=$random;
end
#120 $finish;
end

endmodule
