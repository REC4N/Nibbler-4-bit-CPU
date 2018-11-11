//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Fetch Testbench
//     Date: 8/11/2018
//     Description of file: Fetch for Nibbler Testbench
//----------------------------------------------------------------------------------------------

`include "FETCH.sv"

module testbench();

  // entradas y salidas
  logic clk, reset, phase;
  logic [7:0] programByte;
  logic [3:0] instruction, operand;

  // se instancia maquina de estados finitos
  FETCH dut (programByte, clk, phase, reset, instruction, operand);

  // simulación
  initial
    begin

      // preparar la consola
      $display("Tiempo\t\t\tReset \tprogramByte \tclk \tfase \tinstruccion \toperando ");
      $monitor("%d \t%b \t%b \t%b \t%b \t%b \t\t%b", $time, reset, programByte, clk, phase, instruction, operand);

      // valores iniciales
      reset = 0;
      phase = 0;
      clk = 0;
      programByte = 0;


      // reset del PC
      #1 reset = 1;
      programByte = 8'b11001100;
      #1 reset = 0;


      // variación de las entradas
      #20 phase = 1;

      #20 phase = 0;
      #20 phase = 1;
      programByte = 8'b11110001;
      #20 phase = 0;
      programByte = 8'b0;



    end

  // fin de la simulación
  initial
    begin
      #140 $finish;
    end

  // señal de reloj
  always
    #5 clk = ~clk;

endmodule
