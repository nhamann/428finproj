`timescale 1ns / 1ps
module add16(a, b, cin, sum, cout);
input [15:0] a, b;
input cin;
output [15:0] sum;
reg [15:0] sum;
output cout;
reg cout;

wire [15:0] s, co;

add1 a0(a[0], b[0], cin, s[0], co[0]);
add1 a1(a[1], b[1], co[0], s[1], co[1]);
add1 a2(a[2], b[2], co[1], s[2], co[2]);
add1 a3(a[3], b[3], co[2], s[3], co[3]);
add1 a4(a[4], b[4], co[3], s[4], co[4]);
add1 a5(a[5], b[5], co[4], s[5], co[5]);
add1 a6(a[6], b[6], co[5], s[6], co[6]);
add1 a7(a[7], b[7], co[6], s[7], co[7]);
add1 a8(a[8], b[8], co[7], s[8], co[8]);
add1 a9(a[9], b[9], co[8], s[9], co[9]);
add1 a10(a[10], b[10], co[9], s[10], co[10]);
add1 a11(a[11], b[11], co[10], s[11], co[11]);
add1 a12(a[12], b[12], co[11], s[12], co[12]);
add1 a13(a[13], b[13], co[12], s[13], co[13]);
add1 a14(a[14], b[14], co[13], s[14], co[14]);
add1 a15(a[15], b[15], co[14], s[15], co[15]);

always @(a or b or co or s) begin
	cout = co[14];
	
	if (co[14] ^ co[15])
		if(~b[15])
			sum = {1'd0, 15'h7fff};
		else
			sum = 16'h8001;
	else 
		sum = s;
end

endmodule
