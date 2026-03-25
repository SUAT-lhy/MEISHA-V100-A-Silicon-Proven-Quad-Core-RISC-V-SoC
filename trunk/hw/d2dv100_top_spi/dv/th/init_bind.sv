

module TLMonitor_22( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@731.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@732.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@733.4]
  input         io_in_a_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_a_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_a_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_a_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_a_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [1:0]  io_in_a_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [31:0] io_in_a_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [7:0]  io_in_a_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_a_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_b_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_b_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_b_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [1:0]  io_in_b_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_b_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [1:0]  io_in_b_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [31:0] io_in_b_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [7:0]  io_in_b_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_b_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_c_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_c_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_c_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_c_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_c_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [1:0]  io_in_c_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [31:0] io_in_c_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_c_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_d_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_d_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_d_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [1:0]  io_in_d_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_d_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [1:0]  io_in_d_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_d_bits_sink, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_d_bits_denied, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_d_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_e_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_e_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_e_bits_sink // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
);

endmodule


module TLMonitor( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@731.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@732.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@733.4]
  input         io_in_a_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_a_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_a_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_a_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_a_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [1:0]  io_in_a_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [31:0] io_in_a_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [7:0]  io_in_a_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_a_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_b_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_b_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_b_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [1:0]  io_in_b_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_b_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [1:0]  io_in_b_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [31:0] io_in_b_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [7:0]  io_in_b_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_b_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_c_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_c_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_c_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_c_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_c_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [1:0]  io_in_c_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [31:0] io_in_c_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_c_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_d_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_d_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_d_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [1:0]  io_in_d_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_d_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [1:0]  io_in_d_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_d_bits_sink, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_d_bits_denied, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_d_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_e_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input         io_in_e_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
  input  [2:0]  io_in_e_bits_sink // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@734.4]
);

endmodule


module TLMonitor_init_bind();

  initial begin
    force TLMonitor.clock = 0;
    force TLMonitor.reset = 1;
    // force TLMonitor.io_in_a_valid = 0;
    // force TLMonitor.io_in_b_valid = 0;
    // force TLMonitor.io_in_c_valid = 0;
    // force TLMonitor.io_in_d_valid = 0;
    // force TLMonitor.io_in_e_valid = 0;
  end

endmodule 

// close tlmonitor
bind TLMonitor TLMonitor_init_bind u_TLMonitor_init_bind();


module VC707BaseShell_init_bind();

