// See LICENSE for license details.
#include <stdint.h>

#include <platform.h>
#define PAYLOAD_DEST MEMORY_MEM_ADDR
#include "common.h"

#define DEBUG

#include "kprintf.h"

#define PAYLOAD_SIZE	(26 << 11)

#define F_CLK 50000000UL

static volatile uint32_t *const spi = (volatile uint32_t *)0x64001000;

// static inline uint8_t spi_xfer(uint8_t d)
// {
//     int32_t r;

//     REG32(spi, SPI_REG_TXFIFO) = d;
//     do {
//         r = REG32(spi, SPI_REG_RXFIFO);
//     } while (r < 0);
//     return r;
// }

// static inline uint8_t sd_dummy(void)
// {
//     return spi_xfer(0xFF);
// }

int main(void)
{
    // 初始化 UART
    //REG32(uart, UART_REG_DIV) = 271;  // 
    REG32(uart, UART_REG_DIV) = 1;
    REG32(uart, UART_REG_RXCTRL) = UART_TXEN;
    REG32(uart, UART_REG_TXCTRL) = UART_RXEN;  // donot delete
    _REG32(_AC(0x51000000, UL), 0x18) = (0x3 << 15) + (0x3 << 10) + (0x2 << 5) + (0x1);  // SOC_LSYS cfg pll cfg
	
    kprintf("Test begin ! @ core: 0x%x, compiler date: %s, time: %s", read_csr(mhartid), __DATE__,__TIME__);

    // Power on SD card
    REG32(spi, SPI_REG_SCKDIV) = (F_CLK / 800000UL);//初始化的时钟
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_OFF;
    for (int i = 10; i > 0; i--) {
        uint8_t r;
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        kprintf("No %x: r is %x", i, r);
    }
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;

// CMD0: 发送复位命令
    uint8_t r;
    long n = 1000;
    kprintf("CMD0");
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;

    //sd_dummy
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x40;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//cmd_index

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x95;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//crc

    do {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        kprintf("r,sd:cmd: %x", r);
        kprintf("n,sd:cmd: %x", n);
        if (!(r & 0x80)) {
            break;
        }
    } while (--n > 0);
    
    if(n == 0) {
        kprintf("sd_cmd: timeout");
    }

    if (r != 0x01) {
        kprintf("cmd0 response ERROR. r:%x", r);
        return 1;
    }

    //sd_cmd_end
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;


// CMD8: 检查电压范围和 SD 版本
    kprintf("CMD8");
    n = 1000;
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x48;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//cmd_index

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x01;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0xaa;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x87;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//crc

    do {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        kprintf("r,sd:cmd: %x", r);
        kprintf("n,sd:cmd: %x", n);
        if (!(r & 0x80)) {
            break;
        }
    } while (--n > 0);

    if(n == 0) {
        kprintf("sd_cmd: timeout");
    }

    if (r != 0x01) {
        kprintf("cmd8 response ERROR. r:%x", r);
        return 1;
    }

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);// command version; reserved
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);// reserved
    if (((r & 0xF) != 0x1)) {
        kprintf("ERROR: VHS not match. r:%x", r);
        return 1;
    }

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);// reserved
    if ((r != 0xAA)) {
        kprintf("ERROR: check parttern. r:%x", r);
        return 1;
    }

    //sd_cmd_end
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;

//cmd55
cmd55:
    n = 1000;
    kprintf("CMD55");
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x77;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//cmd_index

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//crc

    do {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        kprintf("r,sd:cmd: %x", r);
        kprintf("n,sd:cmd: %x", n);
        if (!(r & 0x80)) {
            break;
        }
    } while (--n > 0);
    
    if(n == 0) {
        kprintf("sd_cmd: timeout");
    }

    if (r != 0x01) {
        kprintf("cmd55 response ERROR. r:%x", r);
        return 1;
    }

    //sd_cmd_end
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;

// ACMD41: 初始化 SD 卡
    n = 1000;
    kprintf("ACMD41");
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x69;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//cmd_index

    REG32(spi, SPI_REG_TXFIFO) = 0x40;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x77;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//crc

    do {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        kprintf("r,sd:cmd: %x", r);
        kprintf("n,sd:cmd: %x", n);
        if (!(r & 0x80)) {
            break;
        }
    } while (--n > 0);
    
    if(n == 0) {
        kprintf("sd_cmd: timeout");
    }

    if (r != 0x00) {
        kprintf("acmd41 response ERROR. r:%x", r);
        goto cmd55;
        // return 1;
    }

    //sd_cmd_end
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;

