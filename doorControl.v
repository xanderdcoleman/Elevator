`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2017 04:16:20 PM
// Design Name: 
// Module Name: doorControl
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


module doorControl(reset,clk,door_sensor,open_btn,close_btn,door_state,openDoor,closeDoor);
	input reset, clk, door_sensor, open_btn, close_btn, door_state;
	output openDoor, closeDoor;
	wire count_done;
	wire [7:0] seconds;
	assign seconds = 8'd15;
	counter c1(reset,clk,door_state,count_done,seconds); //where door_state is enable
	assign openDoor = door_sensor | open_btn;
	assign closeDoor = count_done | close_btn;

endmodule
