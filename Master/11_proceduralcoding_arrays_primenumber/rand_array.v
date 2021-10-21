module tb();
integer a[9:0];
integer i;
initial begin
for (i=0; i<10;i=i+1) begin
a[i]=$urandom_range(40,49);
end
for (i=0; i<10;i=i+1) begin
$display("a[%0d]=%0d",i,a[i]);
end
end

endmodule 
