`timescale 1ns / 1ps


module alu(
    input [2:0] portA,
    input [2:0] portB,
    input [1:0] opcode,
    //output [0:6] sseg,
    //output [3:0] an,
    input clk,
    input rst,
    
    
    output reg [5:0] sal_f
 );

// Declaraci�n de salidas de cada bloque 
wire [5:0] sal_suma;
wire [5:0] sal_resta;
wire [5:0] sal_div;
wire [5:0] sal_mult;


// Declaraci�n de las entradas init de cada bloque 
reg [3:0] init; 
wire init_suma;
wire init_resta;
wire init_mult;
wire init_div;



// 

assign init_suma= init[0];
assign init_resta=init[1];
assign init_mult=init[2];
assign init_div=init[3];


//wire [3:0] operacion;

// descripci�n del decodificacion de operaciones
always @(posedge clk) begin
	case(opcode) 
		2'b00: init<=4'b0001;
		2'b01: init<=4'b0010;
		2'b10: init<=4'b0100;
		2'b11: init<=4'b1000;
	default:
		init <= 0;
	endcase
	
end

//ELegir la salida para el display
always @(posedge clk) begin
	case(opcode) 
		2'b00: sal_f<=sal_suma;
		2'b01: sal_f<=sal_resta;
		2'b10: sal_f<=sal_mult;
		2'b11: sal_f<=sal_div;
	default:
		sal_f<= 0;
	endcase
	
end


// Descripcion del miltiplexor
/*
always @(*) begin
	case(opcode) 
		2'b00: int_bcd <={8'b00,sal_suma};
		2'b01: int_bcd <={8'b00,sal_resta};
		2'b10: int_bcd <={8'b00,sal_mult};
		2'b11: int_bcd <={8'b00,sal_div};
	default:
		int_bcd <= 0;
	endcase
	
end
*/

//instanciaci�n de los componnetoperaciones 

sum4b sum(.clk(clk), .init(init_suma), .xi(portA), .yi(portB),.sal(sal_suma));
Resta rest(.clk(clk), .init(init_resta), .xi(portA), .yi(portB),.sal(sal_resta));
multiplicador mul (.clk(clk), .init(init_mult), .MR(portA), .MD(portB), .pp(sal_mult), .reset(rst));
Divisor div (.clk(clk), .init(init_div), .MR(portB), .MD(portA), .C(sal_div), .reset(rst));

// adicone los dos bloques que hacen flata la resta y divisi�n





endmodule
