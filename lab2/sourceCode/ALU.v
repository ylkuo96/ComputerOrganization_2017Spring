//Subject:     CO project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU(
    src1_i,
	src2_i,
	ctrl_i,
	shamt,

	result_o,
	zero_o
	
	);
     
//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [4-1:0]   ctrl_i;
input  [5-1:0]   shamt; 
output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  		result_o;
wire             		zero_o;
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
parameter ALU_BNE  = 4'd6;
parameter ALU_SLL  = 4'd7;
parameter ALU_SLLV = 4'd8;
parameter ALU_LUI  = 4'd9;
parameter ALU_ORI  = 4'd10;


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
		ALU_BNE 	: result_o = src1_i ~^ src2_i;
		ALU_SLL 	: result_o = src2_i << shamt; 
		ALU_SLLV 	: result_o = src2_i << src1_i ; 
		ALU_LUI 	: result_o = src2_i[15:0] << 16 ; 
		ALU_ORI 	: result_o = src1_i | { 16'b0,src2_i[15:0]} ;
	default: 
		result_o = 32'b0;// Not sure 
  endcase 
end

endmodule





                    
                    