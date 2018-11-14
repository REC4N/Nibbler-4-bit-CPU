//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: RAM
//     Date: 8/11/2018
//     Description of file: RAM for Nibbler
//--------------------------------------------------------------------------------------------

module RAM (input logic [11:0] address_for_Ram,      // 12-bit bus for address in RAM
            input logic notCsRAM,           // CHIP SELECT
            input logic notWeRAM,           // CHIP ENABLE
            inout logic [3:0] data_bus
            );

  logic [3:0] data_out;
  logic [3:0] mem [0:4095] ;

  assign data_bus = (~notCsRAM && notWeRAM) ? data_out : 4'bz;

  always @ ( address_for_Ram, notCsRAM, notWeRAM )
    begin
      if ( ~notCsRAM && ~notWeRAM)

        mem[address_for_Ram] = data_bus;
    end



  always @ ( address_for_Ram, notCsRAM, notWeRAM )
    begin
      if ( ~notCsRAM && notWeRAM)

        data_out = mem[address_for_Ram];
    end


endmodule
