module IBuf( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306418.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306419.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306420.4]
  output        io_imem_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  input         io_imem_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  input         io_imem_bits_btb_taken, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  input         io_imem_bits_btb_bridx, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  input  [4:0]  io_imem_bits_btb_entry, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  input  [7:0]  io_imem_bits_btb_bht_history, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  input  [39:0] io_imem_bits_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  input  [31:0] io_imem_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  input         io_imem_bits_xcpt_pf_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  input         io_imem_bits_xcpt_ae_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  input         io_imem_bits_replay, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  input         io_kill, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output [39:0] io_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output [4:0]  io_btb_resp_entry, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output [7:0]  io_btb_resp_bht_history, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  input         io_inst_0_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output        io_inst_0_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output        io_inst_0_bits_xcpt0_pf_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output        io_inst_0_bits_xcpt0_ae_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output        io_inst_0_bits_xcpt1_pf_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output        io_inst_0_bits_xcpt1_ae_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output        io_inst_0_bits_replay, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output        io_inst_0_bits_rvc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output [31:0] io_inst_0_bits_inst_bits, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output [4:0]  io_inst_0_bits_inst_rd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output [4:0]  io_inst_0_bits_inst_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output [4:0]  io_inst_0_bits_inst_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output [4:0]  io_inst_0_bits_inst_rs3, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
  output [31:0] io_inst_0_bits_raw // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306421.4]
);
  wire [31:0] RVCExpander_io_in; // @[IBuf.scala 86:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306557.4]
  wire [31:0] RVCExpander_io_out_bits; // @[IBuf.scala 86:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306557.4]
  wire [4:0] RVCExpander_io_out_rd; // @[IBuf.scala 86:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306557.4]
  wire [4:0] RVCExpander_io_out_rs1; // @[IBuf.scala 86:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306557.4]
  wire [4:0] RVCExpander_io_out_rs2; // @[IBuf.scala 86:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306557.4]
  wire [4:0] RVCExpander_io_out_rs3; // @[IBuf.scala 86:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306557.4]
  wire  RVCExpander_io_rvc; // @[IBuf.scala 86:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306557.4]
  reg  nBufValid; // @[IBuf.scala 34:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306426.4]
  reg [31:0] _RAND_0;
  reg [39:0] buf__pc; // @[IBuf.scala 35:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306427.4]
  reg [63:0] _RAND_1;
  reg [31:0] buf__data; // @[IBuf.scala 35:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306427.4]
  reg [31:0] _RAND_2;
  reg  buf__xcpt_pf_inst; // @[IBuf.scala 35:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306427.4]
  reg [31:0] _RAND_3;
  reg  buf__xcpt_ae_inst; // @[IBuf.scala 35:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306427.4]
  reg [31:0] _RAND_4;
  reg  buf__replay; // @[IBuf.scala 35:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306427.4]
  reg [31:0] _RAND_5;
  reg [4:0] ibufBTBResp_entry; // @[IBuf.scala 36:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306428.4]
  reg [31:0] _RAND_6;
  reg [7:0] ibufBTBResp_bht_history; // @[IBuf.scala 36:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306428.4]
  reg [31:0] _RAND_7;
  wire  pcWordBits; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306429.4]
  wire [1:0] _T_25; // @[IBuf.scala 41:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306433.4]
  wire [1:0] _T_26; // @[IBuf.scala 41:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306434.4]
  wire [1:0] _GEN_56; // @[IBuf.scala 41:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306435.4]
  wire [2:0] _T_27; // @[IBuf.scala 41:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306435.4]
  wire [2:0] _T_28; // @[IBuf.scala 41:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306436.4]
  wire [1:0] nIC; // @[IBuf.scala 41:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306437.4]
  wire [1:0] _T_31; // @[IBuf.scala 43:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306441.4]
  wire [1:0] _GEN_57; // @[IBuf.scala 43:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306442.4]
  wire [1:0] nValid; // @[IBuf.scala 43:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306443.4]
  wire [3:0] _T_94; // @[OneHot.scala 45:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306523.4]
  wire [4:0] _T_95; // @[IBuf.scala 74:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306524.4]
  wire [4:0] _T_96; // @[IBuf.scala 74:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306525.4]
  wire [3:0] _T_97; // @[IBuf.scala 74:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306526.4]
  wire [1:0] valid; // @[IBuf.scala 74:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306527.4]
  wire [1:0] _T_127; // @[IBuf.scala 93:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306575.4]
  wire  _T_128; // @[IBuf.scala 93:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306576.4]
  wire  _T_129; // @[IBuf.scala 93:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306577.4]
  wire [1:0] _T_98; // @[OneHot.scala 45:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306528.4]
  wire [2:0] _T_99; // @[IBuf.scala 75:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306529.4]
  wire [2:0] _T_100; // @[IBuf.scala 75:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306530.4]
  wire [1:0] bufMask; // @[IBuf.scala 75:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306531.4]
  wire [1:0] buf_replay; // @[IBuf.scala 77:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306536.4]
  wire [1:0] _T_130; // @[IBuf.scala 93:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306578.4]
  wire  _T_131; // @[IBuf.scala 93:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306579.4]
  wire  _T_132; // @[IBuf.scala 93:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306580.4]
  wire [1:0] _T_165; // @[IBuf.scala 102:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306624.6]
  wire [1:0] nReady; // @[IBuf.scala 102:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306619.4]
  wire [2:0] _T_29; // @[IBuf.scala 42:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306438.4]
  wire [2:0] _T_30; // @[IBuf.scala 42:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306439.4]
  wire [1:0] nICReady; // @[IBuf.scala 42:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306440.4]
  wire  _T_33; // @[IBuf.scala 44:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306444.4]
  wire  _T_34; // @[IBuf.scala 44:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306445.4]
  wire  _T_35; // @[IBuf.scala 44:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306446.4]
  wire [2:0] _T_36; // @[IBuf.scala 44:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306447.4]
  wire [2:0] _T_37; // @[IBuf.scala 44:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306448.4]
  wire [1:0] _T_38; // @[IBuf.scala 44:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306449.4]
  wire  _T_39; // @[IBuf.scala 44:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306450.4]
  wire  _T_40; // @[IBuf.scala 44:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306451.4]
  wire [2:0] _T_43; // @[IBuf.scala 48:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306456.6]
  wire [2:0] _T_44; // @[IBuf.scala 48:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306457.6]
  wire [1:0] _T_45; // @[IBuf.scala 48:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306458.6]
  wire [1:0] _T_46; // @[IBuf.scala 48:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306459.6]
  wire  _T_48; // @[IBuf.scala 54:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306462.6]
  wire  _T_49; // @[IBuf.scala 54:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306463.6]
  wire  _T_50; // @[IBuf.scala 54:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306464.6]
  wire  _T_55; // @[IBuf.scala 54:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306469.6]
  wire [1:0] _T_57; // @[IBuf.scala 55:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306472.8]
  wire [15:0] _T_61; // @[IBuf.scala 127:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306478.8]
  wire [31:0] _T_62; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306479.8]
  wire [63:0] _T_63; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306480.8]
  wire [5:0] _GEN_64; // @[IBuf.scala 128:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306481.8]
  wire [5:0] _T_64; // @[IBuf.scala 128:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306481.8]
  wire [63:0] _T_65; // @[IBuf.scala 128:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306482.8]
  wire [15:0] _T_66; // @[IBuf.scala 58:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306483.8]
  wire [39:0] _T_68; // @[IBuf.scala 59:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306486.8]
  wire [2:0] _GEN_65; // @[IBuf.scala 59:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306487.8]
  wire [2:0] _T_69; // @[IBuf.scala 59:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306487.8]
  wire [39:0] _GEN_66; // @[IBuf.scala 59:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306488.8]
  wire [39:0] _T_71; // @[IBuf.scala 59:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306489.8]
  wire [39:0] _T_72; // @[IBuf.scala 59:109:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306490.8]
  wire [39:0] _T_73; // @[IBuf.scala 59:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306491.8]
  wire [1:0] _GEN_0; // @[IBuf.scala 54:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306470.6]
  wire [1:0] _GEN_23; // @[IBuf.scala 47:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306454.4]
  wire [1:0] _GEN_46; // @[IBuf.scala 63:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306496.4]
  wire [1:0] _T_75; // @[IBuf.scala 68:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306500.4]
  wire [2:0] _T_76; // @[IBuf.scala 68:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306501.4]
  wire [2:0] _T_77; // @[IBuf.scala 68:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306502.4]
  wire [1:0] icShiftAmt; // @[IBuf.scala 68:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306503.4]
  wire [15:0] _T_79; // @[IBuf.scala 69:87:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306505.4]
  wire [31:0] _T_80; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306506.4]
  wire [63:0] _T_81; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306507.4]
  wire [15:0] _T_82; // @[IBuf.scala 120:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306508.4]
  wire [31:0] _T_83; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306509.4]
  wire [63:0] _T_84; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306510.4]
  wire [127:0] _T_85; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306511.4]
  wire [5:0] _GEN_69; // @[IBuf.scala 121:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306512.4]
  wire [5:0] _T_86; // @[IBuf.scala 121:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306512.4]
  wire [190:0] _GEN_70; // @[IBuf.scala 121:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306513.4]
  wire [190:0] _T_87; // @[IBuf.scala 121:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306513.4]
  wire [31:0] icData; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306514.4]
  wire [4:0] _GEN_71; // @[IBuf.scala 71:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306516.4]
  wire [4:0] _T_89; // @[IBuf.scala 71:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306516.4]
  wire [62:0] _T_90; // @[IBuf.scala 71:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306517.4]
  wire [31:0] icMask; // @[IBuf.scala 71:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306518.4]
  wire [31:0] _T_91; // @[IBuf.scala 72:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306519.4]
  wire [31:0] _T_92; // @[IBuf.scala 72:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306520.4]
  wire [31:0] _T_93; // @[IBuf.scala 72:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306521.4]
  wire  _T_101; // @[IBuf.scala 76:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306532.4]
  wire  _T_102; // @[IBuf.scala 76:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306534.4]
  wire  xcpt_1_pf_inst; // @[IBuf.scala 76:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306535.4]
  wire  xcpt_1_ae_inst; // @[IBuf.scala 76:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306535.4]
  wire [1:0] _T_103; // @[IBuf.scala 78:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306537.4]
  wire [1:0] _T_104; // @[IBuf.scala 78:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306538.4]
  wire [1:0] _T_105; // @[IBuf.scala 78:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306539.4]
  wire [1:0] ic_replay; // @[IBuf.scala 78:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306540.4]
  wire  _T_106; // @[IBuf.scala 79:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306541.4]
  wire  _T_107; // @[IBuf.scala 79:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306542.4]
  wire  _T_108; // @[IBuf.scala 79:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306543.4]
  wire  _T_109; // @[IBuf.scala 79:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306544.4]
  wire  _T_110; // @[IBuf.scala 79:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306545.4]
  wire  _T_112; // @[IBuf.scala 79:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306547.4]
  wire  _T_113; // @[IBuf.scala 79:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306548.4]
  wire  _T_114; // @[IBuf.scala 82:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306554.4]
  wire [1:0] _T_116; // @[IBuf.scala 92:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306564.4]
  wire  _T_117; // @[IBuf.scala 92:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306565.4]
  wire  _T_118; // @[IBuf.scala 92:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306566.4]
  wire [1:0] _T_121; // @[IBuf.scala 92:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306569.4]
  wire  _T_122; // @[IBuf.scala 92:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306570.4]
  wire  _T_123; // @[IBuf.scala 92:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306571.4]
  wire [1:0] _T_133; // @[IBuf.scala 94:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306581.4]
  wire  _T_134; // @[IBuf.scala 94:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306582.4]
  wire [1:0] _T_142; // @[IBuf.scala 96:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306592.4]
  wire [1:0] _T_143; // @[IBuf.scala 96:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306593.4]
  wire [1:0] _T_151; // @[IBuf.scala 100:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306606.4]
  wire  _T_152; // @[IBuf.scala 100:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306607.4]
  wire  _T_153; // @[IBuf.scala 100:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306608.4]
  wire [1:0] _T_156; // @[IBuf.scala 100:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306611.4]
  wire  _T_157; // @[IBuf.scala 100:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306612.4]
  wire  _T_158; // @[IBuf.scala 100:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306613.4]
  RVCExpander RVCExpander ( // @[IBuf.scala 86:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306557.4]
    .io_in(RVCExpander_io_in),
    .io_out_bits(RVCExpander_io_out_bits),
    .io_out_rd(RVCExpander_io_out_rd),
    .io_out_rs1(RVCExpander_io_out_rs1),
    .io_out_rs2(RVCExpander_io_out_rs2),
    .io_out_rs3(RVCExpander_io_out_rs3),
    .io_rvc(RVCExpander_io_rvc)
  );
  assign pcWordBits = io_imem_bits_pc[1]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306429.4]
  assign _T_25 = io_imem_bits_btb_bridx + 1'h1; // @[IBuf.scala 41:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306433.4]
  assign _T_26 = io_imem_bits_btb_taken ? _T_25 : 2'h2; // @[IBuf.scala 41:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306434.4]
  assign _GEN_56 = {{1'd0}, pcWordBits}; // @[IBuf.scala 41:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306435.4]
  assign _T_27 = _T_26 - _GEN_56; // @[IBuf.scala 41:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306435.4]
  assign _T_28 = $unsigned(_T_27); // @[IBuf.scala 41:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306436.4]
  assign nIC = _T_28[1:0]; // @[IBuf.scala 41:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306437.4]
  assign _T_31 = io_imem_valid ? nIC : 2'h0; // @[IBuf.scala 43:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306441.4]
  assign _GEN_57 = {{1'd0}, nBufValid}; // @[IBuf.scala 43:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306442.4]
  assign nValid = _T_31 + _GEN_57; // @[IBuf.scala 43:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306443.4]
  assign _T_94 = 4'h1 << nValid; // @[OneHot.scala 45:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306523.4]
  assign _T_95 = _T_94 - 4'h1; // @[IBuf.scala 74:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306524.4]
  assign _T_96 = $unsigned(_T_95); // @[IBuf.scala 74:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306525.4]
  assign _T_97 = _T_96[3:0]; // @[IBuf.scala 74:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306526.4]
  assign valid = _T_97[1:0]; // @[IBuf.scala 74:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306527.4]
  assign _T_127 = valid >> 1'h1; // @[IBuf.scala 93:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306575.4]
  assign _T_128 = _T_127[0]; // @[IBuf.scala 93:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306576.4]
  assign _T_129 = RVCExpander_io_rvc | _T_128; // @[IBuf.scala 93:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306577.4]
  assign _T_98 = 2'h1 << nBufValid; // @[OneHot.scala 45:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306528.4]
  assign _T_99 = _T_98 - 2'h1; // @[IBuf.scala 75:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306529.4]
  assign _T_100 = $unsigned(_T_99); // @[IBuf.scala 75:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306530.4]
  assign bufMask = _T_100[1:0]; // @[IBuf.scala 75:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306531.4]
  assign buf_replay = buf__replay ? bufMask : 2'h0; // @[IBuf.scala 77:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306536.4]
  assign _T_130 = buf_replay >> 1'h0; // @[IBuf.scala 93:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306578.4]
  assign _T_131 = _T_130[0]; // @[IBuf.scala 93:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306579.4]
  assign _T_132 = _T_129 | _T_131; // @[IBuf.scala 93:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306580.4]
  assign _T_165 = RVCExpander_io_rvc ? 2'h1 : 2'h2; // @[IBuf.scala 102:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306624.6]
  assign nReady = _T_132 ? _T_165 : 2'h0; // @[IBuf.scala 102:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306619.4]
  assign _T_29 = nReady - _GEN_57; // @[IBuf.scala 42:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306438.4]
  assign _T_30 = $unsigned(_T_29); // @[IBuf.scala 42:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306439.4]
  assign nICReady = _T_30[1:0]; // @[IBuf.scala 42:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306440.4]
  assign _T_33 = nReady >= _GEN_57; // @[IBuf.scala 44:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306444.4]
  assign _T_34 = io_inst_0_ready & _T_33; // @[IBuf.scala 44:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306445.4]
  assign _T_35 = nICReady >= nIC; // @[IBuf.scala 44:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306446.4]
  assign _T_36 = nIC - nICReady; // @[IBuf.scala 44:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306447.4]
  assign _T_37 = $unsigned(_T_36); // @[IBuf.scala 44:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306448.4]
  assign _T_38 = _T_37[1:0]; // @[IBuf.scala 44:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306449.4]
  assign _T_39 = 2'h1 >= _T_38; // @[IBuf.scala 44:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306450.4]
  assign _T_40 = _T_35 | _T_39; // @[IBuf.scala 44:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306451.4]
  assign _T_43 = _GEN_57 - nReady; // @[IBuf.scala 48:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306456.6]
  assign _T_44 = $unsigned(_T_43); // @[IBuf.scala 48:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306457.6]
  assign _T_45 = _T_44[1:0]; // @[IBuf.scala 48:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306458.6]
  assign _T_46 = _T_33 ? 2'h0 : _T_45; // @[IBuf.scala 48:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306459.6]
  assign _T_48 = io_imem_valid & _T_33; // @[IBuf.scala 54:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306462.6]
  assign _T_49 = nICReady < nIC; // @[IBuf.scala 54:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306463.6]
  assign _T_50 = _T_48 & _T_49; // @[IBuf.scala 54:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306464.6]
  assign _T_55 = _T_50 & _T_39; // @[IBuf.scala 54:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306469.6]
  assign _T_57 = _GEN_56 + nICReady; // @[IBuf.scala 55:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306472.8]
  assign _T_61 = io_imem_bits_data[31:16]; // @[IBuf.scala 127:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306478.8]
  assign _T_62 = {_T_61,_T_61}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306479.8]
  assign _T_63 = {_T_62,io_imem_bits_data}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306480.8]
  assign _GEN_64 = {{4'd0}, _T_57}; // @[IBuf.scala 128:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306481.8]
  assign _T_64 = _GEN_64 << 4; // @[IBuf.scala 128:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306481.8]
  assign _T_65 = _T_63 >> _T_64; // @[IBuf.scala 128:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306482.8]
  assign _T_66 = _T_65[15:0]; // @[IBuf.scala 58:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306483.8]
  assign _T_68 = io_imem_bits_pc & 40'hfffffffffc; // @[IBuf.scala 59:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306486.8]
  assign _GEN_65 = {{1'd0}, nICReady}; // @[IBuf.scala 59:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306487.8]
  assign _T_69 = _GEN_65 << 1; // @[IBuf.scala 59:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306487.8]
  assign _GEN_66 = {{37'd0}, _T_69}; // @[IBuf.scala 59:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306488.8]
  assign _T_71 = io_imem_bits_pc + _GEN_66; // @[IBuf.scala 59:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306489.8]
  assign _T_72 = _T_71 & 40'h3; // @[IBuf.scala 59:109:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306490.8]
  assign _T_73 = _T_68 | _T_72; // @[IBuf.scala 59:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306491.8]
  assign _GEN_0 = _T_55 ? _T_38 : _T_46; // @[IBuf.scala 54:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306470.6]
  assign _GEN_23 = io_inst_0_ready ? _GEN_0 : {{1'd0}, nBufValid}; // @[IBuf.scala 47:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306454.4]
  assign _GEN_46 = io_kill ? 2'h0 : _GEN_23; // @[IBuf.scala 63:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306496.4]
  assign _T_75 = 2'h2 + _GEN_57; // @[IBuf.scala 68:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306500.4]
  assign _T_76 = _T_75 - _GEN_56; // @[IBuf.scala 68:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306501.4]
  assign _T_77 = $unsigned(_T_76); // @[IBuf.scala 68:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306502.4]
  assign icShiftAmt = _T_77[1:0]; // @[IBuf.scala 68:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306503.4]
  assign _T_79 = io_imem_bits_data[15:0]; // @[IBuf.scala 69:87:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306505.4]
  assign _T_80 = {_T_79,_T_79}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306506.4]
  assign _T_81 = {io_imem_bits_data,_T_80}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306507.4]
  assign _T_82 = _T_81[63:48]; // @[IBuf.scala 120:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306508.4]
  assign _T_83 = {_T_82,_T_82}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306509.4]
  assign _T_84 = {_T_83,_T_83}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306510.4]
  assign _T_85 = {_T_84,_T_81}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306511.4]
  assign _GEN_69 = {{4'd0}, icShiftAmt}; // @[IBuf.scala 121:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306512.4]
  assign _T_86 = _GEN_69 << 4; // @[IBuf.scala 121:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306512.4]
  assign _GEN_70 = {{63'd0}, _T_85}; // @[IBuf.scala 121:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306513.4]
  assign _T_87 = _GEN_70 << _T_86; // @[IBuf.scala 121:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306513.4]
  assign icData = _T_87[95:64]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306514.4]
  assign _GEN_71 = {{4'd0}, nBufValid}; // @[IBuf.scala 71:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306516.4]
  assign _T_89 = _GEN_71 << 4; // @[IBuf.scala 71:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306516.4]
  assign _T_90 = 63'hffffffff << _T_89; // @[IBuf.scala 71:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306517.4]
  assign icMask = _T_90[31:0]; // @[IBuf.scala 71:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306518.4]
  assign _T_91 = icData & icMask; // @[IBuf.scala 72:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306519.4]
  assign _T_92 = ~ icMask; // @[IBuf.scala 72:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306520.4]
  assign _T_93 = buf__data & _T_92; // @[IBuf.scala 72:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306521.4]
  assign _T_101 = bufMask[0]; // @[IBuf.scala 76:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306532.4]
  assign _T_102 = bufMask[1]; // @[IBuf.scala 76:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306534.4]
  assign xcpt_1_pf_inst = _T_102 ? buf__xcpt_pf_inst : io_imem_bits_xcpt_pf_inst; // @[IBuf.scala 76:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306535.4]
  assign xcpt_1_ae_inst = _T_102 ? buf__xcpt_ae_inst : io_imem_bits_xcpt_ae_inst; // @[IBuf.scala 76:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306535.4]
  assign _T_103 = ~ bufMask; // @[IBuf.scala 78:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306537.4]
  assign _T_104 = valid & _T_103; // @[IBuf.scala 78:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306538.4]
  assign _T_105 = io_imem_bits_replay ? _T_104 : 2'h0; // @[IBuf.scala 78:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306539.4]
  assign ic_replay = buf_replay | _T_105; // @[IBuf.scala 78:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306540.4]
  assign _T_106 = io_imem_valid == 1'h0; // @[IBuf.scala 79:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306541.4]
  assign _T_107 = io_imem_bits_btb_taken == 1'h0; // @[IBuf.scala 79:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306542.4]
  assign _T_108 = _T_106 | _T_107; // @[IBuf.scala 79:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306543.4]
  assign _T_109 = io_imem_bits_btb_bridx >= pcWordBits; // @[IBuf.scala 79:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306544.4]
  assign _T_110 = _T_108 | _T_109; // @[IBuf.scala 79:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306545.4]
  assign _T_112 = _T_110 | reset; // @[IBuf.scala 79:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306547.4]
  assign _T_113 = _T_112 == 1'h0; // @[IBuf.scala 79:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306548.4]
  assign _T_114 = nBufValid > 1'h0; // @[IBuf.scala 82:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306554.4]
  assign _T_116 = ic_replay >> 1'h0; // @[IBuf.scala 92:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306564.4]
  assign _T_117 = _T_116[0]; // @[IBuf.scala 92:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306565.4]
  assign _T_118 = RVCExpander_io_rvc == 1'h0; // @[IBuf.scala 92:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306566.4]
  assign _T_121 = ic_replay >> 1'h1; // @[IBuf.scala 92:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306569.4]
  assign _T_122 = _T_121[0]; // @[IBuf.scala 92:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306570.4]
  assign _T_123 = _T_118 & _T_122; // @[IBuf.scala 92:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306571.4]
  assign _T_133 = valid >> 1'h0; // @[IBuf.scala 94:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306581.4]
  assign _T_134 = _T_133[0]; // @[IBuf.scala 94:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306582.4]
  assign _T_142 = {xcpt_1_pf_inst,xcpt_1_ae_inst}; // @[IBuf.scala 96:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306592.4]
  assign _T_143 = RVCExpander_io_rvc ? 2'h0 : _T_142; // @[IBuf.scala 96:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306593.4]
  assign _T_151 = bufMask >> 1'h0; // @[IBuf.scala 100:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306606.4]
  assign _T_152 = _T_151[0]; // @[IBuf.scala 100:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306607.4]
  assign _T_153 = _T_152 & RVCExpander_io_rvc; // @[IBuf.scala 100:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306608.4]
  assign _T_156 = bufMask >> 1'h1; // @[IBuf.scala 100:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306611.4]
  assign _T_157 = _T_156[0]; // @[IBuf.scala 100:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306612.4]
  assign _T_158 = _T_153 | _T_157; // @[IBuf.scala 100:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306613.4]
  assign io_imem_ready = _T_34 & _T_40; // @[IBuf.scala 44:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306453.4]
  assign io_pc = _T_114 ? buf__pc : io_imem_bits_pc; // @[IBuf.scala 82:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306556.4]
  assign io_btb_resp_entry = _T_158 ? ibufBTBResp_entry : io_imem_bits_btb_entry; // @[IBuf.scala 81:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306553.4 IBuf.scala 100:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306615.6]
  assign io_btb_resp_bht_history = _T_158 ? ibufBTBResp_bht_history : io_imem_bits_btb_bht_history; // @[IBuf.scala 81:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306553.4 IBuf.scala 100:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306615.6]
  assign io_inst_0_valid = _T_134 & _T_132; // @[IBuf.scala 94:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306584.4]
  assign io_inst_0_bits_xcpt0_pf_inst = _T_101 ? buf__xcpt_pf_inst : io_imem_bits_xcpt_pf_inst; // @[IBuf.scala 95:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306587.4]
  assign io_inst_0_bits_xcpt0_ae_inst = _T_101 ? buf__xcpt_ae_inst : io_imem_bits_xcpt_ae_inst; // @[IBuf.scala 95:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306587.4]
  assign io_inst_0_bits_xcpt1_pf_inst = _T_143[1]; // @[IBuf.scala 96:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306603.4]
  assign io_inst_0_bits_xcpt1_ae_inst = _T_143[0]; // @[IBuf.scala 96:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306603.4]
  assign io_inst_0_bits_replay = _T_117 | _T_123; // @[IBuf.scala 97:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306604.4]
  assign io_inst_0_bits_rvc = RVCExpander_io_rvc; // @[IBuf.scala 98:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306605.4]
  assign io_inst_0_bits_inst_bits = RVCExpander_io_out_bits; // @[IBuf.scala 88:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306562.4]
  assign io_inst_0_bits_inst_rd = RVCExpander_io_out_rd; // @[IBuf.scala 88:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306562.4]
  assign io_inst_0_bits_inst_rs1 = RVCExpander_io_out_rs1; // @[IBuf.scala 88:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306562.4]
  assign io_inst_0_bits_inst_rs2 = RVCExpander_io_out_rs2; // @[IBuf.scala 88:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306562.4]
  assign io_inst_0_bits_inst_rs3 = RVCExpander_io_out_rs3; // @[IBuf.scala 88:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306562.4]
  assign io_inst_0_bits_raw = _T_91 | _T_93; // @[IBuf.scala 89:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306563.4]
  assign RVCExpander_io_in = _T_91 | _T_93; // @[IBuf.scala 87:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306561.4]
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
  nBufValid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  buf__pc = _RAND_1[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  buf__data = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  buf__xcpt_pf_inst = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  buf__xcpt_ae_inst = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  buf__replay = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  ibufBTBResp_entry = _RAND_6[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ibufBTBResp_bht_history = _RAND_7[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      nBufValid <= 1'h0;
    end else begin
      nBufValid <= _GEN_46[0];
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        buf__pc <= _T_73;
      end
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        buf__data <= {{16'd0}, _T_66};
      end
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        buf__xcpt_pf_inst <= io_imem_bits_xcpt_pf_inst;
      end
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        buf__xcpt_ae_inst <= io_imem_bits_xcpt_ae_inst;
      end
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        buf__replay <= io_imem_bits_replay;
      end
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        ibufBTBResp_entry <= io_imem_bits_btb_entry;
      end
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        ibufBTBResp_bht_history <= io_imem_bits_btb_bht_history;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_113) begin
          $fwrite(32'h80000002,"Assertion failed\n    at IBuf.scala:79 assert(!io.imem.valid || !io.imem.bits.btb.taken || io.imem.bits.btb.bridx >= pcWordBits)\n"); // @[IBuf.scala 79:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306550.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_113) begin
          $fatal; // @[IBuf.scala 79:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@306551.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule