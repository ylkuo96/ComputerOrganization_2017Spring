//Subject:     CO project 4
//--------------------------------------------
//Student: 0411276 Chen Yi An
//Student: 0413335 Kuo Yi Lin
//--------------------------------------------
`define i32 = 31:0 
`define i3 = 2:0
`define i4 = 3:0
module Simple_Single_CPU(
                clk_i,
                rst_i
                );
/****************************************
I/O ports
****************************************/
input         clk_i;
input         rst_i;


/****************************************
Internal signal
****************************************/

/**** 
IF stage 
****/
wire [`i32]pc_next,    pc_data ;
wire [`i32] pc_add4_IF;
wire PCSrc; 

/**** 
ID stage 
****/

//control signal
wire RW_ID_muxOut,MR_ID_muxOut,MW_ID_muxOut;
    //EX
wire AluSrc_c_ID, 
wire [`i4]AluOp_c_ID;
wire RegDst_c_ID;
    //MEM
wire Branch_c_ID;
wire MemRead_c_ID,   MemWrite_c_ID;  
wire MemToReg_c_ID,
    //WB
wire RegWrite_c_ID ;

/**** 
EX stage 
****/
wire RW_EX_muxOut,MR_EX_muxOut,MW_EX_muxOut;
//control signal
    //EX
wire AluSrc_c_EX;
wire [`i4]AluOp_c_EX;
wire RegDst_c_EX;
    //MEM
wire Branch_c_EX;
wire MemRead_c_EX,   MemWrite_c_EX;  
wire MemToReg_c_EX;
    //WB
wire RegWrite_c_EX ;

/**** 
MEM stage 
****/

//control signal
//MEM
wire MemRead_c_MEM,   MemWrite_c_MEM; 
wire MemToReg_c_MEM; 
//EX
wire Branch_c_MEM;
//WB
wire RegWrite_c_MEM;

/**** 
WB stage 
****/

//control signal
//MEM
wire MemRead_c_WB,   MemWrite_c_WB;
wire MemToReg_c_WB;
//WB
wire RegWrite_c_WB ;


//依用途分類
wire [32-1:0]   regWB_data,     //The data writed back to RegisterFile, if any. 
                MemRead_data_MEM, MemRead_data_WB, 
                aluResult_EX, aluResult_MEM,aluResult_WB,
                aluSrc1,        aluSrc2, //input for alu. 
                aluSrc2_reg_EX, aluSrc2_reg_MEM,
                jump_addr,              //The jump address, if any                   
                //immdt16_SE32,   //32bit Signed Extened value derived from the 16bit immediate one    
                shiftout,
                Mux_Branch_or_PCAdd4_out; 


wire [`i32] pc_add4_ID;
wire [`i32] pc_add4_EX;
wire [`i32] branch_addr_EX,branch_addr_MEM;//Mux_PC_Source's input
                        //在ex stage後取代 pc_add4的值,形成真正的可跳轉地址


//依據forwarding 會使用到的資料而分類
wire [`i32] RF_outRS_ID, RF_outRS_EX;
wire [`i32] RF_outRT_ID, RF_outRT_EX;
wire [`i32] RF_outRD_ID, RF_outRD_EX, RF_outRD_MEM, RF_outRD_WB;


wire [`i32] immdt16_SE32_ID, immdt16_SE32_EX; 

