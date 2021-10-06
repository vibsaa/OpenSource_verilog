 module arrays;


integer A[9:0];
integer B[9:0];
integer C[9:0];
integer i;
initial begin
for (i=0; i<=9; i=i+1) begin
A[i]=$urandom_range(40,50);
end

for (i=0;i<=9;i=i+1) begin
$display("A[%0d]=%0d",i, A[i]);
end

for (i=0; i<=9; i=i+1) begin
B[i]=A[i];
end
for (i=0;i<=9;i=i+1) begin
$display("B[%0d]=%0d",i, B[i]);
end


for (i=0; i<=9; i=i+1) begin
if (A[i]==B[i]) $display("comparison passed");
else  $display("comparison failed"); 
end

for (i=0; i<=9; i=i+1) begin
C[i]=$urandom_range(35,45);
end
for (i=0;i<=9;i=i+1) begin
$display("C[%0d]=%0d",i, C[i]);
end

for (i=0; i<=9; i=i+1) begin
if (A[i]==C[i]) $display("comparison passed");
else  $display("comparison failed"); 
end

end
endmodule
