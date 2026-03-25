module DivSqrtRecFNToRaw_small( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300435.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300436.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300437.4]
  output        io_inReady, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  input         io_inValid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  input         io_sqrtOp, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  input  [32:0] io_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  input  [32:0] io_b, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  input  [2:0]  io_roundingMode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  output        io_rawOutValid_div, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  output        io_rawOutValid_sqrt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  output [2:0]  io_roundingModeOut, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  output        io_invalidExc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  output        io_infiniteExc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  output        io_rawOut_isNaN, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  output        io_rawOut_isInf, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  output        io_rawOut_isZero, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  output        io_rawOut_sign, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  output [9:0]  io_rawOut_sExp, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
  output [26:0] io_rawOut_sig // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300438.4]
);
  reg [4:0] cycleNum; // @[DivSqrtRecFN_small.scala 73:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300443.4]
  reg [31:0] _RAND_0;
  reg  sqrtOp_Z; // @[DivSqrtRecFN_small.scala 75:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300444.4]
  reg [31:0] _RAND_1;
  reg  majorExc_Z; // @[DivSqrtRecFN_small.scala 76:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300445.4]
  reg [31:0] _RAND_2;
  reg  isNaN_Z; // @[DivSqrtRecFN_small.scala 78:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300446.4]
  reg [31:0] _RAND_3;
  reg  isInf_Z; // @[DivSqrtRecFN_small.scala 79:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300447.4]
  reg [31:0] _RAND_4;
  reg  isZero_Z; // @[DivSqrtRecFN_small.scala 80:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300448.4]
  reg [31:0] _RAND_5;
  reg  sign_Z; // @[DivSqrtRecFN_small.scala 81:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300449.4]
  reg [31:0] _RAND_6;
  reg [9:0] sExp_Z; // @[DivSqrtRecFN_small.scala 82:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300450.4]
  reg [31:0] _RAND_7;
  reg [22:0] fractB_Z; // @[DivSqrtRecFN_small.scala 83:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300451.4]
  reg [31:0] _RAND_8;
  reg [2:0] roundingMode_Z; // @[DivSqrtRecFN_small.scala 84:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300452.4]
  reg [31:0] _RAND_9;
  reg [25:0] rem_Z; // @[DivSqrtRecFN_small.scala 90:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300453.4]
  reg [31:0] _RAND_10;
  reg  notZeroRem_Z; // @[DivSqrtRecFN_small.scala 91:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300454.4]
  reg [31:0] _RAND_11;
  reg [25:0] sigX_Z; // @[DivSqrtRecFN_small.scala 92:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300455.4]
  reg [31:0] _RAND_12;
  wire [8:0] _T_29; // @[rawFloatFromRecFN.scala 50:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300456.4]
  wire [2:0] _T_30; // @[rawFloatFromRecFN.scala 51:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300457.4]
  wire  rawA_S_isZero; // @[rawFloatFromRecFN.scala 51:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300458.4]
  wire [1:0] _T_32; // @[rawFloatFromRecFN.scala 52:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300459.4]
  wire  _T_33; // @[rawFloatFromRecFN.scala 52:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300460.4]
  wire  _T_35; // @[rawFloatFromRecFN.scala 55:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300463.4]
  wire  rawA_S_isNaN; // @[rawFloatFromRecFN.scala 55:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300464.4]
  wire  _T_38; // @[rawFloatFromRecFN.scala 56:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300467.4]
  wire  rawA_S_isInf; // @[rawFloatFromRecFN.scala 56:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300468.4]
  wire  rawA_S_sign; // @[rawFloatFromRecFN.scala 58:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300471.4]
  wire [9:0] rawA_S_sExp; // @[rawFloatFromRecFN.scala 59:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300473.4]
  wire  _T_42; // @[rawFloatFromRecFN.scala 60:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300475.4]
  wire [22:0] _T_43; // @[rawFloatFromRecFN.scala 60:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300476.4]
  wire [1:0] _T_44; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300477.4]
  wire [24:0] rawA_S_sig; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300478.4]
  wire [8:0] _T_46; // @[rawFloatFromRecFN.scala 50:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300480.4]
  wire [2:0] _T_47; // @[rawFloatFromRecFN.scala 51:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300481.4]
  wire  rawB_S_isZero; // @[rawFloatFromRecFN.scala 51:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300482.4]
  wire [1:0] _T_49; // @[rawFloatFromRecFN.scala 52:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300483.4]
  wire  _T_50; // @[rawFloatFromRecFN.scala 52:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300484.4]
  wire  _T_52; // @[rawFloatFromRecFN.scala 55:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300487.4]
  wire  rawB_S_isNaN; // @[rawFloatFromRecFN.scala 55:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300488.4]
  wire  _T_55; // @[rawFloatFromRecFN.scala 56:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300491.4]
  wire  rawB_S_isInf; // @[rawFloatFromRecFN.scala 56:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300492.4]
  wire  rawB_S_sign; // @[rawFloatFromRecFN.scala 58:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300495.4]
  wire [9:0] rawB_S_sExp; // @[rawFloatFromRecFN.scala 59:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300497.4]
  wire  _T_59; // @[rawFloatFromRecFN.scala 60:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300499.4]
  wire [22:0] _T_60; // @[rawFloatFromRecFN.scala 60:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300500.4]
  wire [1:0] _T_61; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300501.4]
  wire [24:0] rawB_S_sig; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300502.4]
  wire  _T_63; // @[DivSqrtRecFN_small.scala 101:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300504.4]
  wire  _T_64; // @[DivSqrtRecFN_small.scala 101:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300505.4]
  wire  notSigNaNIn_invalidExc_S_div; // @[DivSqrtRecFN_small.scala 101:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300506.4]
  wire  _T_65; // @[DivSqrtRecFN_small.scala 103:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300507.4]
  wire  _T_67; // @[DivSqrtRecFN_small.scala 103:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300509.4]
  wire  notSigNaNIn_invalidExc_S_sqrt; // @[DivSqrtRecFN_small.scala 103:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300510.4]
  wire  _T_68; // @[common.scala 81:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300511.4]
  wire  _T_69; // @[common.scala 81:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300512.4]
  wire  _T_70; // @[common.scala 81:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300513.4]
  wire  _T_71; // @[DivSqrtRecFN_small.scala 106:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300514.4]
  wire  _T_75; // @[common.scala 81:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300518.4]
  wire  _T_76; // @[common.scala 81:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300519.4]
  wire  _T_77; // @[common.scala 81:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300520.4]
  wire  _T_78; // @[DivSqrtRecFN_small.scala 107:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300521.4]
  wire  _T_79; // @[DivSqrtRecFN_small.scala 107:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300522.4]
  wire  _T_81; // @[DivSqrtRecFN_small.scala 109:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300524.4]
  wire  _T_82; // @[DivSqrtRecFN_small.scala 109:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300525.4]
  wire  _T_83; // @[DivSqrtRecFN_small.scala 109:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300526.4]
  wire  _T_84; // @[DivSqrtRecFN_small.scala 108:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300527.4]
  wire  _T_85; // @[DivSqrtRecFN_small.scala 113:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300529.4]
  wire  _T_86; // @[DivSqrtRecFN_small.scala 114:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300530.4]
  wire  _T_87; // @[DivSqrtRecFN_small.scala 114:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300531.4]
  wire  _T_88; // @[DivSqrtRecFN_small.scala 116:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300533.4]
  wire  _T_89; // @[DivSqrtRecFN_small.scala 117:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300535.4]
  wire  _T_90; // @[DivSqrtRecFN_small.scala 118:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300537.4]
  wire  _T_91; // @[DivSqrtRecFN_small.scala 118:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300538.4]
  wire  sign_S; // @[DivSqrtRecFN_small.scala 118:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300539.4]
  wire  _T_92; // @[DivSqrtRecFN_small.scala 120:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300540.4]
  wire  specialCaseA_S; // @[DivSqrtRecFN_small.scala 120:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300541.4]
  wire  _T_93; // @[DivSqrtRecFN_small.scala 121:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300542.4]
  wire  specialCaseB_S; // @[DivSqrtRecFN_small.scala 121:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300543.4]
  wire  _T_94; // @[DivSqrtRecFN_small.scala 122:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300544.4]
  wire  _T_95; // @[DivSqrtRecFN_small.scala 122:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300545.4]
  wire  normalCase_S_div; // @[DivSqrtRecFN_small.scala 122:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300546.4]
  wire  _T_97; // @[DivSqrtRecFN_small.scala 123:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300548.4]
  wire  normalCase_S_sqrt; // @[DivSqrtRecFN_small.scala 123:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300549.4]
  wire  normalCase_S; // @[DivSqrtRecFN_small.scala 124:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300550.4]
  wire  _T_98; // @[DivSqrtRecFN_small.scala 128:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300551.4]
  wire [7:0] _T_99; // @[DivSqrtRecFN_small.scala 128:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300552.4]
  wire [7:0] _T_100; // @[DivSqrtRecFN_small.scala 128:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300553.4]
  wire [8:0] _T_101; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300554.4]
  wire [8:0] _T_102; // @[DivSqrtRecFN_small.scala 128:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300555.4]
  wire [9:0] _GEN_13; // @[DivSqrtRecFN_small.scala 127:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300556.4]
  wire [10:0] sExpQuot_S_div; // @[DivSqrtRecFN_small.scala 127:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300556.4]
  wire  _T_103; // @[DivSqrtRecFN_small.scala 131:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300557.4]
  wire [3:0] _T_104; // @[DivSqrtRecFN_small.scala 133:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300558.4]
  wire [3:0] _T_105; // @[DivSqrtRecFN_small.scala 131:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300559.4]
  wire [5:0] _T_106; // @[DivSqrtRecFN_small.scala 135:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300560.4]
  wire [9:0] _T_107; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300561.4]
  wire [9:0] sSatExpQuot_S_div; // @[DivSqrtRecFN_small.scala 136:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300562.4]
  wire  _T_108; // @[DivSqrtRecFN_small.scala 138:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300563.4]
  wire  _T_109; // @[DivSqrtRecFN_small.scala 138:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300564.4]
  wire  evenSqrt_S; // @[DivSqrtRecFN_small.scala 138:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300565.4]
  wire  oddSqrt_S; // @[DivSqrtRecFN_small.scala 139:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300567.4]
  wire  idle; // @[DivSqrtRecFN_small.scala 143:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300568.4]
  wire  inReady; // @[DivSqrtRecFN_small.scala 144:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300569.4]
  wire  entering; // @[DivSqrtRecFN_small.scala 145:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300570.4]
  wire  entering_normalCase; // @[DivSqrtRecFN_small.scala 146:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300571.4]
  wire  _T_111; // @[DivSqrtRecFN_small.scala 148:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300572.4]
  wire  _T_112; // @[DivSqrtRecFN_small.scala 148:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300573.4]
  wire  skipCycle2; // @[DivSqrtRecFN_small.scala 148:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300574.4]
  wire  _T_113; // @[DivSqrtRecFN_small.scala 150:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300575.4]
  wire  _T_114; // @[DivSqrtRecFN_small.scala 150:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300576.4]
  wire  _T_115; // @[DivSqrtRecFN_small.scala 152:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300578.6]
  wire  _T_116; // @[DivSqrtRecFN_small.scala 152:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300579.6]
  wire [4:0] _T_119; // @[DivSqrtRecFN_small.scala 155:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300582.6]
  wire [4:0] _T_120; // @[DivSqrtRecFN_small.scala 154:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300583.6]
  wire [4:0] _T_121; // @[DivSqrtRecFN_small.scala 153:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300584.6]
  wire [4:0] _GEN_14; // @[DivSqrtRecFN_small.scala 152:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300585.6]
  wire [4:0] _T_122; // @[DivSqrtRecFN_small.scala 152:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300585.6]
  wire  _T_124; // @[DivSqrtRecFN_small.scala 160:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300587.6]
  wire  _T_125; // @[DivSqrtRecFN_small.scala 160:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300588.6]
  wire [5:0] _T_126; // @[DivSqrtRecFN_small.scala 160:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300589.6]
  wire [5:0] _T_127; // @[DivSqrtRecFN_small.scala 160:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300590.6]
  wire [4:0] _T_128; // @[DivSqrtRecFN_small.scala 160:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300591.6]
  wire [4:0] _T_129; // @[DivSqrtRecFN_small.scala 160:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300592.6]
  wire [4:0] _T_130; // @[DivSqrtRecFN_small.scala 159:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300593.6]
  wire  _T_132; // @[DivSqrtRecFN_small.scala 161:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300595.6]
  wire [4:0] _GEN_15; // @[DivSqrtRecFN_small.scala 160:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300597.6]
  wire [4:0] _T_134; // @[DivSqrtRecFN_small.scala 160:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300597.6]
  wire [8:0] _T_135; // @[DivSqrtRecFN_small.scala 179:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300610.6]
  wire [9:0] _T_136; // @[DivSqrtRecFN_small.scala 179:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300611.6]
  wire  _T_139; // @[DivSqrtRecFN_small.scala 184:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300617.4]
  wire [22:0] _T_140; // @[DivSqrtRecFN_small.scala 185:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300619.6]
  wire  _T_141; // @[DivSqrtRecFN_small.scala 191:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300622.4]
  wire  _T_142; // @[DivSqrtRecFN_small.scala 191:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300623.4]
  wire [25:0] _GEN_16; // @[DivSqrtRecFN_small.scala 191:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300624.4]
  wire [25:0] _T_143; // @[DivSqrtRecFN_small.scala 191:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300624.4]
  wire [25:0] _T_144; // @[DivSqrtRecFN_small.scala 191:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300625.4]
  wire  _T_145; // @[DivSqrtRecFN_small.scala 192:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300626.4]
  wire [1:0] _T_146; // @[DivSqrtRecFN_small.scala 193:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300627.4]
  wire [2:0] _T_147; // @[DivSqrtRecFN_small.scala 193:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300628.4]
  wire [2:0] _T_148; // @[DivSqrtRecFN_small.scala 193:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300629.4]
  wire [1:0] _T_149; // @[DivSqrtRecFN_small.scala 193:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300630.4]
  wire [21:0] _T_150; // @[DivSqrtRecFN_small.scala 194:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300631.4]
  wire [24:0] _GEN_17; // @[DivSqrtRecFN_small.scala 194:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300632.4]
  wire [24:0] _T_151; // @[DivSqrtRecFN_small.scala 194:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300632.4]
  wire [26:0] _T_152; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300633.4]
  wire [26:0] _T_153; // @[DivSqrtRecFN_small.scala 192:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300634.4]
  wire [26:0] _GEN_18; // @[DivSqrtRecFN_small.scala 191:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300635.4]
  wire [26:0] _T_154; // @[DivSqrtRecFN_small.scala 191:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300635.4]
  wire  _T_155; // @[DivSqrtRecFN_small.scala 198:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300636.4]
  wire [26:0] _GEN_19; // @[DivSqrtRecFN_small.scala 198:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300637.4]
  wire [26:0] _T_156; // @[DivSqrtRecFN_small.scala 198:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300637.4]
  wire [26:0] _T_157; // @[DivSqrtRecFN_small.scala 198:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300638.4]
  wire [26:0] rem; // @[DivSqrtRecFN_small.scala 197:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300639.4]
  wire [31:0] _T_158; // @[DivSqrtRecFN_small.scala 199:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300640.4]
  wire [29:0] bitMask; // @[DivSqrtRecFN_small.scala 199:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300641.4]
  wire  _T_160; // @[DivSqrtRecFN_small.scala 201:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300643.4]
  wire [25:0] _GEN_20; // @[DivSqrtRecFN_small.scala 201:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300644.4]
  wire [25:0] _T_161; // @[DivSqrtRecFN_small.scala 201:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300644.4]
  wire [25:0] _T_162; // @[DivSqrtRecFN_small.scala 201:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300645.4]
  wire  _T_163; // @[DivSqrtRecFN_small.scala 202:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300646.4]
  wire [24:0] _T_164; // @[DivSqrtRecFN_small.scala 202:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300647.4]
  wire [25:0] _GEN_21; // @[DivSqrtRecFN_small.scala 201:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300648.4]
  wire [25:0] _T_165; // @[DivSqrtRecFN_small.scala 201:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300648.4]
  wire [25:0] _T_167; // @[DivSqrtRecFN_small.scala 203:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300650.4]
  wire [25:0] _T_168; // @[DivSqrtRecFN_small.scala 202:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300651.4]
  wire  _T_170; // @[DivSqrtRecFN_small.scala 204:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300653.4]
  wire  _T_171; // @[DivSqrtRecFN_small.scala 204:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300654.4]
  wire [23:0] _T_172; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300655.4]
  wire [24:0] _GEN_22; // @[DivSqrtRecFN_small.scala 204:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300656.4]
  wire [24:0] _T_173; // @[DivSqrtRecFN_small.scala 204:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300656.4]
  wire [24:0] _T_174; // @[DivSqrtRecFN_small.scala 204:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300657.4]
  wire [25:0] _GEN_23; // @[DivSqrtRecFN_small.scala 203:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300658.4]
  wire [25:0] _T_175; // @[DivSqrtRecFN_small.scala 203:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300658.4]
  wire  _T_177; // @[DivSqrtRecFN_small.scala 205:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300660.4]
  wire [26:0] _GEN_24; // @[DivSqrtRecFN_small.scala 205:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300661.4]
  wire [26:0] _T_178; // @[DivSqrtRecFN_small.scala 205:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300661.4]
  wire [29:0] _GEN_25; // @[DivSqrtRecFN_small.scala 205:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300662.4]
  wire [29:0] _T_179; // @[DivSqrtRecFN_small.scala 205:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300662.4]
  wire [29:0] _T_180; // @[DivSqrtRecFN_small.scala 205:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300663.4]
  wire [29:0] _GEN_26; // @[DivSqrtRecFN_small.scala 204:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300664.4]
  wire [29:0] trialTerm; // @[DivSqrtRecFN_small.scala 204:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300664.4]
  wire [27:0] _T_181; // @[DivSqrtRecFN_small.scala 206:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300665.4]
  wire [30:0] _T_182; // @[DivSqrtRecFN_small.scala 206:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300666.4]
  wire [30:0] _GEN_27; // @[DivSqrtRecFN_small.scala 206:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300667.4]
  wire [30:0] _T_184; // @[DivSqrtRecFN_small.scala 206:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300668.4]
  wire [30:0] trialRem; // @[DivSqrtRecFN_small.scala 206:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300669.4]
  wire  newBit; // @[DivSqrtRecFN_small.scala 207:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300670.4]
  wire  _T_185; // @[DivSqrtRecFN_small.scala 209:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300671.4]
  wire  _T_186; // @[DivSqrtRecFN_small.scala 209:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300672.4]
  wire [30:0] _T_187; // @[DivSqrtRecFN_small.scala 210:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300674.6]
  wire [30:0] _T_188; // @[DivSqrtRecFN_small.scala 210:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300675.6]
  wire [30:0] _GEN_10; // @[DivSqrtRecFN_small.scala 209:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300673.4]
  wire  _T_190; // @[DivSqrtRecFN_small.scala 212:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300679.4]
  wire  _T_191; // @[DivSqrtRecFN_small.scala 212:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300680.4]
  wire  _T_192; // @[DivSqrtRecFN_small.scala 213:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300682.6]
  wire [25:0] _GEN_28; // @[DivSqrtRecFN_small.scala 215:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300686.6]
  wire [25:0] _T_195; // @[DivSqrtRecFN_small.scala 215:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300686.6]
  wire [25:0] _T_196; // @[DivSqrtRecFN_small.scala 215:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300687.6]
  wire  _T_197; // @[DivSqrtRecFN_small.scala 216:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300688.6]
  wire [24:0] _T_198; // @[DivSqrtRecFN_small.scala 216:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300689.6]
  wire [25:0] _GEN_29; // @[DivSqrtRecFN_small.scala 215:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300690.6]
  wire [25:0] _T_199; // @[DivSqrtRecFN_small.scala 215:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300690.6]
  wire [23:0] _GEN_30; // @[DivSqrtRecFN_small.scala 217:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300692.6]
  wire [23:0] _T_201; // @[DivSqrtRecFN_small.scala 217:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300692.6]
  wire [23:0] _T_202; // @[DivSqrtRecFN_small.scala 217:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300693.6]
  wire [25:0] _GEN_31; // @[DivSqrtRecFN_small.scala 216:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300694.6]
  wire [25:0] _T_203; // @[DivSqrtRecFN_small.scala 216:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300694.6]
  wire [29:0] _GEN_32; // @[DivSqrtRecFN_small.scala 218:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300696.6]
  wire [29:0] _T_205; // @[DivSqrtRecFN_small.scala 218:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300696.6]
  wire [29:0] _T_206; // @[DivSqrtRecFN_small.scala 218:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300697.6]
  wire [29:0] _GEN_33; // @[DivSqrtRecFN_small.scala 217:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300698.6]
  wire [29:0] _T_207; // @[DivSqrtRecFN_small.scala 217:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300698.6]
  wire [29:0] _GEN_12; // @[DivSqrtRecFN_small.scala 212:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300681.4]
  wire  rawOutValid; // @[DivSqrtRecFN_small.scala 223:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300701.4]
  wire  _T_212; // @[DivSqrtRecFN_small.scala 229:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300710.4]
  wire [26:0] _GEN_35; // @[DivSqrtRecFN_small.scala 235:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300719.4]
  assign _T_29 = io_a[31:23]; // @[rawFloatFromRecFN.scala 50:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300456.4]
  assign _T_30 = _T_29[8:6]; // @[rawFloatFromRecFN.scala 51:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300457.4]
  assign rawA_S_isZero = _T_30 == 3'h0; // @[rawFloatFromRecFN.scala 51:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300458.4]
  assign _T_32 = _T_29[8:7]; // @[rawFloatFromRecFN.scala 52:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300459.4]
  assign _T_33 = _T_32 == 2'h3; // @[rawFloatFromRecFN.scala 52:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300460.4]
  assign _T_35 = _T_29[6]; // @[rawFloatFromRecFN.scala 55:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300463.4]
  assign rawA_S_isNaN = _T_33 & _T_35; // @[rawFloatFromRecFN.scala 55:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300464.4]
  assign _T_38 = _T_35 == 1'h0; // @[rawFloatFromRecFN.scala 56:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300467.4]
  assign rawA_S_isInf = _T_33 & _T_38; // @[rawFloatFromRecFN.scala 56:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300468.4]
  assign rawA_S_sign = io_a[32]; // @[rawFloatFromRecFN.scala 58:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300471.4]
  assign rawA_S_sExp = {1'b0,$signed(_T_29)}; // @[rawFloatFromRecFN.scala 59:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300473.4]
  assign _T_42 = rawA_S_isZero == 1'h0; // @[rawFloatFromRecFN.scala 60:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300475.4]
  assign _T_43 = io_a[22:0]; // @[rawFloatFromRecFN.scala 60:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300476.4]
  assign _T_44 = {1'h0,_T_42}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300477.4]
  assign rawA_S_sig = {_T_44,_T_43}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300478.4]
  assign _T_46 = io_b[31:23]; // @[rawFloatFromRecFN.scala 50:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300480.4]
  assign _T_47 = _T_46[8:6]; // @[rawFloatFromRecFN.scala 51:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300481.4]
  assign rawB_S_isZero = _T_47 == 3'h0; // @[rawFloatFromRecFN.scala 51:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300482.4]
  assign _T_49 = _T_46[8:7]; // @[rawFloatFromRecFN.scala 52:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300483.4]
  assign _T_50 = _T_49 == 2'h3; // @[rawFloatFromRecFN.scala 52:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300484.4]
  assign _T_52 = _T_46[6]; // @[rawFloatFromRecFN.scala 55:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300487.4]
  assign rawB_S_isNaN = _T_50 & _T_52; // @[rawFloatFromRecFN.scala 55:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300488.4]
  assign _T_55 = _T_52 == 1'h0; // @[rawFloatFromRecFN.scala 56:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300491.4]
  assign rawB_S_isInf = _T_50 & _T_55; // @[rawFloatFromRecFN.scala 56:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300492.4]
  assign rawB_S_sign = io_b[32]; // @[rawFloatFromRecFN.scala 58:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300495.4]
  assign rawB_S_sExp = {1'b0,$signed(_T_46)}; // @[rawFloatFromRecFN.scala 59:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300497.4]
  assign _T_59 = rawB_S_isZero == 1'h0; // @[rawFloatFromRecFN.scala 60:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300499.4]
  assign _T_60 = io_b[22:0]; // @[rawFloatFromRecFN.scala 60:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300500.4]
  assign _T_61 = {1'h0,_T_59}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300501.4]
  assign rawB_S_sig = {_T_61,_T_60}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300502.4]
  assign _T_63 = rawA_S_isZero & rawB_S_isZero; // @[DivSqrtRecFN_small.scala 101:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300504.4]
  assign _T_64 = rawA_S_isInf & rawB_S_isInf; // @[DivSqrtRecFN_small.scala 101:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300505.4]
  assign notSigNaNIn_invalidExc_S_div = _T_63 | _T_64; // @[DivSqrtRecFN_small.scala 101:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300506.4]
  assign _T_65 = rawA_S_isNaN == 1'h0; // @[DivSqrtRecFN_small.scala 103:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300507.4]
  assign _T_67 = _T_65 & _T_42; // @[DivSqrtRecFN_small.scala 103:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300509.4]
  assign notSigNaNIn_invalidExc_S_sqrt = _T_67 & rawA_S_sign; // @[DivSqrtRecFN_small.scala 103:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300510.4]
  assign _T_68 = rawA_S_sig[22]; // @[common.scala 81:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300511.4]
  assign _T_69 = _T_68 == 1'h0; // @[common.scala 81:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300512.4]
  assign _T_70 = rawA_S_isNaN & _T_69; // @[common.scala 81:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300513.4]
  assign _T_71 = _T_70 | notSigNaNIn_invalidExc_S_sqrt; // @[DivSqrtRecFN_small.scala 106:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300514.4]
  assign _T_75 = rawB_S_sig[22]; // @[common.scala 81:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300518.4]
  assign _T_76 = _T_75 == 1'h0; // @[common.scala 81:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300519.4]
  assign _T_77 = rawB_S_isNaN & _T_76; // @[common.scala 81:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300520.4]
  assign _T_78 = _T_70 | _T_77; // @[DivSqrtRecFN_small.scala 107:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300521.4]
  assign _T_79 = _T_78 | notSigNaNIn_invalidExc_S_div; // @[DivSqrtRecFN_small.scala 107:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300522.4]
  assign _T_81 = rawA_S_isInf == 1'h0; // @[DivSqrtRecFN_small.scala 109:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300524.4]
  assign _T_82 = _T_65 & _T_81; // @[DivSqrtRecFN_small.scala 109:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300525.4]
  assign _T_83 = _T_82 & rawB_S_isZero; // @[DivSqrtRecFN_small.scala 109:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300526.4]
  assign _T_84 = _T_79 | _T_83; // @[DivSqrtRecFN_small.scala 108:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300527.4]
  assign _T_85 = rawA_S_isNaN | notSigNaNIn_invalidExc_S_sqrt; // @[DivSqrtRecFN_small.scala 113:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300529.4]
  assign _T_86 = rawA_S_isNaN | rawB_S_isNaN; // @[DivSqrtRecFN_small.scala 114:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300530.4]
  assign _T_87 = _T_86 | notSigNaNIn_invalidExc_S_div; // @[DivSqrtRecFN_small.scala 114:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300531.4]
  assign _T_88 = rawA_S_isInf | rawB_S_isZero; // @[DivSqrtRecFN_small.scala 116:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300533.4]
  assign _T_89 = rawA_S_isZero | rawB_S_isInf; // @[DivSqrtRecFN_small.scala 117:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300535.4]
  assign _T_90 = io_sqrtOp == 1'h0; // @[DivSqrtRecFN_small.scala 118:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300537.4]
  assign _T_91 = _T_90 & rawB_S_sign; // @[DivSqrtRecFN_small.scala 118:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300538.4]
  assign sign_S = rawA_S_sign ^ _T_91; // @[DivSqrtRecFN_small.scala 118:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300539.4]
  assign _T_92 = rawA_S_isNaN | rawA_S_isInf; // @[DivSqrtRecFN_small.scala 120:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300540.4]
  assign specialCaseA_S = _T_92 | rawA_S_isZero; // @[DivSqrtRecFN_small.scala 120:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300541.4]
  assign _T_93 = rawB_S_isNaN | rawB_S_isInf; // @[DivSqrtRecFN_small.scala 121:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300542.4]
  assign specialCaseB_S = _T_93 | rawB_S_isZero; // @[DivSqrtRecFN_small.scala 121:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300543.4]
  assign _T_94 = specialCaseA_S == 1'h0; // @[DivSqrtRecFN_small.scala 122:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300544.4]
  assign _T_95 = specialCaseB_S == 1'h0; // @[DivSqrtRecFN_small.scala 122:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300545.4]
  assign normalCase_S_div = _T_94 & _T_95; // @[DivSqrtRecFN_small.scala 122:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300546.4]
  assign _T_97 = rawA_S_sign == 1'h0; // @[DivSqrtRecFN_small.scala 123:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300548.4]
  assign normalCase_S_sqrt = _T_94 & _T_97; // @[DivSqrtRecFN_small.scala 123:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300549.4]
  assign normalCase_S = io_sqrtOp ? normalCase_S_sqrt : normalCase_S_div; // @[DivSqrtRecFN_small.scala 124:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300550.4]
  assign _T_98 = rawB_S_sExp[8]; // @[DivSqrtRecFN_small.scala 128:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300551.4]
  assign _T_99 = rawB_S_sExp[7:0]; // @[DivSqrtRecFN_small.scala 128:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300552.4]
  assign _T_100 = ~ _T_99; // @[DivSqrtRecFN_small.scala 128:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300553.4]
  assign _T_101 = {_T_98,_T_100}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300554.4]
  assign _T_102 = $signed(_T_101); // @[DivSqrtRecFN_small.scala 128:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300555.4]
  assign _GEN_13 = {{1{_T_102[8]}},_T_102}; // @[DivSqrtRecFN_small.scala 127:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300556.4]
  assign sExpQuot_S_div = $signed(rawA_S_sExp) + $signed(_GEN_13); // @[DivSqrtRecFN_small.scala 127:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300556.4]
  assign _T_103 = $signed(11'sh1c0) <= $signed(sExpQuot_S_div); // @[DivSqrtRecFN_small.scala 131:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300557.4]
  assign _T_104 = sExpQuot_S_div[9:6]; // @[DivSqrtRecFN_small.scala 133:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300558.4]
  assign _T_105 = _T_103 ? 4'h6 : _T_104; // @[DivSqrtRecFN_small.scala 131:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300559.4]
  assign _T_106 = sExpQuot_S_div[5:0]; // @[DivSqrtRecFN_small.scala 135:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300560.4]
  assign _T_107 = {_T_105,_T_106}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300561.4]
  assign sSatExpQuot_S_div = $signed(_T_107); // @[DivSqrtRecFN_small.scala 136:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300562.4]
  assign _T_108 = rawA_S_sExp[0]; // @[DivSqrtRecFN_small.scala 138:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300563.4]
  assign _T_109 = _T_108 == 1'h0; // @[DivSqrtRecFN_small.scala 138:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300564.4]
  assign evenSqrt_S = io_sqrtOp & _T_109; // @[DivSqrtRecFN_small.scala 138:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300565.4]
  assign oddSqrt_S = io_sqrtOp & _T_108; // @[DivSqrtRecFN_small.scala 139:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300567.4]
  assign idle = cycleNum == 5'h0; // @[DivSqrtRecFN_small.scala 143:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300568.4]
  assign inReady = cycleNum <= 5'h1; // @[DivSqrtRecFN_small.scala 144:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300569.4]
  assign entering = inReady & io_inValid; // @[DivSqrtRecFN_small.scala 145:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300570.4]
  assign entering_normalCase = entering & normalCase_S; // @[DivSqrtRecFN_small.scala 146:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300571.4]
  assign _T_111 = cycleNum == 5'h3; // @[DivSqrtRecFN_small.scala 148:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300572.4]
  assign _T_112 = sigX_Z[25]; // @[DivSqrtRecFN_small.scala 148:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300573.4]
  assign skipCycle2 = _T_111 & _T_112; // @[DivSqrtRecFN_small.scala 148:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300574.4]
  assign _T_113 = idle == 1'h0; // @[DivSqrtRecFN_small.scala 150:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300575.4]
  assign _T_114 = _T_113 | io_inValid; // @[DivSqrtRecFN_small.scala 150:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300576.4]
  assign _T_115 = normalCase_S == 1'h0; // @[DivSqrtRecFN_small.scala 152:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300578.6]
  assign _T_116 = entering & _T_115; // @[DivSqrtRecFN_small.scala 152:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300579.6]
  assign _T_119 = _T_108 ? 5'h18 : 5'h19; // @[DivSqrtRecFN_small.scala 155:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300582.6]
  assign _T_120 = io_sqrtOp ? _T_119 : 5'h1a; // @[DivSqrtRecFN_small.scala 154:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300583.6]
  assign _T_121 = entering_normalCase ? _T_120 : 5'h0; // @[DivSqrtRecFN_small.scala 153:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300584.6]
  assign _GEN_14 = {{4'd0}, _T_116}; // @[DivSqrtRecFN_small.scala 152:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300585.6]
  assign _T_122 = _GEN_14 | _T_121; // @[DivSqrtRecFN_small.scala 152:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300585.6]
  assign _T_124 = skipCycle2 == 1'h0; // @[DivSqrtRecFN_small.scala 160:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300587.6]
  assign _T_125 = _T_113 & _T_124; // @[DivSqrtRecFN_small.scala 160:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300588.6]
  assign _T_126 = cycleNum - 5'h1; // @[DivSqrtRecFN_small.scala 160:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300589.6]
  assign _T_127 = $unsigned(_T_126); // @[DivSqrtRecFN_small.scala 160:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300590.6]
  assign _T_128 = _T_127[4:0]; // @[DivSqrtRecFN_small.scala 160:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300591.6]
  assign _T_129 = _T_125 ? _T_128 : 5'h0; // @[DivSqrtRecFN_small.scala 160:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300592.6]
  assign _T_130 = _T_122 | _T_129; // @[DivSqrtRecFN_small.scala 159:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300593.6]
  assign _T_132 = _T_113 & skipCycle2; // @[DivSqrtRecFN_small.scala 161:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300595.6]
  assign _GEN_15 = {{4'd0}, _T_132}; // @[DivSqrtRecFN_small.scala 160:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300597.6]
  assign _T_134 = _T_130 | _GEN_15; // @[DivSqrtRecFN_small.scala 160:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300597.6]
  assign _T_135 = rawA_S_sExp[9:1]; // @[DivSqrtRecFN_small.scala 179:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300610.6]
  assign _T_136 = $signed(_T_135) + $signed(9'sh80); // @[DivSqrtRecFN_small.scala 179:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300611.6]
  assign _T_139 = entering_normalCase & _T_90; // @[DivSqrtRecFN_small.scala 184:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300617.4]
  assign _T_140 = rawB_S_sig[22:0]; // @[DivSqrtRecFN_small.scala 185:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300619.6]
  assign _T_141 = oddSqrt_S == 1'h0; // @[DivSqrtRecFN_small.scala 191:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300622.4]
  assign _T_142 = inReady & _T_141; // @[DivSqrtRecFN_small.scala 191:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300623.4]
  assign _GEN_16 = {{1'd0}, rawA_S_sig}; // @[DivSqrtRecFN_small.scala 191:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300624.4]
  assign _T_143 = _GEN_16 << 1; // @[DivSqrtRecFN_small.scala 191:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300624.4]
  assign _T_144 = _T_142 ? _T_143 : 26'h0; // @[DivSqrtRecFN_small.scala 191:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300625.4]
  assign _T_145 = inReady & oddSqrt_S; // @[DivSqrtRecFN_small.scala 192:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300626.4]
  assign _T_146 = rawA_S_sig[23:22]; // @[DivSqrtRecFN_small.scala 193:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300627.4]
  assign _T_147 = _T_146 - 2'h1; // @[DivSqrtRecFN_small.scala 193:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300628.4]
  assign _T_148 = $unsigned(_T_147); // @[DivSqrtRecFN_small.scala 193:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300629.4]
  assign _T_149 = _T_148[1:0]; // @[DivSqrtRecFN_small.scala 193:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300630.4]
  assign _T_150 = rawA_S_sig[21:0]; // @[DivSqrtRecFN_small.scala 194:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300631.4]
  assign _GEN_17 = {{3'd0}, _T_150}; // @[DivSqrtRecFN_small.scala 194:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300632.4]
  assign _T_151 = _GEN_17 << 3; // @[DivSqrtRecFN_small.scala 194:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300632.4]
  assign _T_152 = {_T_149,_T_151}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300633.4]
  assign _T_153 = _T_145 ? _T_152 : 27'h0; // @[DivSqrtRecFN_small.scala 192:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300634.4]
  assign _GEN_18 = {{1'd0}, _T_144}; // @[DivSqrtRecFN_small.scala 191:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300635.4]
  assign _T_154 = _GEN_18 | _T_153; // @[DivSqrtRecFN_small.scala 191:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300635.4]
  assign _T_155 = inReady == 1'h0; // @[DivSqrtRecFN_small.scala 198:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300636.4]
  assign _GEN_19 = {{1'd0}, rem_Z}; // @[DivSqrtRecFN_small.scala 198:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300637.4]
  assign _T_156 = _GEN_19 << 1; // @[DivSqrtRecFN_small.scala 198:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300637.4]
  assign _T_157 = _T_155 ? _T_156 : 27'h0; // @[DivSqrtRecFN_small.scala 198:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300638.4]
  assign rem = _T_154 | _T_157; // @[DivSqrtRecFN_small.scala 197:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300639.4]
  assign _T_158 = 32'h1 << cycleNum; // @[DivSqrtRecFN_small.scala 199:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300640.4]
  assign bitMask = _T_158[31:2]; // @[DivSqrtRecFN_small.scala 199:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300641.4]
  assign _T_160 = inReady & _T_90; // @[DivSqrtRecFN_small.scala 201:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300643.4]
  assign _GEN_20 = {{1'd0}, rawB_S_sig}; // @[DivSqrtRecFN_small.scala 201:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300644.4]
  assign _T_161 = _GEN_20 << 1; // @[DivSqrtRecFN_small.scala 201:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300644.4]
  assign _T_162 = _T_160 ? _T_161 : 26'h0; // @[DivSqrtRecFN_small.scala 201:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300645.4]
  assign _T_163 = inReady & evenSqrt_S; // @[DivSqrtRecFN_small.scala 202:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300646.4]
  assign _T_164 = _T_163 ? 25'h1000000 : 25'h0; // @[DivSqrtRecFN_small.scala 202:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300647.4]
  assign _GEN_21 = {{1'd0}, _T_164}; // @[DivSqrtRecFN_small.scala 201:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300648.4]
  assign _T_165 = _T_162 | _GEN_21; // @[DivSqrtRecFN_small.scala 201:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300648.4]
  assign _T_167 = _T_145 ? 26'h2800000 : 26'h0; // @[DivSqrtRecFN_small.scala 203:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300650.4]
  assign _T_168 = _T_165 | _T_167; // @[DivSqrtRecFN_small.scala 202:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300651.4]
  assign _T_170 = sqrtOp_Z == 1'h0; // @[DivSqrtRecFN_small.scala 204:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300653.4]
  assign _T_171 = _T_155 & _T_170; // @[DivSqrtRecFN_small.scala 204:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300654.4]
  assign _T_172 = {1'h1,fractB_Z}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300655.4]
  assign _GEN_22 = {{1'd0}, _T_172}; // @[DivSqrtRecFN_small.scala 204:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300656.4]
  assign _T_173 = _GEN_22 << 1; // @[DivSqrtRecFN_small.scala 204:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300656.4]
  assign _T_174 = _T_171 ? _T_173 : 25'h0; // @[DivSqrtRecFN_small.scala 204:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300657.4]
  assign _GEN_23 = {{1'd0}, _T_174}; // @[DivSqrtRecFN_small.scala 203:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300658.4]
  assign _T_175 = _T_168 | _GEN_23; // @[DivSqrtRecFN_small.scala 203:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300658.4]
  assign _T_177 = _T_155 & sqrtOp_Z; // @[DivSqrtRecFN_small.scala 205:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300660.4]
  assign _GEN_24 = {{1'd0}, sigX_Z}; // @[DivSqrtRecFN_small.scala 205:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300661.4]
  assign _T_178 = _GEN_24 << 1; // @[DivSqrtRecFN_small.scala 205:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300661.4]
  assign _GEN_25 = {{3'd0}, _T_178}; // @[DivSqrtRecFN_small.scala 205:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300662.4]
  assign _T_179 = _GEN_25 | bitMask; // @[DivSqrtRecFN_small.scala 205:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300662.4]
  assign _T_180 = _T_177 ? _T_179 : 30'h0; // @[DivSqrtRecFN_small.scala 205:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300663.4]
  assign _GEN_26 = {{4'd0}, _T_175}; // @[DivSqrtRecFN_small.scala 204:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300664.4]
  assign trialTerm = _GEN_26 | _T_180; // @[DivSqrtRecFN_small.scala 204:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300664.4]
  assign _T_181 = {1'b0,$signed(rem)}; // @[DivSqrtRecFN_small.scala 206:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300665.4]
  assign _T_182 = {1'b0,$signed(trialTerm)}; // @[DivSqrtRecFN_small.scala 206:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300666.4]
  assign _GEN_27 = {{3{_T_181[27]}},_T_181}; // @[DivSqrtRecFN_small.scala 206:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300667.4]
  assign _T_184 = $signed(_GEN_27) - $signed(_T_182); // @[DivSqrtRecFN_small.scala 206:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300668.4]
  assign trialRem = $signed(_T_184); // @[DivSqrtRecFN_small.scala 206:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300669.4]
  assign newBit = $signed(31'sh0) <= $signed(trialRem); // @[DivSqrtRecFN_small.scala 207:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300670.4]
  assign _T_185 = cycleNum > 5'h2; // @[DivSqrtRecFN_small.scala 209:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300671.4]
  assign _T_186 = entering_normalCase | _T_185; // @[DivSqrtRecFN_small.scala 209:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300672.4]
  assign _T_187 = $unsigned(trialRem); // @[DivSqrtRecFN_small.scala 210:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300674.6]
  assign _T_188 = newBit ? _T_187 : {{4'd0}, rem}; // @[DivSqrtRecFN_small.scala 210:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300675.6]
  assign _GEN_10 = _T_186 ? _T_188 : {{5'd0}, rem_Z}; // @[DivSqrtRecFN_small.scala 209:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300673.4]
  assign _T_190 = _T_155 & newBit; // @[DivSqrtRecFN_small.scala 212:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300679.4]
  assign _T_191 = entering_normalCase | _T_190; // @[DivSqrtRecFN_small.scala 212:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300680.4]
  assign _T_192 = $signed(trialRem) != $signed(31'sh0); // @[DivSqrtRecFN_small.scala 213:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300682.6]
  assign _GEN_28 = {{25'd0}, newBit}; // @[DivSqrtRecFN_small.scala 215:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300686.6]
  assign _T_195 = _GEN_28 << 25; // @[DivSqrtRecFN_small.scala 215:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300686.6]
  assign _T_196 = _T_160 ? _T_195 : 26'h0; // @[DivSqrtRecFN_small.scala 215:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300687.6]
  assign _T_197 = inReady & io_sqrtOp; // @[DivSqrtRecFN_small.scala 216:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300688.6]
  assign _T_198 = _T_197 ? 25'h1000000 : 25'h0; // @[DivSqrtRecFN_small.scala 216:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300689.6]
  assign _GEN_29 = {{1'd0}, _T_198}; // @[DivSqrtRecFN_small.scala 215:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300690.6]
  assign _T_199 = _T_196 | _GEN_29; // @[DivSqrtRecFN_small.scala 215:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300690.6]
  assign _GEN_30 = {{23'd0}, newBit}; // @[DivSqrtRecFN_small.scala 217:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300692.6]
  assign _T_201 = _GEN_30 << 23; // @[DivSqrtRecFN_small.scala 217:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300692.6]
  assign _T_202 = _T_145 ? _T_201 : 24'h0; // @[DivSqrtRecFN_small.scala 217:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300693.6]
  assign _GEN_31 = {{2'd0}, _T_202}; // @[DivSqrtRecFN_small.scala 216:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300694.6]
  assign _T_203 = _T_199 | _GEN_31; // @[DivSqrtRecFN_small.scala 216:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300694.6]
  assign _GEN_32 = {{4'd0}, sigX_Z}; // @[DivSqrtRecFN_small.scala 218:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300696.6]
  assign _T_205 = _GEN_32 | bitMask; // @[DivSqrtRecFN_small.scala 218:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300696.6]
  assign _T_206 = _T_155 ? _T_205 : 30'h0; // @[DivSqrtRecFN_small.scala 218:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300697.6]
  assign _GEN_33 = {{4'd0}, _T_203}; // @[DivSqrtRecFN_small.scala 217:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300698.6]
  assign _T_207 = _GEN_33 | _T_206; // @[DivSqrtRecFN_small.scala 217:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300698.6]
  assign _GEN_12 = _T_191 ? _T_207 : {{4'd0}, sigX_Z}; // @[DivSqrtRecFN_small.scala 212:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300681.4]
  assign rawOutValid = cycleNum == 5'h1; // @[DivSqrtRecFN_small.scala 223:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300701.4]
  assign _T_212 = isNaN_Z == 1'h0; // @[DivSqrtRecFN_small.scala 229:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300710.4]
  assign _GEN_35 = {{26'd0}, notZeroRem_Z}; // @[DivSqrtRecFN_small.scala 235:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300719.4]
  assign io_inReady = cycleNum <= 5'h1; // @[DivSqrtRecFN_small.scala 164:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300600.4]
  assign io_rawOutValid_div = rawOutValid & _T_170; // @[DivSqrtRecFN_small.scala 225:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300704.4]
  assign io_rawOutValid_sqrt = rawOutValid & sqrtOp_Z; // @[DivSqrtRecFN_small.scala 226:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300706.4]
  assign io_roundingModeOut = roundingMode_Z; // @[DivSqrtRecFN_small.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300707.4]
  assign io_invalidExc = majorExc_Z & isNaN_Z; // @[DivSqrtRecFN_small.scala 228:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300709.4]
  assign io_infiniteExc = majorExc_Z & _T_212; // @[DivSqrtRecFN_small.scala 229:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300712.4]
  assign io_rawOut_isNaN = isNaN_Z; // @[DivSqrtRecFN_small.scala 230:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300713.4]
  assign io_rawOut_isInf = isInf_Z; // @[DivSqrtRecFN_small.scala 231:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300714.4]
  assign io_rawOut_isZero = isZero_Z; // @[DivSqrtRecFN_small.scala 232:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300715.4]
  assign io_rawOut_sign = sign_Z; // @[DivSqrtRecFN_small.scala 233:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300716.4]
  assign io_rawOut_sExp = sExp_Z; // @[DivSqrtRecFN_small.scala 234:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300717.4]
  assign io_rawOut_sig = _T_178 | _GEN_35; // @[DivSqrtRecFN_small.scala 235:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300720.4]
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
  cycleNum = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  sqrtOp_Z = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  majorExc_Z = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  isNaN_Z = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  isInf_Z = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  isZero_Z = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  sign_Z = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  sExp_Z = _RAND_7[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  fractB_Z = _RAND_8[22:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  roundingMode_Z = _RAND_9[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  rem_Z = _RAND_10[25:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  notZeroRem_Z = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  sigX_Z = _RAND_12[25:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      cycleNum <= 5'h0;
    end else begin
      if (_T_114) begin
        cycleNum <= _T_134;
      end
    end
    if (entering) begin
      sqrtOp_Z <= io_sqrtOp;
    end
    if (entering) begin
      if (io_sqrtOp) begin
        majorExc_Z <= _T_71;
      end else begin
        majorExc_Z <= _T_84;
      end
    end
    if (entering) begin
      if (io_sqrtOp) begin
        isNaN_Z <= _T_85;
      end else begin
        isNaN_Z <= _T_87;
      end
    end
    if (entering) begin
      if (io_sqrtOp) begin
        isInf_Z <= rawA_S_isInf;
      end else begin
        isInf_Z <= _T_88;
      end
    end
    if (entering) begin
      if (io_sqrtOp) begin
        isZero_Z <= rawA_S_isZero;
      end else begin
        isZero_Z <= _T_89;
      end
    end
    if (entering) begin
      sign_Z <= sign_S;
    end
    if (entering_normalCase) begin
      if (io_sqrtOp) begin
        sExp_Z <= _T_136;
      end else begin
        sExp_Z <= sSatExpQuot_S_div;
      end
    end
    if (_T_139) begin
      fractB_Z <= _T_140;
    end
    if (entering_normalCase) begin
      roundingMode_Z <= io_roundingMode;
    end
    rem_Z <= _GEN_10[25:0];
    if (_T_191) begin
      notZeroRem_Z <= _T_192;
    end
    sigX_Z <= _GEN_12[25:0];
  end
endmodule