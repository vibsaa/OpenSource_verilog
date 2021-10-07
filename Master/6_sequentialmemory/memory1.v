module memory (clk, rst, addr, wdata,wrbar, rdata);

parameter WIDTH=32;
parameter DEPTH=256;
parameter ADDR=8;



input clk, rst, wrbar;
input [ADDR-1:0] addr;
input [WIDTH-1:0] wdata;
output reg [WIDTH-1:0] rdata;

reg [WIDTH-1:0] mem [DEPTH-1:0];

always @(posedge clk) begin
if(rst) begin 
	integer i;
	rdata=0;
	for (i=0; i<DEPTH; i=i+1) mem[i]=0;
	end

else begin // we dont need a for loop here because the user will provide the value of address and wrbar value 
if (wrbar) mem[addr]=wdata;
else rdata=mem[addr];
end

end




endmodule
