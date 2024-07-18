module Shift_Unit  #(parameter IN_WIDTH = 16  , SHIFT_OUT_WIDTH = 17 )
(input wire signed [IN_WIDTH-1:0] A,
input wire signed [IN_WIDTH-1:0] B,
input wire CLK,RST,
input wire SHIFT_EN,
input wire [1:0] ALU_FUN,
output reg [SHIFT_OUT_WIDTH-1:0] SHIFT_OUT,
output reg Shift_Flag
);


always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        SHIFT_OUT<='d0;
        Shift_Flag<=0;
    end 
    else if (SHIFT_EN) begin
    Shift_Flag<=1;
    case (ALU_FUN)
    2'd0 : SHIFT_OUT<= A>>1;
    2'd1 : SHIFT_OUT<= A<<1;
    2'd2 : SHIFT_OUT<= B>>1;
    2'd3 : SHIFT_OUT<= B<<1;
    
   
    endcase
    end
end


endmodule