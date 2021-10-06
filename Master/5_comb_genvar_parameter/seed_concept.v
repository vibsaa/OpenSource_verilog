module tb;

integer a, seed;


initial begin
$value$plusargs("seed=%d", seed);
repeat(10) begins
a=$random(seed);
$display("random value=%d",a);
end
end

endmodule
