// Code your design here
module jk(j,k,clk,q,qbar);
input j,k,clk;
output q,qbar;

 
nand(w1,j,clk,qbar);
nand(w2,k,clk,q);
nand(q,w1,qbar);
nand(qbar,w2,q);

endmodule

