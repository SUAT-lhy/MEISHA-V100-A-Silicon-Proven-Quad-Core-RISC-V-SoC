`ifndef _SPI1_H_
`define _SPI1_H_

/* Register offsets */

`define SPI1_BASE_ADDR          'h52000000
`define SPI_CTRL_SIZE           'h1000

// `define SPI1_REG_STATUS         (`SPI1_BASE_ADDR + 'h00)
// `define SPI1_REG_CLKDIV         (`SPI1_BASE_ADDR + 'h04)
// `define SPI1_REG_SPICMD         (`SPI1_BASE_ADDR + 'h08)
// `define SPI1_REG_SPIADR         (`SPI1_BASE_ADDR + 'h0C)
// `define SPI1_REG_SPILEN         (`SPI1_BASE_ADDR + 'h10)
// `define SPI1_REG_SPIDUM         (`SPI1_BASE_ADDR + 'h14)
// `define SPI1_REG_TXFIFO         (`SPI1_BASE_ADDR + 'h18)
// `define SPI1_REG_RXFIFO         (`SPI1_BASE_ADDR + 'h20)
// `define SPI1_REG_INTCFG         (`SPI1_BASE_ADDR + 'h24)

// if SPI_MASTER_AXI4_WDATA_WIDTH is 64, should use bellow macros
`define SPI1_REG64_STATUS         (`SPI1_BASE_ADDR + 'h00)
`define SPI1_REG64_CLKDIV         (`SPI1_BASE_ADDR + 'h08)
`define SPI1_REG64_SPICMD         (`SPI1_BASE_ADDR + 'h10)
`define SPI1_REG64_SPIADR         (`SPI1_BASE_ADDR + 'h18)
`define SPI1_REG64_SPILEN         (`SPI1_BASE_ADDR + 'h20)
`define SPI1_REG64_SPIDUM         (`SPI1_BASE_ADDR + 'h28)
`define SPI1_REG64_TXFIFO         (`SPI1_BASE_ADDR + 'h40)
`define SPI1_REG64_RXFIFO         (`SPI1_BASE_ADDR + 'h80)
// `define SPI1_REG64_INTCFG         (`SPI1_BASE_ADDR + 'h40)


`endif /* _SPI1_H_ */