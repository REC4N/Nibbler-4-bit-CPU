//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Acumulador
//     Date: 8/11/2018
//     Description of file: Acumulador for Nibbler
//--------------------------------------------------------------------------------------------

module A (input logic clk,
          input logic reset,
          input logic [3:0] ALU_Result,
          output logic [3:0] A_Result);

  always @ (posedge clk or posedge reset)
    begin//si esta en reset, se pone q en 0, si no, en el flanco positivo de clk se pasa d a q.
    if (reset)
      A_Result <= 4'b0;
  	else
      A_Result <= ALU_Result;
    end


endmodule
