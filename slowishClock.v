`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2017 09:47:51 AM
// Design Name: 
// Module Name: slowishClock
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


module slowishClock(clkIn,reset,clkOut);
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
            if (counter == 5) //25_000_000
            begin
                counter <= 0;
                clkOut <= ~clkOut;
            end
        end
    end  
endmodule
