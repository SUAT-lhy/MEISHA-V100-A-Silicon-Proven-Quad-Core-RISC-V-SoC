// Vendor 		: 
// Author 		: ling
// Filename 	: uart_test 
// Date Created: 2022.04.26 
// Version		: V1.0
// File description	:
// Revision History :

package uart_bind_lib_pkg;
  // dep packages
  import uvm_pkg::*;
  //import cip_base_pkg::*;
  import top_pkg::*;
  import bind_abs_pkg::*;

  // macro includes
  `include "uvm_macros.svh"

  // functions

  // package sources
  `include "uart_port_info.sv"
  `include "uart_intf_c.sv"

  
endpackage
