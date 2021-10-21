/***the given code can be used for both ov and nov case of dynamic patter detectors****/
`include"dypat_nonov.v"
module tb;
reg clk, rst, in;
wire out;
integer count;

dypat dut(clk, rst, in, out); //without valid signal

always begin
#5 clk=~clk;
end
initial begin
	clk=0;
	count=0;
	rst=1;
	@(posedge clk);
	rst=0;

	repeat(600) begin
		@(posedge clk);
		in=$random;
		end
		#20 $finish;
end
/* we can count the no. of times the pattern is detected using pos edges of out*/
always @(posedge out) begin
count=count+1;
$display("count=%0d", count);
end

endmodule


