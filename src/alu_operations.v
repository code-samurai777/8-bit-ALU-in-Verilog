module alu_operations(
    input [7:0] A,
    input [7:0] B,
    input [3:0] opcode,
    output reg [7:0] Result,
    output reg CarryOut,
    output reg Zero,
    output reg Overflow,
    output reg Negative
);
    reg [8:0] wide;
    always @(*) begin
        CarryOut = 0;
        Overflow = 0;
        Result = 0;
        case(opcode)
            4'b0000: begin // ADD
                wide = {1'b0,A}+{1'b0,B};
                Result = wide[7:0];
                CarryOut = wide[8];
                Overflow = (A[7]==B[7])&&(Result[7]!=A[7]);
            end
            4'b0001: begin // SUB
                wide = {1'b0,A}-{1'b0,B};
                Result = wide[7:0];
                CarryOut = wide[8];
                Overflow = (A[7]!=B[7])&&(Result[7]!=A[7]);
            end
            4'b0010: Result = A+1; // INC
            4'b0011: Result = A-1; // DEC
            4'b0100: Result = A & B; // AND
            4'b0101: Result = A | B; // OR
            4'b0110: Result = A ^ B; // XOR
            4'b0111: Result = ~A;    // NOT
            4'b1000: Result = A << 1; CarryOut = A[7]; // LSL
            4'b1001: Result = A >> 1; CarryOut = A[0]; // LSR
            4'b1010: Result = (A[7]) ? ({1'b1,A[7:1]}) : ({1'b0,A[7:1]}); // ASR
            4'b1111: Result = 8'b0; // Compare: flags only
            default: Result = 8'b0;
        endcase
        Zero = (Result==8'b0);
        Negative = Result[7];
    end
endmodule
