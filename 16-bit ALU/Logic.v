module Logic_Unit  #(parameter IN_WIDTH = 16  , lOGIC_OUT_WIDTH = 16 )
(input wire signed [IN_WIDTH-1:0] A,
input wire signed [IN_WIDTH-1:0] B,
input wire CLK,RST,
input wire Logic_EN,
input wire [1:0] ALU_FUN,
output reg [lOGIC_OUT_WIDTH-1:0] logic_OUT,
output reg Logic_Flag
);


always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        logic_OUT<='d0;
        Logic_Flag<=0;
    end 
    else if (Logic_EN) begin
    Logic_Flag<=1;
    case (ALU_FUN)
    2'd0 : logic_OUT<=A&B;
    2'd1 : logic_OUT<=A|B;
    2'd2 : logic_OUT<=~(A&B);
    2'd3 : logic_OUT<=~(A|B);
    
   
    endcase
    end
end


endmodule