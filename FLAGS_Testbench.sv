//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Flags Testbench
//     Date: 8/11/2018
//     Description of file: Flags for Nibbler Testbench
//---------------------------------------------------------------------------------------------

`include "FLAGS.sv"

module testbench();
  //Se declaran salidas y entradas
  logic clk, reset, notC, notZ;
  logic [1:0] flagsOut;

  FLAGS dut (notC, notZ, reset, clk, flagsOut);

  initial
    begin
      //Se configura el display y monitor para observar tiempo, reset, clk, j, k y q
      $display("Tiempo\t\t\tReset \tCLK \tC \tZ \tflagsOut");
      $monitor("%d \t%b \t%b \t%b \t%b \t%b", $time, reset, clk, notC, notZ, flagsOut);
      //Se inicializan variables
      reset = 0;
      clk = 0;
      notC = 0;
      notZ = 0;

      #1 reset = 1;
      #1 reset = 0;

      //DAF
      #20 notC = 1;
      #20 notZ = 1;
      #5 notC = 0;

      #20 reset = 1;
      #1 reset = 0;
      #20 notZ = 1;

    end


  initial
    begin
      #80 $finish;
    end

  // señal de reloj
  always
    #5 clk = ~clk;



endmodule
