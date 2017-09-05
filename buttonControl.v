`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2017 04:16:20 PM
// Design Name: 
// Module Name: buttonControl
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


module buttonControl(buttons,resetAll,resetSome,signals);
	input resetAll; //1 bit
	input [9:0] buttons; //each bit represents one of the floor request buttons
	input [9:0] resetSome;
	output [9:0] signals;
	wire [9:0] reset;
	
	or g0(reset[0],resetAll,resetSome[0]);
	or g1(reset[1],resetAll,resetSome[1]);
	or g2(reset[2],resetAll,resetSome[2]);
	or g3(reset[3],resetAll,resetSome[3]);
	or g4(reset[4],resetAll,resetSome[4]);
	or g5(reset[5],resetAll,resetSome[5]);
	or g6(reset[6],resetAll,resetSome[6]);
	or g7(reset[7],resetAll,resetSome[7]);
	or g8(reset[8],resetAll,resetSome[8]);
	or g9(reset[9],resetAll,resetSome[9]);
	
	FF ff0(buttons[0],reset[0],signals[0]);
	FF ff1(buttons[1],reset[1],signals[1]);
	FF ff2(buttons[2],reset[2],signals[2]);
	FF ff3(buttons[3],reset[3],signals[3]);
	FF ff4(buttons[4],reset[4],signals[4]);
	FF ff5(buttons[5],reset[5],signals[5]);
	FF ff6(buttons[6],reset[6],signals[6]);
	FF ff7(buttons[7],reset[7],signals[7]);
	FF ff8(buttons[8],reset[8],signals[8]);
	FF ff9(buttons[9],reset[9],signals[9]);
	
endmodule
