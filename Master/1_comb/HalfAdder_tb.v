`include "HalfAdder.v"
module tb;

reg [7:0]a ,b;
wire [7:0]s;
wire [7:0] co;

//instantiation 

Half dut(a,b,s,co);

initial begin
	repeat(10) begin
	{a,b}=$random;
	#1;
	$display("a=%b,b=%b,s=%b,co=%b",a,b,s,co);
	end
	$finish;

	end
endmodule



