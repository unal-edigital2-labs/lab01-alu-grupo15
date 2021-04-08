`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:40:46 09/13/2019 
// Design Name: 
// Module Name:    Divisor
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Divisor(              input clk, 
                             input init, 
                             input [2:0] MR, 
							 input [2:0] MD, 
							 input reset,
							  
							 output reg [5:0] A
							 //output reg done
    );

reg done;
reg sh;
reg rst;
reg add;
reg fill;
reg assigna;
reg [5:0] C;
reg [2:0] B;

reg [1:0] count;
reg [2:0] status = 0;


//bloques de registros de desplazamiento para A y B
always @(negedge clk) begin
   
	if (rst) begin
		A = {3'b000,MD};
		B = ~MR + 1;
		count = 3;
	end
	else begin 
            if (sh) begin
                A = A << 1;
                count = count-1;
            end
            else begin          
                if(assigna)
                    A[5:3]=C[2:0];          
                else begin
                    if (fill) 
                        A[0]= 1'b1;
                    else if(done)
                        A[5:3]=3'b000;
                end
            end
    end

end 

//bloque de add pp
always @(negedge clk) begin
   
	if (rst) begin
		C =0;
	end
	else begin
        if (add) 
         C = A[5:3] + B;
    end
	
 end



//bloque para actualizar A


// FSM 
parameter START =0, CHECK =1, ADD =2, SHIFT =3, END1 =4, CHECKCOUNT=5, FILLONE=6, ASSIGNA=7;

always @(posedge clk) begin
	case (status)
	START: begin
		sh=0;
		add=0;
		fill=0;
		assigna=0;
		if (init && reset) begin
			status=SHIFT;
			done =0;
			rst=1;
		end
		end
	CHECK: begin 
		done=0;
		rst=0;
		sh=0;
		add=0;
		fill=0;
		assigna=0;
		if (C[3]==1)
			status=FILLONE;
		else
			status=CHECKCOUNT;
		end
	ADD: begin
		done=0;
		rst=0;
		sh=0;
		add=1;
		fill=0;
		assigna=0;
		status=CHECK;
		end
	SHIFT: begin
		done=0;
		rst=0;
		sh=1;
		add=0;
		fill=0;
		assigna=0;
		status=ADD;
        end
        
    ASSIGNA: begin
        done=0;
        rst=0;
        sh=0;
        add=0;
        fill=0;
        assigna=1;
        status=CHECKCOUNT;
        end
		
		
    CHECKCOUNT: begin 
        done=0;
        rst=0;
        sh=0;
        add=0;
        fill=0;
        assigna=0;
        if (count == 0)
            status=END1;
        else
            status=SHIFT;
        end
        
	FILLONE: begin 
        done=0;
        rst=0;
        sh=0;
        add=0;
        fill=1;
        assigna=0;
        status=ASSIGNA;
		end
		
	END1: begin
		done =1;
		rst =0;
		sh =0;
		add =0;
		fill=0;
		assigna=0;
		status =START;
	end
	 default:
		status =START;
	endcase 
	
end 


endmodule
