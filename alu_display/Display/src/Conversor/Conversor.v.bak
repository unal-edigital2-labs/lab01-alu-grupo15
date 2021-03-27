module Conversor(ClockA, Reset, BCD, Sseg);

input wire ClockA;
input wire Reset;
input wire [3:0] BCD;

output reg [6:0] Sseg;

initial begin
	Sseg=1'b0;
end


always @(posedge ClockA)begin

if(Reset==1)begin
	case(BCD)
		4'b0000:Sseg=7'b0000001; //0
		4'b0001:Sseg=7'b1001111; //1
		4'b0010:Sseg=7'b0010010; //2
		4'b0011:Sseg=7'b0000110; //3
		4'b0100:Sseg=7'b1001100; //4
		4'b0101:Sseg=7'b0100100; //5
		4'b0110:Sseg=7'b0100000; //6
		4'b0111:Sseg=7'b0001111; //7
		4'b1000:Sseg=7'b0000000; //8
		4'b1001:Sseg=7'b0000100; //9
		4'b1010:Sseg=7'b0001000; //A
		4'b1011:Sseg=7'b1100000; //B
		4'b1100:Sseg=7'b0110001; //C
		4'b1101:Sseg=7'b1000010; //D
		4'b1110:Sseg=7'b0110000; //E
		4'b1111:Sseg=7'b0100111; //F
		default:Sseg=7'b0000001; //0
	endcase
end
else Sseg=1'b0;
	
end
endmodule
