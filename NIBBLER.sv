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

module NIBBLER (input logic clk,
                input logic reset,
                output logic [3:0] salida_acumulador,
                output logic reloj,
                output logic fase,
                output logic [11:0] prog,
                output logic [4:0] direccion,
                output logic notCarry,
                output logic notZero,
                output logic [11:0] carga
                );

  wire [11:0] address, loadAddress;
  wire [7:0] programByte;
  wire [3:0] instruction, operand, ALU_Result, A_Result;
  wire [4:0] ALU_Result_with_carry;
  wire [2:0] S;
  wire [1:0] flagsOut;
  wire incPC, notLoadPC,notLoadA,notLoadFlags,notCarryIn, notCsRAM, phaseOut;
  wire notWeRAM, notOeALU, notOeIN, notOeOprnd, notLoadOut,  notZ, notC;





  PC pc (clk, reset, notLoadPC, incPC, loadAddress, address);

  PROG_ROM prog_rom (address, programByte);

  FETCH fetch (programByte, clk, phaseOut, reset, instruction, operand);

  FLAGS flags (notC, notZ, reset, clk, notLoadFlags, flagsOut);

  PHASE phase1 (clk, reset, phaseOut);

  uROM micro_rom (instruction, clk, phaseOut, flagsOut, incPC, notLoadPC, notLoadA,
                  notLoadFlags, notCarryIn, S, notCsRAM, notWeRAM, notOeALU, notOeIN,
                  notOeOprnd, notLoadOut);

  ALU alu (notCarryIn, S, A_Result, operand, notOeALU, notC, notZ, ALU_Result_with_carry);

  A acumulador(clk, reset, ALU_Result, A_Result);

  assign {ALU_Result} = ALU_Result_with_carry;
  assign loadAddress = {operand, programByte};


  assign carga = loadAddress;
  assign salida_acumulador = ALU_Result;
  assign reloj = clk;
  assign fase = phaseOut;
  assign direccion = ALU_Result_with_carry;
  assign prog = address;
  assign notCarry = notC;
  assign notZero = notZ;





endmodule // NIBBLER
