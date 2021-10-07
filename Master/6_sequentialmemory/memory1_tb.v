
module tb();

parameter WIDTH=32;
parameter DEPTH=256;
parameter ADDR=8;


reg clk, rst, wrbar;
reg [ADDR-1:0] addr;
reg [WIDTH-1:0] wdata;
wire [WIDTH-1:0] rdata;
integer i;
memory dut(clk, rst, addr, wdata,wrbar, rdata);


//clock generation

initial begin 
clk=0;
forever #5 clk=~clk;
end

initial begin
rst=1;
#20;
rst=0;
wrbar=1;

for (i=0;i<DEPTH;i=i+1) begin
  @(posedge clk);
addr=i;
wdata=$random;
wrbar=1;
end
addr=0;
wdata=0;
wrbar=0;

for (i=0;i<DEPTH;i=i+1) begin
@(posedge clk)
addr=i;
wrbar=0;
end
addr=0;
wrbar=1;
#220 $finish;
end
initial begin
  $dumpvars;
  $dumpfile("dump.vcd");
  
end
endmodule
