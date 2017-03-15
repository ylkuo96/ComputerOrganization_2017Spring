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
wire [2-1:0]  opcode;
wire  first_alu_cin;//Used in substraction or SLT
wire  last_alu_cout;//Used in SLT

assign aInvert = ( (ALU_control == ALU_NOR ) || ( ALU_control == ALU_NAND ) ) ? 1'b1 : 1'b0;
assign bInvert = ( (ALU_control == ALU_SUB ) || ( ALU_control == ALU_NOR ) || ( ALU_control == ALU_NAND )) ? 1'b1 : 1'b0;
assign first_alu_cin = ( (ALU_control == ALU_SUB ) || ( ALU_control == ALU_SLT ) ) ? 1'b1 : 1'b0;

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



/* 
  wire co0, co1, co2, co3, co4, co5, co6, co7, co08, co09, co10, co11, co12, co13, co14, co15, co16,
       co17, co18, co19, co20, co21, co22, co23, co24, co25, co26, co27, co28, co29, co30, co31;
*/
//Need 32 instance 
//alu_top AL1( .src1(src1[0]), .src2(src2[0]), .less(), .A_invert(), .B_invert(), .cin(), .operation(), .result(), .cout() ); 

//alu_top AL1( .src1(src1[0]), .src2(src2[0]), .less(ZERO_1), .A_invert(aInvert[1]), .B_invert(bInvert[1]), .cin(co0), .operation(opcode), .result(result[1]), .cout(co1) ); 

assign opcode = ( (ALU_control==ALU_AND) || (ALU_control==ALU_NOR)  )? ALU_AND[3:4] :
                ( (ALU_control==ALU_OR ) || (ALU_control==ALU_NAND) )? ALU_OR [3:4] :
                ( (ALU_control==ALU_ADD) || (ALU_control==ALU_SUB) || (ALU_control==ALU_SLT) )? ALU_ADD[3:4] :
                2'bxx;





endmodule