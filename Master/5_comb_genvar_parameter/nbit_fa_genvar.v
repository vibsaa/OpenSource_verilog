module fa_1(a,b,ci,s,co);
input a,b,ci;
output s,co;

assign {co,s}=a+b+ci;

endmodule

//hierarchical style or structural modelling using genvar

module fa_4(A,B,Cin,S,Co);
parameter WIDTH=4;
input [WIDTH-1:0] A,B;
input Cin;
output [WIDTH-1:0] S;
output Co;


wire[WIDTH:0] c;
assign c[0]=Cin;
assign Co=c[WIDTH];
genvar i;
for(i=0;i<WIDTH;i=i+1)

fa_1 a0(A[i], B[i], c[i], S[i], c[i+1] );

endmodule


