module jk(j,k,q,clk);
input j,k,clk;
output q;

wire [6:1]t;
wire qbar, clkbar;
// assign qbar=~q;
assign clkbar=~clk;
nand n1(q,qbar,t[1]);
nand n2(qbar,q,t[2]);
nand n3(t[2],clk,t[3]);
nand n4(t[1],clk,t[4]);
nand n5(t[4],t[3],t[5]);
nand n6(t[3],t[4],t[6]);
nand n7(t[6],k,q,clkbar);
nand n8(t[5],j,qbar,clkbar);

endmodule 
