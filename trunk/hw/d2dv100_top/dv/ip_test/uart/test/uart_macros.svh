`ifndef _SIFIVE_UART_H
`define _SIFIVE_UART_H

/* Register offsets */

`define UART_CTRL_ADDR           'h54000000
`define UART_CTRL_SIZE           'h1000

`define UART_REG_TXFIFO         'h00
`define UART_REG_RXFIFO         'h04
`define UART_REG_TXCTRL         'h08
`define UART_REG_RXCTRL         'h0c
`define UART_REG_IE             'h10
`define UART_REG_IP             'h14
`define UART_REG_DIV            'h18

/* TXCTRL register */
`define UART_TXEN               'h1
`define UART_TXNSTOP            'h2
`define UART_TXWM(x)            (((x) & 'hffff) << 16)

/* RXCTRL register */
`define UART_RXEN               'h1
`define UART_RXWM(x)            (((x) & 'hffff) << 16)

/* IP register */
`define UART_IP_TXWM            'h1
`define UART_IP_RXWM            'h2

`define UART_TXFIFO_FULL	'h80000000
`define UART_RXFIFO_EMPTY	'h80000000
`define UART_RXFIFO_DATA	'h000000ff
`define UART_TXCTRL_TXEN	'h1
`define UART_RXCTRL_RXEN	'h1



`endif /* _SIFIVE_SPI_H */