// CMD58: 读取 OCR 寄存器
    kprintf("CMD58");
    n = 1000;
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x7a;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//cmd_index

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0xfd;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//crc

    do {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        kprintf("r,sd:cmd: %x", r);
        kprintf("n,sd:cmd: %x", n);
        if (!(r & 0x80)) {
            break;
        }
    } while (--n > 0);

    if(n == 0) {
        kprintf("sd_cmd: timeout");
    }

    if (r != 0x00) {
        kprintf("cmd58 response ERROR. r:%x", r);
        return 1;
    }

    //检查卡通电状态
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    if ((r & 0x80) != 0x80) {
        kprintf("ERROR:OCR bit 31 is 0 . r:%x", r);
        return 1;
    }
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    //sd_cmd_end
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;

// CMD16: 设置 block size
    kprintf("CMD16");
    n = 1000;
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x50;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//cmd_index

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x02;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x15;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//crc

    do {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        kprintf("r,sd:cmd: %x", r);
        kprintf("n,sd:cmd: %x", n);
        if (!(r & 0x80)) {
            break;
        }
    } while (--n > 0);
    
    if(n == 0) {
        kprintf("sd_cmd: timeout");
    }

    if (r != 0x00) {
        kprintf("cmd0 response ERROR. r:%x", r);
        return 1;
    }

    //sd_cmd_end
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;

/*
// CMD17
    kprintf("CMD17");
    n = 1000;
    kprintf("LOADING  ");
    REG32(spi, SPI_REG_SCKDIV) = (F_CLK / 50000000UL);//读写的时钟
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x51;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//cmd_index

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//crc

    do {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        kprintf("r,sd:cmd: %x", r);
        kprintf("n,sd:cmd: %x", n);
        if (!(r & 0x80)) {
            break;
        }
    } while (--n > 0);
    
    if(n == 0) {
        kprintf("sd_cmd: timeout");
    }

    if (r != 0x00) {
        kprintf("cmd17 response ERROR. r:%x", r);
        return 1;
    }

    kprintf("end r:%x", r);



    // uint8_t i = PAYLOAD_SIZE;
    // uint8_t x;
    // volatile uint8_t *p = (void *)(PAYLOAD_DEST);

    // do {

    // uint16_t crc = 0, crc_exp;
    long m = 512;
    // REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
    } while (r != 0xFE);
    kprintf("Get token!r,sd:cmd: %x", r);
    do {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
            kprintf("r,sd:cmd: %x", r);
        } while (r < 0);
        // *p++ = r;
        // uint8_t x = sd_dummy();
        // crc = crc16_round(crc, x);
        kprintf("m: %x", m);
    } while (--m > 0);
    // crc_exp = ((uint16_t)sd_dummy() << 8);
    // crc_exp |= sd_dummy();
    // if (crc != crc_exp) {
    //     kputs("CRC mismatch ");
    //     break;
    // }
    // if (SPIN_UPDATE(n)) {
	// 	kputc('\b');
	// 	kputc(spinner[SPIN_INDEX(n)]);
	// }

    // } while (--i > 0);

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    kprintf("Get crc1. r: %x", r);
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    //接受crcout，但不进行crc校验
    kprintf("Get crc2. r: %x", r);

    // REG32(spi, SPI_REG_TXFIFO) = 0xff;
    // do {
    //     r = REG32(spi, SPI_REG_RXFIFO);
    // } while (r < 0);

    // REG32(spi, SPI_REG_TXFIFO) = 0xff;
    // do {
    //     r = REG32(spi, SPI_REG_RXFIFO);
    // } while (r < 0);



    //sd_cmd_end
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;



//CMD24：单块写
    kprintf("CMD24");
    n = 1000;
    REG32(spi, SPI_REG_SCKDIV) = (F_CLK / 50000000UL);//读写的时钟
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x58;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//cmd_index

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//crc

    do {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        kprintf("r,sd:cmd: %x", r);
        kprintf("n,sd:cmd: %x", n);
        if (!(r & 0x80)) {
            break;
        }
    } while (--n > 0);

    if(n == 0) {
        kprintf("sd_cmd: timeout");
    }

    if (r != 0x00) {
        kprintf("cmd24 response ERROR. r:%x", r);
        return 1;
    }

    kprintf("send single write token");
    REG32(spi, SPI_REG_TXFIFO) = 0xfe;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    for(int i = 0; i < 512; i++) {
        REG32(spi, SPI_REG_TXFIFO) = i & 0xFF;
        kprintf("i: %x", i);
        kprintf("i (low 8 bits): %x", i & 0xFF);  // 输出i的低8位
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
    }

    //write CRC
    REG32(spi, SPI_REG_TXFIFO) = 0xaa;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);    
    REG32(spi, SPI_REG_TXFIFO) = 0xaa;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    for(int i = 0; i < 20; i++) {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        kprintf("i: %x", i);
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
    }

    //sd_cmd_end
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    kprintf("r,sd:cmd: %x", r);
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;




//CMD25：多块写
    kprintf("CMD25");
    n = 1000;
    REG32(spi, SPI_REG_SCKDIV) = (F_CLK / 50000000UL);//读写的时钟
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x59;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//cmd_index

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//crc

    do {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        kprintf("r,sd:cmd: %x", r);
        kprintf("n,sd:cmd: %x", n);
        if (!(r & 0x80)) {
            break;
        }
    } while (--n > 0);

    if(n == 0) {
        kprintf("sd_cmd: timeout");
    }

    if (r != 0x00) {
        kprintf("cmd25 response ERROR. r:%x", r);
        return 1;
    }

    kprintf("send multi write token");
    REG32(spi, SPI_REG_TXFIFO) = 0xfc;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    for(int i = 0; i < 512; i++) {
        REG32(spi, SPI_REG_TXFIFO) = i & 0xFF;
        kprintf("i: %x", i);
        kprintf("i (low 8 bits): %x", i & 0xFF);  // 输出i的低8位
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
    }

    //write CRC
    REG32(spi, SPI_REG_TXFIFO) = 0xaa;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);    
    REG32(spi, SPI_REG_TXFIFO) = 0xaa;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    for(int i = 0; i < 20; i++) {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        kprintf("i: %x", i);
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
    }

    REG32(spi, SPI_REG_TXFIFO) = 0xfd;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    //sd_cmd_end
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    kprintf("r,sd:cmd: %x", r);
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;

    for (int i = 0; i < 1000000; i++);  // 简单的忙等待，大约 1ms
*/


