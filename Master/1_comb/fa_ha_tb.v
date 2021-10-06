`include "FA_using_HA.v"
module tb;

reg a ,b,cin;
wire s,co;
fa dut (a,b,cin,s,co);

initial begin
repeat(10) begin
{a,b,cin}=$random;

#1

$display("a=%b,b=%b,cin=%b,s=%b,co=%b", a,b,cin,s,co);

end

$finish;
end
endmodule

