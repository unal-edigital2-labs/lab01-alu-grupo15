module Divisor(Clock, Reset, Init, A, B, Result, Error);

input wire Clock;
input wire Reset;
input wire Init;
input wire [2:0] A;
input wire [2:0] B;
output wire [2:0] Result;
output wire Error;

wire Comp;
wire [3:0] Control;
wire Done;

Divisor_Control DC (Clock, Reset, Init, Comp, Done, Error, Control);
Divisor_Datapath DD (Init, Clock, Reset, A, B, Control, Result, Comp, Done, Error);

endmodule
