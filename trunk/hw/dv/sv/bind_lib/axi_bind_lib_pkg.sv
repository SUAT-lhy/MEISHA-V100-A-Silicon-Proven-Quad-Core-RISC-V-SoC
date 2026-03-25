// Vendor 		: 
// Author 		: ling
// Filename 	: axi_test 
// Date Created: 2022.04.26 
// Version		: V1.0
// File description	:
// Revision History :

package axi_bind_lib_pkg;
  // dep packages
  import uvm_pkg::*;
  //import cip_base_pkg::*;
  import top_pkg::*;
  import axi_agent_pkg::*;
  import bind_abs_pkg::*;

  // macro includes
  `include "uvm_macros.svh"

  // functions

  // package sources
  `include "apb_port_info.sv"
  `include "axi_port_info.sv"
  `include "apb_intf_c.sv"
  `include "axi_intf_c.sv"

  
endpackage
