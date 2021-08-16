module shift4bit #(
    parameter    REG_LEN  = 4
) (
  input      clk_in,rst_n,dir,en, // reset is active low
  input      data_in,
  output reg[REG_LEN - 1 : 0] data_out
);
always @(posedge clk_in)
    if (!rst_n)
        data_out <= 0; // reset
    else
        begin
            if (en)
                case(dir) // shifting
                    0 : data_out <= { data_in, data_out[REG_LEN - 1:1] }; // right shift
                    1 : data_out <= { data_out[REG_LEN-2:0], data_in };    // left shift
                endcase
            else 
                data_out <= data_out; // latch
        end

endmodule  //4shift