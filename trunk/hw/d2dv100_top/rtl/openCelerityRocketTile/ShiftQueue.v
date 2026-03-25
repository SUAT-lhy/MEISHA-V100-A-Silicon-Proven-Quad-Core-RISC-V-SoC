module ShiftQueue( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281851.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281852.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281853.4]
  output        io_enq_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  input         io_enq_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  input         io_enq_bits_btb_taken, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  input         io_enq_bits_btb_bridx, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  input  [4:0]  io_enq_bits_btb_entry, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  input  [7:0]  io_enq_bits_btb_bht_history, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  input  [39:0] io_enq_bits_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  input  [31:0] io_enq_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  input  [1:0]  io_enq_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  input         io_enq_bits_xcpt_pf_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  input         io_enq_bits_xcpt_ae_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  input         io_enq_bits_replay, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  input         io_deq_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  output        io_deq_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  output        io_deq_bits_btb_taken, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  output        io_deq_bits_btb_bridx, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  output [4:0]  io_deq_bits_btb_entry, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  output [7:0]  io_deq_bits_btb_bht_history, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  output [39:0] io_deq_bits_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  output [31:0] io_deq_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  output        io_deq_bits_xcpt_pf_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  output        io_deq_bits_xcpt_ae_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  output        io_deq_bits_replay, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
  output [4:0]  io_mask // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281854.4]
);
  reg  _T_60_0; // @[ShiftQueue.scala 20:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281866.4]
  reg [31:0] _RAND_0;
  reg  _T_60_1; // @[ShiftQueue.scala 20:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281866.4]
  reg [31:0] _RAND_1;
  reg  _T_60_2; // @[ShiftQueue.scala 20:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281866.4]
  reg [31:0] _RAND_2;
  reg  _T_60_3; // @[ShiftQueue.scala 20:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281866.4]
  reg [31:0] _RAND_3;
  reg  _T_60_4; // @[ShiftQueue.scala 20:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281866.4]
  reg [31:0] _RAND_4;
  reg  _T_82_0_btb_taken; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_5;
  reg  _T_82_0_btb_bridx; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_6;
  reg [4:0] _T_82_0_btb_entry; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_7;
  reg [7:0] _T_82_0_btb_bht_history; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_8;
  reg [39:0] _T_82_0_pc; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [63:0] _RAND_9;
  reg [31:0] _T_82_0_data; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_10;
  reg  _T_82_0_xcpt_pf_inst; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_11;
  reg  _T_82_0_xcpt_ae_inst; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_12;
  reg  _T_82_0_replay; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_13;
  reg  _T_82_1_btb_taken; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_14;
  reg  _T_82_1_btb_bridx; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_15;
  reg [4:0] _T_82_1_btb_entry; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_16;
  reg [7:0] _T_82_1_btb_bht_history; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_17;
  reg [39:0] _T_82_1_pc; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [63:0] _RAND_18;
  reg [31:0] _T_82_1_data; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_19;
  reg  _T_82_1_xcpt_pf_inst; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_20;
  reg  _T_82_1_xcpt_ae_inst; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_21;
  reg  _T_82_1_replay; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_22;
  reg  _T_82_2_btb_taken; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_23;
  reg  _T_82_2_btb_bridx; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_24;
  reg [4:0] _T_82_2_btb_entry; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_25;
  reg [7:0] _T_82_2_btb_bht_history; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_26;
  reg [39:0] _T_82_2_pc; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [63:0] _RAND_27;
  reg [31:0] _T_82_2_data; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_28;
  reg  _T_82_2_xcpt_pf_inst; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_29;
  reg  _T_82_2_xcpt_ae_inst; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_30;
  reg  _T_82_2_replay; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_31;
  reg  _T_82_3_btb_taken; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_32;
  reg  _T_82_3_btb_bridx; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_33;
  reg [4:0] _T_82_3_btb_entry; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_34;
  reg [7:0] _T_82_3_btb_bht_history; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_35;
  reg [39:0] _T_82_3_pc; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [63:0] _RAND_36;
  reg [31:0] _T_82_3_data; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_37;
  reg  _T_82_3_xcpt_pf_inst; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_38;
  reg  _T_82_3_xcpt_ae_inst; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_39;
  reg  _T_82_3_replay; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_40;
  reg  _T_82_4_btb_taken; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_41;
  reg  _T_82_4_btb_bridx; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_42;
  reg [4:0] _T_82_4_btb_entry; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_43;
  reg [7:0] _T_82_4_btb_bht_history; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_44;
  reg [39:0] _T_82_4_pc; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [63:0] _RAND_45;
  reg [31:0] _T_82_4_data; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_46;
  reg  _T_82_4_xcpt_pf_inst; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_47;
  reg  _T_82_4_xcpt_ae_inst; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_48;
  reg  _T_82_4_replay; // @[ShiftQueue.scala 21:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281867.4]
  reg [31:0] _RAND_49;
  wire  _T_91; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281869.4]
  wire  _T_93; // @[ShiftQueue.scala 29:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281871.4]
  wire  _T_94; // @[ShiftQueue.scala 29:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281872.4]
  wire  _T_97; // @[ShiftQueue.scala 30:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281875.4]
  wire  _T_98; // @[ShiftQueue.scala 30:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281876.4]
  wire  _T_99; // @[ShiftQueue.scala 28:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281877.4]
  wire  _T_106; // @[ShiftQueue.scala 36:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281887.4]
  wire  _T_111; // @[ShiftQueue.scala 29:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281893.4]
  wire  _T_112; // @[ShiftQueue.scala 29:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281894.4]
  wire  _T_115; // @[ShiftQueue.scala 30:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281897.4]
  wire  _T_116; // @[ShiftQueue.scala 30:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281898.4]
  wire  _T_117; // @[ShiftQueue.scala 28:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281899.4]
  wire  _T_124; // @[ShiftQueue.scala 36:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281909.4]
  wire  _T_129; // @[ShiftQueue.scala 29:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281915.4]
  wire  _T_130; // @[ShiftQueue.scala 29:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281916.4]
  wire  _T_133; // @[ShiftQueue.scala 30:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281919.4]
  wire  _T_134; // @[ShiftQueue.scala 30:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281920.4]
  wire  _T_135; // @[ShiftQueue.scala 28:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281921.4]
  wire  _T_142; // @[ShiftQueue.scala 36:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281931.4]
  wire  _T_147; // @[ShiftQueue.scala 29:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281937.4]
  wire  _T_148; // @[ShiftQueue.scala 29:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281938.4]
  wire  _T_151; // @[ShiftQueue.scala 30:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281941.4]
  wire  _T_152; // @[ShiftQueue.scala 30:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281942.4]
  wire  _T_153; // @[ShiftQueue.scala 28:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281943.4]
  wire  _T_160; // @[ShiftQueue.scala 36:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281953.4]
  wire  _T_164; // @[ShiftQueue.scala 29:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281958.4]
  wire  _T_168; // @[ShiftQueue.scala 30:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281962.4]
  wire  _T_169; // @[ShiftQueue.scala 30:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281963.4]
  wire  _T_170; // @[ShiftQueue.scala 28:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281964.4]
  wire  _T_177; // @[ShiftQueue.scala 36:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281974.4]
  wire [1:0] _T_181; // @[ShiftQueue.scala 52:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281988.4]
  wire [1:0] _T_182; // @[ShiftQueue.scala 52:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281989.4]
  wire [2:0] _T_183; // @[ShiftQueue.scala 52:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281990.4]
  assign _T_91 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281869.4]
  assign _T_93 = _T_91 & _T_60_0; // @[ShiftQueue.scala 29:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281871.4]
  assign _T_94 = _T_60_1 | _T_93; // @[ShiftQueue.scala 29:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281872.4]
  assign _T_97 = _T_60_0 == 1'h0; // @[ShiftQueue.scala 30:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281875.4]
  assign _T_98 = _T_91 & _T_97; // @[ShiftQueue.scala 30:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281876.4]
  assign _T_99 = io_deq_ready ? _T_94 : _T_98; // @[ShiftQueue.scala 28:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281877.4]
  assign _T_106 = _T_91 | _T_60_0; // @[ShiftQueue.scala 36:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281887.4]
  assign _T_111 = _T_91 & _T_60_1; // @[ShiftQueue.scala 29:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281893.4]
  assign _T_112 = _T_60_2 | _T_111; // @[ShiftQueue.scala 29:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281894.4]
  assign _T_115 = _T_60_1 == 1'h0; // @[ShiftQueue.scala 30:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281897.4]
  assign _T_116 = _T_93 & _T_115; // @[ShiftQueue.scala 30:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281898.4]
  assign _T_117 = io_deq_ready ? _T_112 : _T_116; // @[ShiftQueue.scala 28:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281899.4]
  assign _T_124 = _T_93 | _T_60_1; // @[ShiftQueue.scala 36:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281909.4]
  assign _T_129 = _T_91 & _T_60_2; // @[ShiftQueue.scala 29:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281915.4]
  assign _T_130 = _T_60_3 | _T_129; // @[ShiftQueue.scala 29:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281916.4]
  assign _T_133 = _T_60_2 == 1'h0; // @[ShiftQueue.scala 30:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281919.4]
  assign _T_134 = _T_111 & _T_133; // @[ShiftQueue.scala 30:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281920.4]
  assign _T_135 = io_deq_ready ? _T_130 : _T_134; // @[ShiftQueue.scala 28:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281921.4]
  assign _T_142 = _T_111 | _T_60_2; // @[ShiftQueue.scala 36:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281931.4]
  assign _T_147 = _T_91 & _T_60_3; // @[ShiftQueue.scala 29:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281937.4]
  assign _T_148 = _T_60_4 | _T_147; // @[ShiftQueue.scala 29:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281938.4]
  assign _T_151 = _T_60_3 == 1'h0; // @[ShiftQueue.scala 30:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281941.4]
  assign _T_152 = _T_129 & _T_151; // @[ShiftQueue.scala 30:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281942.4]
  assign _T_153 = io_deq_ready ? _T_148 : _T_152; // @[ShiftQueue.scala 28:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281943.4]
  assign _T_160 = _T_129 | _T_60_3; // @[ShiftQueue.scala 36:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281953.4]
  assign _T_164 = _T_91 & _T_60_4; // @[ShiftQueue.scala 29:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281958.4]
  assign _T_168 = _T_60_4 == 1'h0; // @[ShiftQueue.scala 30:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281962.4]
  assign _T_169 = _T_147 & _T_168; // @[ShiftQueue.scala 30:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281963.4]
  assign _T_170 = io_deq_ready ? _T_164 : _T_169; // @[ShiftQueue.scala 28:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281964.4]
  assign _T_177 = _T_147 | _T_60_4; // @[ShiftQueue.scala 36:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281974.4]
  assign _T_181 = {_T_60_1,_T_60_0}; // @[ShiftQueue.scala 52:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281988.4]
  assign _T_182 = {_T_60_4,_T_60_3}; // @[ShiftQueue.scala 52:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281989.4]
  assign _T_183 = {_T_182,_T_60_2}; // @[ShiftQueue.scala 52:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281990.4]
  assign io_enq_ready = _T_60_4 == 1'h0; // @[ShiftQueue.scala 39:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281978.4]
  assign io_deq_valid = io_enq_valid ? 1'h1 : _T_60_0; // @[ShiftQueue.scala 40:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281979.4 ShiftQueue.scala 44:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281982.6]
  assign io_deq_bits_btb_taken = _T_97 ? io_enq_bits_btb_taken : _T_82_0_btb_taken; // @[ShiftQueue.scala 41:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281980.4 ShiftQueue.scala 45:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281986.6]
  assign io_deq_bits_btb_bridx = _T_97 ? io_enq_bits_btb_bridx : _T_82_0_btb_bridx; // @[ShiftQueue.scala 41:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281980.4 ShiftQueue.scala 45:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281986.6]
  assign io_deq_bits_btb_entry = _T_97 ? io_enq_bits_btb_entry : _T_82_0_btb_entry; // @[ShiftQueue.scala 41:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281980.4 ShiftQueue.scala 45:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281986.6]
  assign io_deq_bits_btb_bht_history = _T_97 ? io_enq_bits_btb_bht_history : _T_82_0_btb_bht_history; // @[ShiftQueue.scala 41:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281980.4 ShiftQueue.scala 45:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281986.6]
  assign io_deq_bits_pc = _T_97 ? io_enq_bits_pc : _T_82_0_pc; // @[ShiftQueue.scala 41:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281980.4 ShiftQueue.scala 45:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281986.6]
  assign io_deq_bits_data = _T_97 ? io_enq_bits_data : _T_82_0_data; // @[ShiftQueue.scala 41:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281980.4 ShiftQueue.scala 45:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281986.6]
  assign io_deq_bits_xcpt_pf_inst = _T_97 ? io_enq_bits_xcpt_pf_inst : _T_82_0_xcpt_pf_inst; // @[ShiftQueue.scala 41:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281980.4 ShiftQueue.scala 45:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281986.6]
  assign io_deq_bits_xcpt_ae_inst = _T_97 ? io_enq_bits_xcpt_ae_inst : _T_82_0_xcpt_ae_inst; // @[ShiftQueue.scala 41:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281980.4 ShiftQueue.scala 45:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281986.6]
  assign io_deq_bits_replay = _T_97 ? io_enq_bits_replay : _T_82_0_replay; // @[ShiftQueue.scala 41:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281980.4 ShiftQueue.scala 45:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281986.6]
  assign io_mask = {_T_183,_T_181}; // @[ShiftQueue.scala 52:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281992.4]
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
  _T_60_0 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_60_1 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_60_2 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_60_3 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_60_4 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_82_0_btb_taken = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_82_0_btb_bridx = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_82_0_btb_entry = _RAND_7[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_82_0_btb_bht_history = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {2{`RANDOM}};
  _T_82_0_pc = _RAND_9[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_82_0_data = _RAND_10[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_82_0_xcpt_pf_inst = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_82_0_xcpt_ae_inst = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_82_0_replay = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_82_1_btb_taken = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_82_1_btb_bridx = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_82_1_btb_entry = _RAND_16[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_82_1_btb_bht_history = _RAND_17[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {2{`RANDOM}};
  _T_82_1_pc = _RAND_18[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_82_1_data = _RAND_19[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_82_1_xcpt_pf_inst = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_82_1_xcpt_ae_inst = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_82_1_replay = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_82_2_btb_taken = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_82_2_btb_bridx = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_82_2_btb_entry = _RAND_25[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_82_2_btb_bht_history = _RAND_26[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {2{`RANDOM}};
  _T_82_2_pc = _RAND_27[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_82_2_data = _RAND_28[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  _T_82_2_xcpt_pf_inst = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  _T_82_2_xcpt_ae_inst = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  _T_82_2_replay = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  _T_82_3_btb_taken = _RAND_32[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  _T_82_3_btb_bridx = _RAND_33[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  _T_82_3_btb_entry = _RAND_34[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  _T_82_3_btb_bht_history = _RAND_35[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {2{`RANDOM}};
  _T_82_3_pc = _RAND_36[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  _T_82_3_data = _RAND_37[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  _T_82_3_xcpt_pf_inst = _RAND_38[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  _T_82_3_xcpt_ae_inst = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  _T_82_3_replay = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  _T_82_4_btb_taken = _RAND_41[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  _T_82_4_btb_bridx = _RAND_42[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  _T_82_4_btb_entry = _RAND_43[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  _T_82_4_btb_bht_history = _RAND_44[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {2{`RANDOM}};
  _T_82_4_pc = _RAND_45[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  _T_82_4_data = _RAND_46[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  _T_82_4_xcpt_pf_inst = _RAND_47[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  _T_82_4_xcpt_ae_inst = _RAND_48[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  _T_82_4_replay = _RAND_49[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_60_0 <= 1'h0;
    end else begin
      if (io_deq_ready) begin
        _T_60_0 <= _T_94;
      end else begin
        _T_60_0 <= _T_106;
      end
    end
    if (reset) begin
      _T_60_1 <= 1'h0;
    end else begin
      if (io_deq_ready) begin
        _T_60_1 <= _T_112;
      end else begin
        _T_60_1 <= _T_124;
      end
    end
    if (reset) begin
      _T_60_2 <= 1'h0;
    end else begin
      if (io_deq_ready) begin
        _T_60_2 <= _T_130;
      end else begin
        _T_60_2 <= _T_142;
      end
    end
    if (reset) begin
      _T_60_3 <= 1'h0;
    end else begin
      if (io_deq_ready) begin
        _T_60_3 <= _T_148;
      end else begin
        _T_60_3 <= _T_160;
      end
    end
    if (reset) begin
      _T_60_4 <= 1'h0;
    end else begin
      if (io_deq_ready) begin
        _T_60_4 <= _T_164;
      end else begin
        _T_60_4 <= _T_177;
      end
    end
    if (_T_99) begin
      if (_T_60_1) begin
        _T_82_0_btb_taken <= _T_82_1_btb_taken;
      end else begin
        _T_82_0_btb_taken <= io_enq_bits_btb_taken;
      end
    end
    if (_T_99) begin
      if (_T_60_1) begin
        _T_82_0_btb_bridx <= _T_82_1_btb_bridx;
      end else begin
        _T_82_0_btb_bridx <= io_enq_bits_btb_bridx;
      end
    end
    if (_T_99) begin
      if (_T_60_1) begin
        _T_82_0_btb_entry <= _T_82_1_btb_entry;
      end else begin
        _T_82_0_btb_entry <= io_enq_bits_btb_entry;
      end
    end
    if (_T_99) begin
      if (_T_60_1) begin
        _T_82_0_btb_bht_history <= _T_82_1_btb_bht_history;
      end else begin
        _T_82_0_btb_bht_history <= io_enq_bits_btb_bht_history;
      end
    end
    if (_T_99) begin
      if (_T_60_1) begin
        _T_82_0_pc <= _T_82_1_pc;
      end else begin
        _T_82_0_pc <= io_enq_bits_pc;
      end
    end
    if (_T_99) begin
      if (_T_60_1) begin
        _T_82_0_data <= _T_82_1_data;
      end else begin
        _T_82_0_data <= io_enq_bits_data;
      end
    end
    if (_T_99) begin
      if (_T_60_1) begin
        _T_82_0_xcpt_pf_inst <= _T_82_1_xcpt_pf_inst;
      end else begin
        _T_82_0_xcpt_pf_inst <= io_enq_bits_xcpt_pf_inst;
      end
    end
    if (_T_99) begin
      if (_T_60_1) begin
        _T_82_0_xcpt_ae_inst <= _T_82_1_xcpt_ae_inst;
      end else begin
        _T_82_0_xcpt_ae_inst <= io_enq_bits_xcpt_ae_inst;
      end
    end
    if (_T_99) begin
      if (_T_60_1) begin
        _T_82_0_replay <= _T_82_1_replay;
      end else begin
        _T_82_0_replay <= io_enq_bits_replay;
      end
    end
    if (_T_117) begin
      if (_T_60_2) begin
        _T_82_1_btb_taken <= _T_82_2_btb_taken;
      end else begin
        _T_82_1_btb_taken <= io_enq_bits_btb_taken;
      end
    end
    if (_T_117) begin
      if (_T_60_2) begin
        _T_82_1_btb_bridx <= _T_82_2_btb_bridx;
      end else begin
        _T_82_1_btb_bridx <= io_enq_bits_btb_bridx;
      end
    end
    if (_T_117) begin
      if (_T_60_2) begin
        _T_82_1_btb_entry <= _T_82_2_btb_entry;
      end else begin
        _T_82_1_btb_entry <= io_enq_bits_btb_entry;
      end
    end
    if (_T_117) begin
      if (_T_60_2) begin
        _T_82_1_btb_bht_history <= _T_82_2_btb_bht_history;
      end else begin
        _T_82_1_btb_bht_history <= io_enq_bits_btb_bht_history;
      end
    end
    if (_T_117) begin
      if (_T_60_2) begin
        _T_82_1_pc <= _T_82_2_pc;
      end else begin
        _T_82_1_pc <= io_enq_bits_pc;
      end
    end
    if (_T_117) begin
      if (_T_60_2) begin
        _T_82_1_data <= _T_82_2_data;
      end else begin
        _T_82_1_data <= io_enq_bits_data;
      end
    end
    if (_T_117) begin
      if (_T_60_2) begin
        _T_82_1_xcpt_pf_inst <= _T_82_2_xcpt_pf_inst;
      end else begin
        _T_82_1_xcpt_pf_inst <= io_enq_bits_xcpt_pf_inst;
      end
    end
    if (_T_117) begin
      if (_T_60_2) begin
        _T_82_1_xcpt_ae_inst <= _T_82_2_xcpt_ae_inst;
      end else begin
        _T_82_1_xcpt_ae_inst <= io_enq_bits_xcpt_ae_inst;
      end
    end
    if (_T_117) begin
      if (_T_60_2) begin
        _T_82_1_replay <= _T_82_2_replay;
      end else begin
        _T_82_1_replay <= io_enq_bits_replay;
      end
    end
    if (_T_135) begin
      if (_T_60_3) begin
        _T_82_2_btb_taken <= _T_82_3_btb_taken;
      end else begin
        _T_82_2_btb_taken <= io_enq_bits_btb_taken;
      end
    end
    if (_T_135) begin
      if (_T_60_3) begin
        _T_82_2_btb_bridx <= _T_82_3_btb_bridx;
      end else begin
        _T_82_2_btb_bridx <= io_enq_bits_btb_bridx;
      end
    end
    if (_T_135) begin
      if (_T_60_3) begin
        _T_82_2_btb_entry <= _T_82_3_btb_entry;
      end else begin
        _T_82_2_btb_entry <= io_enq_bits_btb_entry;
      end
    end
    if (_T_135) begin
      if (_T_60_3) begin
        _T_82_2_btb_bht_history <= _T_82_3_btb_bht_history;
      end else begin
        _T_82_2_btb_bht_history <= io_enq_bits_btb_bht_history;
      end
    end
    if (_T_135) begin
      if (_T_60_3) begin
        _T_82_2_pc <= _T_82_3_pc;
      end else begin
        _T_82_2_pc <= io_enq_bits_pc;
      end
    end
    if (_T_135) begin
      if (_T_60_3) begin
        _T_82_2_data <= _T_82_3_data;
      end else begin
        _T_82_2_data <= io_enq_bits_data;
      end
    end
    if (_T_135) begin
      if (_T_60_3) begin
        _T_82_2_xcpt_pf_inst <= _T_82_3_xcpt_pf_inst;
      end else begin
        _T_82_2_xcpt_pf_inst <= io_enq_bits_xcpt_pf_inst;
      end
    end
    if (_T_135) begin
      if (_T_60_3) begin
        _T_82_2_xcpt_ae_inst <= _T_82_3_xcpt_ae_inst;
      end else begin
        _T_82_2_xcpt_ae_inst <= io_enq_bits_xcpt_ae_inst;
      end
    end
    if (_T_135) begin
      if (_T_60_3) begin
        _T_82_2_replay <= _T_82_3_replay;
      end else begin
        _T_82_2_replay <= io_enq_bits_replay;
      end
    end
    if (_T_153) begin
      if (_T_60_4) begin
        _T_82_3_btb_taken <= _T_82_4_btb_taken;
      end else begin
        _T_82_3_btb_taken <= io_enq_bits_btb_taken;
      end
    end
    if (_T_153) begin
      if (_T_60_4) begin
        _T_82_3_btb_bridx <= _T_82_4_btb_bridx;
      end else begin
        _T_82_3_btb_bridx <= io_enq_bits_btb_bridx;
      end
    end
    if (_T_153) begin
      if (_T_60_4) begin
        _T_82_3_btb_entry <= _T_82_4_btb_entry;
      end else begin
        _T_82_3_btb_entry <= io_enq_bits_btb_entry;
      end
    end
    if (_T_153) begin
      if (_T_60_4) begin
        _T_82_3_btb_bht_history <= _T_82_4_btb_bht_history;
      end else begin
        _T_82_3_btb_bht_history <= io_enq_bits_btb_bht_history;
      end
    end
    if (_T_153) begin
      if (_T_60_4) begin
        _T_82_3_pc <= _T_82_4_pc;
      end else begin
        _T_82_3_pc <= io_enq_bits_pc;
      end
    end
    if (_T_153) begin
      if (_T_60_4) begin
        _T_82_3_data <= _T_82_4_data;
      end else begin
        _T_82_3_data <= io_enq_bits_data;
      end
    end
    if (_T_153) begin
      if (_T_60_4) begin
        _T_82_3_xcpt_pf_inst <= _T_82_4_xcpt_pf_inst;
      end else begin
        _T_82_3_xcpt_pf_inst <= io_enq_bits_xcpt_pf_inst;
      end
    end
    if (_T_153) begin
      if (_T_60_4) begin
        _T_82_3_xcpt_ae_inst <= _T_82_4_xcpt_ae_inst;
      end else begin
        _T_82_3_xcpt_ae_inst <= io_enq_bits_xcpt_ae_inst;
      end
    end
    if (_T_153) begin
      if (_T_60_4) begin
        _T_82_3_replay <= _T_82_4_replay;
      end else begin
        _T_82_3_replay <= io_enq_bits_replay;
      end
    end
    if (_T_170) begin
      _T_82_4_btb_taken <= io_enq_bits_btb_taken;
    end
    if (_T_170) begin
      _T_82_4_btb_bridx <= io_enq_bits_btb_bridx;
    end
    if (_T_170) begin
      _T_82_4_btb_entry <= io_enq_bits_btb_entry;
    end
    if (_T_170) begin
      _T_82_4_btb_bht_history <= io_enq_bits_btb_bht_history;
    end
    if (_T_170) begin
      _T_82_4_pc <= io_enq_bits_pc;
    end
    if (_T_170) begin
      _T_82_4_data <= io_enq_bits_data;
    end
    if (_T_170) begin
      _T_82_4_xcpt_pf_inst <= io_enq_bits_xcpt_pf_inst;
    end
    if (_T_170) begin
      _T_82_4_xcpt_ae_inst <= io_enq_bits_xcpt_ae_inst;
    end
    if (_T_170) begin
      _T_82_4_replay <= io_enq_bits_replay;
    end
  end
endmodule