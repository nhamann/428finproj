module reg8(d, clk, reset, q);
input [7:0] d;
input clk, reset;
output [7:0] q;
reg [7:0] q;


always @ (posedge clk)
begin
	if(reset == 1'b1)
		q <= 8'b0;
	else
		q <= d;

end
endmodule

