`ifndef _SIFIVE_SPI_H
`define _SIFIVE_SPI_H

/* Register offsets */

`define SPI_CTRL_ADDR           'h64001000
`define SPI_CTRL_SIZE           'h1000

`define SPI_REG_SCKDIV          'h00
`define SPI_REG_SCKMODE         'h04
`define SPI_REG_CSID            'h10
`define SPI_REG_CSDEF           'h14
`define SPI_REG_CSMODE          'h18

`define SPI_REG_DCSSCK          'h28
`define SPI_REG_DSCKCS          'h2a
`define SPI_REG_DINTERCS        'h2c
`define SPI_REG_DINTERXFR       'h2e

`define SPI_REG_FMT             'h40
`define SPI_REG_TXFIFO          'h48
`define SPI_REG_RXFIFO          'h4c
`define SPI_REG_TXCTRL          'h50
`define SPI_REG_RXCTRL          'h54

`define SPI_REG_FCTRL           'h60
`define SPI_REG_FFMT            'h64

`define SPI_REG_IE              'h70
`define SPI_REG_IP              'h74


/* Fields */

// `define SPI_SCK_POL             'h1
// `define SPI_SCK_PHA             'h2

// `define SPI_FMT_PROTO(x)        ((x) & 0x3)
// `define SPI_FMT_ENDIAN(x)       (((x) & 0x1) << 2)
// `define SPI_FMT_DIR(x)          (((x) & 0x1) << 3)
// `define SPI_FMT_LEN(x)          (((x) & 0xf) << 16)

// /* TXCTRL register */
// `define SPI_TXWM(x)             ((x) & 0xffff)
// /* RXCTRL register */
// `define SPI_RXWM(x)             ((x) & 0xffff)

// `define SPI_IP_TXWM             'h1
// `define SPI_IP_RXWM             'h2

// `define SPI_FCTRL_EN            'h1

// `define SPI_INSN_CMD_EN         'h1
// `define SPI_INSN_ADDR_LEN(x)    (((x) & 0x7) << 1)
// `define SPI_INSN_PAD_CNT(x)     (((x) & 0xf) << 4)
// `define SPI_INSN_CMD_PROTO(x)   (((x) & 0x3) << 8)
// `define SPI_INSN_ADDR_PROTO(x)  (((x) & 0x3) << 10)
// `define SPI_INSN_DATA_PROTO(x)  (((x) & 0x3) << 12)
// `define SPI_INSN_CMD_CODE(x)    (((x) & 0xff) << 16)
// `define SPI_INSN_PAD_CODE(x)    (((x) & 0xff) << 24)

// `define SPI_TXFIFO_FULL  (1 << 31)
// `define SPI_RXFIFO_EMPTY (1 << 31)

/* Values */

`define SPI_CSMODE_AUTO         0
`define SPI_CSMODE_HOLD         2
`define SPI_CSMODE_OFF          3

`define SPI_DIR_RX              0
`define SPI_DIR_TX              1

`define SPI_PROTO_S             0
`define SPI_PROTO_D             1
`define SPI_PROTO_Q             2

`define SPI_ENDIAN_MSB          0
`define SPI_ENDIAN_LSB          1

`endif /* _SIFIVE_SPI_H */