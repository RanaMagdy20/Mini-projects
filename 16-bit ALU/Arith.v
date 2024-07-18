module Arith_Unit #(parameter IN_WIDTH = 16  , ARITH_OUT_WIDTH = 2*IN_WIDTH )
(input wire signed [IN_WIDTH-1:0] A,
input wire signed [IN_WIDTH-1:0] B,
input wire CLK,RST,
input wire Arith_EN,
input wire [1:0] ALU_FUN,
output reg signed [ARITH_OUT_WIDTH-1:0] Arith_OUT,
output reg Carry_Out,
output reg Arith_Flag
);

always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        Arith_OUT<='d0;
        Carry_Out<=0;
        Arith_Flag<=0;
    end 
    else if (Arith_EN) begin
   // Arith_Flag<=0;

    case (ALU_FUN)
    2'd0 : begin 
    Arith_OUT<=A+B;
    Carry_Out<=Arith_OUT[IN_WIDTH];
    Arith_Flag<=1;
   end

    2'd1 : begin 
    Arith_OUT<=A-B;  
    Carry_Out<=Arith_OUT[IN_WIDTH];
    Arith_Flag<=1;
   end

    2'd2 : begin 
    Arith_OUT<=A*B;  
    Arith_Flag<=1;
   end

   2'd3 : begin 
    Arith_OUT<=A/B;  
    Arith_Flag<=1;
   end
    endcase
    end
end



endmodule