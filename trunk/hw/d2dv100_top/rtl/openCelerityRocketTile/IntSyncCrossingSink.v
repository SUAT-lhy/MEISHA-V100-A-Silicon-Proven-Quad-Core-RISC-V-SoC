module IntSyncCrossingSink( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294903.2]
  input   clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294904.4]
  input   auto_in_sync_0, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294906.4]
  output  auto_out_0 // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294906.4]
);
  wire  SynchronizerShiftReg_w1_d3_clock; // @[ShiftReg.scala 47:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294917.4]
  wire  SynchronizerShiftReg_w1_d3_io_d; // @[ShiftReg.scala 47:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294917.4]
  wire  SynchronizerShiftReg_w1_d3_io_q; // @[ShiftReg.scala 47:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294917.4]
  SynchronizerShiftReg_w1_d3 SynchronizerShiftReg_w1_d3 ( // @[ShiftReg.scala 47:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294917.4]
    .clock(SynchronizerShiftReg_w1_d3_clock),
    .io_d(SynchronizerShiftReg_w1_d3_io_d),
    .io_q(SynchronizerShiftReg_w1_d3_io_q)
  );
  assign auto_out_0 = SynchronizerShiftReg_w1_d3_io_q; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294915.4]
  assign SynchronizerShiftReg_w1_d3_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294919.4]
  assign SynchronizerShiftReg_w1_d3_io_d = auto_in_sync_0; // @[ShiftReg.scala 49:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294921.4]
endmodule