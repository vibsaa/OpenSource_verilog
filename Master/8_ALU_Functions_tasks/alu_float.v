module alu();

real p,q;
reg [50*8:0]op;
real alu_out;
initial begin

 // {p,q}=$random;
  $value$plusargs("p=%f", p);
  $value$plusargs("q=%f", q);
$value$plusargs("op=%s", op);
  alu_out=out(p,q,op);

  $display("a=%0d,b=%0d,out[%0s]=%.2f",p,q,op,alu_out);

end




  function real out(input real a, input real b,input reg [50*8:0]op);
begin 
case(op)
"ADD": out=a+b;


"SUB": out = a-b;


"MUL": out=a*b;


"DIV": out=a/b;
  
"LSHIFTA": out=a*2;
  
"LSHIFTB": out=b*2;

"RSHIFTA": out=a/2;

"RSHIFTB": out=b/2;
  
  
endcase
end 
endfunction


endmodule 
