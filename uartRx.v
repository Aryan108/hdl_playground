module uartRx #(
    parameter    CLKS_PER_BIT  = 217
) (
  input         in_clk,
  input         in_serial_rx,
  output        out_dataV,
  output [7:0]  out_byte_Rx 
);

// states
parameter IDLE      = 3'b000;
parameter START_BIT = 3'b001;
parameter DATA_BIT  = 3'b010;
parameter STOP_BIT  = 3'b011;
parameter CLNUP     = 3'b100;

reg [7:0]   byte_rx   = 0;
reg [7:0]   clk_count = 0;
reg [2:0]   bit_idx   = 0;
reg         dV        = 0;
reg [2:0]   state     = 0;

always @(posedge in_clk) begin
    
    case(state)
        IDLE:
            begin
                dV <= 0;
                bit_idx <= 0;
                clk_count <= 0;            
            
            if(in_serial_rx == 1'b0)
                state <= START_BIT;
            else
                state <= IDLE;
            end
        START_BIT:
            begin
                if(clk_count == (CLKS_PER_BIT-1)/2)
                    begin
                        if(in_serial_rx == 1'b0 )
                            begin
                                clk_count <= 0;
                                state <= DATA_BIT;                            
                            end
                        else
                            state <= IDLE;
                    end
                else
                    begin
                        clk_count <= clk_count + 1;
                        state <= START_BIT;
                    end
            end
        DATA_BIT:
            begin
                if(clk_count < CLKS_PER_BIT - 1)
                    begin                    
                        clk_count <= clk_count + 1;
                        state <= DATA_BIT;
                    end
                else
                    begin
                        clk_count <= 0;
                        byte_rx[bit_idx] <= in_serial_rx;

                        if(bit_idx < 7)
                            begin
                                bit_idx <= bit_idx + 1;
                                state <= DATA_BIT;
                            end
                        else
                            begin
                                bit_idx <= 0;
                                state <= STOP_BIT;
                            end
                    end
                
            end
        STOP_BIT:
            begin
                if(clk_count == CLKS_PER_BIT - 1)
                    begin
                        clk_count <= clk_count + 1;
                        state <= STOP_BIT;                    
                    end
                else
                    begin
                        clk_count <= 0;
                        dV <= 1'b1;
                        state <= CLNUP;
                    end
            end
        CLNUP:
            begin
                state <= IDLE;
                dV <= 1'b0;
            end
        
        default:
            state <= IDLE;
    endcase
end

assign out_dataV = dV;
assign out_byte_Rx = byte_rx;


endmodule  //uartRx