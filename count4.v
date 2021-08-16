
module count4 #(
    parameter    INPUT_WIDTH  = 4,
    parameter    OUTPUT_WIDTH = 4
) (
  input                             clk_in,
  input                             rst_n,
  output reg [OUTPUT_WIDTH - 1 : 0] data_out
);

always @(posedge clk_in) begin
    if (!rst_n)
        data_out <= 0 ;
    else
        data_out <= data_out + 1;    
end

endmodule  //count4