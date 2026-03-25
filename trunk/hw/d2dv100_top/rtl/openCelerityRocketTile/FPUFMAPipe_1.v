module FPUFMAPipe_1( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300375.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300376.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300377.4]
  input         io_in_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300378.4]
  input         io_in_bits_ren3, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300378.4]
  input         io_in_bits_swap23, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300378.4]
  input  [2:0]  io_in_bits_rm, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300378.4]
  input  [1:0]  io_in_bits_fmaCmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300378.4]
  input  [64:0] io_in_bits_in1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300378.4]
  input  [64:0] io_in_bits_in2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300378.4]
  input  [64:0] io_in_bits_in3, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300378.4]
  output [64:0] io_out_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300378.4]
  output [4:0]  io_out_bits_exc // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300378.4]
);
  wire  fma_clock; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300401.4]
  wire  fma_reset; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300401.4]
  wire  fma_io_validin; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300401.4]
  wire [1:0] fma_io_op; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300401.4]
  wire [64:0] fma_io_a; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300401.4]
  wire [64:0] fma_io_b; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300401.4]
  wire [64:0] fma_io_c; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300401.4]
  wire [2:0] fma_io_roundingMode; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300401.4]
  wire [64:0] fma_io_out; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300401.4]
  wire [4:0] fma_io_exceptionFlags; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300401.4]
  wire  fma_io_validout; // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300401.4]
  reg  valid; // @[FPU.scala 632:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300383.4]
  reg [31:0] _RAND_0;
  reg [2:0] in_rm; // @[FPU.scala 633:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300385.4]
  reg [31:0] _RAND_1;
  reg [1:0] in_fmaCmd; // @[FPU.scala 633:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300385.4]
  reg [31:0] _RAND_2;
  reg [64:0] in_in1; // @[FPU.scala 633:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300385.4]
  reg [95:0] _RAND_3;
  reg [64:0] in_in2; // @[FPU.scala 633:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300385.4]
  reg [95:0] _RAND_4;
  reg [64:0] in_in3; // @[FPU.scala 633:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300385.4]
  reg [95:0] _RAND_5;
  wire [64:0] _T_13; // @[FPU.scala 636:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300388.6]
  wire [64:0] _T_15; // @[FPU.scala 636:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300390.6]
  wire  _T_16; // @[FPU.scala 641:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300395.6]
  wire  _T_17; // @[FPU.scala 641:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300396.6]
  wire [64:0] _T_20; // @[FPU.scala 340:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300415.4]
  wire [2:0] _T_21; // @[FPU.scala 197:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300416.4]
  wire [2:0] _T_22; // @[FPU.scala 197:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300417.4]
  wire  _T_23; // @[FPU.scala 197:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300418.4]
  reg [64:0] _T_28_data; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300424.4]
  reg [95:0] _RAND_6;
  reg [4:0] _T_28_exc; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300424.4]
  reg [31:0] _RAND_7;
  wire [4:0] res_exc; // @[FPU.scala 653:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300412.4 FPU.scala 655:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300421.4]
  MulAddRecFNPipe_1 fma ( // @[FPU.scala 644:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300401.4]
    .clock(fma_clock),
    .reset(fma_reset),
    .io_validin(fma_io_validin),
    .io_op(fma_io_op),
    .io_a(fma_io_a),
    .io_b(fma_io_b),
    .io_c(fma_io_c),
    .io_roundingMode(fma_io_roundingMode),
    .io_out(fma_io_out),
    .io_exceptionFlags(fma_io_exceptionFlags),
    .io_validout(fma_io_validout)
  );
  assign _T_13 = io_in_bits_in1 ^ io_in_bits_in2; // @[FPU.scala 636:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300388.6]
  assign _T_15 = _T_13 & 65'h10000000000000000; // @[FPU.scala 636:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300390.6]
  assign _T_16 = io_in_bits_ren3 | io_in_bits_swap23; // @[FPU.scala 641:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300395.6]
  assign _T_17 = _T_16 == 1'h0; // @[FPU.scala 641:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300396.6]
  assign _T_20 = fma_io_out & 65'h1efefffffffffffff; // @[FPU.scala 340:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300415.4]
  assign _T_21 = fma_io_out[63:61]; // @[FPU.scala 197:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300416.4]
  assign _T_22 = ~ _T_21; // @[FPU.scala 197:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300417.4]
  assign _T_23 = _T_22 == 3'h0; // @[FPU.scala 197:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300418.4]
  assign res_exc = fma_io_exceptionFlags; // @[FPU.scala 653:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300412.4 FPU.scala 655:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300421.4]
  assign io_out_bits_data = _T_28_data; // @[FPU.scala 657:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300433.4]
  assign io_out_bits_exc = _T_28_exc; // @[FPU.scala 657:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300433.4]
  assign fma_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300403.4]
  assign fma_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300404.4]
  assign fma_io_validin = valid; // @[FPU.scala 645:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300405.4]
  assign fma_io_op = in_fmaCmd; // @[FPU.scala 646:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300406.4]
  assign fma_io_a = in_in1; // @[FPU.scala 649:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300409.4]
  assign fma_io_b = in_in2; // @[FPU.scala 650:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300410.4]
  assign fma_io_c = in_in3; // @[FPU.scala 651:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300411.4]
  assign fma_io_roundingMode = in_rm; // @[FPU.scala 647:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300407.4]
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
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {3{`RANDOM}};
  _T_28_data = _RAND_6[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_28_exc = _RAND_7[4:0];
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
        in_in2 <= 65'h8000000000000000;
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
    if (fma_io_validout) begin
      if (_T_23) begin
        _T_28_data <= _T_20;
      end else begin
        _T_28_data <= fma_io_out;
      end
    end
    if (fma_io_validout) begin
      _T_28_exc <= res_exc;
    end
  end
endmodule