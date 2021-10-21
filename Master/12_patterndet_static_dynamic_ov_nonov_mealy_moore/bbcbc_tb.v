`include"bbcbc.v"
module tb;
reg in, rst, clk;
wire out;

fsm dut(in,rst,clk,out);

always begin
#5 clk=0;
#5 clk=1;
end

initial begin
rst=1'b1;
#15 rst=1'b0;

  repeat (600) begin
  @(posedge clk); //check why only this delay is working and why not others
 in=$random;
end
#50;
$finish;
end
 initial begin
    $dumpfile("1.vcd");
    $dumpvars();
  end
endmodule
