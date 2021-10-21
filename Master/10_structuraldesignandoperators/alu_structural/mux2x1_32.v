module mux32two(a,b,sel,out);
input [31:0]a,b;
input sel;
output out;


assign out=sel?a:b;


endmodule
