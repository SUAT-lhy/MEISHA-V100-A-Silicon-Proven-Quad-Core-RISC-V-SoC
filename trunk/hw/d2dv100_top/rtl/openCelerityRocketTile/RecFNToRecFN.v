module RecFNToRecFN( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298601.2]
  input  [64:0] io_in, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298604.4]
  input  [2:0]  io_roundingMode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298604.4]
  output [32:0] io_out, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298604.4]
  output [4:0]  io_exceptionFlags // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298604.4]
);
  wire  RoundAnyRawFNToRecFN_io_invalidExc; // @[RecFNToRecFN.scala 72:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298633.4]
  wire  RoundAnyRawFNToRecFN_io_in_isNaN; // @[RecFNToRecFN.scala 72:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298633.4]
  wire  RoundAnyRawFNToRecFN_io_in_isInf; // @[RecFNToRecFN.scala 72:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298633.4]
  wire  RoundAnyRawFNToRecFN_io_in_isZero; // @[RecFNToRecFN.scala 72:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298633.4]
  wire  RoundAnyRawFNToRecFN_io_in_sign; // @[RecFNToRecFN.scala 72:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298633.4]
  wire [12:0] RoundAnyRawFNToRecFN_io_in_sExp; // @[RecFNToRecFN.scala 72:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298633.4]
  wire [53:0] RoundAnyRawFNToRecFN_io_in_sig; // @[RecFNToRecFN.scala 72:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298633.4]
  wire [2:0] RoundAnyRawFNToRecFN_io_roundingMode; // @[RecFNToRecFN.scala 72:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298633.4]
  wire [32:0] RoundAnyRawFNToRecFN_io_out; // @[RecFNToRecFN.scala 72:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298633.4]
  wire [4:0] RoundAnyRawFNToRecFN_io_exceptionFlags; // @[RecFNToRecFN.scala 72:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298633.4]
  wire [11:0] _T_9; // @[rawFloatFromRecFN.scala 50:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298609.4]
  wire [2:0] _T_10; // @[rawFloatFromRecFN.scala 51:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298610.4]
  wire  rawIn_isZero; // @[rawFloatFromRecFN.scala 51:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298611.4]
  wire [1:0] _T_12; // @[rawFloatFromRecFN.scala 52:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298612.4]
  wire  _T_13; // @[rawFloatFromRecFN.scala 52:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298613.4]
  wire  _T_15; // @[rawFloatFromRecFN.scala 55:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298616.4]
  wire  rawIn_isNaN; // @[rawFloatFromRecFN.scala 55:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298617.4]
  wire  _T_18; // @[rawFloatFromRecFN.scala 56:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298620.4]
  wire  _T_22; // @[rawFloatFromRecFN.scala 60:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298628.4]
  wire [51:0] _T_23; // @[rawFloatFromRecFN.scala 60:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298629.4]
  wire [1:0] _T_24; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298630.4]
  wire [53:0] rawIn_sig; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298631.4]
  wire  _T_26; // @[common.scala 81:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298637.4]
  wire  _T_27; // @[common.scala 81:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298638.4]
  RoundAnyRawFNToRecFN_3 RoundAnyRawFNToRecFN ( // @[RecFNToRecFN.scala 72:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298633.4]
    .io_invalidExc(RoundAnyRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(RoundAnyRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(RoundAnyRawFNToRecFN_io_in_isInf),
    .io_in_isZero(RoundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(RoundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(RoundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(RoundAnyRawFNToRecFN_io_in_sig),
    .io_roundingMode(RoundAnyRawFNToRecFN_io_roundingMode),
    .io_out(RoundAnyRawFNToRecFN_io_out),
    .io_exceptionFlags(RoundAnyRawFNToRecFN_io_exceptionFlags)
  );
  assign _T_9 = io_in[63:52]; // @[rawFloatFromRecFN.scala 50:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298609.4]
  assign _T_10 = _T_9[11:9]; // @[rawFloatFromRecFN.scala 51:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298610.4]
  assign rawIn_isZero = _T_10 == 3'h0; // @[rawFloatFromRecFN.scala 51:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298611.4]
  assign _T_12 = _T_9[11:10]; // @[rawFloatFromRecFN.scala 52:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298612.4]
  assign _T_13 = _T_12 == 2'h3; // @[rawFloatFromRecFN.scala 52:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298613.4]
  assign _T_15 = _T_9[9]; // @[rawFloatFromRecFN.scala 55:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298616.4]
  assign rawIn_isNaN = _T_13 & _T_15; // @[rawFloatFromRecFN.scala 55:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298617.4]
  assign _T_18 = _T_15 == 1'h0; // @[rawFloatFromRecFN.scala 56:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298620.4]
  assign _T_22 = rawIn_isZero == 1'h0; // @[rawFloatFromRecFN.scala 60:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298628.4]
  assign _T_23 = io_in[51:0]; // @[rawFloatFromRecFN.scala 60:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298629.4]
  assign _T_24 = {1'h0,_T_22}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298630.4]
  assign rawIn_sig = {_T_24,_T_23}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298631.4]
  assign _T_26 = rawIn_sig[51]; // @[common.scala 81:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298637.4]
  assign _T_27 = _T_26 == 1'h0; // @[common.scala 81:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298638.4]
  assign io_out = RoundAnyRawFNToRecFN_io_out; // @[RecFNToRecFN.scala 85:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298645.4]
  assign io_exceptionFlags = RoundAnyRawFNToRecFN_io_exceptionFlags; // @[RecFNToRecFN.scala 86:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298646.4]
  assign RoundAnyRawFNToRecFN_io_invalidExc = rawIn_isNaN & _T_27; // @[RecFNToRecFN.scala 80:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298640.4]
  assign RoundAnyRawFNToRecFN_io_in_isNaN = _T_13 & _T_15; // @[RecFNToRecFN.scala 82:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298642.4]
  assign RoundAnyRawFNToRecFN_io_in_isInf = _T_13 & _T_18; // @[RecFNToRecFN.scala 82:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298642.4]
  assign RoundAnyRawFNToRecFN_io_in_isZero = _T_10 == 3'h0; // @[RecFNToRecFN.scala 82:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298642.4]
  assign RoundAnyRawFNToRecFN_io_in_sign = io_in[64]; // @[RecFNToRecFN.scala 82:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298642.4]
  assign RoundAnyRawFNToRecFN_io_in_sExp = {1'b0,$signed(_T_9)}; // @[RecFNToRecFN.scala 82:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298642.4]
  assign RoundAnyRawFNToRecFN_io_in_sig = {_T_24,_T_23}; // @[RecFNToRecFN.scala 82:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298642.4]
  assign RoundAnyRawFNToRecFN_io_roundingMode = io_roundingMode; // @[RecFNToRecFN.scala 83:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@298643.4]
endmodule