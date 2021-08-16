module b_to7seg #()
 (
    input       clk_in,
    input   [3 : 0] bin_data,
    output  o_A,
    output  o_B,
    output  o_C,
    output  o_D,
    output  o_E,
    output  o_F,
    output  o_G   
       
);

reg [6:0] enc_val = 7'h00;

always @(posedge clk_in) begin
    case(bin_data)
        4'b0000:
            enc_val <= 7'h7E;
        4'b0001:
            enc_val <= 7'h30;
        4'b0010:
            enc_val <= 7'h6D;
        4'b0011:
            enc_val <= 7'h79;
        4'b0100:
            enc_val <= 7'h33;
        4'b0101:
            enc_val <= 7'h5B;
        4'b0110:
            enc_val <= 7'h5F;
        4'b0111:
            enc_val <= 7'h70;
        4'b1000:
            enc_val <= 7'h7F;
        4'b1001:
            enc_val <= 7'h7B;
        4'b1010:
            enc_val <= 7'h77;
        4'b1011:
            enc_val <= 7'h1F;
        4'b1100:
            enc_val <= 7'h4E;
        4'b1101:
            enc_val <= 7'h3D;
        4'b1110:
            enc_val <= 7'h4F;
        4'b1111:
            enc_val <= 7'h47;
        default:
            enc_val <= 7'h7E;
    endcase;
end

assign o_A = enc_val[6];
assign o_B = enc_val[5];
assign o_C = enc_val[4];
assign o_D = enc_val[3];
assign o_E = enc_val[2];
assign o_F = enc_val[1];
assign o_G = enc_val[0];


endmodule  //b_to7seg