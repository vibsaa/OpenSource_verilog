/* the code is for dynamic pattern-overlapping case*/

module dypat(clk, rst, in, out); //without valid signal
input clk, rst, in;
output reg out;
parameter size=5;
reg [size-1:0] pat, cur_pat;

//ov variation 

initial begin
/*$value$plusargs("size=%d",size);
#3;
$value$plusargs("pat=%b",pat);*/
pat=5'b11011;
out=0;
end

always @(posedge clk) begin
	if (rst) begin
		out=0;
		end

	else begin
		cur_pat={cur_pat[size-2:0],in};
		if (cur_pat==pat) begin
			out=1;

		end
		else begin
			out=0;
		end
	end
end
endmodule 
