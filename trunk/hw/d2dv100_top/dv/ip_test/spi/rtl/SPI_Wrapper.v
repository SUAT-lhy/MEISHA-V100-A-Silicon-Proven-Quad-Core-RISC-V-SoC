module SPI_Wrapper (
    input MOSI, SS_n, clk, rst_n,
    output MISO,
    // output reg [2:0] status,
    // output S_done, P_done, ttx_valid
    output MISO_valid
);

wire [9:0] rx_data;
wire [7:0] tx_data;
wire rx_valid, tx_valid;

// wire [2:0] current_state;
// wire StoP_done, PtoS_done;

// assign ttx_valid = tx_valid;
// assign S_done    = StoP_done;
// assign P_done    = PtoS_done;
// assign status    = current_state;

wire miso_valid;
assign MISO_valid = miso_valid;

Single_port_Async_RAM RAM (
    .din(rx_data), 
    .clk(clk), 
    .rst_n(rst_n), 
    .rx_valid(rx_valid), 
    .tx_valid(tx_valid), 
    .dout(tx_data)
    );

SPI_Slave SPI (
    .MOSI(MOSI), 
    .SS_n(SS_n), 
    .clk(clk), 
    .rst_n(rst_n), 
    .tx_valid(tx_valid), 
    .tx_data(tx_data), 
    .MISO(MISO), 
    .rx_valid(rx_valid), 
    .rx_data(rx_data),
    // .status(current_state),
    // .S_done(StoP_done),
    // .P_done(PtoS_done)
    .miso_valid(miso_valid)
    );

endmodule