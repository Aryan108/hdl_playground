module full_adder4 #(
    parameter    INPUT_WIDTH  = 4,
    parameter    OUTPUT_WIDTH = 4
) (
  input                            clk_in,carry_in,
  input      [INPUT_WIDTH - 1 : 0] data_a,data_b,
  output reg                       carry_out,
  output reg [OUTPUT_WIDTH - 1: 0] data_out
  
);

always @(posedge clk_in) begin
    {carry_out,data_out} <= data_a + data_b + carry_in;
   
end

endmodule  //full_adder