module projfilt(x, clk, reset, y);
input signed [7:0] x;
input clk, reset;
output signed [7:0] y;
reg signed [7:0] y;

wire signed [7:0] d1;
reg signed [7:0] a1, b1, b2;
wire signed [15:0] m1, m2, m3, ad1, ad2;
wire signed [7:0] ad3;
wire s1, cout1, cout2, cout3;

initial begin
	a1 = 8'hEE;
	b1 = 8'h51;
	b2 = 8'hDE;
	y = 8'h00;
end

mult8 a1mult(x, a1, m1, clk, reset);
mult8 b1mult(y, b1, m2, clk, reset);
reg8 reg1(y, clk, reset, d1);
mult8 b2mult(d1, b2, m3, clk, reset);


add2_16 add1(m1, m3, 1'b0, ad1, cout1);
add2_16 add2(ad1, m2, 1'b0, ad2, cout2);

xor xor1(s1, ad2[15], ad2[7]);
add2_8 add3(ad2[15:8], {7'b0, s1}, 1'b0, ad3, cout3);

// Dropped bit truncation
always @ (posedge clk)
begin
	if(reset == 1'b1)
		y <= 8'b0;
	else
		y <= ad3;
end

endmodule

