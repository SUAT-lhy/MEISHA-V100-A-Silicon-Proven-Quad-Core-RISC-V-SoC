package axi_agent_pkg;
    
    import top_pkg::*;
    import uvm_pkg::*;
    import axi_dec_pkg::*;

    `include "uvm_macros.svh"
    `include "axi_transaction.sv"
    `include "axi_write_seq.sv"
    `include "axi_read_seq.sv"
    `include "axi_m_driver.sv"
    `include "axi_s_monitor.sv"
    `include "axi_s_driver.sv"
    `include "axi_agent_cfg.sv"
    `include "axi_agent.sv"

endpackage
