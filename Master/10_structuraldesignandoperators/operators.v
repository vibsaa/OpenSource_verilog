module tb();
reg [50*8:0] op;
reg [3:0]a,b;
reg [7:0]out;
reg [50*8:0]out_exp;


initial begin
$value$plusargs("operation=%s",op);
$value$plusargs("a=%b",a);
$value$plusargs("b=%b",b);
out=7'b0000000;
out_exp=("default");
case(op) 
"arithmetic": begin
/* alternatively you can go like "arithmetic":begin
        $display("a+b=%0d",a+b);
        $display("a-b=%0d",a-b);
        $display("a*b=%0d",a*b);
        $display("a/b=%0d",a/b);
      end */ 
//****************or***********************//
/* combime all those display expressions in single statement*/
// above methods are good and you shudhave used it//
out=a+b;
out_exp=("the sum is evaluated");
end
"relational": begin
out_exp=(a>b)?("a greater than b"):(a<b)?("a less than b"):("a is equal to b");
end
"equality": begin
out_exp=(a==b)?(" a is equal to b"):(a===b)?("a is case equal to b"):("a is neither equal, nor case equal to b");
end
"conditional": begin
out=(a>b)?1:0;
out_exp=("out is 1 if a>b ");
end
"bitwise_and": begin
out=a&b;
out_exp=("bitwise and is performed");
end
"logical_or": begin
out=a||b;
out_exp=("logical or is performed");

end
"replicate_a_2_times": out={2{a}};
"concatenate": begin
out={a,b};
out_exp=("out={a,b}");
end
"lshift": begin out=(a<<2);
out_exp=("(a<<2)");
end
"rshift":begin out=(a>>2);
out_exp=("(a>>2)");
end
"reduction_xor": begin out=^a;
out_exp=("^a");
end
endcase

end

initial begin

$display("out=%0b___out_exp=%0s", out, out_exp);
end
endmodule
