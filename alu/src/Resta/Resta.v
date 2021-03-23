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


module Resta(clk, init, xi, yi, sal);

  input clk;
  input init;
  input [2:0] xi;
  input [2:0] yi;
  output reg [5:0] sal;
  
  wire [2:0] yi_comp;
  
  assign yi_comp = ~yi+1;
  
  
always @(posedge clk) begin
    if(init) sal = xi+yi_comp;
    else sal=0;
end
endmodule
