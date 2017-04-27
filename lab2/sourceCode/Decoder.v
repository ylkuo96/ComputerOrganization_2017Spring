//Subject:     CO project 2 - ALU Controller
//--------------------------------------------
//Student: 0411276 Chen Yi An
//Student: 0413335 Kuo Yi Lin
//--------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
 
//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;

//wire []op 
//Parameter

//Main function
	always@(*)begin
	  case (instr_op_i)
		6'd0:  {  ALU_op_o, RegWrite_o, ALUSrc_o, RegDst_o, Branch_o} = { 3'b000, 4'b1010 };
		6'd4:  {  ALU_op_o, RegWrite_o, ALUSrc_o, RegDst_o, Branch_o} = { 3'b001, 4'b00x1 };//4'b_01x1
		6'd5:  {  ALU_op_o, RegWrite_o, ALUSrc_o, RegDst_o, Branch_o} = { 3'b010, 4'b00x1 };
		6'd8:  {  ALU_op_o, RegWrite_o, ALUSrc_o, RegDst_o, Branch_o} = { 3'b011, 4'b1100 };
		6'd13: {  ALU_op_o, RegWrite_o, ALUSrc_o, RegDst_o, Branch_o} = { 3'b100, 4'b1100 };
		6'd15: {  ALU_op_o, RegWrite_o, ALUSrc_o, RegDst_o, Branch_o} = { 3'b101, 4'b1100 };
		default: 
		{  ALU_op_o, RegWrite_o, ALUSrc_o, RegDst_o, Branch_o} = { 3'bxxx, 4'bxxxx };
	  endcase
	end
endmodule





                    
                    