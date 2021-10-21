module mux32three(a,b,c,sel,out);
input [31:0]a,b,c;
input [1:0] s;
output out;

assign out=s[1]?(s[0]?0:i3):(s[0]?i2:i1);


endmodule
