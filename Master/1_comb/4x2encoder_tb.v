`include"design.sv"
module tb;


reg [3:0]i;
reg en;
wire [1:0]y;

prioren p1(i,en, y);

initial begin
en=0;
#10
en=1;


repeat(10) begin
  #1 {i,en}=$random;
end
$finish;
end


initial begin
$monitor("i=%b,en=%b, y=%b",i,en,y);
end
endmodule
