module Multiplicador_Control(Clock, Reset, Init, LSBB, Done, Control);

input wire Clock;
input wire Reset;
input wire Init;
input wire LSBB;
input wire Done;
output reg [2:0] Control; //Control -> {Load, Add, Shift}
reg [2:0] Status;

initial begin
	
	Control=1'b0;
	Status=1'b0;

end


// FSM 
localparam WAIT=0, CHECK =1, ADD=2, SHIFT=3, END=4;

always @(posedge Clock) begin
	if(Reset==1)begin

		case (Status)
			WAIT: begin
				Control=1'b0;
				if(Init==1)begin
					Status=CHECK;
					Control=3'b100;
				end
			end
			CHECK: begin
				Control=3'b000;
				if(LSBB==1) Status=ADD;
				else Status=SHIFT;
			end
			ADD: begin
				Control=3'b010;
				Status=SHIFT;
			end
			SHIFT: begin
				Control=3'b001;
				if(Done==1)Status=END;
				else Status=CHECK;
			END: begin
				Control=3'b000;
				Status =START;
			end
	 		default:Status =START;
		endcase
	end
	else begin
		Control=1'b0;
		Status=1'b0;
	end

end 


endmodule
