module top(a,b,f,r);
input [31:0] a,b;
input [2:0]f;
output [31:0]r;
wire [5:1]t;
mux32two m1(b,32'd1, f[0],t[1]);
mux32two m2(b,32'd1, f[0],t[2]);
add32 a1(a,t[1],t[3]);
sub32 s1(a,t[2],t[4]);
mul16 mu1(a,b,t[5]);
mux32three m2(t[3],t[4], t[5],f[2:1],r[31:0]);


endmodule 
