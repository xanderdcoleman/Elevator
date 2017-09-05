`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2017 05:36:52 PM
// Design Name: 
// Module Name: elevatorTop_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module elevatorTop_tb;
   reg clk,reset,door_sensor,open_btn,close_btn,B1U,B2D,B2U,B3D,B3U,B4D,BF1,BF2,BF3,BF4;
   wire door,dir;
   wire [2:0] state;

   elevatorTop UUT(clk,reset,door_sensor,open_btn,close_btn,B1U,B2D,B2U,B3D,B3U,B4D,BF1,BF2,BF3,BF4,door,dir,state);
   
   always #5 clk = ~clk;
   
   initial begin
        $monitor("%d state=%d dir=%d door=%d",$time,state,dir,door);
        clk = 0; reset = 0;
        door_sensor = 0; open_btn = 0; close_btn = 0; 
        B1U = 0; B2D = 0; B2U = 0; B3D = 0; B3U = 0; B4D = 0; 
        BF1 = 0; BF2 = 0; BF3 = 0; BF4 = 0;
        #10 reset = 1;
        #20 reset = 0;
        #30 B1U = 1;
        #200 B1U = 0;
        #300 BF4 = 1;
        #200 BF4 = 0;
        #1000 B2D = 1;
        #200 B2D = 0;
        #1000 $finish;
   end

endmodule
