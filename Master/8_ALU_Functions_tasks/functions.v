module tb();

integer a,b;

initial begin
$value$plusargs("a=%i", a);
$value$plusargs("b=%i", b);

sum=add(a,b);
end
















function integer add(input a, input b)
begin
add=a+b;
end









endmodule
