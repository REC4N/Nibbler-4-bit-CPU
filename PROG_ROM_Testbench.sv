//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Program Memory Testbench
//     Date: 8/11/2018
//     Description of file: Program memory testbench for Nibbler
//-----------------------------------------------------------------------------------------------

`include "PROG_ROM.sv"

module testbench();

  logic [11:0] address;
  logic [7:0] programByte;
  integer i;

  PROG_ROM dut (address, programByte);

 initial begin
   address = 0;

   #10 $monitor ("address = %h, programByte = %h", address, programByte);
   for (i = 0; i <10; i = i +1 )
     begin
     #5 address = i;
   end
 end



endmodule
