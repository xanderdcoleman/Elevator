`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2017 08:19:17 AM
// Design Name: 
// Module Name: slowClock
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


module slowClock(clkIn,reset,clkOut);
    input clkIn;
    input reset;
    output reg clkOut;
    reg [31:0] counter;
    
    always @(posedge reset or posedge clkIn) begin
        if (reset == 1) begin
            counter <= 0;
            clkOut <= 0;
        end
        
        else if (clkIn == 1) begin
            counter <= counter + 1;
            if (counter == 25000000) //25_000_000
            begin
                counter <= 0;
                clkOut <= ~clkOut;
            end
        end
    end   
endmodule
