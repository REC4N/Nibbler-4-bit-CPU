//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Fetch
//     Date: 8/11/2018
//     Description of file: Fetch for Nibbler
//-----------------------------------------------------------------------------------------------

module FETCH(
  		input logic [7:0] programByte,
  		input logic clk,
  		input logic phaseOut,
  		input logic reset,
  		output logic [3:0] instruction,
  		output logic [3:0] operand
		);

  always @ (posedge clk , posedge reset)
    begin
    	if(reset)
        {instruction, operand}<= 8'b0;
	      else if (~phaseOut)
        {instruction, operand} <= programByte;
		    else
        {instruction, operand} <= {instruction, operand};


end

endmodule
