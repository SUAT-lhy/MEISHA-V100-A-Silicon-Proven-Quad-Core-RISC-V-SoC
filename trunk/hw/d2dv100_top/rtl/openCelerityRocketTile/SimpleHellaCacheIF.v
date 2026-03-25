module SimpleHellaCacheIF( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305161.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305162.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305163.4]
  output        io_requestor_req_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_requestor_req_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input  [39:0] io_requestor_req_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input  [7:0]  io_requestor_req_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input  [4:0]  io_requestor_req_bits_cmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input  [2:0]  io_requestor_req_bits_typ, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_requestor_req_bits_phys, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input  [63:0] io_requestor_req_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output        io_requestor_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output [39:0] io_requestor_resp_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output [7:0]  io_requestor_resp_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output [4:0]  io_requestor_resp_bits_cmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output [63:0] io_requestor_resp_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output        io_requestor_resp_bits_replay, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output        io_requestor_resp_bits_has_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output [63:0] io_requestor_resp_bits_data_word_bypass, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output [63:0] io_requestor_resp_bits_store_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_cache_req_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output        io_cache_req_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output [39:0] io_cache_req_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output [7:0]  io_cache_req_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output [4:0]  io_cache_req_bits_cmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output [2:0]  io_cache_req_bits_typ, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output        io_cache_req_bits_phys, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output        io_cache_s1_kill, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  output [63:0] io_cache_s1_data_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_cache_s2_nack, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_cache_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input  [39:0] io_cache_resp_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input  [7:0]  io_cache_resp_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input  [4:0]  io_cache_resp_bits_cmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input  [63:0] io_cache_resp_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_cache_resp_bits_replay, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_cache_resp_bits_has_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input  [63:0] io_cache_resp_bits_data_word_bypass, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input  [63:0] io_cache_resp_bits_store_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_cache_s2_xcpt_ma_ld, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_cache_s2_xcpt_ma_st, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_cache_s2_xcpt_pf_ld, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_cache_s2_xcpt_pf_st, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_cache_s2_xcpt_ae_ld, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
  input         io_cache_s2_xcpt_ae_st // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305164.4]
);
  wire  replayq_clock; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire  replayq_reset; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire  replayq_io_req_ready; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire  replayq_io_req_valid; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire [39:0] replayq_io_req_bits_addr; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire [7:0] replayq_io_req_bits_tag; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire [4:0] replayq_io_req_bits_cmd; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire [2:0] replayq_io_req_bits_typ; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire  replayq_io_req_bits_phys; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire [63:0] replayq_io_req_bits_data; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire  replayq_io_nack_valid; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire [5:0] replayq_io_nack_bits; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire  replayq_io_resp_valid; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire [7:0] replayq_io_resp_bits_tag; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire  replayq_io_replay_ready; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire  replayq_io_replay_valid; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire [39:0] replayq_io_replay_bits_addr; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire [7:0] replayq_io_replay_bits_tag; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire [4:0] replayq_io_replay_bits_cmd; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire [2:0] replayq_io_replay_bits_typ; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire  replayq_io_replay_bits_phys; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire [63:0] replayq_io_replay_bits_data; // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
  wire  req_arb_io_in_0_ready; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire  req_arb_io_in_0_valid; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [39:0] req_arb_io_in_0_bits_addr; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [7:0] req_arb_io_in_0_bits_tag; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [4:0] req_arb_io_in_0_bits_cmd; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [2:0] req_arb_io_in_0_bits_typ; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire  req_arb_io_in_0_bits_phys; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [63:0] req_arb_io_in_0_bits_data; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire  req_arb_io_in_1_ready; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire  req_arb_io_in_1_valid; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [39:0] req_arb_io_in_1_bits_addr; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [7:0] req_arb_io_in_1_bits_tag; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [4:0] req_arb_io_in_1_bits_cmd; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [2:0] req_arb_io_in_1_bits_typ; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire  req_arb_io_in_1_bits_phys; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [63:0] req_arb_io_in_1_bits_data; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire  req_arb_io_out_ready; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire  req_arb_io_out_valid; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [39:0] req_arb_io_out_bits_addr; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [7:0] req_arb_io_out_bits_tag; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [4:0] req_arb_io_out_bits_cmd; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [2:0] req_arb_io_out_bits_typ; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire  req_arb_io_out_bits_phys; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire [63:0] req_arb_io_out_bits_data; // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
  wire  s0_req_fire; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305186.4]
  reg  s1_req_fire; // @[SimpleHellaCacheIF.scala 118:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305187.4]
  reg [31:0] _RAND_0;
  reg  s2_req_fire; // @[SimpleHellaCacheIF.scala 119:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305189.4]
  reg [31:0] _RAND_1;
  reg [7:0] s1_req_tag; // @[SimpleHellaCacheIF.scala 120:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305191.4]
  reg [31:0] _RAND_2;
  reg [7:0] s2_req_tag; // @[SimpleHellaCacheIF.scala 121:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305193.4]
  reg [31:0] _RAND_3;
  reg  s2_kill; // @[SimpleHellaCacheIF.scala 122:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305195.4]
  reg [31:0] _RAND_4;
  reg [63:0] _T_69; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305199.4]
  reg [63:0] _RAND_5;
  wire  _T_70; // @[SimpleHellaCacheIF.scala 129:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305205.4]
  reg  _T_74; // @[SimpleHellaCacheIF.scala 134:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305212.4]
  reg [31:0] _RAND_6;
  reg  _T_76; // @[SimpleHellaCacheIF.scala 134:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305214.4]
  reg [31:0] _RAND_7;
  wire  _T_77; // @[SimpleHellaCacheIF.scala 134:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305216.4]
  wire [1:0] _T_78; // @[SimpleHellaCacheIF.scala 134:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305217.4]
  wire [2:0] _T_79; // @[SimpleHellaCacheIF.scala 134:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305218.4]
  wire [1:0] _T_80; // @[SimpleHellaCacheIF.scala 134:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305219.4]
  wire [2:0] _T_81; // @[SimpleHellaCacheIF.scala 134:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305220.4]
  wire [5:0] _T_82; // @[SimpleHellaCacheIF.scala 134:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305221.4]
  wire  _T_83; // @[SimpleHellaCacheIF.scala 134:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305222.4]
  wire  _T_84; // @[SimpleHellaCacheIF.scala 134:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305223.4]
  wire  _T_85; // @[SimpleHellaCacheIF.scala 134:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305224.4]
  wire  _T_87; // @[SimpleHellaCacheIF.scala 134:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305226.4]
  wire  _T_88; // @[SimpleHellaCacheIF.scala 134:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305227.4]
  SimpleHellaCacheIFReplayQueue replayq ( // @[SimpleHellaCacheIF.scala 102:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305169.4]
    .clock(replayq_clock),
    .reset(replayq_reset),
    .io_req_ready(replayq_io_req_ready),
    .io_req_valid(replayq_io_req_valid),
    .io_req_bits_addr(replayq_io_req_bits_addr),
    .io_req_bits_tag(replayq_io_req_bits_tag),
    .io_req_bits_cmd(replayq_io_req_bits_cmd),
    .io_req_bits_typ(replayq_io_req_bits_typ),
    .io_req_bits_phys(replayq_io_req_bits_phys),
    .io_req_bits_data(replayq_io_req_bits_data),
    .io_nack_valid(replayq_io_nack_valid),
    .io_nack_bits(replayq_io_nack_bits),
    .io_resp_valid(replayq_io_resp_valid),
    .io_resp_bits_tag(replayq_io_resp_bits_tag),
    .io_replay_ready(replayq_io_replay_ready),
    .io_replay_valid(replayq_io_replay_valid),
    .io_replay_bits_addr(replayq_io_replay_bits_addr),
    .io_replay_bits_tag(replayq_io_replay_bits_tag),
    .io_replay_bits_cmd(replayq_io_replay_bits_cmd),
    .io_replay_bits_typ(replayq_io_replay_bits_typ),
    .io_replay_bits_phys(replayq_io_replay_bits_phys),
    .io_replay_bits_data(replayq_io_replay_bits_data)
  );
  Arbiter_2 req_arb ( // @[SimpleHellaCacheIF.scala 103:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305173.4]
    .io_in_0_ready(req_arb_io_in_0_ready),
    .io_in_0_valid(req_arb_io_in_0_valid),
    .io_in_0_bits_addr(req_arb_io_in_0_bits_addr),
    .io_in_0_bits_tag(req_arb_io_in_0_bits_tag),
    .io_in_0_bits_cmd(req_arb_io_in_0_bits_cmd),
    .io_in_0_bits_typ(req_arb_io_in_0_bits_typ),
    .io_in_0_bits_phys(req_arb_io_in_0_bits_phys),
    .io_in_0_bits_data(req_arb_io_in_0_bits_data),
    .io_in_1_ready(req_arb_io_in_1_ready),
    .io_in_1_valid(req_arb_io_in_1_valid),
    .io_in_1_bits_addr(req_arb_io_in_1_bits_addr),
    .io_in_1_bits_tag(req_arb_io_in_1_bits_tag),
    .io_in_1_bits_cmd(req_arb_io_in_1_bits_cmd),
    .io_in_1_bits_typ(req_arb_io_in_1_bits_typ),
    .io_in_1_bits_phys(req_arb_io_in_1_bits_phys),
    .io_in_1_bits_data(req_arb_io_in_1_bits_data),
    .io_out_ready(req_arb_io_out_ready),
    .io_out_valid(req_arb_io_out_valid),
    .io_out_bits_addr(req_arb_io_out_bits_addr),
    .io_out_bits_tag(req_arb_io_out_bits_tag),
    .io_out_bits_cmd(req_arb_io_out_bits_cmd),
    .io_out_bits_typ(req_arb_io_out_bits_typ),
    .io_out_bits_phys(req_arb_io_out_bits_phys),
    .io_out_bits_data(req_arb_io_out_bits_data)
  );
  assign s0_req_fire = io_cache_req_ready & io_cache_req_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305186.4]
  assign _T_70 = io_cache_s2_nack | s2_kill; // @[SimpleHellaCacheIF.scala 129:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305205.4]
  assign _T_77 = _T_76 == 1'h0; // @[SimpleHellaCacheIF.scala 134:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305216.4]
  assign _T_78 = {io_cache_s2_xcpt_pf_st,io_cache_s2_xcpt_ae_ld}; // @[SimpleHellaCacheIF.scala 134:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305217.4]
  assign _T_79 = {_T_78,io_cache_s2_xcpt_ae_st}; // @[SimpleHellaCacheIF.scala 134:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305218.4]
  assign _T_80 = {io_cache_s2_xcpt_ma_ld,io_cache_s2_xcpt_ma_st}; // @[SimpleHellaCacheIF.scala 134:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305219.4]
  assign _T_81 = {_T_80,io_cache_s2_xcpt_pf_ld}; // @[SimpleHellaCacheIF.scala 134:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305220.4]
  assign _T_82 = {_T_81,_T_79}; // @[SimpleHellaCacheIF.scala 134:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305221.4]
  assign _T_83 = _T_82 != 6'h0; // @[SimpleHellaCacheIF.scala 134:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305222.4]
  assign _T_84 = _T_83 == 1'h0; // @[SimpleHellaCacheIF.scala 134:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305223.4]
  assign _T_85 = _T_77 | _T_84; // @[SimpleHellaCacheIF.scala 134:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305224.4]
  assign _T_87 = _T_85 | reset; // @[SimpleHellaCacheIF.scala 134:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305226.4]
  assign _T_88 = _T_87 == 1'h0; // @[SimpleHellaCacheIF.scala 134:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305227.4]
  assign io_requestor_req_ready = req_arb_io_in_1_ready & replayq_io_req_ready; // @[SimpleHellaCacheIF.scala 113:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305182.4]
  assign io_requestor_resp_valid = io_cache_resp_valid; // @[SimpleHellaCacheIF.scala 132:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305210.4]
  assign io_requestor_resp_bits_addr = io_cache_resp_bits_addr; // @[SimpleHellaCacheIF.scala 132:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305210.4]
  assign io_requestor_resp_bits_tag = io_cache_resp_bits_tag; // @[SimpleHellaCacheIF.scala 132:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305210.4]
  assign io_requestor_resp_bits_cmd = io_cache_resp_bits_cmd; // @[SimpleHellaCacheIF.scala 132:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305210.4]
  assign io_requestor_resp_bits_data = io_cache_resp_bits_data; // @[SimpleHellaCacheIF.scala 132:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305210.4]
  assign io_requestor_resp_bits_replay = io_cache_resp_bits_replay; // @[SimpleHellaCacheIF.scala 132:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305210.4]
  assign io_requestor_resp_bits_has_data = io_cache_resp_bits_has_data; // @[SimpleHellaCacheIF.scala 132:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305210.4]
  assign io_requestor_resp_bits_data_word_bypass = io_cache_resp_bits_data_word_bypass; // @[SimpleHellaCacheIF.scala 132:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305210.4]
  assign io_requestor_resp_bits_store_data = io_cache_resp_bits_store_data; // @[SimpleHellaCacheIF.scala 132:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305210.4]
  assign io_cache_req_valid = req_arb_io_out_valid; // @[SimpleHellaCacheIF.scala 124:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305197.4]
  assign io_cache_req_bits_addr = req_arb_io_out_bits_addr; // @[SimpleHellaCacheIF.scala 124:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305197.4]
  assign io_cache_req_bits_tag = req_arb_io_out_bits_tag; // @[SimpleHellaCacheIF.scala 124:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305197.4]
  assign io_cache_req_bits_cmd = req_arb_io_out_bits_cmd; // @[SimpleHellaCacheIF.scala 124:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305197.4]
  assign io_cache_req_bits_typ = req_arb_io_out_bits_typ; // @[SimpleHellaCacheIF.scala 124:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305197.4]
  assign io_cache_req_bits_phys = req_arb_io_out_bits_phys; // @[SimpleHellaCacheIF.scala 124:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305197.4]
  assign io_cache_s1_kill = io_cache_s2_nack; // @[SimpleHellaCacheIF.scala 125:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305198.4]
  assign io_cache_s1_data_data = _T_69; // @[SimpleHellaCacheIF.scala 126:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305203.4]
  assign replayq_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305171.4]
  assign replayq_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305172.4]
  assign replayq_io_req_valid = req_arb_io_in_1_ready & io_requestor_req_valid; // @[SimpleHellaCacheIF.scala 114:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305184.4]
  assign replayq_io_req_bits_addr = io_requestor_req_bits_addr; // @[SimpleHellaCacheIF.scala 115:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305185.4]
  assign replayq_io_req_bits_tag = io_requestor_req_bits_tag; // @[SimpleHellaCacheIF.scala 115:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305185.4]
  assign replayq_io_req_bits_cmd = io_requestor_req_bits_cmd; // @[SimpleHellaCacheIF.scala 115:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305185.4]
  assign replayq_io_req_bits_typ = io_requestor_req_bits_typ; // @[SimpleHellaCacheIF.scala 115:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305185.4]
  assign replayq_io_req_bits_phys = io_requestor_req_bits_phys; // @[SimpleHellaCacheIF.scala 115:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305185.4]
  assign replayq_io_req_bits_data = io_requestor_req_bits_data; // @[SimpleHellaCacheIF.scala 115:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305185.4]
  assign replayq_io_nack_valid = _T_70 & s2_req_fire; // @[SimpleHellaCacheIF.scala 129:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305207.4]
  assign replayq_io_nack_bits = s2_req_tag[5:0]; // @[SimpleHellaCacheIF.scala 130:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305208.4]
  assign replayq_io_resp_valid = io_cache_resp_valid; // @[SimpleHellaCacheIF.scala 131:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305209.4]
  assign replayq_io_resp_bits_tag = io_cache_resp_bits_tag; // @[SimpleHellaCacheIF.scala 131:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305209.4]
  assign replayq_io_replay_ready = req_arb_io_in_0_ready; // @[SimpleHellaCacheIF.scala 110:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305177.4]
  assign req_arb_io_in_0_valid = replayq_io_replay_valid; // @[SimpleHellaCacheIF.scala 110:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305177.4]
  assign req_arb_io_in_0_bits_addr = replayq_io_replay_bits_addr; // @[SimpleHellaCacheIF.scala 110:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305177.4]
  assign req_arb_io_in_0_bits_tag = replayq_io_replay_bits_tag; // @[SimpleHellaCacheIF.scala 110:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305177.4]
  assign req_arb_io_in_0_bits_cmd = replayq_io_replay_bits_cmd; // @[SimpleHellaCacheIF.scala 110:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305177.4]
  assign req_arb_io_in_0_bits_typ = replayq_io_replay_bits_typ; // @[SimpleHellaCacheIF.scala 110:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305177.4]
  assign req_arb_io_in_0_bits_phys = replayq_io_replay_bits_phys; // @[SimpleHellaCacheIF.scala 110:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305177.4]
  assign req_arb_io_in_0_bits_data = replayq_io_replay_bits_data; // @[SimpleHellaCacheIF.scala 110:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305177.4]
  assign req_arb_io_in_1_valid = replayq_io_req_ready & io_requestor_req_valid; // @[SimpleHellaCacheIF.scala 111:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305179.4]
  assign req_arb_io_in_1_bits_addr = io_requestor_req_bits_addr; // @[SimpleHellaCacheIF.scala 112:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305180.4]
  assign req_arb_io_in_1_bits_tag = io_requestor_req_bits_tag; // @[SimpleHellaCacheIF.scala 112:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305180.4]
  assign req_arb_io_in_1_bits_cmd = io_requestor_req_bits_cmd; // @[SimpleHellaCacheIF.scala 112:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305180.4]
  assign req_arb_io_in_1_bits_typ = io_requestor_req_bits_typ; // @[SimpleHellaCacheIF.scala 112:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305180.4]
  assign req_arb_io_in_1_bits_phys = io_requestor_req_bits_phys; // @[SimpleHellaCacheIF.scala 112:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305180.4]
  assign req_arb_io_in_1_bits_data = io_requestor_req_bits_data; // @[SimpleHellaCacheIF.scala 112:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305180.4]
  assign req_arb_io_out_ready = io_cache_req_ready; // @[SimpleHellaCacheIF.scala 124:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305197.4]
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
  s1_req_fire = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  s2_req_fire = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  s1_req_tag = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  s2_req_tag = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  s2_kill = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  _T_69 = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_74 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_76 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    s1_req_fire <= io_cache_req_ready & io_cache_req_valid;
    s2_req_fire <= s1_req_fire;
    s1_req_tag <= io_cache_req_bits_tag;
    s2_req_tag <= s1_req_tag;
    s2_kill <= io_cache_s1_kill;
    if (s0_req_fire) begin
      _T_69 <= req_arb_io_out_bits_data;
    end
    _T_74 <= io_cache_req_ready & io_cache_req_valid;
    _T_76 <= _T_74;
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_88) begin
          $fwrite(32'h80000002,"Assertion failed: SimpleHellaCacheIF exception\n    at SimpleHellaCacheIF.scala:134 assert(!RegNext(RegNext(io.cache.req.fire())) || !io.cache.s2_xcpt.asUInt.orR,\n"); // @[SimpleHellaCacheIF.scala 134:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305229.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_88) begin
          $fatal; // @[SimpleHellaCacheIF.scala 134:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305230.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule