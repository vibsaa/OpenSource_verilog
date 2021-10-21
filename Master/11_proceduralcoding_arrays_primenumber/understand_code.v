module tb_gatedelay;
  reg a,b;
  wire o1,o2,o3,o4;
  
  and #(5) a1(o1,a,b); //these values in the brackets are rise and fall delays, to provide max and min delay use(max:min)
  or #(5,6) o(o2,a,b);
  nand #(3,4) n(o3,a,b);
  buf #(4,5) b1(o4,a);
  
  initial begin
    {a,b}={1'b0,1'b0};
    //repeat(5) begin
    #5 {a,b}={1'b0,1'b1};  //  at 5 ns a=0, b=1
    #5 {a,b}={1'b1,1'b0};  //  at 10 ns a=1, b=0
    #5 {a,b}={1'b0,1'b1};  //  at 15 ns a=0, b=1
    #5 {a,b}={1'b1,1'b0};  //  at 20 ns a=1, b=0
    $monitor("simtime=%0t, a=%0d, b=%0d, o1=%0d, o2=%0d, o3=%0d, o4=%0d",$time,a,b,o1,o2,o3,o4);
    //end
  end
  
  initial begin
    //#100; $finish;
    $dumpfile("1.vcd");
    $dumpvars;
  end
endmodule

