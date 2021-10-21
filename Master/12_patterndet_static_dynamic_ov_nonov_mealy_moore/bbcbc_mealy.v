/* bbcbc-mealy overlapping and non overlapping is same for this case*/
 
module fsm(in,rst,clk,out);
input in, rst, clk;
output reg out;
integer count;
reg [2:0]ps, ns;

parameter reset=0, b=1,bb=2,bbc=3,bbcb=4;

always @(posedge clk or posedge rst)
	begin
		if (rst)
			ps<=reset;
		else 
			ps<=ns;

	end
//0=b,1=c
initial begin
count=0;
end
always @(ps or in)
	begin
		case (ps)
			reset: begin
				ns=in?reset:b;
				out=in?0:0;
			end
			b: begin
				ns=in?reset:bb;
				out=in?0:0;
			end

			bb: begin
				ns=in?bbc:bb;
				out=in?0:0;
				
			end
			bbc: begin
				ns=in?reset:bbcb;
				out=in?0:0;
				
			end
			bbcb: begin
				ns=in?reset:bb;
				out=in?1:0;
				if (out==1) count=count+1;
			end
			
		endcase
	end

initial begin

	$monitor("count=%0d",count);
end
endmodule
