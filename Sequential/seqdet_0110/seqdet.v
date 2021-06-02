module seqdet(serial_in, out, clk, reset);
    input serial_in, clk, reset;
    output reg out;
    parameter  s0=0, s1=1, s2=2, s3=3;
    reg[1:0] PS, NS;

    always @(posedge clk or posedge reset)
        begin
            if (reset) 
                PS<=s0;
            else
                PS<=NS;
        end

    always @(PS, serial_in)
        begin
          case (PS)
            
            s0: begin
                    NS=serial_in?s0:s1;
                    out=serial_in?0:0;              
                end 
            s1: begin
                    NS=serial_in?s2:s1;
                    out=serial_in?0:0;              
                end 
            s2: begin
                    NS=serial_in?s3:s1;
                    out=serial_in?0:0;              
                end 
            s3: begin
                    NS=serial_in?s0:s1;
                    out=serial_in?0:1;              
                end
                 
            endcase
        end
 
endmodule