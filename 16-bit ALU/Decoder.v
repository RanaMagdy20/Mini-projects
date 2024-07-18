module Decoder (
    input wire [1:0] FUNC,
    output reg [3:0] OUT_EN
);

always @(*) begin
    case (FUNC) 
    2'b00 : OUT_EN=4'b1000;
    2'b01 : OUT_EN=4'b0100;
    2'b10 : OUT_EN=4'b0010;
    2'b11 : OUT_EN=4'b0001;
endcase

end



endmodule