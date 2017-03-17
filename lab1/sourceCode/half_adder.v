//Student1 : 0411276 Chen-Yi-An 
//Student2 : 0413335 
module half_adder(
input a,
input b,
output  sum,
output  cout
);
xor xor1( sum,  a, b);
and and1( cout, a, b);

endmodule 