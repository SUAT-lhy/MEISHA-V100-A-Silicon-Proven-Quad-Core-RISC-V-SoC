// Vendor 		: 
// Author 		: zjl
// Filename 	: spi_test_pkg 
// Date Created: 2024.03.10 
// Version		: V1.0
// File description	:
// Revision History :

`define BOOTROM_HIR tb.u_VC707BaseShell.topDesign.topMod.maskROM.rom
`define BOOTROM_DEPTH 32'h1000
`define BOOTROM_WIDTH 32

`define DDR_MEM_HIR device_seq[0].mem
`define DDR_MEM_DEPTH 32'h4_0000
`define DDR_MEM_WIDTH 64
`define DDR_MEM_BYTE_DEPTH 32'h0_8000

// `include "spi_if.sv"
package spi_test_pkg;
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
  `include "spi_test.sv"


endpackage

`undef BOOTROM_HIR
`undef BOOTROM_DEPTH
`undef BOOTROM_WIDTH

`undef DDR_MEM_HIR
`undef DDR_MEM_DEPTH
`undef DDR_MEM_WIDTH
`undef DDR_MEM_BYTE_DEPTH
`undef DDR_MEM_BASE_ADDR