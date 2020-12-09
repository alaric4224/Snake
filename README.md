# Snake
A Verilog for FPGA implementation of the classic snake game ("Nibbler") on VGA. The game is controlled with the arrow keys on a keyboard, outputs to VGA display, and displays the users current score on the on-board 7-segment display.

EC311 Project Team 13:
William Nilsen
Ivan Isakov
Erbyn Bonilla
Yoel Beyene

How to run our project - Download all .v files and the xdc constraints file. In Vivado, add all .v files to a project as design sources and the xdc file as a constraints source. Connect a compatible FPGA board (this project was created with the Nexys A7 in mind), and hook the FPGA up to both a USB keyboard input and a DIRECT VGA to monitor output.

Code Structure:
All of our code is connected by the top module "Snake"

Snake - Top module which connects all other modules and the constraints file
    
    clk_wiz_0 - Vivado supplied clock divider module, creates the standard 25.2 MHz VGA clock
    
    PS2Receiver - receives data from the connected keyboard
    
    decode - translates USB keyboard input into directional snake gameplay output
    
    vga_gen_two - generates hsync/vsync outputs and x/y positions for the VGA
    
    VGAmov - generates rgb output and animations for the game
        Clock-Divider - clock divider module
        appleLogic - generates pseudo-random objectives for the player
        game_over - logic to display the game over screen if a loss occurs
    
    top - top module for the 7-segment display controls
        clock_divider - another clock divider module
        refreshcounter - refresh counter for 7-segment display
        anode_control - turns on displays based on refresh counter
        BCD_control - decoder for score input
        BCD_to_Cathodes - uses encoding from BCD_control to output to 7-segment display
