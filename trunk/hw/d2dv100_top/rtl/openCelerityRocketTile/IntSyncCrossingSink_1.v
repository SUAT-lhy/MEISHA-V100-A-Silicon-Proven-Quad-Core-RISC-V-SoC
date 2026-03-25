module IntSyncCrossingSink_1( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294931.2]
  input   auto_in_sync_0, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294934.4]
  input   auto_in_sync_1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294934.4]
  output  auto_out_0, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294934.4]
  output  auto_out_1 // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294934.4]
);
  assign auto_out_0 = auto_in_sync_0; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294943.4]
  assign auto_out_1 = auto_in_sync_1; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294943.4]
endmodule