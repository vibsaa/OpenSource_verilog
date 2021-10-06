module prioren(i, en,y);

input [3:0]i;
input en;
output reg [1:0]y;

always @(*) begin
if (en==0) y=2'bz; //active low enable
else
casex(i) 
4'b0001: y=0;
4'b001x: y=1;
4'b01xx: y=2;
4'b1xxx: y=3;
endcase
end 
endmodule
