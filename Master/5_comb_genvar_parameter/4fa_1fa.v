// Code your design here
module fa_1(a,b,ci,s,co);
input a,b,ci;
output s,co;

assign {co,s}=a+b+ci;

endmodule


module fa_4(A,B,Cin,S,Co);
input [3:0] A,B;
input Cin;
output [3:0] S;
  output Co;

wire[2:0] c;

fa_1 a0(A[0], B[0], Cin, S[0], c[0] );
fa_1 a1(A[1], B[1], c[0], S[1], c[1] );

fa_1 a2(A[2], B[2], c[1], S[2], c[2] );
fa_1 a3(A[3], B[3], c[2], S[3], Co );

endmodule
