`timescale 100ns / 1ns 
module mult8(a, b, p);
input signed [7:0] a, b;
output signed [15:0] p;

assign p = a * b;

endmodule

