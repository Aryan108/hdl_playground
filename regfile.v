module regfile #(
    parameter    D_WIDTH  = 8,
    parameter    A_WIDTH = 4
) (
  input                         clk,wren,
  input  wire [D_WIDTH - 1 : 0] wdata,
  input  wire [A_WIDTH - 1 : 0] waddr,raddr,
  output wire [D_WIDTH - 1 : 0] rdata
);
reg [D_WIDTH - 1 : 0] ram [2**A_WIDTH - 1 : 0];

always @(posedge clk) 
    if (wren)
        ram[waddr] <= wdata;
    assign rdata = ram[raddr];


endmodule  //regfile