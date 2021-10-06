module fa_1(a,b,ci,s,co);
input a,b,ci;
output s,co;

assign {co,s}=a+b+ci;

endmodule

//hierarchical style or structural modelling using genvar

module fa_4(A,B,Cin,S,Co);
input [3:0] A,B;
input Cin;
output [3:0] S;
output Co;


wire[4:0] c;
  assign c[0]=Cin;
assign Co=c[4];
genvar i;
  for(i=0;i<4;i=i+1) begin
fa_1 a0(A[i], B[i], c[i], S[i], c[i+1] );
  end
  
endmodule

