module Reg_file # (parameter ADDR_WIDTH = 3, RF_DEPTH = 8, RF_WIDTH = 16)
(
    input  wire                   write_enable,read_enable,
    input  wire                   CLK,RST,
    input  wire  [ADDR_WIDTH-1:0] address,
    input  wire  [RF_WIDTH-1:0]  write_data, 
    output reg   [RF_WIDTH-1:0]  read_data
);

    reg [RF_WIDTH-1:0] RF [RF_DEPTH-1:0];        

always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        RF[0]<='d0;
        RF[1]<='d0;
        RF[2]<='d0;
        RF[3]<='d0;
        RF[4]<='d0;
        RF[5]<='d0;
        RF[6]<='d0;
        RF[7]<='d0;
    end
    else if (write_enable & !read_enable)
    RF[address]<= write_data;
    else if (read_enable & !write_enable)
    read_data<=RF[address];
end






endmodule