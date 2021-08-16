module count4_tb();

reg clk,rst;
wire [3:0]out;

count4 DUT(
    .clk_in(clk),
    .rst_n(rst),
    .data_out(out)

);

always #5 
    clk = ~clk; // flip clk every 5ns

    initial begin
        clk <= 0;
        rst <= 0;

        #20 rst <= 1;
        #50 rst <= 0;
        #40 rst <= 1;

        #20 $stop;
    
    end

endmodule  //count4_tb