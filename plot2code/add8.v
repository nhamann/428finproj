`timescale 1ns / 1ps
module add8(a, b, cin, sum, cout);
input [7:0] a, b;
input cin;
output [7:0] sum;
reg [7:0] sum;
output cout;
reg cout;

wire [7:0] s, co;

add1 a0(a[0], b[0], cin, s[0], co[0]);
add1 a1(a[1], b[1], co[0], s[1], co[1]);
add1 a2(a[2], b[2], co[1], s[2], co[2]);
add1 a3(a[3], b[3], co[2], s[3], co[3]);
add1 a4(a[4], b[4], co[3], s[4], co[4]);
add1 a5(a[5], b[5], co[4], s[5], co[5]);
add1 a6(a[6], b[6], co[5], s[6], co[6]);
add1 a7(a[7], b[7], co[6], s[7], co[7]);

always @(a or b or co or s) begin
	cout = co[6];
	
	if (co[6] ^ co[7])
		if(~b[7])
			sum = {1'd0, 7'h7f};
		else
			sum = 8'h81;
	else 
		sum = s;
end

endmodule
