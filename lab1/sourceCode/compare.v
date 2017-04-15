//Student1 : 0411276 Chen-Yi-An 
//Student2 : 0413335 Kuo Yi Lin
module compare(
    input   less,
    input   equal,
    input   [3-1:0]comp,
    output  reg out
);

// L : Less 
// G : Great
// T : Than
// E : Equal
// n : Not 
// The naming arrangement is

//1. (LESS/Great)_(Than/Equal)
//2. (#/Not)_Equal 

parameter LT = 3'b000;
parameter GT = 3'b001;
parameter LE = 3'b010;
parameter GE = 3'b011;
parameter E  = 3'b110;
parameter nE = 3'b100;

//An explicit invalid value, in order to make compare always outptut 0.  
parameter INVALID = 3'b111;

always @(*)begin
  case(comp)
    LT: out <=  less & ~equal;
    GT: out <= ~less & ~equal;
    LE: out <=  less |  equal;
    GE: out <= ~less |  equal;
    E:  out <=  equal & ~less ;
    nE: out <= ~equal  ;
    INVALID: out <= 1'b0;
    default: out <= 1'b0;
  endcase 
end

endmodule 