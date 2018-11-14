//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: RAM
//     Date: 8/11/2018
//     Description of file: RAM for Nibbler
//--------------------------------------------------------------------------------------------

module BUS_DRIVER (input logic [3:0] a,
                  input logic enable,
                  output tri [3:0] y
                  );

  assign y = ~enable ? a : 4'bz;


endmodule
