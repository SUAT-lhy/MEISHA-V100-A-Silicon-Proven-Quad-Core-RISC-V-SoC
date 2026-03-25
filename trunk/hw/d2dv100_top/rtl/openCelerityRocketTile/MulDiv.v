module MulDiv( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311523.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311524.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311525.4]
  output        io_req_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311526.4]
  input         io_req_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311526.4]
  input  [3:0]  io_req_bits_fn, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311526.4]
  input         io_req_bits_dw, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311526.4]
  input  [63:0] io_req_bits_in1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311526.4]
  input  [63:0] io_req_bits_in2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311526.4]
  input  [4:0]  io_req_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311526.4]
  input         io_kill, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311526.4]
  input         io_resp_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311526.4]
  output        io_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311526.4]
  output [63:0] io_resp_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311526.4]
  output [4:0]  io_resp_bits_tag // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311526.4]
);
  reg [2:0] state; // @[Multiplier.scala 51:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311531.4]
  reg [31:0] _RAND_0;
  reg  req_dw; // @[Multiplier.scala 53:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311532.4]
  reg [31:0] _RAND_1;
  reg [4:0] req_tag; // @[Multiplier.scala 53:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311532.4]
  reg [31:0] _RAND_2;
  reg [6:0] count; // @[Multiplier.scala 54:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311533.4]
  reg [31:0] _RAND_3;
  reg  neg_out; // @[Multiplier.scala 57:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311534.4]
  reg [31:0] _RAND_4;
  reg  isHi; // @[Multiplier.scala 58:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311535.4]
  reg [31:0] _RAND_5;
  reg  resHi; // @[Multiplier.scala 59:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311536.4]
  reg [31:0] _RAND_6;
  reg [64:0] divisor; // @[Multiplier.scala 60:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311537.4]
  reg [95:0] _RAND_7;
  reg [129:0] remainder; // @[Multiplier.scala 61:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311538.4]
  reg [159:0] _RAND_8;
  wire [3:0] _T_22; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311539.4]
  wire  cmdMul; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311540.4]
  wire [3:0] _T_25; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311542.4]
  wire  _T_26; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311543.4]
  wire [3:0] _T_27; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311544.4]
  wire  _T_28; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311545.4]
  wire  cmdHi; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311547.4]
  wire [3:0] _T_31; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311548.4]
  wire  _T_32; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311549.4]
  wire [3:0] _T_33; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311550.4]
  wire  _T_34; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311551.4]
  wire  lhsSigned; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311553.4]
  wire  _T_38; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311555.4]
  wire  rhsSigned; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311557.4]
  wire  _T_41; // @[Multiplier.scala 78:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311562.4]
  wire  _T_43; // @[Multiplier.scala 81:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311564.4]
  wire  _T_44; // @[Multiplier.scala 81:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311565.4]
  wire  _T_45; // @[Multiplier.scala 81:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311566.4]
  wire  lhs_sign; // @[Multiplier.scala 81:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311567.4]
  wire [31:0] _T_47; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311569.4]
  wire [31:0] _T_48; // @[Multiplier.scala 82:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311570.4]
  wire [31:0] _T_49; // @[Multiplier.scala 82:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311571.4]
  wire [31:0] _T_50; // @[Multiplier.scala 83:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311572.4]
  wire [63:0] lhs_in; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311573.4]
  wire  _T_53; // @[Multiplier.scala 81:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311576.4]
  wire  _T_54; // @[Multiplier.scala 81:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311577.4]
  wire  _T_55; // @[Multiplier.scala 81:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311578.4]
  wire  rhs_sign; // @[Multiplier.scala 81:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311579.4]
  wire [31:0] _T_57; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311581.4]
  wire [31:0] _T_58; // @[Multiplier.scala 82:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311582.4]
  wire [31:0] _T_59; // @[Multiplier.scala 82:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311583.4]
  wire [31:0] _T_60; // @[Multiplier.scala 83:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311584.4]
  wire [63:0] rhs_in; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311585.4]
  wire [64:0] _T_61; // @[Multiplier.scala 88:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311586.4]
  wire [65:0] _T_62; // @[Multiplier.scala 88:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311587.4]
  wire [65:0] _T_63; // @[Multiplier.scala 88:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311588.4]
  wire [64:0] subtractor; // @[Multiplier.scala 88:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311589.4]
  wire [63:0] _T_64; // @[Multiplier.scala 89:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311590.4]
  wire [63:0] _T_65; // @[Multiplier.scala 89:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311591.4]
  wire [63:0] result; // @[Multiplier.scala 89:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311592.4]
  wire [64:0] _T_66; // @[Multiplier.scala 90:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311593.4]
  wire [64:0] _T_67; // @[Multiplier.scala 90:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311594.4]
  wire [63:0] negated_remainder; // @[Multiplier.scala 90:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311595.4]
  wire  _T_68; // @[Multiplier.scala 92:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311596.4]
  wire  _T_69; // @[Multiplier.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311598.6]
  wire  _T_70; // @[Multiplier.scala 96:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311602.6]
  wire  _T_71; // @[Multiplier.scala 101:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311608.4]
  wire  _T_72; // @[Multiplier.scala 106:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311614.4]
  wire [64:0] _T_73; // @[Multiplier.scala 107:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311616.6]
  wire [128:0] _T_75; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311618.6]
  wire  _T_76; // @[Multiplier.scala 108:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311619.6]
  wire [63:0] _T_77; // @[Multiplier.scala 109:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311620.6]
  wire [64:0] _T_78; // @[Multiplier.scala 110:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311621.6]
  wire [64:0] _T_79; // @[Multiplier.scala 110:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311622.6]
  wire [64:0] _T_80; // @[Multiplier.scala 111:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311623.6]
  wire [7:0] _T_81; // @[Multiplier.scala 112:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311624.6]
  wire [8:0] _T_82; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311625.6]
  wire [8:0] _T_83; // @[Multiplier.scala 112:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311626.6]
  wire [64:0] _GEN_37; // @[Multiplier.scala 112:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311627.6]
  wire [73:0] _T_84; // @[Multiplier.scala 112:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311627.6]
  wire [73:0] _GEN_38; // @[Multiplier.scala 112:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311628.6]
  wire [73:0] _T_86; // @[Multiplier.scala 112:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311629.6]
  wire [73:0] _T_87; // @[Multiplier.scala 112:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311630.6]
  wire [55:0] _T_88; // @[Multiplier.scala 113:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311631.6]
  wire [73:0] _T_89; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311632.6]
  wire [129:0] _T_90; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311633.6]
  wire  _T_91; // @[Multiplier.scala 114:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311634.6]
  wire  _T_92; // @[Multiplier.scala 114:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311635.6]
  wire [10:0] _T_93; // @[Multiplier.scala 116:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311636.6]
  wire [5:0] _T_94; // @[Multiplier.scala 116:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311637.6]
  wire [64:0] _T_95; // @[Multiplier.scala 116:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311638.6]
  wire [63:0] _T_96; // @[Multiplier.scala 116:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311639.6]
  wire  _T_97; // @[Multiplier.scala 117:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311640.6]
  wire  _T_99; // @[Multiplier.scala 117:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311642.6]
  wire  _T_100; // @[Multiplier.scala 117:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311643.6]
  wire  _T_101; // @[Multiplier.scala 118:7:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311644.6]
  wire  _T_102; // @[Multiplier.scala 117:87:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311645.6]
  wire [63:0] _T_103; // @[Multiplier.scala 118:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311646.6]
  wire [63:0] _T_104; // @[Multiplier.scala 118:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311647.6]
  wire  _T_105; // @[Multiplier.scala 118:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311648.6]
  wire  _T_106; // @[Multiplier.scala 118:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311649.6]
  wire [11:0] _T_108; // @[Multiplier.scala 119:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311651.6]
  wire [11:0] _T_109; // @[Multiplier.scala 119:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311652.6]
  wire [10:0] _T_110; // @[Multiplier.scala 119:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311653.6]
  wire [5:0] _T_111; // @[Multiplier.scala 119:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311654.6]
  wire [128:0] _T_112; // @[Multiplier.scala 119:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311655.6]
  wire [64:0] _T_113; // @[Multiplier.scala 120:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311656.6]
  wire [129:0] _T_114; // @[Multiplier.scala 120:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311657.6]
  wire [63:0] _T_115; // @[Multiplier.scala 120:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311658.6]
  wire [128:0] _T_116; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311659.6]
  wire [64:0] _T_117; // @[Multiplier.scala 121:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311660.6]
  wire [63:0] _T_118; // @[Multiplier.scala 121:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311661.6]
  wire [65:0] _T_119; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311662.6]
  wire [129:0] _T_120; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311663.6]
  wire [6:0] _T_122; // @[Multiplier.scala 123:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311666.6]
  wire  _T_123; // @[Multiplier.scala 124:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311668.6]
  wire  _T_124; // @[Multiplier.scala 124:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311669.6]
  wire  _T_125; // @[Multiplier.scala 129:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311675.4]
  wire  _T_126; // @[Multiplier.scala 133:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311677.6]
  wire [63:0] _T_127; // @[Multiplier.scala 134:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311678.6]
  wire [63:0] _T_128; // @[Multiplier.scala 134:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311679.6]
  wire [63:0] _T_129; // @[Multiplier.scala 134:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311680.6]
  wire  _T_131; // @[Multiplier.scala 134:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311682.6]
  wire [127:0] _T_132; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311683.6]
  wire [128:0] _T_133; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311684.6]
  wire  _T_134; // @[Multiplier.scala 138:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311686.6]
  wire  _T_138; // @[Multiplier.scala 146:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311695.6]
  wire  _T_141; // @[Multiplier.scala 146:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311698.6]
  wire [63:0] _T_143; // @[Multiplier.scala 150:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311700.6]
  wire [31:0] _T_144; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311701.6]
  wire [31:0] _T_145; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311702.6]
  wire  _T_146; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311703.6]
  wire [15:0] _T_147; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311704.6]
  wire [15:0] _T_148; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311705.6]
  wire  _T_149; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311706.6]
  wire [7:0] _T_150; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311707.6]
  wire [7:0] _T_151; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311708.6]
  wire  _T_152; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311709.6]
  wire [3:0] _T_153; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311710.6]
  wire [3:0] _T_154; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311711.6]
  wire  _T_155; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311712.6]
  wire  _T_156; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311713.6]
  wire  _T_157; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311714.6]
  wire  _T_158; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311715.6]
  wire [1:0] _T_159; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311716.6]
  wire [1:0] _T_160; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311717.6]
  wire  _T_161; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311718.6]
  wire  _T_162; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311719.6]
  wire  _T_163; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311720.6]
  wire [1:0] _T_164; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311721.6]
  wire [1:0] _T_165; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311722.6]
  wire [1:0] _T_166; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311723.6]
  wire [2:0] _T_167; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311724.6]
  wire [3:0] _T_168; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311725.6]
  wire [3:0] _T_169; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311726.6]
  wire  _T_170; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311727.6]
  wire  _T_171; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311728.6]
  wire  _T_172; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311729.6]
  wire  _T_173; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311730.6]
  wire [1:0] _T_174; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311731.6]
  wire [1:0] _T_175; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311732.6]
  wire  _T_176; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311733.6]
  wire  _T_177; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311734.6]
  wire  _T_178; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311735.6]
  wire [1:0] _T_179; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311736.6]
  wire [1:0] _T_180; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311737.6]
  wire [1:0] _T_181; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311738.6]
  wire [2:0] _T_182; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311739.6]
  wire [2:0] _T_183; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311740.6]
  wire [3:0] _T_184; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311741.6]
  wire [7:0] _T_185; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311742.6]
  wire [7:0] _T_186; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311743.6]
  wire  _T_187; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311744.6]
  wire [3:0] _T_188; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311745.6]
  wire [3:0] _T_189; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311746.6]
  wire  _T_190; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311747.6]
  wire  _T_191; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311748.6]
  wire  _T_192; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311749.6]
  wire  _T_193; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311750.6]
  wire [1:0] _T_194; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311751.6]
  wire [1:0] _T_195; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311752.6]
  wire  _T_196; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311753.6]
  wire  _T_197; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311754.6]
  wire  _T_198; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311755.6]
  wire [1:0] _T_199; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311756.6]
  wire [1:0] _T_200; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311757.6]
  wire [1:0] _T_201; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311758.6]
  wire [2:0] _T_202; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311759.6]
  wire [3:0] _T_203; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311760.6]
  wire [3:0] _T_204; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311761.6]
  wire  _T_205; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311762.6]
  wire  _T_206; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311763.6]
  wire  _T_207; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311764.6]
  wire  _T_208; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311765.6]
  wire [1:0] _T_209; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311766.6]
  wire [1:0] _T_210; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311767.6]
  wire  _T_211; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311768.6]
  wire  _T_212; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311769.6]
  wire  _T_213; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311770.6]
  wire [1:0] _T_214; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311771.6]
  wire [1:0] _T_215; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311772.6]
  wire [1:0] _T_216; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311773.6]
  wire [2:0] _T_217; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311774.6]
  wire [2:0] _T_218; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311775.6]
  wire [3:0] _T_219; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311776.6]
  wire [3:0] _T_220; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311777.6]
  wire [4:0] _T_221; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311778.6]
  wire [15:0] _T_222; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311779.6]
  wire [15:0] _T_223; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311780.6]
  wire  _T_224; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311781.6]
  wire [7:0] _T_225; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311782.6]
  wire [7:0] _T_226; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311783.6]
  wire  _T_227; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311784.6]
  wire [3:0] _T_228; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311785.6]
  wire [3:0] _T_229; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311786.6]
  wire  _T_230; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311787.6]
  wire  _T_231; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311788.6]
  wire  _T_232; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311789.6]
  wire  _T_233; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311790.6]
  wire [1:0] _T_234; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311791.6]
  wire [1:0] _T_235; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311792.6]
  wire  _T_236; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311793.6]
  wire  _T_237; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311794.6]
  wire  _T_238; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311795.6]
  wire [1:0] _T_239; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311796.6]
  wire [1:0] _T_240; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311797.6]
  wire [1:0] _T_241; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311798.6]
  wire [2:0] _T_242; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311799.6]
  wire [3:0] _T_243; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311800.6]
  wire [3:0] _T_244; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311801.6]
  wire  _T_245; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311802.6]
  wire  _T_246; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311803.6]
  wire  _T_247; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311804.6]
  wire  _T_248; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311805.6]
  wire [1:0] _T_249; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311806.6]
  wire [1:0] _T_250; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311807.6]
  wire  _T_251; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311808.6]
  wire  _T_252; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311809.6]
  wire  _T_253; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311810.6]
  wire [1:0] _T_254; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311811.6]
  wire [1:0] _T_255; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311812.6]
  wire [1:0] _T_256; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311813.6]
  wire [2:0] _T_257; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311814.6]
  wire [2:0] _T_258; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311815.6]
  wire [3:0] _T_259; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311816.6]
  wire [7:0] _T_260; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311817.6]
  wire [7:0] _T_261; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311818.6]
  wire  _T_262; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311819.6]
  wire [3:0] _T_263; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311820.6]
  wire [3:0] _T_264; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311821.6]
  wire  _T_265; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311822.6]
  wire  _T_266; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311823.6]
  wire  _T_267; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311824.6]
  wire  _T_268; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311825.6]
  wire [1:0] _T_269; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311826.6]
  wire [1:0] _T_270; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311827.6]
  wire  _T_271; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311828.6]
  wire  _T_272; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311829.6]
  wire  _T_273; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311830.6]
  wire [1:0] _T_274; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311831.6]
  wire [1:0] _T_275; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311832.6]
  wire [1:0] _T_276; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311833.6]
  wire [2:0] _T_277; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311834.6]
  wire [3:0] _T_278; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311835.6]
  wire [3:0] _T_279; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311836.6]
  wire  _T_280; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311837.6]
  wire  _T_281; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311838.6]
  wire  _T_282; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311839.6]
  wire  _T_283; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311840.6]
  wire [1:0] _T_284; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311841.6]
  wire [1:0] _T_285; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311842.6]
  wire  _T_286; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311843.6]
  wire  _T_287; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311844.6]
  wire  _T_288; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311845.6]
  wire [1:0] _T_289; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311846.6]
  wire [1:0] _T_290; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311847.6]
  wire [1:0] _T_291; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311848.6]
  wire [2:0] _T_292; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311849.6]
  wire [2:0] _T_293; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311850.6]
  wire [3:0] _T_294; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311851.6]
  wire [3:0] _T_295; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311852.6]
  wire [4:0] _T_296; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311853.6]
  wire [4:0] _T_297; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311854.6]
  wire [5:0] _T_298; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311855.6]
  wire [31:0] _T_301; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311858.6]
  wire [31:0] _T_302; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311859.6]
  wire  _T_303; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311860.6]
  wire [15:0] _T_304; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311861.6]
  wire [15:0] _T_305; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311862.6]
  wire  _T_306; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311863.6]
  wire [7:0] _T_307; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311864.6]
  wire [7:0] _T_308; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311865.6]
  wire  _T_309; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311866.6]
  wire [3:0] _T_310; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311867.6]
  wire [3:0] _T_311; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311868.6]
  wire  _T_312; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311869.6]
  wire  _T_313; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311870.6]
  wire  _T_314; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311871.6]
  wire  _T_315; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311872.6]
  wire [1:0] _T_316; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311873.6]
  wire [1:0] _T_317; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311874.6]
  wire  _T_318; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311875.6]
  wire  _T_319; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311876.6]
  wire  _T_320; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311877.6]
  wire [1:0] _T_321; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311878.6]
  wire [1:0] _T_322; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311879.6]
  wire [1:0] _T_323; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311880.6]
  wire [2:0] _T_324; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311881.6]
  wire [3:0] _T_325; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311882.6]
  wire [3:0] _T_326; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311883.6]
  wire  _T_327; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311884.6]
  wire  _T_328; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311885.6]
  wire  _T_329; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311886.6]
  wire  _T_330; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311887.6]
  wire [1:0] _T_331; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311888.6]
  wire [1:0] _T_332; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311889.6]
  wire  _T_333; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311890.6]
  wire  _T_334; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311891.6]
  wire  _T_335; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311892.6]
  wire [1:0] _T_336; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311893.6]
  wire [1:0] _T_337; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311894.6]
  wire [1:0] _T_338; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311895.6]
  wire [2:0] _T_339; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311896.6]
  wire [2:0] _T_340; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311897.6]
  wire [3:0] _T_341; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311898.6]
  wire [7:0] _T_342; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311899.6]
  wire [7:0] _T_343; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311900.6]
  wire  _T_344; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311901.6]
  wire [3:0] _T_345; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311902.6]
  wire [3:0] _T_346; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311903.6]
  wire  _T_347; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311904.6]
  wire  _T_348; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311905.6]
  wire  _T_349; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311906.6]
  wire  _T_350; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311907.6]
  wire [1:0] _T_351; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311908.6]
  wire [1:0] _T_352; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311909.6]
  wire  _T_353; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311910.6]
  wire  _T_354; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311911.6]
  wire  _T_355; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311912.6]
  wire [1:0] _T_356; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311913.6]
  wire [1:0] _T_357; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311914.6]
  wire [1:0] _T_358; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311915.6]
  wire [2:0] _T_359; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311916.6]
  wire [3:0] _T_360; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311917.6]
  wire [3:0] _T_361; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311918.6]
  wire  _T_362; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311919.6]
  wire  _T_363; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311920.6]
  wire  _T_364; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311921.6]
  wire  _T_365; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311922.6]
  wire [1:0] _T_366; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311923.6]
  wire [1:0] _T_367; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311924.6]
  wire  _T_368; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311925.6]
  wire  _T_369; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311926.6]
  wire  _T_370; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311927.6]
  wire [1:0] _T_371; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311928.6]
  wire [1:0] _T_372; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311929.6]
  wire [1:0] _T_373; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311930.6]
  wire [2:0] _T_374; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311931.6]
  wire [2:0] _T_375; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311932.6]
  wire [3:0] _T_376; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311933.6]
  wire [3:0] _T_377; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311934.6]
  wire [4:0] _T_378; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311935.6]
  wire [15:0] _T_379; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311936.6]
  wire [15:0] _T_380; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311937.6]
  wire  _T_381; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311938.6]
  wire [7:0] _T_382; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311939.6]
  wire [7:0] _T_383; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311940.6]
  wire  _T_384; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311941.6]
  wire [3:0] _T_385; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311942.6]
  wire [3:0] _T_386; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311943.6]
  wire  _T_387; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311944.6]
  wire  _T_388; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311945.6]
  wire  _T_389; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311946.6]
  wire  _T_390; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311947.6]
  wire [1:0] _T_391; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311948.6]
  wire [1:0] _T_392; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311949.6]
  wire  _T_393; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311950.6]
  wire  _T_394; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311951.6]
  wire  _T_395; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311952.6]
  wire [1:0] _T_396; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311953.6]
  wire [1:0] _T_397; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311954.6]
  wire [1:0] _T_398; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311955.6]
  wire [2:0] _T_399; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311956.6]
  wire [3:0] _T_400; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311957.6]
  wire [3:0] _T_401; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311958.6]
  wire  _T_402; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311959.6]
  wire  _T_403; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311960.6]
  wire  _T_404; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311961.6]
  wire  _T_405; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311962.6]
  wire [1:0] _T_406; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311963.6]
  wire [1:0] _T_407; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311964.6]
  wire  _T_408; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311965.6]
  wire  _T_409; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311966.6]
  wire  _T_410; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311967.6]
  wire [1:0] _T_411; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311968.6]
  wire [1:0] _T_412; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311969.6]
  wire [1:0] _T_413; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311970.6]
  wire [2:0] _T_414; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311971.6]
  wire [2:0] _T_415; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311972.6]
  wire [3:0] _T_416; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311973.6]
  wire [7:0] _T_417; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311974.6]
  wire [7:0] _T_418; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311975.6]
  wire  _T_419; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311976.6]
  wire [3:0] _T_420; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311977.6]
  wire [3:0] _T_421; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311978.6]
  wire  _T_422; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311979.6]
  wire  _T_423; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311980.6]
  wire  _T_424; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311981.6]
  wire  _T_425; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311982.6]
  wire [1:0] _T_426; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311983.6]
  wire [1:0] _T_427; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311984.6]
  wire  _T_428; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311985.6]
  wire  _T_429; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311986.6]
  wire  _T_430; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311987.6]
  wire [1:0] _T_431; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311988.6]
  wire [1:0] _T_432; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311989.6]
  wire [1:0] _T_433; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311990.6]
  wire [2:0] _T_434; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311991.6]
  wire [3:0] _T_435; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311992.6]
  wire [3:0] _T_436; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311993.6]
  wire  _T_437; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311994.6]
  wire  _T_438; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311995.6]
  wire  _T_439; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311996.6]
  wire  _T_440; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311997.6]
  wire [1:0] _T_441; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311998.6]
  wire [1:0] _T_442; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311999.6]
  wire  _T_443; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312000.6]
  wire  _T_444; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312001.6]
  wire  _T_445; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312002.6]
  wire [1:0] _T_446; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312003.6]
  wire [1:0] _T_447; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312004.6]
  wire [1:0] _T_448; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312005.6]
  wire [2:0] _T_449; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312006.6]
  wire [2:0] _T_450; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312007.6]
  wire [3:0] _T_451; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312008.6]
  wire [3:0] _T_452; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312009.6]
  wire [4:0] _T_453; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312010.6]
  wire [4:0] _T_454; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312011.6]
  wire [5:0] _T_455; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312012.6]
  wire [6:0] _T_458; // @[Multiplier.scala 152:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312015.6]
  wire [6:0] _T_459; // @[Multiplier.scala 152:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312016.6]
  wire [5:0] _T_460; // @[Multiplier.scala 152:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312017.6]
  wire [5:0] _T_461; // @[Multiplier.scala 152:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312018.6]
  wire  _T_463; // @[Multiplier.scala 153:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312020.6]
  wire  _T_464; // @[Multiplier.scala 153:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312021.6]
  wire  _T_465; // @[Multiplier.scala 153:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312022.6]
  wire  _T_466; // @[Multiplier.scala 153:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312023.6]
  wire [126:0] _GEN_39; // @[Multiplier.scala 155:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312026.8]
  wire [126:0] _T_468; // @[Multiplier.scala 155:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312026.8]
  wire [128:0] _GEN_16; // @[Multiplier.scala 154:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312024.6]
  wire  _T_471; // @[Multiplier.scala 159:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312032.6]
  wire  _T_472; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312037.4]
  wire  _T_473; // @[Multiplier.scala 161:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312038.4]
  wire  _T_474; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312042.4]
  wire  _T_475; // @[Multiplier.scala 165:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312044.6]
  wire  _T_480; // @[Multiplier.scala 168:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312052.6]
  wire [2:0] _T_481; // @[Multiplier.scala 168:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312053.6]
  wire  _T_482; // @[Multiplier.scala 169:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312055.6]
  wire [64:0] _T_484; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312058.6]
  wire [2:0] _T_486; // @[Multiplier.scala 175:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312064.4]
  wire  outMul; // @[Multiplier.scala 175:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312067.4]
  wire  _T_489; // @[Multiplier.scala 78:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312068.4]
  wire  _T_492; // @[Multiplier.scala 176:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312071.4]
  wire [31:0] _T_493; // @[Multiplier.scala 176:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312072.4]
  wire [31:0] _T_494; // @[Multiplier.scala 176:86:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312073.4]
  wire [31:0] loOut; // @[Multiplier.scala 176:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312074.4]
  wire  _T_497; // @[Multiplier.scala 177:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312077.4]
  wire [31:0] _T_499; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312079.4]
  wire [31:0] hiOut; // @[Multiplier.scala 177:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312081.4]
  wire  _T_502; // @[Multiplier.scala 180:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312085.4]
  wire  _T_503; // @[Multiplier.scala 180:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312086.4]
  assign _T_22 = io_req_bits_fn & 4'h4; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311539.4]
  assign cmdMul = _T_22 == 4'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311540.4]
  assign _T_25 = io_req_bits_fn & 4'h5; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311542.4]
  assign _T_26 = _T_25 == 4'h1; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311543.4]
  assign _T_27 = io_req_bits_fn & 4'h2; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311544.4]
  assign _T_28 = _T_27 == 4'h2; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311545.4]
  assign cmdHi = _T_26 | _T_28; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311547.4]
  assign _T_31 = io_req_bits_fn & 4'h6; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311548.4]
  assign _T_32 = _T_31 == 4'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311549.4]
  assign _T_33 = io_req_bits_fn & 4'h1; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311550.4]
  assign _T_34 = _T_33 == 4'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311551.4]
  assign lhsSigned = _T_32 | _T_34; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311553.4]
  assign _T_38 = _T_25 == 4'h4; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311555.4]
  assign rhsSigned = _T_32 | _T_38; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311557.4]
  assign _T_41 = io_req_bits_dw == 1'h0; // @[Multiplier.scala 78:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311562.4]
  assign _T_43 = io_req_bits_in1[31]; // @[Multiplier.scala 81:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311564.4]
  assign _T_44 = io_req_bits_in1[63]; // @[Multiplier.scala 81:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311565.4]
  assign _T_45 = _T_41 ? _T_43 : _T_44; // @[Multiplier.scala 81:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311566.4]
  assign lhs_sign = lhsSigned & _T_45; // @[Multiplier.scala 81:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311567.4]
  assign _T_47 = lhs_sign ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311569.4]
  assign _T_48 = io_req_bits_in1[63:32]; // @[Multiplier.scala 82:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311570.4]
  assign _T_49 = _T_41 ? _T_47 : _T_48; // @[Multiplier.scala 82:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311571.4]
  assign _T_50 = io_req_bits_in1[31:0]; // @[Multiplier.scala 83:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311572.4]
  assign lhs_in = {_T_49,_T_50}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311573.4]
  assign _T_53 = io_req_bits_in2[31]; // @[Multiplier.scala 81:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311576.4]
  assign _T_54 = io_req_bits_in2[63]; // @[Multiplier.scala 81:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311577.4]
  assign _T_55 = _T_41 ? _T_53 : _T_54; // @[Multiplier.scala 81:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311578.4]
  assign rhs_sign = rhsSigned & _T_55; // @[Multiplier.scala 81:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311579.4]
  assign _T_57 = rhs_sign ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311581.4]
  assign _T_58 = io_req_bits_in2[63:32]; // @[Multiplier.scala 82:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311582.4]
  assign _T_59 = _T_41 ? _T_57 : _T_58; // @[Multiplier.scala 82:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311583.4]
  assign _T_60 = io_req_bits_in2[31:0]; // @[Multiplier.scala 83:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311584.4]
  assign rhs_in = {_T_59,_T_60}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311585.4]
  assign _T_61 = remainder[128:64]; // @[Multiplier.scala 88:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311586.4]
  assign _T_62 = _T_61 - divisor; // @[Multiplier.scala 88:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311587.4]
  assign _T_63 = $unsigned(_T_62); // @[Multiplier.scala 88:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311588.4]
  assign subtractor = _T_63[64:0]; // @[Multiplier.scala 88:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311589.4]
  assign _T_64 = remainder[128:65]; // @[Multiplier.scala 89:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311590.4]
  assign _T_65 = remainder[63:0]; // @[Multiplier.scala 89:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311591.4]
  assign result = resHi ? _T_64 : _T_65; // @[Multiplier.scala 89:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311592.4]
  assign _T_66 = 64'h0 - result; // @[Multiplier.scala 90:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311593.4]
  assign _T_67 = $unsigned(_T_66); // @[Multiplier.scala 90:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311594.4]
  assign negated_remainder = _T_67[63:0]; // @[Multiplier.scala 90:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311595.4]
  assign _T_68 = state == 3'h1; // @[Multiplier.scala 92:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311596.4]
  assign _T_69 = remainder[63]; // @[Multiplier.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311598.6]
  assign _T_70 = divisor[63]; // @[Multiplier.scala 96:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311602.6]
  assign _T_71 = state == 3'h5; // @[Multiplier.scala 101:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311608.4]
  assign _T_72 = state == 3'h2; // @[Multiplier.scala 106:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311614.4]
  assign _T_73 = remainder[129:65]; // @[Multiplier.scala 107:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311616.6]
  assign _T_75 = {_T_73,_T_65}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311618.6]
  assign _T_76 = remainder[64]; // @[Multiplier.scala 108:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311619.6]
  assign _T_77 = _T_75[63:0]; // @[Multiplier.scala 109:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311620.6]
  assign _T_78 = _T_75[128:64]; // @[Multiplier.scala 110:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311621.6]
  assign _T_79 = $signed(_T_78); // @[Multiplier.scala 110:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311622.6]
  assign _T_80 = $signed(divisor); // @[Multiplier.scala 111:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311623.6]
  assign _T_81 = _T_77[7:0]; // @[Multiplier.scala 112:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311624.6]
  assign _T_82 = {_T_76,_T_81}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311625.6]
  assign _T_83 = $signed(_T_82); // @[Multiplier.scala 112:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311626.6]
  assign _GEN_37 = {{56{_T_83[8]}},_T_83}; // @[Multiplier.scala 112:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311627.6]
  assign _T_84 = $signed(_GEN_37) * $signed(_T_80); // @[Multiplier.scala 112:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311627.6]
  assign _GEN_38 = {{9{_T_79[64]}},_T_79}; // @[Multiplier.scala 112:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311628.6]
  assign _T_86 = $signed(_T_84) + $signed(_GEN_38); // @[Multiplier.scala 112:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311629.6]
  assign _T_87 = $signed(_T_86); // @[Multiplier.scala 112:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311630.6]
  assign _T_88 = _T_77[63:8]; // @[Multiplier.scala 113:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311631.6]
  assign _T_89 = $unsigned(_T_87); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311632.6]
  assign _T_90 = {_T_89,_T_88}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311633.6]
  assign _T_91 = count == 7'h6; // @[Multiplier.scala 114:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311634.6]
  assign _T_92 = _T_91 & neg_out; // @[Multiplier.scala 114:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311635.6]
  assign _T_93 = count * 7'h8; // @[Multiplier.scala 116:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311636.6]
  assign _T_94 = _T_93[5:0]; // @[Multiplier.scala 116:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311637.6]
  assign _T_95 = $signed(-65'sh10000000000000000) >>> _T_94; // @[Multiplier.scala 116:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311638.6]
  assign _T_96 = _T_95[63:0]; // @[Multiplier.scala 116:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311639.6]
  assign _T_97 = count != 7'h7; // @[Multiplier.scala 117:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311640.6]
  assign _T_99 = count != 7'h0; // @[Multiplier.scala 117:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311642.6]
  assign _T_100 = _T_97 & _T_99; // @[Multiplier.scala 117:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311643.6]
  assign _T_101 = isHi == 1'h0; // @[Multiplier.scala 118:7:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311644.6]
  assign _T_102 = _T_100 & _T_101; // @[Multiplier.scala 117:87:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311645.6]
  assign _T_103 = ~ _T_96; // @[Multiplier.scala 118:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311646.6]
  assign _T_104 = _T_77 & _T_103; // @[Multiplier.scala 118:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311647.6]
  assign _T_105 = _T_104 == 64'h0; // @[Multiplier.scala 118:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311648.6]
  assign _T_106 = _T_102 & _T_105; // @[Multiplier.scala 118:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311649.6]
  assign _T_108 = 11'h40 - _T_93; // @[Multiplier.scala 119:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311651.6]
  assign _T_109 = $unsigned(_T_108); // @[Multiplier.scala 119:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311652.6]
  assign _T_110 = _T_109[10:0]; // @[Multiplier.scala 119:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311653.6]
  assign _T_111 = _T_110[5:0]; // @[Multiplier.scala 119:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311654.6]
  assign _T_112 = _T_75 >> _T_111; // @[Multiplier.scala 119:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311655.6]
  assign _T_113 = _T_90[128:64]; // @[Multiplier.scala 120:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311656.6]
  assign _T_114 = _T_106 ? {{1'd0}, _T_112} : _T_90; // @[Multiplier.scala 120:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311657.6]
  assign _T_115 = _T_114[63:0]; // @[Multiplier.scala 120:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311658.6]
  assign _T_116 = {_T_113,_T_115}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311659.6]
  assign _T_117 = _T_116[128:64]; // @[Multiplier.scala 121:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311660.6]
  assign _T_118 = _T_116[63:0]; // @[Multiplier.scala 121:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311661.6]
  assign _T_119 = {_T_117,_T_92}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311662.6]
  assign _T_120 = {_T_119,_T_118}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311663.6]
  assign _T_122 = count + 7'h1; // @[Multiplier.scala 123:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311666.6]
  assign _T_123 = count == 7'h7; // @[Multiplier.scala 124:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311668.6]
  assign _T_124 = _T_106 | _T_123; // @[Multiplier.scala 124:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311669.6]
  assign _T_125 = state == 3'h3; // @[Multiplier.scala 129:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311675.4]
  assign _T_126 = subtractor[64]; // @[Multiplier.scala 133:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311677.6]
  assign _T_127 = remainder[127:64]; // @[Multiplier.scala 134:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311678.6]
  assign _T_128 = subtractor[63:0]; // @[Multiplier.scala 134:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311679.6]
  assign _T_129 = _T_126 ? _T_127 : _T_128; // @[Multiplier.scala 134:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311680.6]
  assign _T_131 = _T_126 == 1'h0; // @[Multiplier.scala 134:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311682.6]
  assign _T_132 = {_T_129,_T_65}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311683.6]
  assign _T_133 = {_T_132,_T_131}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311684.6]
  assign _T_134 = count == 7'h40; // @[Multiplier.scala 138:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311686.6]
  assign _T_138 = count == 7'h0; // @[Multiplier.scala 146:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311695.6]
  assign _T_141 = _T_138 & _T_131; // @[Multiplier.scala 146:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311698.6]
  assign _T_143 = divisor[63:0]; // @[Multiplier.scala 150:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311700.6]
  assign _T_144 = _T_143[63:32]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311701.6]
  assign _T_145 = _T_143[31:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311702.6]
  assign _T_146 = _T_144 != 32'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311703.6]
  assign _T_147 = _T_144[31:16]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311704.6]
  assign _T_148 = _T_144[15:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311705.6]
  assign _T_149 = _T_147 != 16'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311706.6]
  assign _T_150 = _T_147[15:8]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311707.6]
  assign _T_151 = _T_147[7:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311708.6]
  assign _T_152 = _T_150 != 8'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311709.6]
  assign _T_153 = _T_150[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311710.6]
  assign _T_154 = _T_150[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311711.6]
  assign _T_155 = _T_153 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311712.6]
  assign _T_156 = _T_153[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311713.6]
  assign _T_157 = _T_153[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311714.6]
  assign _T_158 = _T_153[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311715.6]
  assign _T_159 = _T_157 ? 2'h2 : {{1'd0}, _T_158}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311716.6]
  assign _T_160 = _T_156 ? 2'h3 : _T_159; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311717.6]
  assign _T_161 = _T_154[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311718.6]
  assign _T_162 = _T_154[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311719.6]
  assign _T_163 = _T_154[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311720.6]
  assign _T_164 = _T_162 ? 2'h2 : {{1'd0}, _T_163}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311721.6]
  assign _T_165 = _T_161 ? 2'h3 : _T_164; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311722.6]
  assign _T_166 = _T_155 ? _T_160 : _T_165; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311723.6]
  assign _T_167 = {_T_155,_T_166}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311724.6]
  assign _T_168 = _T_151[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311725.6]
  assign _T_169 = _T_151[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311726.6]
  assign _T_170 = _T_168 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311727.6]
  assign _T_171 = _T_168[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311728.6]
  assign _T_172 = _T_168[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311729.6]
  assign _T_173 = _T_168[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311730.6]
  assign _T_174 = _T_172 ? 2'h2 : {{1'd0}, _T_173}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311731.6]
  assign _T_175 = _T_171 ? 2'h3 : _T_174; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311732.6]
  assign _T_176 = _T_169[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311733.6]
  assign _T_177 = _T_169[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311734.6]
  assign _T_178 = _T_169[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311735.6]
  assign _T_179 = _T_177 ? 2'h2 : {{1'd0}, _T_178}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311736.6]
  assign _T_180 = _T_176 ? 2'h3 : _T_179; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311737.6]
  assign _T_181 = _T_170 ? _T_175 : _T_180; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311738.6]
  assign _T_182 = {_T_170,_T_181}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311739.6]
  assign _T_183 = _T_152 ? _T_167 : _T_182; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311740.6]
  assign _T_184 = {_T_152,_T_183}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311741.6]
  assign _T_185 = _T_148[15:8]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311742.6]
  assign _T_186 = _T_148[7:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311743.6]
  assign _T_187 = _T_185 != 8'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311744.6]
  assign _T_188 = _T_185[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311745.6]
  assign _T_189 = _T_185[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311746.6]
  assign _T_190 = _T_188 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311747.6]
  assign _T_191 = _T_188[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311748.6]
  assign _T_192 = _T_188[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311749.6]
  assign _T_193 = _T_188[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311750.6]
  assign _T_194 = _T_192 ? 2'h2 : {{1'd0}, _T_193}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311751.6]
  assign _T_195 = _T_191 ? 2'h3 : _T_194; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311752.6]
  assign _T_196 = _T_189[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311753.6]
  assign _T_197 = _T_189[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311754.6]
  assign _T_198 = _T_189[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311755.6]
  assign _T_199 = _T_197 ? 2'h2 : {{1'd0}, _T_198}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311756.6]
  assign _T_200 = _T_196 ? 2'h3 : _T_199; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311757.6]
  assign _T_201 = _T_190 ? _T_195 : _T_200; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311758.6]
  assign _T_202 = {_T_190,_T_201}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311759.6]
  assign _T_203 = _T_186[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311760.6]
  assign _T_204 = _T_186[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311761.6]
  assign _T_205 = _T_203 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311762.6]
  assign _T_206 = _T_203[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311763.6]
  assign _T_207 = _T_203[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311764.6]
  assign _T_208 = _T_203[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311765.6]
  assign _T_209 = _T_207 ? 2'h2 : {{1'd0}, _T_208}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311766.6]
  assign _T_210 = _T_206 ? 2'h3 : _T_209; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311767.6]
  assign _T_211 = _T_204[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311768.6]
  assign _T_212 = _T_204[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311769.6]
  assign _T_213 = _T_204[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311770.6]
  assign _T_214 = _T_212 ? 2'h2 : {{1'd0}, _T_213}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311771.6]
  assign _T_215 = _T_211 ? 2'h3 : _T_214; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311772.6]
  assign _T_216 = _T_205 ? _T_210 : _T_215; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311773.6]
  assign _T_217 = {_T_205,_T_216}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311774.6]
  assign _T_218 = _T_187 ? _T_202 : _T_217; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311775.6]
  assign _T_219 = {_T_187,_T_218}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311776.6]
  assign _T_220 = _T_149 ? _T_184 : _T_219; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311777.6]
  assign _T_221 = {_T_149,_T_220}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311778.6]
  assign _T_222 = _T_145[31:16]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311779.6]
  assign _T_223 = _T_145[15:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311780.6]
  assign _T_224 = _T_222 != 16'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311781.6]
  assign _T_225 = _T_222[15:8]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311782.6]
  assign _T_226 = _T_222[7:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311783.6]
  assign _T_227 = _T_225 != 8'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311784.6]
  assign _T_228 = _T_225[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311785.6]
  assign _T_229 = _T_225[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311786.6]
  assign _T_230 = _T_228 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311787.6]
  assign _T_231 = _T_228[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311788.6]
  assign _T_232 = _T_228[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311789.6]
  assign _T_233 = _T_228[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311790.6]
  assign _T_234 = _T_232 ? 2'h2 : {{1'd0}, _T_233}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311791.6]
  assign _T_235 = _T_231 ? 2'h3 : _T_234; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311792.6]
  assign _T_236 = _T_229[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311793.6]
  assign _T_237 = _T_229[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311794.6]
  assign _T_238 = _T_229[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311795.6]
  assign _T_239 = _T_237 ? 2'h2 : {{1'd0}, _T_238}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311796.6]
  assign _T_240 = _T_236 ? 2'h3 : _T_239; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311797.6]
  assign _T_241 = _T_230 ? _T_235 : _T_240; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311798.6]
  assign _T_242 = {_T_230,_T_241}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311799.6]
  assign _T_243 = _T_226[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311800.6]
  assign _T_244 = _T_226[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311801.6]
  assign _T_245 = _T_243 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311802.6]
  assign _T_246 = _T_243[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311803.6]
  assign _T_247 = _T_243[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311804.6]
  assign _T_248 = _T_243[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311805.6]
  assign _T_249 = _T_247 ? 2'h2 : {{1'd0}, _T_248}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311806.6]
  assign _T_250 = _T_246 ? 2'h3 : _T_249; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311807.6]
  assign _T_251 = _T_244[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311808.6]
  assign _T_252 = _T_244[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311809.6]
  assign _T_253 = _T_244[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311810.6]
  assign _T_254 = _T_252 ? 2'h2 : {{1'd0}, _T_253}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311811.6]
  assign _T_255 = _T_251 ? 2'h3 : _T_254; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311812.6]
  assign _T_256 = _T_245 ? _T_250 : _T_255; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311813.6]
  assign _T_257 = {_T_245,_T_256}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311814.6]
  assign _T_258 = _T_227 ? _T_242 : _T_257; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311815.6]
  assign _T_259 = {_T_227,_T_258}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311816.6]
  assign _T_260 = _T_223[15:8]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311817.6]
  assign _T_261 = _T_223[7:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311818.6]
  assign _T_262 = _T_260 != 8'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311819.6]
  assign _T_263 = _T_260[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311820.6]
  assign _T_264 = _T_260[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311821.6]
  assign _T_265 = _T_263 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311822.6]
  assign _T_266 = _T_263[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311823.6]
  assign _T_267 = _T_263[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311824.6]
  assign _T_268 = _T_263[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311825.6]
  assign _T_269 = _T_267 ? 2'h2 : {{1'd0}, _T_268}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311826.6]
  assign _T_270 = _T_266 ? 2'h3 : _T_269; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311827.6]
  assign _T_271 = _T_264[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311828.6]
  assign _T_272 = _T_264[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311829.6]
  assign _T_273 = _T_264[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311830.6]
  assign _T_274 = _T_272 ? 2'h2 : {{1'd0}, _T_273}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311831.6]
  assign _T_275 = _T_271 ? 2'h3 : _T_274; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311832.6]
  assign _T_276 = _T_265 ? _T_270 : _T_275; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311833.6]
  assign _T_277 = {_T_265,_T_276}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311834.6]
  assign _T_278 = _T_261[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311835.6]
  assign _T_279 = _T_261[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311836.6]
  assign _T_280 = _T_278 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311837.6]
  assign _T_281 = _T_278[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311838.6]
  assign _T_282 = _T_278[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311839.6]
  assign _T_283 = _T_278[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311840.6]
  assign _T_284 = _T_282 ? 2'h2 : {{1'd0}, _T_283}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311841.6]
  assign _T_285 = _T_281 ? 2'h3 : _T_284; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311842.6]
  assign _T_286 = _T_279[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311843.6]
  assign _T_287 = _T_279[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311844.6]
  assign _T_288 = _T_279[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311845.6]
  assign _T_289 = _T_287 ? 2'h2 : {{1'd0}, _T_288}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311846.6]
  assign _T_290 = _T_286 ? 2'h3 : _T_289; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311847.6]
  assign _T_291 = _T_280 ? _T_285 : _T_290; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311848.6]
  assign _T_292 = {_T_280,_T_291}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311849.6]
  assign _T_293 = _T_262 ? _T_277 : _T_292; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311850.6]
  assign _T_294 = {_T_262,_T_293}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311851.6]
  assign _T_295 = _T_224 ? _T_259 : _T_294; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311852.6]
  assign _T_296 = {_T_224,_T_295}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311853.6]
  assign _T_297 = _T_146 ? _T_221 : _T_296; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311854.6]
  assign _T_298 = {_T_146,_T_297}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311855.6]
  assign _T_301 = _T_65[63:32]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311858.6]
  assign _T_302 = _T_65[31:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311859.6]
  assign _T_303 = _T_301 != 32'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311860.6]
  assign _T_304 = _T_301[31:16]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311861.6]
  assign _T_305 = _T_301[15:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311862.6]
  assign _T_306 = _T_304 != 16'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311863.6]
  assign _T_307 = _T_304[15:8]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311864.6]
  assign _T_308 = _T_304[7:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311865.6]
  assign _T_309 = _T_307 != 8'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311866.6]
  assign _T_310 = _T_307[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311867.6]
  assign _T_311 = _T_307[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311868.6]
  assign _T_312 = _T_310 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311869.6]
  assign _T_313 = _T_310[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311870.6]
  assign _T_314 = _T_310[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311871.6]
  assign _T_315 = _T_310[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311872.6]
  assign _T_316 = _T_314 ? 2'h2 : {{1'd0}, _T_315}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311873.6]
  assign _T_317 = _T_313 ? 2'h3 : _T_316; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311874.6]
  assign _T_318 = _T_311[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311875.6]
  assign _T_319 = _T_311[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311876.6]
  assign _T_320 = _T_311[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311877.6]
  assign _T_321 = _T_319 ? 2'h2 : {{1'd0}, _T_320}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311878.6]
  assign _T_322 = _T_318 ? 2'h3 : _T_321; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311879.6]
  assign _T_323 = _T_312 ? _T_317 : _T_322; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311880.6]
  assign _T_324 = {_T_312,_T_323}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311881.6]
  assign _T_325 = _T_308[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311882.6]
  assign _T_326 = _T_308[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311883.6]
  assign _T_327 = _T_325 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311884.6]
  assign _T_328 = _T_325[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311885.6]
  assign _T_329 = _T_325[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311886.6]
  assign _T_330 = _T_325[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311887.6]
  assign _T_331 = _T_329 ? 2'h2 : {{1'd0}, _T_330}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311888.6]
  assign _T_332 = _T_328 ? 2'h3 : _T_331; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311889.6]
  assign _T_333 = _T_326[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311890.6]
  assign _T_334 = _T_326[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311891.6]
  assign _T_335 = _T_326[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311892.6]
  assign _T_336 = _T_334 ? 2'h2 : {{1'd0}, _T_335}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311893.6]
  assign _T_337 = _T_333 ? 2'h3 : _T_336; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311894.6]
  assign _T_338 = _T_327 ? _T_332 : _T_337; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311895.6]
  assign _T_339 = {_T_327,_T_338}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311896.6]
  assign _T_340 = _T_309 ? _T_324 : _T_339; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311897.6]
  assign _T_341 = {_T_309,_T_340}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311898.6]
  assign _T_342 = _T_305[15:8]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311899.6]
  assign _T_343 = _T_305[7:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311900.6]
  assign _T_344 = _T_342 != 8'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311901.6]
  assign _T_345 = _T_342[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311902.6]
  assign _T_346 = _T_342[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311903.6]
  assign _T_347 = _T_345 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311904.6]
  assign _T_348 = _T_345[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311905.6]
  assign _T_349 = _T_345[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311906.6]
  assign _T_350 = _T_345[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311907.6]
  assign _T_351 = _T_349 ? 2'h2 : {{1'd0}, _T_350}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311908.6]
  assign _T_352 = _T_348 ? 2'h3 : _T_351; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311909.6]
  assign _T_353 = _T_346[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311910.6]
  assign _T_354 = _T_346[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311911.6]
  assign _T_355 = _T_346[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311912.6]
  assign _T_356 = _T_354 ? 2'h2 : {{1'd0}, _T_355}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311913.6]
  assign _T_357 = _T_353 ? 2'h3 : _T_356; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311914.6]
  assign _T_358 = _T_347 ? _T_352 : _T_357; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311915.6]
  assign _T_359 = {_T_347,_T_358}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311916.6]
  assign _T_360 = _T_343[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311917.6]
  assign _T_361 = _T_343[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311918.6]
  assign _T_362 = _T_360 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311919.6]
  assign _T_363 = _T_360[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311920.6]
  assign _T_364 = _T_360[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311921.6]
  assign _T_365 = _T_360[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311922.6]
  assign _T_366 = _T_364 ? 2'h2 : {{1'd0}, _T_365}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311923.6]
  assign _T_367 = _T_363 ? 2'h3 : _T_366; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311924.6]
  assign _T_368 = _T_361[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311925.6]
  assign _T_369 = _T_361[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311926.6]
  assign _T_370 = _T_361[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311927.6]
  assign _T_371 = _T_369 ? 2'h2 : {{1'd0}, _T_370}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311928.6]
  assign _T_372 = _T_368 ? 2'h3 : _T_371; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311929.6]
  assign _T_373 = _T_362 ? _T_367 : _T_372; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311930.6]
  assign _T_374 = {_T_362,_T_373}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311931.6]
  assign _T_375 = _T_344 ? _T_359 : _T_374; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311932.6]
  assign _T_376 = {_T_344,_T_375}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311933.6]
  assign _T_377 = _T_306 ? _T_341 : _T_376; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311934.6]
  assign _T_378 = {_T_306,_T_377}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311935.6]
  assign _T_379 = _T_302[31:16]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311936.6]
  assign _T_380 = _T_302[15:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311937.6]
  assign _T_381 = _T_379 != 16'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311938.6]
  assign _T_382 = _T_379[15:8]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311939.6]
  assign _T_383 = _T_379[7:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311940.6]
  assign _T_384 = _T_382 != 8'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311941.6]
  assign _T_385 = _T_382[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311942.6]
  assign _T_386 = _T_382[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311943.6]
  assign _T_387 = _T_385 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311944.6]
  assign _T_388 = _T_385[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311945.6]
  assign _T_389 = _T_385[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311946.6]
  assign _T_390 = _T_385[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311947.6]
  assign _T_391 = _T_389 ? 2'h2 : {{1'd0}, _T_390}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311948.6]
  assign _T_392 = _T_388 ? 2'h3 : _T_391; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311949.6]
  assign _T_393 = _T_386[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311950.6]
  assign _T_394 = _T_386[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311951.6]
  assign _T_395 = _T_386[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311952.6]
  assign _T_396 = _T_394 ? 2'h2 : {{1'd0}, _T_395}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311953.6]
  assign _T_397 = _T_393 ? 2'h3 : _T_396; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311954.6]
  assign _T_398 = _T_387 ? _T_392 : _T_397; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311955.6]
  assign _T_399 = {_T_387,_T_398}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311956.6]
  assign _T_400 = _T_383[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311957.6]
  assign _T_401 = _T_383[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311958.6]
  assign _T_402 = _T_400 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311959.6]
  assign _T_403 = _T_400[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311960.6]
  assign _T_404 = _T_400[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311961.6]
  assign _T_405 = _T_400[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311962.6]
  assign _T_406 = _T_404 ? 2'h2 : {{1'd0}, _T_405}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311963.6]
  assign _T_407 = _T_403 ? 2'h3 : _T_406; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311964.6]
  assign _T_408 = _T_401[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311965.6]
  assign _T_409 = _T_401[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311966.6]
  assign _T_410 = _T_401[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311967.6]
  assign _T_411 = _T_409 ? 2'h2 : {{1'd0}, _T_410}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311968.6]
  assign _T_412 = _T_408 ? 2'h3 : _T_411; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311969.6]
  assign _T_413 = _T_402 ? _T_407 : _T_412; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311970.6]
  assign _T_414 = {_T_402,_T_413}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311971.6]
  assign _T_415 = _T_384 ? _T_399 : _T_414; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311972.6]
  assign _T_416 = {_T_384,_T_415}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311973.6]
  assign _T_417 = _T_380[15:8]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311974.6]
  assign _T_418 = _T_380[7:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311975.6]
  assign _T_419 = _T_417 != 8'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311976.6]
  assign _T_420 = _T_417[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311977.6]
  assign _T_421 = _T_417[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311978.6]
  assign _T_422 = _T_420 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311979.6]
  assign _T_423 = _T_420[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311980.6]
  assign _T_424 = _T_420[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311981.6]
  assign _T_425 = _T_420[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311982.6]
  assign _T_426 = _T_424 ? 2'h2 : {{1'd0}, _T_425}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311983.6]
  assign _T_427 = _T_423 ? 2'h3 : _T_426; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311984.6]
  assign _T_428 = _T_421[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311985.6]
  assign _T_429 = _T_421[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311986.6]
  assign _T_430 = _T_421[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311987.6]
  assign _T_431 = _T_429 ? 2'h2 : {{1'd0}, _T_430}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311988.6]
  assign _T_432 = _T_428 ? 2'h3 : _T_431; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311989.6]
  assign _T_433 = _T_422 ? _T_427 : _T_432; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311990.6]
  assign _T_434 = {_T_422,_T_433}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311991.6]
  assign _T_435 = _T_418[7:4]; // @[CircuitMath.scala 35:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311992.6]
  assign _T_436 = _T_418[3:0]; // @[CircuitMath.scala 36:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311993.6]
  assign _T_437 = _T_435 != 4'h0; // @[CircuitMath.scala 37:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311994.6]
  assign _T_438 = _T_435[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311995.6]
  assign _T_439 = _T_435[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311996.6]
  assign _T_440 = _T_435[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311997.6]
  assign _T_441 = _T_439 ? 2'h2 : {{1'd0}, _T_440}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311998.6]
  assign _T_442 = _T_438 ? 2'h3 : _T_441; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@311999.6]
  assign _T_443 = _T_436[3]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312000.6]
  assign _T_444 = _T_436[2]; // @[CircuitMath.scala 32:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312001.6]
  assign _T_445 = _T_436[1]; // @[CircuitMath.scala 30:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312002.6]
  assign _T_446 = _T_444 ? 2'h2 : {{1'd0}, _T_445}; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312003.6]
  assign _T_447 = _T_443 ? 2'h3 : _T_446; // @[CircuitMath.scala 32:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312004.6]
  assign _T_448 = _T_437 ? _T_442 : _T_447; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312005.6]
  assign _T_449 = {_T_437,_T_448}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312006.6]
  assign _T_450 = _T_419 ? _T_434 : _T_449; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312007.6]
  assign _T_451 = {_T_419,_T_450}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312008.6]
  assign _T_452 = _T_381 ? _T_416 : _T_451; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312009.6]
  assign _T_453 = {_T_381,_T_452}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312010.6]
  assign _T_454 = _T_303 ? _T_378 : _T_453; // @[CircuitMath.scala 38:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312011.6]
  assign _T_455 = {_T_303,_T_454}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312012.6]
  assign _T_458 = _T_455 - _T_298; // @[Multiplier.scala 152:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312015.6]
  assign _T_459 = $unsigned(_T_458); // @[Multiplier.scala 152:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312016.6]
  assign _T_460 = _T_459[5:0]; // @[Multiplier.scala 152:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312017.6]
  assign _T_461 = ~ _T_460; // @[Multiplier.scala 152:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312018.6]
  assign _T_463 = _T_141 == 1'h0; // @[Multiplier.scala 153:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312020.6]
  assign _T_464 = _T_138 & _T_463; // @[Multiplier.scala 153:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312021.6]
  assign _T_465 = _T_461 >= 6'h1; // @[Multiplier.scala 153:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312022.6]
  assign _T_466 = _T_464 & _T_465; // @[Multiplier.scala 153:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312023.6]
  assign _GEN_39 = {{63'd0}, _T_65}; // @[Multiplier.scala 155:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312026.8]
  assign _T_468 = _GEN_39 << _T_461; // @[Multiplier.scala 155:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312026.8]
  assign _GEN_16 = _T_466 ? {{2'd0}, _T_468} : _T_133; // @[Multiplier.scala 154:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312024.6]
  assign _T_471 = _T_141 & _T_101; // @[Multiplier.scala 159:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312032.6]
  assign _T_472 = io_resp_ready & io_resp_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312037.4]
  assign _T_473 = _T_472 | io_kill; // @[Multiplier.scala 161:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312038.4]
  assign _T_474 = io_req_ready & io_req_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312042.4]
  assign _T_475 = lhs_sign | rhs_sign; // @[Multiplier.scala 165:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312044.6]
  assign _T_480 = cmdMul & _T_41; // @[Multiplier.scala 168:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312052.6]
  assign _T_481 = _T_480 ? 3'h4 : 3'h0; // @[Multiplier.scala 168:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312053.6]
  assign _T_482 = lhs_sign != rhs_sign; // @[Multiplier.scala 169:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312055.6]
  assign _T_484 = {rhs_sign,rhs_in}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312058.6]
  assign _T_486 = state & 3'h1; // @[Multiplier.scala 175:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312064.4]
  assign outMul = _T_486 == 3'h0; // @[Multiplier.scala 175:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312067.4]
  assign _T_489 = req_dw == 1'h0; // @[Multiplier.scala 78:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312068.4]
  assign _T_492 = _T_489 & outMul; // @[Multiplier.scala 176:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312071.4]
  assign _T_493 = result[63:32]; // @[Multiplier.scala 176:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312072.4]
  assign _T_494 = result[31:0]; // @[Multiplier.scala 176:86:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312073.4]
  assign loOut = _T_492 ? _T_493 : _T_494; // @[Multiplier.scala 176:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312074.4]
  assign _T_497 = loOut[31]; // @[Multiplier.scala 177:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312077.4]
  assign _T_499 = _T_497 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312079.4]
  assign hiOut = _T_489 ? _T_499 : _T_493; // @[Multiplier.scala 177:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312081.4]
  assign _T_502 = state == 3'h6; // @[Multiplier.scala 180:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312085.4]
  assign _T_503 = state == 3'h7; // @[Multiplier.scala 180:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312086.4]
  assign io_req_ready = state == 3'h0; // @[Multiplier.scala 181:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312090.4]
  assign io_resp_valid = _T_502 | _T_503; // @[Multiplier.scala 180:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312088.4]
  assign io_resp_bits_data = {hiOut,loOut}; // @[Multiplier.scala 179:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312084.4]
  assign io_resp_bits_tag = req_tag; // @[Multiplier.scala 178:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312082.4]
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
  state = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  req_dw = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  req_tag = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  count = _RAND_3[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  neg_out = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  isHi = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  resHi = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {3{`RANDOM}};
  divisor = _RAND_7[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {5{`RANDOM}};
  remainder = _RAND_8[129:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
    end else begin
      if (_T_474) begin
        if (cmdMul) begin
          state <= 3'h2;
        end else begin
          if (_T_475) begin
            state <= 3'h1;
          end else begin
            state <= 3'h3;
          end
        end
      end else begin
        if (_T_473) begin
          state <= 3'h0;
        end else begin
          if (_T_125) begin
            if (_T_134) begin
              if (neg_out) begin
                state <= 3'h5;
              end else begin
                state <= 3'h7;
              end
            end else begin
              if (_T_72) begin
                if (_T_124) begin
                  state <= 3'h6;
                end else begin
                  if (_T_71) begin
                    state <= 3'h7;
                  end else begin
                    if (_T_68) begin
                      state <= 3'h3;
                    end
                  end
                end
              end else begin
                if (_T_71) begin
                  state <= 3'h7;
                end else begin
                  if (_T_68) begin
                    state <= 3'h3;
                  end
                end
              end
            end
          end else begin
            if (_T_72) begin
              if (_T_124) begin
                state <= 3'h6;
              end else begin
                if (_T_71) begin
                  state <= 3'h7;
                end else begin
                  if (_T_68) begin
                    state <= 3'h3;
                  end
                end
              end
            end else begin
              if (_T_71) begin
                state <= 3'h7;
              end else begin
                if (_T_68) begin
                  state <= 3'h3;
                end
              end
            end
          end
        end
      end
    end
    if (_T_474) begin
      req_dw <= io_req_bits_dw;
    end
    if (_T_474) begin
      req_tag <= io_req_bits_tag;
    end
    if (_T_474) begin
      count <= {{4'd0}, _T_481};
    end else begin
      if (_T_125) begin
        if (_T_466) begin
          count <= {{1'd0}, _T_461};
        end else begin
          count <= _T_122;
        end
      end else begin
        if (_T_72) begin
          count <= _T_122;
        end
      end
    end
    if (_T_474) begin
      if (cmdHi) begin
        neg_out <= lhs_sign;
      end else begin
        neg_out <= _T_482;
      end
    end else begin
      if (_T_125) begin
        if (_T_471) begin
          neg_out <= 1'h0;
        end
      end
    end
    if (_T_474) begin
      isHi <= cmdHi;
    end
    if (_T_474) begin
      resHi <= 1'h0;
    end else begin
      if (_T_125) begin
        if (_T_134) begin
          resHi <= isHi;
        end else begin
          if (_T_72) begin
            if (_T_124) begin
              resHi <= isHi;
            end else begin
              if (_T_71) begin
                resHi <= 1'h0;
              end
            end
          end else begin
            if (_T_71) begin
              resHi <= 1'h0;
            end
          end
        end
      end else begin
        if (_T_72) begin
          if (_T_124) begin
            resHi <= isHi;
          end else begin
            if (_T_71) begin
              resHi <= 1'h0;
            end
          end
        end else begin
          if (_T_71) begin
            resHi <= 1'h0;
          end
        end
      end
    end
    if (_T_474) begin
      divisor <= _T_484;
    end else begin
      if (_T_68) begin
        if (_T_70) begin
          divisor <= subtractor;
        end
      end
    end
    if (_T_474) begin
      remainder <= {{66'd0}, lhs_in};
    end else begin
      if (_T_125) begin
        remainder <= {{1'd0}, _GEN_16};
      end else begin
        if (_T_72) begin
          remainder <= _T_120;
        end else begin
          if (_T_71) begin
            remainder <= {{66'd0}, negated_remainder};
          end else begin
            if (_T_68) begin
              if (_T_69) begin
                remainder <= {{66'd0}, negated_remainder};
              end
            end
          end
        end
      end
    end
  end
endmodule