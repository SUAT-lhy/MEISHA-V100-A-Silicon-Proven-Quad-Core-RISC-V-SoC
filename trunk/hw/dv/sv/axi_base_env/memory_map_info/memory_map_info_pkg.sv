// Vendor 		: 
// Author 		: ling
// Filename 	: memory_map_info_pkg 
// Date Created: 2022.04.26 
// Version		: V1.0
// File description	:
// Revision History :

package memory_map_info_pkg;
  // dep packages
  import uvm_pkg::*;
  // import dv_utils_pkg::*;
  // import csr_utils_pkg::*;
  // import tl_agent_pkg::*;
  // import dv_lib_pkg::*;
  // import cip_base_pkg::*;
  // import axi_xbar_ral_pkg::*;

  // macro includes
  `include "uvm_macros.svh"
  //`include "dv_macros.svh"

  // local parameters and types
  // These are currently hardcoded to 1 - this will need to change if design is modified
  // parameter uint NUM_HARTS = 1;
  // parameter uint NUM_TIMERS = 1;

  // typedef class axi_xbar_env_cfg;
  // typedef class axi_xbar_env_cov;
  // typedef cip_base_virtual_sequencer #(axi_xbar_env_cfg,
  //                                      axi_xbar_env_cov) axi_xbar_virtual_sequencer;

  // functions

  // package sources
  `include "access_addr_info.sv"
  `include "slv_port_info.sv"
  `include "mst_port_info.sv"
  `include "memory_map_info.sv"
endpackage
