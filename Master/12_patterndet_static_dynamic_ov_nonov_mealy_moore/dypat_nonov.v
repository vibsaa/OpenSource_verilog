/* the code is for dynamic pattern-non-overlapping case*/

module dypat(clk, rst, in, out); //without valid signal
input clk, rst, in;
output reg out;
parameter size=5;
reg [size-1:0] pat, cur_pat;
integer num_bit;
//non-ov variation 

initial begin
/*$value$plusargs("size=%d",size);
#3;
$value$plusargs("pat=%b",pat);*/
pat=5'b11011;
out=0;
num_bit=0;
end

always @(posedge clk) begin
	if (rst) begin
		out=0;
		num_bit=0;
		end

	else begin
		cur_pat={cur_pat[size-2:0],in};
		num_bit=num_bit+1;
		if (num_bit==size) begin	
			if (cur_pat==pat) begin
				out=1;
				/*cur_pat=5'b00000;****writing like this isn't the best way to implement the non ov concept*****/
				num_bit=0; //this is how we implement non-ov concept
			end
			else begin
				out=0;
				num_bit=num_bit-1;
			end
		end

	end
end
endmodule 
