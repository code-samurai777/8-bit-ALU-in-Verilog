module alu_control (
    input [2:0] opcode,
    output reg [7:0] result,
    output reg carry_out, zero, overflow, negative
);
    wire [7:0] A = 8'b00000001; // Example operand A
    wire [7:0] B = 8'b00000001; // Example operand B

    alu_operations alu_inst (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .carry_out(carry_out),
        .zero(zero),
        .overflow(overflow),
        .negative(negative)
    );
endmodule
