//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Acumulador
//     Date: 8/11/2018
//     Description of file: Acumulador for Nibbler
//--------------------------------------------------------------------------------------------

module A (input logic clk,
          input logic reset,
          input logic notLoadA,
          input logic [4:0] ALU_Result,
          output logic [4:0] A_Result);


  always @ (posedge clk or posedge reset)
    begin//si esta en reset, se pone q en 0, si no, en el flanco positivo de clk se pasa d a q.
    if (reset)
      A_Result <= 5'b0;
    else if (~notLoadA)
      A_Result <= ALU_Result;
  	else
      A_Result <= A_Result;
    end


endmodule
