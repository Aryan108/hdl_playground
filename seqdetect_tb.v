module seqdetect_tb ;

reg clk_tb,rst_tb,din_tb;
wire [4:0] out_tb;

integer exp = 1'd2;

seqdetect DUT(
    .clk(clk_tb),
    .rst(rst_tb),
    .din(din_tb),
    .out(out_tb)
);

always #10 clk_tb = ~clk_tb;

initial begin
    clk_tb<=0;
    rst_tb<=1;
    din_tb<=0;

    repeat (5) @ (posedge clk_tb);
    rst_tb<=0;

    @(posedge clk_tb) din_tb <= 1;
    @(posedge clk_tb) din_tb <= 0;
    @(posedge clk_tb) din_tb <= 1;
    @(posedge clk_tb) din_tb <= 1;
    @(posedge clk_tb) din_tb <= 0;
    @(posedge clk_tb) din_tb <= 0;
    @(posedge clk_tb) din_tb <= 1;
    @(posedge clk_tb) din_tb <= 0;
    @(posedge clk_tb) din_tb <= 1;
    @(posedge clk_tb) din_tb <= 1;

    #10;

    if(out_tb == 5'b00010)
        $display("Test successful!");
    else
        $display("Test failed!");


    #50 $stop;

end



endmodule  //seqdetect_tb