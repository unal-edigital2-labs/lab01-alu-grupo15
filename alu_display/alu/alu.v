module alu(Clock, Reset, PortA, PortB, Opcode, Resultado);

input wire Clock;
input wire [2:0] PortA;
input wire [2:0] PortB;
input wire [1:0] Opcode;
input wire Reset;

output wire [5:0] Resultado;

wire [3:0] R_Suma;
wire [3:0] R_Resta;
wire [2:0] R_Division;
wire [5:0] R_Multiplicacion;

reg [3:0] Init; 
wire init_suma;
wire init_resta;
wire init_mult;
wire init_div;

Suma3b suma(Clock, Init[0], Reset, PortA, PortB, R_Suma);
Resta3b resta(Clock, Init[1], Reset, PortA, PortB, R_Resta);
Multiplicador multiplicacion(Clock, Reset, Init[2], PortA, PortB, R_Multiplicacion);
Divisor division(Clock, Reset, Init[3], PortA, PortB, R_Division);

assign Resultado=Opcode[0] ? (Opcode[1] ? {2'b00,R_Resta}:{2'b00,R_Suma}) : (Opcode[1] ? {3'b000,R_Division}:R_Multiplicacion) ;

always @(posedge Clock) begin

	case(Opcode) 
		2'b00: Init<=4'b0001;
		2'b01: Init<=4'b0010;
		2'b10: Init<=4'b0100;
		2'b11: Init<=4'b1000;
		default:Init <= 4'b0000;
	endcase
	
end

endmodule
