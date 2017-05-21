module PipeLineReg #(parameter WIDTH=1)
(
    input clk;
    input write_data; 
    input       [WIDTH-1:0]in;
    output reg  [WIDTH-1:0]out;
);
// The PipeLineReg only update data iff write_data=1
//   otherwise, it would hold the current value;

always @( posedge clk ) begin
    out <= (write_data==1) ? in : out; 
end

endmodule 