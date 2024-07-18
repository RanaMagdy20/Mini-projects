`timescale 1ns/1ns 
module RF_TB  ();
parameter ADDR_WIDTH = 3, RF_DEPTH = 8, RF_WIDTH = 16;
reg  write_enable,read_enable, CLK,RST;
reg  [ADDR_WIDTH-1:0] address;
reg [RF_WIDTH-1:0]  write_data_TB;
wire   [RF_WIDTH-1:0]  read_data_TB;

Reg_file # (.ADDR_WIDTH(ADDR_WIDTH), .RF_DEPTH(RF_DEPTH), .RF_WIDTH(RF_WIDTH)) DUT
(.address(address),
.write_enable(write_enable),
.read_enable(read_enable),
.CLK(CLK),
.RST(RST),
.write_data(write_data_TB),
.read_data(read_data_TB)
);

always #5 CLK=~CLK ;

initial begin
    CLK=0;
    write_enable=0;
    read_enable=0;
    RST=1;

    #10
    RST=0;

    #10 
    RST=1;

    #10
    write_enable=1;
    read_enable=0;
    address='d2;
    write_data_TB='d22;

    #10   
    write_enable=1;
    read_enable=0;
    address='d3;
    write_data_TB='d23;

    #10
    write_enable=0;
    read_enable=1;
    address='d2;

    #10
    if(read_data_TB == 'd22)
    $display("Operation 1 IS PASSED");
    else
    $display("Operation 1 IS Failed");
 
    #10
    write_enable=0;
    read_enable=1;
    address='d3;

    #10
    if(read_data_TB == 'd23)
    $display("Operation 2 IS PASSED");
    else
    $display("Operation 2 IS Failed");
 

#100 $stop ;
end

endmodule