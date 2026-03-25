// See LICENSE for license details.
#include <stdint.h>

#include <platform.h>

#include "common.h"

#define DEBUG
#include "kprintf.h"

#define MAX_CORES 8

#define PAYLOAD_SIZE	(26 << 11)

#ifndef TL_CLK
#error Must define TL_CLK
#endif

#define F_CLK TL_CLK

static volatile uint32_t * const spi = (void *)(SPI_CTRL_ADDR);

static inline uint8_t spi_xfer(uint8_t d)
{
	int32_t r;

	REG32(spi, SPI_REG_TXFIFO) = d;
	// dputs("set txfifo");
	do {
		r = REG32(spi, SPI_REG_RXFIFO);
		// dputs("set rxfifo");
	} while (r < 0);
	return r;
}

static inline uint8_t sd_dummy(void)
{
	// dputs("dummying");     
	return spi_xfer(0xFF);
}

static uint8_t sd_cmd(uint8_t cmd, uint32_t arg, uint8_t crc)
{
	unsigned long n;
	uint8_t r;
	REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;
	sd_dummy();
	spi_xfer(cmd);
	spi_xfer(arg >> 24);
	spi_xfer(arg >> 16);
	spi_xfer(arg >> 8);
	spi_xfer(arg);
	spi_xfer(crc);

	n = 1000;
	do {
		// dputs("dummy loop");
		r = sd_dummy();
		//dprintf("sd:cmd: %x\r\n", r);             //hyhqude
		if (!(r & 0x80)) {
//			dprintf("sd:cmd: %hx\r\n", r);
			goto done;
		}
	} while (--n > 0);
	kputs("sd_cmd: timeout");
done:
	return r;
}

static inline void sd_cmd_end(void)
{
	// dputs("cmd end dummy");
	sd_dummy();
	// dputs("set cmd end csmode");
	REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;
	// dputs("finish set cmd end csmode");
}


static void sd_poweron(uint64_t clk_freq)
{
	long i;
	uint64_t sclkdiv;
	// 5M 40/(5 * 2) - 1  = 3; 250 / (5*2) - 1 = 24
	sclkdiv = (clk_freq / 10) - 1;
	//sclkdiv = 3;
	dprintf("Info: cfg SPI_REG_SCKDIV value %x\r\n", sclkdiv);
	REG32(spi, SPI_REG_SCKDIV) = sclkdiv;
	// dputs("set div");
	REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_OFF;
	// dputs("set csmode");
	for (i = 10; i > 0; i--) {

		sd_dummy();
	}
	// dputs("begin set csmode");
	REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;
	// dputs("end set csmode");
}

static int sd_cmd0(void)
{
	int rc;
	dputs("CMD0");
	rc = (sd_cmd(0x40, 0, 0x95) != 0x01);
	sd_cmd_end();
	return rc;
}

static int sd_cmd8(void)
{
	int rc;
	dputs("CMD8");
	rc = (sd_cmd(0x48, 0x000001AA, 0x87) != 0x01);
	sd_dummy(); /* command version; reserved */
	sd_dummy(); /* reserved */
	rc |= ((sd_dummy() & 0xF) != 0x1); /* voltage */
	rc |= (sd_dummy() != 0xAA); /* check pattern */
	sd_cmd_end();
	return rc;
}

static void sd_cmd55(void)
{
	sd_cmd(0x77, 0, 0x65);
	sd_cmd_end();
}

static int sd_acmd41(void)
{
	uint8_t r;
	dputs("ACMD41");
	do {
		sd_cmd55();
		r = sd_cmd(0x69, 0x40000000, 0x77); /* HCS = 1 */
	} while (r == 0x01);
	return (r != 0x00);
}

static int sd_cmd58(void)
{
	int rc;
	dputs("CMD58");
	rc = (sd_cmd(0x7A, 0, 0xFD) != 0x00);
	rc |= ((sd_dummy() & 0x80) != 0x80); /* Power up status */
	sd_dummy();
	sd_dummy();
	sd_dummy();
	sd_cmd_end();
	return rc;
}

static int sd_cmd16(void)
{
	int rc;
	dputs("CMD16");
	rc = (sd_cmd(0x50, 0x200, 0x15) != 0x00);
	sd_cmd_end();
	return rc;
}

