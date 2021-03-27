module alu(Clock, Reset, PortA, PortB, Opcode, Resultado, Error);

input wire Clock;
input wire [2:0] PortA;
input wire [2:0] PortB;
input wire [1:0] Opcode;
input wire Reset;

output reg [2:0] Resultado;
output wire Error;

wire [2:0] R_Suma;
wire [2:0] R_Resta;
wire [2:0] R_Division;
wire [2:0] R_Multiplicacion;

reg [3:0] Init; 
wire init_suma;
wire init_resta;
wire init_mult;
wire init_div;
wire E_Suma;
wire E_Resta;
wire E_Multiplicacion;
wire E_Division; 


Suma3b suma(Clock, Init[0], Reset, PortA, PortB, R_Suma, E_Suma);
Resta3b resta(Clock, Init[1], Reset, PortA, PortB, R_Resta, E_Resta);
Multiplicador multiplicacion(Clock, Reset, Init[2], PortA, PortB, R_Multiplicacion, E_Multiplicacion);
Divisor division(Clock, Reset, Init[3], PortA, PortB, R_Division, E_Division);

assign Error = (E_Suma | E_Resta | E_Multiplicacion | E_Division);

always @(posedge Clock) begin

	case(Opcode) 
		2'b00: begin
			Init=4'b0001;
			Resultado=R_Suma;
		end
		2'b01: begin
			Init=4'b0010;
			Resultado=R_Resta;
		end
		2'b10: begin
			Init=4'b0100;
			Resultado=R_Multiplicacion;
		end
		2'b11: begin
			Init=4'b1000;
			Resultado=R_Division;
		end
		default:Init= 4'b0000;
	endcase
	
end

endmodule
