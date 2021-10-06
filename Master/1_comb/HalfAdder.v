module Half (a,b,s,co);

input [7:0]a ,b;
output [7:0]s,co;

/*output co;

assign {co,s}=a+b; //this will work if you want final carry only
*/
assign s=a^b;
assign co=a&b;

endmodule
