module  Door_Controller
(input wire Activate, UP_Max, DN_Max, CLK, RST,
output reg  UP_Motor, DN_Motor
);
//Moore FSM

localparam IDLE=2'b00,
           Mv_Up=2'b01,
           Mv_Dn=2'b10;

reg [1:0] current_state, next_state;

always @(posedge CLK or negedge RST) begin
    if(!RST)
    current_state<=IDLE;
    else 
    current_state<=next_state;
end

always @(*) begin
    case (current_state)
    IDLE: begin
    if(!Activate) 
        next_state = IDLE;
    else if(UP_Max && !DN_Max) 
        next_state=Mv_Dn;
    else if (DN_Max && !UP_Max)
        next_state=Mv_Up;
    else 
        next_state=IDLE;
    end

    Mv_Up: begin
    if(UP_Max)
        next_state=IDLE;
    else 
        next_state=Mv_Up;
    end

    Mv_Dn: begin
    if (DN_Max)
        next_state=IDLE;
    else 
        next_state=Mv_Dn;
    end

    default : next_state=IDLE;
    endcase
end

always @(*) begin
    case(current_state)
    IDLE: begin
        UP_Motor=0;
        DN_Motor=0;
    end

    Mv_Up: begin
        UP_Motor=1;
        DN_Motor=0;
    end

    Mv_Dn: begin
        DN_Motor=1;
        UP_Motor=0;
    end

    default: begin
        UP_Motor=0;
        DN_Motor=0;
    end
    endcase
end
endmodule