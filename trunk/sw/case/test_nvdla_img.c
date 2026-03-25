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
  unsigned long check_idx;
  uint32_t dt_offset_addr;
  uint32_t wt_offset_addr;
  uint32_t sdp_d_dst_base_addr;
  //uint32_t * ddr_ptr;
  //uint32_t *pcie_lsys_ptr;
  //unsigned long test;
  //test = 0x5a5a;
  //uint64_t test_addr[9];
  //uint64_t base_addr;
  //uint64_t incr_addr;
  //uint32_t *test_ptr;
  // uint64_t *test_ptr_64;
  // uint64_t temp_data;
  // uint64_t dut_data;
  // uint32_t temp_data_32;
  // uint64_t soc_iram_max_size_64 = SOC_IRAM_MAX_SIZE ;

  // // test_addr[0] = 0x60000000UL;   // failed
  // // test_addr[0] = 0x40000000UL;   // failed
  // test_addr[0] = 0xa8000000UL;   //
  // // test_addr[1] = 0x08000000UL;   // failed
  // test_addr[1] = 0x88000000UL;   // ddr
  // test_addr[2] = 0x02000000UL;   // clint
  // //test_addr[3] = 0x00002000UL;   // gpio failed
  // test_addr[3] = 0xa0002000UL;   //  
  // test_addr[4] = 0xb2000000UL;   // ddr
  // //test_addr[5] = 0xc3000000UL;   // ddr failed
  // test_addr[5] = 0x99000000UL;
  // test_addr[6] = 0x50000000UL;   // soc iram
  // test_addr[7] = 0x52000000UL;   //  spi_1
  // test_addr[8] = 0x2000000000UL;   // pcie slave timeout
  // //test_addr[7] = 0x51000008UL;   //  lsys donnot access , maybe access control register
  
  //REG32(uart, UART_REG_DIV) = 271;  // 
  REG32(uart, UART_REG_DIV) = 1;
  REG32(uart, UART_REG_RXCTRL) = UART_TXEN;
  REG32(uart, UART_REG_TXCTRL) = UART_RXEN;  // donot delete


  kprintf("Test begin ! @ core: 0x%x, compiler date: %s, time: %s", read_csr(mhartid), __DATE__,__TIME__);

  // config pll clko0 500M clko1 250M clko2 100M, VCO = 2000M
	_REG32(_AC(0x51000000, UL), 0x10) = (0x0 << 30)/**/ + (50 << 18)/*fbdiv*/ + (0x3 << 15)/*postdiv0_0*/ + (0x0 << 12)/*postdiv1_0*/ + (0x3 << 9)/*postdiv0_1*/ + (0x1 << 6)/*postdiv1_1*/ + (0x4 << 3)/*postdiv0_1*/ + (0x3 << 0)/*postdiv1_1*/;
	
	// need bigger than 1us
	for(int i = 1; i >= 0; i--) {
		dprintf("Info: cfg pll parameter 0x%x - 0x%x\r\n", i, _REG32(_AC(0x51000000, UL), 0x10));
	}

	_REG32(_AC(0x51000000, UL), 0x100) = (0x0 << 31) + (0x3 << 29) + (0x3 << 23) + (0x2 << 20) + (0x1 << 18);

	// cfg sdram parameter default 10m
  // cfg sdram parameter to 50m
			_REG32(_AC(0x51000000, UL), 0x200) = 5000;
			_REG32(_AC(0x51000000, UL), 0x208) = 1561;
			_REG32(_AC(0x51000000, UL), 0x210) = 2;
			_REG32(_AC(0x51000000, UL), 0x218) = 2;
			_REG32(_AC(0x51000000, UL), 0x220) = 4;
	// config pll to clk_cpu: 400M + clk_main: 250M + clk_ddr: 50M + clk_chiplink: 20M
	_REG32(_AC(0x51000000, UL), 0x18) = (0x2 << 15) + (0x4 << 10) + (0x1 << 5) + (0x1);  // SOC_LSYS cfg pll cfg
	kprintf("Info: end switch work clk to pll output: 0x%x", _REG32(_AC(0x51000000, UL), 0x20));
  
  wt_offset_addr = 0x11000000;
	kprintf("Info: prepare nvdla ip wt, use backdoor load to addr %x in it env", wt_offset_addr);
  // #include "img_51x96x4_1x10x4x32_A8B8G8R8_int8_0/img_51x96x4_1x10x4x32_A8B8G8R8_int8_0_wt.c"

  dt_offset_addr = 0x10000000;
	kprintf("Info: prepare nvdla ip dt, use backdoor load to addr %x in it env", dt_offset_addr);
  // #include "img_51x96x4_1x10x4x32_A8B8G8R8_int8_0/img_51x96x4_1x10x4x32_A8B8G8R8_int8_0_dt.c"

  //test_nvdla();
	_REG32(_AC(0x51000000, UL), 0x30) = (0x1 << 31) + (0x1 << 30) + (0x1 << 17) + (0x1 << 16) + (0x0 << 1) + (0x0 << 0);
	kprintf("Info: release nvdla ip rst 0x%x", _REG32(_AC(0x51000000, UL), 0x30));

    register uint64_t cycle1 = rdcycle();

    
	kprintf("Info: prepare nvdla ip cfg");
  sdp_d_dst_base_addr = 0xB3000000;
  //sdp_d_dst_base_addr = 0x930000e0;
  #include "img_51x96x4_1x10x4x32_A8B8G8R8_int8_0/img_51x96x4_1x10x4x32_A8B8G8R8_int8_0_reg.c"
    
    kprintf("begin check nvdla glb_s_intr_status, cycle1: %x\n", cycle1);
    pass_flag = 0;
    for (check_idx = 0; check_idx < 0xf20000; check_idx++) {
        if ((_REG32(NVDLA_BASE, GLB_S_INTR_STATUS_0) & 0x1) == 0x1){
          if(_REG32(sdp_d_dst_base_addr, 0x0) == 0x807f7f80) {
              pass_flag = 1;
              // check dst value
          }
          else {
            kprintf("sdp_d_dst_valud %x is not expect 0x807f7f80 \n", _REG32(sdp_d_dst_base_addr, 0x0));
          }
          break;
        }
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

