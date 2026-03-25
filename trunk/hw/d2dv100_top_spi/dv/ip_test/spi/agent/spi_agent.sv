
// class spi_agent extends dv_base_agent#(
//     .CFG_T          (spi_agent_cfg),
//     .DRIVER_T       (spi_driver),
//     .HOST_DRIVER_T  (spi_host_driver),
//     .DEVICE_DRIVER_T(spi_device_driver),
//     .SEQUENCER_T    (spi_sequencer),
//     .MONITOR_T      (spi_monitor),
//     .COV_T          (spi_agent_cov)
//   );
class spi_agent extends uvm_agent;
  protected uvm_active_passive_enum is_active = UVM_ACTIVE;
  // spi_driver
  spi_monitor mon;
  spi_agent_cfg cfg;

  `uvm_component_utils(spi_agent);

  function new(string name = "spi_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon = spi_monitor::type_id::create("mon", this);
    cfg = spi_agent_cfg::type_id::create("cfg", this);

    if (!uvm_config_db#(virtual spi_if)::get(this, "", "spi_if", cfg.spi_if)) begin
      `uvm_fatal(get_full_name(), "failed to get spi_if from uvm_config_db")
    end
    if (!uvm_config_db#(virtual spi_if2)::get(this, "", "spi_if2", cfg.spi_if2)) begin
      `uvm_fatal(get_full_name(), "failed to get spi_if2 from uvm_config_db")
    end
    uvm_config_db#(spi_agent_cfg)::set(null, "*", "spi_cfg", cfg);
    // if (is_active == UVM_ACTIVE) begin
    //   drv = spi_driver::type_id::create("drv", this);
    // end
  endfunction

endclass
