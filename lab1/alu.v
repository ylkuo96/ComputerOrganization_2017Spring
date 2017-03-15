//Student 1 : 0411276 Chen-Yi-An 陳奕安
//Student 2 : 0413335 郭逸琳
`timescale 1ns/1ps

module alu(

           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
         //bonus_control, // 3 bits bonus control input(input) 
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );

input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;
//input   [3-1:0] bonus_control; 

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

reg    [32-1:0] result;
reg             zero;
reg             cout;
reg             overflow;


reg    [1:0]    opcode;

parameter ALU_AND  = 4'b0000;
parameter ALU_OR   = 4'b0001;
parameter ALU_ADD  = 4'b0010;
parameter ALU_SUB  = 4'b0110;
parameter ALU_NOR  = 4'b1100;
parameter ALU_NAND = 4'b1101;
parameter ALU_SLT  = 4'b0111;

// Hard wired zero
parameter ZERO_1   = 1'b1;


wire [32-1:0] aInvert, bInvert;

assign aInvert = ALU_control == ALU_NOR ?  


assign bInvert = ~src2;


//operation code translation
/*
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               cout,       //1 bit carry out(output)
*/

//Need 32 instance 
//alu_top AL1( .src1(), .src2(), .less(), .A_invert(), .B_invert(), .cin(), .operation(), .result(), .cout() ); 

always @(*)begin
    case( ALU_control )
        ALU_AND:  opcode = ALU_AND[3: 4];
        ALU_OR:   opcode = ALU_OR [3: 4];
        ALU_ADD:  opcode = ALU_ADD[3: 4];
        ALU_SUB:  opcode = ALU_ADD[3: 4];
        ALU_NOR:  opcode = ALU_AND[3: 4];
        ALU_NAND: opcode = ALU_OR [3: 4];
        ALU_SLT:  opcode = ALU_ADD[3: 4];
        default: opcode = 2'b0; 
    endcase 
end





endmodule