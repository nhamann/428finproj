module add2_16(a, b, cin, sum, cout);
  output reg [15:0] sum;
  output reg cout;
  input [15:0] a;
  input [15:0] b;
  input cin;

  always @(a, b, cin)
    {cout, sum} = a + b + cin;
endmodule
