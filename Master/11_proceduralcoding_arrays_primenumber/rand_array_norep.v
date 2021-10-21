module tb();
integer a[9:0];
integer i,j,flag, num;
initial begin
for (i=0; i<10; ) begin //writing i=i+1 here only will have a drawback that the current iteration will be skipped and 'x' is assigned to array value a[i] if the element exists already so we increment it only when any value is assigned to the array element otherwise it will keep generating different random values
flag=0;
num=$urandom_range(40,49);
for (j=0;j<i;j=j+1) begin
if (a[j]==num) begin
flag=1;
j=i;
end
end
if (flag==0) begin
a[i]=num;
i=i+1;
end
end
for (i=0; i<10;i=i+1) begin
$display("a[%0d]=%0d",i,a[i]);
end
end

endmodule 
