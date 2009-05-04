module mult8(a, b, p, clk, reset);
output signed [15:0] p;
input	clk, reset;
input signed [7:0] a;
input signed [7:0] b;

reg signed [15:0] p;
wire signed	[15:0] mult_out;

assign mult_out = a * b;

always@(posedge clk)
begin
	if(reset == 1'b1) begin
		p <= 16'b0;
	end else begin
		p <= mult_out;
	end
end

endmodule
