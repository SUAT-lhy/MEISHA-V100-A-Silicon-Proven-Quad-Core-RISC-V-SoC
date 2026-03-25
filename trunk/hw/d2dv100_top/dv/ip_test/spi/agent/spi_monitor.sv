class spi_monitor extends dv_base_monitor#(
    .ITEM_T (spi_item),
    .CFG_T  (spi_agent_cfg),
    .COV_T  (spi_agent_cov)
  );
// class spi_monitor extends uvm_monitor;
  `uvm_component_utils(spi_monitor)

  // virtual spi_if spi_if;

  spi_item host_item;
  spi_item device_item;

  bit [7:0] wr_exp = 8'b0;
  bit [7:0] rd_exp = 8'b0;


  // Analysis port for the collected transfer.
  uvm_analysis_port #(spi_item) host_analysis_port;
  uvm_analysis_port #(spi_item) device_analysis_port;

  `uvm_component_new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // if (!uvm_config_db#(virtual spi_if)::get(this, "", "spi_if", spi_if))
    //   `uvm_error("NO_SPIIF", {"virtual interface must be set for: ", `gtn, "spi_if"})
    if (!uvm_config_db#(spi_agent_cfg)::get(this, "", "spi_cfg", cfg))
      `uvm_error("NO_SPICFG", "SPI_AGENT_CFG must be set!")
    host_analysis_port   = new("host_analysis_port", this);
    device_analysis_port = new("device_analysis_port", this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    fork
      collect_trans(phase);
      collect_read_trans(phase);
    join_any
  endtask

  // collect write transactions forever
  virtual protected task collect_trans(uvm_phase phase);
    host_item   = spi_item::type_id::create("host_item", this);

    forever begin
      @(negedge cfg.spi_if.cs);
      collect_curr_trans();
    end
  endtask : collect_trans

  virtual protected task collect_curr_trans();
    fork
      begin: isolation_thread
        fork
          begin: csb_deassert_thread
            wait(cfg.spi_if.cs == 1'b1);
          end
          begin: sample_thread
            // for mode 1 and 3, get the leading edges out of the way
            cfg.wait_sck_edge(LeadingEdge);
            forever begin
              bit [7:0] host_byte;    // from mosi
              bit [7:0] device_byte;  // from mosi
              int       which_bit;
              for (int i = 0; i < 8; i++) begin
                // wait for the sampling edge
                cfg.wait_sck_edge(SamplingEdge);
                // check mosi not x or z
                if (cfg.en_monitor_checks) begin
                  `DV_CHECK_CASE_NE(cfg.spi_if.mosi, 1'bx)
                  `DV_CHECK_CASE_NE(cfg.spi_if.mosi, 1'bz)
                end
                // sample mosi 
                which_bit = cfg.host_bit_dir ? i : 7 - i;
                host_byte[which_bit] = cfg.spi_if.mosi;
                cfg.spi_if.host_bit  = which_bit;
              end
              cfg.spi_if.host_byte = host_byte;
              // if (wr_exp != host_byte) begin
              //   `uvm_info("Spi Monitor", $sformatf("Spi tx data is not meeting expectations, expect data is %d but the actual data is %d\n", wr_exp, host_byte), UVM_MEDIUM)
              // end
              wr_exp += 8'b1;
              host_item.data.push_back(host_byte);
              host_item.item_type = SpiWrite;
              // sending transactions when collect a word data
              // if (host_item.data.size == cfg.num_bytes_per_trans_in_mon) begin
              `uvm_info(`gfn, $sformatf("spi_monitor: host packet:\n%0s", host_item.sprint()),
                        UVM_HIGH)
              this.host_analysis_port.write(host_item);
              host_item   = spi_item::type_id::create("host_item", this);

              // #40ps;
              // cfg.spi_if.trans_done = 1'b1;
              // device_item = spi_item::type_id::create("device_item", this);
              // end
            end // forever
          end: sample_thread
        join_any
        disable fork;
      end
    join
  endtask : collect_curr_trans


  // collect read transactions forever
  virtual protected task collect_read_trans(uvm_phase phase);
    device_item = spi_item::type_id::create("device_item", this);

    forever begin
      @(posedge cfg.spi_if2.miso_valid);
      collect_curr_read_trans();
    end
  endtask : collect_read_trans

  virtual protected task collect_curr_read_trans();
    fork
      begin: isolation_thread
        fork
          begin: miso_deassert_thread
            wait(cfg.spi_if2.miso_valid == 1'b0);
          end
          begin: sample_thread
            forever begin
              bit [7:0] device_byte;  // from miso
              int       which_bit;
              for (int i = 0; i < 8; i++) begin
                @(negedge cfg.spi_if.sclk);
                if (cfg.en_monitor_checks) begin
                  `DV_CHECK_CASE_NE(cfg.spi_if.miso, 1'bx)
                  `DV_CHECK_CASE_NE(cfg.spi_if.miso, 1'bz)
                end
                // sample miso for rx
                which_bit = cfg.host_bit_dir ? i : 7 - i;
                device_byte[which_bit] = cfg.spi_if.miso;
                cfg.spi_if.device_bit  = which_bit;
              end              
              cfg.spi_if.device_byte = device_byte;
              // if (rd_exp != device_byte) begin
              //   `uvm_fatal("Spi Monitor", $sformatf("Spi rx data is not meeting expectations, expect data is %d but the actual data is %d\n", rd_exp, device_byte))
              // end
              rd_exp += 8'b1;
              device_item.data.push_back(device_byte);
              device_item.item_type = SpiRead;
              `uvm_info(`gfn, $sformatf("spi_monitor: device packet:\n%0s", device_item.sprint()),
                        UVM_HIGH)
              this.device_analysis_port.write(host_item);
              device_item   = spi_item::type_id::create("device_item", this);
              
            end // forever
          end: sample_thread
        join_any
        disable fork;
      end
    join
  endtask : collect_curr_read_trans

  virtual task monitor_ready_to_end();
    forever begin
      @(cfg.spi_if.cs);
      ok_to_end = !cfg.spi_if.cs;
    end
  endtask : monitor_ready_to_end

endclass : spi_monitor