module SimpleHellaCacheIFReplayQueue( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305039.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305040.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305041.4]
  output        io_req_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  input         io_req_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  input  [39:0] io_req_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  input  [7:0]  io_req_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  input  [4:0]  io_req_bits_cmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  input  [2:0]  io_req_bits_typ, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  input         io_req_bits_phys, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  input  [63:0] io_req_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  input         io_nack_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  input  [5:0]  io_nack_bits, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  input         io_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  input  [7:0]  io_resp_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  input         io_replay_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  output        io_replay_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  output [39:0] io_replay_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  output [7:0]  io_replay_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  output [4:0]  io_replay_bits_cmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  output [2:0]  io_replay_bits_typ, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  output        io_replay_bits_phys, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
  output [63:0] io_replay_bits_data // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305042.4]
);
  wire  nackq_clock; // @[SimpleHellaCacheIF.scala 44:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305049.4]
  wire  nackq_reset; // @[SimpleHellaCacheIF.scala 44:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305049.4]
  wire  nackq_io_enq_ready; // @[SimpleHellaCacheIF.scala 44:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305049.4]
  wire  nackq_io_enq_valid; // @[SimpleHellaCacheIF.scala 44:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305049.4]
  wire  nackq_io_enq_bits; // @[SimpleHellaCacheIF.scala 44:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305049.4]
  wire  nackq_io_deq_ready; // @[SimpleHellaCacheIF.scala 44:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305049.4]
  wire  nackq_io_deq_valid; // @[SimpleHellaCacheIF.scala 44:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305049.4]
  wire  nackq_io_deq_bits; // @[SimpleHellaCacheIF.scala 44:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305049.4]
  reg [1:0] inflight; // @[SimpleHellaCacheIF.scala 34:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305047.4]
  reg [31:0] _RAND_0;
  reg [39:0] reqs_0_addr; // @[SimpleHellaCacheIF.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305048.4]
  reg [63:0] _RAND_1;
  reg [7:0] reqs_0_tag; // @[SimpleHellaCacheIF.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305048.4]
  reg [31:0] _RAND_2;
  reg [4:0] reqs_0_cmd; // @[SimpleHellaCacheIF.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305048.4]
  reg [31:0] _RAND_3;
  reg [2:0] reqs_0_typ; // @[SimpleHellaCacheIF.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305048.4]
  reg [31:0] _RAND_4;
  reg  reqs_0_phys; // @[SimpleHellaCacheIF.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305048.4]
  reg [31:0] _RAND_5;
  reg [63:0] reqs_0_data; // @[SimpleHellaCacheIF.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305048.4]
  reg [63:0] _RAND_6;
  reg [39:0] reqs_1_addr; // @[SimpleHellaCacheIF.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305048.4]
  reg [63:0] _RAND_7;
  reg [7:0] reqs_1_tag; // @[SimpleHellaCacheIF.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305048.4]
  reg [31:0] _RAND_8;
  reg [4:0] reqs_1_cmd; // @[SimpleHellaCacheIF.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305048.4]
  reg [31:0] _RAND_9;
  reg [2:0] reqs_1_typ; // @[SimpleHellaCacheIF.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305048.4]
  reg [31:0] _RAND_10;
  reg  reqs_1_phys; // @[SimpleHellaCacheIF.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305048.4]
  reg [31:0] _RAND_11;
  reg [63:0] reqs_1_data; // @[SimpleHellaCacheIF.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305048.4]
  reg [63:0] _RAND_12;
  reg  replaying; // @[SimpleHellaCacheIF.scala 45:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305053.4]
  reg [31:0] _RAND_13;
  wire [1:0] _T_30; // @[SimpleHellaCacheIF.scala 47:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305054.4]
  wire  _T_31; // @[OneHot.scala 68:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305055.4]
  wire  _T_32; // @[OneHot.scala 68:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305056.4]
  wire [1:0] _T_33; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305057.4]
  wire [1:0] next_inflight_onehot; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305058.4]
  wire  next_inflight; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305059.4]
  wire  _T_35; // @[SimpleHellaCacheIF.scala 55:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305061.4]
  wire [7:0] _GEN_7; // @[SimpleHellaCacheIF.scala 56:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305064.4]
  wire  _T_38; // @[SimpleHellaCacheIF.scala 59:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305066.4]
  wire  _T_39; // @[SimpleHellaCacheIF.scala 59:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305067.4]
  wire  _T_40; // @[SimpleHellaCacheIF.scala 59:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305068.4]
  wire  _T_41; // @[SimpleHellaCacheIF.scala 59:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305069.4]
  wire  _T_42; // @[SimpleHellaCacheIF.scala 59:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305070.4]
  wire [7:0] _GEN_38; // @[SimpleHellaCacheIF.scala 62:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305073.4]
  wire  _T_44; // @[SimpleHellaCacheIF.scala 62:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305073.4]
  wire  _T_45; // @[SimpleHellaCacheIF.scala 62:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305074.4]
  wire [1:0] _T_46; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305075.4]
  wire [1:0] nack_onehot; // @[SimpleHellaCacheIF.scala 62:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305076.4]
  wire  _T_47; // @[SimpleHellaCacheIF.scala 63:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305077.4]
  wire  _T_48; // @[SimpleHellaCacheIF.scala 63:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305078.4]
  wire [1:0] _T_49; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305079.4]
  wire [1:0] resp_onehot; // @[SimpleHellaCacheIF.scala 63:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305080.4]
  wire  _T_50; // @[SimpleHellaCacheIF.scala 65:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305081.4]
  wire  _T_51; // @[SimpleHellaCacheIF.scala 65:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305082.4]
  wire  replay_complete; // @[SimpleHellaCacheIF.scala 65:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305083.4]
  wire  _T_52; // @[SimpleHellaCacheIF.scala 66:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305084.4]
  wire  _T_53; // @[SimpleHellaCacheIF.scala 66:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305085.4]
  wire  nack_head; // @[SimpleHellaCacheIF.scala 66:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305086.4]
  wire  _T_54; // @[SimpleHellaCacheIF.scala 70:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305087.4]
  wire  _T_57; // @[SimpleHellaCacheIF.scala 72:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305092.4]
  wire  _T_58; // @[SimpleHellaCacheIF.scala 72:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305093.4]
  wire  _T_60; // @[SimpleHellaCacheIF.scala 72:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305095.4]
  wire  _T_61; // @[SimpleHellaCacheIF.scala 72:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305096.4]
  wire  _T_62; // @[SimpleHellaCacheIF.scala 77:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305102.4]
  wire  _T_63; // @[SimpleHellaCacheIF.scala 77:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305103.4]
  wire  _T_65; // @[SimpleHellaCacheIF.scala 77:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305105.4]
  wire  _T_66; // @[SimpleHellaCacheIF.scala 77:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305106.4]
  wire  _T_67; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305111.4]
  wire [1:0] _T_68; // @[SimpleHellaCacheIF.scala 82:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305112.4]
  wire [1:0] _T_69; // @[SimpleHellaCacheIF.scala 82:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305113.4]
  wire [1:0] _T_70; // @[SimpleHellaCacheIF.scala 83:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305114.4]
  wire [1:0] _T_71; // @[SimpleHellaCacheIF.scala 83:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305115.4]
  wire [1:0] _T_72; // @[SimpleHellaCacheIF.scala 82:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305116.4]
  wire  _T_75; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305122.4]
  wire  _T_76; // @[SimpleHellaCacheIF.scala 91:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305126.4]
  Queue_24 nackq ( // @[SimpleHellaCacheIF.scala 44:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305049.4]
    .clock(nackq_clock),
    .reset(nackq_reset),
    .io_enq_ready(nackq_io_enq_ready),
    .io_enq_valid(nackq_io_enq_valid),
    .io_enq_bits(nackq_io_enq_bits),
    .io_deq_ready(nackq_io_deq_ready),
    .io_deq_valid(nackq_io_deq_valid),
    .io_deq_bits(nackq_io_deq_bits)
  );
  assign _T_30 = ~ inflight; // @[SimpleHellaCacheIF.scala 47:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305054.4]
  assign _T_31 = _T_30[0]; // @[OneHot.scala 68:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305055.4]
  assign _T_32 = _T_30[1]; // @[OneHot.scala 68:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305056.4]
  assign _T_33 = _T_32 ? 2'h2 : 2'h0; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305057.4]
  assign next_inflight_onehot = _T_31 ? 2'h1 : _T_33; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305058.4]
  assign next_inflight = next_inflight_onehot[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305059.4]
  assign _T_35 = replaying == 1'h0; // @[SimpleHellaCacheIF.scala 55:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305061.4]
  assign _GEN_7 = nackq_io_deq_bits ? reqs_1_tag : reqs_0_tag; // @[SimpleHellaCacheIF.scala 56:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305064.4]
  assign _T_38 = _T_30 == 2'h0; // @[SimpleHellaCacheIF.scala 59:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305066.4]
  assign _T_39 = _T_38 == 1'h0; // @[SimpleHellaCacheIF.scala 59:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305067.4]
  assign _T_40 = nackq_io_deq_valid == 1'h0; // @[SimpleHellaCacheIF.scala 59:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305068.4]
  assign _T_41 = _T_39 & _T_40; // @[SimpleHellaCacheIF.scala 59:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305069.4]
  assign _T_42 = io_nack_valid == 1'h0; // @[SimpleHellaCacheIF.scala 59:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305070.4]
  assign _GEN_38 = {{2'd0}, io_nack_bits}; // @[SimpleHellaCacheIF.scala 62:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305073.4]
  assign _T_44 = reqs_0_tag == _GEN_38; // @[SimpleHellaCacheIF.scala 62:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305073.4]
  assign _T_45 = reqs_1_tag == _GEN_38; // @[SimpleHellaCacheIF.scala 62:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305074.4]
  assign _T_46 = {_T_45,_T_44}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305075.4]
  assign nack_onehot = _T_46 & inflight; // @[SimpleHellaCacheIF.scala 62:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305076.4]
  assign _T_47 = reqs_0_tag == io_resp_bits_tag; // @[SimpleHellaCacheIF.scala 63:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305077.4]
  assign _T_48 = reqs_1_tag == io_resp_bits_tag; // @[SimpleHellaCacheIF.scala 63:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305078.4]
  assign _T_49 = {_T_48,_T_47}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305079.4]
  assign resp_onehot = _T_49 & inflight; // @[SimpleHellaCacheIF.scala 63:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305080.4]
  assign _T_50 = io_resp_valid & replaying; // @[SimpleHellaCacheIF.scala 65:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305081.4]
  assign _T_51 = io_resp_bits_tag == _GEN_7; // @[SimpleHellaCacheIF.scala 65:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305082.4]
  assign replay_complete = _T_50 & _T_51; // @[SimpleHellaCacheIF.scala 65:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305083.4]
  assign _T_52 = io_nack_valid & nackq_io_deq_valid; // @[SimpleHellaCacheIF.scala 66:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305084.4]
  assign _T_53 = _GEN_38 == _GEN_7; // @[SimpleHellaCacheIF.scala 66:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305085.4]
  assign nack_head = _T_52 & _T_53; // @[SimpleHellaCacheIF.scala 66:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305086.4]
  assign _T_54 = nack_head == 1'h0; // @[SimpleHellaCacheIF.scala 70:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305087.4]
  assign _T_57 = nackq_io_enq_valid == 1'h0; // @[SimpleHellaCacheIF.scala 72:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305092.4]
  assign _T_58 = _T_57 | nackq_io_enq_ready; // @[SimpleHellaCacheIF.scala 72:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305093.4]
  assign _T_60 = _T_58 | reset; // @[SimpleHellaCacheIF.scala 72:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305095.4]
  assign _T_61 = _T_60 == 1'h0; // @[SimpleHellaCacheIF.scala 72:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305096.4]
  assign _T_62 = nackq_io_deq_ready == 1'h0; // @[SimpleHellaCacheIF.scala 77:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305102.4]
  assign _T_63 = _T_62 | nackq_io_deq_valid; // @[SimpleHellaCacheIF.scala 77:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305103.4]
  assign _T_65 = _T_63 | reset; // @[SimpleHellaCacheIF.scala 77:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305105.4]
  assign _T_66 = _T_65 == 1'h0; // @[SimpleHellaCacheIF.scala 77:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305106.4]
  assign _T_67 = io_req_ready & io_req_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305111.4]
  assign _T_68 = _T_67 ? next_inflight_onehot : 2'h0; // @[SimpleHellaCacheIF.scala 82:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305112.4]
  assign _T_69 = inflight | _T_68; // @[SimpleHellaCacheIF.scala 82:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305113.4]
  assign _T_70 = io_resp_valid ? resp_onehot : 2'h0; // @[SimpleHellaCacheIF.scala 83:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305114.4]
  assign _T_71 = ~ _T_70; // @[SimpleHellaCacheIF.scala 83:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305115.4]
  assign _T_72 = _T_69 & _T_71; // @[SimpleHellaCacheIF.scala 82:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305116.4]
  assign _T_75 = io_replay_ready & io_replay_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305122.4]
  assign _T_76 = nack_head | replay_complete; // @[SimpleHellaCacheIF.scala 91:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305126.4]
  assign io_req_ready = _T_41 & _T_42; // @[SimpleHellaCacheIF.scala 59:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305072.4]
  assign io_replay_valid = nackq_io_deq_valid & _T_35; // @[SimpleHellaCacheIF.scala 55:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305063.4]
  assign io_replay_bits_addr = nackq_io_deq_bits ? reqs_1_addr : reqs_0_addr; // @[SimpleHellaCacheIF.scala 56:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305064.4]
  assign io_replay_bits_tag = nackq_io_deq_bits ? reqs_1_tag : reqs_0_tag; // @[SimpleHellaCacheIF.scala 56:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305064.4]
  assign io_replay_bits_cmd = nackq_io_deq_bits ? reqs_1_cmd : reqs_0_cmd; // @[SimpleHellaCacheIF.scala 56:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305064.4]
  assign io_replay_bits_typ = nackq_io_deq_bits ? reqs_1_typ : reqs_0_typ; // @[SimpleHellaCacheIF.scala 56:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305064.4]
  assign io_replay_bits_phys = nackq_io_deq_bits ? reqs_1_phys : reqs_0_phys; // @[SimpleHellaCacheIF.scala 56:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305064.4]
  assign io_replay_bits_data = nackq_io_deq_bits ? reqs_1_data : reqs_0_data; // @[SimpleHellaCacheIF.scala 56:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305064.4]
  assign nackq_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305051.4]
  assign nackq_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305052.4]
  assign nackq_io_enq_valid = io_nack_valid & _T_54; // @[SimpleHellaCacheIF.scala 70:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305089.4]
  assign nackq_io_enq_bits = nack_onehot[1]; // @[SimpleHellaCacheIF.scala 71:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305091.4]
  assign nackq_io_deq_ready = _T_50 & _T_51; // @[SimpleHellaCacheIF.scala 76:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305101.4]
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
  inflight = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  reqs_0_addr = _RAND_1[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  reqs_0_tag = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  reqs_0_cmd = _RAND_3[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  reqs_0_typ = _RAND_4[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  reqs_0_phys = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  reqs_0_data = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  reqs_1_addr = _RAND_7[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  reqs_1_tag = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  reqs_1_cmd = _RAND_9[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  reqs_1_typ = _RAND_10[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  reqs_1_phys = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {2{`RANDOM}};
  reqs_1_data = _RAND_12[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  replaying = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      inflight <= 2'h0;
    end else begin
      inflight <= _T_72;
    end
    if (_T_67) begin
      if (1'h0 == next_inflight) begin
        reqs_0_addr <= io_req_bits_addr;
      end
    end
    if (_T_67) begin
      if (1'h0 == next_inflight) begin
        reqs_0_tag <= io_req_bits_tag;
      end
    end
    if (_T_67) begin
      if (1'h0 == next_inflight) begin
        reqs_0_cmd <= io_req_bits_cmd;
      end
    end
    if (_T_67) begin
      if (1'h0 == next_inflight) begin
        reqs_0_typ <= io_req_bits_typ;
      end
    end
    if (_T_67) begin
      if (1'h0 == next_inflight) begin
        reqs_0_phys <= io_req_bits_phys;
      end
    end
    if (_T_67) begin
      if (1'h0 == next_inflight) begin
        reqs_0_data <= io_req_bits_data;
      end
    end
    if (_T_67) begin
      if (next_inflight) begin
        reqs_1_addr <= io_req_bits_addr;
      end
    end
    if (_T_67) begin
      if (next_inflight) begin
        reqs_1_tag <= io_req_bits_tag;
      end
    end
    if (_T_67) begin
      if (next_inflight) begin
        reqs_1_cmd <= io_req_bits_cmd;
      end
    end
    if (_T_67) begin
      if (next_inflight) begin
        reqs_1_typ <= io_req_bits_typ;
      end
    end
    if (_T_67) begin
      if (next_inflight) begin
        reqs_1_phys <= io_req_bits_phys;
      end
    end
    if (_T_67) begin
      if (next_inflight) begin
        reqs_1_data <= io_req_bits_data;
      end
    end
    if (reset) begin
      replaying <= 1'h0;
    end else begin
      if (_T_76) begin
        replaying <= 1'h0;
      end else begin
        if (_T_75) begin
          replaying <= 1'h1;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_61) begin
          $fwrite(32'h80000002,"Assertion failed: SimpleHellaCacheIF: ReplayQueue nack queue overflow\n    at SimpleHellaCacheIF.scala:72 assert(!nackq.io.enq.valid || nackq.io.enq.ready,\n"); // @[SimpleHellaCacheIF.scala 72:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305098.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_61) begin
          $fatal; // @[SimpleHellaCacheIF.scala 72:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305099.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_66) begin
          $fwrite(32'h80000002,"Assertion failed: SimpleHellaCacheIF: ReplayQueue nack queue underflow\n    at SimpleHellaCacheIF.scala:77 assert(!nackq.io.deq.ready || nackq.io.deq.valid,\n"); // @[SimpleHellaCacheIF.scala 77:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305108.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_66) begin
          $fatal; // @[SimpleHellaCacheIF.scala 77:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305109.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule