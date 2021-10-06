module enc(en,i,y);

input [3:0]i;
input en;
output reg [1:0]y;

always @(*) begin
if (en==0) y=2'bz;
else begin
case(i)
4'b0001: y=0;

4'b0010: y=1;
4'b0100: y=2;
4'b1000: y=3;
endcase
end
end
endmodule
