module dualRam #(
    parameter    D_WIDTH  = 16,
    parameter    A_WIDTH = 6
) (
  input  wire                   clk,cs, // cs - active low
  input  wire                   we,oe,
  input  wire [A_WIDTH - 1 : 0] raddr,waddr,
  input  wire [D_WIDTH - 1 : 0] d,
  output wire [D_WIDTH - 1 : 0] out
);

reg [D_WIDTH - 1 : 0] ram [2**A_WIDTH - 1 : 0];
reg [D_WIDTH - 1 : 0] data_reg;

initial 
   $readmemh("D:/FPGA/projects/sampleMem.txt",ram);

always @(posedge clk) begin
    if(!cs & we) // chip selected and write enabled
        ram[waddr] <= d;
end

always @(posedge clk) begin
    if(!cs & oe) // chip selected and output enabled
        data_reg <= ram[raddr];    
end

assign out = !cs & oe & !we ? data_reg : 'hZ;


endmodule // dualRam