module asyfifo(rd_clk,wr_clk, rst, wr_en, rd_en,w_data, r_data,full, empty, wr_err, rd_err);
parameter WIDTH=8;
parameter DEPTH=16;
parameter ADDR_PTR_WIDTH=4;

input rd_clk, wr_clk, rst, wr_en, rd_en;
input [WIDTH-1:0]w_data;

output reg [WIDTH-1:0]r_data;
output reg wr_err, rd_err,full, empty;

reg [ADDR_PTR_WIDTH-1:0] wr_ptr, rd_ptr;
reg wr_f, rd_f; 
reg wr_ptr_rd_clk,wr_f_rd_clk;
reg rd_ptr_wr_clk, rd_f_wr_clk;
integer i;

reg[WIDTH-1:0]mem[DEPTH-1:0];
//write block
always @(posedge wr_clk) begin
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
		if (wr_en) begin
			if(~full) begin
				mem[wr_ptr]=w_data;
				if (wr_ptr==DEPTH-1) begin
					wr_f=~wr_f;
					wr_ptr=0;
					end
				else wr_ptr=wr_ptr+1;
			end
			else	wr_err=1;
		end
	end


end

//read block
always @(posedge rd_clk) begin
	if (rst==0) begin
		rd_err=0;
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
//synchronization block
always @(posedge rd_clk) begin
	wr_ptr_rd_clk<=wr_ptr;
	wr_f_rd_clk<=wr_f;
end
always @(posedge wr_clk) begin
	rd_ptr_wr_clk<=rd_ptr;
	rd_f_wr_clk<=rd_f;
end

//comparison block
always @(*)begin
	full=0;
	empty=0;
	if(wr_ptr_rd_clk==rd_ptr && wr_f_rd_clk==rd_f)begin
		empty=1;
		//full=0;
	end
	if(wr_ptr==rd_ptr_wr_clk && wr_f!=rd_f_wr_clk) begin
			full=1;
		//	empty=0;
		end
end

endmodule
