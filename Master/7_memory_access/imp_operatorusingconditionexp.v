module tb;
  parameter WIDTH=3;
  reg [WIDTH-1:0]a ,b;
  reg [50*8:0]out;
  initial begin 
  //a=4'b0101;
  //b=4'b1010;
   // $value$plusargs("WIDTH=%d",x);
   // defparam WIDTH=x;
    
    
    $value$plusargs("a=%b",a);
    $value$plusargs("b=%b",b);
    out= (a==b)?("a is equal to b"):(a>b)?("a is greater then b"):("a is less then b");
    $display("out=%0s",out);
       end
endmodule 
