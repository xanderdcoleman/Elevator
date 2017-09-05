`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2017 05:22:16 PM
// Design Name: 
// Module Name: elevatorTop
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


module elevatorTop(clk,reset,open_btn,close_btn,B1U,B2D,B2U,B3D,B3U,B4D,BF1,BF2,BF3,BF4,door,dir,state);
    input clk,reset,open_btn,close_btn,B1U,B2D,B2U,B3D,B3U,B4D,BF1,BF2,BF3,BF4;
    inout door, dir;
    inout [2:0] state;
    wire [9:0] resetButtons;
    wire openDoor, closeDoor, MoveCountDone, MoveCountEn;
    wire C1U,C2D,C2U,C3D,C3U,C4D,G1,G2,G3,G4;
    wire [7:0] seconds;
    assign seconds = 30;
    floorControl fc(clk,reset,openDoor,closeDoor,C1U,C2D,C2U,C3D,C3U,C4D,G1,G2,G3,G4,MoveCountDone,MoveCountEn,door,dir,state,resetButtons);
    buttonControl bc({B1U,B2D,B2U,B3D,B3U,B4D,BF1,BF2,BF3,BF4},reset,resetButtons,{C1U,C2D,C2U,C3D,C3U,C4D,G1,G2,G3,G4});
    doorControl dc(reset,clk,open_btn,open_btn,close_btn,door,openDoor,closeDoor);
    counter moveCount(reset,clk,MoveCountEn,MoveCountDone,seconds);
    
endmodule
