module Resta3b(Clock, Init, Reset, A, B, OutRest, Error);

input wire Clock;
input wire Init;
input wire Reset;
input wire [2:0] A;
input wire [2:0] B;
output reg [2:0] OutRest;
output wire Error;

wire [2:0] Balt;
assign Balt=~B+1'b1;

initial begin
  
  OutRest=1'b0;

end
assign Error=((A<B) && (Init==1));


always @(posedge Clock) begin
    
    if((Init==1) && (Reset==1)) begin
      if(A>=B) begin
        OutRest=A+Balt;
      end
      else begin
		OutRest=1'b0;
		end
    end
    else OutRest=1'b0;

end
endmodule
