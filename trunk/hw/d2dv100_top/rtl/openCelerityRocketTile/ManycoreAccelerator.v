module ManycoreAccelerator( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280930.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280931.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280932.4]
  output        io_cmd_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input         io_cmd_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [6:0]  io_cmd_bits_inst_funct, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [4:0]  io_cmd_bits_inst_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [4:0]  io_cmd_bits_inst_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input         io_cmd_bits_inst_xd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input         io_cmd_bits_inst_xs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input         io_cmd_bits_inst_xs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [4:0]  io_cmd_bits_inst_rd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [6:0]  io_cmd_bits_inst_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [63:0] io_cmd_bits_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [63:0] io_cmd_bits_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [1:0]  io_cmd_bits_status_prv, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input         io_resp_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  output        io_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  output [4:0]  io_resp_bits_rd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  output [63:0] io_resp_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input         io_mem_req_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  output        io_mem_req_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  output [39:0] io_mem_req_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  output [7:0]  io_mem_req_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  output [4:0]  io_mem_req_bits_cmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  output        io_mem_req_bits_phys, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  output [63:0] io_mem_req_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input         io_mem_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [39:0] io_mem_resp_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [7:0]  io_mem_resp_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [4:0]  io_mem_resp_bits_cmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [63:0] io_mem_resp_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input         io_mem_resp_bits_replay, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input         io_mem_resp_bits_has_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [63:0] io_mem_resp_bits_data_word_bypass, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input  [63:0] io_mem_resp_bits_store_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  output        io_busy, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  output        io_interrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
  input         io_exception // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280934.4]
);
  wire [63:0] rocc_mem_resp_store_data_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [63:0] rocc_mem_resp_data_word_bypass_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_mem_resp_has_data_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_mem_resp_replay_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_mem_resp_nack_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [63:0] rocc_mem_resp_data_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [2:0] rocc_mem_resp_typ_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [4:0] rocc_mem_resp_cmd_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [9:0] rocc_mem_resp_tag_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [39:0] rocc_mem_resp_addr_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_mem_resp_valid_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [63:0] rocc_mem_req_data_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_mem_req_phys_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [2:0] rocc_mem_req_typ_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [4:0] rocc_mem_req_cmd_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [9:0] rocc_mem_req_tag_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [39:0] rocc_mem_req_addr_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_mem_req_valid_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_mem_req_ready_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [63:0] rocc_core_resp_data_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [4:0] rocc_core_resp_rd_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_core_resp_valid_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_core_resp_ready_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [63:0] rocc_core_cmd_rs2_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [63:0] rocc_core_cmd_rs1_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [6:0] rocc_core_cmd_inst_opcode_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [4:0] rocc_core_cmd_inst_rd_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_core_cmd_inst_xs2_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_core_cmd_inst_xs1_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_core_cmd_inst_xd_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [4:0] rocc_core_cmd_inst_rs1_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [4:0] rocc_core_cmd_inst_rs2_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [6:0] rocc_core_cmd_inst_funct_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_core_cmd_valid_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_core_cmd_ready_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire [1:0] rocc_cc_host_id_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_cc_exception_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_cc_interrupt_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_cc_status_i; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_cc_busy_o; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_reset; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  wire  rocc_clock; // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
  reg  status; // @[ManycoreRoCCAccel.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280985.4]
  reg [31:0] _RAND_0;
  wire  _T_209; // @[ManycoreRoCCAccel.scala 99:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280986.4]
  RoccBlackBox rocc ( // @[ManycoreRoCCAccel.scala 93:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280940.4]
    .mem_resp_store_data_i(rocc_mem_resp_store_data_i),
    .mem_resp_data_word_bypass_i(rocc_mem_resp_data_word_bypass_i),
    .mem_resp_has_data_i(rocc_mem_resp_has_data_i),
    .mem_resp_replay_i(rocc_mem_resp_replay_i),
    .mem_resp_nack_i(rocc_mem_resp_nack_i),
    .mem_resp_data_i(rocc_mem_resp_data_i),
    .mem_resp_typ_i(rocc_mem_resp_typ_i),
    .mem_resp_cmd_i(rocc_mem_resp_cmd_i),
    .mem_resp_tag_i(rocc_mem_resp_tag_i),
    .mem_resp_addr_i(rocc_mem_resp_addr_i),
    .mem_resp_valid_i(rocc_mem_resp_valid_i),
    .mem_req_data_o(rocc_mem_req_data_o),
    .mem_req_phys_o(rocc_mem_req_phys_o),
    .mem_req_typ_o(rocc_mem_req_typ_o),
    .mem_req_cmd_o(rocc_mem_req_cmd_o),
    .mem_req_tag_o(rocc_mem_req_tag_o),
    .mem_req_addr_o(rocc_mem_req_addr_o),
    .mem_req_valid_o(rocc_mem_req_valid_o),
    .mem_req_ready_i(rocc_mem_req_ready_i),
    .core_resp_data_o(rocc_core_resp_data_o),
    .core_resp_rd_o(rocc_core_resp_rd_o),
    .core_resp_valid_o(rocc_core_resp_valid_o),
    .core_resp_ready_i(rocc_core_resp_ready_i),
    .core_cmd_rs2_i(rocc_core_cmd_rs2_i),
    .core_cmd_rs1_i(rocc_core_cmd_rs1_i),
    .core_cmd_inst_opcode_i(rocc_core_cmd_inst_opcode_i),
    .core_cmd_inst_rd_i(rocc_core_cmd_inst_rd_i),
    .core_cmd_inst_xs2_i(rocc_core_cmd_inst_xs2_i),
    .core_cmd_inst_xs1_i(rocc_core_cmd_inst_xs1_i),
    .core_cmd_inst_xd_i(rocc_core_cmd_inst_xd_i),
    .core_cmd_inst_rs1_i(rocc_core_cmd_inst_rs1_i),
    .core_cmd_inst_rs2_i(rocc_core_cmd_inst_rs2_i),
    .core_cmd_inst_funct_i(rocc_core_cmd_inst_funct_i),
    .core_cmd_valid_i(rocc_core_cmd_valid_i),
    .core_cmd_ready_o(rocc_core_cmd_ready_o),
    .cc_host_id_i(rocc_cc_host_id_i),
    .cc_exception_i(rocc_cc_exception_i),
    .cc_interrupt_o(rocc_cc_interrupt_o),
    .cc_status_i(rocc_cc_status_i),
    .cc_busy_o(rocc_cc_busy_o),
    .reset(rocc_reset),
    .clock(rocc_clock)
  );
  assign _T_209 = io_cmd_bits_status_prv == 2'h0; // @[ManycoreRoCCAccel.scala 99:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280986.4]
  assign io_cmd_ready = rocc_core_cmd_ready_o; // @[ManycoreRoCCAccel.scala 107:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280994.4]
  assign io_resp_valid = rocc_core_resp_valid_o; // @[ManycoreRoCCAccel.scala 120:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281006.4]
  assign io_resp_bits_rd = rocc_core_resp_rd_o; // @[ManycoreRoCCAccel.scala 121:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281007.4]
  assign io_resp_bits_data = rocc_core_resp_data_o; // @[ManycoreRoCCAccel.scala 122:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281008.4]
  assign io_mem_req_valid = rocc_mem_req_valid_o; // @[ManycoreRoCCAccel.scala 124:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281009.4]
  assign io_mem_req_bits_addr = rocc_mem_req_addr_o; // @[ManycoreRoCCAccel.scala 126:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281011.4]
  assign io_mem_req_bits_tag = rocc_mem_req_tag_o[7:0]; // @[ManycoreRoCCAccel.scala 127:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281012.4]
  assign io_mem_req_bits_cmd = rocc_mem_req_cmd_o; // @[ManycoreRoCCAccel.scala 128:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281013.4]
  assign io_mem_req_bits_phys = rocc_mem_req_phys_o; // @[ManycoreRoCCAccel.scala 130:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281014.4]
  assign io_mem_req_bits_data = rocc_mem_req_data_o; // @[ManycoreRoCCAccel.scala 131:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281015.4]
  assign io_busy = rocc_cc_busy_o; // @[ManycoreRoCCAccel.scala 101:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280989.4]
  assign io_interrupt = rocc_cc_interrupt_o; // @[ManycoreRoCCAccel.scala 102:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280990.4]
  assign rocc_mem_resp_store_data_i = io_mem_resp_bits_store_data; // @[ManycoreRoCCAccel.scala 143:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281024.4]
  assign rocc_mem_resp_data_word_bypass_i = io_mem_resp_bits_data_word_bypass; // @[ManycoreRoCCAccel.scala 142:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281023.4]
  assign rocc_mem_resp_has_data_i = io_mem_resp_bits_has_data; // @[ManycoreRoCCAccel.scala 141:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281022.4]
  assign rocc_mem_resp_replay_i = io_mem_resp_bits_replay; // @[ManycoreRoCCAccel.scala 140:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281021.4]
  assign rocc_mem_resp_nack_i = 1'h0;
  assign rocc_mem_resp_data_i = io_mem_resp_bits_data; // @[ManycoreRoCCAccel.scala 138:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281020.4]
  assign rocc_mem_resp_typ_i = 3'h0;
  assign rocc_mem_resp_cmd_i = io_mem_resp_bits_cmd; // @[ManycoreRoCCAccel.scala 136:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281019.4]
  assign rocc_mem_resp_tag_i = {{2'd0}, io_mem_resp_bits_tag}; // @[ManycoreRoCCAccel.scala 135:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281018.4]
  assign rocc_mem_resp_addr_i = io_mem_resp_bits_addr; // @[ManycoreRoCCAccel.scala 134:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281017.4]
  assign rocc_mem_resp_valid_i = io_mem_resp_valid; // @[ManycoreRoCCAccel.scala 133:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281016.4]
  assign rocc_mem_req_ready_i = io_mem_req_ready; // @[ManycoreRoCCAccel.scala 125:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281010.4]
  assign rocc_core_resp_ready_i = io_resp_ready; // @[ManycoreRoCCAccel.scala 119:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281005.4]
  assign rocc_core_cmd_rs2_i = io_cmd_bits_rs2; // @[ManycoreRoCCAccel.scala 117:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281004.4]
  assign rocc_core_cmd_rs1_i = io_cmd_bits_rs1; // @[ManycoreRoCCAccel.scala 116:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281003.4]
  assign rocc_core_cmd_inst_opcode_i = io_cmd_bits_inst_opcode; // @[ManycoreRoCCAccel.scala 115:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281002.4]
  assign rocc_core_cmd_inst_rd_i = io_cmd_bits_inst_rd; // @[ManycoreRoCCAccel.scala 114:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281001.4]
  assign rocc_core_cmd_inst_xs2_i = io_cmd_bits_inst_xs2; // @[ManycoreRoCCAccel.scala 113:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281000.4]
  assign rocc_core_cmd_inst_xs1_i = io_cmd_bits_inst_xs1; // @[ManycoreRoCCAccel.scala 112:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280999.4]
  assign rocc_core_cmd_inst_xd_i = io_cmd_bits_inst_xd; // @[ManycoreRoCCAccel.scala 111:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280998.4]
  assign rocc_core_cmd_inst_rs1_i = io_cmd_bits_inst_rs1; // @[ManycoreRoCCAccel.scala 110:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280997.4]
  assign rocc_core_cmd_inst_rs2_i = io_cmd_bits_inst_rs2; // @[ManycoreRoCCAccel.scala 109:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280996.4]
  assign rocc_core_cmd_inst_funct_i = io_cmd_bits_inst_funct; // @[ManycoreRoCCAccel.scala 108:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280995.4]
  assign rocc_core_cmd_valid_i = io_cmd_valid; // @[ManycoreRoCCAccel.scala 106:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280993.4]
  assign rocc_cc_host_id_i = 2'h0;
  assign rocc_cc_exception_i = io_exception; // @[ManycoreRoCCAccel.scala 103:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280991.4]
  assign rocc_cc_status_i = status; // @[ManycoreRoCCAccel.scala 104:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280992.4]
  assign rocc_reset = reset; // @[ManycoreRoCCAccel.scala 96:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280984.4]
  assign rocc_clock = clock; // @[ManycoreRoCCAccel.scala 95:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280983.4]
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
  status = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      status <= 1'h0;
    end else begin
      status <= _T_209;
    end
  end
endmodule