module tb;
  integer a,b;
  reg[30*8:0]operation;
  initial begin
    $value$plusargs("a=%d",a);
    $value$plusargs("b=%d",b);
    $value$plusargs("operation=%s",operation);
    case(operation)
      "arithmetic":begin
        $display("a+b=%0d",a+b);
        $display("a-b=%0d",a-b);
        $display("a*b=%0d",a*b);
        $display("a/b=%0d",a/b);
      end
      "relational":begin
        $display("a<b=%0b",a<b);
        $display("a>b=%0b",a>b);
        $display("a<=b=%0b",a<=b);
        $display("a>=b=%0b",a>=b);
      end
      "equality":begin
        $display("a==b=%b",a==b); //logical equality
        $display("a!=b=%b",a!=b); //logical inequality
        $display("a===b=%b",a===b); //case equality
        $display("a!==b=%b",a!==b); //case inequality
      end
      "logical":begin
        $display("a&&b=%0b",a&&b);
        $display("a||b=%0b",a||b);
        $display("!b=%0b",!b);
      end
      "bitwise":begin
        $display("a&b=%0b",a&b);
        $display("a|b=%0b",a|b);
        $display("a^b=%0b",a^b);
        $display("a~^b=%0b",a~^b);
         end
      "reduction":begin
        $display("&a=%0b",&a);
        $display("|a=%0b",|a);
        $display("^a=%0b",^a);
        $display("~&a=%0b",~&a);
        $display("~|a=%0b",~|a);
        $display("~^a=%0b",~^a);
      end
        endcase
  end
    endmodule
