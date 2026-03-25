
// class uarta_agent extends dv_base_agent#(
//     .CFG_T          (uarta_agent_cfg),
//     .DRIVER_T       (uarta_driver),
//     .HOST_DRIVER_T  (uarta_host_driver),
//     .DEVICE_DRIVER_T(uarta_device_driver),
//     .SEQUENCER_T    (uarta_sequencer),
//     .MONITOR_T      (uarta_monitor),
//     .COV_T          (uarta_agent_cov)
//   );
class uart_agent extends uvm_agent;
  protected uvm_active_passive_enum is_active = UVM_ACTIVE;
  // spi_driver
  uart_monitor mon;
  uart_agent_cfg cfg;

  `uvm_component_utils(uart_agent);

  function new(string name = "uart_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon = uart_monitor::type_id::create("mon", this);
    cfg = uart_agent_cfg::type_id::create("cfg", this);
    //`uvm_info(`gfn, "$sformatf("tx start bit %0b", cfg.vif.uart_tx)", UVM_DEBUG)
    //`uvm_info(`gfn, $sformatf("tx start bit %0b", cfg.vif.uart_tx))
    //`uvm_info("123456debug", UVM_DEBUG)
    $display("12345678");
    //`uvm_info(`gfn, "123456")

    if (!uvm_config_db#(virtual uart_if)::get(this, "", "uart_if", cfg.vif)) begin
        `uvm_fatal(get_full_name(), "failed to get uart_if from uvm_config_db")
    end
    $display("zbcagentest");
    $display(cfg.vif.uart_tx_clk);
    cfg.vif.uart_tx_clk = ~cfg.vif.uart_tx_clk;
    $display(cfg.vif.uart_tx_clk);
    

    uvm_config_db#(uart_agent_cfg)::set(null, "*", "uart_cfg", cfg);
    // if (is_active == UVM_ACTIVE) begin
    //   drv = uart_driver::type_id::create("drv", this);
    // end
  endfunction

endclass
