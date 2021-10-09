module tb;
  parameter WIDTH=3;
  reg [WIDTH-1:0]a ,b;
  
  initial begin 
  //a=4'b0101;
  //b=4'b1010;
   // $value$plusargs("WIDTH=%d",x);
   // defparam WIDTH=x;
    $value$plusargs("a=%b",a);
    $value$plusargs("b=%b",b);
 
    if(a>b) $display("a is greater then b");
    
    else if(b>a) $display("a is less then b");
     
    else $display("a is equal to b");
       end
endmodule 


