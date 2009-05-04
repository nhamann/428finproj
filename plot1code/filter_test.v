`timescale 100ns / 1ns 

module testfixture();

// Inputs
   reg [7:0] x;
   reg clk;

// Output
   wire [7:0] y;

   integer fw;
   integer fr;
	integer fsc;
   integer i;

// Bidirs

// Instantiate the UUT 
   projfilt UUT (
		.x(x), 
		.clk(clk),
		.y(y)
   );
// Initialize Inputs
      initial begin
		x = 0;
		clk = 0;
	
  fr = $fopen("filter.in", "r");
  fw = $fopen("filter.out", "w");
     
  fsc = $fscanf(fr,"%b", x);  
  #10 clk = 1;	   
  #10 clk = 0;

  for(i=0;i<800;i=i+1)
  begin
    #10 clk = 1;	   
    #10 clk = 0;
  end
  $fclose(fr);
  $fclose(fw);
  $stop;
end

always @(posedge clk) 
begin 
$fdisplay(fw, "%b", y); 
fsc = $fscanf(fr,"%b", x);
end 

endmodule
