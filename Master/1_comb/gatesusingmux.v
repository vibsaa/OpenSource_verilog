module gates(in, out);
input [1:0] in;
output [6:0] out;


mux notm(1,0,in[0],out[0]);
mux andm(0,in[1],in[0],out[1]);
mux orm(in[1],1,in[0],out[2]);
mux nandm(1,~in[1],in[0],out[3]);
mux norm(~in[1],0,in[0],out[4]);
mux xorm(in[1],~in[1],in[0],out[5]);
mux exnorm(~in[1],in[1],in[0],out[1]);
endmodule





module mux(i0,i1, s,y);
input i0,i1;
input s;
output y;

assign y=s?i1:i0;
endmodule
