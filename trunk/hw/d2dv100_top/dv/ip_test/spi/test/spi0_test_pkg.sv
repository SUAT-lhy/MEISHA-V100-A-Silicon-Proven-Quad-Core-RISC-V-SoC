// Vendor 		: 
// Author 		: zjl
// Filename 	: spi_test_pkg 
// Date Created: 2024.03.10 
// Version		: V1.0
// File description	:
// Revision History :

// `include "spi_if.sv"
package spi0_test_pkg;
  // dep packages
  import uvm_pkg::*;
  //import cip_base_pkg::*;
  import top_pkg::*;
  import tl_agent_pkg::*;
  import bind_abs_pkg::*;
  import dv_lib_pkg::*;
  import tlul_base_env_pkg::*;
  import spi_env_pkg::*;
  import spi_agent_pkg::*;
  

  // Types of memories in the chip.
  typedef enum {
    FlashBank0Data,
    FlashBank1Data,
    FlashBank0Info,
    FlashBank1Info,
    Otp,
    RamMain,
    RamRet,
    Rom
  } chip_mem_e;


  // macro includes
  `include "uvm_macros.svh"
  `include "spi_macros.svh"

  // functions

  // package sources


endpackage


`undef BOOTROM_HIR
`undef BOOTROM_DEPTH
`undef BOOTROM_WIDTH

`undef DDR_MEM_HIR
`undef DDR_MEM_DEPTH
`undef DDR_MEM_WIDTH
`undef DDR_MEM_BYTE_DEPTH
`undef DDR_MEM_BASE_ADDR