//-----------------------------------------------------------------------------------------------
//     Author: Edgar Alejandro Recancoj Pajarez
//     Proyect: Nibbler
//     Module: Nibbler Testbench
//     Date: 8/11/2018
//     Description of file: Nibbler funcional Testbench
//--------------------------------------------------------------------------------------------


`include "NIBBLER.sv"

module nibbler_testbench();
  //Se declaran salidas y entradas
  logic clk, reset, CARRY, ZERO;
  logic [3:0] IN_0, IN_1, IN_2, OUT_0, OUT_1, OUT_2, A;


  NIBBLER dut (.clk(clk), .reset(reset), .IN_0(IN_0), .IN_1(IN_1),
              .IN_2(IN_2), .OUT_0(OUT_0), .OUT_1(OUT_1), .OUT_2(OUT_2),
              .A(A), .CARRY(CARRY), .ZERO(ZERO));

  initial
    begin
      //Se configura el display y monitor para observar tiempo, reset, clk, j, k y q
      $display("TIME\t\t\tRESET \tCLOCK \tACUMULATOR \tZERO \tCARRY \tIN0 \tIN1 \tIN2 \tOUT0 \tOUT1 \tOUT2");

      $monitor("%d \t%b \t%b \t%b \t\t%b \t%b \t%b \t%b \t%b \t%b \t%b \t%b", $time, reset, clk, A, ZERO, CARRY, IN_0, IN_1, IN_2, OUT_0, OUT_1, OUT_2);


      //Se inicializan variables
      reset = 0;
      clk = 0;

      #1 reset = 1;
      #1 reset = 0;

    end


  initial
    begin
      #600 $finish;
    end

  // señal de reloj
  always
    #5 clk = ~clk;


    initial
      begin
        $dumpfile("dump.lxt2");
        $dumpvars(1);
      end

endmodule
