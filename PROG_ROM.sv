//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Program Memory
//     Date: 8/11/2018
//     Description of file: Program memory for Nibbler
//-----------------------------------------------------------------------------------------------

module PROG_ROM (
        input [11: 0] address , // Address input
        output [7:0] programByte     // Data output
        );


  logic [11:0] mem [0:4095] ;

  assign programByte = mem[address];

initial begin
  $readmemb("PROG_ROM_INSTRUCTIONS.txt", mem); // memory_list is memory file
end

endmodule
