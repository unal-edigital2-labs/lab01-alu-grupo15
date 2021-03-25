module Suma3b(Clock, Init, Reset, A, B, OutSuma);

input wire Clock;
input wire Init;
input wire Reset;
input wire [2:0] A;
input wire [2:0] B;
output reg [3:0] OutSuma;

initial begin
    
    OutSuma=1'b0;

end

always @(posedge Clock)begin
    if((Init==1) && (Reset==1))begin
        OutSuma=A+B;
    end
    else OutSuma=1'b0;

end

endmodule
