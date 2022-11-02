module rom #(
    parameter ADDRESS_WIDTH = 8,
                DATA_WIDTH = 8
)(
    input logic clk,
    input logic [ADDRESS_WIDTH-1:0] offset,
    input logic [ADDRESS_WIDTH-1:0] addr1,
    input logic [ADDRESS_WIDTH-1:0] addr2, //[7:0]
    output logic [DATA_WIDTH-1:0] data1, //[7:0]
    output logic [DATA_WIDTH-1:0] data2
);
logic [DATA_WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-1:0]; //[2^8-1=255:0 mem locations]
initial begin
    $display("Loading rom.");
    $readmemh("sinerom.mem", rom_array);
end;

always_ff @(posedge clk)
    data1 <= rom_array [addr1];
always_ff @(posedge clk)
    data2 <= rom_array [addr2];

endmodule
