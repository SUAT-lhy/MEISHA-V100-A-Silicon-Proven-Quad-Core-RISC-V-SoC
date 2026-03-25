
class uart_env extends uvm_env;
  `uvm_component_utils(uart_env)
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  uart_agent m_uart_agent;
  ////uart_agent_cfg cfg;

  // virtual uart_if uart_if;
  // uart_scoreboard scb;

  uvm_tlm_analysis_fifo#(uart_item) uart_fifo;
//   uvm_tlm_analysis_fifo#() ;
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_uart_agent = uart_agent::type_id::create("m_uart_agent", this);
    ////cfg = uart_agent_cfg::type_id::create("cfg", this);
    // scb = uart_scoreboard::type_id::create("scb", this);

    uart_fifo = new("uart_fifo", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //m_uart_agent.mon.host_analysis_port.connect(uart_fifo.analysis_export);
    // scb.uart_port.connect(uart_fifo.blocking_get_export);
  endfunction

endclass