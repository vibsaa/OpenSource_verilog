`include "syncfifo.v"
module tb;
parameter WIDTH=8;
parameter DEPTH=16;
parameter ADDR_PTR_WIDTH=4;
parameter MAX_RD_DELAY=10;
parameter MAX_WR_DELAY=5;

reg clk, rst, wr_en, rd_en;
reg [WIDTH-1:0]w_data;

wire [WIDTH-1:0]r_data;
wire wr_err, rd_err,full, empty;

integer i,j,p,q, wr_delay, rd_delay;

reg [50*8:1] testname;

syfifo #(.WIDTH(WIDTH),.DEPTH(DEPTH),.ADDR_PTR_WIDTH(ADDR_PTR_WIDTH)) dut(clk, rst, wr_en, rd_en,w_data, r_data,full, empty, wr_err, rd_err);

initial begin
	clk=0;
	forever #5 clk=~clk;

end

initial begin
	$value$plusargs("testname=%s", testname);
	$display("testname=%s", testname);
	rst=1;
	wr_en=0;
	rd_en=0;
	w_data=0;
  	@(posedge clk);
	rst=0;

	case(testname)
		"test_fifo_full_err":begin
          		write_fifo(DEPTH+1);
		end
		"test_fifo_full": begin
			write_fifo(DEPTH);
		end
		"test_empty_error":begin
         		// write_fifo(10);
         		 read_fifo(12);
		end
		"test_fifo_empty":begin
			write_fifo(DEPTH);
			read_fifo(DEPTH);
		end
		"concurrent_rd_wr": begin
			fork
				for (p = 0; p < 200; p=p+1) begin
				write_fifo(1); //person entering a bank
				wr_delay = $urandom_range(1, MAX_WR_DELAY);
				repeat(wr_delay) @(posedge clk); //delay for which no person enters
			end
			for (q = 0; q < 200; q=q+1) begin
				read_fifo(1); //person entering a bank
				rd_delay = $urandom_range(1, MAX_RD_DELAY);
				repeat(rd_delay) @(posedge clk); //delay for which no person enters
			end
			join

		end

	endcase

	#100;
	$finish;


end


task write_fifo(input integer num);
	begin
		for(i=0; i<num; i=i+1)begin
			@(posedge clk);
			wr_en=1;
			w_data=$random;
		end
		@(posedge clk);
		wr_en=0;
		w_data=0;
	end
endtask
task read_fifo(input integer num);
	begin
		for(j=0; j<num; j=j+1)begin
			@(posedge clk);
			rd_en=1;
		end
		@(posedge clk);
		rd_en=0;
	end
endtask

endmodule 


