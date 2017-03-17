//Student1 : 0411276 Chen-Yi-An 
//Student2 : 0413335 
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
               cout       //1 bit carry out(output)
               );

input         src1;
input         src2;
input         less;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output        less_out;
output        result;
output        cout;

reg           result;

parameter ALU_AND  = 2'b00;
parameter ALU_OR   = 2'b01;
parameter ALU_ADD  = 2'b10;
parameter ALU_SLT  = 2'b11;

wire s1, s2 ;//src1 & src2 under the signal A_invert & B_invert
wire fa_sum ;
wire fa_cout ;
assign s1 = A_invert == 1'b1 ? ~src1 : src1;
assign s2 = B_invert == 1'b1 ? ~src2 : src2; 



full_adder fa1( .a(s1), .b(s2), .cin(cin), .sum(fa_sum), .cout(fa_cout) );


//  the less_outport in operation SLT equal to "less" port.
assign less_out = less;

// In operation SLT, ALU must calculate the sum and actually output the carryout and "result" (of addition)
assign cout =(  (operation == ALU_ADD) || (operation== ALU_SLT ) ) ? fa_cout : 1'b0;

always@( * )begin
    case( operation )
        ALU_AND: result <= s1 & s2;
        ALU_OR : result <= s1 | s2;
        ALU_ADD: result <= fa_sum;
        ALU_SLT: result <= fa_sum;
        default : result <= 1'b0;        
    endcase 
end

endmodule