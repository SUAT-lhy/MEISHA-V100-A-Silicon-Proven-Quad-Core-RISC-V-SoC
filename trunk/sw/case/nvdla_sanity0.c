// See LICENSE for license details.
#include <stdint.h>


#include <platform.h>

#include "common.h"

#define DEBUG
//#define DYNAMIC_SWITCH_CLK
#define SOC_IRAM_MAX_SIZE 0x200   // 1M
#define PRINT_INFO_INDENT (SOC_IRAM_MAX_SIZE>>2)

#include "kprintf.h"

#include "nvdla.h"

#define NVDLA_BASE 0x53000000UL
// #define reg_write(addr,val) reg_write32(NVDLA_BASE+addr,val)
// #define reg_read(addr) reg_read32(NVDLA_BASE+addr)

// #define reg_write(addr, val) _REG32(NVDLA_BASE, (addr))=(val)
// #define reg_read(addr) _REG32(NVDLA_BASE, (addr))



int main(void) {

  uint32_t pass_flag;
  register int check_idx;
  uint32_t return_value;
  //REG32(uart, UART_REG_DIV) = 271;  // 
  REG32(uart, UART_REG_DIV) = 1;
  REG32(uart, UART_REG_RXCTRL) = UART_TXEN;
  REG32(uart, UART_REG_TXCTRL) = UART_RXEN;  // donot delete


  kprintf("Test begin ! @ core: 0x%x, compiler date: %s, time: %s", read_csr(mhartid), __DATE__,__TIME__);

  _REG32(_AC(0x51000000, UL), 0x100) = (0x0 << 31) + (0x3 << 29) + (0x3 << 23) + (0x2 << 20) + (0x1 << 18);  
  // wait more than 1us
  // check pll lock 100 times
	for(int i = 1; i >= 0; i--) {
		kprintf("Info: test pll state index: 0x%x - 0x%x", i, _REG32(_AC(0x51000000, UL), 0x20));
	}
  _REG32(_AC(0x51000000, UL), 0x18) = (0x1 << 15) + (0x1 << 10) + (0x1 << 5) + (0x1);  // SOC_LSYS cfg pll cfg, use pll output default clk
	
  //test_nvdla();
	_REG32(_AC(0x51000000, UL), 0x30) = (0x0 << 1) + (0x0 << 0);
	kprintf("Info: release nvdla ip rst 0x%x", _REG32(_AC(0x51000000, UL), 0x30));
  
  register uint64_t cycle1 = rdcycle();
    
  kprintf("begin check nvdla, cycle1: %x\n", cycle1);

  // read_reg 0xffff100b 0xffffffe0 0x00000000 #NVDLA_BDMA.CFG_DST_SURF_0
  // write_reg 0xffff100b 0xf0a5a500 #NVDLA_BDMA.CFG_DST_SURF_0
  // read_reg 0xffff100b 0xffffffe0 0xf0a5a500 #NVDLA_BDMA.CFG_DST_SURF_0
  pass_flag = 1;
  return_value = _REG32(NVDLA_BASE, 0x100b);
    if (return_value != 0x0){
      pass_flag = 0;
      kprintf("begin check nvdla NVDLA_BDMA.CFG_DST_SURF_0, value %x not expect : %x\n", return_value, 0x0);
      break;
    }
    _REG32(NVDLA_BASE, 0x100b) = 0xf0a5a500;
    return_value = _REG32(NVDLA_BASE, 0x100b);
    if (return_value != 0xf0a5a500){
      pass_flag = 0;
      kprintf("begin check nvdla NVDLA_BDMA.CFG_DST_SURF_0, value %x not expect : %x\n", return_value, 0xf0a5a500);
      break;
    }

    uint64_t cycle2 = rdcycle();
    //printf("cycle1: %lu, cycle2: %lu, diff: %lu\n", cycle1, cycle2, cycle2 - cycle1 );
    kprintf("cycle1: %x, cycle2: %x, diff: %x, check_idx: %x\n", cycle1, cycle2, cycle2 - cycle1, check_idx);



	kprintf("Test end ! @ core: 0x%x", read_csr(mhartid));

	if (pass_flag){
		kprintf("PASS");
	}
	else{
		kprintf("FAIL");
	}

	kprintf(SHUTDOWN_FLAG_STR);  // donnot delete

	return 0;
}

