module DivF(Clock, Reset, Num, ClockA);

input wire Clock;
input wire Reset;
input wire [25:0] Num;

output reg ClockA;

reg [25:0] Contador;

initial begin
	ClockA=1'b0;
	Contador=1'b0;
end

always @(posedge Clock) begin

if(Reset==1)begin
	if(Contador==Num)begin
		ClockA=!ClockA;
		Contador=1'b0;
	end
	else Contador=Contador+1'b1;
end
else begin
	ClockA=1'b0;
	Contador=1'b0;
end

end
endmodule
