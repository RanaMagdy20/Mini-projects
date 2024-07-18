`timescale 1us/1us 
module ALUTOP_TB ();
parameter IN_WIDTH = 16  , ARITH_OUT_WIDTH = 2*IN_WIDTH , lOGIC_OUT_WIDTH = 16 , CMP_OUT_WIDTH = 4 , SHIFT_OUT_WIDTH = 17;
parameter  CLK_T  = 10 , High = 0.6 * CLK_T , Low = 0.4 * CLK_T ;
reg  CLK,RST;
reg  signed [IN_WIDTH-1:0] A,B;
reg [3:0] ALU_FUN;
wire   [ARITH_OUT_WIDTH-1:0] Arith_OUT;
wire  Carry_Out,Arith_Flag, Logic_Flag, CMP_Flag, Shift_Flag;
wire [lOGIC_OUT_WIDTH-1:0] logic_OUT;
wire  [CMP_OUT_WIDTH-1:0] CMP_OUT;
wire [SHIFT_OUT_WIDTH-1:0] SHIFT_OUT;

ALU_TOP # (.IN_WIDTH(IN_WIDTH),.ARITH_OUT_WIDTH(ARITH_OUT_WIDTH), .lOGIC_OUT_WIDTH(lOGIC_OUT_WIDTH), .CMP_OUT_WIDTH(CMP_OUT_WIDTH), .SHIFT_OUT_WIDTH(SHIFT_OUT_WIDTH)) DUT
(.A(A),
.B(B),
.ALU_FUN(ALU_FUN),
.CLK(CLK),
.RST(RST),
.Arith_OUT(Arith_OUT),
.Carry_Out(Carry_Out),
.Arith_Flag(Arith_Flag),
.Logic_Flag(Logic_Flag),
.CMP_Flag(CMP_Flag),
.Shift_Flag(Shift_Flag),
.logic_OUT(logic_OUT),
.CMP_OUT(CMP_OUT),
.SHIFT_OUT(SHIFT_OUT)
);


always  
   begin
    #Low CLK = ~ CLK ;
    #High CLK = ~ CLK ;
   end

initial begin
    CLK=0;
    RST=1;
    #10 RST=0; /// to reset
    #10 RST=1;
    ///////////////////////
    A=-'d4;
    B=-'d6;
    ALU_FUN=4'd0;
    #10
    
   if (Arith_OUT == -'d10 && Arith_Flag == 'd1)
       $display ("Test1 IS PASSED") ;
   else
      begin
       $display ("Test1 IS Failed") ;
      end
    /////////////
    A='d4;
    B=-'d6;
    ALU_FUN=4'd0;
    #10
    if (Arith_OUT == -'d2 && Arith_Flag == 'd1)
       $display ("Test2 IS PASSED") ;
   else
      begin
       $display ("Test2 IS Failed") ;
      end
    //////////
    A=-'d4;
    B='d6;
    ALU_FUN=4'd0;
    #10
   if (Arith_OUT == 'd2 && Arith_Flag == 'd1)
       $display ("Test3 IS PASSED") ;
   else
      begin
       $display ("Test3 IS Failed") ;
      end
    ////////////////
    A='d4;
    B='d6;
    ALU_FUN=4'd0;
    #10
   if (Arith_OUT == 'd10 && Arith_Flag == 'd1)
       $display ("Test4 IS PASSED") ;
   else
      begin
       $display ("Test4 IS Failed") ;
      end
    ////////////////
    A=-'d4;
    B=-'d6;
    ALU_FUN=4'd1;
    #10
   if (Arith_OUT == 'd2 && Arith_Flag == 'd1)
       $display ("Test5 IS PASSED") ;
   else
      begin
       $display ("Test5 IS Failed") ;
      end
    ////////
     A='d4;
    B=-'d6;
    ALU_FUN=4'd1;
    #10
   if (Arith_OUT == 'd10 && Arith_Flag == 'd1)
       $display ("Test6 IS PASSED") ;
   else
      begin
       $display ("Test6 IS Failed") ;
      end
/////////////
    A=-'d4;
    B='d6;
    ALU_FUN=4'd1;
    #10
   if (Arith_OUT == -'d10 && Arith_Flag == 'd1)
       $display ("Test7 IS PASSED") ;
   else
      begin
       $display ("Test7 IS Failed") ;
      end
    /////////
    A='d4;
    B='d6;
    ALU_FUN=4'd1;
    #10
   if (Arith_OUT == -'d2 && Arith_Flag == 'd1)
       $display ("Test8 IS PASSED") ;
   else
      begin
       $display ("Test8 IS Failed") ;
      end
    /////////////
    A=-'d4;
    B=-'d6;
    ALU_FUN=4'd2;
    #10
   if (Arith_OUT == 'd24 && Arith_Flag == 'd1)
       $display ("Test9 IS PASSED") ;
   else
      begin
       $display ("Test9 IS Failed") ;
      end
    /////////////
    A='d4;
    B=-'d6;
    ALU_FUN=4'd2;
    #10
   if (Arith_OUT == -'d24 && Arith_Flag == 'd1)
       $display ("Test10 IS PASSED") ;
   else
      begin
       $display ("Test10 IS Failed") ;
      end
    //////////
    A=-'d4;
    B='d6;
    ALU_FUN=4'd2;
    #10
   if (Arith_OUT == -'d24 && Arith_Flag == 'd1)
       $display ("Test11 IS PASSED") ;
   else
      begin
       $display ("Test11 IS Failed") ;
      end
    /////
    A='d4;
    B='d6;
    ALU_FUN=4'd2;
    #10
   if (Arith_OUT == 'd24 && Arith_Flag == 'd1)
       $display ("Test12 IS PASSED") ;
   else
      begin
       $display ("Test12 IS Failed") ;
      end
    ///////////
    A=-'d10;
    B=-'d2;
    ALU_FUN=4'd3;
    #10
   if (Arith_OUT == 'd5 && Arith_Flag == 'd1)
       $display ("Test13 IS PASSED") ;
   else
      begin
       $display ("Test13 IS Failed") ;
      end
///////// 
    A='d10;
    B=-'d2;
    ALU_FUN=4'd3;
    #10
   if (Arith_OUT == -'d5 && Arith_Flag == 'd1)
       $display ("Test14 IS PASSED") ;
   else
      begin
       $display ("Test14 IS Failed") ;
      end
////////////
    A=-'d10;
    B='d2;
    ALU_FUN=4'd3;
    #10
   if (Arith_OUT == -'d5 && Arith_Flag == 'd1)
       $display ("Test15 IS PASSED") ;
   else
      begin
       $display ("Test15 IS Failed") ;
      end
//////////
    A='d10;
    B='d2;
    ALU_FUN=4'd3;
    #10
   if (Arith_OUT == 'd5 && Arith_Flag == 'd1)
       $display ("Test16 IS PASSED") ;
   else
      begin
       $display ("Test16 IS Failed") ;
      end
//////////
    A='d11;
    B='d4;
    ALU_FUN=4'd4;
    #10
   if (logic_OUT == 'd0 && Logic_Flag == 'd1)
       $display ("Test17 IS PASSED") ;
   else
      begin
       $display ("Test17 IS Failed") ;
      end
  //////////////
    A='d11;
    B='d4;
    ALU_FUN=4'd5;
    #10
   if (logic_OUT == 'd15 && Logic_Flag == 'd1)
       $display ("Test18 IS PASSED") ;
   else
      begin
       $display ("Test18 IS Failed") ;
      end
///////////

    A='d11;
    B='d4;
    ALU_FUN=4'd6;
    #10
   if (logic_OUT == 'd65535 && Logic_Flag == 'd1)
       $display ("Test19 IS PASSED") ;
   else
      begin
       $display ("Test19 IS Failed") ;
      end
    ////////////
    A='d11;
    B='d4;
    ALU_FUN=4'd7;
    #10
   if (logic_OUT == 'd65520 && Logic_Flag == 'd1)
       $display ("Test20 IS PASSED") ;
   else
      begin
       $display ("Test20 IS Failed") ;
      end
    ///////////
    A='d11;
    B='d4;
    ALU_FUN=4'd8;
    #10
   if (CMP_OUT == 'd0 && CMP_Flag == 'd1)
       $display ("Test21 IS PASSED") ;
   else
      begin
       $display ("Test21 IS Failed") ;
      end
    ////////
    A='d10;
    B='d10;
    ALU_FUN=4'd9;
    #10
   if (CMP_OUT == 'd1 && CMP_Flag == 'd1)
       $display ("Test22 IS PASSED") ;
   else
      begin
       $display ("Test22 IS Failed") ;
      end
    ////////////
    A='d10;
    B='d9;
    ALU_FUN=4'd10;
    #10
   if (CMP_OUT == 'd2 && CMP_Flag == 'd1)
       $display ("Test23 IS PASSED") ;
   else
      begin
       $display ("Test23 IS Failed") ;
      end 
      ////////////
    A='d9;
    B='d10;
    ALU_FUN=4'd11;
    #10
   if (CMP_OUT == 'd3 && CMP_Flag == 'd1)
       $display ("Test24 IS PASSED") ;
   else
      begin
       $display ("Test24 IS Failed") ;
      end
    /////////
    A='d10;
    B='d10;
    ALU_FUN=4'd12;
    #10
   if (SHIFT_OUT == 'd5 && Shift_Flag == 'd1)
       $display ("Test25 IS PASSED") ;
   else
      begin
       $display ("Test25 IS Failed") ;
      end
////////////
    A='d10;
    B='d10;
    ALU_FUN=4'd13;
   #10
   if (SHIFT_OUT == 'd20 && Shift_Flag == 'd1)
       $display ("Test26 IS PASSED") ;
   else
      begin
       $display ("Test26 IS Failed") ;
      end
/////////
    A='d10;
    B='d10;
    ALU_FUN=4'd14;
   #10
   if (SHIFT_OUT == 'd5 && Shift_Flag == 'd1)
       $display ("Test27 IS PASSED") ;
   else
      begin
       $display ("Test27 IS Failed") ;
      end
///////
    A='d10;
    B='d10;
    ALU_FUN=4'd15;
   #10
   if (SHIFT_OUT == 'd20 && Shift_Flag == 'd1)
       $display ("Test28 IS PASSED") ;
   else
      begin
       $display ("Test28 IS Failed") ;
      end

#100 $stop;  //finished with simulation 
  end



endmodule