initial begin
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.coupler_to_slave_named_debug.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.coupler_to_slave_named_debug.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.coupler_to_slave_named_MaskROM.fragmenter.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.coupler_to_slave_named_MaskROM.fragmenter.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.coupler_to_slave_named_MaskROM.widget.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.coupler_to_slave_named_MaskROM.widget.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.coupler_to_slave_named_MaskROM.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.coupler_to_slave_named_MaskROM.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_to_bus_named_cbus.fixer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_to_bus_named_cbus.fixer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_to_bus_named_cbus.widget.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_to_bus_named_cbus.widget.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_to_bus_named_cbus.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_to_bus_named_cbus.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.master_splitter.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.master_splitter.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.master_splitter.TLMonitor_1.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.master_splitter.TLMonitor_1.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.master_splitter.TLMonitor_2.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.master_splitter.TLMonitor_2.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.master_splitter.TLMonitor_3.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.master_splitter.TLMonitor_3.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.wrapped_error_device.error.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.wrapped_error_device.error.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.wrapped_error_device.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.wrapped_error_device.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile_1.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile_1.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile_2.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile_2.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile_3.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile_3.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile.fixer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile.fixer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile_1.fixer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile_1.fixer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile_2.fixer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile_2.fixer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile_3.fixer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.coupler_from_tile_named_tile_3.fixer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.pbus.in_xbar.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.pbus.in_xbar.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.pbus.out_xbar.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.pbus.out_xbar.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.pbus.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.pbus.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.pbus.atomics.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.pbus.atomics.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.in_xbar.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.in_xbar.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.pbus.buffer_1.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.pbus.buffer_1.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.pbus.coupler_to_slave_named_uart_0.fragmenter.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.pbus.coupler_to_slave_named_uart_0.fragmenter.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.pbus.coupler_to_device_named_spi_0.fragmenter.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.pbus.coupler_to_device_named_spi_0.fragmenter.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.pbus.coupler_to_device_named_gpio_0.fragmenter.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.pbus.coupler_to_device_named_gpio_0.fragmenter.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.bh.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.bh.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.ww.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.ww.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.mbus.memory_bus_xbar.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.mbus.memory_bus_xbar.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.mbus.coupler_from_coherence_manager.binder.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.mbus.coupler_from_coherence_manager.binder.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.mbus.coupler_to_memory_controller_named_xilinxvc707mig.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.mbus.coupler_to_memory_controller_named_xilinxvc707mig.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.mbus.coupler_to_memory_controller_named_xilinxvc707mig.picker.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.mbus.coupler_to_memory_controller_named_xilinxvc707mig.picker.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.out_xbar.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.out_xbar.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.plic.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.plic.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.clint.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.clint.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.debug_1.dmOuter.dmiXbar.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.debug_1.dmOuter.dmiXbar.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.debug_1.dmOuter.dmOuter.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.debug_1.dmOuter.dmOuter.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.debug_1.dmOuter.asource.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.debug_1.dmOuter.asource.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.debug_1.dmInner.dmInner.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.debug_1.dmInner.dmInner.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.debug_1.dmInner.dmInner.TLMonitor_1.clock = 0;
   force VC707BaseShell.topDesign.topMod.debug_1.dmInner.dmInner.TLMonitor_1.reset = 1;
   force VC707BaseShell.topDesign.topMod.tile.tlMasterXbar.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.tile.tlMasterXbar.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.tile_1.tlMasterXbar.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.tile_1.tlMasterXbar.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.tile_2.tlMasterXbar.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.tile_2.tlMasterXbar.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.tile_3.tlMasterXbar.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.tile_3.tlMasterXbar.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.tile.tlMasterXbar.TLMonitor_1.clock = 0;
   force VC707BaseShell.topDesign.topMod.tile.tlMasterXbar.TLMonitor_1.reset = 1;
   force VC707BaseShell.topDesign.topMod.tile_1.tlMasterXbar.TLMonitor_1.clock = 0;
   force VC707BaseShell.topDesign.topMod.tile_1.tlMasterXbar.TLMonitor_1.reset = 1;
   force VC707BaseShell.topDesign.topMod.tile_2.tlMasterXbar.TLMonitor_1.clock = 0;
   force VC707BaseShell.topDesign.topMod.tile_2.tlMasterXbar.TLMonitor_1.reset = 1;
   force VC707BaseShell.topDesign.topMod.tile_3.tlMasterXbar.TLMonitor_1.clock = 0;
   force VC707BaseShell.topDesign.topMod.tile_3.tlMasterXbar.TLMonitor_1.reset = 1;
   force VC707BaseShell.topDesign.topMod.tile.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.tile.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.tile_1.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.tile_1.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.tile_2.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.tile_2.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.tile_3.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.tile_3.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.buffer.TLMonitor.reset = 1;
   //force VC707BaseShell.topDesign.topMod.maskROM.TLMonitor.clock = 0;
   //force VC707BaseShell.topDesign.topMod.maskROM.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.atomics.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.atomics.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.uart_0.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.uart_0.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.uart_0.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.uart_0.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.spi_0.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.spi_0.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.spi_0.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.spi_0.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.gpio_0.buffer.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.gpio_0.buffer.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.gpio_0.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.gpio_0.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.buffer_1.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.buffer_1.TLMonitor.reset = 1;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.coupler_to_bus_named_pbus.widget.TLMonitor.clock = 0;
   force VC707BaseShell.topDesign.topMod.sbus.control_bus.coupler_to_bus_named_pbus.widget.TLMonitor.reset = 1;
end

endmodule

// close tlmonitor
bind VC707BaseShell VC707BaseShell_init_bind u_VC707BaseShell_init_bind();