module comp2 #(
    parameter    INPUT_WIDTH  = 2,
    parameter    OUTPUT_WIDTH = 2
) (
  input                       clk,
  input [INPUT_WIDTH - 1 : 0] a,b,
  output reg                  g,l,e
);

always @(posedge clk,a,b) begin
    g  = a > b ? 1 : 0;
    l = a < b ? 1 : 0;
    e = a == b ? 1 : 0;
end


endmodule  //comp2 