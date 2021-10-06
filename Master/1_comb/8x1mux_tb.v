`include "8x1_mux.v"

module tb;

reg [7:0] i;
reg [3:0] s;
wire y;

8x1 m1(i,s,y);

initial begin
repeat(10) begin
i=$random;
s=$random;

#2

$display("i=%b,s=%b, y=%b", i,s,y);

end
$finish;
end
endmodule


