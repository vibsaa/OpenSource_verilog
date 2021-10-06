
module Half (a,b,s,co);

input a ,b;
output s;
output co;

xor x1(s,a,b);
and a1(co,a,b);

endmodule
