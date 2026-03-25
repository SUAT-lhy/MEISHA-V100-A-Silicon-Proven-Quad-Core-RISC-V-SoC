module SynchronizerShiftReg_w1_d3( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294887.2]
  input   clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294888.4]
  input   io_d, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294890.4]
  output  io_q // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294890.4]
);
  reg  sync_0; // @[ShiftReg.scala 114:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294895.4]
  reg [31:0] _RAND_0;
  reg  sync_1; // @[ShiftReg.scala 114:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294896.4]
  reg [31:0] _RAND_1;
  reg  sync_2; // @[ShiftReg.scala 114:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294897.4]
  reg [31:0] _RAND_2;
  assign io_q = sync_0; // @[ShiftReg.scala 123:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294901.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sync_0 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  sync_1 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  sync_2 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    sync_0 <= sync_1;
    sync_1 <= sync_2;
    sync_2 <= io_d;
  end
endmodule