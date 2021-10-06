//behavioural modelling
module mux(in, sel, out);
	input [3:0] in;
	input [1:0]sel;
	output reg out;

	always @(*) begin
		case(sel)
			0: out=in[0];
			1: out=in[1];
			2: out=in[2];
			3: out=in[3];
        endcase

	end
	endmodule
