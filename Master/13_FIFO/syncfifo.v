module syfifo(clk, rst, wr_en, rd_en,w_data, r_data,full, empty, wr_err, rd_err);
parameter WIDTH=8;
parameter DEPTH=16;
parameter ADDR_PTR_WIDTH=4;

input clk, rst, wr_en, rd_en;
input [WIDTH-1:0]w_data;

output reg [WIDTH-1:0]r_data;
output reg wr_err, rd_err,full, empty;

reg [ADDR_PTR_WIDTH-1:0] wr_ptr, rd_ptr;
reg wr_f, rd_f; 

integer i;

reg[WIDTH-1:0]mem[DEPTH-1:0];

always @(posedge clk) begin
	if (rst) begin
		wr_ptr=0;
		rd_ptr=0;
		full=0;
		empty=1;
		wr_err=0;
		rd_err=0;
		wr_f=0;
		rd_f=0;
		r_data=0;
		for (i=0;i<DEPTH;i=i+1)
			mem[i]=0;
	end

	else begin
		wr_err=0;
		rd_err=0;
		if (wr_en) begin
			if(~full) begin
				mem[wr_ptr]=w_data;
				if (wr_ptr==DEPTH-1) begin
						wr_f=~wr_f;
						wr_ptr=0;
				end
				else wr_ptr=wr_ptr+1;
			end
			else wr_err=1;
		end

		if (rd_en) begin
			if(~empty) begin
				r_data=mem[rd_ptr];
				if (rd_ptr==DEPTH-1) begin
						rd_f=~rd_f;
						rd_ptr=0;
				end
				else rd_ptr=rd_ptr+1;
			end
			else rd_err=1;
		end

	end

end

always @(wr_ptr or rd_ptr)begin
	full=0;
	empty=0;
	if(wr_ptr==rd_ptr && wr_f==rd_f)begin
			empty=1;
		//	full=0;
		end
		if (wr_ptr==rd_ptr && wr_f!=rd_f)begin
			full=1;
		//	empty=0;
		end
	end


endmodule
