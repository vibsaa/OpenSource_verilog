module datapath(data_in, lda, ldp,ldb, decb, clrp,eqz);
input [15:0] data_in;
input lda, ldp,ldb, decb, clrp;
output eqz;
wire [15:0] p, q, r, Bout, Bus;

    RegA A (Bus, p, clk, lda);
    RegB B (Bus, Bout, clk, ldb,decb);
    RegP P (Bus, q, clk, ldp, clrp );
    comp C (Bout, eqz);
    adder ADD1 (p,q, r);

endmodule


module RegA (x, y, clk, ld);
    input [15:0] x;
    input clk, ld;
    output reg [15:0] y ;

    always @(posedge clk) begin
        if (ld)
            y<=x;
        else 
            y<=y;
        
    end
endmodule

module RegB(x,y, clk, ld, dec);
    input [15:0]x;
    input ld, clk, dec;
    output reg [15:0] y;
    always @(posedge clk) begin
        if (ld)
            y<=x;
        else if (dec) 
            y<=y-1;
    end
    
endmodule

module RegP (x, y, clk, ld, clr);
    input [15:0] x;
    input clk, ld, clr;
    output reg [15:0] y ;

    always @(posedge clk) begin
        if (clr)
            y<=16'b0;
        else if (ld)
            y<=x;
        
    end
endmodule

module comp (x, eqz);
input [15:0] x;
output eqz;

assign eqz=x?0:1;

endmodule

module adder (in1, in2, out);
input [15:0] in1, in2;
output out;

assign out=in1+in2;

endmodule


module controlpath (lda, ldb,ldp,clrp, decb, eqz, start, done, clk);
input start, clk, eqz;
output lda, ldb,ldp,clrp, decb, done;

    
endmodule