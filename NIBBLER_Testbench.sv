`include "NIBBLER.sv"

module testbench();
logic clk = 1, reset;
logic [3:0] PUSHBUTTONS0, PUSHBUTTONS1, PUSHBUTTONS2;
logic PHASE, C_FLAG, Z_FLAG;
logic [3:0] INSTR, OPERAND, DATA_BUS, ACCU, PORT0, PORT1, PORT2;
logic [7:0] PROGRAM_BYTE;
logic [11:0] PC, ADDRESS_RAM;
real points = 0;

  NIBBLER dut(.clk(clk), .reset(reset), .IN_0(PUSHBUTTONS0), .IN_1(PUSHBUTTONS1), .IN_2(PUSHBUTTONS2),
     .CARRY(C_FLAG), .ZERO(Z_FLAG),
     .OUT_0(PORT0), .OUT_1(PORT1), .OUT_2(PORT2), .A(ACCU));





     initial begin
       reset = 0;
       #1 reset = 1;
       #1 reset = 0;
       PUSHBUTTONS0 = 4'b0110;
       PUSHBUTTONS1 = 4'b0100;
       PUSHBUTTONS2 = 4'b0001;
       //$display("\t\ttime:\tphase:\tPC:\tProgramByte:\tInstr:\tOprnd:\tRAM Addr:\tData Bus:\tAccu:\tC:\tZ:\tOut:\tIn:\t");
       //$monitor("%d\t%b\t%h\t%b\t%b\t%b\t%b\t%b\t\t%b\t%b\t%b\t%b\t%b", $time, PHASE, PC, PROGRAM_BYTE, INSTR, OPERAND, ADDRESS_RAM, DATA_BUS, ACCU, C_FLAG, Z_FLAG, FF_OUT, PUSHBUTTONS);
     end
     initial
       begin
     	  $dumpfile("dump.vcd");
     	  $dumpvars(1);
       end

     initial
       #1000 $finish;

     always
       #5 clk = ~clk;

     always @ (clk) begin
       case ($time)
         30: begin
           if (ACCU === 4'b1001) begin
             points = points + 5; $display("LIT funciona bien. Nota : %d", points); end
           else
             $display("LIT NO funciona bien. Nota: %d", points);
         end
         50: begin
           if (ACCU === 4'b1010) begin
             points = points + 5; $display("ADDI funciona bien. Nota : %d", points); end
           else
             $display("ADDI NO funciona bien. Nota: %d", points);
         end
         70: begin
           if (ACCU === 4'b0101) begin
             points = points + 5; $display("NORI funciona bien. Nota : %d", points); end
           else
             $display("NORI NO funciona bien. Nota: %d", points);
         end
         110: begin
           if (Z_FLAG === 1) begin
             points = points + 10; $display("CMPI & Z_FLAG funcionan bien. Nota: %d", points);
             $display("Felicitaciones! Todas las instrucciones con literales funcionan :)");
           end
           else
             $display("CMPI & Z_FLAG NO funcionan bien. Nota: %d", points);
         end
         150: begin
           if (ACCU === 4'b0000 && C_FLAG === 1) begin
             points = points + 5; $display("C_FLAG funciona bien. Nota : %d", points);
             $display("Felicitaciones! Todas las banderas funcionan bien! :D");
           end
           else
             $display("C_FLAG NO funciona bien. Nota: %d", points);
         end
         230: begin
         if (ACCU === 4'b1111) begin
           points = points + 15; $display("RAM (ST & LD) funciona bien. Nota : %d", points);
         end
         else
           $display("RAM (ST & LD) NO funciona bien. Nota: %d", points);
       end
         270: begin
           if (PORT0 === 4'b1000)
             $display("PORT0 funciona bien.");
           else
             $display("PORT0 NO funciona bien.");
         end
         310: begin
           if (PORT1 === 4'b0110)
             $display("PORT1 funciona bien.");
           else
             $display("PORT1 NO funciona bien.");
         end
         350: begin
           if (PORT2 === 4'b0001) begin
             points = points + 10; $display("PORT2 funciona bien. Nota: %d", points); end
           else
             $display("PORT2 NO funciona bien.");
         end
         370: begin
           if (ACCU === 4'b0110)
             $display("IN0 funciona bien.");
           else
             $display("IN0 NO funciona bien.");
         end
         390: begin
           if (ACCU === 4'b0100)
             $display("IN1 funciona bien.");
           else
             $display("IN1 NO funciona bien.");
         end
         410: begin
           if (ACCU === 4'b0001) begin
             points = points + 10; $display("IN2 funciona bien. Nota: %d", points); end
           else
             $display("IN2 NO funciona bien.");
         end
         470: begin
           if (ACCU === 4'b0000 && Z_FLAG === 1 && C_FLAG === 1) begin
             points = points + 5; $display("ADDM funciona bien. Nota: %d", points); end
           else
             $display("ADDM NO funciona bien.");
         end
         510: begin
           if (ACCU === 4'b0110) begin
             points = points + 5; $display("NORM funciona bien. Nota: %d", points); end
           else
             $display("NORM NO funciona bien.");
         end
         530: begin
           if (Z_FLAG === 0) begin
             $display("CMPM parece funcionar bien. Nota: %d", points); end
           else
             $display("CMPM NO funciona bien.");
         end
         570: begin
           if (Z_FLAG === 1) begin
             points = points + 5; $display("CMPM funciona bien. Nota: %d", points); end
           else
             $display("CMPM NO funciona bien.");
         end
         610: begin
           if (ACCU === 4'b1010) begin
             points = points + 4; $display("JMP funciona bien. Nota: %d", points); end
           else
             $display("JMP NO funciona bien.");
         end
         650: begin
           if (ACCU === 4'b1011) begin
             points = points + 4; $display("JNC funciona bien. Nota: %d", points); end
           else
             $display("JNC NO funciona bien.");
         end
         690: begin
           if (ACCU === 4'b1100) begin
             points = points + 4; $display("JNZ funciona bien. Nota: %d", points); end
           else
             $display("JNZ NO funciona bien.");
         end
         750: begin
           if (ACCU === 4'b0001) begin
             points = points + 4; $display("JZ funciona bien. Nota: %d", points); end
           else
             $display("JZ NO funciona bien.");
         end
         810: begin
           if (ACCU === 4'b0010) begin
             points = points + 4; $display("JC funciona bien. Nota: %d", points); end
           else
             $display("JC NO funciona bien.");
         end
       endcase
     end
   endmodule
