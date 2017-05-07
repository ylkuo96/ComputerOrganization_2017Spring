//Subject:     CO project 3
//--------------------------------------------
//Student: 0411276 Chen Yi An
//Student: 0413335 Kuo Yi Lin
//--------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [4-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [4-1:0] ALUCtrl_o;

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
//new
parameter ALU_MULT     = 4'd11;
parameter ALU_PC_ADD4  = 4'd12;
parameter ALU_IMMDT    = 4'd13; //ALU directly ouput the sceond operand
parameter ALU_DONTCARE = 4'bxxxx;


parameter OP_FIELD_0  = 4'd0;
//parameter OP_FIELD_2  JUMP instruciton do not need ALU;
parameter OP_FIELD_3  = 4'd1;
parameter OP_FIELD_4  = 4'd2; 
parameter OP_FIELD_5  = 4'd3;
parameter OP_FIELD_6  = 4'd4;
parameter OP_FIELD_7  = 4'd5;
parameter OP_FIELD_8  = 4'd6; 
parameter OP_FIELD_13 = 4'd7; 
//parameter OP_FIELD_15 = 4'd8;
parameter OP_FIELD_35 = 4'd8;
parameter OP_FIELD_43 = 4'd9;

//New OP foeld ------
//35 LW
//43:SW
//2 : Jump
//3 :Jal
//7 : BLE
//6 : 
//5
//15 :有問題，LI會跟LUI衝到
//-------------------


//Select exact operation

always @(*)begin
    //I-type instrucitons
    if( ALUOp_i != OP_FIELD_0 )begin
        case( ALUOp_i)
            //DONT NEED ---OP_FIELD_2: J 
            OP_FIELD_3:  ALUCtrl_o = ALU_PC_ADD4;
            OP_FIELD_4:  ALUCtrl_o = ALU_SUB  ;
            OP_FIELD_5:  ALUCtrl_o = ALU_BNEZ;
            OP_FIELD_6:  ALUCtrl_o = ALU_SUB ;//BLT
            OP_FIELD_7:  ALUCtrl_o = ALU_SUB ;//BLE
            OP_FIELD_8:  ALUCtrl_o = ALU_ADD  ;
            OP_FIELD_13: ALUCtrl_o = ALU_ORI  ;
            //OP_FIELD_15: ALUCtrl_o = ALU_IMMDT  ;//LI,可以縮減  
            OP_FIELD_35: ALUCtrl_o = ALU_ADD ; //LW
            OP_FIELD_43: ALUCtrl_o = ALU_ADD ; //Sw
            default: 
                ALUCtrl_o = ALU_DONTCARE;
        endcase
    end

    //R-type instrucitons 
    //OP_field == 0
	else begin
    case( { ALUOp_i, funct_i } )
        { OP_FIELD_0,  6'h00 }: ALUCtrl_o = ALU_SLL  ;
        { OP_FIELD_0,  6'h04 }: ALUCtrl_o = ALU_SLLV ;
        { OP_FIELD_0,  6'h18 }: ALUCtrl_o = ALU_MULT ;
        { OP_FIELD_0,  6'h20 }: ALUCtrl_o = ALU_ADD  ;
        { OP_FIELD_0,  6'h22 }: ALUCtrl_o = ALU_SUB  ;
        { OP_FIELD_0,  6'h24 }: ALUCtrl_o = ALU_AND  ;
        { OP_FIELD_0,  6'h25 }: ALUCtrl_o = ALU_OR   ;
        { OP_FIELD_0,  6'h2a }: ALUCtrl_o = ALU_SLT  ;
        { OP_FIELD_0,  6'h2b }: ALUCtrl_o = ALU_SLTU ;
         //{ OP_FIELD_0,  6'h08 } JR don't need ALU to do anything 
        default: 
            ALUCtrl_o = ALU_DONTCARE;
    endcase 
	 end
end

endmodule     





                    
                    