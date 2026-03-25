// Vendor 		: 
// Author 		: zjl
// Filename 	: spi_test_pkg 
// Date Created: 2024.03.10 
// Version		: V1.0
// File description	:
// Revision History :

// `include "spi_if.sv"
package uart_test_pkg;
  // dep packages
  import uvm_pkg::*;
  import cip_base_pkg::*;
  import top_pkg::*;
  import tl_agent_pkg::*;
  import bind_abs_pkg::*;
  import dv_lib_pkg::*;
  import tlul_base_env_pkg::*;
  import uart_env_pkg::*;
  import uart_agent_pkg::*;
  
`define BOOTROM_HIR tb.u_VC707BaseShell.topDesign.topMod.maskROM.rom
`define BOOTROM_DEPTH 32'h1000
`define BOOTROM_WIDTH 32

`define DDR_MEM_HIR device_seq[0].mem
`define DDR_MEM_DEPTH 32'h4_0000
`define DDR_MEM_WIDTH 64
`define DDR_MEM_BYTE_DEPTH 32'h0_8000

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
  `include "uart_macros.svh"

  // functions

  // package sources
  `include "uart_test.sv"


endpackage

`undef DRAM_HIR 
`undef MEM_WIDTH
`undef MEM_DEPTH_TB