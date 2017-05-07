//Subject:     CO project 3
//--------------------------------------------
//Student: 0411276 Chen Yi An
//Student: 0413335 Kuo Yi Lin
//--------------------------------------------

module ALU(
input  		[32-1:0]  src1_i,
			[32-1:0]  src2_i,
			[4-1:0]   ctrl_i,
			[5-1:0]   shamt,
			[32-1:0]  pc_add4,
output  reg	[32-1:0]  result_o,
		              zero_o
//ALU必須要得到PC+4的值,並且在 JAL指令的時候直接輸出PC+4
	);
     

//Internal signals
wire signed  [32-1:0]	signed_src1,
					 	signed_src2;

//Values are implicitly unsigned
wire  		 [32-1:0]	unsigned_src1,
						unsigned_src2;
//Parameter
parameter ALU_AND  = 4'd0;
parameter ALU_OR   = 4'd1;
parameter ALU_ADD  = 4'd2;
parameter ALU_SUB  = 4'd3;
parameter ALU_SLT  = 4'd4;
parameter ALU_SLTU = 4'd5;
parameter ALU_BNEZ = 4'd6;
parameter ALU_SLL  = 4'd7;
parameter ALU_SLLV = 4'd8;
parameter ALU_LUI  = 4'd9;
parameter ALU_ORI  = 4'd10;
parameter ALU_MULT     = 4'd11;
parameter ALU_PC_ADD4  = 4'd12;
parameter ALU_IMMDT    = 4'd13;


//Main function
assign zero_o = (result_o ==0) ? 1'b1 :1'b0 ;
assign signed_src1 = src1_i;
assign signed_src2 = src2_i;
assign unsigned_src1 = src1_i;
assign unsigned_src2 = src2_i;


always @( *)begin
  case (ctrl_i)
  		ALU_AND		: result_o = src1_i & src2_i; 
		ALU_OR		: result_o = src1_i | src2_i;
		ALU_ADD		: result_o = signed_src1 + signed_src2;
		ALU_SUB 	: result_o = signed_src1 - signed_src2;
		ALU_SLT 	: result_o = signed_src1   < signed_src2   ? 32'h0001 : 32'b0;
		ALU_SLTU 	: result_o = unsigned_src1 < unsigned_src2 ? 32'h0001 : 32'b0;

		//If 1 ofany 32 bit differs, (src1_i ^ src2_i) would not be zero(XOR), thus we need to branch
		//and result_o = 0 is meant to branch 
		ALU_BNEZ 	: result_o = src1_i ; //src1_i - 0;
		ALU_SLL 	: result_o = src2_i << shamt; 
		ALU_SLLV 	: result_o = src2_i << src1_i ; 
		ALU_LUI 	: result_o = src2_i[15:0] << 16 ; 
		ALU_ORI 	: result_o = src1_i | { 16'b0,src2_i[15:0]} ;
		ALU_MULT	: result_o = src1_i * src2_i ;
		ALU_PC_ADD4 : result_o = pc_add4;
		ALU_IMMDT	: result_o = src2_i;  //ALU directly ouput the sceond operand, the immdt value 
	default: 
		result_o = 32'b0;// Not sure 
  endcase 
end

endmodule





                    
                    