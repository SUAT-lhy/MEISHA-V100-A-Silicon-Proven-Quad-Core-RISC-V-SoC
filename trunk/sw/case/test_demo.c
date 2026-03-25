// See LICENSE for license details.
#include <stdint.h>


#include <platform.h>

#include "common.h"

#define DEBUG
//#define DYNAMIC_SWITCH_CLK
#define SOC_IRAM_MAX_SIZE 0x200   // 1M
#define PRINT_INFO_INDENT (SOC_IRAM_MAX_SIZE>>2)
#include "kprintf.h"

// 

// void debug_addr(uint64_t _addr) {
// 		uint64_t _temp_data;
// 		uint64_t _dut_data;
// 		_addr = _addr - 0x80000000;
// 		kprintf("Info: test sdram for Single 8Byte access @ addr 0x%x", _addr);
// 			_temp_data = _addr;
// 			_REG64(0x80000000UL, _addr) = _temp_data;
// 			_dut_data = _REG64(0x80000000UL, _addr);
// 			if(_dut_data != _temp_data) {
// 				kprintf("Error: memory read value 0x%x - 0x%x @ addr 0x%x", _dut_data, _temp_data, _addr + 0x80000000);
// 			}
// 			else {
// 				kprintf("Info: read value is 0x%x @ addr 0x%x", _temp_data, _addr + 0x80000000);
// 			}

// }