static uint16_t crc16_round(uint16_t crc, uint8_t data) {
	crc = (uint8_t)(crc >> 8) | (crc << 8);
	crc ^= data;
	crc ^= (uint8_t)(crc >> 4) & 0xf;
	crc ^= crc << 12;
	crc ^= (crc & 0xff) << 5;
	//dprintf("Info: cal crc %4x\r\n", crc);
	return crc;
}

#define SPIN_SHIFT	6
#define SPIN_UPDATE(i)	(!((i) & ((1 << SPIN_SHIFT)-1)))
#define SPIN_INDEX(i)	(((i) >> SPIN_SHIFT) & 0x3)

static const char spinner[] = { '-', '/', '|', '\\' };

static int copy(void)
{
	volatile uint8_t *p = (void *)(PAYLOAD_DEST);
	long i = PAYLOAD_SIZE;
	int rc = 0;

	dputs("CMD18");

	//REG32(spi, SPI_REG_SCKDIV) = (F_CLK / 16666666UL);
	if (sd_cmd(0x52, 0, 0xE1) != 0x00) {
		sd_cmd_end();
		return 1;
	}
	do {
		uint16_t crc, crc_exp;
		long n;
		crc = 0;
		n = 512;
		while (sd_dummy() != 0xFE);
		do {
			uint8_t x = sd_dummy();
			*p++ = x;
			crc = crc16_round(crc, x);
			//dprintf("data %x, crc %x \r\n", x, crc);
		} while (--n > 0);


		crc_exp = ((uint16_t)sd_dummy() << 8);
		crc_exp |= sd_dummy();

		dprintf("data %x at %x, crc %x - %x\r\n", (uint32_t)(*p), p-4, crc, crc_exp);

		if (crc != crc_exp) {
			kputs("\b- CRC mismatch ");
			//rc = 1;
			//break;
		}

		if (SPIN_UPDATE(i)) {
			kputc('\b');
			kputc(spinner[SPIN_INDEX(i)]);
		}
	} while (--i > 0);
	sd_cmd_end();
	sd_cmd(0x4C, 0, 0x01);
	sd_cmd_end();
	kputs("\b ");
	return rc;
}

