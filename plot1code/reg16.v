`timescale 100ns / 1ns 
module reg16(d, clk, q);
input [15:0] d;
input clk;
output [15:0] q;
reg [15:0] q;


always @ (posedge clk)
begin
if(d === 16'bz | d === 16'bx)
	q <= 16'b0;
else
	q <= d;

end

endmodule

