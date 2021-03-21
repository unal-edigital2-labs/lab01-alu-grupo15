`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2021 02:37:01 PM
// Design Name: 
// Module Name: resta
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


module resta(clk, init, xi, yi, sal);

  input clk;
  input init;
  input [2:0] xi;
  input [2:0] yi;
  output reg [5:0] sal;
  
  assign yi = ~yi;
  
  
always @(posedge clk) begin
    if(init) sal = xi+yi;
    else sal=0;
end
endmodule
