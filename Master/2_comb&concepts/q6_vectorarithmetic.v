module test();
  
  reg [3:-5] a;
  reg [7:0]b;
 initial begin 
   #1 a=9'b1_0010_0110;
   #2 b=a;
  $display("a=%b,b=%b",a, b);
 end
   endmodule 
   
