module Divisor_Datapath(Clock, Reset, A, B, Control, Result, Comp, Done);

input wire Clock;
input wire Reset;
input wire [2:0] A;
input wire [2:0] B;
input wire [3:0] Control;

output reg [2:0] Result;
output wire Comp;
output wire Done;


reg [2:0] MB;
reg [2:0] DP;
reg [2:0] Cociente;
reg [1:0] Cuenta;

initial begin
    
    Result=1'b0;
    MB=1'b0;
    DP=1'b0;
    Cociente=1'b0;
    Cuenta=1'b0;

end

assign Done = (Cuenta==0)?1'b1:1'b0;
assign Comp = (Cociente<MB)?1'b1:1'b0;
always @(negedge Clock) begin

    if(Reset==1)begin
        
        if(Control==4'b1000)begin //Load
            DP=A;
            MB=B;
            Cociente=1'b0;
            Cuenta=2'd3;
        end
				
		if(Control==4'b0100) begin
            {Cociente,DP}={Cociente,DP} << 1'b1;
            Cuenta=Cuenta-1'b1;
        end
        
		if(Control==4'b0010)begin
            Cociente=Cociente-MB;
            DP[0]=1'b1; 
        end	
        if(Control==4'b0001)if(Done==1)Result=DP;


    end
    else begin
        Result=1'b0;
        MB=1'b0;
        DP=1'b0;
        Cociente=1'b0;
        Cuenta=1'b0;
    end

end

endmodule
