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
  output [5:0] sal;
  
  reg [2:0] resultado;
  wire [2:0] yi_comp;
  
  assign yi_comp = ~yi+1;
  assign sal = {3'b000,resultado};
  
always @(posedge clk) begin
    if(xi >= yi )begin
        if(init) resultado = xi+yi_comp;
        else resultado=0;
    end
    else resultado = 0;
end
endmodule
