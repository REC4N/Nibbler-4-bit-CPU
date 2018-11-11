//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Flags
//     Date: 8/11/2018
//     Description of file: Flags for Nibbler
//----------------------------------------------------------------------------------------------

module FLAGS(input logic notC,
  			     input logic notZ,
  			     input logic reset,
  			     input logic clk,
             input logic notLoadFlags,
  			     output logic [1:0] flagsOut
			       );

  always @ (posedge clk, posedge reset)

    begin

      if(reset)
        flagsOut <= 2'b0;
      else if (notLoadFlags)
        flagsOut <= {notC,notZ};
      else
        flagsOut <= flagsOut;

    end

endmodule
