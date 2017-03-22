//Student 1 : 0411276 Chen-Yi-An 
//Student 2 : 0413335
`timescale 1ns/1ps

module alu(

input               rst_n,         // negative reset            (input)
input  [32-1:0]     src1,          // 32 bits source 1          (input)
input  [32-1:0]     src2,          // 32 bits source 2          (input)
input  [4-1:0]      ALU_control,   // 4 bits ALU control input  (input)
input  [3-1:0]      bonus_control, // 3 bits bonus control input(input) 

output   reg[32-1:0]     result,        // 32 bits result            (output)
output   reg        zero,          // 1 bit when the output is 0, zero must be set (output)
output   reg        cout,          // 1 bit carry out           (output)
output   reg        overflow       // 1 bit overflow            (output)
           );

parameter ALU_AND  = 4'b0000;
parameter ALU_OR   = 4'b0001;
parameter ALU_ADD  = 4'b0010;
parameter ALU_SUB  = 4'b0110;
parameter ALU_NOR  = 4'b1100;
parameter ALU_NAND = 4'b1101;
parameter ALU_SET  = 4'b0111;

// 1 bit hard-wired zero 
parameter ZERO_1   = 1'b1;

//A value that is specified in compare.v
// This can make alu_top output 1'b0 while operation = ALU_SET 
parameter INVALID  = 3'b111; 


wire aInvert, bInvert;
wire [2-1:0]  opcode;
wire  co00,co01, co02, co03, co04, co05, co06, co07, co08, co09, co10, co11, co12, co13, co14, co15, 
      co16, co17, co18, co19, co20, co21, co22, co23, co24, co25, co26, co27, co28, co29, co30,co31;
wire  complementAddOne;//Used in substraction or SET
wire  [32-1:0]alu_result;
wire  alu_overflow;
wire  less, equal; 
assign aInvert = ( (ALU_control == ALU_NOR ) || ( ALU_control == ALU_NAND ) ) ? 1'b1 : 1'b0;
assign bInvert = ( (ALU_control == ALU_SUB ) || ( ALU_control == ALU_NOR ) || ( ALU_control == ALU_NAND )) ? 1'b1 : 1'b0;
assign complementAddOne = ( (ALU_control == ALU_SUB) || ( ALU_control == ALU_SET) )? 1'b1 : 1'b0; 

assign equal = (src1^src2)? 1'b0: 1'b1;  

alu_top AL00( .src1(src1[ 0]), .src2(src2[ 0]), .less(less), .equal(equal), .A_invert(aInvert),  .B_invert(bInvert), .cin(complementAddOne), .operation(opcode), .comp(bonus_control), .result(alu_result[ 0]), .cout(co00) );

alu_top AL01( .src1(src1[ 1]), .src2(src2[ 1]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co00), .operation(opcode), .comp(INVALID), .result(alu_result[ 1]), .cout(co01) );
alu_top AL02( .src1(src1[ 2]), .src2(src2[ 2]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co01), .operation(opcode), .comp(INVALID), .result(alu_result[ 2]), .cout(co02) );
alu_top AL03( .src1(src1[ 3]), .src2(src2[ 3]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co02), .operation(opcode), .comp(INVALID), .result(alu_result[ 3]), .cout(co03) );
alu_top AL04( .src1(src1[ 4]), .src2(src2[ 4]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co03), .operation(opcode), .comp(INVALID), .result(alu_result[ 4]), .cout(co04) );
alu_top AL05( .src1(src1[ 5]), .src2(src2[ 5]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co04), .operation(opcode), .comp(INVALID), .result(alu_result[ 5]), .cout(co05) );
alu_top AL06( .src1(src1[ 6]), .src2(src2[ 6]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co05), .operation(opcode), .comp(INVALID), .result(alu_result[ 6]), .cout(co06) );
alu_top AL07( .src1(src1[ 7]), .src2(src2[ 7]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co06), .operation(opcode), .comp(INVALID), .result(alu_result[ 7]), .cout(co07) );
alu_top AL08( .src1(src1[ 8]), .src2(src2[ 8]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co07), .operation(opcode), .comp(INVALID), .result(alu_result[ 8]), .cout(co08) );
alu_top AL09( .src1(src1[ 9]), .src2(src2[ 9]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co08), .operation(opcode), .comp(INVALID), .result(alu_result[ 9]), .cout(co09) );
alu_top AL10( .src1(src1[10]), .src2(src2[10]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co09), .operation(opcode), .comp(INVALID), .result(alu_result[10]), .cout(co10) );
alu_top AL11( .src1(src1[11]), .src2(src2[11]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co10), .operation(opcode), .comp(INVALID), .result(alu_result[11]), .cout(co11) );
alu_top AL12( .src1(src1[12]), .src2(src2[12]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co11), .operation(opcode), .comp(INVALID), .result(alu_result[12]), .cout(co12) );
alu_top AL13( .src1(src1[13]), .src2(src2[13]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co12), .operation(opcode), .comp(INVALID), .result(alu_result[13]), .cout(co13) );
alu_top AL14( .src1(src1[14]), .src2(src2[14]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co13), .operation(opcode), .comp(INVALID), .result(alu_result[14]), .cout(co14) );
alu_top AL15( .src1(src1[15]), .src2(src2[15]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co14), .operation(opcode), .comp(INVALID), .result(alu_result[15]), .cout(co15) );
alu_top AL16( .src1(src1[16]), .src2(src2[16]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co15), .operation(opcode), .comp(INVALID), .result(alu_result[16]), .cout(co16) );
alu_top AL17( .src1(src1[17]), .src2(src2[17]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co16), .operation(opcode), .comp(INVALID), .result(alu_result[17]), .cout(co17) );
alu_top AL18( .src1(src1[18]), .src2(src2[18]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co17), .operation(opcode), .comp(INVALID), .result(alu_result[18]), .cout(co18) );
alu_top AL19( .src1(src1[19]), .src2(src2[19]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co18), .operation(opcode), .comp(INVALID), .result(alu_result[19]), .cout(co19) );
alu_top AL20( .src1(src1[20]), .src2(src2[20]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co19), .operation(opcode), .comp(INVALID), .result(alu_result[20]), .cout(co20) );
alu_top AL21( .src1(src1[21]), .src2(src2[21]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co20), .operation(opcode), .comp(INVALID), .result(alu_result[21]), .cout(co21) );
alu_top AL22( .src1(src1[22]), .src2(src2[22]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co21), .operation(opcode), .comp(INVALID), .result(alu_result[22]), .cout(co22) );
alu_top AL23( .src1(src1[23]), .src2(src2[23]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co22), .operation(opcode), .comp(INVALID), .result(alu_result[23]), .cout(co23) );
alu_top AL24( .src1(src1[24]), .src2(src2[24]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co23), .operation(opcode), .comp(INVALID), .result(alu_result[24]), .cout(co24) );
alu_top AL25( .src1(src1[25]), .src2(src2[25]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co24), .operation(opcode), .comp(INVALID), .result(alu_result[25]), .cout(co25) );
alu_top AL26( .src1(src1[26]), .src2(src2[26]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co25), .operation(opcode), .comp(INVALID), .result(alu_result[26]), .cout(co26) );
alu_top AL27( .src1(src1[27]), .src2(src2[27]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co26), .operation(opcode), .comp(INVALID), .result(alu_result[27]), .cout(co27) );
alu_top AL28( .src1(src1[28]), .src2(src2[28]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co27), .operation(opcode), .comp(INVALID), .result(alu_result[28]), .cout(co28) );
alu_top AL29( .src1(src1[29]), .src2(src2[29]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co28), .operation(opcode), .comp(INVALID), .result(alu_result[29]), .cout(co29) );
alu_top AL30( .src1(src1[30]), .src2(src2[30]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co29), .operation(opcode), .comp(INVALID), .result(alu_result[30]), .cout(co30) );


alu_bottom AL31( .src1(src1[31]), .src2(src2[31]), .less(ZERO_1), .equal(ZERO_1), .A_invert(aInvert),  .B_invert(bInvert), .cin(co30), .operation(opcode), .comp(INVALID), .result(alu_result[31]), .cout(co31), .overflow(alu_overflow), .less_out(less) );

assign opcode = ( (ALU_control==ALU_AND) || (ALU_control==ALU_NOR)  )? 2'b00 :
                ( (ALU_control==ALU_OR ) || (ALU_control==ALU_NAND) )? 2'b01 :
                ( (ALU_control==ALU_ADD) || (ALU_control==ALU_SUB)  )? 2'b10 :
                                            (ALU_control==ALU_SET )  ? 2'b11 : 
                                                                                2'bxx;
always@(*)begin
  if( rst_n )begin
    result <= alu_result; 
    zero   <= !result ;
    cout   <= ( (ALU_control == ALU_ADD) || (ALU_control == ALU_SUB) ) ? co31 : 1'b0; 
    overflow <= alu_overflow; 

  end
  else begin
    result    <= 1'b0;
    zero      <= 1'b0;
    cout      <= 1'b0;
    overflow  <= 1'b0;
  end

end

endmodule