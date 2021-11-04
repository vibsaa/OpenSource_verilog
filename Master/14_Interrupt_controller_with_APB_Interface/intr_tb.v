`include"intr_ctrl_2.v"
module tb;

parameter NO_INTR=3'b001; 
parameter INTR_ACTIVE=3'b010;
parameter WAIT_FOR_SERVICE=3'b100;
reg pclk, prst, penable, pwrite, intr_serviced;
reg [3:0]paddr, pwdata;
reg  [15:0]intr_active; // from peripherals
wire pready, intr_valid;
wire [3:0] prdata, intr_to_service;
integer i;
intr_ctrl dut(pclk, prst, penable, pready, paddr, pwrite, pwdata, prdata, intr_to_service, intr_valid , intr_serviced, intr_active);


always begin
pclk=1; #5;
pclk=0; #5;
end

initial begin
	prst=1;
	#20;
	prst=0;

	//stimulus 1: programming the registers
	for (i=0; i<16;i=i+1) begin
		writereg(i,i); //interrupt number is its priority
	end
	// stimulus 2:interrupt
	intr_active=$random;
	#1000;
	$finish;

end


always @(posedge pclk) begin
	if (intr_valid) begin
		#20;
		intr_active[intr_to_service]=0; //disable the current interrupt
		intr_serviced=1;
		@(posedge pclk);
		intr_serviced=0;	
	end

end
task writereg(input integer pos, input integer value);
begin
@(posedge pclk);
paddr=pos;
pwdata=value;
pwrite =1;
penable=1;
wait(pready==1);
@(posedge pclk);
pwrite=0;
penable=0;
paddr=0;
pwdata=0;
end
endtask

endmodule

