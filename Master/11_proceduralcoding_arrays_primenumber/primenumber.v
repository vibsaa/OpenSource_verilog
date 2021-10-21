module tb();
integer i,j;
integer num,count;
reg flag;

initial begin //1
$value$plusargs("num=%d",num);
count=0;
for (i=2;i<num;i=i+1) begin //2
flag=1;
for(j=2;j<i;j=j+1) begin  //3
if(i%j==0) begin //4
flag=0;
j=i; //ensure that the current loop terminates after this
end //3
end //2
if (flag==1) begin //3
$display("prime number=%0d",i);
count=count+1;
end //2
end //1
$display("count=%0d",count);
end //0

endmodule
