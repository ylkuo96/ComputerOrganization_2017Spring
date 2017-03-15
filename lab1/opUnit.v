module opUnit(
    output wire result,
    output wire carryout,
    input wire [31:0]a,b,
    input wire carryin,
    input wire less, 
);


parameter ALU_AND = 4'b0000;
parameter ALU_OR  = 4'b0001;
parameter ALU_ADD = 4'b0010;
parameter ALU_SUB = 4'b0110;
parameter ALU_NOR = 4'b1100;
parameter ALU_NAND = 4'b1101;
parameter ALU_SLT = 4'b0111;


endmodule
