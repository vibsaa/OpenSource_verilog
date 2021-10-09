module tb();
  integer p[4:0];
   integer q[4:0];
   integer r[4:0];
integer i;
initial begin
  for (i=0;i<5;i=i+1) begin
    p[i]=$urandom_range(0,50);
    q[i]=$urandom_range(10,60);
  end
  
 
 /* for (i=0;i<5;i=i+1) begin
     $display("p[%0d]=%0d",i,p[i]);
 end
  
  for (i=0;i<5;i=i+1) begin
     $display("q[%0d]=%0d",i,q[i]);
  end
*/  
  for (i=0;i<5;i=i+1) begin
    r[i]=add(p[i],q[i]);
  end
  
   for (i=0;i<5;i=i+1) begin
     $display("time=%0t p[%0d]=%0d q[%0d]=%0d r[%0d]=%0d",$time,i,p[i],i,q[i],i,r[i]);
  

end
  
end
  
  
  function integer add(input integer a, input integer b);
begin
 
    add=a+b;
  
end
  endfunction
  
  
endmodule
