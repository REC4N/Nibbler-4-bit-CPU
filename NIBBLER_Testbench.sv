//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Nibbler Testbench
//     Date: 8/11/2018
//     Description of file: Nibbler funcional Testbench
//--------------------------------------------------------------------------------------------

//OJO: ESTE ES EL CODIGO QUE SE DEBE DE COMPILAR. EL RESULTADO EN CONSOLA VA A HACER
//EL RESULTADO DE LAS SIGUIENTES OPERACIONES (QUE ESTAN EN LA PROG MEMORY)
//0100_0000	// LIT 0
//0100_0100	// LIT 1
//0100_0000	// LIT 0
//0100_1111	// LIT 15
//1110_1111	// NORI 15
//1010_0001	// ADDI 1
//0010_0001	// COMPI 1


`include "NIBBLER.sv"

module nibbler_testbench();
  //Se declaran salidas y entradas
  logic clk, reset, fase,  notCarry, notZero;
  logic [3:0] salida_acumulador;
  logic [7:0] prog;
  logic [11:0] direccion;

  NIBBLER dut (clk, reset, salida_acumulador, reloj, fase, prog ,direccion, notCarry, notZero);

  initial
    begin
      //Se configura el display y monitor para observar tiempo, reset, clk, j, k y q
      $display("Tiempo\t\t\tsalida_acumulador \treloj \t\tfase \tnotCarry \tnotZero \t\tdireccion \t\tprog");
      $monitor("%d \t%b \t\t\t%b \t\t%b \t%b \t\t%b \t\t%b \t\t%b", $time, salida_acumulador, reloj, fase , notCarry, notZero, direccion, prog);
      //Se inicializan variables
      reset = 0;
      clk = 0;

      #1 reset = 1;
      #1 reset = 0;


    end


  initial
    begin
      #20 $finish;
    end

  // señal de reloj
  always
    #5 clk = ~clk;

endmodule