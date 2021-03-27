module Resta3b(Clock, Init, Reset, A, B, OutRest);

input wire Clock;
input wire Init;
input wire Reset;
input wire [2:0] A;
input wire [2:0] B;
output reg [3:0] OutRest;

wire [3:0] Balt;
assign Balt=~B+1'b1;

initial begin
  
  OutRest=1'b0;

end


always @(posedge Clock) begin
    
    if((Init==1) && (Reset==1)) begin
      if(A>=B) begin
        OutRest=A+Balt;
		  OutRest[3]=1'b0;
      end
      else begin
		OutRest=1'b0;
		OutRest[3]=1'b1;
		end
    end
    else OutRest=1'b0;

end
endmodule
