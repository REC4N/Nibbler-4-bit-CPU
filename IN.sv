//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: IN
//     Date: 8/11/2018
//     Description of file: IN for Nibbler
//--------------------------------------------------------------------------------------------

module IN (input logic [3:0] buttons,
          input logic enable_port,
          output tri [3:0] data_bus
          );

  assign data_bus = enable_port ? buttons : 4'bz;


endmodule
