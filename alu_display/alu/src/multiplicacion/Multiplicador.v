module Multiplicador(Clock, Reset, Init, A, B, Result, Error);

input wire Clock;
input wire Reset;
input wire Init;
input wire [2:0] A;
input wire [2:0] B;
output wire [2:0] Result;
output wire Error;

wire LSBB;
wire [2:0] Control;
wire Done;

Multiplicador_Control MC (Clock, Reset, Init, LSBB, Done, Error, Control);
Multiplicador_Datapath MD (Init, Clock, Reset, A, B, Control, Result, LSBB, Done, Error);

endmodule
