module Multiplicador(Clock, Reset, Init, A, B, Result);

input wire Clock;
input wire Reset;
input wire Init;
input wire [2:0] A;
input wire [2:0] B;
output wire [5:0] Result;

wire LSBB;
wire [2:0] Control;
wire Done;

Multiplicador_Control MC (Clock, Reset, Init, LSBB, Done, Control);
Multiplicador_Datapath MD (Clock, Reset, A, B, Control, Result, LSBB, Done);

endmodule
