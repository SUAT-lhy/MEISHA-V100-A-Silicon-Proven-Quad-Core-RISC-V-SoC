// `ifndef SPI_IF2
// `define SPI_IF2
interface spi_if2(input rst_n);
    // debug signals
    logic [2:0] status;
    logic       SS_n;
    logic       StoP_done;
    logic       tx_valid;
    logic       PtoS_done;
    logic       miso_valid;
    
endinterface //spi_if2(input rst_n)
// `endif SPI_IF2