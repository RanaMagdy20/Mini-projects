module CMP_Unit  #(parameter IN_WIDTH = 16  , CMP_OUT_WIDTH = 16 )
(input wire signed [IN_WIDTH-1:0] A,
input wire signed [IN_WIDTH-1:0] B,
input wire CLK,RST,
input wire CMP_EN,
input wire [1:0] ALU_FUN,
output reg [CMP_OUT_WIDTH-1:0] CMP_OUT,
output reg CMP_Flag
);

always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        CMP_OUT<='d0;
        CMP_Flag<=0;
    end 
    else if (CMP_EN) begin
    CMP_Flag<=1;
    case (ALU_FUN)
    2'd0 : CMP_OUT<='d0;
    2'd1 : begin
         if(A==B)
         CMP_OUT<='d1;
         else 
         CMP_OUT<='d0;
    end
    2'd2  : begin
         if(A>B)
         CMP_OUT<='d2;
         else 
         CMP_OUT<='d0;
    end
    2'd3 : begin
         if(A<B)
         CMP_OUT<='d3;
         else 
         CMP_OUT<='d0;
    end
   
    endcase
    end
end


endmodule




