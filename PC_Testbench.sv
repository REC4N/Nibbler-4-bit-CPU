//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Program Counter Testbench
//     Date: 8/11/2018
//     Description of file: Testbench for Program Counter
//-----------------------------------------------------------------------------------------------

`include "PC.sv"

module testbench();

  // entradas y salidas
  logic clk, reset, notLoadPC;
  logic [11:0] loadAddress, address;

  // se instancia modulo
  PC dut (.clk(clk), .reset(reset), .notLoadPC(notLoadPC), .loadAddress(loadAddress), .address(address));

  // simulación
  initial
    begin

      // preparar la consola
      $display("Tiempo\t\t\tReset \tCLK \tnotLoadPC \t\tloadAddress \taddress ");
      $monitor("%d \t%b \t%b \t%b \t%b \t%b", $time, reset, clk, notLoadPC, loadAddress, address);

      // valores iniciales
      reset = 0;
      clk = 0;
      loadAddress = 0;
      notLoadPC = 0;

      // reset del PC
      #1 reset = 1;
      #1 reset = 0;

      // variación de las entradas
      #20 notLoadPC = 1;
      #2 loadAddress = 12'd128;
      #5 notLoadPC = 0;
      #20 reset = 1;
      #1 reset = 0;


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
