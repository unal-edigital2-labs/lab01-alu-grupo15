module Top(Clock, Reset, Opcode, PortA, PortB, An, Sseg);

input wire Clock;
input wire Reset;
input wire [2:0] PortA;
input wire [2:0] PortB;
input wire [1:0] Opcode;

output wire [3:0] An;
output wire [6:0] Sseg;
 
wire [5:0] Result;

alu alu(Clock, Reset, PortA, PortB, Opcode, Result);
Visualizacion view(Clock, Reset, PortA, PortB, Result, An, Sseg);

endmodule