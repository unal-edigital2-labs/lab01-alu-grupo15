module Divisor_Control(Clock, Reset, Init, Comp, Done, Control);

input wire Clock;
input wire Reset;
input wire Init;
input wire Comp;
input wire Done;
output reg [2:0] Control; //Control -> {Load, Shift_Dec, Rest}
reg [2:0] Status;

initial begin
	
	Control=1'b0;
	Status=1'b0;

end


// FSM 
localparam WAIT=0, SHIFT_DEC =1, CHECK=2, REST=3, END=4;

always @(posedge Clock) begin
	if(Reset==1)begin

		case (Status)
			WAIT: begin
				Control=3'b000;
				if(Init==1)begin
					Control=3'b100;
					Status=SHIFT_DEC;
				end
			end
			SHIFT_DEC: begin
				Control=3'b010;
				Status=CHECK;
			end
			CHECK: begin
				Control=3'b000;
				if(Comp==1) begin
					if(Done==1) Status=END;
					else Status=SHIFT_DEC;
				end
				else Status=REST;
			end
			REST: begin
				Control=3'b001;
				if(Done==1)Status=END;
				else Status=SHIFT_DEC;
			end
			END: begin
				Control=3'b000;
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
