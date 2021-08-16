`timescale 1ns / 1ps
module full_adder_tb();

reg [3:0]a_tb,b_tb; // inputs
reg Cin;

wire [3:0]y_tb; // outputs
wire Co_tb;

integer i,j,k;

full_adder4 DUT(
    .data_a(a_tb),
    .data_b(b_tb),
    .carry_in(Cin),
    .carry_out(Co_tb),
    .data_out(y_tb)
    
);

initial
begin
    for(i=0;i<=16;i=i+1) begin
        a_tb <= i;
        for(j=0;j<=16;j=j+1) begin
            b_tb <= j;
            for(k=0;k<=16;k=k+1) begin
                Cin <= k;
                #10;
                if(y_tb != a_tb + b_tb + Cin)
                begin
                    $error("Error in sum!");
                    $stop;
                end
            end
        end
    end
    $display("Test passed!");
end


endmodule  //full_adder_tb