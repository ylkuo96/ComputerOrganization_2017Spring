//Student1 : 0411276 Chen-Yi-An 陳奕安
//Student2 : 0413335 郭逸琳
`timescale 1ns/1ps
module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               less_out,   //connect to less(output)
               result,     //1 bit result   (output)
               cout,       //1 bit carry out(output)
               );

input         src1;
input         src2;
input         less;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output        result;
output        cout;

reg           result;


parameter ALU_AND  = 2'b00;
parameter ALU_OR   = 2'b01;
parameter ALU_ADD  = 2'b10;
parameter ALU_SLT  = 2'b11;
// In operation SLT, ALU must calculate the sum and actually output the carryout and "result" (of addition)
//  the less_outport in operation SLT equal to "less" port.


always@( * )
begin

end

endmodule