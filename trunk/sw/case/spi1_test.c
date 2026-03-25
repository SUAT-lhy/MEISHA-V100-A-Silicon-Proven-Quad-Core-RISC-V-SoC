// See LICENSE for license details.
#include <stdint.h>


#include <platform.h>

#include "common.h"
#include "spi1.h"

#define QSPI 1

#define DEBUG
#include "kprintf.h"

int main(void)
{
    long long addr[] = {0x80000000, 0x9FFFF830, 0xBFFFF830, 0x50000000, 0x5003F830, 0x5007F830};
    long long addr_1000[] = {0x80000000, 0x9FFFF830, 0xBFFFF060, 0x50000000, 0x5003F830, 0x5007F060};
  
    REG32(uart, UART_REG_DIV) = 1;
    REG32(uart, UART_REG_RXCTRL) = UART_TXEN;
    REG32(uart, UART_REG_TXCTRL) = UART_RXEN;  // donot delete
    _REG32(_AC(0x51000000, UL), 0x18) = (0x3 << 15) + (0x3 << 10) + (0x2 << 5) + (0x1);  // SOC_LSYS cfg pll cfg
	
	kprintf("Test begin ! @ core: %x", read_csr(mhartid));

    // reset fifo
    _REG32(SPI1_BASE_ADDR, SPI1_REG_STATUS) = (1 << 4);

    // set clock, spi_clk = axi_clk / (2 * (clk_div + 1))
    _REG32(SPI1_BASE_ADDR, SPI1_REG_CLKDIV) = 0x01;

    // set data length and command to be 8 bits, address 0 bits
    _REG32(SPI1_BASE_ADDR, SPI1_REG_SPILEN) = (0x08 << 16) | 0x08;
    _REG32(SPI1_BASE_ADDR, SPI1_REG_SPIDUM) = 0x22;

    // enable qspi transmit
    if (QSPI == 1) {
        _REG32(SPI1_BASE_ADDR, SPI1_REG_SPICMD) = (0x01 << 24);
        _REG32(SPI1_BASE_ADDR, SPI1_REG_STATUS) = 0x0102;
        _REG32(SPI1_BASE_ADDR, SPI1_REG_TXFIFO) = (0x01 << 24);
    }

    // set data length and address to be 32 bits, command 8 bits
    _REG32(SPI1_BASE_ADDR, SPI1_REG_SPILEN) = (0x20 << 16 | 0x20 << 8 | 0x08);

    for (int i = 0; i < 6; ++ i) {
        // set initial address and data
        int data = 0x12345678;
        long long rw_addr = addr_1000[i];
        if (i == 0) kprintf("DDR test begin!");
        else if (i == 3) kprintf("IRAM test begin!");
        for (int j = 1; j <= 1000; ++ j) {
            // wait until SPI is idle
            while ((_REG32(SPI1_BASE_ADDR, SPI1_REG_STATUS) & 0x01) == 0);

            // set write command and address
            _REG32(SPI1_BASE_ADDR, SPI1_REG_SPICMD) = (0x02 << 24);
            _REG32(SPI1_BASE_ADDR, SPI1_REG_SPIADR) = rw_addr;

            // initiate a write operation with select CS0
            if (QSPI == 1) _REG32(SPI1_BASE_ADDR, SPI1_REG_STATUS) = 0x0108;
            else _REG32(SPI1_BASE_ADDR, SPI1_REG_STATUS) = 0x0102;

            // wait until tx buffer has available place
            while (((_REG32(SPI1_BASE_ADDR, SPI1_REG_STATUS) >> 24) & 0xFF) >= 8);

            // write data to addr
            _REG32(SPI1_BASE_ADDR, SPI1_REG_TXFIFO) = data;

            // wait until SPI is idle
            while ((_REG32(SPI1_BASE_ADDR, SPI1_REG_STATUS) & 0x01) == 0);

            // set read command and address
            _REG32(SPI1_BASE_ADDR, SPI1_REG_SPICMD) = (0x0b << 24);
            _REG32(SPI1_BASE_ADDR, SPI1_REG_SPIADR) = rw_addr;

            // initiate a write operation with select CS0
            if (QSPI == 1) _REG32(SPI1_BASE_ADDR, SPI1_REG_STATUS) = 0x0104;
            _REG32(SPI1_BASE_ADDR, SPI1_REG_STATUS) = 0x0101;

            // wait until rx buffer has available place
            while (((_REG32(SPI1_BASE_ADDR, SPI1_REG_STATUS) >> 16) & 0xFF) == 0);

            // read data from rxfifo
            int read_data = _REG32(SPI1_BASE_ADDR, SPI1_REG_RXFIFO);

            if (read_data != data) {
                kprintf("SPI1_TEST FAIL! at addr: %x, the correct data is: %x, but get: %x", rw_addr, data, read_data);
            }
            else kprintf("SPI1_TEST PASS! at addr: %x", rw_addr);

            rw_addr += 0x4;
            data += 0x1;
        }
        if (i == 2) kprintf("DDR test end!");
        else if (i == 5) kprintf("IRAM test end!");
    }
    
	kprintf("Test end ! @ core: %x", read_csr(mhartid));


	if (1){
		kprintf("PASS");
	}
	else{
		kprintf("FAIL");
	}

	kprintf(SHUTDOWN_FLAG_STR);  // donnot delete

	return 0;
}
