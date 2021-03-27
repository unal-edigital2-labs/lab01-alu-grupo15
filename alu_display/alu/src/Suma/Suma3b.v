module Suma3b(Clock, Init, Reset, A, B, ROutsuma, Error);

input wire Clock;
input wire Init;
input wire Reset;
input wire [2:0] A;
input wire [2:0] B;
output wire [2:0] ROutsuma;
output wire Error;

reg [3:0] OutSuma;

initial begin
    
    OutSuma=1'b0;

end

assign Error=((OutSuma[3]==1) && (Init==1));
assign ROutsuma=OutSuma[2:0];

always @(posedge Clock)begin
    if((Init==1) && (Reset==1))begin
        OutSuma=A+B;
    end
    else OutSuma=1'b0;

end

endmodule
