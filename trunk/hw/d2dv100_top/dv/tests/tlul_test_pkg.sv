// Vendor 		: 
// Author 		: ling
// Filename 	: tlul_test 
// Date Created: 2022.04.26 
// Version		: V1.0
// File description	:
// Revision History :

package tlul_test_pkg;
  // dep packages
  import uvm_pkg::*;
  //import cip_base_pkg::*;
  import top_pkg::*;
  import tl_agent_pkg::*;
  import bind_abs_pkg::*;
  import dv_lib_pkg::*;
  import tlul_base_env_pkg::*;
  import spi_env_pkg::*;
  
// `define BOOTROM_HIR tb.u_MEISHAV100_TOP.topDesign.topMod.maskROM.rom
// `define BOOTROM_DEPTH 32'h1000
// `define BOOTROM_WIDTH 32


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

  // functions



class master_info extends uvm_object;

    string mst_name;
    string slv_name_q[$];
    string port_type = "tl";

    `uvm_object_utils_begin(master_info)
        `uvm_field_string(port_type, UVM_DEFAULT)
        `uvm_field_string(mst_name, UVM_DEFAULT)
        `uvm_field_queue_string(slv_name_q, UVM_DEFAULT)
    `uvm_object_utils_end

    //----------------------------------------------------------------------------------------------
    // Parameter Define
    //----------------------------------------------------------------------------------------------

    // Constructor: new
    function new(string name = "master_info");
        super.new(name);
        this.mst_name = name;

    endfunction: new

    function void create_info(string name);
        this.slv_name_q.push_back(name);
    endfunction

endclass: master_info



class slave_info extends uvm_object;

    bit [63:0] start_addr[$];
    bit [63:0] end_addr[$];
    string slv_name;

    `uvm_object_utils_begin(slave_info)
        `uvm_field_queue_int(start_addr, UVM_DEFAULT)
        `uvm_field_queue_int(end_addr, UVM_DEFAULT)
        `uvm_field_string(slv_name, UVM_DEFAULT)
    `uvm_object_utils_end

    //----------------------------------------------------------------------------------------------
    // Parameter Define
    //----------------------------------------------------------------------------------------------

    // Constructor: new
    function new(string name = "slave_info");
        super.new(name);
        this.slv_name = name;

    endfunction: new

    function void create_info(bit [63:0] base_addr, bit [63:0] top_addr);
        this.start_addr.push_back(base_addr);
        this.end_addr.push_back(top_addr - 1);

    endfunction

endclass: slave_info




  // package sources
  `include "tlul_test.sv"
  `include "soft_base_test.sv"
  `include "sram_soft_base_test.sv"
  `include "ddr_c2c_base_test.sv"
  `include "ddr_c2c_loopback_base_test.sv"
  //`include "c2c_base_test.sv"
  `include "uart_base_test.sv"
  `include "chiplink_base_test.sv"
  `include "jtag_soft_base_test.sv"
  `include "master_bus_soft_base_test.sv"
  `include "tlul_mst_2_slv_cross_test.sv"
  `include "spi_slave_soft_base_test.sv"
  `include "spi_slave_base_test.sv"
  `include "spi1_base_test.sv"
  `include "lsys_base_test.sv"
  `include "spi0_base_test.sv"
  `include "linux_soft_base_test.sv"
  `include "nvdla_soft_base_test.sv"
  `include "mig_slave_soft_base_test.sv"

endpackage

`undef BOOTROM_HIR
`undef BOOTROM_DEPTH
`undef BOOTROM_WIDTH

`undef DDR_MEM_HIR
`undef DDR_MEM_DEPTH
`undef DDR_MEM_WIDTH
`undef DDR_MEM_BYTE_DEPTH
`undef DDR_MEM_BASE_ADDR