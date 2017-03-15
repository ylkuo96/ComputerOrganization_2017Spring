module opUnit(
    output result,
    output carryout,

    input a,b,
    input aInvert,bInvert,
    input [1:0] opcode,
    input carryin,
    input less
);

parameter ALU_AND  = 2'b00;
parameter ALU_OR   = 2'b01;
parameter ALU_ADD  = 2'b10;

wire a_in ,b_in ;

assign a_in = aInvert == 1'b1? ~a : a ;
assign b_in = bInvert == 1'b1? ~b : b ;

/*
  assign result = opcode == ALU_AND ? a&b :
                  opcode == ALU_OR  ? a|b :
                  opcode == ALU_ADD ? a|  b | carryin :
                  opcode == ALU_SUB ? a| ~b | carryin :
                  opcode == ALU_NOR ? ~( a|b):
                  opcode == ALU_NAND ? ~(a&b):
                  opcode == ALU_SLT ? 
 */


 /*
 從opcode 決定 result 是哪個
 */


  /*
  assign less
  */


endmodule