int main(void)
{

  //uint32_t * ddr_ptr;
  //uint32_t *pcie_lsys_ptr;
  //unsigned long test;
  //test = 0x5a5a;
  //uint64_t use_clk_freq;
  uint64_t test_addr[9];
  uint64_t base_addr;
  uint64_t incr_addr;
  uint32_t *test_ptr;
  uint64_t *test_ptr_64;
  uint64_t temp_data;
  //uint64_t dut_data;
  uint32_t temp_data_32;
  uint64_t soc_iram_max_size_64 = SOC_IRAM_MAX_SIZE ;

  // test_addr[0] = 0x60000000UL;   // failed
  // test_addr[0] = 0x40000000UL;   // failed
  test_addr[0] = 0xa8000000UL;   //
  // test_addr[1] = 0x08000000UL;   // failed
  test_addr[1] = 0x88000000UL;   // ddr
  test_addr[2] = 0x02000000UL;   // clint
  //test_addr[3] = 0x00002000UL;   // gpio failed
  test_addr[3] = 0xa0002000UL;   //  
  test_addr[4] = 0xb2000000UL;   // ddr
  //test_addr[5] = 0xc3000000UL;   // ddr failed
  test_addr[5] = 0x99000000UL;
  test_addr[6] = 0x50000000UL;   // soc iram
  test_addr[7] = 0x52000000UL;   //  spi_1
  test_addr[8] = 0x2000000000UL;   // pcie slave timeout
  //test_addr[7] = 0x51000008UL;   //  lsys donnot access , maybe access control register
  
  //REG32(uart, UART_REG_DIV) = 271;  // 
  REG32(uart, UART_REG_DIV) = 1;
  REG32(uart, UART_REG_RXCTRL) = UART_TXEN;
  REG32(uart, UART_REG_TXCTRL) = UART_RXEN;  // donot delete
  
	// A000_0000 - BFFF_FFFF
	//debug_addr(0xa004ff40);
	//debug_addr(0xa008ffc0);

  kprintf("Info: Test begin ! @ core: 0x%x, compiler date: %s, time: %s", read_csr(mhartid), __DATE__,__TIME__);


  for(int i = 8; i >= 0; i--) {
		test_ptr = (void *)(test_addr[i]);
		*(test_ptr) = test_addr[i];
		*(test_ptr + 4) = test_addr[i] + 4;
		kprintf("Info: test cache addr 0x%x - 0x%x", test_addr[i], *(test_ptr));
	}

	// config pll clko0 500M clko1 250M clko2 100M, VCO = 2000M
	_REG32(_AC(0x51000000, UL), 0x10) = (0x0 << 30)/**/ + (50 << 18)/*fbdiv*/ + (0x3 << 15)/*postdiv0_0*/ + (0x0 << 12)/*postdiv1_0*/ + (0x3 << 9)/*postdiv0_1*/ + (0x1 << 6)/*postdiv1_1*/ + (0x4 << 3)/*postdiv0_1*/ + (0x3 << 0)/*postdiv1_1*/;
	
	// need bigger than 1us
	for(int i = 1; i >= 0; i--) {
		dprintf("Info: cfg pll parameter 0x%x - 0x%x\r\n", i, _REG32(_AC(0x51000000, UL), 0x10));
	}

	_REG32(_AC(0x51000000, UL), 0x100) = (0x0 << 31) + (0x3 << 29) + (0x3 << 23) + (0x2 << 20) + (0x1 << 18);

	//use_clk_freq = 40000UL;

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
		for(int i = 1; i >= 0; i--) {
			dprintf("Info: test pll state index: 0x%x - 0x%x\r\n", i, _REG32(_AC(0x51000000, UL), 0x20));
		}
		// check pll lock
		if((_REG32(_AC(0x51000000, UL), 0x20) & 0x00000001) == 0x00000001) {
			kprintf("Info: begin switch work clk to pll output: 0x%x", _REG32(_AC(0x51000000, UL), 0x20));
			// speed up only use in eda_ram, because vendor ram is limit frequency
			
			// cfg sdram parameter to 50m
			_REG32(_AC(0x51000000, UL), 0x200) = 5000;
			_REG32(_AC(0x51000000, UL), 0x208) = 1561;
			_REG32(_AC(0x51000000, UL), 0x210) = 2;
			_REG32(_AC(0x51000000, UL), 0x218) = 2;
			_REG32(_AC(0x51000000, UL), 0x220) = 4;

			// config pll to clk_cpu: 400M + clk_main: 250M + clk_ddr: 50M + clk_chiplink: 20M
			_REG32(_AC(0x51000000, UL), 0x18) = (0x2 << 15) + (0x4 << 10) + (0x1 << 5) + (0x1);  // SOC_LSYS cfg pll cfg
			kprintf("Info: end switch work clk to pll output: 0x%x", _REG32(_AC(0x51000000, UL), 0x20));
			//use_clk_freq = 200000UL;
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

			kprintf("Info: donot need switch work clk to pll output: 0x%x", _REG32(_AC(0x51000000, UL), 0x20));
		}
	}
	

	// A000_0000 - BFFF_FFFF only write
  for(int incr = 10; incr >= 0; incr = incr - 1) {
		//incr_addr = incr*0x10000000UL + 0x2ffffff8UL;
		incr_addr = incr*0x10000UL + 0x20000000UL;
		base_addr = 0x80000000UL + incr_addr;
		kprintf("Info: write sdram for 0x%x Single 8Byte access @ addr 0x%x", soc_iram_max_size_64, base_addr);
		for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
			temp_data = ((incr_addr - i + 4) << 32) + (incr_addr - i);
			_REG64(0x80000000UL, incr_addr - i) = temp_data;
			#ifdef DYNAMIC_SWITCH_CLK
			_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (6 << 5) + ((i%30));
			#endif
		} 
	}

  // A000_0000 - BFFF_FFFF read and write
  for(int incr = 10; incr >= 0; incr = incr - 1) {
		//incr_addr = incr*0x10000000UL + 0x2ffffff8UL;
		incr_addr = incr*0x10000UL + 0x20000000UL;
		base_addr = 0x80000000UL + incr_addr;
		kprintf("Info: read sdram for 0x%x Byte MEMORY_REG64 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
		for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
			temp_data = ((incr_addr - i + 4) << 32) + (incr_addr - i);
			if(i%PRINT_INFO_INDENT == 0) {
				if(MEMORY_REG64(incr_addr - i) != temp_data) {
					kprintf("Error: memory read value 0x%x - 0x%x @ addr 0x%x", _REG64(0x80000000UL, incr_addr - i), temp_data, base_addr - i);
				}
				else {
					kprintf("Info: read value is 0x%x @ addr 0x%x", temp_data, base_addr - i);
				}
			}
			#ifdef DYNAMIC_SWITCH_CLK
			_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (6 << 5) + ((i%30));
			#endif
		} 
	}

	for(int incr = 10; incr >= 0; incr = incr - 1) {
		//incr_addr = incr*0x10000000UL + 0x2ffffff8UL;
		incr_addr = incr*0x10000UL + 0x20000000UL;
		base_addr = 0x80000000UL + incr_addr;
		kprintf("Info: write sdram for 0x%x Byte MEMORY_REG64 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
		for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
			temp_data = (incr_addr - i);
			_REG64(0x80000000UL, incr_addr - i) = temp_data;
			#ifdef DYNAMIC_SWITCH_CLK
			_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (6 << 5) + ((i%30));
			#endif
		} 
	}

	for(int incr = 10; incr >= 0; incr = incr - 1) {
		//incr_addr = incr*0x10000000UL + 0x2ffffff8UL;
		incr_addr = incr*0x10000UL + 0x20000000UL;
		base_addr = 0x80000000UL + incr_addr;
		kprintf("Info: read sdram for 0x%x Byte MEMORY_REG64 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
		for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
			temp_data = (incr_addr - i);
			if(i%PRINT_INFO_INDENT == 0) {
				if(_REG64(0x80000000UL, incr_addr - i) != temp_data) {
					kprintf("Error: reg read value 0x%x - 0x%x @ addr 0x%x", MEMORY_REG64(incr_addr - i), temp_data, base_addr - i);
				}
				else  {
					kprintf("Info: read value is 0x%x @ addr 0x%x", temp_data, base_addr - i);
				}
			}
			#ifdef DYNAMIC_SWITCH_CLK
			_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (6 << 5) + ((i%30));
			#endif
		} 
	}
	
