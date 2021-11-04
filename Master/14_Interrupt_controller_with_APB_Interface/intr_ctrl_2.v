module intr_ctrl(pclk, prst, penable, pready, paddr, pwrite, pwdata, prdata, intr_to_service, intr_valid , intr_serviced, intr_active);
parameter NO_INTR=3'b001; 
parameter INTR_ACTIVE=3'b010;
parameter WAIT_FOR_SERVICE=3'b100;
input pclk, prst, penable, pwrite, intr_serviced;
input [3:0]paddr, pwdata;
input  [15:0]intr_active; // from peripherals
output reg pready, intr_valid;
output reg [3:0] prdata, intr_to_service;


reg [3:0]priorityreg[15:0];

reg [2:0] state, next_state;
reg first_match_flag;
reg [3:0] highest_prio, highest_prio_interrupt;
integer i;
//1 writing to register
always @(posedge pclk) begin
	if (prst) begin
		pready=0;
		intr_valid=0;
		prdata=0;
		intr_to_service=0;
		state = NO_INTR;
		next_state=NO_INTR;
		first_match_flag=1;
		highest_prio_interrupt=0;
		highest_prio=0;

		for (i=0;i<16;i=i+1) priorityreg[i]=0;
	end
	else begin
		if (penable) begin
			pready=1;
			if (pwrite) priorityreg[paddr]=pwdata;
			else prdata=priorityreg[paddr];			
		end
		else pready=0;
	end
end

//2 interrupt processing-------------M-II-----------only state change logic is sequential------
always @(posedge pclk) state =next_state;
always @(*) begin
	if (prst==0) begin
		case (state)
			NO_INTR: begin
					if(intr_active) begin
						next_state=INTR_ACTIVE;
						first_match_flag=1;
					end
			end

			INTR_ACTIVE: begin
			//to find the interrupt with highest priority out of active interrupts
					for(i=0; i<16;i=i+1) begin
						if (intr_active[i]) begin
							if (first_match_flag) begin
								highest_prio=priorityreg[i];
								highest_prio_interrupt=i;
								first_match_flag=0;
							end
							else begin //if first_match_flag==0
								if (priorityreg[i]>highest_prio) begin
									highest_prio=priorityreg[i];
									highest_prio_interrupt=i;										end
							end
						end
					end //end of for loop
					intr_to_service=highest_prio_interrupt;
					intr_valid=1;
					next_state=WAIT_FOR_SERVICE;
			end

			WAIT_FOR_SERVICE: begin
					if (intr_serviced==1) begin
						first_match_flag=1;//since 1 cycle of interrupt processing is completed because it should start afresh to find out next high priority interrupt
						highest_prio_interrupt=0;
						highest_prio=0;
						intr_to_service=0;
						intr_valid=0;
						if (intr_active !=0) next_state=INTR_ACTIVE;
						else next_state=NO_INTR;
					end
			end

		endcase

	end

end

endmodule
