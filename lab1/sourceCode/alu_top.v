//Student1 : 0411276 Chen-Yi-An 
//Student2 : 0413335 
`timescale 1ns/1ps
module alu_top(
input               src1,       //1 bit source 1 (input)
input               src2,       //1 bit source 2 (input)
input               less,       //1 bit less     (input)
input               equal,      //1 bit equal    (input)
input               A_invert,   //1 bit A_invert (input)
input               B_invert,   //1 bit B_invert (input)
input               cin,        //1 bit carry in (input)
input   [2-1:0]     operation,  //2 bit op code  (input)
input   [3-1:0]     comp,        //3 bit comp code(input)
output  reg         result,     //1 bit result   (output)
output  wire        cout       //1 bit carry out (utput)
               );

parameter ALU_AND  = 2'b00;
parameter ALU_OR   = 2'b01;
parameter ALU_ADD  = 2'b10;
parameter ALU_SET  = 2'b11;

wire compare_out;
wire s1, s2 ;//src1 & src2 under the signal A_invert & B_invert
wire fa_sum ;
wire fa_cout ;

assign s1 = A_invert == 1'b1 ? ~src1 : src1;
assign s2 = B_invert == 1'b1 ? ~src2 : src2; 

compare cmp( .less(less), .equal(equal), .comp(comp), .out(compare_out) );
full_adder fa1( .a(s1), .b(s2), .cin(cin), .sum(fa_sum), .cout(fa_cout) );

// In operation SLT, ALU must calculate the sum and actually output the carryout and "result" (of addition)
assign cout =(  (operation == ALU_ADD) || (operation== ALU_SET ) ) ? fa_cout : 1'b0;

always@( * )begin
    case( operation )
        ALU_AND: result <= s1 & s2;
        ALU_OR : result <= s1 | s2;
        ALU_ADD: result <= fa_sum;
        ALU_SET: result <= compare_out;
        default : result <= 1'b0;        
    endcase 
end

endmodule