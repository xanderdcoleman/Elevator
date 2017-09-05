`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2017 04:17:52 PM
// Design Name: 
// Module Name: floorControl
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


module floorControl(clk,reset,openDoor,closeDoor,C1U,C2D,C2U,C3D,C3U,C4D,G1,G2,G3,G4,MoveCountDone,MoveCountEn,door,dir,state,resetButtons); 
    input clk,reset,openDoor,closeDoor,C1U,C2D,C2U,C3D,C3U,C4D,G1,G2,G3,G4,MoveCountDone;
    output reg MoveCountEn,door,dir;
    output reg [2:0] state;
    output reg [9:0] resetButtons; //{C1U,C2D,C2U,C3D,C3U,C4D,G1,G2,G3,G4}
    
    //for dir (direction)
    parameter DOWN = 1'b0;
    parameter UP = 1'b1;
    
    //for state
    parameter FLOOR1 = 3'b000;
    parameter FLOOR1to2 = 3'b001;
    parameter FLOOR2 = 3'b010;
    parameter FLOOR2to3 = 3'b011;
    parameter FLOOR3 = 3'b100;
    parameter FLOOR3to4 = 3'b101;
    parameter FLOOR4 = 3'b110;
    
    //timing is a bit of an issue so maybe have a slowclock module to control the always block?
    //wire slowishclk;
	//slowishClock sc1(clk,reset,slowishclk);
	
    always @(posedge clk) begin
    if (reset)begin
        MoveCountEn <= 0;
        door <= 0;
        dir <= UP;
        state <= FLOOR1;
        resetButtons <= 0;
    end
    
    if (~reset & openDoor & ((state==FLOOR1) | (state==FLOOR2) | (state==FLOOR3) | (state==FLOOR4)))begin //we are stopped and there is a door open command (sensor or timer not done)
        MoveCountEn <= 0;
        door <= 1;
    end
    
    if (~reset & ~openDoor & closeDoor & ((state==FLOOR1) | (state==FLOOR2) | (state==FLOOR3) | (state==FLOOR4)))begin //someone wants to close the door, or the timer has finished
        MoveCountEn <= 0;
        door <= 0;
    end
    
    //UP logic when stopped
    //floor1
    if (~reset & ~openDoor & ~door & dir==UP & state==FLOOR1 & (C1U|G1))begin
        MoveCountEn <= 0;
        door <= 1;
        dir <= UP;
        state <= FLOOR1;
    end 
    if (~reset & ~openDoor & ~door & dir==UP & state==FLOOR1 & ~C1U & ~G1 & (C2D|C2U|C3D|C3U|C4D|G2|G3|G4))begin
        MoveCountEn <= 1;
        door <= 0;
        dir <= UP;
        state <= FLOOR1to2;
    end
    
    //floor2 
    if (~reset & ~openDoor & ~door & (dir==UP) & state==FLOOR2 & ~C2D & (C2U|G2))begin
        MoveCountEn <= 0;
        door <= 1;
        dir <= UP;
        state <= FLOOR2;
    end 
    if (~reset & ~openDoor & ~door & (dir==UP) & state==FLOOR2 & ~C2U & ~G2 & (C3D|C3U|C4D|G3|G4))begin
        MoveCountEn <= 1;
        door <= 0;
        dir <= UP;
        state <= FLOOR2to3;
    end    
    if (~reset & ~openDoor & ~door & (dir==UP) & state==FLOOR2 & C2D & ~C2U & ~C3D & ~C3U & ~C4D & ~G2 & ~G3 & ~G4 )begin
        MoveCountEn <= 0;
        door <= 1;
        dir <= DOWN;
        state <= FLOOR2;
    end 
    if (~reset & ~openDoor & ~door & (dir==UP) & state==FLOOR2 & ~C2D & ~C2U & ~C3D & ~C3U &  ~C4D & ~G2 & ~G3 & ~G4 & (C1U|G1))begin
        MoveCountEn <= 1;
        door <= 0;
        dir <= DOWN;
        state <= FLOOR1to2;
    end 
    
    //floor3
    if (~reset & ~openDoor & ~door & (dir==UP) & state==FLOOR3 & ~C3D & (C3U|G3))begin
        MoveCountEn <= 0;
        door <= 1;
        dir <= UP;
        state <= FLOOR3;
    end 
    if (~reset & ~openDoor & ~door & (dir==UP) & state==FLOOR3 & ~C3U & ~G3 & (C4D|G4))begin
        MoveCountEn <= 1;
        door <= 0;
        dir <= UP;
        state <= FLOOR3to4;
    end    
    if (~reset & ~openDoor & ~door & (dir==UP) & state==FLOOR3 & C3D & ~C3U & ~C4D & ~G3 & ~G4 )begin
        MoveCountEn <= 0;
        door <= 1;
        dir <= DOWN;
        state <= FLOOR3;
    end 
    if (~reset & ~openDoor & ~door & (dir==UP) & state==FLOOR3 & ~C3D & ~C3U & ~C4D & ~G3 & ~G4 & (C1U|C2D|C2U|G1|G2))begin
        MoveCountEn <= 1;
        door <= 0;
        dir <= DOWN;
        state <= FLOOR2to3;
    end
    //end up logic
    
    //DOWN logic when stopped
    //floor4
    if (~reset & ~openDoor & ~door & dir==DOWN & state==FLOOR4 & (C4D|G4))begin
        MoveCountEn <= 0;
        door <= 1;
        dir <= DOWN;
        state <= FLOOR4;
    end 
    if (~reset & ~openDoor & ~door & dir==DOWN & state==FLOOR4 & ~C4D & ~G4 & (C1U|C2D|C2U|C3D|C3U|G1|G2|G3))begin
        MoveCountEn <= 1;
        door <= 0;
        dir <= DOWN;
        state <= FLOOR3to4;
    end
    
    //floor3 
    if (~reset & ~openDoor & ~door & (dir==DOWN) & state==FLOOR3 & ~C3D & (C3D|G3))begin
        MoveCountEn <= 0;
        door <= 1;
        dir <= DOWN;
        state <= FLOOR3;
    end 
    if (~reset & ~openDoor & ~door & (dir==DOWN) & state==FLOOR3 & ~C3D & ~G3 & (C1U|C2D|C2U|G1|G2))begin
        MoveCountEn <= 1;
        door <= 0;
        dir <= DOWN;
        state <= FLOOR2to3;
    end    
    if (~reset & ~openDoor & ~door & (dir==DOWN) & state==FLOOR3 & ~C1U & ~C2D & ~C2U & ~C3D & C3U & ~G1 & ~G2 & ~G3)begin
        MoveCountEn <= 0;
        door <= 1;
        dir <= UP;
        state <= FLOOR3;
    end 
    if (~reset & ~openDoor & ~door & (dir==DOWN) & state==FLOOR3 & ~C1U & ~C2D & ~C2U & ~C3D & ~C3U & ~G1 & ~G2 & ~G3 & (C4D|G4))begin
        MoveCountEn <= 1;
        door <= 0;
        dir <= UP;
        state <= FLOOR3to4;
    end 
    
    //floor2
    if (~reset & ~openDoor & ~door & (dir==DOWN) & state==FLOOR2 & ~C2U & (C2D|G2))begin
        MoveCountEn <= 0;
        door <= 1;
        dir <= DOWN;
        state <= FLOOR2;
    end 
    if (~reset & ~openDoor & ~door & (dir==DOWN) & state==FLOOR2 & ~C2D & ~G2 & (C1U|G1))begin
        MoveCountEn <= 1;
        door <= 0;
        dir <= DOWN;
        state <= FLOOR1to2;
    end    
    if (~reset & ~openDoor & ~door & (dir==DOWN) & state==FLOOR2 & ~C1U & ~C2D & C2U & ~G1 & ~G2 )begin
        MoveCountEn <= 0;
        door <= 1;
        dir <= UP;
        state <= FLOOR2;
    end 
    if (~reset & ~openDoor & ~door & (dir==DOWN) & state==FLOOR2 & ~C1U & ~C2D & ~C2U & ~G1 & ~G2 & (C3D|C3U|C4D|G3|G4))begin
        MoveCountEn <= 1;
        door <= 0;
        dir <= UP;
        state <= FLOOR2to3;
    end
    //end down logic
        
    //in movement logic
    if(~reset & ~door & MoveCountDone==1 & state==FLOOR1to2 & dir==UP)begin
        MoveCountEn <= 0;
        dir <= UP;
        state <= FLOOR2;
    end
    if(~reset & ~door & MoveCountDone==1 & state==FLOOR1to2 & dir==DOWN)begin
            MoveCountEn <= 0;
            dir <= UP;
            state <= FLOOR1;
    end
    if(~reset & ~door & MoveCountDone==1 & state==FLOOR2to3 & dir==UP)begin
            MoveCountEn <= 0;
            dir <= UP;
            state <= FLOOR3;
    end
    if(~reset & ~door & MoveCountDone==1 & state==FLOOR2to3 & dir==DOWN)begin
            MoveCountEn <= 0;
            dir <= DOWN;
            state <= FLOOR2;
    end
    if(~reset & ~door & MoveCountDone==1 & state==FLOOR3to4 & dir==UP)begin
            MoveCountEn <= 0;
            dir <= DOWN;
            state <= FLOOR4;
    end
    if(~reset & ~door & MoveCountDone==1 & state==FLOOR3to4 & dir==DOWN)begin
                MoveCountEn <= 0;
                dir <= DOWN;
                state <= FLOOR3;
    end
    //end in movement logic
    
    
    //reset button signals after request is answered
    if(~reset & ~door & (state==FLOOR1|state==FLOOR2|state==FLOOR3|state==FLOOR4)) begin
        resetButtons <= 10'b0000000000;
    end
    
    if(~reset & ~closeDoor & door & dir==UP & state==FLOOR1) begin
        resetButtons <= 10'b1000001000;
    end
    if(~reset & ~closeDoor & door & dir==UP & state==FLOOR2) begin
            resetButtons <= 10'b0010000100;
    end
    if(~reset & ~closeDoor & door & dir==UP & state==FLOOR3) begin
            resetButtons <= 10'b0000100010;
    end
    if(~reset & ~closeDoor & door & dir==DOWN & state==FLOOR4) begin
        resetButtons <= 10'b0000010001;
    end
    if(~reset & ~closeDoor & door & dir==DOWN & state==FLOOR2) begin
            resetButtons <= 10'b0100000100;
    end
    if(~reset & ~closeDoor & door & dir==DOWN & state==FLOOR3) begin
            resetButtons <= 10'b0001000010;
    end
    //end reset button logic
    
    end //end always block

endmodule

