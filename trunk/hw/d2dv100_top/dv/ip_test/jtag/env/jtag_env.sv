
class jtag_env extends uvm_env;
  `uvm_component_utils(jtag_env)
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  jtag_agent m_jtag_agent;
  jtag_agent_cfg cfg;

  // virtual uart_if uart_if;
  // uart_scoreboard scb;

  uvm_tlm_analysis_fifo#(jtag_item) jtag_fifo;
//   uvm_tlm_analysis_fifo#() ;
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("jtagagentc");
    m_jtag_agent = jtag_agent::type_id::create("m_jtag_agent", this);
    cfg = jtag_agent_cfg::type_id::create("cfg", this);
    uvm_config_db#(jtag_agent_cfg)::set(null, "*", "cfg", cfg);
    // scb = uart_scoreboard::type_id::create("scb", this);

    jtag_fifo = new("jtag_fifo", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //m_jtag_agent.monitor.host_analysis_port.connect(jtag_fifo.analysis_export);
    // scb.uart_port.connect(uart_fifo.blocking_get_export);
  endfunction

endclass