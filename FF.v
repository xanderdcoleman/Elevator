`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2017 08:08:59 AM
// Design Name: 
// Module Name: FF
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


module FF(T,reset, Q);
	input T, reset;
	output reg Q;	
	always @(posedge T or posedge reset)begin
		if (reset)
			Q <= 0;
		else if (T)
			Q <= ~Q;
	end //end always	
endmodule
