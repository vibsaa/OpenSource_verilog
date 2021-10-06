module tb;


reg [3:0] A,B;
reg Cin;
wire [3:0] S;
wire Co;

fa_4 dut(A,B,Cin,S,Co);

initial begin
repeat(10) begin
  #1;
  {A,B,Cin}=$random;

end
end

  initial begin
    $monitor("A=%b,B=%b,Cin=%b,S=%b,Co=%b",A,B,Cin,S,Co);
  end
endmodule
