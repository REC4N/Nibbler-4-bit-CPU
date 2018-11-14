//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Nibbler
//     Date: 8/11/2018
//     Description of file: Nibbler funcional
//--------------------------------------------------------------------------------------------

`include "PC.sv"
`include "PROG_ROM.sv"
`include "FETCH.sv"
`include "FLAGS.sv"
`include "PHASE.sv"
`include "uROM.sv"
`include "ALU.sv"
`include "A.sv"
`include "RAM.sv"
`include "BUS_DRIVER.sv"
`include "IN.sv"

module NIBBLER (input logic clk,
                input logic reset,
                input logic [3:0] IN_0,
                input logic [3:0] IN_1,
                input logic [3:0] IN_2,
                output logic [3:0] OUT_0,
                output logic [3:0] OUT_1,
                output logic [3:0] OUT_2,
                output logic [3:0] A,
                output logic CARRY,
                output logic ZERO
                );

  wire [11:0] address, loadAddress;
  wire [7:0] programByte;
  wire [3:0] instruction, operand, ALU_Result, A_Result, data_bus;
  wire [4:0] ALU_Result_with_carry, A_Result_with_carry;
  wire [2:0] S;
  wire [1:0] flagsOut;
  wire incPC, notLoadPC,notLoadA,notLoadFlags,notCarryIn, or_notCsRAM, notCsRAM, phaseOut;
  wire notWeRAM, notOeALU, notOeIN, notOeOprnd, notLoadOut,  notZ, notC;
  logic enable_port_1, enable_port_2, enable_port_3;




  PC pc (clk, reset, notLoadPC, incPC, loadAddress, address);

  PROG_ROM prog_rom (address, programByte);

  FETCH fetch (programByte, clk, phaseOut, reset, instruction, operand);

  FLAGS flags (notC, notZ, reset, clk, notLoadFlags, flagsOut);

  PHASE phase1 (clk, reset, phaseOut);

  uROM micro_rom (instruction, clk, phaseOut, flagsOut, incPC, notLoadPC, notLoadA,
                  notLoadFlags, notCarryIn, S, notCsRAM, notWeRAM, notOeALU, notOeIN,
                  notOeOprnd, notLoadOut);

  ALU alu (notCarryIn, S, A_Result_with_carry, data_bus, notC, notZ, ALU_Result_with_carry);

  A acumulator(clk, reset, notLoadA ,ALU_Result_with_carry, A_Result_with_carry);

  RAM ram (.address_for_Ram(loadAddress), .notCsRAM(notCsRAM), .notWeRAM(notWeRAM), .data_bus(data_bus));

  BUS_DRIVER driver_for_operand (.a(operand), .enable(notOeOprnd), .y(data_bus));

  BUS_DRIVER driver_for_alu (.a(ALU_Result), .enable(notOeALU), .y(data_bus));

  IN entrada0 (.buttons(IN_0), .enable_port(enable_port_1), .data_bus(data_bus));

  IN entrada1 (.buttons(IN_1), .enable_port(enable_port_2), .data_bus(data_bus));

  IN entrada2 (.buttons(IN_2), .enable_port(enable_port_3), .data_bus(data_bus));

  assign {ALU_Result} = ALU_Result_with_carry;
  assign loadAddress = {operand, programByte};
  assign {A_Result} = A_Result_with_carry;


always @ ( ~notOeIN or IN_0 or IN_1 or IN_2 or reset)

  begin
    enable_port_1 = 0; enable_port_2 = 0; enable_port_3 = 0;
    if (notOeIN == 0)
      begin
        begin
          case (operand)
          4'b0000: begin enable_port_1 = 1; enable_port_2 = 0; enable_port_3 = 0; end
          4'b0001: begin enable_port_1 = 0; enable_port_2 = 1; enable_port_3 = 0; end
          4'b0010: begin enable_port_1 = 0; enable_port_2 = 0; enable_port_3 = 1; end
          default: begin enable_port_1 = 0; enable_port_2 = 0; enable_port_3 = 0; end
          endcase
        end
      end
  end



  assign A = A_Result;
  assign OUT_0 = enable_port_1;
  assign OUT_1 = 4'b0;
  ///assign OUT_2 = 4'b0;
  assign CARRY = ~notC;
  assign ZERO = ~notZ;







endmodule // NIBBLER
