module alu(
    input [7:0] A,
    input [7:0] B,
    input [3:0] opcode,
    output [7:0] Result,
    output CarryOut,
    output Zero,
    output Overflow,
    output Negative
);
    alu_operations alu_inst(
        .A(A),
        .B(B),
        .opcode(opcode),
        .Result(Result),
        .CarryOut(CarryOut),
        .Zero(Zero),
        .Overflow(Overflow),
        .Negative(Negative)
    );
endmodule
