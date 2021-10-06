`include "HalfAdder_1bit_logicexp.v"
module fa(a,b,cin,s,co);


input a ,b,cin;
output s,co;

Half h1(a,b,t1,t2); //t1 and t2 are intermediate wires
Half h2(t1,cin,s,t3);
or o1(co,t2,t3);

endmodule

