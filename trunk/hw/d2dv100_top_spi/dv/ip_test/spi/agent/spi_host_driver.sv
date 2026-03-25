class spi_device_driver extends spi_driver;
  `uvm_component_utils(spi_device_driver)
  `uvm_component_new

  virtual task reset_signals();
    `uvm_info(`gfn, "Nothing hase done in spi_device_driver reset_signals", UVM_HIGH)
  endtask

  virtual task get_and_drive();
    `uvm_info(`gfn, "Nothing hase done in spi_device_driver get_and_drive", UVM_HIGH)
  endtask : get_and_drive

  virtual task drive_rx_sio();
    // TODO
  endtask : drive_rx_sio

  virtual task drive_tx_sio();
    // TODO
  endtask : drive_tx_sio

endclass : spi_device_driver
