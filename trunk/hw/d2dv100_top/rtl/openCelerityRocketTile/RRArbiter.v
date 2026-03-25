module RRArbiter( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303265.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303266.4]
  output        io_in_0_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
  input         io_in_0_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
  input         io_in_0_bits_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
  input  [26:0] io_in_0_bits_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
  output        io_in_1_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
  input         io_in_1_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
  input         io_in_1_bits_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
  input  [26:0] io_in_1_bits_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
  input         io_out_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
  output        io_out_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
  output        io_out_bits_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
  output [26:0] io_out_bits_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
  output        io_chosen // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303268.4]
);
  wire  _T_104; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303276.4]
  reg  _T_106; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303277.4]
  reg [31:0] _RAND_0;
  wire  _T_108; // @[Arbiter.scala 67:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303282.4]
  wire  _T_110; // @[Arbiter.scala 68:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303284.4]
  wire  _T_112; // @[Arbiter.scala 31:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303286.4]
  wire  _T_114; // @[Arbiter.scala 31:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303288.4]
  wire  _T_115; // @[Arbiter.scala 31:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303289.4]
  wire  _T_119; // @[Arbiter.scala 72:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303293.4]
  wire  _GEN_9; // @[Arbiter.scala 77:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303298.4]
  assign _T_104 = io_out_ready & io_out_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303276.4]
  assign _T_108 = 1'h1 > _T_106; // @[Arbiter.scala 67:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303282.4]
  assign _T_110 = io_in_1_valid & _T_108; // @[Arbiter.scala 68:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303284.4]
  assign _T_112 = _T_110 | io_in_0_valid; // @[Arbiter.scala 31:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303286.4]
  assign _T_114 = _T_110 == 1'h0; // @[Arbiter.scala 31:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303288.4]
  assign _T_115 = _T_112 == 1'h0; // @[Arbiter.scala 31:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303289.4]
  assign _T_119 = _T_108 | _T_115; // @[Arbiter.scala 72:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303293.4]
  assign _GEN_9 = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 77:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303298.4]
  assign io_in_0_ready = _T_114 & io_out_ready; // @[Arbiter.scala 60:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303295.4]
  assign io_in_1_ready = _T_119 & io_out_ready; // @[Arbiter.scala 60:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303297.4]
  assign io_out_valid = io_chosen ? io_in_1_valid : io_in_0_valid; // @[Arbiter.scala 41:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303273.4]
  assign io_out_bits_valid = io_chosen ? io_in_1_bits_valid : io_in_0_bits_valid; // @[Arbiter.scala 42:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303275.4]
  assign io_out_bits_bits_addr = io_chosen ? io_in_1_bits_bits_addr : io_in_0_bits_bits_addr; // @[Arbiter.scala 42:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303274.4]
  assign io_chosen = _T_110 ? 1'h1 : _GEN_9; // @[Arbiter.scala 40:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@303272.4]
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
  _T_106 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_104) begin
      _T_106 <= io_chosen;
    end
  end
endmodule