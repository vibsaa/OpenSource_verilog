`include"gatesusingmux.v"
module tb;


reg [1:0] in;
wire [6:0] out;

gates dut(in,out);

initial begin
repeat(10) begin
in=$random;
end
$finish;
end

initial begin
$monitor("in=%b, out=%b", in, out);
end
endmodule
