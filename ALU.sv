//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: ALU
//     Date: 8/11/2018
//     Description of file: ALU for Nibbler
//--------------------------------------------------------------------------------------------

module ALU #(parameter N = 4)
          (input  logic notCarryIn,
          input logic [2:0] S,
          input logic [N-1:0] A_Result,
          input logic [N-1:0] operand,
          input logic notOeALU,
          output logic notC,
          output logic notZ,
          output logic [N-1:0] ALU_Result);

  logic [3:0] modeSelect;
  assign modeSelect = {notCarryIn, S [2:0]};

  always @ (modeSelect)

    begin
      casez (modeSelect)
        4'b1000: begin ALU_Result = A_Result; notC = 1; notZ = 1; end
        4'b0001: begin ALU_Result = A_Result; if (A_Result - operand == 0) notZ=0; else notZ = 1;end
        4'b?010: begin ALU_Result = operand; notC = 1; notZ = 1; end
        4'b1011: begin ALU_Result = A_Result + operand; if (A_Result+operand > 15) notC=0; else if (ALU_Result == 0) notZ = 0; else begin notC = 1; notZ = 1; end end
        4'b?100: begin ALU_Result = ~(A_Result | operand); if (ALU_Result == 0) notZ=0; else notZ = 1; end
      endcase
    end

endmodule