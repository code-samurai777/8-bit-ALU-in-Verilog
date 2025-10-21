module alu_tb;
    reg [2:0] opcode;
    wire [7:0] result;
    wire carry_out, zero, overflow, negative;

    alu_control uut (
        .opcode(opcode),
        .result(result),
        .carry_out(carry_out),
        .zero(zero),
        .overflow(overflow),
        .negative(negative)
    );

    initial begin
        // Test ADD operation
        opcode = 3'b000; #10;
        // Test SUB operation
        opcode = 3'b001; #10;
        // Test AND operation
        opcode = 3'b100; #10;
        // Test OR operation
        opcode = 3'b101; #10;
        // Test XOR operation
        opcode = 3'b110; #10;
        // Test NOT operation
        opcode = 3'b111; #10;
        $finish;
    end
endmodule
