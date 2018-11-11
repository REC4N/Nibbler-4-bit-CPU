//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: uRom
//     Date: 8/11/2018
//     Description of file: uRom for Nibbler
//----------------------------------------------------------------------------------------------

module uROM(
  		input logic [3:0] instruction,
  		input logic clk,
  		input logic phaseOut,
  		input logic [1:0] flagsOut,
  		output logic incPC,
  		output logic notLoadPC,
      output logic notLoadA,
      output logic notLoadFlags,
      output logic notCarryIn,
      output logic [2:0] S,
      output logic notCsRAM,
      output logic notWeRAM,
      output logic notOeALU,
      output logic notOeIN,
      output logic notOeOprnd,
      output logic notLoadOut
		);

    logic [6:0] instr;
    assign instr = {instruction [3:0] , flagsOut [1:0] , phaseOut};

  always @ (instr)
    begin
      casez (instr)
      7'b????_??0:    //any
        begin
          incPC = 1;
          notLoadPC = 1;
          notLoadA = 1;
          notLoadFlags = 1;
          notCarryIn = 1;
          S = 3'b000;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 0;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b0000_0?1:   //JC
        begin
          incPC = 0;
          notLoadPC = 0;
          notLoadA = 1;
          notLoadFlags = 1;
          notCarryIn = 1;
          S = 3'b000;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 0;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b0000_1?1:   //JC
        begin
          incPC = 1;
          notLoadPC = 1;
          notLoadA = 1;
          notLoadFlags = 1;
          notCarryIn = 1;
          S = 3'b000;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 0;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b0001_0?1:   //JNC
        begin
          incPC = 1;
          notLoadPC = 1;
          notLoadA = 1;
          notLoadFlags = 1;
          notCarryIn = 1;
          S = 3'b000;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 0;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b0001_1?1:   //JNC
        begin
          incPC = 0;
          notLoadPC = 0;
          notLoadA = 1;
          notLoadFlags = 1;
          notCarryIn = 1;
          S = 3'b000;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 0;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b0010_??1:   //CMPI
        begin
          incPC = 0;
          notLoadPC = 1;
          notLoadA = 1;
          notLoadFlags = 0;
          notCarryIn = 0;
          S = 3'b001;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 1;
          notOeIN = 1;
          notOeOprnd = 0;
          notLoadOut = 1;
        end

      7'b0010_??1:   //CMPI
        begin
          incPC = 0;
          notLoadPC = 1;
          notLoadA = 1;
          notLoadFlags = 0;
          notCarryIn = 0;
          S = 3'b001;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 1;
          notOeIN = 1;
          notOeOprnd = 0;
          notLoadOut = 1;
        end

      7'b0011_??1:   //CMPM
        begin
          incPC = 1;
          notLoadPC = 1;
          notLoadA = 1;
          notLoadFlags = 0;
          notCarryIn = 0;
          S = 3'b001;
          notCsRAM = 0;
          notWeRAM = 1;
          notOeALU = 1;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b0100_??1:   //LIT
        begin
          incPC = 0;
          notLoadPC = 1;
          notLoadA = 0;
          notLoadFlags = 0;
          notCarryIn = 0;
          S = 3'b010;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 1;
          notOeIN = 1;
          notOeOprnd = 0;
          notLoadOut = 1;
        end

      7'b0101_??1:   //IN
        begin
          incPC = 0;
          notLoadPC = 1;
          notLoadA = 0;
          notLoadFlags = 0;
          notCarryIn = 0;
          S = 3'b010;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 1;
          notOeIN = 0;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b0110_??1:   //LD
        begin
          incPC = 1;
          notLoadPC = 1;
          notLoadA = 0;
          notLoadFlags = 0;
          notCarryIn = 0;
          S = 3'b010;
          notCsRAM = 0;
          notWeRAM = 1;
          notOeALU = 1;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b0111_??1:   //ST
        begin
          incPC = 1;
          notLoadPC = 1;
          notLoadA = 1;
          notLoadFlags = 1;
          notCarryIn = 1;
          S = 3'b000;
          notCsRAM = 0;
          notWeRAM = 0;
          notOeALU = 0;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b1000_?01:   //JZ
        begin
          incPC = 0;
          notLoadPC = 0;
          notLoadA = 1;
          notLoadFlags = 1;
          notCarryIn = 1;
          S = 3'b000;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 0;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b1000_?11:   //JZ
        begin
          incPC = 1;
          notLoadPC = 1;
          notLoadA = 1;
          notLoadFlags = 1;
          notCarryIn = 1;
          S = 3'b000;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 0;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b1001_?01:   //JNZ
        begin
          incPC = 1;
          notLoadPC = 1;
          notLoadA = 1;
          notLoadFlags = 1;
          notCarryIn = 1;
          S = 3'b000;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 0;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b1001_?11:   //JNZ
        begin
          incPC = 0;
          notLoadPC = 0;
          notLoadA = 1;
          notLoadFlags = 1;
          notCarryIn = 1;
          S = 3'b000;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 0;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b1010_??1:   //ADDI
        begin
          incPC = 0;
          notLoadPC = 1;
          notLoadA = 0;
          notLoadFlags = 0;
          notCarryIn = 1;
          S = 3'b011;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 1;
          notOeIN = 1;
          notOeOprnd = 0;
          notLoadOut = 1;
        end

      7'b1011_??1:   //ADDM
        begin
          incPC = 1;
          notLoadPC = 1;
          notLoadA = 0;
          notLoadFlags = 0;
          notCarryIn = 1;
          S = 3'b011;
          notCsRAM = 0;
          notWeRAM = 1;
          notOeALU = 1;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b1100_??1:   //JMP
        begin
          incPC = 0;
          notLoadPC = 0;
          notLoadA = 1;
          notLoadFlags = 1;
          notCarryIn = 1;
          S = 3'b000;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 0;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end

      7'b1101_??1:   //OUT
        begin
          incPC = 0;
          notLoadPC = 1;
          notLoadA = 1;
          notLoadFlags = 1;
          notCarryIn = 1;
          S = 3'b000;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 0;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 0;
        end

      7'b1110_??1:   //NORI
        begin
          incPC = 0;
          notLoadPC = 1;
          notLoadA = 0;
          notLoadFlags = 0;
          notCarryIn = 0;
          S = 3'b100;
          notCsRAM = 1;
          notWeRAM = 1;
          notOeALU = 1;
          notOeIN = 1;
          notOeOprnd = 0;
          notLoadOut = 1;
        end

      7'b1111_??1:   //NORM
        begin
          incPC = 1;
          notLoadPC = 1;
          notLoadA = 0;
          notLoadFlags = 0;
          notCarryIn = 0;
          S = 3'b100;
          notCsRAM = 0;
          notWeRAM = 1;
          notOeALU = 1;
          notOeIN = 1;
          notOeOprnd = 1;
          notLoadOut = 1;
        end
      endcase
  end


endmodule
