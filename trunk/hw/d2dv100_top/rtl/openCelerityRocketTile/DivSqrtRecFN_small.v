module DivSqrtRecFN_small( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301001.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301002.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301003.4]
  output        io_inReady, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301004.4]
  input         io_inValid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301004.4]
  input         io_sqrtOp, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301004.4]
  input  [32:0] io_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301004.4]
  input  [32:0] io_b, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301004.4]
  input  [2:0]  io_roundingMode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301004.4]
  output        io_outValid_div, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301004.4]
  output        io_outValid_sqrt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301004.4]
  output [32:0] io_out, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301004.4]
  output [4:0]  io_exceptionFlags // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301004.4]
);
  wire  divSqrtRecFNToRaw_clock; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  divSqrtRecFNToRaw_reset; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  divSqrtRecFNToRaw_io_inReady; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  divSqrtRecFNToRaw_io_inValid; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  divSqrtRecFNToRaw_io_sqrtOp; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire [32:0] divSqrtRecFNToRaw_io_a; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire [32:0] divSqrtRecFNToRaw_io_b; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire [2:0] divSqrtRecFNToRaw_io_roundingMode; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  divSqrtRecFNToRaw_io_rawOutValid_div; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  divSqrtRecFNToRaw_io_rawOutValid_sqrt; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire [2:0] divSqrtRecFNToRaw_io_roundingModeOut; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  divSqrtRecFNToRaw_io_invalidExc; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  divSqrtRecFNToRaw_io_infiniteExc; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  divSqrtRecFNToRaw_io_rawOut_isNaN; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  divSqrtRecFNToRaw_io_rawOut_isInf; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  divSqrtRecFNToRaw_io_rawOut_isZero; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  divSqrtRecFNToRaw_io_rawOut_sign; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire [9:0] divSqrtRecFNToRaw_io_rawOut_sExp; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire [26:0] divSqrtRecFNToRaw_io_rawOut_sig; // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
  wire  roundRawFNToRecFN_io_invalidExc; // @[DivSqrtRecFN_small.scala 282:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301021.4]
  wire  roundRawFNToRecFN_io_infiniteExc; // @[DivSqrtRecFN_small.scala 282:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301021.4]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[DivSqrtRecFN_small.scala 282:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301021.4]
  wire  roundRawFNToRecFN_io_in_isInf; // @[DivSqrtRecFN_small.scala 282:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301021.4]
  wire  roundRawFNToRecFN_io_in_isZero; // @[DivSqrtRecFN_small.scala 282:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301021.4]
  wire  roundRawFNToRecFN_io_in_sign; // @[DivSqrtRecFN_small.scala 282:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301021.4]
  wire [9:0] roundRawFNToRecFN_io_in_sExp; // @[DivSqrtRecFN_small.scala 282:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301021.4]
  wire [26:0] roundRawFNToRecFN_io_in_sig; // @[DivSqrtRecFN_small.scala 282:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301021.4]
  wire [2:0] roundRawFNToRecFN_io_roundingMode; // @[DivSqrtRecFN_small.scala 282:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301021.4]
  wire [32:0] roundRawFNToRecFN_io_out; // @[DivSqrtRecFN_small.scala 282:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301021.4]
  wire [4:0] roundRawFNToRecFN_io_exceptionFlags; // @[DivSqrtRecFN_small.scala 282:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301021.4]
  DivSqrtRecFNToRaw_small divSqrtRecFNToRaw ( // @[DivSqrtRecFN_small.scala 267:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301009.4]
    .clock(divSqrtRecFNToRaw_clock),
    .reset(divSqrtRecFNToRaw_reset),
    .io_inReady(divSqrtRecFNToRaw_io_inReady),
    .io_inValid(divSqrtRecFNToRaw_io_inValid),
    .io_sqrtOp(divSqrtRecFNToRaw_io_sqrtOp),
    .io_a(divSqrtRecFNToRaw_io_a),
    .io_b(divSqrtRecFNToRaw_io_b),
    .io_roundingMode(divSqrtRecFNToRaw_io_roundingMode),
    .io_rawOutValid_div(divSqrtRecFNToRaw_io_rawOutValid_div),
    .io_rawOutValid_sqrt(divSqrtRecFNToRaw_io_rawOutValid_sqrt),
    .io_roundingModeOut(divSqrtRecFNToRaw_io_roundingModeOut),
    .io_invalidExc(divSqrtRecFNToRaw_io_invalidExc),
    .io_infiniteExc(divSqrtRecFNToRaw_io_infiniteExc),
    .io_rawOut_isNaN(divSqrtRecFNToRaw_io_rawOut_isNaN),
    .io_rawOut_isInf(divSqrtRecFNToRaw_io_rawOut_isInf),
    .io_rawOut_isZero(divSqrtRecFNToRaw_io_rawOut_isZero),
    .io_rawOut_sign(divSqrtRecFNToRaw_io_rawOut_sign),
    .io_rawOut_sExp(divSqrtRecFNToRaw_io_rawOut_sExp),
    .io_rawOut_sig(divSqrtRecFNToRaw_io_rawOut_sig)
  );
  RoundRawFNToRecFN roundRawFNToRecFN ( // @[DivSqrtRecFN_small.scala 282:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301021.4]
    .io_invalidExc(roundRawFNToRecFN_io_invalidExc),
    .io_infiniteExc(roundRawFNToRecFN_io_infiniteExc),
    .io_in_isNaN(roundRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundRawFNToRecFN_io_roundingMode),
    .io_out(roundRawFNToRecFN_io_out),
    .io_exceptionFlags(roundRawFNToRecFN_io_exceptionFlags)
  );
  assign io_inReady = divSqrtRecFNToRaw_io_inReady; // @[DivSqrtRecFN_small.scala 269:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301013.4]
  assign io_outValid_div = divSqrtRecFNToRaw_io_rawOutValid_div; // @[DivSqrtRecFN_small.scala 278:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301019.4]
  assign io_outValid_sqrt = divSqrtRecFNToRaw_io_rawOutValid_sqrt; // @[DivSqrtRecFN_small.scala 279:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301020.4]
  assign io_out = roundRawFNToRecFN_io_out; // @[DivSqrtRecFN_small.scala 288:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301030.4]
  assign io_exceptionFlags = roundRawFNToRecFN_io_exceptionFlags; // @[DivSqrtRecFN_small.scala 289:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301031.4]
  assign divSqrtRecFNToRaw_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301011.4]
  assign divSqrtRecFNToRaw_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301012.4]
  assign divSqrtRecFNToRaw_io_inValid = io_inValid; // @[DivSqrtRecFN_small.scala 270:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301014.4]
  assign divSqrtRecFNToRaw_io_sqrtOp = io_sqrtOp; // @[DivSqrtRecFN_small.scala 271:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301015.4]
  assign divSqrtRecFNToRaw_io_a = io_a; // @[DivSqrtRecFN_small.scala 272:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301016.4]
  assign divSqrtRecFNToRaw_io_b = io_b; // @[DivSqrtRecFN_small.scala 273:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301017.4]
  assign divSqrtRecFNToRaw_io_roundingMode = io_roundingMode; // @[DivSqrtRecFN_small.scala 274:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301018.4]
  assign roundRawFNToRecFN_io_invalidExc = divSqrtRecFNToRaw_io_invalidExc; // @[DivSqrtRecFN_small.scala 283:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301025.4]
  assign roundRawFNToRecFN_io_infiniteExc = divSqrtRecFNToRaw_io_infiniteExc; // @[DivSqrtRecFN_small.scala 284:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301026.4]
  assign roundRawFNToRecFN_io_in_isNaN = divSqrtRecFNToRaw_io_rawOut_isNaN; // @[DivSqrtRecFN_small.scala 285:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301027.4]
  assign roundRawFNToRecFN_io_in_isInf = divSqrtRecFNToRaw_io_rawOut_isInf; // @[DivSqrtRecFN_small.scala 285:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301027.4]
  assign roundRawFNToRecFN_io_in_isZero = divSqrtRecFNToRaw_io_rawOut_isZero; // @[DivSqrtRecFN_small.scala 285:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301027.4]
  assign roundRawFNToRecFN_io_in_sign = divSqrtRecFNToRaw_io_rawOut_sign; // @[DivSqrtRecFN_small.scala 285:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301027.4]
  assign roundRawFNToRecFN_io_in_sExp = divSqrtRecFNToRaw_io_rawOut_sExp; // @[DivSqrtRecFN_small.scala 285:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301027.4]
  assign roundRawFNToRecFN_io_in_sig = divSqrtRecFNToRaw_io_rawOut_sig; // @[DivSqrtRecFN_small.scala 285:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301027.4]
  assign roundRawFNToRecFN_io_roundingMode = divSqrtRecFNToRaw_io_roundingModeOut; // @[DivSqrtRecFN_small.scala 286:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@301028.4]
endmodule