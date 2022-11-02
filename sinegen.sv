module sinegen# (
    parameter A_WIDTH = 8, //8 bit adress/data width
                D_WIDTH = 8
)(

    input logic [A_WIDTH-1:0] incr, //input
    input logic clk,
    input logic rst,
    input logic en,
    output logic [A_WIDTH-1:0] data1,
    output logic [A_WIDTH-1:0] data2//output data
);

    logic [A_WIDTH-1:0] address;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    //.incr (incr),
    .count (address)
);

rom sineRom (
    .clk (clk),
    .addr1 (address),
    .addr2 (address+incr),
    .data1 (data1),
    .data2 (data2)
);

endmodule


