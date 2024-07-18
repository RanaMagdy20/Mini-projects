`timescale 1ns/1ns
module controller_tb();
parameter IDLE=2'b00, Mv_Up=2'b01, Mv_Dn=2'b10;
reg Activate_tb, UP_Max_tb, DN_Max_tb, CLK, RST;
wire UP_Motor_tb, DN_Motor_tb;

task initialize;
begin
    Activate_tb=0;
    UP_Max_tb=0;
    DN_Max_tb=0;
    CLK=0;
end
endtask

task resetting;
begin
    RST=1;
    #2 RST=0;
    #2 RST=1;
end
endtask

task in;
begin
Activate_tb=1;
#10
if (UP_Motor_tb && !DN_Motor_tb) begin
$display("Moving up");

DN_Max_tb=0;
UP_Max_tb=1;
Activate_tb=0;
#30

if(!UP_Motor_tb && !DN_Motor_tb)
$display("Opened and idle");
end

else if(!UP_Motor_tb && DN_Motor_tb) begin
$display("Moving down");
DN_Max_tb=1;
UP_Max_tb=0;
Activate_tb=0;

#30
if(!UP_Motor_tb && !DN_Motor_tb)
$display("Closed and idle");
end
end
endtask

//Clock generation
always #10 CLK=~CLK;


//Instiation 
Door_Controller DUT (
.Activate(Activate_tb),
.UP_Max(UP_Max_tb),
.DN_Max(DN_Max_tb),
.RST(RST),
.CLK(CLK),
.UP_Motor(UP_Motor_tb),
.DN_Motor(DN_Motor_tb)
);

initial begin
    initialize();
    #10
    resetting();
    #10
    DN_Max_tb=1;
    UP_Max_tb=0;
    in(); 
    #10 in();
    #10 in();
    #100 $stop;

 
end


endmodule
