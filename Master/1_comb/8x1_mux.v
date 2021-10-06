module 8x1(i,s,y);
input [7:0] i;
input [3:0] s;
output y;

assign y=i[s];

endmodule


