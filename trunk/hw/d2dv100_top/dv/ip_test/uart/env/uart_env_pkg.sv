
package uart_env_pkg;
  // dep packages
  import uvm_pkg::*;
  import top_pkg::*;
  import dv_utils_pkg::*;
  import csr_utils_pkg::*;
  import dv_lib_pkg::*;
  import tl_agent_pkg::*;
  import uart_agent_pkg::*;
  import cip_base_pkg::*;
  import dv_base_reg_pkg::*;
  import tlul_base_env_pkg::*;

  // macro includes
  `include "uvm_macros.svh"
  `include "dv_macros.svh"

  // types
  // parameters
  typedef enum int {
    SpiHostError     = 0,
    SpiHostEvent     = 1,
    NumSpiHostIntr   = 2
  } uart_host_intr_e;

  // alerts
  parameter uint NUM_ALERTS = 1;
  parameter string LIST_OF_ALERTS[] = {"fatal_fault"};

  // functions

  // package sources
//   `include "uart_host_env_cfg.sv"
//   `include "uart_host_env_cov.sv"
  `include "uart_env.sv"
////  `include "uart_scoreboard.sv"

endpackage : uart_env_pkg