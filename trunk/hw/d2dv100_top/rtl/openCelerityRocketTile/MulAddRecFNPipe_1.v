module MulAddRecFNPipe_1( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300198.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300199.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300200.4]
  input         io_validin, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300201.4]
  input  [1:0]  io_op, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300201.4]
  input  [64:0] io_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300201.4]
  input  [64:0] io_b, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300201.4]
  input  [64:0] io_c, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300201.4]
  input  [2:0]  io_roundingMode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300201.4]
  output [64:0] io_out, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300201.4]
  output [4:0]  io_exceptionFlags, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300201.4]
  output        io_validout // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300201.4]
);
  wire [1:0] mulAddRecFNToRaw_preMul_io_op; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire [64:0] mulAddRecFNToRaw_preMul_io_a; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire [64:0] mulAddRecFNToRaw_preMul_io_b; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire [64:0] mulAddRecFNToRaw_preMul_io_c; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire [52:0] mulAddRecFNToRaw_preMul_io_mulAddA; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire [52:0] mulAddRecFNToRaw_preMul_io_mulAddB; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire [105:0] mulAddRecFNToRaw_preMul_io_mulAddC; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isInfA; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isInfB; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_signProd; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isInfC; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire [12:0] mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire [5:0] mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire [54:0] mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC; // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isSigNaNAny; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNAOrB; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isInfA; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroA; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isInfB; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroB; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_signProd; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNC; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isInfC; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroC; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire [12:0] mulAddRecFNToRaw_postMul_io_fromPreMul_sExpSum; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_doSubMags; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_CIsDominant; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire [5:0] mulAddRecFNToRaw_postMul_io_fromPreMul_CDom_CAlignDist; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire [54:0] mulAddRecFNToRaw_postMul_io_fromPreMul_highAlignedSigC; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_bit0AlignedSigC; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire [106:0] mulAddRecFNToRaw_postMul_io_mulAddResult; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire [2:0] mulAddRecFNToRaw_postMul_io_roundingMode; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_invalidExc; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_rawOut_isNaN; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_rawOut_isInf; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_rawOut_isZero; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  mulAddRecFNToRaw_postMul_io_rawOut_sign; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire [12:0] mulAddRecFNToRaw_postMul_io_rawOut_sExp; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire [55:0] mulAddRecFNToRaw_postMul_io_rawOut_sig; // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
  wire  roundRawFNToRecFN_io_invalidExc; // @[FPU.scala 608:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300307.4]
  wire  roundRawFNToRecFN_io_infiniteExc; // @[FPU.scala 608:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300307.4]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[FPU.scala 608:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300307.4]
  wire  roundRawFNToRecFN_io_in_isInf; // @[FPU.scala 608:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300307.4]
  wire  roundRawFNToRecFN_io_in_isZero; // @[FPU.scala 608:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300307.4]
  wire  roundRawFNToRecFN_io_in_sign; // @[FPU.scala 608:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300307.4]
  wire [12:0] roundRawFNToRecFN_io_in_sExp; // @[FPU.scala 608:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300307.4]
  wire [55:0] roundRawFNToRecFN_io_in_sig; // @[FPU.scala 608:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300307.4]
  wire [2:0] roundRawFNToRecFN_io_roundingMode; // @[FPU.scala 608:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300307.4]
  wire [64:0] roundRawFNToRecFN_io_out; // @[FPU.scala 608:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300307.4]
  wire [4:0] roundRawFNToRecFN_io_exceptionFlags; // @[FPU.scala 608:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300307.4]
  wire [105:0] _T_14; // @[FPU.scala 590:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300218.4]
  wire [106:0] mulAddResult; // @[FPU.scala 591:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300219.4]
  reg  _T_21_isSigNaNAny; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_0;
  reg  _T_21_isNaNAOrB; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_1;
  reg  _T_21_isInfA; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_2;
  reg  _T_21_isZeroA; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_3;
  reg  _T_21_isInfB; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_4;
  reg  _T_21_isZeroB; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_5;
  reg  _T_21_signProd; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_6;
  reg  _T_21_isNaNC; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_7;
  reg  _T_21_isInfC; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_8;
  reg  _T_21_isZeroC; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_9;
  reg [12:0] _T_21_sExpSum; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_10;
  reg  _T_21_doSubMags; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_11;
  reg  _T_21_CIsDominant; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_12;
  reg [5:0] _T_21_CDom_CAlignDist; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_13;
  reg [54:0] _T_21_highAlignedSigC; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [63:0] _RAND_14;
  reg  _T_21_bit0AlignedSigC; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300228.4]
  reg [31:0] _RAND_15;
  reg [106:0] _T_30; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300254.4]
  reg [127:0] _RAND_16;
  reg [2:0] _T_39; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300265.4]
  reg [31:0] _RAND_17;
  reg [2:0] roundingMode_stage0; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300276.4]
  reg [31:0] _RAND_18;
  reg  valid_stage0; // @[Valid.scala 48:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300296.4]
  reg [31:0] _RAND_19;
  reg  _T_75; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300313.4]
  reg [31:0] _RAND_20;
  reg  _T_84_isNaN; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300324.4]
  reg [31:0] _RAND_21;
  reg  _T_84_isInf; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300324.4]
  reg [31:0] _RAND_22;
  reg  _T_84_isZero; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300324.4]
  reg [31:0] _RAND_23;
  reg  _T_84_sign; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300324.4]
  reg [31:0] _RAND_24;
  reg [12:0] _T_84_sExp; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300324.4]
  reg [31:0] _RAND_25;
  reg [55:0] _T_84_sig; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300324.4]
  reg [63:0] _RAND_26;
  reg [2:0] _T_93; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300340.4]
  reg [31:0] _RAND_27;
  reg  _T_109; // @[Valid.scala 48:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300360.4]
  reg [31:0] _RAND_28;
  MulAddRecFNToRaw_preMul_1 mulAddRecFNToRaw_preMul ( // @[FPU.scala 580:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300206.4]
    .io_op(mulAddRecFNToRaw_preMul_io_op),
    .io_a(mulAddRecFNToRaw_preMul_io_a),
    .io_b(mulAddRecFNToRaw_preMul_io_b),
    .io_c(mulAddRecFNToRaw_preMul_io_c),
    .io_mulAddA(mulAddRecFNToRaw_preMul_io_mulAddA),
    .io_mulAddB(mulAddRecFNToRaw_preMul_io_mulAddB),
    .io_mulAddC(mulAddRecFNToRaw_preMul_io_mulAddC),
    .io_toPostMul_isSigNaNAny(mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny),
    .io_toPostMul_isNaNAOrB(mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB),
    .io_toPostMul_isInfA(mulAddRecFNToRaw_preMul_io_toPostMul_isInfA),
    .io_toPostMul_isZeroA(mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA),
    .io_toPostMul_isInfB(mulAddRecFNToRaw_preMul_io_toPostMul_isInfB),
    .io_toPostMul_isZeroB(mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB),
    .io_toPostMul_signProd(mulAddRecFNToRaw_preMul_io_toPostMul_signProd),
    .io_toPostMul_isNaNC(mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC),
    .io_toPostMul_isInfC(mulAddRecFNToRaw_preMul_io_toPostMul_isInfC),
    .io_toPostMul_isZeroC(mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC),
    .io_toPostMul_sExpSum(mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum),
    .io_toPostMul_doSubMags(mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags),
    .io_toPostMul_CIsDominant(mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant),
    .io_toPostMul_CDom_CAlignDist(mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist),
    .io_toPostMul_highAlignedSigC(mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC),
    .io_toPostMul_bit0AlignedSigC(mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC)
  );
  MulAddRecFNToRaw_postMul_1 mulAddRecFNToRaw_postMul ( // @[FPU.scala 582:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300210.4]
    .io_fromPreMul_isSigNaNAny(mulAddRecFNToRaw_postMul_io_fromPreMul_isSigNaNAny),
    .io_fromPreMul_isNaNAOrB(mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNAOrB),
    .io_fromPreMul_isInfA(mulAddRecFNToRaw_postMul_io_fromPreMul_isInfA),
    .io_fromPreMul_isZeroA(mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroA),
    .io_fromPreMul_isInfB(mulAddRecFNToRaw_postMul_io_fromPreMul_isInfB),
    .io_fromPreMul_isZeroB(mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroB),
    .io_fromPreMul_signProd(mulAddRecFNToRaw_postMul_io_fromPreMul_signProd),
    .io_fromPreMul_isNaNC(mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNC),
    .io_fromPreMul_isInfC(mulAddRecFNToRaw_postMul_io_fromPreMul_isInfC),
    .io_fromPreMul_isZeroC(mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroC),
    .io_fromPreMul_sExpSum(mulAddRecFNToRaw_postMul_io_fromPreMul_sExpSum),
    .io_fromPreMul_doSubMags(mulAddRecFNToRaw_postMul_io_fromPreMul_doSubMags),
    .io_fromPreMul_CIsDominant(mulAddRecFNToRaw_postMul_io_fromPreMul_CIsDominant),
    .io_fromPreMul_CDom_CAlignDist(mulAddRecFNToRaw_postMul_io_fromPreMul_CDom_CAlignDist),
    .io_fromPreMul_highAlignedSigC(mulAddRecFNToRaw_postMul_io_fromPreMul_highAlignedSigC),
    .io_fromPreMul_bit0AlignedSigC(mulAddRecFNToRaw_postMul_io_fromPreMul_bit0AlignedSigC),
    .io_mulAddResult(mulAddRecFNToRaw_postMul_io_mulAddResult),
    .io_roundingMode(mulAddRecFNToRaw_postMul_io_roundingMode),
    .io_invalidExc(mulAddRecFNToRaw_postMul_io_invalidExc),
    .io_rawOut_isNaN(mulAddRecFNToRaw_postMul_io_rawOut_isNaN),
    .io_rawOut_isInf(mulAddRecFNToRaw_postMul_io_rawOut_isInf),
    .io_rawOut_isZero(mulAddRecFNToRaw_postMul_io_rawOut_isZero),
    .io_rawOut_sign(mulAddRecFNToRaw_postMul_io_rawOut_sign),
    .io_rawOut_sExp(mulAddRecFNToRaw_postMul_io_rawOut_sExp),
    .io_rawOut_sig(mulAddRecFNToRaw_postMul_io_rawOut_sig)
  );
  RoundRawFNToRecFN_1 roundRawFNToRecFN ( // @[FPU.scala 608:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300307.4]
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
  assign _T_14 = mulAddRecFNToRaw_preMul_io_mulAddA * mulAddRecFNToRaw_preMul_io_mulAddB; // @[FPU.scala 590:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300218.4]
  assign mulAddResult = _T_14 + mulAddRecFNToRaw_preMul_io_mulAddC; // @[FPU.scala 591:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300219.4]
  assign io_out = roundRawFNToRecFN_io_out; // @[FPU.scala 619:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300372.4]
  assign io_exceptionFlags = roundRawFNToRecFN_io_exceptionFlags; // @[FPU.scala 620:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300373.4]
  assign io_validout = _T_109; // @[FPU.scala 615:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300370.4]
  assign mulAddRecFNToRaw_preMul_io_op = io_op; // @[FPU.scala 584:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300214.4]
  assign mulAddRecFNToRaw_preMul_io_a = io_a; // @[FPU.scala 585:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300215.4]
  assign mulAddRecFNToRaw_preMul_io_b = io_b; // @[FPU.scala 586:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300216.4]
  assign mulAddRecFNToRaw_preMul_io_c = io_c; // @[FPU.scala 587:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300217.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isSigNaNAny = _T_21_isSigNaNAny; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNAOrB = _T_21_isNaNAOrB; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isInfA = _T_21_isInfA; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroA = _T_21_isZeroA; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isInfB = _T_21_isInfB; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroB = _T_21_isZeroB; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_signProd = _T_21_signProd; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNC = _T_21_isNaNC; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isInfC = _T_21_isInfC; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroC = _T_21_isZeroC; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_sExpSum = _T_21_sExpSum; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_doSubMags = _T_21_doSubMags; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_CIsDominant = _T_21_CIsDominant; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_CDom_CAlignDist = _T_21_CDom_CAlignDist; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_highAlignedSigC = _T_21_highAlignedSigC; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_bit0AlignedSigC = _T_21_bit0AlignedSigC; // @[FPU.scala 599:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300251.4]
  assign mulAddRecFNToRaw_postMul_io_mulAddResult = _T_30; // @[FPU.scala 600:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300262.4]
  assign mulAddRecFNToRaw_postMul_io_roundingMode = _T_39; // @[FPU.scala 601:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300273.4]
  assign roundRawFNToRecFN_io_invalidExc = _T_75; // @[FPU.scala 611:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300321.4]
  assign roundRawFNToRecFN_io_infiniteExc = 1'h0; // @[FPU.scala 617:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300371.4]
  assign roundRawFNToRecFN_io_in_isNaN = _T_84_isNaN; // @[FPU.scala 612:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300337.4]
  assign roundRawFNToRecFN_io_in_isInf = _T_84_isInf; // @[FPU.scala 612:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300337.4]
  assign roundRawFNToRecFN_io_in_isZero = _T_84_isZero; // @[FPU.scala 612:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300337.4]
  assign roundRawFNToRecFN_io_in_sign = _T_84_sign; // @[FPU.scala 612:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300337.4]
  assign roundRawFNToRecFN_io_in_sExp = _T_84_sExp; // @[FPU.scala 612:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300337.4]
  assign roundRawFNToRecFN_io_in_sig = _T_84_sig; // @[FPU.scala 612:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300337.4]
  assign roundRawFNToRecFN_io_roundingMode = _T_93; // @[FPU.scala 613:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@300348.4]
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
  _T_21_isSigNaNAny = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_21_isNaNAOrB = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_21_isInfA = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_21_isZeroA = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_21_isInfB = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_21_isZeroB = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_21_signProd = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_21_isNaNC = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_21_isInfC = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_21_isZeroC = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_21_sExpSum = _RAND_10[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_21_doSubMags = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_21_CIsDominant = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_21_CDom_CAlignDist = _RAND_13[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {2{`RANDOM}};
  _T_21_highAlignedSigC = _RAND_14[54:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_21_bit0AlignedSigC = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {4{`RANDOM}};
  _T_30 = _RAND_16[106:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_39 = _RAND_17[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  roundingMode_stage0 = _RAND_18[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  valid_stage0 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_75 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_84_isNaN = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_84_isInf = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_84_isZero = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_84_sign = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_84_sExp = _RAND_25[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {2{`RANDOM}};
  _T_84_sig = _RAND_26[55:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_93 = _RAND_27[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_109 = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (io_validin) begin
      _T_21_isSigNaNAny <= mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny;
    end
    if (io_validin) begin
      _T_21_isNaNAOrB <= mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB;
    end
    if (io_validin) begin
      _T_21_isInfA <= mulAddRecFNToRaw_preMul_io_toPostMul_isInfA;
    end
    if (io_validin) begin
      _T_21_isZeroA <= mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA;
    end
    if (io_validin) begin
      _T_21_isInfB <= mulAddRecFNToRaw_preMul_io_toPostMul_isInfB;
    end
    if (io_validin) begin
      _T_21_isZeroB <= mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB;
    end
    if (io_validin) begin
      _T_21_signProd <= mulAddRecFNToRaw_preMul_io_toPostMul_signProd;
    end
    if (io_validin) begin
      _T_21_isNaNC <= mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC;
    end
    if (io_validin) begin
      _T_21_isInfC <= mulAddRecFNToRaw_preMul_io_toPostMul_isInfC;
    end
    if (io_validin) begin
      _T_21_isZeroC <= mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC;
    end
    if (io_validin) begin
      _T_21_sExpSum <= mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum;
    end
    if (io_validin) begin
      _T_21_doSubMags <= mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags;
    end
    if (io_validin) begin
      _T_21_CIsDominant <= mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant;
    end
    if (io_validin) begin
      _T_21_CDom_CAlignDist <= mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist;
    end
    if (io_validin) begin
      _T_21_highAlignedSigC <= mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC;
    end
    if (io_validin) begin
      _T_21_bit0AlignedSigC <= mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC;
    end
    if (io_validin) begin
      _T_30 <= mulAddResult;
    end
    if (io_validin) begin
      _T_39 <= io_roundingMode;
    end
    if (io_validin) begin
      roundingMode_stage0 <= io_roundingMode;
    end
    if (reset) begin
      valid_stage0 <= 1'h0;
    end else begin
      valid_stage0 <= io_validin;
    end
    if (valid_stage0) begin
      _T_75 <= mulAddRecFNToRaw_postMul_io_invalidExc;
    end
    if (valid_stage0) begin
      _T_84_isNaN <= mulAddRecFNToRaw_postMul_io_rawOut_isNaN;
    end
    if (valid_stage0) begin
      _T_84_isInf <= mulAddRecFNToRaw_postMul_io_rawOut_isInf;
    end
    if (valid_stage0) begin
      _T_84_isZero <= mulAddRecFNToRaw_postMul_io_rawOut_isZero;
    end
    if (valid_stage0) begin
      _T_84_sign <= mulAddRecFNToRaw_postMul_io_rawOut_sign;
    end
    if (valid_stage0) begin
      _T_84_sExp <= mulAddRecFNToRaw_postMul_io_rawOut_sExp;
    end
    if (valid_stage0) begin
      _T_84_sig <= mulAddRecFNToRaw_postMul_io_rawOut_sig;
    end
    if (valid_stage0) begin
      _T_93 <= roundingMode_stage0;
    end
    if (reset) begin
      _T_109 <= 1'h0;
    end else begin
      _T_109 <= valid_stage0;
    end
  end
endmodule