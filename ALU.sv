//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: ALU
//     Date: 8/11/2018
//     Description of file: ALU for Nibbler
//--------------------------------------------------------------------------------------------

module ALU #(parameter N = 4)
          (
            input  logic notCarryIn,
          input logic [2:0] S,
          input logic [3:0] A_Result,
          input logic [N-1:0] data_bus,
          output logic notC,
          output logic notZ,
          output logic [3:0] ALU_Result_without_carry);

  logic [3:0] modeSelect;
  assign modeSelect = {notCarryIn, S [2:0]};
  logic [4:0] ALU_Result_with_carry;
  assign ALU_Result_without_carry = ALU_Result_with_carry[3:0];



  always @ (S or A_Result or data_bus or notCarryIn)
  begin
    casez (modeSelect)
      4'b1000: begin ALU_Result_with_carry = A_Result; end
      4'b0001: begin ALU_Result_with_carry = A_Result - data_bus; end
      4'b?010: begin ALU_Result_with_carry = data_bus; end
      4'b1011: begin ALU_Result_with_carry = A_Result + data_bus; ; end
      4'b?100: begin ALU_Result_with_carry = ~(A_Result | data_bus)-16;  end
      default: begin ALU_Result_with_carry = ALU_Result_with_carry; end
    endcase

    notC = ~ALU_Result_with_carry [4];
    notZ =
    ALU_Result_with_carry[3] | ALU_Result_with_carry[2] | ALU_Result_with_carry[1]
    | ALU_Result_with_carry[0];


  end



endmodule
