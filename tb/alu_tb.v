`timescale 1ns/1ps
module alu_tb;
    reg [7:0] A, B;
    reg [3:0] instr;
    wire [7:0] Result;
    wire CarryOut, Zero, Overflow, Negative;

    // instantiate control and ALU
    wire [3:0] alu_op;
    alu_control ctrl(.instr(instr), .alu_op(alu_op));
    alu dut(.A(A), .B(B), .opcode(alu_op),
            .Result(Result),
            .CarryOut(CarryOut),
            .Zero(Zero),
            .Overflow(Overflow),
            .Negative(Negative));

    integer i;
    initial begin
        $dumpfile("results/waveform.vcd");
        $dumpvars(0, alu_tb);

        // deterministic tests
        A = 8'h0F; B = 8'h01; instr = 4'b0000; #5; // ADD
        A = 8'h10; B = 8'h01; instr = 4'b0001; #5; // SUB
        A = 8'hFF; B = 8'h00; instr = 4'b0100; #5; // AND
        A = 8'hF0; B = 8'h0F; instr = 4'b0101; #5; // OR
        A = 8'hAA; B = 8'h55; instr = 4'b0110; #5; // XOR
        A = 8'h0F; B = 8'h00; instr = 4'b0111; #5; // NOT

        // random tests
        for(i=0;i<50;i=i+1) begin
            A = $random; B = $random; instr = $random % 11; #2;
        end

        $display("ALU simulation complete.");
        $finish;
    end
endmodule
