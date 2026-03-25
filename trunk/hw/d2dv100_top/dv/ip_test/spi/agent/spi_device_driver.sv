class spi_device_driver extends spi_driver;
  `uvm_component_utils(spi_device_driver)
  `uvm_component_new

  virtual task reset_signals();
    forever begin
      @(posedge cfg.spi_if.rst_n);
      under_reset = 1'b1;
      cfg.spi_if.miso <= 'h0;
      @(negedge cfg.spi_if.rst_n);
      `uvm_info("SPI_RESET", $sformatf("spi_miso has been reset to : %0b", cfg.spi_if.miso), UVM_LOW);
      under_reset = 1'b0;
    end
  endtask

  virtual task get_and_drive();
    forever begin
      seq_item_port.get_next_item(req);
      $cast(rsp, req.clone());
      rsp.set_id_info(req);
      `uvm_info(`gfn, $sformatf("spi_host_driver: rcvd item:\n%0s", req.sprint()), UVM_HIGH)
      fork
        drive_rx_sio();
        // drive_tx_sio();
      join
      `uvm_info(`gfn, "spi_host_driver: item sent", UVM_HIGH)
      seq_item_port.item_done(rsp);
    end
  endtask : get_and_drive

  virtual task drive_rx_sio();
    // TODO
  endtask : drive_rx_sio

  virtual task drive_tx_sio();
    // TODO
  endtask : drive_tx_sio

endclass : spi_device_driver
