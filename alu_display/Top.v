module Top(Clock, Reset, Opcode, PortA, PortB, An, Sseg, Result, Error);

input wire Clock;
input wire Reset;
input wire [2:0] PortA;
input wire [2:0] PortB;
input wire [1:0] Opcode;

output wire [3:0] An;
output wire [6:0] Sseg;
 
output wire [2:0] Result;
output wire Error;

alu alu(Clock, Reset, PortA, PortB, Opcode, Result, Error);
Visualizacion view(Clock, Reset, PortA, PortB, Result, An, Sseg);

endmodule