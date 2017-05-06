//Subject:     CO project 3 - ALU Controller
//--------------------------------------------
//Student: 0411276 Chen Yi An
//Student: 0413335 Kuo Yi Lin
//--------------------------------------------

module Decoder(
input	[6-1:0]instr_op_i,
output	wire 			RegWrite_o,
		wire [4-1:0]	ALU_op_o,
		wire			ALUSrc_o,
		wire			RegDst_o,
		wire			Branch_o,
		wire			Jump_o,
		wire [2-1:0]	MemToReg_o,
		wire [2-1:0]	BranchType_o,
		wire			MemRead_o,
		wire			MemWrite_o,
	);

reg [6-1:0] ALU_Reg_type;
reg [8-1:0] Mem_Branch_type;

//bit count 
//				4,			1,			1,			 1
assign { ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } = ALU_Reg_type ;

//				2,			1,			1,		  1,			2		1
assign { MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } = Mem_Branch_J_type ;

//Main function
	always@(*)begin
	  case (instr_op_i)
	  	6'd0:begin //Add	--Representative instruction of this datapath 
		  	{ ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } 	<= { 4'd0, 3'b011 };
			{ MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } <= { 2'd0, 3'b000,	2'dx, 1'b0};
		  end
		6'd2:begin // Jump
		  	{ ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } 	<= { 4'd1, 3'bxx0 };
			{ MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } <= { 2'd0, 3'b00x,	2'dx, 1'b1};
		  end
		6'd3:begin // JAL: Jump And Link
		  	{ ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } 	<= { 4'd2, 3'bxx1 };
			{ MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } <= { 2'd0, 3'b00x,	2'dx, 1'b1};
		  end

			//Branch 系列指令的mux都還沒搞懂意義
		6'd4:begin //BEQ
		  	{ ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } 	<= { 4'd3, 3'b0x0 };
			{ MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } <= { 2'd0, 3'b001,	2'dx, 1'b0};
		  end
		  //Branch 系列指令的mux都還沒搞懂意義
		6'd5:begin	//BNEZ
		  	{ ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } 	<= { 4'd4, 3'b011 };
			{ MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } <= { 2'd0, 3'b000,	2'dx, 1'b0};
		  end
		  //Branch 系列指令的mux都還沒搞懂意義
		6'd6:begin //BLT : Branch Less Than
		  	{ ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } 	<= { 4'd5, 3'b011 };
			{ MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } <= { 2'd0, 3'b000,	2'dx, 1'b0};
		  end
		  //Branch 系列指令的mux都還沒搞懂意義
		6'd7:begin //BLE : Branch Less Equal
		  	{ ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } 	<= { 4'd6, 3'b011 };
			{ MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } <= { 2'd0, 3'b000,	2'dx, 1'b0};
		  end

		6'd8:begin //ADDI
		  	{ ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } 	<= { 4'd7, 3'b101 };
			{ MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } <= { 2'd0, 3'b000,	2'dx, 1'b0};
		  end
		6'd13:begin //ORI
		  	{ ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } 	<= { 4'd8, 3'b101 };
			{ MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } <= { 2'd0, 3'b000,	2'dx, 1'b0};
		  end
		6'd15:begin //LI: Load immediate 
		  	{ ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } 	<= { 4'd9, 3'b101 };
			{ MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } <= { 2'd1, 3'b100,	2'dx, 1'b0};
		  end
		6'd35:begin //LW: Load Word
		  	{ ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } 	<= { 4'd10, 3'b101 };
			{ MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } <= { 2'd1, 3'b100,	2'dx, 1'b0};
		  end
		6'd43:begin //SW: Store Word 
		  	{ ALU_op_o, 	 ALUSrc_o, 	RegDst_o,	RegWrite_o } 	<= { 4'd11, 3'b100 };
			{ MemToReg_o, MemRead_o, MemWrite_o,	Branch_o, BranchType_o, Jump_o } <= { 2'dx, 3'b010,	2'dx, 1'b0};
		  end
		default: 
			{ALU_Reg_type, Mem_Branch_type} = 15'bx ; 
	  endcase
	end
endmodule





                    
                    