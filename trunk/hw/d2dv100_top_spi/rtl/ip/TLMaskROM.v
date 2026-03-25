module TLMaskROM #(
  parameter DATA_WIDTH = 32
  ,parameter DATA_DEPTH = 4096
  )
( // @[:example.TestHarness.RocketConfig.fir@194828.2]
  input         clock, // @[:example.TestHarness.RocketConfig.fir@194829.4]
  input         reset, // @[:example.TestHarness.RocketConfig.fir@194830.4]
  output        auto_in_a_ready, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  input         auto_in_a_valid, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  input  [2:0]  auto_in_a_bits_opcode, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  input  [2:0]  auto_in_a_bits_param, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  input  [1:0]  auto_in_a_bits_size, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  input  [6:0]  auto_in_a_bits_source, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  input  [16:0] auto_in_a_bits_address, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  input  [7:0]  auto_in_a_bits_mask, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  input         auto_in_a_bits_corrupt, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  input         auto_in_d_ready, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  output        auto_in_d_valid, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  output [1:0]  auto_in_d_bits_size, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  output [6:0]  auto_in_d_bits_source, // @[:example.TestHarness.RocketConfig.fir@194831.4]
  output [DATA_WIDTH-1:0] auto_in_d_bits_data // @[:example.TestHarness.RocketConfig.fir@194831.4]
);
  wire  TLMonitor_clock; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire  TLMonitor_reset; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire  TLMonitor_io_in_a_ready; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire  TLMonitor_io_in_a_valid; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire [2:0] TLMonitor_io_in_a_bits_opcode; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire [2:0] TLMonitor_io_in_a_bits_param; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire [1:0] TLMonitor_io_in_a_bits_size; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire [6:0] TLMonitor_io_in_a_bits_source; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire [16:0] TLMonitor_io_in_a_bits_address; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire [7:0] TLMonitor_io_in_a_bits_mask; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire  TLMonitor_io_in_a_bits_corrupt; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire  TLMonitor_io_in_d_ready; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire  TLMonitor_io_in_d_valid; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire [1:0] TLMonitor_io_in_d_bits_size; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  wire [6:0] TLMonitor_io_in_d_bits_source; // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  reg [DATA_WIDTH-1:0] rom [0:DATA_DEPTH-1]; // @[BootROM.scala 46:18:example.TestHarness.RocketConfig.fir@194862.4]
  reg [DATA_WIDTH-1:0] _RAND_0;
  wire [DATA_WIDTH-1:0] rom__T_1_data; // @[BootROM.scala 46:18:example.TestHarness.RocketConfig.fir@194862.4]
  wire [11:0] rom__T_1_addr; // @[BootROM.scala 46:18:example.TestHarness.RocketConfig.fir@194862.4]
  wire [8:0] index; // @[BootROM.scala 52:34:example.TestHarness.RocketConfig.fir@194865.4]
  wire [3:0] high; // @[BootROM.scala 53:68:example.TestHarness.RocketConfig.fir@194866.4]
  wire  _T; // @[BootROM.scala 54:53:example.TestHarness.RocketConfig.fir@194867.4]
  // TLMonitor_54 TLMonitor ( // @[Nodes.scala 25:25:example.TestHarness.RocketConfig.fir@194838.4]
  //   .clock(TLMonitor_clock),
  //   .reset(TLMonitor_reset),
  //   .io_in_a_ready(TLMonitor_io_in_a_ready),
  //   .io_in_a_valid(TLMonitor_io_in_a_valid),
  //   .io_in_a_bits_opcode(TLMonitor_io_in_a_bits_opcode),
  //   .io_in_a_bits_param(TLMonitor_io_in_a_bits_param),
  //   .io_in_a_bits_size(TLMonitor_io_in_a_bits_size),
  //   .io_in_a_bits_source(TLMonitor_io_in_a_bits_source),
  //   .io_in_a_bits_address(TLMonitor_io_in_a_bits_address),
  //   .io_in_a_bits_mask(TLMonitor_io_in_a_bits_mask),
  //   .io_in_a_bits_corrupt(TLMonitor_io_in_a_bits_corrupt),
  //   .io_in_d_ready(TLMonitor_io_in_d_ready),
  //   .io_in_d_valid(TLMonitor_io_in_d_valid),
  //   .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
  //   .io_in_d_bits_source(TLMonitor_io_in_d_bits_source)
  // );
  assign rom__T_1_addr = {{3'd0}, index};
  assign rom__T_1_data = rom[rom__T_1_addr]; // @[BootROM.scala 46:18:example.TestHarness.RocketConfig.fir@194862.4]
  assign index = auto_in_a_bits_address[11:3]; // @[BootROM.scala 52:34:example.TestHarness.RocketConfig.fir@194865.4]
  assign high = auto_in_a_bits_address[15:12]; // @[BootROM.scala 53:68:example.TestHarness.RocketConfig.fir@194866.4]
  assign _T = high != 4'h0; // @[BootROM.scala 54:53:example.TestHarness.RocketConfig.fir@194867.4]
  assign auto_in_a_ready = auto_in_d_ready; // @[LazyModule.scala 173:31:example.TestHarness.RocketConfig.fir@194861.4]
  assign auto_in_d_valid = auto_in_a_valid; // @[LazyModule.scala 173:31:example.TestHarness.RocketConfig.fir@194861.4]
  assign auto_in_d_bits_size = auto_in_a_bits_size; // @[LazyModule.scala 173:31:example.TestHarness.RocketConfig.fir@194861.4]
  assign auto_in_d_bits_source = auto_in_a_bits_source; // @[LazyModule.scala 173:31:example.TestHarness.RocketConfig.fir@194861.4]
  assign auto_in_d_bits_data = _T ? {DATA_WIDTH{1'b0}} : rom__T_1_data; // @[LazyModule.scala 173:31:example.TestHarness.RocketConfig.fir@194861.4]
  assign TLMonitor_clock = clock; // @[:example.TestHarness.RocketConfig.fir@194839.4]
  assign TLMonitor_reset = reset; // @[:example.TestHarness.RocketConfig.fir@194840.4]
  assign TLMonitor_io_in_a_ready = auto_in_d_ready; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194860.4]
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194859.4]
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194858.4]
  assign TLMonitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194857.4]
  assign TLMonitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194856.4]
  assign TLMonitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194855.4]
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194854.4]
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194853.4]
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194851.4]
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194850.4]
  assign TLMonitor_io_in_d_valid = auto_in_a_valid; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194849.4]
  assign TLMonitor_io_in_d_bits_size = auto_in_a_bits_size; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194846.4]
  assign TLMonitor_io_in_d_bits_source = auto_in_a_bits_source; // @[Nodes.scala 26:19:example.TestHarness.RocketConfig.fir@194845.4]
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
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
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
  _RAND_0 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < DATA_DEPTH; initvar = initvar+1)
    rom[initvar] = _RAND_0[DATA_WIDTH-1:0];
  `endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end
endmodule