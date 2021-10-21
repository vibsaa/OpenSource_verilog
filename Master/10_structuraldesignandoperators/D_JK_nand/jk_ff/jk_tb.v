// Code your testbench here
// or browse Examples
`include "jkff.v"
module tb;
reg j,k,clk;
wire q,qbar;

jk dut (j,k,clk,q,qbar);
  
initial begin
 clk=0;
 forever #5 clk=~clk;
end
  
initial begin
 j=1'b0; 
 k=1'b0;
 force q = 1'b1;
 #1 release q;
end 
  
initial begin
 @(posedge clk);
  j=0; k=0;
  #10;
  j=0; k=1;
   #20;
  j=1; k=0;
   #30;
  j=1; k=1;
   #40;  
  
  $finish;

end
  
initial begin
  $monitor("time=%0d--->clk=%b,j=%b,k=%b______q=%b,qbar=%b",$time,clk,j,k,q,qbar);
 end
endmodule
