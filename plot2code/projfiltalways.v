xor xor1(s3, d3[15], d3[7]);
add8 add3(d3[15:8], {7'b0, s3}, 1'b0, ad3, cout3);

always @ (posedge clk)
begin
	y = ad3;

end