// CMD18: 读取多个 block
    kprintf("CMD18");
    kprintf("LOADING  ");
    n = 1000;
    // REG32(spi, SPI_REG_SCKDIV) = (F_CLK / 50000000UL);//读写的时钟
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;

    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x52;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//cmd_index

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0xe1;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//crc

    do {
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        kprintf("r,sd:cmd: %x", r);
        kprintf("n,sd:cmd: %x", n);
        if (!(r & 0x80)) {
            break;
        }
    } while (--n > 0);
    
    if(n == 0) {
        kprintf("sd_cmd: timeout");
    }

    if (r != 0x00) {
        kprintf("cmd18 response ERROR. r:%x", r);
        return 1;
    }

    kprintf("end r:%x", r);

    
    volatile uint8_t *p = (void *)(PAYLOAD_DEST);
    uint16_t i = PAYLOAD_SIZE;
    // uint8_t i = 2;
    int stop = 0;//stop transmission flag
    do {
        // uint16_t crc = 0, crc_exp;
        long m = 512;
        // REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            REG32(spi, SPI_REG_TXFIFO) = 0xff;
            do {
                r = REG32(spi, SPI_REG_RXFIFO);
            } while (r < 0);
        } while (r != 0xFE);
        kprintf("Get token!r,sd:cmd: %x", r);

receive:
        do {
            REG32(spi, SPI_REG_TXFIFO) = 0xff;
            do {
                r = REG32(spi, SPI_REG_RXFIFO);
                // kprintf("r,sd:cmd: %x", r);
            } while (r < 0);
            *p++ = r;
            kprintf("i: %x, m: %x", i, m);

            //设置连续读取结束
            if (i == 1 && m == 254){
                kprintf("Checking: i = %x, m = %x", i, m);
                stop = 1;
                // m = m - 1;
                m = m - 7;
                goto cmd12;
            }
        } while (--m > 0);

        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        kprintf("Get crc1. r: %x", r);
        REG32(spi, SPI_REG_TXFIFO) = 0xff;
        do {
            r = REG32(spi, SPI_REG_RXFIFO);
        } while (r < 0);
        //接受crcout，但不进行crc校验
        kprintf("Get crc2. r: %x", r);
    } while (--i > 0);

    //sd_cmd_end
    REG32(spi, SPI_REG_TXFIFO) = 0xff;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;

    if (stop){
        goto end;
    }

//cmd12
cmd12:
    kprintf("cmd12");
    REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_HOLD;

    // //sd_dummy
    // REG32(spi, SPI_REG_TXFIFO) = 0xff;
    // do {
    //     r = REG32(spi, SPI_REG_RXFIFO);
    // } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x4c;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//cmd_index

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x00;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);

    REG32(spi, SPI_REG_TXFIFO) = 0x01;
    do {
        r = REG32(spi, SPI_REG_RXFIFO);
    } while (r < 0);//crc

    // //sd_cmd_end
    // REG32(spi, SPI_REG_TXFIFO) = 0xff;
    // do {
    //     r = REG32(spi, SPI_REG_RXFIFO);
    // } while (r < 0);
    // REG32(spi, SPI_REG_CSMODE) = SPI_CSMODE_AUTO;
    
    if (stop){
        // m = m - 7;
        goto receive;
    }


end:
    kprintf("r,sd:cmd: %x", r);
    kprintf("cmd end");

    kprintf("Test end ! @ core: 0x%x", read_csr(mhartid));

	if (1){
		kprintf("PASS");
	}
	else{
		kprintf("FAIL");
	}

	kprintf(SHUTDOWN_FLAG_STR);  // donnot delete

	return 0;
}
