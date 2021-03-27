module Divisor_Control(Clock, Reset, Init, Comp, Done, Error, Control);

input wire Clock;
input wire Reset;
input wire Init;
input wire Comp;
input wire Done;
input wire Error;
output reg [3:0] Control; //Control -> {Load, Shift_Dec, Rest}
reg [3:0] Status;

initial begin
	
	Control=1'b0;
	Status=1'b0;

end


// FSM 
localparam WAIT=0, SHIFT_DEC =1, CHECK=2, REST=3, CHECKEND=4, END=5;

always @(posedge Clock) begin
	if(Reset==1)begin

		if(Error==1)Status=WAIT;

		case (Status)
			WAIT: begin
				Control=4'b0000;
				if(Init==1)begin
					Control=4'b1000;
					Status=SHIFT_DEC;
				end
			end
			SHIFT_DEC: begin
				Control=4'b0100;
				Status=CHECK;
			end
			CHECK: begin
				Control=4'b0000;
				if(Comp==1) Status=CHECKEND;	
				else Status=REST;

			end
			REST: begin
				Control=4'b0010;
				Status=CHECKEND;
			end
			CHECKEND: begin
				Control=4'b0001;
				if(Done==1)Status=END;
				else Status=SHIFT_DEC;
			end 
			END: begin
				Control=4'b0000;
				Status = WAIT;
			end
	 		default:Status = WAIT;
		endcase
	end
	else begin
		Control=1'b0;
		Status=1'b0;
	end

end 


endmodule