int main(void)
{
	uint64_t base_addr;
	uint64_t use_clk_freq;
	REG32(uart, UART_REG_TXCTRL) = UART_TXEN;
    // REG32(uart, UART_REG_DIV)= 1;
	// avoid uart int
	// REG32(uart, UART_REG_RXCTRL) = UART_RXEN;
	base_addr = 0x51000000UL;
	dprintf("Info: after cfg mig takeover, check tx_dfx value %x, rx_dfx value %x\r\n", _REG64(base_addr, 0xb0), _REG64(base_addr, 0xb8));
	
  dprintf("Info: begin ! @ compiler date: %s, time: %s\r\n", __DATE__,__TIME__);
  dprintf("Info: check tx_dfx value %x, rx_dfx value %x\r\n", _REG64(base_addr, 0xb0), _REG64(base_addr, 0xb8));
	
    
	// config pll clko0 500M clko1 250M clko2 100M, VCO = 2000M
	_REG32(_AC(0x51000000, UL), 0x10) = (0x0 << 30)/**/ + (50 << 18)/*fbdiv*/ + (0x3 << 15)/*postdiv0_0*/ + (0x0 << 12)/*postdiv1_0*/ + (0x3 << 9)/*postdiv0_1*/ + (0x1 << 6)/*postdiv1_1*/ + (0x4 << 3)/*postdiv0_1*/ + (0x3 << 0)/*postdiv1_1*/;
	
	// need bigger than 1us
	for(int i = 10; i >= 0; i--) {
		dprintf("Info: cfg pll parameter 0x%x - 0x%x\r\n", i, _REG32(_AC(0x51000000, UL), 0x10));
	}

	
	_REG32(_AC(0x51000000, UL), 0x100) = (0x0 << 31) + (0x3 << 29) + (0x3 << 23) + (0x2 << 20) + (0x1 << 18);

	use_clk_freq = 40UL;

	// judge debug config mode, for switch pll
	if((_REG32(_AC(0x51000000, UL), 0x20) & 0x40000000) == 0x40000000){
		_REG32(_AC(0x51000000, UL), 0x18) = (18 << 15) + (20 << 10) + (0x0 << 5) + (0x0);  // SOC_LSYS cfg pll cfg
		// donot need switch pll, use ref clk
		// cfg sdram parameter to 10m
		_REG32(_AC(0x51000000, UL), 0x200) = 1000;
		_REG32(_AC(0x51000000, UL), 0x208) = 77;
		_REG32(_AC(0x51000000, UL), 0x210) = 1;
		_REG32(_AC(0x51000000, UL), 0x218) = 1;
		_REG32(_AC(0x51000000, UL), 0x220) = 1;

		kprintf("Info: donot need switch work clk to pll output: 0x%x", _REG32(_AC(0x51000000, UL), 0x20));
	}
	else{
		// wait more than 1us
		// check pll lock 100 times
		for(int i = 10; i >= 0; i--) {
			dprintf("Info: test pll state index: 0x%x - 0x%x\r\n", i, _REG32(_AC(0x51000000, UL), 0x20));
		}
		// check pll lock
		if((_REG32(_AC(0x51000000, UL), 0x20) & 0x00000001) == 0x00000001) {
			kprintf("Info: begin switch work clk to pll output: 0x%x\r\n", _REG32(_AC(0x51000000, UL), 0x20));
			// speed up only use in eda_ram, because vendor ram is limit frequency
			
			// cfg sdram parameter to 10m
			_REG32(_AC(0x51000000, UL), 0x200) = 5000;
			_REG32(_AC(0x51000000, UL), 0x208) = 1561;
			_REG32(_AC(0x51000000, UL), 0x210) = 2;
			_REG32(_AC(0x51000000, UL), 0x218) = 2;
			_REG32(_AC(0x51000000, UL), 0x220) = 4;

			// config pll to clk_cpu: 400M + clk_main: 250M + clk_ddr: 50M + clk_chiplink: 20M
			_REG32(_AC(0x51000000, UL), 0x18) = (0x2 << 15) + (0x4 << 10) + (0x1 << 5) + (0x1);  // SOC_LSYS cfg pll cfg
			kprintf("Info: end switch work clk to pll output: 0x%x\r\n", _REG32(_AC(0x51000000, UL), 0x20));
			use_clk_freq = 250UL;
		}
		else {
			_REG32(_AC(0x51000000, UL), 0x18) = (18 << 15) + (20 << 10) + (0x0 << 5) + (0x0);  // SOC_LSYS cfg pll cfg
			// donot need switch pll, use ref clk
			// cfg sdram parameter to 10m
			_REG32(_AC(0x51000000, UL), 0x200) = 1000;
			_REG32(_AC(0x51000000, UL), 0x208) = 77;
			_REG32(_AC(0x51000000, UL), 0x210) = 1;
			_REG32(_AC(0x51000000, UL), 0x218) = 1;
			_REG32(_AC(0x51000000, UL), 0x220) = 1;

			kprintf("Info: donot need switch work clk to pll output: 0x%x\r\n", _REG32(_AC(0x51000000, UL), 0x20));
		}
	}
	
	// test for wait delay
	// base_addr = 0x50000000UL; 
	// for(long i = 0; i <= 500; i++) {
	// 	dprintf("Info: read value %x @ addr %x\r\n", _REG64(base_addr, 0x0), base_addr);
	// }

	kputs("INIT\n");
	// write and read debug
	//  base_addr = 0x80000000UL;
	//  for(long i = 0x400UL; i >= 0x0; i = i - 8) {
	//  	_REG64(base_addr + i, 0x0) = base_addr + i;
	//  	if(_REG64(base_addr + i, 0x0) != (base_addr + i)) {
	//  		dprintf("Error: read value %x @ addr %x\r\n", _REG64(base_addr + i, 0x0), base_addr + i);
	//  	}
	//  	else {
	//  		dprintf("Info: read value %x @ addr %x\r\n", _REG64(base_addr + i, 0x0), base_addr + i);
	//  	}
	//  }
	
	sd_poweron(use_clk_freq);
	if (sd_cmd0() ||
	    sd_cmd8() ||
	    sd_acmd41() ||
	    sd_cmd58() ||
	    sd_cmd16() ||
	    copy()) {
		kputs("ERROR");
		return 1;
	}
	kputs("BOOT\n");
	// print 8000_0000
	dprintf("Info: after sd copy image , ddr value %x - %x\r\n", _REG64(0x80000000UL, 0x0), _REG64(0x80000000UL, 0x8));
	//kprintf(SHUTDOWN_FLAG_STR);
	__asm__ __volatile__ ("fence.i" : : : "memory");
	return 0;
}
