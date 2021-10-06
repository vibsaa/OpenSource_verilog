//`include "4x1mux_eqn.v"
`include "4x1mux_behav.v"
module tb;


	reg [3:0] in;
	reg [1:0]sel;
	wire out;

mux dut(in, sel, out);

initial begin
repeat(10) begin
{in,sel}=$random;
#5;//this delay is very important

$display("in=%b,sel=%b,out=%b", in, sel, out);
end
$finish;
end


endmodule
