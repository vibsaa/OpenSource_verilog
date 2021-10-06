module dff(clk, rst,d, q);
input clk, d,rst;
output reg q;


always @(posedge clk) begin //synchronous reset


if (rst==1) q<=0;
else q<=d;

end
endmodule
