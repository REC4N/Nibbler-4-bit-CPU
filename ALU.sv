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
          input logic [4:0] A_Result,
          input logic [N-1:0] data_bus,
          output logic notC,
          output logic notZ,
          output logic [4:0] ALU_Result_with_carry);

  logic [3:0] modeSelect;
  assign modeSelect = {notCarryIn, S [2:0]};
  logic [3:0] ALU_Result_without_carry;



  always @ (S or A_Result or data_bus or notCarryIn)

    begin
      casez (modeSelect)
        4'b1000: begin ALU_Result_with_carry = A_Result; if (ALU_Result_with_carry > 15) notC = 0;   else begin notC = 1; notZ= 1; end end
        4'b0001: begin ALU_Result_with_carry = A_Result; if(ALU_Result_with_carry > 15) notC = 0; end
        4'b?010: begin ALU_Result_with_carry = data_bus; notC = 1; notZ = 1; end
        4'b1011: begin ALU_Result_with_carry = A_Result + data_bus; if (ALU_Result_with_carry > 15) notC=0;  end
        4'b?100: begin ALU_Result_without_carry = ~(A_Result | data_bus);  ALU_Result_with_carry = ALU_Result_without_carry; end
      endcase
      notZ = |data_bus;
    end


endmodule
