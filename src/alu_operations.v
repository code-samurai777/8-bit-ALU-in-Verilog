module alu_operations (
    input [7:0] A, B,
    input [2:0] opcode,
    output reg [7:0] result,
    output reg carry_out, zero, overflow, negative
);
    always @(*) begin
        case (opcode)
            3'b000: {carry_out, result} = A + B;               // ADD
            3'b001: {carry_out, result} = A - B;               // SUB
            3'b010: result = A + 1;                            // INC
            3'b011: result = A - 1;                            // DEC
            3'b100: result = A & B;                            // AND
            3'b101: result = A | B;                            // OR
            3'b110: result = A ^ B;                            // XOR
            3'b111: result = ~A;                               // NOT
            default: result = 8'b00000000;
        endcase

        // Status Flags
        zero = (result == 8'b00000000);
        negative = result[7];
        carry_out = (opcode == 3'b000) ? (A + B > 8'hFF) : 0; // Carry for ADD
        overflow = (opcode == 3'b000) ? ((A[7] == B[7]) && (result[7] != A[7])) : 0; // Overflow for ADD
    end
endmodule
