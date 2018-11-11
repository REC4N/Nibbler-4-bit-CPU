//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Program Counter
//     Date: 8/11/2018
//     Description of file: Program counter for Nibbler
//-----------------------------------------------------------------------------------------------

module PC #(parameter N = 12)
        (input logic clk, // clock signal
   			input logic reset,  // reset
        input logic notLoadPC,  //signal control for loading a value to program counter
        input logic incPC,
        input logic [N-1:0] loadAddress,  // address to be loaded if /loadPC is 0
   			output logic [N-1:0] address);  // address for Program Memory

  always @ (posedge clk)
    begin
      if(~notLoadPC)
        address <= loadAddress;
      else if (incPC)
        address <= address + 1;
      else
        address <= address;
    end

  always @ (posedge reset)    // Asynchronous reset
      address <= 0;

endmodule
