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
