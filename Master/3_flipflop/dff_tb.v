module tb;

reg clk, d, rst;
wire q;

dff dut(clk,rst,d,q);

initial begin
clk=0;
forever #5 clk=~clk;
end


initial begin
rst=1;
@(posedge clk)
rst=0;
#2;
repeat (10) begin
d=$random;
  #2;
end
$finish;
end


initial begin

  $monitor("d=%b, rst=%b, clk=%b, q=%b", d,rst,clk,q);

end
initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
end  
endmodule
