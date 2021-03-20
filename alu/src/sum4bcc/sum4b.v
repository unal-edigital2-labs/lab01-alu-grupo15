`timescale 1ns / 1ps

module sum4b(clk, init, xi, yi, sal);

  input clk;
  input init;
  input [2:0] xi;
  input [2:0] yi;
  output reg [5:0] sal;
 
always @(posedge clk) begin
    if(init) sal = xi+yi;
    else sal=0;
end

endmodule
