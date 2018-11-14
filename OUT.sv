//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: output
//     Date: 8/11/2018
//     Description of file: Output module for Nibbler
//--------------------------------------------------------------------------------------------

module OUT (input logic clk,
          input logic reset,
          input logic enableOut,
          input logic [3:0] data_bus,
          output logic [3:0] data_out);


  always @ (posedge clk or posedge reset)
    begin//si esta en reset, se pone q en 0, si no, en el flanco positivo de clk se pasa d a q.
    if (reset)
      data_out <= 4'b0;
    else if (enableOut)
      data_out <= data_bus;
  	else
      data_out <= data_out;
    end


endmodule