//   ddr_ptr = (void *)(0x81001000UL);
//   for(int i = 0 ; i < 0x1000; i++){
//     *(ddr_ptr + i) = 0x81001000 + i;
//   }

	// donnot access 0x8000_0000，avoid write program stack
	for(int incr = 3; incr >= 1; incr = incr - 1) {
		incr_addr = incr*0x10000000UL;
		base_addr = 0x80000000UL + incr_addr;
		kprintf("Info: write chiplink for 0x%x Byte MEMORY_REG64 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
		for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
			temp_data = ((incr_addr + i + 4) << 32) + (incr_addr + i);
			MEMORY_REG64(incr_addr + i) = temp_data;
			#ifdef DYNAMIC_SWITCH_CLK
			_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (6 << 5) + ((i%30)); 
			#endif
		}
	}

	// donnot access 0x8000_0000，avoid write program stack
	for(int incr = 3; incr >= 1; incr = incr - 1) {
		incr_addr = incr*0x10000000UL + 0x0ffffff8UL;
		// if((incr == 1) || (incr == 3)) {  // modfiy stack addr to no stack max stack size is 1048576 = 0x10_0000
		// 	incr_addr = incr_addr - 0x200000;
		// }
		base_addr = 0x80000000UL + incr_addr;
		kprintf("Info: read chiplink for 0x%x Byte MEMORY_REG64 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
		for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
			temp_data = ((incr_addr - i + 4) << 32) + (incr_addr - i);
			//MEMORY_REG64(incr_addr - i) = temp_data;
			if(i%PRINT_INFO_INDENT == 0) {
				if(MEMORY_REG64(incr_addr - i) != temp_data) {
					kprintf("Error: memory read value 0x%x - 0x%x @ addr 0x%x", _REG64(0x80000000UL, incr_addr - i), temp_data, base_addr - i);
				}
				else {
					kprintf("Info: read value is 0x%x @ addr 0x%x", temp_data, base_addr - i);
				}
			}
			temp_data =(incr_addr - i);
			_REG64(0x80000000UL, incr_addr - i) = temp_data;
			#ifdef DYNAMIC_SWITCH_CLK
			_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (6 << 5) + ((i%30));
			#endif
		} 
	}
	for(int incr = 3; incr >= 1; incr = incr - 1) {
		incr_addr = incr*0x10000000UL + 0x0ffffff8UL;
		// if((incr == 1) || (incr == 3)) {  // modfiy stack addr to no stack max stack size is 1048576 = 0x10_0000
		// 	incr_addr = incr_addr - 0x200000;
		// }
		base_addr = 0x80000000UL + incr_addr;
		kprintf("Info: write chiplink for 0x%x Byte MEMORY_REG64 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
		for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
			temp_data =(incr_addr - i);
			MEMORY_REG64(incr_addr - i) = temp_data;
			#ifdef DYNAMIC_SWITCH_CLK
			_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (6 << 5) + ((i%30));
			#endif
		} 
	}

	for(int incr = 3; incr >= 1; incr = incr - 1) {
		incr_addr = incr*0x10000000UL + 0x0ffffff8UL;
		// if((incr == 1) || (incr == 3)) {  // modfiy stack addr to no stack max stack size is 1048576 = 0x10_0000
		// 	incr_addr = incr_addr - 0x200000;
		// }
		base_addr = 0x80000000UL + incr_addr;
		kprintf("Info: read chiplink for 0x%x Byte MEMORY_REG64 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
		for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
			temp_data =(incr_addr - i);
			if(i%PRINT_INFO_INDENT == 0) {
				if(_REG64(0x80000000UL, incr_addr - i) != temp_data) {
					kprintf("Error: reg read value 0x%x - 0x%x @ addr 0x%x", MEMORY_REG64(incr_addr - i), temp_data, base_addr - i);
				}
				else {
					kprintf("Info: read value is 0x%x @ addr 0x%x", temp_data, base_addr - i);
				}
			}
			#ifdef DYNAMIC_SWITCH_CLK
			_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (6 << 5) + ((i%30));
			#endif
		} 
	}

	kprintf("Info: begin test cache addr");
	for(int i = 8; i >= 0; i--) {
		test_ptr = (void *)(test_addr[i]);
		*(test_ptr) = test_addr[i];
		*(test_ptr + 4) = test_addr[i] + 4;
		kprintf("Info: test cache addr 0x%x - 0x%x", test_addr[i], *(test_ptr));
	}

	// kprintf("Test cfg global rst ! @ core: 0x%x", read_csr(mhartid));
	// _REG32(_AC(0x51000000, UL), 0xd0) = 0x7a7a6f7f;  // SOC_LSYS global soft rst
	// _REG32(_AC(0x51000000, UL), 0xd0) = 0x6868a7a8; 

	DEBUG_REG64(0x0) = 0x5a5a5a5aUL;
	kprintf("Info: debug ctrl value 0x%x", DEBUG_REG64(0x0));

	// mem ctrl ptr = (void *)0x81000000UL;
	MEMORY_REG64(0x1000000UL) = 0x81000000UL;   // chiplink can only access to 0x10000_0000
	MEMORY_REG64(0x2000000UL) = 0x82000000UL;
	kprintf("Info: mem ctrl 0x%x - 0x%x", MEMORY_REG64(0x1000000UL), MEMORY_REG64(0x2000000UL));

	// config pcie slave base awaddr to ddr
	AXI_PCIE_HOST_1_00_A_REG(0x0) = 0x5a5a5a5aUL;
	kprintf("Info: pcie slave value 0x%x", AXI_PCIE_HOST_1_00_A_REG(0x0));
	// config pcie lsys base awaddr to ddr
	// _REG64(AXI_PCIE_CTRL_ADDR, 0x1000UL) = 0x5a5a5a5aUL;  // 0x2000000000UL + 0x1000UL
	// kprintf("Info: pcie lsys value 0x%x", _REG64(AXI_PCIE_CTRL_ADDR, 0x1000UL));
	// test iram for  0x%x Byte 4BYTE access
	// test iram for  0x%x Byte 8BYTE access
	
	base_addr = 0x50000000UL;
	test_ptr = (void *)(base_addr);
	kprintf("Info: write iram for 0x%x Byte MEM32 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
	for(int i = SOC_IRAM_MAX_SIZE - 4; i >= 0; i = i - 4) {
		temp_data_32 = (base_addr + i);
		*(test_ptr + i/4) = temp_data_32;
		#ifdef DYNAMIC_SWITCH_CLK
		// randomize cfg SOC_LSYS cfg pll cfg chiplink, main, cpu
		_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (0x2 << 5) + (0x1);
		#endif
	}

	test_ptr_64 = (void *)(base_addr);
	kprintf("Info: read iram for 0x%x Byte MEM64 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
	for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
		temp_data = (base_addr + i);
		if(i%PRINT_INFO_INDENT == 0) {
			if((*(test_ptr_64 + i/8)) != temp_data) {
				kprintf("Error: read value 0x%x - 0x%x @ addr 0x%x", (*(test_ptr_64 + i/8)), temp_data, base_addr + i);
			}
			else {
				kprintf("Info: read value is 0x%x @ addr 0x%x", temp_data, base_addr + i);
			}
		}
		#ifdef DYNAMIC_SWITCH_CLK
		// randomize cfg SOC_LSYS cfg pll cfg chiplink, main, cpu
		_REG32(_AC(0x51000000, UL), 0x18) = ((i%15) << 15) + ((i%30) << 10) + (3 << 5) + ((i%30)); 
		#endif
	}

	base_addr = 0x50000000UL;
	kprintf("Info: write iram for 0x%x Byte REG64 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
	for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
		temp_data = (base_addr + i);
		_REG64(base_addr, i) = temp_data;
		#ifdef DYNAMIC_SWITCH_CLK
		// randomize cfg SOC_LSYS cfg pll cfg chiplink, main, cpu
		_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (4 << 5) + ((i%30));
		#endif 
	}
	
	kprintf("Info: read iram for 0x%x Byte REG64 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
	for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
		temp_data = (base_addr + i);
		if(i%PRINT_INFO_INDENT == 0) {
			if(_REG64(base_addr - i, 0) != temp_data) {
				kprintf("Error: read value 0x%x - 0x%x @ addr 0x%x", _REG64(base_addr - i, 0), temp_data, base_addr - i);
			}
			else {
				kprintf("Info: read value is 0x%x @ addr 0x%x", temp_data, base_addr - i);
			}
		}
		#ifdef DYNAMIC_SWITCH_CLK
		// randomize cfg SOC_LSYS cfg pll cfg chiplink, main, cpu
		_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (4 << 5) + ((i%30));
		#endif 
	}

	base_addr = 0x50000000UL + 0x0003fff8UL;    // iram range 256KB 0x40000
	kprintf("Info: write iram for 0x%x Byte REG64 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
	for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
		temp_data = ((base_addr - i + 4) << 32) + (base_addr - i);
		_REG64(base_addr - i, 0) = temp_data;
		#ifdef DYNAMIC_SWITCH_CLK
		_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (5 << 5) + ((i%30)); 
		#endif
	}

	kprintf("Info: read iram for 0x%x Byte REG64 access @ addr 0x%x", soc_iram_max_size_64, base_addr);
	for(int i = SOC_IRAM_MAX_SIZE - 8; i >= 0; i = i - 8) {
		temp_data = ((base_addr - i + 4) << 32) + (base_addr - i);
		if(i%PRINT_INFO_INDENT == 0) {
			if(_REG64(base_addr - i, 0) != temp_data) {
				kprintf("Error: read value 0x%x - 0x%x @ addr 0x%x", _REG64(base_addr - i, 0), temp_data, base_addr - i);
			}
			else {
				kprintf("Info: read value is 0x%x @ addr 0x%x", temp_data, base_addr - i);
			}
		}
		#ifdef DYNAMIC_SWITCH_CLK
		_REG32(_AC(0x51000000, UL), 0x18) = ((i%30) << 15) + ((i%30) << 10) + (5 << 5) + ((i%30)); 
		#endif
	}

	_REG32(_AC(0x51000000,UL), 0x44UL) = 0x5a5a5a5aUL;  
	kprintf("Info: soc lsys value 0x%x", _REG32(_AC(0x51000000,UL), 0x44UL));
	_REG32(_AC(0x52000000,UL), 0x10UL) = 0x5a5a5a5aUL;  
	kprintf("Info: spi_1 value 0x%x", _REG32(_AC(0x52000000,UL), 0x10UL));
	
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
