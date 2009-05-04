module add2_8(a, b, cin, sum, cout);
  output reg [7:0] sum;
  output reg cout;
  input [7:0] a;
  input [7:0] b;
  input cin;

  always @(a, b, cin)
    {cout, sum} = a + b + cin;
endmodule