wire [`i32] instr_ID;//values from instruction memory according to it's address


wire            alu_zero_EX,alu_zero_MEM,       //Indicate the value of alu is zero or not (for branch usage )
                alu_mux_branch, //The output of "Mux_ALU_Branch_type",This signal represents the alu's evaluation outcome 
                                        //that to branch or not.

                pcBranch_sel;   //Selecting value for Mux_PC_Source 

wire [4-1:0]      aluOpCode_ID, aluOpCode_EX;      //The operation code that ALU get from ALU_Control  
wire [5-1:0]      writeReg_addr_EX,writeReg_addr_MEM, writeReg_addr_WB ;  //The address of the reg that need to be write back, if any.


//Indicate the meaning of the sub-sections in the instruction field     
wire    [32-1:0] instr_IF; 
wire    [5-1:0] instr_rs_ID,  instr_rt_ID,  instr_rd_ID, instr_shamt_ID;
wire    [5-1:0] instr_rs_EX,  instr_rt_EX,  instr_rd_EX, instr_shamt_EX;
wire    [5-1:0] instr_rs_MEM,  instr_rt_MEM,  instr_rd_MEM, instr_shamt_MEM;
wire    [6-1:0] instr_op,instr_funct_ID, instr_funct_EX;
wire    [16-1:0] instr_immdt;


assign { instr_op, instr_rs_ID, instr_rt_ID, instr_rd_ID, instr_shamt_ID, instr_funct_ID } = instr_ID;
assign instr_immdt = instr_IF[15:0];
// 再改一下 assign pcBranch_sel = alu_mux_branch & Branch_c;
//assign jump_addr = {  pc_add4[31:28], instr_IF[25:0], 2'b00};

/**
IF stage: Instruction Fetch
*/

Mux_2to1 #(.size(32))Mux_PC_Source(
    .data0_i(branch_addr_MEM),
    .data1_i(pc_add4_IF),
    .select_i(PCSrc),
    .data_o(pc_next),
);

ProgramCounter PC(
        .clk_i(clk_i),      
        .rst_i (rst_i),
        .pcWrite(1'b1), //hazard dection unit 做好之後再接
        .pc_in_i(pc_next),
        .pc_out_o(pc_data) 
        );

Adder PC4_adder(
        .src1_i(32'd4),     
        .src2_i(pc_data),     
        .sum_o(pc_add4_IF)    
        );

Instr_Memory IM(
        .addr_i(pc_data),  
        .instr_o(instr_IF)    
        );

//IF stage END

Pipe_Reg #(.size(64)) IF_ID(
    .clk_i(clk_i),
    .rst_i(1'b1),// 把這裡接上 IF flush 
    .data_i({   
        pc_add4_IF,
        instr_IF
    }),
    .data_o({
        pc_add4_ID,
        instr_ID
    })
);


/**
ID stage : Instruction Decoding
*/
Reg_File RF(
        .clk_i(clk_i),      
        .rst_i(rst_i) ,     
        .RSaddr_i(instr_rs_ID) ,  
        .RTaddr_i(instr_rt_ID) ,  
        .RDaddr_i(writeReg_addr_WB) ,  
        .RDdata_i(regWB_data)  , 
        .RegWrite_i (RegWrite_c),
        .RSdata_o(RF_outRS_ID) ,  
        .RTdata_o(RF_outRT_ID)   
        );
        
Decoder Control(
        //input 
        .instr_op_i(instr_op),
        .instr_funct_i( instr_funct_ID), 

        //output 
        .ALU_op_o(AluOp_c_ID),   
        .ALUSrc_o(AluSrc_c_ID),   
        .RegDst_o(RegDst_c_ID),   
        .Branch_o(Branch_c_ID),//要改成 1 bit 寬 
        .MemToReg_o(MemToReg_c_ID),
        .RegWrite_o(RegWrite_c_ID), 
        .MemRead_o(MemRead_c_ID),
        .MemWrite_o(MemWrite_c_ID)   
        );

Sign_Extend Sign_Extend(
        .data_i(instr_immdt),
        .data_o(immdt16_SE32)
        );

//ID stage END

//只需要把這三個欄位清空就不會有作用了
//PC能否寫入由decoder控制
MUX_2to1 #(.size(3)) ID_EX_pipeLineSrc(
    .data0_i({
        RegWrite_c,
        MemRead_c,
        MemWrite_c,
    }),
    .data1_i(3'b0),
    .select_i(),
    .data_o({
        RW_ID_muxOut,
        MR_ID_muxOut,
        MW_ID_muxOut
    })
);

        
//長度還沒定，hazard unit還沒寫所以write還沒接
Pipe_Reg #() ID_EX(
    .clk_i(clk_i),
    .write_data(),
    .in({   
        aluOpCode_ID,
        //control signals
        AluSrc_c_ID, 
        AluOp_c_ID,
        RegDst_c_ID,
        Branch_c_ID,
        MemToReg_c_ID,
        
        RW_ID_muxOut,
        MR_ID_muxOut, 
        MW_ID_muxOut,

        //data fields 
        pc_add4_ID,
        RF_outRS_ID,
        RF_outRT_ID,
        immdt16_SE32_ID, 
        instr_rs_ID,
        instr_rt_ID,
        instr_rd_ID,
        instr_funct_ID,
        instr_shamt_ID
    }),
    .out({
        pc_add4_EX,
        aluOpCode_EX,
        /*一堆decoder控制訊號*/
        AluSrc_c_EX,
        AluOp_c_EX,
        RegDst_c_EX,
        Branch_c_EX,
        MemToReg_c_EX,

        RegWrite_c_EX,
        MemRead_c_EX,
        MemWrite_c_EX,
        
        pc_add4_EX,
        RF_outRS_EX,
        RF_outRT_EX,
        immdt16_SE32_EX,
        instr_rs_EX,
        instr_rt_EX,
        instr_rd_EX,
        instr_funct_EX,
        instr_shamt_EX
    })
);



/**
EX stage : Execution  
*/
Mux_2to1 #( .size()) Mux_Write_Reg(
    .data0_i(instr_rt_EX),
    .data1_i(instr_rd_EX),
    .select_i( RegDst_c_EX ),
    .data_o( writeReg_addr_EX)
);

Shift_Left_Two_32 Shifter(
        .data_i(immdt16_SE32_EX),
        .data_o(shiftout)
        ); 		

Adder Branch_adder(
        .src1_i(pc_add4_EX),     
        .src2_i(shiftout),     
        .sum_o(branch_addr_EX)      
        );

//Forwarding control 
//還沒做好
Mux_3to1 #(.size(32)) Mux_ALUSrc1_forwarding(
    .data0_i( RF_outRS_EX),
    .data1_i( aluResult_MEM ),
    .data2_i( regWB_data ),
    .select_i(1'b0),// 訊號由forwarding unit 拉出來
    .data_o( aluSrc1)
);
Mux_3to1 #(.size(32)) Mux_ALUSrc2_forwarding(
    .data0_i( RF_outRT_EX ),
    .data1_i( aluResult_MEM),
    .data2_i( regWB_data ),
    .select_i(1'b0),// 訊號由forwarding unit 拉出來
    .data_o( aluSrc2_reg_EX)
);
MUX_2to1 #(.size(32)) Mux_ALUSrc2(
    .data0_i(aluSrc2_reg_EX),
    .data1_i(immdt16_SE32_EX),
    .select_i(AluSrc_c_EX),
    .data_o(aluSrc2)
);



// 在這裡應該還要有一個mux, 等做完 hazard detection跟 forwarding後再來想是幹嘛的

ALU_Ctrl AC(
        .funct_i(instr_funct_EX),   
        .ALUOp_i(AluOp_c_EX),   
        .ALUCtrl_o(aluOpCode_EX) 
        );


ALU ALU(//need to know PC +4 
        .src1_i(aluSrc1),
        .src2_i(aluSrc2),
        .ctrl_i(aluOpCode_EX),
        .result_o(aluResult_EX),
        .shamt( instr_shamt_EX),
        .pc_add4(pc_add4_EX),
        .zero_o(alu_zero_EX),
        );

//EX stage END 

//只需要把這三個欄位清空就不會有作用了
//PC能否寫入由decoder控制
MUX_2to1 #(.size(3)) EX_MEM_pipeLineSrc(
    .data0_i({
        RegWrite_c_EX,
        MemRead_c_EX,
        MemWrite_c_EX
    }),
    .data1_i(3'b0),
    .select_i(1'b0),
    .data_o({
        RW_EX_muxOut,
        MR_EX_muxOut,
        MW_EX_muxOut
    })
);

PipeLineReg #(.size(N)) EX_MEM(
    .clk(clk_i),
    .rst_i(),
    .data_i({   
        //control signals
        Branch_c_EX,
        MemToReg_c_EX,
        
        RW_EX_muxOut,
        MR_EX_muxOut, 
        MW_EX_muxOut,

        //data fields 
        aluResult_EX,
        alu_zero_EX,
        writeReg_addr_EX,
        aluSrc2_reg_EX,
        branch_addr_EX,
        instr_rs_EX,//感覺可能不需要，因為firwarding unit 應該不需要知道src
        instr_rt_EX,
        instr_rd_EX
    }),
    .data_o({
        /*decoder控制訊號*/
        Branch_c_MEM,
        MemToReg_c_MEM,

        RegWrite_c_MEM,
        MemRead_c_MEM,
        MemWrite_c_MEM,
        
        aluResult_MEM,
        alu_zero_MEM,
        writeReg_addr_MEM,
        aluSrc2_reg_MEM, 
        branch_addr_MEM,
        instr_rs_MEM,
        instr_rt_MEM,
        instr_rd_MEM
    })
);


/**
MEM stage : Memory 
*/
assign PCSrc = Branch_c_MEM & alu_zero_MEM; 

Data_Memory Data_Memory(
        .clk_i(clk_i),
        .addr_i(aluResult_MEM),
        .data_i(aluSrc2_reg_MEM),
        .MemRead_i( MemRead_c_MEM),
        .MemWrite_i(MemWrite_c_MEM),
        .data_o(MemRead_data_MEM)        
);

//MEM stage END 

Pipe_Reg #(.size(N)) MEM_WB(
    .clk_i(clk_i),
    .rst_i(1'b1),//還沒接
    .data_i({   
        //control signals
        MemRead_c_MEM,
        MemWrite_c_MEM,
        MemToReg_c_MEM,

        //data fields
        writeReg_addr_MEM, 
        MemRead_data_MEM,
        aluResult_MEM,
        //應該還要有一條訊號是送給 forwarding unit 的，但確切是哪一條忘記了，之後再補。
    }),
    .data_o({
        /*decoder控制訊號*/
        MemRead_c_WB,
        MemWrite_c_WB,
        MemToReg_c_WB,
        
        //data Fields 
        writeReg_addr_WB,
        MemRead_data_WB, 
        aluResult_WB,
    })
);


/**
WB stage : Write Back
*/

MUX_2to1 #(.size(32)) Mux_WriteBack(
    .data0_i(MemRead_data_WB),
    .data1_i(aluResult_WB),
    .select_i(MemToReg_c_WB),// 再改一下
    .data_o(regWB_data)
);

//WB stage END 

endmodule
                  


