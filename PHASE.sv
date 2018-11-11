//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Phase
//     Date: 8/11/2018
//     Description of file: Phase for Nibbler
//----------------------------------------------------------------------------------------------

module PHASE (input logic clk,
              input logic reset,
              output logic phaseOut
              );



  always @ (posedge clk or posedge reset)
    begin//si esta en reset, se pone q en 0, si no, en el flanco positivo de clk se pasa d a q.
      if (reset)
        phaseOut <= 1'b0;
  	  else
        phaseOut <= ~phaseOut;
    end


endmodule
