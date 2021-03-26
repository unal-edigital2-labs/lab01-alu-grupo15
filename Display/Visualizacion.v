module Visualizacion(Clock, Reset, PortA, PortB, Result, An, Sseg);

input wire Clock;
input wire Reset;
input wire [2:0] PortA;
input wire [2:0] PortB;
input wire [5:0] Result;

output wire [7:0] An;
output wire [6:0] Sseg;

wire ClockA;
wire [3:0] BCD;

DivF DivisorFrecuencia (Clock, Reset, 26'd25_000, ClockA);
Conversor BCD2Sseg(ClockA, Reset, BCD, Sseg);
Control control(ClockA, Reset, PortA, PortB, Result, BCD, An);




endmodule
