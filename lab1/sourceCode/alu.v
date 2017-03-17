//Student 1 : 0411276 Chen-Yi-An ����//Student 2 : 0413335 �逸琳
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

// 1 bit hard-wired zero 
parameter ZERO_1   = 1'b0;


wire aInvert, bInvert;
wire [2-1:0]  opcode;
wire  co00, co01, co02, co03, co04, co05, co06, co07, co08, co09, co10, co11, co12, co13, co14, co15, 
      co16, co17, co18, co19, co20, co21, co22, co23, co24, co25, co26, co27, co28, co29, co30, co31;
wire  complementAddOne;//Used in substraction or SLT
wire  [32-1:0]lessOut; 
wire  [32-1:0]alu_result;
assign aInvert = ( (ALU_control == ALU_NOR ) || ( ALU_control == ALU_NAND ) ) ? 1'b1 : 1'b0;
assign bInvert = ( (ALU_control == ALU_SUB ) || ( ALU_control == ALU_NOR ) || ( ALU_control == ALU_NAND ) || (ALU_control == ALU_SLT )) ? 1'b1 : 1'b0;
assign complementAddOne = ( (ALU_control == ALU_SUB) || ( ALU_control == ALU_SLT) )? 1'b1 : 1'b0; 


//            src1,         src2,          less, Ainvert,  Binvert, cin,           operation,     lessOut,     alu_result, cout
alu_top AL00( src1[ 0], src2[ 0],alu_result[31], aInvert,  bInvert, complementAddOne, opcode, lessOut[ 0], alu_result[ 0], co00 );

//                src1,     src2,   less, Ainvert,  Binvert,  cin, operation, lessOut,      alu_result, cout
alu_top AL01( src1[ 1], src2[ 1], ZERO_1, aInvert,  bInvert, co00, opcode, lessOut[ 1], alu_result[ 1], co01 );
alu_top AL02( src1[ 2], src2[ 2], ZERO_1, aInvert,  bInvert, co01, opcode, lessOut[ 2], alu_result[ 2], co02 );
alu_top AL03( src1[ 3], src2[ 3], ZERO_1, aInvert,  bInvert, co02, opcode, lessOut[ 3], alu_result[ 3], co03 );
alu_top AL04( src1[ 4], src2[ 4], ZERO_1, aInvert,  bInvert, co03, opcode, lessOut[ 4], alu_result[ 4], co04 );
alu_top AL05( src1[ 5], src2[ 5], ZERO_1, aInvert,  bInvert, co04, opcode, lessOut[ 5], alu_result[ 5], co05 );
alu_top AL06( src1[ 6], src2[ 6], ZERO_1, aInvert,  bInvert, co05, opcode, lessOut[ 6], alu_result[ 6], co06 );
alu_top AL07( src1[ 7], src2[ 7], ZERO_1, aInvert,  bInvert, co06, opcode, lessOut[ 7], alu_result[ 7], co07 );
alu_top AL08( src1[ 8], src2[ 8], ZERO_1, aInvert,  bInvert, co07, opcode, lessOut[ 8], alu_result[ 8], co08 );
alu_top AL09( src1[ 9], src2[ 9], ZERO_1, aInvert,  bInvert, co08, opcode, lessOut[ 9], alu_result[ 9], co09 );
alu_top AL10( src1[10], src2[10], ZERO_1, aInvert,  bInvert, co09, opcode, lessOut[10], alu_result[10], co10 );
alu_top AL11( src1[11], src2[11], ZERO_1, aInvert,  bInvert, co10, opcode, lessOut[11], alu_result[11], co11 );
alu_top AL12( src1[12], src2[12], ZERO_1, aInvert,  bInvert, co11, opcode, lessOut[12], alu_result[12], co12 );
alu_top AL13( src1[13], src2[13], ZERO_1, aInvert,  bInvert, co12, opcode, lessOut[13], alu_result[13], co13 );
alu_top AL14( src1[14], src2[14], ZERO_1, aInvert,  bInvert, co13, opcode, lessOut[14], alu_result[14], co14 );
alu_top AL15( src1[15], src2[15], ZERO_1, aInvert,  bInvert, co14, opcode, lessOut[15], alu_result[15], co15 );
alu_top AL16( src1[16], src2[16], ZERO_1, aInvert,  bInvert, co15, opcode, lessOut[16], alu_result[16], co16 );
alu_top AL17( src1[17], src2[17], ZERO_1, aInvert,  bInvert, co16, opcode, lessOut[17], alu_result[17], co17 );
alu_top AL18( src1[18], src2[18], ZERO_1, aInvert,  bInvert, co17, opcode, lessOut[18], alu_result[18], co18 );
alu_top AL19( src1[19], src2[19], ZERO_1, aInvert,  bInvert, co18, opcode, lessOut[19], alu_result[19], co19 );
alu_top AL20( src1[20], src2[20], ZERO_1, aInvert,  bInvert, co19, opcode, lessOut[20], alu_result[20], co20 );
alu_top AL21( src1[21], src2[21], ZERO_1, aInvert,  bInvert, co20, opcode, lessOut[21], alu_result[21], co21 );
alu_top AL22( src1[22], src2[22], ZERO_1, aInvert,  bInvert, co21, opcode, lessOut[22], alu_result[22], co22 );
alu_top AL23( src1[23], src2[23], ZERO_1, aInvert,  bInvert, co22, opcode, lessOut[23], alu_result[23], co23 );
alu_top AL24( src1[24], src2[24], ZERO_1, aInvert,  bInvert, co23, opcode, lessOut[24], alu_result[24], co24 );
alu_top AL25( src1[25], src2[25], ZERO_1, aInvert,  bInvert, co24, opcode, lessOut[25], alu_result[25], co25 );
alu_top AL26( src1[26], src2[26], ZERO_1, aInvert,  bInvert, co25, opcode, lessOut[26], alu_result[26], co26 );
alu_top AL27( src1[27], src2[27], ZERO_1, aInvert,  bInvert, co26, opcode, lessOut[27], alu_result[27], co27 );
alu_top AL28( src1[28], src2[28], ZERO_1, aInvert,  bInvert, co27, opcode, lessOut[28], alu_result[28], co28 );
alu_top AL29( src1[29], src2[29], ZERO_1, aInvert,  bInvert, co28, opcode, lessOut[29], alu_result[29], co29 );
alu_top AL30( src1[30], src2[30], ZERO_1, aInvert,  bInvert, co29, opcode, lessOut[30], alu_result[30], co30 );
alu_top AL31( src1[31], src2[31], ZERO_1, aInvert,  bInvert, co30, opcode, lessOut[31], alu_result[31], co31 );
//                src1,     src2,   less, Ainvert,  Binvert,  cin, operation, lessOut,      alu_result, cout


