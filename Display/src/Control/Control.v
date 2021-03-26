module Control(ClockA, Reset, PortA, PortB, Result, BCD, An);

input wire ClockA;
input wire Reset;
input wire [2:0] PortA;
input wire [2:0] PortB;
input wire [5:0] Result;

output reg [3:0] BCD;
output reg [7:0] An;

reg [1:0] Contador;

initial begin
	Contador=1'b0;
	BCD=1'b0;
	An=1'b0;
end

always @(posedge ClockA)begin

if(Reset==1)begin
	case(Contador)
		2'b00:begin
			BCD={1'b0,PortA};
			An=8'b11110111;
		end
		
		2'b01:begin
			BCD={1'b0,PortB};
			An=8'b11111011;
		end
		
		2'b10:begin
			BCD={2'b00,Result[5:4]};
			An=8'b11111101;
		end
		
		2'b11:begin
			BCD=Result[3:0];
			An=8'b11111110;
		end
		
		default:begin
			BCD=4'b0000;
			An=8'b11110000;
		end
	endcase

Contador=Contador+1'b1;	
	
end
else begin
	BCD=1'b0;
	An=1'b0;
	Contador=1'b0;
end

end
endmodule
