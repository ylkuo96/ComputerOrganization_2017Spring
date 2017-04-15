//Student 1 : 0411276 Chen-Yi-An
//Student 2 : 0413335 Kuo Yi Lin
module full_adder(
input a,
input b,
input cin,
output  sum,
output  cout
);
wire carry1,carry2;
wire sum1;

half_adder ha1( .a(a), .b(b), .sum(sum1), .cout(carry1) );
half_adder ha2( .a(sum1), .b(cin), .sum(sum), .cout(carry2) );

or or1( cout, carry1, carry2 );


endmodule 