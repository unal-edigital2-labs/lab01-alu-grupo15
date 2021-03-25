module Multiplicador_Datapath(Clock, Reset, A, B, Control, Result, LSBB, Done);

input wire Clock;
input wire Reset;
input wire [2:0] A;
input wire [2:0] B;
input wire [2:0] Control;


output reg [5:0] Result;
output wire LSBB;
output wire Done;

reg [5:0] PP;
reg [5:0] MA;
reg [2:0] MB;

initial begin
    
    Result=1'b0;
    PP=1'b0;
    MA=1'b0;
    MB=1'b0;

end

assign Done = (MB==0)?1'b1:1'b0;
assign LSBB = MB[0];

always @(negedge Clock) begin

    if(Reset==1)begin
        if(Control==3'b100)begin //Load
            MA={3'b000,A};
            MB=B;
            PP=1'b0;
        end
        if(Control==3'b010) PP=PP+MA;
        if(Control==3'b001)begin
            MA=MA << 1'b1;
            MB=MB >> 1'b1;           
        end
        if(Done==1)Result=PP;
    end
    else begin
        Result=1'b0;
        PP=1'b0;
        MA=1'b0;
        MB=1'b0;
    end

end

endmodule
