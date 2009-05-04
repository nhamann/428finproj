`timescale 100ns / 1ns 
module add1(a, b, cin, sum, cout);
input a, b, cin;
output sum, cout;
reg sum, cout;

always @(a or b or cin) begin
	sum = (a ^ b) ^ cin;
	cout = (a & b) | (cin & (a ^ b));
end

endmodule
