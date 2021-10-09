`include"memory2.v"
module tb();
//this is for 1kB with 32 bit data line or width

parameter WIDTH=32;
parameter DEPTH=256;
parameter ADDR=8;


reg clk, rst, wrbar, valid;
reg [ADDR-1:0] addr;
reg [WIDTH-1:0] wdata;
wire [WIDTH-1:0] rdata;
wire ready;
integer i;
reg[30*8:1] testname;  //testcase variable
  
memory #(.WIDTH(WIDTH),.DEPTH(DEPTH), .ADDR(ADDR)) dut(clk, rst, addr, wdata,wrbar, rdata,valid,ready); //PARAMETER OVERRIDING FACILITY


//clock generation

initial begin 
$value$plusargs("testname=%s",testname);
clk=0;
forever #5 clk=~clk;
end

//stimulus or testcases

initial begin
rst=1;
#20;
rst=0;

case(testname)
"fd_wr_fd_rd": begin
fd_wr_mem(0, DEPTH/8);
fd_rd_mem(0, DEPTH/8);

end

"fd_wr_bd_rd": begin // here i have taken it full just to see how memory contnts will look in a text file
fd_wr_mem(0, DEPTH);
bd_rd_mem(0, DEPTH);

end
"bd_wr_fd_rd": begin
bd_wr_mem(0, DEPTH/2);
fd_rd_mem(0, DEPTH/2);

end
"bd_wr_bd_rd": begin
bd_wr_mem(0, DEPTH);  // complete DEPTH is taken here because this method is fast 
bd_rd_mem(0, DEPTH);

end
  
  endcase

#100 $finish;
end


// task to write to memory at some specific locations starting from start_addr and till number of locations = num_loc
  task fd_wr_mem(input [ADDR-1:0]start_loc, [ADDR:0]num_loc);
begin
//wrbar=1;
for (i=start_loc;i<start_loc+num_loc;i=i+1) begin
@(posedge clk);
addr=i;
wdata=$random;
wrbar=1;
valid=1;
wait(ready==1);
end

//@(posedge clk);
wrbar=0;
valid=0;
addr=0;
wdata=0;
end
endtask

// task to read memory at some specific locations starting from start_addr and till number of locations = num_loc

  task fd_rd_mem(input [ADDR-1:0]start_loc, [ADDR:0]num_loc);
begin
//wrbar=1;
for (i=start_loc;i<start_loc+num_loc;i=i+1) begin
@(posedge clk);
addr=i;
wrbar=0;
valid=1;
wait(ready==1);
end

//@(posedge clk);
wrbar=0; //check that it shud be toggled or not
valid=0;
addr=0;
wdata=0;
end
endtask

task bd_wr_mem(input [ADDR-1:0]start_loc, [ADDR:0]num_loc);
begin
$readmemh("image.hex",dut.mem,start_loc, start_loc+num_loc-1 );
end
endtask

task bd_rd_mem(input [ADDR-1:0]start_loc, [ADDR:0]num_loc);
begin
$writememb("image.bin",dut.mem,start_loc, start_loc+num_loc-1 );
end
endtask

initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  
end

endmodule

