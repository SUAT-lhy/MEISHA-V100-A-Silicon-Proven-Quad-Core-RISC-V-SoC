class spi_env extends uvm_env;
  `uvm_component_utils(spi_env)
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  spi_agent m_spi_agent;
  spi_agent_cfg cfg;

  spi_scoreboard spi_scb;

  // virtual spi_if spi_if;
  // spi_scoreboard scb;

  uvm_tlm_analysis_fifo#(spi_item) spi_fifo;
//   uvm_tlm_analysis_fifo#() ;
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_spi_agent = spi_agent::type_id::create("m_spi_agent", this);
    cfg = spi_agent_cfg::type_id::create("cfg", this);
    spi_scb = spi_scoreboard::type_id::create("spi_scb", this);

    spi_fifo = new("spi_fifo", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    m_spi_agent.mon.host_analysis_port.connect(spi_fifo.analysis_export);
    spi_scb.spi_port.connect(spi_fifo.blocking_get_export);
  endfunction

endclass