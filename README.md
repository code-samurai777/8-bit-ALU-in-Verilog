# 8-Bit ALU in Verilog

## Project Overview

This project implements an **8-bit Arithmetic Logic Unit (ALU)** in Verilog, designed in a **modular and professional style** suitable for digital design learning, simulation, and portfolio demonstration. The ALU supports a variety of **arithmetic, logical, and shift operations** and includes a **control unit** to emulate CPU-style operation selection.  

This project is built to be **interview-ready** and demonstrates:
- Modular Verilog design
- Status flags (Zero, Carry, Overflow, Negative)
- ALU control logic
- Testbench-driven simulation with waveform support
- Documentation and block diagrams for clarity

---

## Features

### Supported Operations
| Opcode | Operation | Description |
|--------|-----------|-------------|
| 000 | ADD | Adds A + B |
| 001 | SUB | Subtracts A - B |
| 010 | INC | Increment A by 1 |
| 011 | DEC | Decrement A by 1 |
| 100 | AND | Bitwise AND A & B |
| 101 | OR | Bitwise OR A \| B |
| 110 | XOR | Bitwise XOR A ^ B |
| 111 | NOT | Bitwise NOT ~A |

### Status Flags
- **Zero (Z):** Set if the result is zero  
- **CarryOut (C):** Set if arithmetic carry/borrow occurs  
- **Overflow (V):** Set if signed overflow occurs  
- **Negative (N):** Set if the result is negative (MSB=1)

---

## Design Details

The ALU is implemented in **three modular components**:

1. **alu_operations.v** – Implements arithmetic, logical, and shift operations  
2. **alu_control.v** – ALU Control Unit that maps opcode to ALU operation  
3. **alu.v** – Main ALU wrapper connecting operations and flags  

---

## Simulation

- The **testbench (alu_tb.v)** runs all operations and flags
- Generates **waveform file (`waveform.vcd`)** for GTKWave visualization
- Includes **pass/fail messages** in simulation console
- Supports **EDA Playground** or **ModelSim/Icarus Verilog**

---

## Waveform & Results

- Waveforms can be opened in **GTKWave** to verify:
  - Operations
  - Status flag behavior
  - Input/output relationship

- Screenshots of the waveform can be stored in `results/simulation_screenshot.png`  

## Author

Sarthak Omar
Electronics Engineering,
HBTU Kanpur(2027)
