module ALU_TOP #(parameter IN_WIDTH = 16  , ARITH_OUT_WIDTH = 2*IN_WIDTH , lOGIC_OUT_WIDTH = 16 , CMP_OUT_WIDTH = 4 , SHIFT_OUT_WIDTH = 17) 
(
input wire signed [IN_WIDTH-1:0] A,
input wire signed [IN_WIDTH-1:0] B,
input wire CLK,RST,
input wire [3:0] ALU_FUN,
output wire signed [ARITH_OUT_WIDTH-1:0] Arith_OUT,
output wire Carry_Out,
output wire [lOGIC_OUT_WIDTH-1:0] logic_OUT,
output wire [CMP_OUT_WIDTH-1:0] CMP_OUT,
output wire [SHIFT_OUT_WIDTH-1:0] SHIFT_OUT,
output wire Arith_Flag, Logic_Flag, CMP_Flag, Shift_Flag
);
wire Arith_EN,Logic_EN,CMP_EN,SHIFT_EN;

Decoder D (
.FUNC(ALU_FUN[3:2]),
.OUT_EN({Arith_EN,Logic_EN,CMP_EN,SHIFT_EN})
);


Arith_Unit  #(.IN_WIDTH(IN_WIDTH),.ARITH_OUT_WIDTH(ARITH_OUT_WIDTH)) AA
(.CLK(CLK),
.A(A),
.B(B),
.RST(RST),
.Arith_EN(Arith_EN),
.ALU_FUN(ALU_FUN[1:0]),
.Arith_Flag(Arith_Flag),
.Carry_Out(Carry_Out),
.Arith_OUT(Arith_OUT)
);

Logic_Unit  #(.IN_WIDTH(IN_WIDTH),.lOGIC_OUT_WIDTH(lOGIC_OUT_WIDTH)) L
(.CLK(CLK),
.A(A),
.B(B),
.RST(RST),
.Logic_EN(Logic_EN),
.ALU_FUN(ALU_FUN[1:0]),
.Logic_Flag(Logic_Flag),
.logic_OUT(logic_OUT)
);


CMP_Unit #(.IN_WIDTH(IN_WIDTH),.CMP_OUT_WIDTH(CMP_OUT_WIDTH)) C
(.CLK(CLK),
.A(A),
.B(B),
.RST(RST),
.CMP_EN(CMP_EN),
.ALU_FUN(ALU_FUN[1:0]),
.CMP_Flag(CMP_Flag),
.CMP_OUT(CMP_OUT)
);

Shift_Unit   #(.IN_WIDTH(IN_WIDTH),.SHIFT_OUT_WIDTH(SHIFT_OUT_WIDTH)) S
(.CLK(CLK),
.A(A),
.B(B),
.RST(RST),
.SHIFT_EN(SHIFT_EN),
.ALU_FUN(ALU_FUN[1:0]),
.Shift_Flag(Shift_Flag),
.SHIFT_OUT(SHIFT_OUT)
);







endmodule