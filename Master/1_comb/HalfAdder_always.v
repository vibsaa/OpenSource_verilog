
module Half (a,b,s,co);

input [7:0]a ,b;
output reg [7:0]s;
output reg [7:0] co; //we want carry for each bit sum 

always @(*)
begin
s=a^b;
co=a&b;
end

endmodule
