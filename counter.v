`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2017 04:16:20 PM
// Design Name: 
// Module Name: counter
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


module counter(reset,clk,en,count_done,seconds);
    input reset, clk, en;
    output reg count_done;
    input [7:0] seconds; //time to count up to
    reg [7:0] count;
    wire slowclk;
    slowClock c3(clk,reset,slowclk);
    //clock input should be slowed down clock when running on hardware.
    
    always @(posedge slowclk or posedge reset or negedge en) begin
        if (reset | ~en) begin
            count <= 0;
            count_done <= 0;
        end
        else if (count < seconds) begin
            count <= count + 8'd1;
            count_done <= 0;
        end
        else begin //count done!
            count_done <= 1; //wait for disable or reset
        end
    end

endmodule
