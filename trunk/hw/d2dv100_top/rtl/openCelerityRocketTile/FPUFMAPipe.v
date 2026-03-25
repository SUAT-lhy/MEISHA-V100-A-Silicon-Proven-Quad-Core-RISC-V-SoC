module FPUFMAPipe( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296236.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296237.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296238.4]
  input         io_in_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296239.4]
  input         io_in_bits_ren3, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296239.4]
  input         io_in_bits_swap23, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296239.4]
  input  [2:0]  io_in_bits_rm, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296239.4]
  input  [1:0]  io_in_bits_fmaCmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296239.4]
  input  [64:0] io_in_bits_in1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296239.4]
  input  [64:0] io_in_bits_in2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296239.4]
  input  [64:0] io_in_bits_in3, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296239.4]
  output [64:0] io_out_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296239.4]
  output [4:0]  io_out_bits_exc // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296239.4]
);
  wire  fma_clock; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296262.4]
  wire  fma_reset; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296262.4]
  wire  fma_io_validin; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296262.4]
  wire [1:0] fma_io_op; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296262.4]
  wire [32:0] fma_io_a; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296262.4]
  wire [32:0] fma_io_b; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296262.4]
  wire [32:0] fma_io_c; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296262.4]
  wire [2:0] fma_io_roundingMode; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296262.4]
  wire [32:0] fma_io_out; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296262.4]
  wire [4:0] fma_io_exceptionFlags; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296262.4]
  reg  valid; // @[FPU.scala 632:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296244.4]
  reg [31:0] _RAND_0;
  reg [2:0] in_rm; // @[FPU.scala 633:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296246.4]
  reg [31:0] _RAND_1;
  reg [1:0] in_fmaCmd; // @[FPU.scala 633:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296246.4]
  reg [31:0] _RAND_2;
  reg [64:0] in_in1; // @[FPU.scala 633:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296246.4]
  reg [95:0] _RAND_3;
  reg [64:0] in_in2; // @[FPU.scala 633:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296246.4]
  reg [95:0] _RAND_4;
  reg [64:0] in_in3; // @[FPU.scala 633:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296246.4]
  reg [95:0] _RAND_5;
  wire [64:0] _T_13; // @[FPU.scala 636:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296249.6]
  wire [64:0] _T_15; // @[FPU.scala 636:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296251.6]
  wire  _T_16; // @[FPU.scala 641:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296256.6]
  wire  _T_17; // @[FPU.scala 641:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296257.6]
  MulAddRecFNPipe fma ( // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296262.4]
    .clock(fma_clock),
    .reset(fma_reset),
    .io_validin(fma_io_validin),
    .io_op(fma_io_op),
    .io_a(fma_io_a),
    .io_b(fma_io_b),
    .io_c(fma_io_c),
    .io_roundingMode(fma_io_roundingMode),
    .io_out(fma_io_out),
    .io_exceptionFlags(fma_io_exceptionFlags)
  );
  assign _T_13 = io_in_bits_in1 ^ io_in_bits_in2; // @[FPU.scala 636:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296249.6]
  assign _T_15 = _T_13 & 65'h100000000; // @[FPU.scala 636:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296251.6]
  assign _T_16 = io_in_bits_ren3 | io_in_bits_swap23; // @[FPU.scala 641:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296256.6]
  assign _T_17 = _T_16 == 1'h0; // @[FPU.scala 641:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296257.6]
  assign io_out_bits_data = {{32'd0}, fma_io_out}; // @[FPU.scala 657:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296281.4]
  assign io_out_bits_exc = fma_io_exceptionFlags; // @[FPU.scala 657:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296281.4]
  assign fma_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296264.4]
  assign fma_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296265.4]
  assign fma_io_validin = valid; // @[FPU.scala 645:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296266.4]
  assign fma_io_op = in_fmaCmd; // @[FPU.scala 646:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296267.4]
  assign fma_io_a = in_in1[32:0]; // @[FPU.scala 649:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296270.4]
  assign fma_io_b = in_in2[32:0]; // @[FPU.scala 650:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296271.4]
  assign fma_io_c = in_in3[32:0]; // @[FPU.scala 651:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296272.4]
  assign fma_io_roundingMode = in_rm; // @[FPU.scala 647:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@296268.4]
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
  valid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  in_rm = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  in_fmaCmd = _RAND_2[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {3{`RANDOM}};
  in_in1 = _RAND_3[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {3{`RANDOM}};
  in_in2 = _RAND_4[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {3{`RANDOM}};
  in_in3 = _RAND_5[64:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    valid <= io_in_valid;
    if (io_in_valid) begin
      in_rm <= io_in_bits_rm;
    end
    if (io_in_valid) begin
      in_fmaCmd <= io_in_bits_fmaCmd;
    end
    if (io_in_valid) begin
      in_in1 <= io_in_bits_in1;
    end
    if (io_in_valid) begin
      if (io_in_bits_swap23) begin
        in_in2 <= 65'h80000000;
      end else begin
        in_in2 <= io_in_bits_in2;
      end
    end
    if (io_in_valid) begin
      if (_T_17) begin
        in_in3 <= _T_15;
      end else begin
        in_in3 <= io_in_bits_in3;
      end
    end
  end
endmodule