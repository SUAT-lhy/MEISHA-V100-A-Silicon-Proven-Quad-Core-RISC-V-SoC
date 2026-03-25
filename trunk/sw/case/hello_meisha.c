// See LICENSE for license details.
#include <stdint.h>


#include <platform.h>

#include "common.h"

#define DEBUG
//#define DYNAMIC_SWITCH_CLK
#define SOC_IRAM_MAX_SIZE 0x200
#define PRINT_INFO_INDENT (SOC_IRAM_MAX_SIZE>>2)
#include "kprintf.h"

int main(void){

// move to head.S
	//smp_pause(s1, s2);

    //asm volatile("li sp, (PAYLOAD_DEST + 0x7fff000);");

  //REG32(uart, UART_REG_DIV) = 271;  // 
  REG32(uart, UART_REG_DIV) = 1;
  REG32(uart, UART_REG_RXCTRL) = UART_TXEN;
  REG32(uart, UART_REG_TXCTRL) = UART_RXEN;  // donot delete
  _REG32(_AC(0x51000000, UL), 0x18) = (18 << 15) + (20 << 10) + (0x0 << 5) + (0x0);  // SOC_LSYS cfg pll cfg donot need switch pll

	kprintf("Test begin ! @ core: 0x%x, compiler date: %s, time: %s", read_csr(mhartid), __DATE__,__TIME__);

	kprintf("Hello MEISHA!");
	
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
