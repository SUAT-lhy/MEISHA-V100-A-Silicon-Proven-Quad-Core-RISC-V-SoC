// `ifndef SPI_IF
// `define SPI_IF
interface spi_if(input rst_n);
    // standard spi signals
    logic       cs;
    logic       sclk;
    logic       mosi;
    logic       miso;

    // debug signals
    logic [7:0] host_byte;
    int         host_bit;
    logic [7:0] device_byte;
    int         device_bit;
    int         sck_pulses;
    bit         sck_polarity;
    bit         sck_phase;
    bit         trans_done;
endinterface //spi_if(input rst_n)
// `endif SPI_IF