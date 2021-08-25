module seqdet(serial_in, reset, clk, serial_out);
    input serial_in, clk, reset;
    output reg serial_out;

parameter s0 =0, s1 =1, s2 =2,s3 =3,s4 =4,s5 =5,s6 =6;
reg [2:0] PS, NS;

always @(posedge clk or posedge reset) begin
  if (reset) begin
    PS<=s0;
  end
  else PS<=NS;

end

always @(*) begin
  case (PS)
        s0: begin
            NS=serial_in?s2:s1;
            serial_out=0;          
        end
        s1: begin
            NS=serial_in?s3:s1;
            serial_out=0;          
        end
        s2: begin
            NS=serial_in?s2:s4;
            serial_out=0;          
        end
        s3: begin
            NS=serial_in?s5:s4;
            serial_out=0;          
        end
        s4: begin
            NS=serial_in?s6:s1;
            serial_out=0;          
        end
        s5: begin
            NS=serial_in?s2:s4;
            serial_out=serial_in?0:1;          
        end
        s6: begin
            NS=serial_in?s5:s4;
            serial_out=serial_in?0:1;          
        end
        
        default: begin
          NS=s0;
          serial_out=0;
        end

  endcase

end
endmodule
