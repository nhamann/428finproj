`timescale 1ns / 1ps
module projfilt(x, clk, y);
input [7:0] x;
input clk;
output [7:0] y;
reg [7:0] y;

wire [15:0] d1, d2, d3;
reg [7:0] a1, b1, b2;
wire [15:0] m1, m2, m3, ad1, ad2;
wire s1, s2;

initial begin
	a1 = 8'hEE;
	b1 = 8'h51;
	b2 = 8'hDE;
	y = 8'h00;
end

mult8 a1mult(x, a1, m1);
mult8 b1mult(y, b1, m2);
mult8 b2mult(y, b2, m3);

reg16 reg1(m1, clk, d1);
reg16 reg2(ad1, clk, d2);
reg16 reg3(ad2, clk, d3);

add16 add1(d1, m3, 1'b0, ad1, s1);
add16 add2(d2, m2, 1'b0, ad2, s2);

// Dropped bit truncation
always @ (posedge clk)
begin
	y = d3[15:8];
end

endmodule

