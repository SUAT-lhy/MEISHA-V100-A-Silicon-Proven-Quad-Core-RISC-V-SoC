module FPToFP( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298648.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298649.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298650.4]
  input         io_in_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298651.4]
  input         io_in_bits_ren2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298651.4]
  input         io_in_bits_singleOut, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298651.4]
  input         io_in_bits_wflags, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298651.4]
  input  [2:0]  io_in_bits_rm, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298651.4]
  input  [64:0] io_in_bits_in1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298651.4]
  input  [64:0] io_in_bits_in2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298651.4]
  output [64:0] io_out_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298651.4]
  output [4:0]  io_out_bits_exc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298651.4]
  input         io_lt // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298651.4]
);
  wire [64:0] RecFNToRecFN_io_in; // @[FPU.scala 546:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298784.8]
  wire [2:0] RecFNToRecFN_io_roundingMode; // @[FPU.scala 546:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298784.8]
  wire [32:0] RecFNToRecFN_io_out; // @[FPU.scala 546:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298784.8]
  wire [4:0] RecFNToRecFN_io_exceptionFlags; // @[FPU.scala 546:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298784.8]
  reg  in_valid; // @[Valid.scala 48:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298656.4]
  reg [31:0] _RAND_0;
  reg  in_bits_ren2; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298658.4]
  reg [31:0] _RAND_1;
  reg  in_bits_singleOut; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298658.4]
  reg [31:0] _RAND_2;
  reg  in_bits_wflags; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298658.4]
  reg [31:0] _RAND_3;
  reg [2:0] in_bits_rm; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298658.4]
  reg [31:0] _RAND_4;
  reg [64:0] in_bits_in1; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298658.4]
  reg [95:0] _RAND_5;
  reg [64:0] in_bits_in2; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298658.4]
  reg [95:0] _RAND_6;
  wire  _T_19; // @[FPU.scala 509:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298687.4]
  wire [64:0] _T_20; // @[FPU.scala 509:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298688.4]
  wire  _T_21; // @[FPU.scala 509:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298689.4]
  wire [64:0] _T_22; // @[FPU.scala 509:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298690.4]
  wire [64:0] _T_23; // @[FPU.scala 509:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298691.4]
  wire [64:0] signNum; // @[FPU.scala 509:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298692.4]
  wire  _T_24; // @[FPU.scala 510:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298693.4]
  wire [63:0] _T_25; // @[FPU.scala 510:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298694.4]
  wire [64:0] fsgnj; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298695.4]
  wire [2:0] _T_27; // @[FPU.scala 197:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298701.6]
  wire [2:0] _T_28; // @[FPU.scala 197:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298702.6]
  wire  _T_29; // @[FPU.scala 197:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298703.6]
  wire [2:0] _T_30; // @[FPU.scala 197:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298704.6]
  wire [2:0] _T_31; // @[FPU.scala 197:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298705.6]
  wire  _T_32; // @[FPU.scala 197:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298706.6]
  wire  _T_36; // @[FPU.scala 198:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298710.6]
  wire  _T_37; // @[FPU.scala 198:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298711.6]
  wire  _T_38; // @[FPU.scala 198:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298712.6]
  wire  _T_42; // @[FPU.scala 198:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298716.6]
  wire  _T_43; // @[FPU.scala 198:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298717.6]
  wire  _T_44; // @[FPU.scala 198:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298718.6]
  wire  _T_45; // @[FPU.scala 519:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298719.6]
  wire  _T_46; // @[FPU.scala 520:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298720.6]
  wire  _T_48; // @[FPU.scala 521:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298722.6]
  wire  _T_49; // @[FPU.scala 521:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298723.6]
  wire  _T_50; // @[FPU.scala 521:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298724.6]
  wire  _T_51; // @[FPU.scala 521:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298725.6]
  wire [4:0] _GEN_33; // @[FPU.scala 522:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298726.6]
  wire [4:0] _T_52; // @[FPU.scala 522:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298726.6]
  wire [64:0] _T_53; // @[FPU.scala 523:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298728.6]
  wire [64:0] _T_54; // @[FPU.scala 523:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298729.6]
  wire [64:0] _GEN_23; // @[FPU.scala 516:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298700.4]
  wire  outTag; // @[FPU.scala 527:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298733.4]
  wire  _T_56; // @[FPU.scala 530:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298737.4]
  wire  _T_79; // @[FPU.scala 535:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298763.4]
  wire  _T_80; // @[FPU.scala 535:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298764.4]
  wire [64:0] _T_84; // @[FPU.scala 538:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298769.6]
  wire [64:0] fsgnjMux_data; // @[FPU.scala 535:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298765.4]
  wire [31:0] _T_57; // @[FPU.scala 531:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298739.6]
  wire  _T_58; // @[FPU.scala 222:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298740.6]
  wire [51:0] _T_59; // @[FPU.scala 223:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298741.6]
  wire [11:0] _T_60; // @[FPU.scala 224:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298742.6]
  wire [75:0] _GEN_34; // @[FPU.scala 225:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298743.6]
  wire [75:0] _T_61; // @[FPU.scala 225:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298743.6]
  wire [22:0] _T_62; // @[FPU.scala 225:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298744.6]
  wire [2:0] _T_63; // @[FPU.scala 227:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298745.6]
  wire [11:0] _T_65; // @[FPU.scala 228:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298747.6]
  wire [12:0] _T_66; // @[FPU.scala 228:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298748.6]
  wire [12:0] _T_67; // @[FPU.scala 228:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298749.6]
  wire [11:0] _T_68; // @[FPU.scala 228:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298750.6]
  wire  _T_69; // @[FPU.scala 229:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298751.6]
  wire  _T_70; // @[FPU.scala 229:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298752.6]
  wire  _T_71; // @[FPU.scala 229:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298753.6]
  wire [5:0] _T_72; // @[FPU.scala 229:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298754.6]
  wire [8:0] _T_73; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298755.6]
  wire [8:0] _T_74; // @[FPU.scala 229:93:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298756.6]
  wire [8:0] _T_75; // @[FPU.scala 229:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298757.6]
  wire [9:0] _T_76; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298758.6]
  wire [32:0] _T_77; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298759.6]
  wire [64:0] _T_78; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298760.6]
  wire [4:0] _GEN_35; // @[FPU.scala 540:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298777.6]
  wire [4:0] _T_91; // @[FPU.scala 540:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298777.6]
  wire [64:0] _T_97; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298792.8]
  reg [64:0] _T_101_data; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298799.4]
  reg [95:0] _RAND_7;
  reg [4:0] _T_101_exc; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298799.4]
  reg [31:0] _RAND_8;
  RecFNToRecFN RecFNToRecFN ( // @[FPU.scala 546:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298784.8]
    .io_in(RecFNToRecFN_io_in),
    .io_roundingMode(RecFNToRecFN_io_roundingMode),
    .io_out(RecFNToRecFN_io_out),
    .io_exceptionFlags(RecFNToRecFN_io_exceptionFlags)
  );
  assign _T_19 = in_bits_rm[1]; // @[FPU.scala 509:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298687.4]
  assign _T_20 = in_bits_in1 ^ in_bits_in2; // @[FPU.scala 509:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298688.4]
  assign _T_21 = in_bits_rm[0]; // @[FPU.scala 509:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298689.4]
  assign _T_22 = ~ in_bits_in2; // @[FPU.scala 509:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298690.4]
  assign _T_23 = _T_21 ? _T_22 : in_bits_in2; // @[FPU.scala 509:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298691.4]
  assign signNum = _T_19 ? _T_20 : _T_23; // @[FPU.scala 509:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298692.4]
  assign _T_24 = signNum[64]; // @[FPU.scala 510:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298693.4]
  assign _T_25 = in_bits_in1[63:0]; // @[FPU.scala 510:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298694.4]
  assign fsgnj = {_T_24,_T_25}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298695.4]
  assign _T_27 = in_bits_in1[63:61]; // @[FPU.scala 197:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298701.6]
  assign _T_28 = ~ _T_27; // @[FPU.scala 197:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298702.6]
  assign _T_29 = _T_28 == 3'h0; // @[FPU.scala 197:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298703.6]
  assign _T_30 = in_bits_in2[63:61]; // @[FPU.scala 197:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298704.6]
  assign _T_31 = ~ _T_30; // @[FPU.scala 197:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298705.6]
  assign _T_32 = _T_31 == 3'h0; // @[FPU.scala 197:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298706.6]
  assign _T_36 = in_bits_in1[51]; // @[FPU.scala 198:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298710.6]
  assign _T_37 = _T_36 == 1'h0; // @[FPU.scala 198:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298711.6]
  assign _T_38 = _T_29 & _T_37; // @[FPU.scala 198:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298712.6]
  assign _T_42 = in_bits_in2[51]; // @[FPU.scala 198:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298716.6]
  assign _T_43 = _T_42 == 1'h0; // @[FPU.scala 198:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298717.6]
  assign _T_44 = _T_32 & _T_43; // @[FPU.scala 198:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298718.6]
  assign _T_45 = _T_38 | _T_44; // @[FPU.scala 519:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298719.6]
  assign _T_46 = _T_29 & _T_32; // @[FPU.scala 520:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298720.6]
  assign _T_48 = _T_21 != io_lt; // @[FPU.scala 521:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298722.6]
  assign _T_49 = _T_29 == 1'h0; // @[FPU.scala 521:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298723.6]
  assign _T_50 = _T_48 & _T_49; // @[FPU.scala 521:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298724.6]
  assign _T_51 = _T_32 | _T_50; // @[FPU.scala 521:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298725.6]
  assign _GEN_33 = {{4'd0}, _T_45}; // @[FPU.scala 522:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298726.6]
  assign _T_52 = _GEN_33 << 4; // @[FPU.scala 522:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298726.6]
  assign _T_53 = _T_51 ? in_bits_in1 : in_bits_in2; // @[FPU.scala 523:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298728.6]
  assign _T_54 = _T_46 ? 65'he008000000000000 : _T_53; // @[FPU.scala 523:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298729.6]
  assign _GEN_23 = in_bits_wflags ? _T_54 : fsgnj; // @[FPU.scala 516:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298700.4]
  assign outTag = in_bits_singleOut == 1'h0; // @[FPU.scala 527:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298733.4]
  assign _T_56 = outTag == 1'h0; // @[FPU.scala 530:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298737.4]
  assign _T_79 = in_bits_ren2 == 1'h0; // @[FPU.scala 535:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298763.4]
  assign _T_80 = in_bits_wflags & _T_79; // @[FPU.scala 535:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298764.4]
  assign _T_84 = _T_29 ? 65'he008000000000000 : in_bits_in1; // @[FPU.scala 538:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298769.6]
  assign fsgnjMux_data = _T_80 ? _T_84 : _GEN_23; // @[FPU.scala 535:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298765.4]
  assign _T_57 = fsgnjMux_data[64:33]; // @[FPU.scala 531:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298739.6]
  assign _T_58 = fsgnjMux_data[64]; // @[FPU.scala 222:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298740.6]
  assign _T_59 = fsgnjMux_data[51:0]; // @[FPU.scala 223:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298741.6]
  assign _T_60 = fsgnjMux_data[63:52]; // @[FPU.scala 224:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298742.6]
  assign _GEN_34 = {{24'd0}, _T_59}; // @[FPU.scala 225:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298743.6]
  assign _T_61 = _GEN_34 << 24; // @[FPU.scala 225:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298743.6]
  assign _T_62 = _T_61[75:53]; // @[FPU.scala 225:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298744.6]
  assign _T_63 = _T_60[11:9]; // @[FPU.scala 227:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298745.6]
  assign _T_65 = _T_60 + 12'h100; // @[FPU.scala 228:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298747.6]
  assign _T_66 = _T_65 - 12'h800; // @[FPU.scala 228:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298748.6]
  assign _T_67 = $unsigned(_T_66); // @[FPU.scala 228:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298749.6]
  assign _T_68 = _T_67[11:0]; // @[FPU.scala 228:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298750.6]
  assign _T_69 = _T_63 == 3'h0; // @[FPU.scala 229:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298751.6]
  assign _T_70 = _T_63 >= 3'h6; // @[FPU.scala 229:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298752.6]
  assign _T_71 = _T_69 | _T_70; // @[FPU.scala 229:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298753.6]
  assign _T_72 = _T_68[5:0]; // @[FPU.scala 229:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298754.6]
  assign _T_73 = {_T_63,_T_72}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298755.6]
  assign _T_74 = _T_68[8:0]; // @[FPU.scala 229:93:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298756.6]
  assign _T_75 = _T_71 ? _T_73 : _T_74; // @[FPU.scala 229:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298757.6]
  assign _T_76 = {_T_58,_T_75}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298758.6]
  assign _T_77 = {_T_76,_T_62}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298759.6]
  assign _T_78 = {_T_57,_T_77}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298760.6]
  assign _GEN_35 = {{4'd0}, _T_38}; // @[FPU.scala 540:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298777.6]
  assign _T_91 = _GEN_35 << 4; // @[FPU.scala 540:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298777.6]
  assign _T_97 = {_T_57,RecFNToRecFN_io_out}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298792.8]
  assign io_out_bits_data = _T_101_data; // @[FPU.scala 557:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298808.4]
  assign io_out_bits_exc = _T_101_exc; // @[FPU.scala 557:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298808.4]
  assign RecFNToRecFN_io_in = in_bits_in1; // @[FPU.scala 547:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298788.8]
  assign RecFNToRecFN_io_roundingMode = in_bits_rm; // @[FPU.scala 548:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298789.8]
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
  in_valid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  in_bits_ren2 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  in_bits_singleOut = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  in_bits_wflags = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  in_bits_rm = _RAND_4[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {3{`RANDOM}};
  in_bits_in1 = _RAND_5[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {3{`RANDOM}};
  in_bits_in2 = _RAND_6[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {3{`RANDOM}};
  _T_101_data = _RAND_7[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_101_exc = _RAND_8[4:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      in_valid <= 1'h0;
    end else begin
      in_valid <= io_in_valid;
    end
    if (io_in_valid) begin
      in_bits_ren2 <= io_in_bits_ren2;
    end
    if (io_in_valid) begin
      in_bits_singleOut <= io_in_bits_singleOut;
    end
    if (io_in_valid) begin
      in_bits_wflags <= io_in_bits_wflags;
    end
    if (io_in_valid) begin
      in_bits_rm <= io_in_bits_rm;
    end
    if (io_in_valid) begin
      in_bits_in1 <= io_in_bits_in1;
    end
    if (io_in_valid) begin
      in_bits_in2 <= io_in_bits_in2;
    end
    if (in_valid) begin
      if (_T_80) begin
        if (_T_56) begin
          _T_101_data <= _T_97;
        end else begin
          if (_T_56) begin
            _T_101_data <= _T_78;
          end else begin
            if (_T_80) begin
              if (_T_29) begin
                _T_101_data <= 65'he008000000000000;
              end else begin
                _T_101_data <= in_bits_in1;
              end
            end else begin
              if (in_bits_wflags) begin
                if (_T_46) begin
                  _T_101_data <= 65'he008000000000000;
                end else begin
                  if (_T_51) begin
                    _T_101_data <= in_bits_in1;
                  end else begin
                    _T_101_data <= in_bits_in2;
                  end
                end
              end else begin
                _T_101_data <= fsgnj;
              end
            end
          end
        end
      end else begin
        if (_T_56) begin
          _T_101_data <= _T_78;
        end else begin
          if (_T_80) begin
            if (_T_29) begin
              _T_101_data <= 65'he008000000000000;
            end else begin
              _T_101_data <= in_bits_in1;
            end
          end else begin
            if (in_bits_wflags) begin
              if (_T_46) begin
                _T_101_data <= 65'he008000000000000;
              end else begin
                if (_T_51) begin
                  _T_101_data <= in_bits_in1;
                end else begin
                  _T_101_data <= in_bits_in2;
                end
              end
            end else begin
              _T_101_data <= fsgnj;
            end
          end
        end
      end
    end
    if (in_valid) begin
      if (_T_80) begin
        if (_T_56) begin
          _T_101_exc <= RecFNToRecFN_io_exceptionFlags;
        end else begin
          if (_T_80) begin
            _T_101_exc <= _T_91;
          end else begin
            if (in_bits_wflags) begin
              _T_101_exc <= _T_52;
            end else begin
              _T_101_exc <= 5'h0;
            end
          end
        end
      end else begin
        if (_T_80) begin
          _T_101_exc <= _T_91;
        end else begin
          if (in_bits_wflags) begin
            _T_101_exc <= _T_52;
          end else begin
            _T_101_exc <= 5'h0;
          end
        end
      end
    end
  end
endmodule