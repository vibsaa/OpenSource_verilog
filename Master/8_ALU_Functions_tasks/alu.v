module alu();

reg [7:0]p,q;
reg [50*8:0]op;
reg [31:0] alu_out;
initial begin

 // {p,q}=$random;
  $value$plusargs("p=%0d", p);
  $value$plusargs("q=%0d", q);
$value$plusargs("op=%s", op);
  alu_out=out(p,q,op);

  $display("a=%0d,b=%0d,out[%0s]=%0d",p,q,op,alu_out);

end




  function reg [31:0]out(input reg [7:0]a, input reg [7:0]b,input reg [50*8:0]op);
begin 
case(op)
"ADD": out=a+b;


"SUB": out = a-b;


"MUL": out=a*b;


"DIV": out=a/b; // will only show the integer part
  
"LSHIFTA": out=a*2;
  
"LSHIFTB": out=b*2;

"RSHIFTA": out=a/2;

"RSHIFTB": out=b/2;
  
  
endcase
end 
endfunction


endmodule 
