module Queue_23( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304788.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304789.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304790.4]
  output        io_enq_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input         io_enq_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input  [6:0]  io_enq_bits_inst_funct, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input  [4:0]  io_enq_bits_inst_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input  [4:0]  io_enq_bits_inst_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input         io_enq_bits_inst_xd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input         io_enq_bits_inst_xs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input         io_enq_bits_inst_xs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input  [4:0]  io_enq_bits_inst_rd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input  [6:0]  io_enq_bits_inst_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input  [63:0] io_enq_bits_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input  [63:0] io_enq_bits_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input  [1:0]  io_enq_bits_status_prv, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  input         io_deq_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  output        io_deq_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  output [6:0]  io_deq_bits_inst_funct, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  output [4:0]  io_deq_bits_inst_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  output [4:0]  io_deq_bits_inst_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  output        io_deq_bits_inst_xd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  output        io_deq_bits_inst_xs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  output        io_deq_bits_inst_xs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  output [4:0]  io_deq_bits_inst_rd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  output [6:0]  io_deq_bits_inst_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  output [63:0] io_deq_bits_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  output [63:0] io_deq_bits_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
  output [1:0]  io_deq_bits_status_prv // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304791.4]
);
  reg [6:0] _T_35_inst_funct [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [31:0] _RAND_0;
  wire [6:0] _T_35_inst_funct__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_funct__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire [6:0] _T_35_inst_funct__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_funct__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_funct__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_funct__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [4:0] _T_35_inst_rs2 [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [31:0] _RAND_1;
  wire [4:0] _T_35_inst_rs2__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_rs2__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire [4:0] _T_35_inst_rs2__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_rs2__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_rs2__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_rs2__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [4:0] _T_35_inst_rs1 [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [31:0] _RAND_2;
  wire [4:0] _T_35_inst_rs1__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_rs1__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire [4:0] _T_35_inst_rs1__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_rs1__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_rs1__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_rs1__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg  _T_35_inst_xd [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [31:0] _RAND_3;
  wire  _T_35_inst_xd__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xd__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xd__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xd__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xd__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xd__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg  _T_35_inst_xs1 [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [31:0] _RAND_4;
  wire  _T_35_inst_xs1__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xs1__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xs1__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xs1__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xs1__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xs1__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg  _T_35_inst_xs2 [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [31:0] _RAND_5;
  wire  _T_35_inst_xs2__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xs2__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xs2__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xs2__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xs2__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_xs2__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [4:0] _T_35_inst_rd [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [31:0] _RAND_6;
  wire [4:0] _T_35_inst_rd__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_rd__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire [4:0] _T_35_inst_rd__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_rd__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_rd__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_rd__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [6:0] _T_35_inst_opcode [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [31:0] _RAND_7;
  wire [6:0] _T_35_inst_opcode__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_opcode__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire [6:0] _T_35_inst_opcode__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_opcode__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_opcode__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_inst_opcode__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [63:0] _T_35_rs1 [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [63:0] _RAND_8;
  wire [63:0] _T_35_rs1__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_rs1__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire [63:0] _T_35_rs1__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_rs1__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_rs1__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_rs1__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [63:0] _T_35_rs2 [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [63:0] _RAND_9;
  wire [63:0] _T_35_rs2__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_rs2__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire [63:0] _T_35_rs2__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_rs2__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_rs2__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_rs2__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [1:0] _T_35_status_prv [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg [31:0] _RAND_10;
  wire [1:0] _T_35_status_prv__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_status_prv__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire [1:0] _T_35_status_prv__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_status_prv__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_status_prv__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  wire  _T_35_status_prv__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  reg  value; // @[Counter.scala 26:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304794.4]
  reg [31:0] _RAND_11;
  reg  value_1; // @[Counter.scala 26:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304795.4]
  reg [31:0] _RAND_12;
  reg  _T_39; // @[Decoupled.scala 217:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304796.4]
  reg [31:0] _RAND_13;
  wire  _T_40; // @[Decoupled.scala 219:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304797.4]
  wire  _T_41; // @[Decoupled.scala 220:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304798.4]
  wire  _T_42; // @[Decoupled.scala 220:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304799.4]
  wire  _T_43; // @[Decoupled.scala 221:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304800.4]
  wire  _T_44; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304801.4]
  wire  _T_47; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304804.4]
  wire  _T_52; // @[Counter.scala 35:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304850.6]
  wire  _T_54; // @[Counter.scala 35:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304856.6]
  wire  _T_55; // @[Decoupled.scala 232:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304859.4]
  assign _T_35_inst_funct__T_58_addr = value_1;
  assign _T_35_inst_funct__T_58_data = _T_35_inst_funct[_T_35_inst_funct__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  assign _T_35_inst_funct__T_50_data = io_enq_bits_inst_funct;
  assign _T_35_inst_funct__T_50_addr = value;
  assign _T_35_inst_funct__T_50_mask = 1'h1;
  assign _T_35_inst_funct__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_inst_rs2__T_58_addr = value_1;
  assign _T_35_inst_rs2__T_58_data = _T_35_inst_rs2[_T_35_inst_rs2__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  assign _T_35_inst_rs2__T_50_data = io_enq_bits_inst_rs2;
  assign _T_35_inst_rs2__T_50_addr = value;
  assign _T_35_inst_rs2__T_50_mask = 1'h1;
  assign _T_35_inst_rs2__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_inst_rs1__T_58_addr = value_1;
  assign _T_35_inst_rs1__T_58_data = _T_35_inst_rs1[_T_35_inst_rs1__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  assign _T_35_inst_rs1__T_50_data = io_enq_bits_inst_rs1;
  assign _T_35_inst_rs1__T_50_addr = value;
  assign _T_35_inst_rs1__T_50_mask = 1'h1;
  assign _T_35_inst_rs1__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_inst_xd__T_58_addr = value_1;
  assign _T_35_inst_xd__T_58_data = _T_35_inst_xd[_T_35_inst_xd__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  assign _T_35_inst_xd__T_50_data = io_enq_bits_inst_xd;
  assign _T_35_inst_xd__T_50_addr = value;
  assign _T_35_inst_xd__T_50_mask = 1'h1;
  assign _T_35_inst_xd__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_inst_xs1__T_58_addr = value_1;
  assign _T_35_inst_xs1__T_58_data = _T_35_inst_xs1[_T_35_inst_xs1__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  assign _T_35_inst_xs1__T_50_data = io_enq_bits_inst_xs1;
  assign _T_35_inst_xs1__T_50_addr = value;
  assign _T_35_inst_xs1__T_50_mask = 1'h1;
  assign _T_35_inst_xs1__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_inst_xs2__T_58_addr = value_1;
  assign _T_35_inst_xs2__T_58_data = _T_35_inst_xs2[_T_35_inst_xs2__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  assign _T_35_inst_xs2__T_50_data = io_enq_bits_inst_xs2;
  assign _T_35_inst_xs2__T_50_addr = value;
  assign _T_35_inst_xs2__T_50_mask = 1'h1;
  assign _T_35_inst_xs2__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_inst_rd__T_58_addr = value_1;
  assign _T_35_inst_rd__T_58_data = _T_35_inst_rd[_T_35_inst_rd__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  assign _T_35_inst_rd__T_50_data = io_enq_bits_inst_rd;
  assign _T_35_inst_rd__T_50_addr = value;
  assign _T_35_inst_rd__T_50_mask = 1'h1;
  assign _T_35_inst_rd__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_inst_opcode__T_58_addr = value_1;
  assign _T_35_inst_opcode__T_58_data = _T_35_inst_opcode[_T_35_inst_opcode__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  assign _T_35_inst_opcode__T_50_data = io_enq_bits_inst_opcode;
  assign _T_35_inst_opcode__T_50_addr = value;
  assign _T_35_inst_opcode__T_50_mask = 1'h1;
  assign _T_35_inst_opcode__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_rs1__T_58_addr = value_1;
  assign _T_35_rs1__T_58_data = _T_35_rs1[_T_35_rs1__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  assign _T_35_rs1__T_50_data = io_enq_bits_rs1;
  assign _T_35_rs1__T_50_addr = value;
  assign _T_35_rs1__T_50_mask = 1'h1;
  assign _T_35_rs1__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_rs2__T_58_addr = value_1;
  assign _T_35_rs2__T_58_data = _T_35_rs2[_T_35_rs2__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  assign _T_35_rs2__T_50_data = io_enq_bits_rs2;
  assign _T_35_rs2__T_50_addr = value;
  assign _T_35_rs2__T_50_mask = 1'h1;
  assign _T_35_rs2__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_status_prv__T_58_addr = value_1;
  assign _T_35_status_prv__T_58_data = _T_35_status_prv[_T_35_status_prv__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
  assign _T_35_status_prv__T_50_data = io_enq_bits_status_prv;
  assign _T_35_status_prv__T_50_addr = value;
  assign _T_35_status_prv__T_50_mask = 1'h1;
  assign _T_35_status_prv__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_40 = value == value_1; // @[Decoupled.scala 219:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304797.4]
  assign _T_41 = _T_39 == 1'h0; // @[Decoupled.scala 220:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304798.4]
  assign _T_42 = _T_40 & _T_41; // @[Decoupled.scala 220:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304799.4]
  assign _T_43 = _T_40 & _T_39; // @[Decoupled.scala 221:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304800.4]
  assign _T_44 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304801.4]
  assign _T_47 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304804.4]
  assign _T_52 = value + 1'h1; // @[Counter.scala 35:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304850.6]
  assign _T_54 = value_1 + 1'h1; // @[Counter.scala 35:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304856.6]
  assign _T_55 = _T_44 != _T_47; // @[Decoupled.scala 232:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304859.4]
  assign io_enq_ready = _T_43 == 1'h0; // @[Decoupled.scala 237:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304866.4]
  assign io_deq_valid = _T_42 == 1'h0; // @[Decoupled.scala 236:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304864.4]
  assign io_deq_bits_inst_funct = _T_35_inst_funct__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304906.4]
  assign io_deq_bits_inst_rs2 = _T_35_inst_rs2__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304905.4]
  assign io_deq_bits_inst_rs1 = _T_35_inst_rs1__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304904.4]
  assign io_deq_bits_inst_xd = _T_35_inst_xd__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304903.4]
  assign io_deq_bits_inst_xs1 = _T_35_inst_xs1__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304902.4]
  assign io_deq_bits_inst_xs2 = _T_35_inst_xs2__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304901.4]
  assign io_deq_bits_inst_rd = _T_35_inst_rd__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304900.4]
  assign io_deq_bits_inst_opcode = _T_35_inst_opcode__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304899.4]
  assign io_deq_bits_rs1 = _T_35_rs1__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304898.4]
  assign io_deq_bits_rs2 = _T_35_rs2__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304897.4]
  assign io_deq_bits_status_prv = _T_35_status_prv__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304893.4]
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
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_inst_funct[initvar] = _RAND_0[6:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_inst_rs2[initvar] = _RAND_1[4:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_inst_rs1[initvar] = _RAND_2[4:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_inst_xd[initvar] = _RAND_3[0:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_4 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_inst_xs1[initvar] = _RAND_4[0:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_5 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_inst_xs2[initvar] = _RAND_5[0:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_6 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_inst_rd[initvar] = _RAND_6[4:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_7 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_inst_opcode[initvar] = _RAND_7[6:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_8 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_rs1[initvar] = _RAND_8[63:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_9 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_rs2[initvar] = _RAND_9[63:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_10 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_status_prv[initvar] = _RAND_10[1:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  value = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  value_1 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_39 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_inst_funct__T_50_en & _T_35_inst_funct__T_50_mask) begin
      _T_35_inst_funct[_T_35_inst_funct__T_50_addr] <= _T_35_inst_funct__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
    end
    if(_T_35_inst_rs2__T_50_en & _T_35_inst_rs2__T_50_mask) begin
      _T_35_inst_rs2[_T_35_inst_rs2__T_50_addr] <= _T_35_inst_rs2__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
    end
    if(_T_35_inst_rs1__T_50_en & _T_35_inst_rs1__T_50_mask) begin
      _T_35_inst_rs1[_T_35_inst_rs1__T_50_addr] <= _T_35_inst_rs1__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
    end
    if(_T_35_inst_xd__T_50_en & _T_35_inst_xd__T_50_mask) begin
      _T_35_inst_xd[_T_35_inst_xd__T_50_addr] <= _T_35_inst_xd__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
    end
    if(_T_35_inst_xs1__T_50_en & _T_35_inst_xs1__T_50_mask) begin
      _T_35_inst_xs1[_T_35_inst_xs1__T_50_addr] <= _T_35_inst_xs1__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
    end
    if(_T_35_inst_xs2__T_50_en & _T_35_inst_xs2__T_50_mask) begin
      _T_35_inst_xs2[_T_35_inst_xs2__T_50_addr] <= _T_35_inst_xs2__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
    end
    if(_T_35_inst_rd__T_50_en & _T_35_inst_rd__T_50_mask) begin
      _T_35_inst_rd[_T_35_inst_rd__T_50_addr] <= _T_35_inst_rd__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
    end
    if(_T_35_inst_opcode__T_50_en & _T_35_inst_opcode__T_50_mask) begin
      _T_35_inst_opcode[_T_35_inst_opcode__T_50_addr] <= _T_35_inst_opcode__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
    end
    if(_T_35_rs1__T_50_en & _T_35_rs1__T_50_mask) begin
      _T_35_rs1[_T_35_rs1__T_50_addr] <= _T_35_rs1__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
    end
    if(_T_35_rs2__T_50_en & _T_35_rs2__T_50_mask) begin
      _T_35_rs2[_T_35_rs2__T_50_addr] <= _T_35_rs2__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
    end
    if(_T_35_status_prv__T_50_en & _T_35_status_prv__T_50_mask) begin
      _T_35_status_prv[_T_35_status_prv__T_50_addr] <= _T_35_status_prv__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304793.4]
    end
    if (reset) begin
      value <= 1'h0;
    end else begin
      if (_T_44) begin
        value <= _T_52;
      end
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else begin
      if (_T_47) begin
        value_1 <= _T_54;
      end
    end
    if (reset) begin
      _T_39 <= 1'h0;
    end else begin
      if (_T_55) begin
        _T_39 <= _T_44;
      end
    end
  end
endmodule