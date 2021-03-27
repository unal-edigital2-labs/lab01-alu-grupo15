module Divisor(Clock, Reset, Init, A, B, Result);

input wire Clock;
input wire Reset;
input wire Init;
input wire [2:0] A;
input wire [2:0] B;
output wire [2:0] Result;

wire Comp;
wire [2:0] Control;
wire Done;

Divisor_Control DC (Clock, Reset, Init, Comp, Done, Control);
Divisor_Datapath DD (Clock, Reset, A, B, Control, Result, Comp, Done);

endmodule
