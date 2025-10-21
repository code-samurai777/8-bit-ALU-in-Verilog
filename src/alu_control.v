module alu_control(
    input [3:0] instr,
    output [3:0] alu_op
);
    assign alu_op = instr; 
endmodule
