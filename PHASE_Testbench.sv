//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Pahse Testbench
//     Date: 8/11/2018
//     Description of file: Phase for Nibbler Testbench
//---------------------------------------------------------------------------------------------

`include "PHASE.sv"

module testbench();
  //Se declaran salidas y entradas
  logic clk, reset, phaseOut;
  //Se instancia el Flip Flop tipo JK a utilizar
  PHASE dut (clk, reset, phaseOut);

  initial
    begin
      //Se configura el display y monitor para observar tiempo, reset, clk, j, k y q
      $display("Tiempo\t\t\tReset \tCLK \tphaseOut ");
      $monitor("%d \t%b \t%b \t%b", $time, reset, clk, phaseOut);
      //Se inicializan variables
      reset = 0;
      clk = 0;


      // reset del flip flop
      #1 reset = 1;
      #1 reset = 0;
    end



  initial
    begin
      #80 $finish;
    end

  // señal de reloj
  always
    #5 clk = ~clk;

endmodule
