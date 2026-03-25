module TLMonitor_4( 
		input         clock, 
		input         reset, 
		input         io_in_a_ready, 
		input         io_in_a_valid, 
		input  [2:0]  io_in_a_bits_opcode, 
		input  [2:0]  io_in_a_bits_param, 
		input  [2:0]  io_in_a_bits_size, 
		input  [3:0]  io_in_a_bits_source, 
		input  [30:0] io_in_a_bits_address, 
		input  [7:0]  io_in_a_bits_mask, 
		input         io_in_a_bits_corrupt, 
		input         io_in_d_ready, 
		input         io_in_d_valid, 
		input  [2:0]  io_in_d_bits_opcode, 
		input  [1:0]  io_in_d_bits_param, 
		input  [2:0]  io_in_d_bits_size, 
		input  [3:0]  io_in_d_bits_source, 
		input         io_in_d_bits_sink, 
		input         io_in_d_bits_denied, 
		input         io_in_d_bits_corrupt 
);
wire [31:0] plusarg_reader_out; 
wire  _T_20; 
wire  _T_21; 
wire  _T_22; 
wire  _T_23; 
wire  _T_24; 
wire  _T_25; 
wire  _T_26; 
wire  _T_27; 
wire  _T_28; 
wire  _T_29; 
wire  _T_30; 
wire  _T_31; 
wire  _T_50; 
wire  _T_51; 
wire  _T_52; 
wire  _T_53; 
wire  _T_54; 
wire  _T_55; 
wire  _T_56; 
wire  _T_57; 
wire  _T_58; 
wire  _T_59; 
wire  _T_60; 
wire [12:0] _T_62; 
wire [5:0] _T_63; 
wire [5:0] _T_64; 
wire [30:0] _GEN_18; 
wire [30:0] _T_65; 
wire  _T_66; 
wire [1:0] _T_68; 
wire [3:0] _T_69; 
wire [2:0] _T_70; 
wire [2:0] _T_71; 
wire  _T_72; 
wire  _T_73; 
wire  _T_74; 
wire  _T_75; 
wire  _T_77; 
wire  _T_78; 
wire  _T_80; 
wire  _T_81; 
wire  _T_82; 
wire  _T_83; 
wire  _T_84; 
wire  _T_85; 
wire  _T_86; 
wire  _T_87; 
wire  _T_88; 
wire  _T_89; 
wire  _T_90; 
wire  _T_91; 
wire  _T_92; 
wire  _T_93; 
wire  _T_94; 
wire  _T_95; 
wire  _T_96; 
wire  _T_97; 
wire  _T_98; 
wire  _T_99; 
wire  _T_100; 
wire  _T_101; 
wire  _T_102; 
wire  _T_103; 
wire  _T_104; 
wire  _T_105; 
wire  _T_106; 
wire  _T_107; 
wire  _T_108; 
wire  _T_109; 
wire  _T_110; 
wire  _T_111; 
wire  _T_112; 
wire  _T_113; 
wire  _T_114; 
wire  _T_115; 
wire  _T_116; 
wire  _T_117; 
wire  _T_118; 
wire  _T_119; 
wire  _T_120; 
wire  _T_121; 
wire  _T_122; 
wire  _T_123; 
wire [1:0] _T_124; 
wire [1:0] _T_125; 
wire [3:0] _T_126; 
wire [1:0] _T_127; 
wire [1:0] _T_128; 
wire [3:0] _T_129; 
wire [7:0] _T_130; 
wire [31:0] _T_134; 
wire  _T_241; 
wire [30:0] _T_243; 
wire [31:0] _T_244; 
wire [31:0] _T_245; 
wire [31:0] _T_246; 
wire  _T_247; 
wire [30:0] _T_248; 
wire [31:0] _T_249; 
wire [31:0] _T_250; 
wire [31:0] _T_251; 
wire  _T_252; 
wire [30:0] _T_253; 
wire [31:0] _T_254; 
wire [31:0] _T_255; 
wire [31:0] _T_256; 
wire  _T_257; 
wire [30:0] _T_258; 
wire [31:0] _T_259; 
wire [31:0] _T_260; 
wire [31:0] _T_261; 
wire  _T_262; 
wire [31:0] _T_265; 
wire [31:0] _T_266; 
wire  _T_267; 
wire [30:0] _T_268; 
wire [31:0] _T_269; 
wire [31:0] _T_270; 
wire [31:0] _T_271; 
wire  _T_272; 
wire  _T_273; 
wire  _T_274; 
wire  _T_275; 
wire  _T_276; 
wire  _T_277; 
wire  _T_282; 
wire  _T_313; 
wire  _T_318; 
wire  _T_321; 
wire  _T_324; 
wire  _T_327; 
wire  _T_332; 
wire  _T_335; 
wire  _T_338; 
wire  _T_344; 
wire  _T_345; 
wire  _T_347; 
wire  _T_348; 
wire  _T_351; 
wire  _T_352; 
wire  _T_354; 
wire  _T_355; 
wire  _T_356; 
wire  _T_358; 
wire  _T_359; 
wire [7:0] _T_360; 
wire  _T_361; 
wire  _T_363; 
wire  _T_364; 
wire  _T_365; 
wire  _T_367; 
wire  _T_368; 
wire  _T_369; 
wire  _T_488; 
wire  _T_490; 
wire  _T_491; 
wire  _T_501; 
wire  _T_503; 
wire  _T_541; 
wire  _T_544; 
wire  _T_545; 
wire  _T_552; 
wire  _T_554; 
wire  _T_555; 
wire  _T_556; 
wire  _T_558; 
wire  _T_559; 
wire  _T_564; 
wire  _T_598; 
wire  _T_609; 
wire  _T_610; 
wire  _T_625; 
wire [7:0] _T_682; 
wire [7:0] _T_683; 
wire  _T_684; 
wire  _T_686; 
wire  _T_687; 
wire  _T_688; 
wire  _T_690; 
wire  _T_722; 
wire  _T_733; 
wire  _T_734; 
wire  _T_741; 
wire  _T_743; 
wire  _T_744; 
wire  _T_749; 
wire  _T_802; 
wire  _T_804; 
wire  _T_805; 
wire  _T_810; 
wire  _T_866; 
wire  _T_868; 
wire  _T_869; 
wire  _T_870; 
wire  _T_871; 
wire  _T_872; 
wire  _T_873; 
wire  _T_874; 
wire  _T_875; 
wire  _T_876; 
wire  _T_877; 
wire  _T_878; 
wire  _T_879; 
wire  _T_880; 
wire  _T_881; 
wire  _T_900; 
wire  _T_901; 
wire  _T_902; 
wire  _T_903; 
wire  _T_904; 
wire  _T_905; 
wire  _T_906; 
wire  _T_907; 
wire  _T_908; 
wire  _T_909; 
wire  _T_910; 
wire  _T_912; 
wire  _T_914; 
wire  _T_915; 
wire  _T_916; 
wire  _T_918; 
wire  _T_919; 
wire  _T_920; 
wire  _T_922; 
wire  _T_923; 
wire  _T_924; 
wire  _T_926; 
wire  _T_927; 
wire  _T_928; 
wire  _T_930; 
wire  _T_931; 
wire  _T_932; 
wire  _T_943; 
wire  _T_945; 
wire  _T_946; 
wire  _T_947; 
wire  _T_949; 
wire  _T_950; 
wire  _T_960; 
wire  _T_980; 
wire  _T_982; 
wire  _T_983; 
wire  _T_989; 
wire  _T_1006; 
wire  _T_1024; 
wire  _T_1053; 
wire [2:0] _T_1058; 
wire  _T_1059; 
wire  _T_1060; 
reg [2:0] _T_1063; 
reg [31:0] _RAND_0;
wire [3:0] _T_1064; 
wire [3:0] _T_1065; 
wire [2:0] _T_1066; 
wire  _T_1067; 
reg [2:0] _T_1076; 
reg [31:0] _RAND_1;
reg [2:0] _T_1078; 
reg [31:0] _RAND_2;
reg [2:0] _T_1080; 
reg [31:0] _RAND_3;
reg [3:0] _T_1082; 
reg [31:0] _RAND_4;
reg [30:0] _T_1084; 
reg [31:0] _RAND_5;
wire  _T_1085; 
wire  _T_1086; 
wire  _T_1087; 
wire  _T_1089; 
wire  _T_1090; 
wire  _T_1091; 
wire  _T_1093; 
wire  _T_1094; 
wire  _T_1095; 
wire  _T_1097; 
wire  _T_1098; 
wire  _T_1099; 
wire  _T_1101; 
wire  _T_1102; 
wire  _T_1103; 
wire  _T_1105; 
wire  _T_1106; 
wire  _T_1108; 
wire  _T_1109; 
wire [12:0] _T_1111; 
wire [5:0] _T_1112; 
wire [5:0] _T_1113; 
wire [2:0] _T_1114; 
wire  _T_1115; 
reg [2:0] _T_1118; 
reg [31:0] _RAND_6;
wire [3:0] _T_1119; 
wire [3:0] _T_1120; 
wire [2:0] _T_1121; 
wire  _T_1122; 
reg [2:0] _T_1131; 
reg [31:0] _RAND_7;
reg [1:0] _T_1133; 
reg [31:0] _RAND_8;
reg [2:0] _T_1135; 
reg [31:0] _RAND_9;
reg [3:0] _T_1137; 
reg [31:0] _RAND_10;
reg  _T_1139; 
reg [31:0] _RAND_11;
reg  _T_1141; 
reg [31:0] _RAND_12;
wire  _T_1142; 
wire  _T_1143; 
wire  _T_1144; 
wire  _T_1146; 
wire  _T_1147; 
wire  _T_1148; 
wire  _T_1150; 
wire  _T_1151; 
wire  _T_1152; 
wire  _T_1154; 
wire  _T_1155; 
wire  _T_1156; 
wire  _T_1158; 
wire  _T_1159; 
wire  _T_1160; 
wire  _T_1162; 
wire  _T_1163; 
wire  _T_1164; 
wire  _T_1166; 
wire  _T_1167; 
wire  _T_1169; 
reg [14:0] _T_1171; 
reg [31:0] _RAND_13;
reg [2:0] _T_1182; 
reg [31:0] _RAND_14;
wire [3:0] _T_1183; 
wire [3:0] _T_1184; 
wire [2:0] _T_1185; 
wire  _T_1186; 
reg [2:0] _T_1203; 
reg [31:0] _RAND_15;
wire [3:0] _T_1204; 
wire [3:0] _T_1205; 
wire [2:0] _T_1206; 
wire  _T_1207; 
wire  _T_1218; 
wire [15:0] _T_1220; 
wire [14:0] _T_1221; 
wire  _T_1222; 
wire  _T_1223; 
wire  _T_1225; 
wire  _T_1226; 
wire [15:0] _GEN_15; 
wire  _T_1231; 
wire  _T_1233; 
wire  _T_1234; 
wire [15:0] _T_1235; 
wire [14:0] _T_1216; 
wire [14:0] _T_1236; 
wire [14:0] _T_1237; 
wire  _T_1238; 
wire  _T_1240; 
wire  _T_1241; 
wire [15:0] _GEN_16; 
wire [14:0] _T_1228; 
wire  _T_1242; 
wire  _T_1243; 
wire  _T_1244; 
wire  _T_1245; 
wire  _T_1247; 
wire  _T_1248; 
wire [14:0] _T_1249; 
wire [14:0] _T_1250; 
wire [14:0] _T_1251; 
reg [31:0] _T_1253; 
reg [31:0] _RAND_16;
wire  _T_1254; 
wire  _T_1255; 
wire  _T_1256; 
wire  _T_1257; 
wire  _T_1258; 
wire  _T_1259; 
wire  _T_1261; 
wire  _T_1262; 
wire [31:0] _T_1264; 
wire  _T_1267; 
wire  _GEN_19; 
wire  _GEN_35; 
wire  _GEN_53; 
wire  _GEN_65; 
wire  _GEN_75; 
wire  _GEN_85; 
wire  _GEN_95; 
wire  _GEN_105; 
wire  _GEN_115; 
wire  _GEN_125; 
wire  _GEN_139; 
wire  _GEN_153; 
wire  _GEN_161; 
wire  _GEN_169; 
	plusarg_reader #(.FORMAT("tilelink_timeout=%d"), .DEFAULT(0)) plusarg_reader ( 
			.out(plusarg_reader_out)
			);
	assign _T_20 = io_in_a_bits_source == 4'hc; 
	assign _T_21 = io_in_a_bits_source == 4'hd; 
	assign _T_22 = io_in_a_bits_source == 4'he; 
	assign _T_23 = io_in_a_bits_source == 4'h8; 
	assign _T_24 = io_in_a_bits_source == 4'h9; 
	assign _T_25 = io_in_a_bits_source == 4'ha; 
	assign _T_26 = io_in_a_bits_source == 4'h4; 
	assign _T_27 = io_in_a_bits_source == 4'h5; 
	assign _T_28 = io_in_a_bits_source == 4'h6; 
	assign _T_29 = io_in_a_bits_source == 4'h0; 
	assign _T_30 = io_in_a_bits_source == 4'h1; 
	assign _T_31 = io_in_a_bits_source == 4'h2; 
	assign _T_50 = _T_20 | _T_21; 
	assign _T_51 = _T_50 | _T_22; 
	assign _T_52 = _T_51 | _T_23; 
	assign _T_53 = _T_52 | _T_24; 
	assign _T_54 = _T_53 | _T_25; 
	assign _T_55 = _T_54 | _T_26; 
	assign _T_56 = _T_55 | _T_27; 
	assign _T_57 = _T_56 | _T_28; 
	assign _T_58 = _T_57 | _T_29; 
	assign _T_59 = _T_58 | _T_30; 
	assign _T_60 = _T_59 | _T_31; 
	assign _T_62 = 13'h3f << io_in_a_bits_size; 
	assign _T_63 = _T_62[5:0]; 
	assign _T_64 = ~ _T_63; 
	assign _GEN_18 = {{25'd0}, _T_64}; 
assign _T_65 = io_in_a_bits_address & _GEN_18; 
assign _T_66 = _T_65 == 31'h0; 
assign _T_68 = io_in_a_bits_size[1:0]; 
assign _T_69 = 4'h1 << _T_68; 
assign _T_70 = _T_69[2:0]; 
assign _T_71 = _T_70 | 3'h1; 
assign _T_72 = io_in_a_bits_size >= 3'h3; 
assign _T_73 = _T_71[2]; 
assign _T_74 = io_in_a_bits_address[2]; 
assign _T_75 = _T_74 == 1'h0; 
assign _T_77 = _T_73 & _T_75; 
assign _T_78 = _T_72 | _T_77; 
assign _T_80 = _T_73 & _T_74; 
assign _T_81 = _T_72 | _T_80; 
assign _T_82 = _T_71[1]; 
assign _T_83 = io_in_a_bits_address[1]; 
assign _T_84 = _T_83 == 1'h0; 
assign _T_85 = _T_75 & _T_84; 
assign _T_86 = _T_82 & _T_85; 
assign _T_87 = _T_78 | _T_86; 
assign _T_88 = _T_75 & _T_83; 
assign _T_89 = _T_82 & _T_88; 
assign _T_90 = _T_78 | _T_89; 
assign _T_91 = _T_74 & _T_84; 
assign _T_92 = _T_82 & _T_91; 
assign _T_93 = _T_81 | _T_92; 
assign _T_94 = _T_74 & _T_83; 
assign _T_95 = _T_82 & _T_94; 
assign _T_96 = _T_81 | _T_95; 
assign _T_97 = _T_71[0]; 
assign _T_98 = io_in_a_bits_address[0]; 
assign _T_99 = _T_98 == 1'h0; 
assign _T_100 = _T_85 & _T_99; 
assign _T_101 = _T_97 & _T_100; 
assign _T_102 = _T_87 | _T_101; 
assign _T_103 = _T_85 & _T_98; 
assign _T_104 = _T_97 & _T_103; 
assign _T_105 = _T_87 | _T_104; 
assign _T_106 = _T_88 & _T_99; 
assign _T_107 = _T_97 & _T_106; 
assign _T_108 = _T_90 | _T_107; 
assign _T_109 = _T_88 & _T_98; 
assign _T_110 = _T_97 & _T_109; 
assign _T_111 = _T_90 | _T_110; 
assign _T_112 = _T_91 & _T_99; 
assign _T_113 = _T_97 & _T_112; 
assign _T_114 = _T_93 | _T_113; 
assign _T_115 = _T_91 & _T_98; 
assign _T_116 = _T_97 & _T_115; 
assign _T_117 = _T_93 | _T_116; 
assign _T_118 = _T_94 & _T_99; 
assign _T_119 = _T_97 & _T_118; 
assign _T_120 = _T_96 | _T_119; 
assign _T_121 = _T_94 & _T_98; 
assign _T_122 = _T_97 & _T_121; 
assign _T_123 = _T_96 | _T_122; 
assign _T_124 = {_T_105,_T_102}; 
assign _T_125 = {_T_111,_T_108}; 
assign _T_126 = {_T_125,_T_124}; 
assign _T_127 = {_T_117,_T_114}; 
assign _T_128 = {_T_123,_T_120}; 
assign _T_129 = {_T_128,_T_127}; 
assign _T_130 = {_T_129,_T_126}; 
assign _T_134 = {1'b0,$signed(io_in_a_bits_address)}; 
assign _T_241 = io_in_a_bits_opcode == 3'h6; 
assign _T_243 = io_in_a_bits_address ^ 31'h64000000; 
assign _T_244 = {1'b0,$signed(_T_243)}; 
assign _T_245 = $signed(_T_244) & $signed(-32'sh2000); 
assign _T_246 = $signed(_T_245); 
assign _T_247 = $signed(_T_246) == $signed(32'sh0); 
assign _T_248 = io_in_a_bits_address ^ 31'h64002000; 
assign _T_249 = {1'b0,$signed(_T_248)}; 
assign _T_250 = $signed(_T_249) & $signed(-32'sh1000); 
assign _T_251 = $signed(_T_250); 
assign _T_252 = $signed(_T_251) == $signed(32'sh0); 
assign _T_253 = io_in_a_bits_address ^ 31'hc000000; 
assign _T_254 = {1'b0,$signed(_T_253)}; 
assign _T_255 = $signed(_T_254) & $signed(-32'sh4000000); 
assign _T_256 = $signed(_T_255); 
assign _T_257 = $signed(_T_256) == $signed(32'sh0); 
assign _T_258 = io_in_a_bits_address ^ 31'h2000000; 
assign _T_259 = {1'b0,$signed(_T_258)}; 
assign _T_260 = $signed(_T_259) & $signed(-32'sh10000); 
assign _T_261 = $signed(_T_260); 
assign _T_262 = $signed(_T_261) == $signed(32'sh0); 
assign _T_265 = $signed(_T_134) & $signed(-32'sh1000); 
assign _T_266 = $signed(_T_265); 
assign _T_267 = $signed(_T_266) == $signed(32'sh0); 
assign _T_268 = io_in_a_bits_address ^ 31'h10000; 
assign _T_269 = {1'b0,$signed(_T_268)}; 
assign _T_270 = $signed(_T_269) & $signed(-32'sh2000); 
assign _T_271 = $signed(_T_270); 
assign _T_272 = $signed(_T_271) == $signed(32'sh0); 
assign _T_273 = _T_247 | _T_252; 
assign _T_274 = _T_273 | _T_257; 
assign _T_275 = _T_274 | _T_262; 
assign _T_276 = _T_275 | _T_267; 
assign _T_277 = _T_276 | _T_272; 
assign _T_282 = reset == 1'h0; 
assign _T_313 = 3'h6 == io_in_a_bits_size; 
assign _T_318 = _T_20 ? _T_313 : 1'h0; 
assign _T_321 = _T_23 ? _T_313 : 1'h0; 
assign _T_324 = _T_26 ? _T_313 : 1'h0; 
assign _T_327 = _T_29 ? _T_313 : 1'h0; 
assign _T_332 = _T_318 | _T_321; 
assign _T_335 = _T_332 | _T_324; 
assign _T_338 = _T_335 | _T_327; 
assign _T_344 = _T_338 | reset; 
assign _T_345 = _T_344 == 1'h0; 
assign _T_347 = _T_60 | reset; 
assign _T_348 = _T_347 == 1'h0; 
assign _T_351 = _T_72 | reset; 
assign _T_352 = _T_351 == 1'h0; 
assign _T_354 = _T_66 | reset; 
assign _T_355 = _T_354 == 1'h0; 
assign _T_356 = io_in_a_bits_param <= 3'h2; 
assign _T_358 = _T_356 | reset; 
assign _T_359 = _T_358 == 1'h0; 
assign _T_360 = ~ io_in_a_bits_mask; 
assign _T_361 = _T_360 == 8'h0; 
assign _T_363 = _T_361 | reset; 
assign _T_364 = _T_363 == 1'h0; 
assign _T_365 = io_in_a_bits_corrupt == 1'h0; 
assign _T_367 = _T_365 | reset; 
assign _T_368 = _T_367 == 1'h0; 
assign _T_369 = io_in_a_bits_opcode == 3'h7; 
assign _T_488 = io_in_a_bits_param != 3'h0; 
assign _T_490 = _T_488 | reset; 
assign _T_491 = _T_490 == 1'h0; 
assign _T_501 = io_in_a_bits_opcode == 3'h4; 
assign _T_503 = io_in_a_bits_size <= 3'h6; 
assign _T_541 = _T_503 & _T_277; 
assign _T_544 = _T_541 | reset; 
assign _T_545 = _T_544 == 1'h0; 
assign _T_552 = io_in_a_bits_param == 3'h0; 
assign _T_554 = _T_552 | reset; 
assign _T_555 = _T_554 == 1'h0; 
assign _T_556 = io_in_a_bits_mask == _T_130; 
assign _T_558 = _T_556 | reset; 
assign _T_559 = _T_558 == 1'h0; 
assign _T_564 = io_in_a_bits_opcode == 3'h0; 
assign _T_598 = _T_503 & _T_276; 
assign _T_609 = _T_598 | reset; 
assign _T_610 = _T_609 == 1'h0; 
assign _T_625 = io_in_a_bits_opcode == 3'h1; 
assign _T_682 = ~ _T_130; 
assign _T_683 = io_in_a_bits_mask & _T_682; 
assign _T_684 = _T_683 == 8'h0; 
assign _T_686 = _T_684 | reset; 
assign _T_687 = _T_686 == 1'h0; 
assign _T_688 = io_in_a_bits_opcode == 3'h2; 
assign _T_690 = io_in_a_bits_size <= 3'h3; 
assign _T_722 = _T_690 & _T_276; 
assign _T_733 = _T_722 | reset; 
assign _T_734 = _T_733 == 1'h0; 
assign _T_741 = io_in_a_bits_param <= 3'h4; 
assign _T_743 = _T_741 | reset; 
assign _T_744 = _T_743 == 1'h0; 
assign _T_749 = io_in_a_bits_opcode == 3'h3; 
assign _T_802 = io_in_a_bits_param <= 3'h3; 
assign _T_804 = _T_802 | reset; 
assign _T_805 = _T_804 == 1'h0; 
assign _T_810 = io_in_a_bits_opcode == 3'h5; 
assign _T_866 = io_in_d_bits_opcode <= 3'h6; 
assign _T_868 = _T_866 | reset; 
assign _T_869 = _T_868 == 1'h0; 
assign _T_870 = io_in_d_bits_source == 4'hc; 
assign _T_871 = io_in_d_bits_source == 4'hd; 
assign _T_872 = io_in_d_bits_source == 4'he; 
assign _T_873 = io_in_d_bits_source == 4'h8; 
assign _T_874 = io_in_d_bits_source == 4'h9; 
assign _T_875 = io_in_d_bits_source == 4'ha; 
assign _T_876 = io_in_d_bits_source == 4'h4; 
assign _T_877 = io_in_d_bits_source == 4'h5; 
assign _T_878 = io_in_d_bits_source == 4'h6; 
assign _T_879 = io_in_d_bits_source == 4'h0; 
assign _T_880 = io_in_d_bits_source == 4'h1; 
assign _T_881 = io_in_d_bits_source == 4'h2; 
assign _T_900 = _T_870 | _T_871; 
assign _T_901 = _T_900 | _T_872; 
assign _T_902 = _T_901 | _T_873; 
assign _T_903 = _T_902 | _T_874; 
assign _T_904 = _T_903 | _T_875; 
assign _T_905 = _T_904 | _T_876; 
assign _T_906 = _T_905 | _T_877; 
assign _T_907 = _T_906 | _T_878; 
assign _T_908 = _T_907 | _T_879; 
assign _T_909 = _T_908 | _T_880; 
assign _T_910 = _T_909 | _T_881; 
assign _T_912 = io_in_d_bits_opcode == 3'h6; 
assign _T_914 = _T_910 | reset; 
assign _T_915 = _T_914 == 1'h0; 
assign _T_916 = io_in_d_bits_size >= 3'h3; 
assign _T_918 = _T_916 | reset; 
assign _T_919 = _T_918 == 1'h0; 
assign _T_920 = io_in_d_bits_param == 2'h0; 
assign _T_922 = _T_920 | reset; 
assign _T_923 = _T_922 == 1'h0; 
assign _T_924 = io_in_d_bits_corrupt == 1'h0; 
assign _T_926 = _T_924 | reset; 
assign _T_927 = _T_926 == 1'h0; 
assign _T_928 = io_in_d_bits_denied == 1'h0; 
assign _T_930 = _T_928 | reset; 
assign _T_931 = _T_930 == 1'h0; 
assign _T_932 = io_in_d_bits_opcode == 3'h4; 
assign _T_943 = io_in_d_bits_param <= 2'h2; 
assign _T_945 = _T_943 | reset; 
assign _T_946 = _T_945 == 1'h0; 
assign _T_947 = io_in_d_bits_param != 2'h2; 
assign _T_949 = _T_947 | reset; 
assign _T_950 = _T_949 == 1'h0; 
assign _T_960 = io_in_d_bits_opcode == 3'h5; 
assign _T_980 = _T_928 | io_in_d_bits_corrupt; 
assign _T_982 = _T_980 | reset; 
assign _T_983 = _T_982 == 1'h0; 
assign _T_989 = io_in_d_bits_opcode == 3'h0; 
assign _T_1006 = io_in_d_bits_opcode == 3'h1; 
assign _T_1024 = io_in_d_bits_opcode == 3'h2; 
assign _T_1053 = io_in_a_ready & io_in_a_valid; 
assign _T_1058 = _T_64[5:3]; 
assign _T_1059 = io_in_a_bits_opcode[2]; 
assign _T_1060 = _T_1059 == 1'h0; 
assign _T_1064 = _T_1063 - 3'h1; 
assign _T_1065 = $unsigned(_T_1064); 
assign _T_1066 = _T_1065[2:0]; 
assign _T_1067 = _T_1063 == 3'h0; 
assign _T_1085 = _T_1067 == 1'h0; 
assign _T_1086 = io_in_a_valid & _T_1085; 
assign _T_1087 = io_in_a_bits_opcode == _T_1076; 
assign _T_1089 = _T_1087 | reset; 
assign _T_1090 = _T_1089 == 1'h0; 
assign _T_1091 = io_in_a_bits_param == _T_1078; 
assign _T_1093 = _T_1091 | reset; 
assign _T_1094 = _T_1093 == 1'h0; 
assign _T_1095 = io_in_a_bits_size == _T_1080; 
assign _T_1097 = _T_1095 | reset; 
assign _T_1098 = _T_1097 == 1'h0; 
assign _T_1099 = io_in_a_bits_source == _T_1082; 
assign _T_1101 = _T_1099 | reset; 
assign _T_1102 = _T_1101 == 1'h0; 
assign _T_1103 = io_in_a_bits_address == _T_1084; 
assign _T_1105 = _T_1103 | reset; 
assign _T_1106 = _T_1105 == 1'h0; 
assign _T_1108 = _T_1053 & _T_1067; 
assign _T_1109 = io_in_d_ready & io_in_d_valid; 
assign _T_1111 = 13'h3f << io_in_d_bits_size; 
assign _T_1112 = _T_1111[5:0]; 
assign _T_1113 = ~ _T_1112; 
assign _T_1114 = _T_1113[5:3]; 
assign _T_1115 = io_in_d_bits_opcode[0]; 
assign _T_1119 = _T_1118 - 3'h1; 
assign _T_1120 = $unsigned(_T_1119); 
assign _T_1121 = _T_1120[2:0]; 
assign _T_1122 = _T_1118 == 3'h0; 
assign _T_1142 = _T_1122 == 1'h0; 
assign _T_1143 = io_in_d_valid & _T_1142; 
assign _T_1144 = io_in_d_bits_opcode == _T_1131; 
assign _T_1146 = _T_1144 | reset; 
assign _T_1147 = _T_1146 == 1'h0; 
assign _T_1148 = io_in_d_bits_param == _T_1133; 
assign _T_1150 = _T_1148 | reset; 
assign _T_1151 = _T_1150 == 1'h0; 
assign _T_1152 = io_in_d_bits_size == _T_1135; 
assign _T_1154 = _T_1152 | reset; 
assign _T_1155 = _T_1154 == 1'h0; 
assign _T_1156 = io_in_d_bits_source == _T_1137; 
assign _T_1158 = _T_1156 | reset; 
assign _T_1159 = _T_1158 == 1'h0; 
assign _T_1160 = io_in_d_bits_sink == _T_1139; 
assign _T_1162 = _T_1160 | reset; 
assign _T_1163 = _T_1162 == 1'h0; 
assign _T_1164 = io_in_d_bits_denied == _T_1141; 
assign _T_1166 = _T_1164 | reset; 
assign _T_1167 = _T_1166 == 1'h0; 
assign _T_1169 = _T_1109 & _T_1122; 
assign _T_1183 = _T_1182 - 3'h1; 
assign _T_1184 = $unsigned(_T_1183); 
assign _T_1185 = _T_1184[2:0]; 
assign _T_1186 = _T_1182 == 3'h0; 
assign _T_1204 = _T_1203 - 3'h1; 
assign _T_1205 = $unsigned(_T_1204); 
assign _T_1206 = _T_1205[2:0]; 
assign _T_1207 = _T_1203 == 3'h0; 
assign _T_1218 = _T_1053 & _T_1186; 
assign _T_1220 = 16'h1 << io_in_a_bits_source; 
assign _T_1221 = _T_1171 >> io_in_a_bits_source; 
assign _T_1222 = _T_1221[0]; 
assign _T_1223 = _T_1222 == 1'h0; 
assign _T_1225 = _T_1223 | reset; 
assign _T_1226 = _T_1225 == 1'h0; 
assign _GEN_15 = _T_1218 ? _T_1220 : 16'h0; 
assign _T_1231 = _T_1109 & _T_1207; 
assign _T_1233 = _T_912 == 1'h0; 
assign _T_1234 = _T_1231 & _T_1233; 
assign _T_1235 = 16'h1 << io_in_d_bits_source; 
assign _T_1216 = _GEN_15[14:0]; 
assign _T_1236 = _T_1216 | _T_1171; 
assign _T_1237 = _T_1236 >> io_in_d_bits_source; 
assign _T_1238 = _T_1237[0]; 
assign _T_1240 = _T_1238 | reset; 
assign _T_1241 = _T_1240 == 1'h0; 
assign _GEN_16 = _T_1234 ? _T_1235 : 16'h0; 
assign _T_1228 = _GEN_16[14:0]; 
assign _T_1242 = _T_1216 != _T_1228; 
assign _T_1243 = _T_1216 != 15'h0; 
assign _T_1244 = _T_1243 == 1'h0; 
assign _T_1245 = _T_1242 | _T_1244; 
assign _T_1247 = _T_1245 | reset; 
assign _T_1248 = _T_1247 == 1'h0; 
assign _T_1249 = _T_1171 | _T_1216; 
assign _T_1250 = ~ _T_1228; 
assign _T_1251 = _T_1249 & _T_1250; 
assign _T_1254 = _T_1171 != 15'h0; 
assign _T_1255 = _T_1254 == 1'h0; 
assign _T_1256 = plusarg_reader_out == 32'h0; 
assign _T_1257 = _T_1255 | _T_1256; 
assign _T_1258 = _T_1253 < plusarg_reader_out; 
assign _T_1259 = _T_1257 | _T_1258; 
assign _T_1261 = _T_1259 | reset; 
assign _T_1262 = _T_1261 == 1'h0; 
assign _T_1264 = _T_1253 + 32'h1; 
assign _T_1267 = _T_1053 | _T_1109; 
assign _GEN_19 = io_in_a_valid & _T_241; 
assign _GEN_35 = io_in_a_valid & _T_369; 
assign _GEN_53 = io_in_a_valid & _T_501; 
assign _GEN_65 = io_in_a_valid & _T_564; 
assign _GEN_75 = io_in_a_valid & _T_625; 
assign _GEN_85 = io_in_a_valid & _T_688; 
assign _GEN_95 = io_in_a_valid & _T_749; 
assign _GEN_105 = io_in_a_valid & _T_810; 
assign _GEN_115 = io_in_d_valid & _T_912; 
assign _GEN_125 = io_in_d_valid & _T_932; 
assign _GEN_139 = io_in_d_valid & _T_960; 
assign _GEN_153 = io_in_d_valid & _T_989; 
assign _GEN_161 = io_in_d_valid & _T_1006; 
assign _GEN_169 = io_in_d_valid & _T_1024; 
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
_T_1063 = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_1 = {1{`RANDOM}};
_T_1076 = _RAND_1[2:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_2 = {1{`RANDOM}};
_T_1078 = _RAND_2[2:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_3 = {1{`RANDOM}};
_T_1080 = _RAND_3[2:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_4 = {1{`RANDOM}};
_T_1082 = _RAND_4[3:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_5 = {1{`RANDOM}};
_T_1084 = _RAND_5[30:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_6 = {1{`RANDOM}};
_T_1118 = _RAND_6[2:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_7 = {1{`RANDOM}};
_T_1131 = _RAND_7[2:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_8 = {1{`RANDOM}};
_T_1133 = _RAND_8[1:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_9 = {1{`RANDOM}};
_T_1135 = _RAND_9[2:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_10 = {1{`RANDOM}};
_T_1137 = _RAND_10[3:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_11 = {1{`RANDOM}};
_T_1139 = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_12 = {1{`RANDOM}};
_T_1141 = _RAND_12[0:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_13 = {1{`RANDOM}};
_T_1171 = _RAND_13[14:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_14 = {1{`RANDOM}};
_T_1182 = _RAND_14[2:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_15 = {1{`RANDOM}};
_T_1203 = _RAND_15[2:0];
`endif // RANDOMIZE_REG_INIT
`ifdef RANDOMIZE_REG_INIT
_RAND_16 = {1{`RANDOM}};
_T_1253 = _RAND_16[31:0];
`endif // RANDOMIZE_REG_INIT
end
`endif // RANDOMIZE
always @(posedge clock) begin
if (reset) begin
_T_1063 <= 3'h0;
end else begin
if (_T_1053) begin
if (_T_1067) begin
if (_T_1060) begin
_T_1063 <= _T_1058;
end else begin
_T_1063 <= 3'h0;
end
end else begin
_T_1063 <= _T_1066;
end
end
end
if (_T_1108) begin
_T_1076 <= io_in_a_bits_opcode;
end
if (_T_1108) begin
_T_1078 <= io_in_a_bits_param;
end
if (_T_1108) begin
_T_1080 <= io_in_a_bits_size;
end
if (_T_1108) begin
_T_1082 <= io_in_a_bits_source;
end
if (_T_1108) begin
_T_1084 <= io_in_a_bits_address;
end
if (reset) begin
_T_1118 <= 3'h0;
end else begin
if (_T_1109) begin
if (_T_1122) begin
if (_T_1115) begin
_T_1118 <= _T_1114;
end else begin
_T_1118 <= 3'h0;
end
end else begin
_T_1118 <= _T_1121;
end
end
end
if (_T_1169) begin
_T_1131 <= io_in_d_bits_opcode;
end
if (_T_1169) begin
_T_1133 <= io_in_d_bits_param;
end
if (_T_1169) begin
_T_1135 <= io_in_d_bits_size;
end
if (_T_1169) begin
_T_1137 <= io_in_d_bits_source;
end
if (_T_1169) begin
_T_1139 <= io_in_d_bits_sink;
end
if (_T_1169) begin
_T_1141 <= io_in_d_bits_denied;
end
if (reset) begin
_T_1171 <= 15'h0;
end else begin
_T_1171 <= _T_1251;
end
if (reset) begin
_T_1182 <= 3'h0;
end else begin
if (_T_1053) begin
if (_T_1186) begin
if (_T_1060) begin
_T_1182 <= _T_1058;
end else begin
_T_1182 <= 3'h0;
end
end else begin
_T_1182 <= _T_1185;
end
end
end
if (reset) begin
_T_1203 <= 3'h0;
end else begin
if (_T_1109) begin
if (_T_1207) begin
if (_T_1115) begin
_T_1203 <= _T_1114;
end else begin
_T_1203 <= 3'h0;
end
end else begin
_T_1203 <= _T_1206;
end
end
end
if (reset) begin
_T_1253 <= 32'h0;
end else begin
if (_T_1267) begin
_T_1253 <= 32'h0;
end else begin
_T_1253 <= _T_1264;
end
end
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (1'h0) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel has invalid opcode (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:39 assert (TLMessages.isA(bundle.opcode), \"'A' channel has invalid opcode\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (1'h0) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (1'h0) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel carries an address illegal for the specified bank visibility\n    at Monitor.scala:46 assert (visible(edge.address(bundle), bundle.source, edge), \"'A' channel carries an address illegal for the specified bank visibility\")\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (1'h0) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_19 & _T_282) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock type unsupported by manager (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:49 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquireBlock type unsupported by manager\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_19 & _T_282) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_19 & _T_345) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:50 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquireBlock from a client which does not support Probe\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_19 & _T_345) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_19 & _T_348) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:51 assert (source_ok, \"'A' channel AcquireBlock carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_19 & _T_348) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_19 & _T_352) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:52 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquireBlock smaller than a beat\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_19 & _T_352) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_19 & _T_355) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:53 assert (is_aligned, \"'A' channel AcquireBlock address not aligned to size\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_19 & _T_355) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_19 & _T_359) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:54 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquireBlock carries invalid grow param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_19 & _T_359) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_19 & _T_364) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:55 assert (~bundle.mask === UInt(0), \"'A' channel AcquireBlock contains invalid mask\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_19 & _T_364) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_19 & _T_368) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock is corrupt (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:56 assert (!bundle.corrupt, \"'A' channel AcquireBlock is corrupt\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_19 & _T_368) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_35 & _T_282) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm type unsupported by manager (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:60 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquirePerm type unsupported by manager\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_35 & _T_282) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_35 & _T_345) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:61 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquirePerm from a client which does not support Probe\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_35 & _T_345) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_35 & _T_348) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:62 assert (source_ok, \"'A' channel AcquirePerm carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_35 & _T_348) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_35 & _T_352) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:63 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquirePerm smaller than a beat\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_35 & _T_352) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_35 & _T_355) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:64 assert (is_aligned, \"'A' channel AcquirePerm address not aligned to size\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_35 & _T_355) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_35 & _T_359) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:65 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquirePerm carries invalid grow param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_35 & _T_359) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_35 & _T_491) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:66 assert (bundle.param =/= TLPermissions.NtoB, \"'A' channel AcquirePerm requests NtoB\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_35 & _T_491) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_35 & _T_364) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:67 assert (~bundle.mask === UInt(0), \"'A' channel AcquirePerm contains invalid mask\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_35 & _T_364) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_35 & _T_368) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm is corrupt (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:68 assert (!bundle.corrupt, \"'A' channel AcquirePerm is corrupt\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_35 & _T_368) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_53 & _T_545) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel carries Get type unsupported by manager (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:72 assert (edge.manager.supportsGetSafe(edge.address(bundle), bundle.size), \"'A' channel carries Get type unsupported by manager\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_53 & _T_545) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_53 & _T_348) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:73 assert (source_ok, \"'A' channel Get carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_53 & _T_348) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_53 & _T_355) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Get address not aligned to size (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:74 assert (is_aligned, \"'A' channel Get address not aligned to size\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_53 & _T_355) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_53 & _T_555) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:75 assert (bundle.param === UInt(0), \"'A' channel Get carries invalid param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_53 & _T_555) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_53 & _T_559) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Get contains invalid mask (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:76 assert (bundle.mask === mask, \"'A' channel Get contains invalid mask\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_53 & _T_559) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_53 & _T_368) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Get is corrupt (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:77 assert (!bundle.corrupt, \"'A' channel Get is corrupt\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_53 & _T_368) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_65 & _T_610) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutFull type unsupported by manager (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:81 assert (edge.manager.supportsPutFullSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutFull type unsupported by manager\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_65 & _T_610) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_65 & _T_348) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:82 assert (source_ok, \"'A' channel PutFull carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_65 & _T_348) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_65 & _T_355) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull address not aligned to size (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:83 assert (is_aligned, \"'A' channel PutFull address not aligned to size\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_65 & _T_355) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_65 & _T_555) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:84 assert (bundle.param === UInt(0), \"'A' channel PutFull carries invalid param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_65 & _T_555) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_65 & _T_559) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull contains invalid mask (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:85 assert (bundle.mask === mask, \"'A' channel PutFull contains invalid mask\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_65 & _T_559) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_75 & _T_610) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutPartial type unsupported by manager (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:89 assert (edge.manager.supportsPutPartialSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutPartial type unsupported by manager\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_75 & _T_610) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_75 & _T_348) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:90 assert (source_ok, \"'A' channel PutPartial carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_75 & _T_348) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_75 & _T_355) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial address not aligned to size (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:91 assert (is_aligned, \"'A' channel PutPartial address not aligned to size\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_75 & _T_355) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_75 & _T_555) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:92 assert (bundle.param === UInt(0), \"'A' channel PutPartial carries invalid param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_75 & _T_555) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_75 & _T_687) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial contains invalid mask (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:93 assert ((bundle.mask & ~mask) === UInt(0), \"'A' channel PutPartial contains invalid mask\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_75 & _T_687) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_85 & _T_734) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel carries Arithmetic type unsupported by manager (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:97 assert (edge.manager.supportsArithmeticSafe(edge.address(bundle), bundle.size), \"'A' channel carries Arithmetic type unsupported by manager\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_85 & _T_734) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_85 & _T_348) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:98 assert (source_ok, \"'A' channel Arithmetic carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_85 & _T_348) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_85 & _T_355) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:99 assert (is_aligned, \"'A' channel Arithmetic address not aligned to size\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_85 & _T_355) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_85 & _T_744) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:100 assert (TLAtomics.isArithmetic(bundle.param), \"'A' channel Arithmetic carries invalid opcode param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_85 & _T_744) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_85 & _T_559) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:101 assert (bundle.mask === mask, \"'A' channel Arithmetic contains invalid mask\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_85 & _T_559) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_95 & _T_734) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel carries Logical type unsupported by manager (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:105 assert (edge.manager.supportsLogicalSafe(edge.address(bundle), bundle.size), \"'A' channel carries Logical type unsupported by manager\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_95 & _T_734) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_95 & _T_348) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:106 assert (source_ok, \"'A' channel Logical carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_95 & _T_348) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_95 & _T_355) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Logical address not aligned to size (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:107 assert (is_aligned, \"'A' channel Logical address not aligned to size\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_95 & _T_355) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_95 & _T_805) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid opcode param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:108 assert (TLAtomics.isLogical(bundle.param), \"'A' channel Logical carries invalid opcode param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_95 & _T_805) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_95 & _T_559) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Logical contains invalid mask (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:109 assert (bundle.mask === mask, \"'A' channel Logical contains invalid mask\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_95 & _T_559) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_105 & _T_282) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel carries Hint type unsupported by manager (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:113 assert (edge.manager.supportsHintSafe(edge.address(bundle), bundle.size), \"'A' channel carries Hint type unsupported by manager\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_105 & _T_282) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_105 & _T_348) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Hint carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:114 assert (source_ok, \"'A' channel Hint carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_105 & _T_348) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_105 & _T_355) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Hint address not aligned to size (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:115 assert (is_aligned, \"'A' channel Hint address not aligned to size\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_105 & _T_355) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_105 & _T_559) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Hint contains invalid mask (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:116 assert (bundle.mask === mask, \"'A' channel Hint contains invalid mask\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_105 & _T_559) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_105 & _T_368) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel Hint is corrupt (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:117 assert (!bundle.corrupt, \"'A' channel Hint is corrupt\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_105 & _T_368) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (io_in_d_valid & _T_869) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel has invalid opcode (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:268 assert (TLMessages.isD(bundle.opcode), \"'D' channel has invalid opcode\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (io_in_d_valid & _T_869) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_115 & _T_915) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:276 assert (source_ok, \"'D' channel ReleaseAck carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_115 & _T_915) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_115 & _T_919) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:277 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel ReleaseAck smaller than a beat\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_115 & _T_919) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_115 & _T_923) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:278 assert (bundle.param === UInt(0), \"'D' channel ReleaseeAck carries invalid param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_115 & _T_923) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_115 & _T_927) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is corrupt (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:279 assert (!bundle.corrupt, \"'D' channel ReleaseAck is corrupt\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_115 & _T_927) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_115 & _T_931) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is denied (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:280 assert (!bundle.denied, \"'D' channel ReleaseAck is denied\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_115 & _T_931) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_125 & _T_915) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:284 assert (source_ok, \"'D' channel Grant carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_125 & _T_915) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_125 & _T_282) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid sink ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:285 assert (sink_ok, \"'D' channel Grant carries invalid sink ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_125 & _T_282) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_125 & _T_919) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel Grant smaller than a beat (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:286 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel Grant smaller than a beat\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_125 & _T_919) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_125 & _T_946) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid cap param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:287 assert (TLPermissions.isCap(bundle.param), \"'D' channel Grant carries invalid cap param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_125 & _T_946) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_125 & _T_950) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries toN param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:288 assert (bundle.param =/= TLPermissions.toN, \"'D' channel Grant carries toN param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_125 & _T_950) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_125 & _T_927) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is corrupt (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:289 assert (!bundle.corrupt, \"'D' channel Grant is corrupt\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_125 & _T_927) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_125 & _T_931) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is denied (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:290 assert (deny_put_ok || !bundle.denied, \"'D' channel Grant is denied\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_125 & _T_931) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_139 & _T_915) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:294 assert (source_ok, \"'D' channel GrantData carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_139 & _T_915) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_139 & _T_282) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:295 assert (sink_ok, \"'D' channel GrantData carries invalid sink ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_139 & _T_282) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_139 & _T_919) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData smaller than a beat (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:296 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel GrantData smaller than a beat\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_139 & _T_919) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_139 & _T_946) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid cap param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:297 assert (TLPermissions.isCap(bundle.param), \"'D' channel GrantData carries invalid cap param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_139 & _T_946) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_139 & _T_950) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries toN param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:298 assert (bundle.param =/= TLPermissions.toN, \"'D' channel GrantData carries toN param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_139 & _T_950) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_139 & _T_983) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:299 assert (!bundle.denied || bundle.corrupt, \"'D' channel GrantData is denied but not corrupt\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_139 & _T_983) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_139 & _T_931) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:300 assert (deny_get_ok || !bundle.denied, \"'D' channel GrantData is denied\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_139 & _T_931) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_153 & _T_915) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:304 assert (source_ok, \"'D' channel AccessAck carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_153 & _T_915) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_153 & _T_923) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:306 assert (bundle.param === UInt(0), \"'D' channel AccessAck carries invalid param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_153 & _T_923) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_153 & _T_927) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is corrupt (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:307 assert (!bundle.corrupt, \"'D' channel AccessAck is corrupt\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_153 & _T_927) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_153 & _T_931) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is denied (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:308 assert (deny_put_ok || !bundle.denied, \"'D' channel AccessAck is denied\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_153 & _T_931) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_161 & _T_915) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:312 assert (source_ok, \"'D' channel AccessAckData carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_161 & _T_915) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_161 & _T_923) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:314 assert (bundle.param === UInt(0), \"'D' channel AccessAckData carries invalid param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_161 & _T_923) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_161 & _T_983) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:315 assert (!bundle.denied || bundle.corrupt, \"'D' channel AccessAckData is denied but not corrupt\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_161 & _T_983) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_161 & _T_931) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:316 assert (deny_get_ok || !bundle.denied, \"'D' channel AccessAckData is denied\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_161 & _T_931) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_169 & _T_915) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:320 assert (source_ok, \"'D' channel HintAck carries invalid source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_169 & _T_915) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_169 & _T_923) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid param (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:322 assert (bundle.param === UInt(0), \"'D' channel HintAck carries invalid param\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_169 & _T_923) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_169 & _T_927) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is corrupt (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:323 assert (!bundle.corrupt, \"'D' channel HintAck is corrupt\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_169 & _T_927) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_GEN_169 & _T_931) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is denied (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:324 assert (deny_put_ok || !bundle.denied, \"'D' channel HintAck is denied\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_GEN_169 & _T_931) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (1'h0) begin
$fwrite(32'h80000002,"Assertion failed: 'B' channel valid and not TL-C (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:341 assert (!bundle.b.valid, \"'B' channel valid and not TL-C\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (1'h0) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (1'h0) begin
$fwrite(32'h80000002,"Assertion failed: 'C' channel valid and not TL-C (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:342 assert (!bundle.c.valid, \"'C' channel valid and not TL-C\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (1'h0) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (1'h0) begin
$fwrite(32'h80000002,"Assertion failed: 'E' channel valid and not TL-C (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:343 assert (!bundle.e.valid, \"'E' channel valid and not TL-C\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (1'h0) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1086 & _T_1090) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel opcode changed within multibeat operation (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:355 assert (a.bits.opcode === opcode, \"'A' channel opcode changed within multibeat operation\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1086 & _T_1090) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1086 & _T_1094) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel param changed within multibeat operation (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:356 assert (a.bits.param  === param,  \"'A' channel param changed within multibeat operation\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1086 & _T_1094) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1086 & _T_1098) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel size changed within multibeat operation (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:357 assert (a.bits.size   === size,   \"'A' channel size changed within multibeat operation\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1086 & _T_1098) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1086 & _T_1102) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel source changed within multibeat operation (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:358 assert (a.bits.source === source, \"'A' channel source changed within multibeat operation\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1086 & _T_1102) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1086 & _T_1106) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel address changed with multibeat operation (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:359 assert (a.bits.address=== address,\"'A' channel address changed with multibeat operation\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1086 & _T_1106) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1143 & _T_1147) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel opcode changed within multibeat operation (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:425 assert (d.bits.opcode === opcode, \"'D' channel opcode changed within multibeat operation\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1143 & _T_1147) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1143 & _T_1151) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel param changed within multibeat operation (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:426 assert (d.bits.param  === param,  \"'D' channel param changed within multibeat operation\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1143 & _T_1151) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1143 & _T_1155) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel size changed within multibeat operation (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:427 assert (d.bits.size   === size,   \"'D' channel size changed within multibeat operation\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1143 & _T_1155) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1143 & _T_1159) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel source changed within multibeat operation (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:428 assert (d.bits.source === source, \"'D' channel source changed within multibeat operation\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1143 & _T_1159) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1143 & _T_1163) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel sink changed with multibeat operation (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:429 assert (d.bits.sink   === sink,   \"'D' channel sink changed with multibeat operation\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1143 & _T_1163) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1143 & _T_1167) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel denied changed with multibeat operation (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:430 assert (d.bits.denied === denied, \"'D' channel denied changed with multibeat operation\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1143 & _T_1167) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1218 & _T_1226) begin
$fwrite(32'h80000002,"Assertion failed: 'A' channel re-used a source ID (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:460 assert(!inflight(bundle.a.bits.source), \"'A' channel re-used a source ID\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1218 & _T_1226) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1234 & _T_1241) begin
$fwrite(32'h80000002,"Assertion failed: 'D' channel acknowledged for nothing inflight (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:467 assert((a_set | inflight)(bundle.d.bits.source), \"'D' channel acknowledged for nothing inflight\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1234 & _T_1241) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1248) begin
$fwrite(32'h80000002,"Assertion failed: 'A' and 'D' concurrent, despite minlatency 2 (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:471 assert(a_set =/= d_clr || !a_set.orR, s\"'A' and 'D' concurrent, despite minlatency ${edge.manager.minLatency}\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1248) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef PRINTF_COND
if (`PRINTF_COND) begin
`endif
if (_T_1262) begin
$fwrite(32'h80000002,"Assertion failed: TileLink timeout expired (connected at CrossingHelper.scala:17:14)\n    at Monitor.scala:479 assert (!inflight.orR || limit === UInt(0) || watchdog < limit, \"TileLink timeout expired\" + extra)\n"); 
end
`ifdef PRINTF_COND
end
`endif
`endif // SYNTHESIS
`ifndef SYNTHESIS
`ifdef STOP_COND
if (`STOP_COND) begin
`endif
if (_T_1262) begin
$fatal; 
end
`ifdef STOP_COND
end
`endif
`endif // SYNTHESIS
end
endmodule
