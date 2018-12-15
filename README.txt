---------------------------------------------------------------------------------------------------------
-	Author: Edgar Alejandro Recancoj Pajarez							-
-	Proyect: Nibbler										-
-	README												-
-	Date: 8/11/2018											-
-     	**Credit for Steve Chamberlin on https://www.bigmessowires.com/nibbler/ for the design.**	-
---------------------------------------------------------------------------------------------------------

For a live demonstration of the Nibbler working, you need to download the whole proyect on your computer 
and run the file "Nibbler_Testbench.sv" on the CMD.

To do this, locate the path of the file and type the following commands on the CMD:
C:\put_the_path_of_the_folder_you_downloaded_here> iverilog -g2012 NIBBLER_Testbench.sv
C:\put_the_path_of_the_folder_you_downloaded_here> vvp a.out -vcd 

For the timing diagram of the Nibbler, type:
C:\put_the_path_of_the_folder_you_downloaded_here> gtkwave dump.vcd

