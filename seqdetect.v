module seqdetect #(
    parameter   SEQ  = 4'b1011,
                S_WIDTH = 2,
                MEM = 5,
                S0  = 2'b00,
                S1  = 2'b01,
                S2  = 2'b10,
                S3  = 2'b11
) (
    input   clk,rst,din,
    output  [4:0] out
);
reg [S_WIDTH-1 : 0] nextS,currentS;
reg [MEM - 1 :0] count = 0;

always @(din or currentS) begin
    case (currentS)
        S0:
            if(din == 1)
                nextS = S1;
            else if (din == 0)
                nextS = currentS;
            else
                nextS = currentS;
        S1:
            if(din == 1)
                nextS = currentS;
            else if (din == 0)
                nextS = S2;
            else
                nextS = currentS;
        S2:
            if(din == 1)
                nextS = S3;
            else if (din == 0)
                nextS = S0;
            else
                nextS = currentS;
        S3:
            if(din == 1) begin
                nextS = S1;
                count = count + 1; // seq detected, add 1
            end
            else if (din == 0)
                nextS = S2;
            else
                nextS = currentS;
        default:
            nextS = currentS;
    endcase
end

always @(posedge clk) begin
    if(rst) // rst set to high, goto S0
        currentS = S0;
    else
        currentS = nextS;    
end

assign out = count;

endmodule  //seqdetect