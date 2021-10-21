/*#############################################################################################
#                                                   					      #
#                                                   					      #
#                                                   					      #
#                                                   					      #
#############      Copyright (C) 2012-2020 VLSIGuru Training Institute        #################
#                                                   					      #
###### www.vlsiguru.com | contact@vlsiguru.com | +91-9986194191 | Horamavu, Bangalore  ########
#                                                   					      #
###### This Code is proprietary of VLSIGuru Training Institute. This code can't be reused #####
###### or distributed without prior consent from VLSIGuru Training Institute.           #######
#                                                   					      #
#                                                   					      #
#                                                   					      #
#                                                   					      #
##############################################################################################*/
module tb;
parameter COUNT=30;
parameter BASE=40;
integer intA[COUNT-1:0];
integer i, j, num;
reg num_exists_f;

initial begin
num_exists_f = 0;
for (i = 0; i < COUNT; ) begin
	num = $urandom_range(BASE, BASE+COUNT-1);
	num_exists_f = 0; //start with assumption that, number is not present in array
	for (j = 0; j < i; j=j+1) begin
		if (intA[j] == num) begin
			num_exists_f = 1;
			j = i; //it will help exit the loop
		end
	end
	if (num_exists_f == 0) begin
		intA[i] = num;
		i = i + 1;
	end
end
for (i = 0; i < COUNT; i=i+1) begin
	$display("intA[%0d]=%0d",i, intA[i]);
end
end
endmodule