assign opcode = ( (ALU_control==ALU_AND) || (ALU_control==ALU_NOR)  )? 2'b00 :
                ( (ALU_control==ALU_OR ) || (ALU_control==ALU_NAND) )? 2'b01 :
                ( (ALU_control==ALU_ADD) || (ALU_control==ALU_SUB)  )? 2'b10 :
                                            (ALU_control==ALU_SLT )  ? 2'b11 : 
                                                                                2'bxx;
always@(*)begin
  if( rst_n )begin
    result <= ( ALU_control == ALU_SLT ) ? lessOut : alu_result; 
    zero   <= !result ;
    cout   <= ( (ALU_control == ALU_ADD) || (ALU_control == ALU_SUB) ) ? co31 : 1'b0; 

    //overflow detection  
    case( alu_result[31] )
      //result is nagative
      1'b1:begin
        if(       (ALU_control == ALU_ADD)  &&  ~( src1[31] |  src2[31]  ) ) overflow <= 1'b1; //src1,src2 are both positive
        else if ( (ALU_control == ALU_SUB)  &&  ((~src1[31]) & src2[31]  ) ) overflow <= 1'b1;
        else overflow <= 1'b0;
      end
      1'b0:begin
        if(       (ALU_control == ALU_ADD)  && ( src1[31] &   src2[31])    ) overflow <= 1'b1; //src1,src2 are both positive
        else if ( (ALU_control == ALU_SUB)  && ( src1[31] & (~src2[31]) )  ) overflow <= 1'b1;
        else overflow <= 1'b0;
      end
      default: overflow <= 1'b0 ;
    endcase

  end
  else begin
    result    <= 1'b0;
    zero      <= 1'b0;
    cout      <= 1'b0;
    overflow  <= 1'b0;
  end

end

endmodule