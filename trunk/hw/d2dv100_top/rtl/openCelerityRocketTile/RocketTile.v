module RocketTile( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314166.2]
  input wire [31:0] reset_vector_msb_32,
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314167.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314168.4]
  input         auto_intsink_in_sync_0, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input         auto_int_in_xing_in_2_sync_0, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input         auto_int_in_xing_in_1_sync_0, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input         auto_int_in_xing_in_0_sync_0, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input         auto_int_in_xing_in_0_sync_1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input         auto_tl_master_xing_out_a_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output        auto_tl_master_xing_out_a_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [2:0]  auto_tl_master_xing_out_a_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [2:0]  auto_tl_master_xing_out_a_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [2:0]  auto_tl_master_xing_out_a_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [1:0]  auto_tl_master_xing_out_a_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [37:0] auto_tl_master_xing_out_a_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [7:0]  auto_tl_master_xing_out_a_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [63:0] auto_tl_master_xing_out_a_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output        auto_tl_master_xing_out_a_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output        auto_tl_master_xing_out_b_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input         auto_tl_master_xing_out_b_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [2:0]  auto_tl_master_xing_out_b_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [1:0]  auto_tl_master_xing_out_b_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [2:0]  auto_tl_master_xing_out_b_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [1:0]  auto_tl_master_xing_out_b_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [37:0] auto_tl_master_xing_out_b_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [7:0]  auto_tl_master_xing_out_b_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input         auto_tl_master_xing_out_b_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input         auto_tl_master_xing_out_c_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output        auto_tl_master_xing_out_c_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [2:0]  auto_tl_master_xing_out_c_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [2:0]  auto_tl_master_xing_out_c_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [2:0]  auto_tl_master_xing_out_c_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [1:0]  auto_tl_master_xing_out_c_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [37:0] auto_tl_master_xing_out_c_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [63:0] auto_tl_master_xing_out_c_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output        auto_tl_master_xing_out_c_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output        auto_tl_master_xing_out_d_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input         auto_tl_master_xing_out_d_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [2:0]  auto_tl_master_xing_out_d_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [1:0]  auto_tl_master_xing_out_d_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [2:0]  auto_tl_master_xing_out_d_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [1:0]  auto_tl_master_xing_out_d_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [2:0]  auto_tl_master_xing_out_d_bits_sink, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input         auto_tl_master_xing_out_d_bits_denied, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [63:0] auto_tl_master_xing_out_d_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input         auto_tl_master_xing_out_d_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input         auto_tl_master_xing_out_e_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output        auto_tl_master_xing_out_e_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  output [2:0]  auto_tl_master_xing_out_e_bits_sink, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314169.4]
  input  [1:0]  constants_hartid // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314170.4]
);
  wire  tlMasterXbar_clock; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_reset; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_1_a_ready; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_1_a_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_1_a_bits_opcode; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_1_a_bits_param; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_1_a_bits_size; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_1_a_bits_source; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [37:0] tlMasterXbar_auto_in_1_a_bits_address; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [7:0] tlMasterXbar_auto_in_1_a_bits_mask; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [63:0] tlMasterXbar_auto_in_1_a_bits_data; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_1_a_bits_corrupt; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_1_c_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_1_d_ready; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_1_d_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_1_d_bits_opcode; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_1_d_bits_size; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [63:0] tlMasterXbar_auto_in_1_d_bits_data; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_1_d_bits_corrupt; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_1_e_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_a_ready; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_a_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_0_a_bits_opcode; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_0_a_bits_param; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_0_a_bits_size; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_a_bits_source; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [37:0] tlMasterXbar_auto_in_0_a_bits_address; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [7:0] tlMasterXbar_auto_in_0_a_bits_mask; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [63:0] tlMasterXbar_auto_in_0_a_bits_data; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_a_bits_corrupt; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_b_ready; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_b_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [1:0] tlMasterXbar_auto_in_0_b_bits_param; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_0_b_bits_size; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_b_bits_source; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [37:0] tlMasterXbar_auto_in_0_b_bits_address; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_c_ready; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_c_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_0_c_bits_opcode; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_0_c_bits_param; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_0_c_bits_size; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_c_bits_source; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [37:0] tlMasterXbar_auto_in_0_c_bits_address; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [63:0] tlMasterXbar_auto_in_0_c_bits_data; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_c_bits_corrupt; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_d_ready; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_d_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_0_d_bits_opcode; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [1:0] tlMasterXbar_auto_in_0_d_bits_param; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_0_d_bits_size; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_d_bits_source; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_0_d_bits_sink; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_d_bits_denied; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [63:0] tlMasterXbar_auto_in_0_d_bits_data; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_e_ready; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_in_0_e_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_in_0_e_bits_sink; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_a_ready; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_a_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_out_a_bits_opcode; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_out_a_bits_param; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_out_a_bits_size; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [1:0] tlMasterXbar_auto_out_a_bits_source; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [37:0] tlMasterXbar_auto_out_a_bits_address; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [7:0] tlMasterXbar_auto_out_a_bits_mask; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [63:0] tlMasterXbar_auto_out_a_bits_data; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_a_bits_corrupt; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_b_ready; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_b_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_out_b_bits_opcode; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [1:0] tlMasterXbar_auto_out_b_bits_param; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_out_b_bits_size; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [1:0] tlMasterXbar_auto_out_b_bits_source; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [37:0] tlMasterXbar_auto_out_b_bits_address; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [7:0] tlMasterXbar_auto_out_b_bits_mask; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_b_bits_corrupt; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_c_ready; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_c_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_out_c_bits_opcode; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_out_c_bits_param; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_out_c_bits_size; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [1:0] tlMasterXbar_auto_out_c_bits_source; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [37:0] tlMasterXbar_auto_out_c_bits_address; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [63:0] tlMasterXbar_auto_out_c_bits_data; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_c_bits_corrupt; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_d_ready; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_d_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_out_d_bits_opcode; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [1:0] tlMasterXbar_auto_out_d_bits_param; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_out_d_bits_size; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [1:0] tlMasterXbar_auto_out_d_bits_source; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_out_d_bits_sink; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_d_bits_denied; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [63:0] tlMasterXbar_auto_out_d_bits_data; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_d_bits_corrupt; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_e_ready; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  tlMasterXbar_auto_out_e_valid; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire [2:0] tlMasterXbar_auto_out_e_bits_sink; // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
  wire  intXbar_auto_int_in_3_0; // @[BaseTile.scala 144:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314188.4]
  wire  intXbar_auto_int_in_2_0; // @[BaseTile.scala 144:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314188.4]
  wire  intXbar_auto_int_in_1_0; // @[BaseTile.scala 144:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314188.4]
  wire  intXbar_auto_int_in_1_1; // @[BaseTile.scala 144:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314188.4]
  wire  intXbar_auto_int_in_0_0; // @[BaseTile.scala 144:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314188.4]
  wire  intXbar_auto_int_out_0; // @[BaseTile.scala 144:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314188.4]
  wire  intXbar_auto_int_out_1; // @[BaseTile.scala 144:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314188.4]
  wire  intXbar_auto_int_out_2; // @[BaseTile.scala 144:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314188.4]
  wire  intXbar_auto_int_out_3; // @[BaseTile.scala 144:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314188.4]
  wire  intXbar_auto_int_out_4; // @[BaseTile.scala 144:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314188.4]
  wire  dcache_gated_clock; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_reset; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_a_ready; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_a_valid; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_auto_out_a_bits_opcode; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_auto_out_a_bits_param; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_auto_out_a_bits_size; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_a_bits_source; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [37:0] dcache_auto_out_a_bits_address; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [7:0] dcache_auto_out_a_bits_mask; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [63:0] dcache_auto_out_a_bits_data; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_b_ready; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_b_valid; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [1:0] dcache_auto_out_b_bits_param; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_auto_out_b_bits_size; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_b_bits_source; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [37:0] dcache_auto_out_b_bits_address; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_c_ready; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_c_valid; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_auto_out_c_bits_opcode; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_auto_out_c_bits_param; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_auto_out_c_bits_size; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_c_bits_source; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [37:0] dcache_auto_out_c_bits_address; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [63:0] dcache_auto_out_c_bits_data; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_d_ready; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_d_valid; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_auto_out_d_bits_opcode; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [1:0] dcache_auto_out_d_bits_param; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_auto_out_d_bits_size; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_d_bits_source; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_auto_out_d_bits_sink; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_d_bits_denied; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [63:0] dcache_auto_out_d_bits_data; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_e_ready; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_auto_out_e_valid; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_auto_out_e_bits_sink; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_req_ready; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_req_valid; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [39:0] dcache_io_cpu_req_bits_addr; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [7:0] dcache_io_cpu_req_bits_tag; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [4:0] dcache_io_cpu_req_bits_cmd; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_io_cpu_req_bits_typ; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_req_bits_phys; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_s1_kill; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [63:0] dcache_io_cpu_s1_data_data; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [7:0] dcache_io_cpu_s1_data_mask; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_s2_nack; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_s2_kill; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_resp_valid; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [39:0] dcache_io_cpu_resp_bits_addr; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [7:0] dcache_io_cpu_resp_bits_tag; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [4:0] dcache_io_cpu_resp_bits_cmd; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [2:0] dcache_io_cpu_resp_bits_typ; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [63:0] dcache_io_cpu_resp_bits_data; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_resp_bits_replay; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_resp_bits_has_data; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [63:0] dcache_io_cpu_resp_bits_data_word_bypass; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [63:0] dcache_io_cpu_resp_bits_store_data; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_replay_next; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_s2_xcpt_ma_ld; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_s2_xcpt_ma_st; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_s2_xcpt_pf_ld; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_s2_xcpt_pf_st; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_s2_xcpt_ae_ld; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_s2_xcpt_ae_st; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_ordered; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_perf_grant; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_keep_clock_enabled; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_cpu_clock_enabled; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_req_ready; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_req_valid; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_req_bits_valid; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [26:0] dcache_io_ptw_req_bits_bits_addr; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_resp_valid; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_resp_bits_ae; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [53:0] dcache_io_ptw_resp_bits_pte_ppn; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_resp_bits_pte_d; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_resp_bits_pte_a; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_resp_bits_pte_g; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_resp_bits_pte_u; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_resp_bits_pte_x; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_resp_bits_pte_w; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_resp_bits_pte_r; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_resp_bits_pte_v; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [1:0] dcache_io_ptw_resp_bits_level; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_resp_bits_fragmented_superpage; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_resp_bits_homogeneous; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [3:0] dcache_io_ptw_ptbr_mode; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [1:0] dcache_io_ptw_status_dprv; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_status_mxr; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_status_sum; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_0_cfg_l; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [1:0] dcache_io_ptw_pmp_0_cfg_a; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_0_cfg_x; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_0_cfg_w; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_0_cfg_r; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [35:0] dcache_io_ptw_pmp_0_addr; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [37:0] dcache_io_ptw_pmp_0_mask; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_1_cfg_l; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [1:0] dcache_io_ptw_pmp_1_cfg_a; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_1_cfg_x; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_1_cfg_w; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_1_cfg_r; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [35:0] dcache_io_ptw_pmp_1_addr; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [37:0] dcache_io_ptw_pmp_1_mask; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_2_cfg_l; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [1:0] dcache_io_ptw_pmp_2_cfg_a; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_2_cfg_x; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_2_cfg_w; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_2_cfg_r; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [35:0] dcache_io_ptw_pmp_2_addr; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [37:0] dcache_io_ptw_pmp_2_mask; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_3_cfg_l; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [1:0] dcache_io_ptw_pmp_3_cfg_a; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_3_cfg_x; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_3_cfg_w; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_3_cfg_r; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [35:0] dcache_io_ptw_pmp_3_addr; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [37:0] dcache_io_ptw_pmp_3_mask; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_4_cfg_l; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [1:0] dcache_io_ptw_pmp_4_cfg_a; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_4_cfg_x; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_4_cfg_w; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_4_cfg_r; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [35:0] dcache_io_ptw_pmp_4_addr; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [37:0] dcache_io_ptw_pmp_4_mask; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_5_cfg_l; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [1:0] dcache_io_ptw_pmp_5_cfg_a; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_5_cfg_x; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_5_cfg_w; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_5_cfg_r; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [35:0] dcache_io_ptw_pmp_5_addr; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [37:0] dcache_io_ptw_pmp_5_mask; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_6_cfg_l; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [1:0] dcache_io_ptw_pmp_6_cfg_a; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_6_cfg_x; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_6_cfg_w; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_6_cfg_r; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [35:0] dcache_io_ptw_pmp_6_addr; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [37:0] dcache_io_ptw_pmp_6_mask; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_7_cfg_l; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [1:0] dcache_io_ptw_pmp_7_cfg_a; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_7_cfg_x; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_7_cfg_w; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  dcache_io_ptw_pmp_7_cfg_r; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [35:0] dcache_io_ptw_pmp_7_addr; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [37:0] dcache_io_ptw_pmp_7_mask; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire [63:0] dcache_io_ptw_customCSRs_csrs_0_value; // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
  wire  manycore_rocc_clock; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_reset; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_cmd_ready; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_cmd_valid; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [6:0] manycore_rocc_io_cmd_bits_inst_funct; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [4:0] manycore_rocc_io_cmd_bits_inst_rs2; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [4:0] manycore_rocc_io_cmd_bits_inst_rs1; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_cmd_bits_inst_xd; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_cmd_bits_inst_xs1; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_cmd_bits_inst_xs2; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [4:0] manycore_rocc_io_cmd_bits_inst_rd; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [6:0] manycore_rocc_io_cmd_bits_inst_opcode; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [63:0] manycore_rocc_io_cmd_bits_rs1; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [63:0] manycore_rocc_io_cmd_bits_rs2; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [1:0] manycore_rocc_io_cmd_bits_status_prv; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_resp_ready; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_resp_valid; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [4:0] manycore_rocc_io_resp_bits_rd; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [63:0] manycore_rocc_io_resp_bits_data; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_mem_req_ready; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_mem_req_valid; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [39:0] manycore_rocc_io_mem_req_bits_addr; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [7:0] manycore_rocc_io_mem_req_bits_tag; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [4:0] manycore_rocc_io_mem_req_bits_cmd; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_mem_req_bits_phys; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [63:0] manycore_rocc_io_mem_req_bits_data; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_mem_resp_valid; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [39:0] manycore_rocc_io_mem_resp_bits_addr; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [7:0] manycore_rocc_io_mem_resp_bits_tag; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [4:0] manycore_rocc_io_mem_resp_bits_cmd; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [63:0] manycore_rocc_io_mem_resp_bits_data; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_mem_resp_bits_replay; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_mem_resp_bits_has_data; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [63:0] manycore_rocc_io_mem_resp_bits_data_word_bypass; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire [63:0] manycore_rocc_io_mem_resp_bits_store_data; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_busy; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_interrupt; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  manycore_rocc_io_exception; // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
  wire  frontend_gated_clock; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_reset; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_auto_icache_master_out_a_ready; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_auto_icache_master_out_a_valid; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [37:0] frontend_auto_icache_master_out_a_bits_address; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_auto_icache_master_out_d_valid; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [2:0] frontend_auto_icache_master_out_d_bits_opcode; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [2:0] frontend_auto_icache_master_out_d_bits_size; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [63:0] frontend_auto_icache_master_out_d_bits_data; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_auto_icache_master_out_d_bits_corrupt; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [37:0] frontend_io_reset_vector; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_might_request; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_req_valid; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [39:0] frontend_io_cpu_req_bits_pc; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_req_bits_speculative; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_sfence_valid; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_sfence_bits_rs1; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_sfence_bits_rs2; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [38:0] frontend_io_cpu_sfence_bits_addr; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_resp_ready; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_resp_valid; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_resp_bits_btb_taken; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_resp_bits_btb_bridx; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [4:0] frontend_io_cpu_resp_bits_btb_entry; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [7:0] frontend_io_cpu_resp_bits_btb_bht_history; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [39:0] frontend_io_cpu_resp_bits_pc; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [31:0] frontend_io_cpu_resp_bits_data; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_resp_bits_xcpt_pf_inst; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_resp_bits_xcpt_ae_inst; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_resp_bits_replay; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_btb_update_valid; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [4:0] frontend_io_cpu_btb_update_bits_prediction_entry; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [38:0] frontend_io_cpu_btb_update_bits_pc; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_btb_update_bits_isValid; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [38:0] frontend_io_cpu_btb_update_bits_br_pc; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [1:0] frontend_io_cpu_btb_update_bits_cfiType; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_bht_update_valid; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [7:0] frontend_io_cpu_bht_update_bits_prediction_history; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [38:0] frontend_io_cpu_bht_update_bits_pc; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_bht_update_bits_branch; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_bht_update_bits_taken; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_bht_update_bits_mispredict; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_cpu_flush_icache; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [39:0] frontend_io_cpu_npc; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_req_ready; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_req_valid; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_req_bits_valid; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [26:0] frontend_io_ptw_req_bits_bits_addr; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_resp_valid; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_resp_bits_ae; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [53:0] frontend_io_ptw_resp_bits_pte_ppn; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_resp_bits_pte_d; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_resp_bits_pte_a; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_resp_bits_pte_g; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_resp_bits_pte_u; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_resp_bits_pte_x; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_resp_bits_pte_w; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_resp_bits_pte_r; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_resp_bits_pte_v; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [1:0] frontend_io_ptw_resp_bits_level; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_resp_bits_fragmented_superpage; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_resp_bits_homogeneous; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [3:0] frontend_io_ptw_ptbr_mode; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [1:0] frontend_io_ptw_status_prv; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_0_cfg_l; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [1:0] frontend_io_ptw_pmp_0_cfg_a; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_0_cfg_x; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_0_cfg_w; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_0_cfg_r; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [35:0] frontend_io_ptw_pmp_0_addr; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [37:0] frontend_io_ptw_pmp_0_mask; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_1_cfg_l; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [1:0] frontend_io_ptw_pmp_1_cfg_a; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_1_cfg_x; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_1_cfg_w; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_1_cfg_r; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [35:0] frontend_io_ptw_pmp_1_addr; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [37:0] frontend_io_ptw_pmp_1_mask; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_2_cfg_l; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [1:0] frontend_io_ptw_pmp_2_cfg_a; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_2_cfg_x; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_2_cfg_w; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_2_cfg_r; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [35:0] frontend_io_ptw_pmp_2_addr; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [37:0] frontend_io_ptw_pmp_2_mask; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_3_cfg_l; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [1:0] frontend_io_ptw_pmp_3_cfg_a; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_3_cfg_x; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_3_cfg_w; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_3_cfg_r; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [35:0] frontend_io_ptw_pmp_3_addr; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [37:0] frontend_io_ptw_pmp_3_mask; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_4_cfg_l; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [1:0] frontend_io_ptw_pmp_4_cfg_a; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_4_cfg_x; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_4_cfg_w; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_4_cfg_r; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [35:0] frontend_io_ptw_pmp_4_addr; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [37:0] frontend_io_ptw_pmp_4_mask; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_5_cfg_l; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [1:0] frontend_io_ptw_pmp_5_cfg_a; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_5_cfg_x; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_5_cfg_w; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_5_cfg_r; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [35:0] frontend_io_ptw_pmp_5_addr; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [37:0] frontend_io_ptw_pmp_5_mask; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_6_cfg_l; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [1:0] frontend_io_ptw_pmp_6_cfg_a; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_6_cfg_x; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_6_cfg_w; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_6_cfg_r; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [35:0] frontend_io_ptw_pmp_6_addr; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [37:0] frontend_io_ptw_pmp_6_mask; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_7_cfg_l; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [1:0] frontend_io_ptw_pmp_7_cfg_a; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_7_cfg_x; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_7_cfg_w; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  frontend_io_ptw_pmp_7_cfg_r; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [35:0] frontend_io_ptw_pmp_7_addr; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire [37:0] frontend_io_ptw_pmp_7_mask; // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
  wire  buffer_clock; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_reset; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_a_ready; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_a_valid; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_in_a_bits_opcode; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_in_a_bits_param; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_in_a_bits_size; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [1:0] buffer_auto_in_a_bits_source; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [37:0] buffer_auto_in_a_bits_address; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [7:0] buffer_auto_in_a_bits_mask; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [63:0] buffer_auto_in_a_bits_data; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_b_ready; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_b_valid; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_in_b_bits_opcode; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [1:0] buffer_auto_in_b_bits_param; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_in_b_bits_size; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [1:0] buffer_auto_in_b_bits_source; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [37:0] buffer_auto_in_b_bits_address; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [7:0] buffer_auto_in_b_bits_mask; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_b_bits_corrupt; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_c_ready; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_c_valid; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_in_c_bits_opcode; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_in_c_bits_param; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_in_c_bits_size; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [1:0] buffer_auto_in_c_bits_source; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [37:0] buffer_auto_in_c_bits_address; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [63:0] buffer_auto_in_c_bits_data; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_c_bits_corrupt; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_d_ready; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_d_valid; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [1:0] buffer_auto_in_d_bits_param; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_in_d_bits_size; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [1:0] buffer_auto_in_d_bits_source; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_in_d_bits_sink; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_d_bits_denied; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [63:0] buffer_auto_in_d_bits_data; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_e_ready; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_in_e_valid; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_in_e_bits_sink; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_a_ready; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_a_valid; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_out_a_bits_param; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_out_a_bits_size; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [1:0] buffer_auto_out_a_bits_source; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [37:0] buffer_auto_out_a_bits_address; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [7:0] buffer_auto_out_a_bits_mask; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [63:0] buffer_auto_out_a_bits_data; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_b_ready; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_b_valid; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_out_b_bits_opcode; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [1:0] buffer_auto_out_b_bits_param; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_out_b_bits_size; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [1:0] buffer_auto_out_b_bits_source; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [37:0] buffer_auto_out_b_bits_address; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [7:0] buffer_auto_out_b_bits_mask; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_b_bits_corrupt; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_c_ready; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_c_valid; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_out_c_bits_opcode; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_out_c_bits_param; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_out_c_bits_size; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [1:0] buffer_auto_out_c_bits_source; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [37:0] buffer_auto_out_c_bits_address; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [63:0] buffer_auto_out_c_bits_data; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_c_bits_corrupt; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_d_ready; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_d_valid; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [1:0] buffer_auto_out_d_bits_param; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_out_d_bits_size; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [1:0] buffer_auto_out_d_bits_source; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_out_d_bits_sink; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_d_bits_denied; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [63:0] buffer_auto_out_d_bits_data; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_d_bits_corrupt; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_e_ready; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  buffer_auto_out_e_valid; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire [2:0] buffer_auto_out_e_bits_sink; // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
  wire  intsink_clock; // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314239.4]
  wire  intsink_auto_in_sync_0; // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314239.4]
  wire  intsink_auto_out_0; // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314239.4]
  wire  intsink_1_auto_in_sync_0; // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314245.4]
  wire  intsink_1_auto_in_sync_1; // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314245.4]
  wire  intsink_1_auto_out_0; // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314245.4]
  wire  intsink_1_auto_out_1; // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314245.4]
  wire  intsink_2_auto_in_sync_0; // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314251.4]
  wire  intsink_2_auto_out_0; // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314251.4]
  wire  intsink_3_auto_in_sync_0; // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314257.4]
  wire  intsink_3_auto_out_0; // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314257.4]
  wire  fpuOpt_clock; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_reset; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [31:0] fpuOpt_io_inst; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [63:0] fpuOpt_io_fromint_data; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [2:0] fpuOpt_io_fcsr_rm; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_fcsr_flags_valid; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [4:0] fpuOpt_io_fcsr_flags_bits; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [63:0] fpuOpt_io_store_data; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [63:0] fpuOpt_io_toint_data; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_dmem_resp_val; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [2:0] fpuOpt_io_dmem_resp_type; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [4:0] fpuOpt_io_dmem_resp_tag; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [63:0] fpuOpt_io_dmem_resp_data; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_valid; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_fcsr_rdy; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_nack_mem; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_illegal_rm; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_killx; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_killm; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_dec_wen; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_dec_ren1; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_dec_ren2; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_dec_ren3; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_sboard_set; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_sboard_clr; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [4:0] fpuOpt_io_sboard_clra; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_ready; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_valid; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_bits_ren2; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_bits_ren3; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_bits_swap23; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_bits_singleIn; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_bits_singleOut; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_bits_fromint; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_bits_toint; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_bits_fastpipe; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_bits_fma; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_bits_div; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_bits_sqrt; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  fpuOpt_io_cp_req_bits_wflags; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [2:0] fpuOpt_io_cp_req_bits_rm; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [1:0] fpuOpt_io_cp_req_bits_fmaCmd; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [1:0] fpuOpt_io_cp_req_bits_typ; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [64:0] fpuOpt_io_cp_req_bits_in1; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [64:0] fpuOpt_io_cp_req_bits_in2; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire [64:0] fpuOpt_io_cp_req_bits_in3; // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
  wire  dcacheArb_clock; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_0_req_ready; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_0_req_valid; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [39:0] dcacheArb_io_requestor_0_req_bits_addr; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [7:0] dcacheArb_io_requestor_0_req_bits_tag; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [4:0] dcacheArb_io_requestor_0_req_bits_cmd; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [2:0] dcacheArb_io_requestor_0_req_bits_typ; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_0_req_bits_phys; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_0_s1_kill; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_requestor_0_s1_data_data; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [7:0] dcacheArb_io_requestor_0_s1_data_mask; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_0_s2_nack; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_0_s2_kill; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_0_resp_valid; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_requestor_0_resp_bits_data_word_bypass; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_0_s2_xcpt_ae_ld; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_0_keep_clock_enabled; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_req_ready; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_req_valid; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [39:0] dcacheArb_io_requestor_1_req_bits_addr; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [7:0] dcacheArb_io_requestor_1_req_bits_tag; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [4:0] dcacheArb_io_requestor_1_req_bits_cmd; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [2:0] dcacheArb_io_requestor_1_req_bits_typ; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_req_bits_phys; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_s1_kill; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_requestor_1_s1_data_data; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [7:0] dcacheArb_io_requestor_1_s1_data_mask; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_s2_nack; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_s2_kill; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_resp_valid; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [39:0] dcacheArb_io_requestor_1_resp_bits_addr; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [7:0] dcacheArb_io_requestor_1_resp_bits_tag; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [4:0] dcacheArb_io_requestor_1_resp_bits_cmd; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_requestor_1_resp_bits_data; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_resp_bits_replay; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_resp_bits_has_data; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_requestor_1_resp_bits_data_word_bypass; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_requestor_1_resp_bits_store_data; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_s2_xcpt_ma_ld; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_s2_xcpt_ma_st; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_s2_xcpt_pf_ld; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_s2_xcpt_pf_st; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_s2_xcpt_ae_ld; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_s2_xcpt_ae_st; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_1_keep_clock_enabled; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_req_ready; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_req_valid; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [39:0] dcacheArb_io_requestor_2_req_bits_addr; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [7:0] dcacheArb_io_requestor_2_req_bits_tag; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [4:0] dcacheArb_io_requestor_2_req_bits_cmd; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [2:0] dcacheArb_io_requestor_2_req_bits_typ; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_req_bits_phys; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_s1_kill; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_requestor_2_s1_data_data; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [7:0] dcacheArb_io_requestor_2_s1_data_mask; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_s2_nack; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_s2_kill; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_resp_valid; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [7:0] dcacheArb_io_requestor_2_resp_bits_tag; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [2:0] dcacheArb_io_requestor_2_resp_bits_typ; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_requestor_2_resp_bits_data; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_resp_bits_replay; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_resp_bits_has_data; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_requestor_2_resp_bits_data_word_bypass; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_replay_next; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_s2_xcpt_ma_ld; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_s2_xcpt_ma_st; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_s2_xcpt_pf_ld; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_s2_xcpt_pf_st; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_s2_xcpt_ae_ld; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_s2_xcpt_ae_st; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_ordered; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_perf_grant; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_keep_clock_enabled; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_requestor_2_clock_enabled; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_req_ready; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_req_valid; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [39:0] dcacheArb_io_mem_req_bits_addr; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [7:0] dcacheArb_io_mem_req_bits_tag; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [4:0] dcacheArb_io_mem_req_bits_cmd; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [2:0] dcacheArb_io_mem_req_bits_typ; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_req_bits_phys; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_s1_kill; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_mem_s1_data_data; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [7:0] dcacheArb_io_mem_s1_data_mask; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_s2_nack; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_s2_kill; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_resp_valid; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [39:0] dcacheArb_io_mem_resp_bits_addr; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [7:0] dcacheArb_io_mem_resp_bits_tag; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [4:0] dcacheArb_io_mem_resp_bits_cmd; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [2:0] dcacheArb_io_mem_resp_bits_typ; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_mem_resp_bits_data; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_resp_bits_replay; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_resp_bits_has_data; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_mem_resp_bits_data_word_bypass; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire [63:0] dcacheArb_io_mem_resp_bits_store_data; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_replay_next; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_s2_xcpt_ma_ld; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_s2_xcpt_ma_st; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_s2_xcpt_pf_ld; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_s2_xcpt_pf_st; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_s2_xcpt_ae_ld; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_s2_xcpt_ae_st; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_ordered; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_perf_grant; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_keep_clock_enabled; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  dcacheArb_io_mem_clock_enabled; // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
  wire  ptw_clock; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_reset; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_req_ready; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_req_valid; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_req_bits_valid; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [26:0] ptw_io_requestor_0_req_bits_bits_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_resp_valid; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_resp_bits_ae; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [53:0] ptw_io_requestor_0_resp_bits_pte_ppn; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_resp_bits_pte_d; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_resp_bits_pte_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_resp_bits_pte_g; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_resp_bits_pte_u; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_resp_bits_pte_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_resp_bits_pte_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_resp_bits_pte_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_resp_bits_pte_v; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_0_resp_bits_level; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_resp_bits_homogeneous; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [3:0] ptw_io_requestor_0_ptbr_mode; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_0_status_dprv; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_status_mxr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_status_sum; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_0_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_0_pmp_0_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_0_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_0_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_0_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_0_pmp_0_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_0_pmp_0_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_1_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_0_pmp_1_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_1_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_1_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_1_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_0_pmp_1_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_0_pmp_1_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_2_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_0_pmp_2_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_2_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_2_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_2_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_0_pmp_2_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_0_pmp_2_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_3_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_0_pmp_3_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_3_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_3_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_3_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_0_pmp_3_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_0_pmp_3_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_4_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_0_pmp_4_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_4_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_4_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_4_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_0_pmp_4_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_0_pmp_4_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_5_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_0_pmp_5_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_5_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_5_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_5_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_0_pmp_5_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_0_pmp_5_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_6_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_0_pmp_6_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_6_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_6_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_6_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_0_pmp_6_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_0_pmp_6_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_7_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_0_pmp_7_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_7_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_7_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_0_pmp_7_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_0_pmp_7_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_0_pmp_7_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [63:0] ptw_io_requestor_0_customCSRs_csrs_0_value; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_req_ready; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_req_valid; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_req_bits_valid; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [26:0] ptw_io_requestor_1_req_bits_bits_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_resp_valid; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_resp_bits_ae; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [53:0] ptw_io_requestor_1_resp_bits_pte_ppn; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_resp_bits_pte_d; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_resp_bits_pte_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_resp_bits_pte_g; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_resp_bits_pte_u; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_resp_bits_pte_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_resp_bits_pte_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_resp_bits_pte_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_resp_bits_pte_v; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_1_resp_bits_level; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_resp_bits_homogeneous; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [3:0] ptw_io_requestor_1_ptbr_mode; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_1_status_prv; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_0_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_1_pmp_0_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_0_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_0_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_0_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_1_pmp_0_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_1_pmp_0_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_1_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_1_pmp_1_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_1_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_1_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_1_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_1_pmp_1_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_1_pmp_1_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_2_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_1_pmp_2_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_2_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_2_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_2_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_1_pmp_2_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_1_pmp_2_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_3_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_1_pmp_3_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_3_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_3_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_3_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_1_pmp_3_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_1_pmp_3_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_4_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_1_pmp_4_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_4_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_4_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_4_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_1_pmp_4_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_1_pmp_4_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_5_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_1_pmp_5_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_5_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_5_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_5_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_1_pmp_5_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_1_pmp_5_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_6_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_1_pmp_6_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_6_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_6_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_6_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_1_pmp_6_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_1_pmp_6_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_7_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_requestor_1_pmp_7_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_7_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_7_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_requestor_1_pmp_7_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_requestor_1_pmp_7_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_requestor_1_pmp_7_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_mem_req_ready; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_mem_req_valid; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [39:0] ptw_io_mem_req_bits_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_mem_s1_kill; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_mem_s2_nack; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_mem_resp_valid; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [63:0] ptw_io_mem_resp_bits_data_word_bypass; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_mem_s2_xcpt_ae_ld; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [3:0] ptw_io_dpath_ptbr_mode; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [43:0] ptw_io_dpath_ptbr_ppn; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_sfence_valid; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_sfence_bits_rs1; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_dpath_status_dprv; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_dpath_status_prv; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_status_mxr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_status_sum; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_0_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_dpath_pmp_0_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_0_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_0_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_0_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_dpath_pmp_0_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_dpath_pmp_0_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_1_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_dpath_pmp_1_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_1_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_1_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_1_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_dpath_pmp_1_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_dpath_pmp_1_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_2_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_dpath_pmp_2_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_2_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_2_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_2_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_dpath_pmp_2_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_dpath_pmp_2_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_3_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_dpath_pmp_3_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_3_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_3_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_3_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_dpath_pmp_3_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_dpath_pmp_3_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_4_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_dpath_pmp_4_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_4_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_4_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_4_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_dpath_pmp_4_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_dpath_pmp_4_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_5_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_dpath_pmp_5_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_5_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_5_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_5_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_dpath_pmp_5_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_dpath_pmp_5_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_6_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_dpath_pmp_6_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_6_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_6_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_6_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_dpath_pmp_6_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_dpath_pmp_6_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_7_cfg_l; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [1:0] ptw_io_dpath_pmp_7_cfg_a; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_7_cfg_x; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_7_cfg_w; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  ptw_io_dpath_pmp_7_cfg_r; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [35:0] ptw_io_dpath_pmp_7_addr; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [37:0] ptw_io_dpath_pmp_7_mask; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire [63:0] ptw_io_dpath_customCSRs_csrs_0_value; // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
  wire  respArb_io_in_0_ready; // @[LazyRoCC.scala 86:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314357.4]
  wire  respArb_io_in_0_valid; // @[LazyRoCC.scala 86:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314357.4]
  wire [4:0] respArb_io_in_0_bits_rd; // @[LazyRoCC.scala 86:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314357.4]
  wire [63:0] respArb_io_in_0_bits_data; // @[LazyRoCC.scala 86:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314357.4]
  wire  respArb_io_out_ready; // @[LazyRoCC.scala 86:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314357.4]
  wire  respArb_io_out_valid; // @[LazyRoCC.scala 86:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314357.4]
  wire [4:0] respArb_io_out_bits_rd; // @[LazyRoCC.scala 86:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314357.4]
  wire [63:0] respArb_io_out_bits_data; // @[LazyRoCC.scala 86:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314357.4]
  wire  cmdRouter_clock; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  cmdRouter_reset; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  cmdRouter_io_in_ready; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  cmdRouter_io_in_valid; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [6:0] cmdRouter_io_in_bits_inst_funct; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [4:0] cmdRouter_io_in_bits_inst_rs2; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [4:0] cmdRouter_io_in_bits_inst_rs1; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  cmdRouter_io_in_bits_inst_xd; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  cmdRouter_io_in_bits_inst_xs1; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  cmdRouter_io_in_bits_inst_xs2; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [4:0] cmdRouter_io_in_bits_inst_rd; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [6:0] cmdRouter_io_in_bits_inst_opcode; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [63:0] cmdRouter_io_in_bits_rs1; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [63:0] cmdRouter_io_in_bits_rs2; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [1:0] cmdRouter_io_in_bits_status_prv; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  cmdRouter_io_out_0_ready; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  cmdRouter_io_out_0_valid; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [6:0] cmdRouter_io_out_0_bits_inst_funct; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [4:0] cmdRouter_io_out_0_bits_inst_rs2; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [4:0] cmdRouter_io_out_0_bits_inst_rs1; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  cmdRouter_io_out_0_bits_inst_xd; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  cmdRouter_io_out_0_bits_inst_xs1; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  cmdRouter_io_out_0_bits_inst_xs2; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [4:0] cmdRouter_io_out_0_bits_inst_rd; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [6:0] cmdRouter_io_out_0_bits_inst_opcode; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [63:0] cmdRouter_io_out_0_bits_rs1; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [63:0] cmdRouter_io_out_0_bits_rs2; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire [1:0] cmdRouter_io_out_0_bits_status_prv; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  cmdRouter_io_busy; // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
  wire  SimpleHellaCacheIF_clock; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_reset; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_requestor_req_ready; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_requestor_req_valid; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [39:0] SimpleHellaCacheIF_io_requestor_req_bits_addr; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [7:0] SimpleHellaCacheIF_io_requestor_req_bits_tag; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [4:0] SimpleHellaCacheIF_io_requestor_req_bits_cmd; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [2:0] SimpleHellaCacheIF_io_requestor_req_bits_typ; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_requestor_req_bits_phys; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [63:0] SimpleHellaCacheIF_io_requestor_req_bits_data; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_requestor_resp_valid; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [39:0] SimpleHellaCacheIF_io_requestor_resp_bits_addr; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [7:0] SimpleHellaCacheIF_io_requestor_resp_bits_tag; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [4:0] SimpleHellaCacheIF_io_requestor_resp_bits_cmd; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [63:0] SimpleHellaCacheIF_io_requestor_resp_bits_data; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_requestor_resp_bits_replay; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_requestor_resp_bits_has_data; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [63:0] SimpleHellaCacheIF_io_requestor_resp_bits_data_word_bypass; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [63:0] SimpleHellaCacheIF_io_requestor_resp_bits_store_data; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_req_ready; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_req_valid; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [39:0] SimpleHellaCacheIF_io_cache_req_bits_addr; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [7:0] SimpleHellaCacheIF_io_cache_req_bits_tag; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [4:0] SimpleHellaCacheIF_io_cache_req_bits_cmd; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [2:0] SimpleHellaCacheIF_io_cache_req_bits_typ; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_req_bits_phys; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_s1_kill; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [63:0] SimpleHellaCacheIF_io_cache_s1_data_data; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_s2_nack; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_resp_valid; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [39:0] SimpleHellaCacheIF_io_cache_resp_bits_addr; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [7:0] SimpleHellaCacheIF_io_cache_resp_bits_tag; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [4:0] SimpleHellaCacheIF_io_cache_resp_bits_cmd; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [63:0] SimpleHellaCacheIF_io_cache_resp_bits_data; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_resp_bits_replay; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_resp_bits_has_data; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [63:0] SimpleHellaCacheIF_io_cache_resp_bits_data_word_bypass; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire [63:0] SimpleHellaCacheIF_io_cache_resp_bits_store_data; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_s2_xcpt_ma_ld; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_s2_xcpt_ma_st; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_s2_xcpt_pf_ld; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_s2_xcpt_pf_st; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_s2_xcpt_ae_ld; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  SimpleHellaCacheIF_io_cache_s2_xcpt_ae_st; // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
  wire  Queue_clock; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314371.4]
  wire  Queue_reset; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314371.4]
  wire  Queue_io_enq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314371.4]
  wire  Queue_io_enq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314371.4]
  wire [4:0] Queue_io_enq_bits_rd; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314371.4]
  wire [63:0] Queue_io_enq_bits_data; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314371.4]
  wire  Queue_io_deq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314371.4]
  wire  Queue_io_deq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314371.4]
  wire [4:0] Queue_io_deq_bits_rd; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314371.4]
  wire [63:0] Queue_io_deq_bits_data; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314371.4]
  wire  core_clock; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_reset; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_hartid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_interrupts_debug; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_interrupts_mtip; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_interrupts_msip; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_interrupts_meip; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_interrupts_seip; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_might_request; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_req_valid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [39:0] core_io_imem_req_bits_pc; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_req_bits_speculative; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_sfence_valid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_sfence_bits_rs1; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_sfence_bits_rs2; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [38:0] core_io_imem_sfence_bits_addr; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_resp_ready; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_resp_valid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_resp_bits_btb_taken; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_resp_bits_btb_bridx; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [4:0] core_io_imem_resp_bits_btb_entry; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [7:0] core_io_imem_resp_bits_btb_bht_history; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [39:0] core_io_imem_resp_bits_pc; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [31:0] core_io_imem_resp_bits_data; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_resp_bits_xcpt_pf_inst; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_resp_bits_xcpt_ae_inst; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_resp_bits_replay; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_btb_update_valid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [4:0] core_io_imem_btb_update_bits_prediction_entry; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [38:0] core_io_imem_btb_update_bits_pc; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_btb_update_bits_isValid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [38:0] core_io_imem_btb_update_bits_br_pc; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_imem_btb_update_bits_cfiType; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_bht_update_valid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [7:0] core_io_imem_bht_update_bits_prediction_history; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [38:0] core_io_imem_bht_update_bits_pc; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_bht_update_bits_branch; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_bht_update_bits_taken; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_bht_update_bits_mispredict; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_imem_flush_icache; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_req_ready; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_req_valid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [39:0] core_io_dmem_req_bits_addr; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [7:0] core_io_dmem_req_bits_tag; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [4:0] core_io_dmem_req_bits_cmd; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [2:0] core_io_dmem_req_bits_typ; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_s1_kill; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [63:0] core_io_dmem_s1_data_data; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_s2_nack; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_resp_valid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [7:0] core_io_dmem_resp_bits_tag; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [2:0] core_io_dmem_resp_bits_typ; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [63:0] core_io_dmem_resp_bits_data; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_resp_bits_replay; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_resp_bits_has_data; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [63:0] core_io_dmem_resp_bits_data_word_bypass; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_replay_next; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_s2_xcpt_ma_ld; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_s2_xcpt_ma_st; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_s2_xcpt_pf_ld; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_s2_xcpt_pf_st; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_s2_xcpt_ae_ld; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_s2_xcpt_ae_st; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_ordered; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_perf_grant; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_keep_clock_enabled; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_dmem_clock_enabled; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [3:0] core_io_ptw_ptbr_mode; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [43:0] core_io_ptw_ptbr_ppn; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_sfence_valid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_sfence_bits_rs1; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_ptw_status_dprv; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_ptw_status_prv; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_status_mxr; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_status_sum; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_0_cfg_l; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_ptw_pmp_0_cfg_a; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_0_cfg_x; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_0_cfg_w; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_0_cfg_r; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [35:0] core_io_ptw_pmp_0_addr; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [37:0] core_io_ptw_pmp_0_mask; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_1_cfg_l; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_ptw_pmp_1_cfg_a; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_1_cfg_x; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_1_cfg_w; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_1_cfg_r; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [35:0] core_io_ptw_pmp_1_addr; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [37:0] core_io_ptw_pmp_1_mask; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_2_cfg_l; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_ptw_pmp_2_cfg_a; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_2_cfg_x; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_2_cfg_w; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_2_cfg_r; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [35:0] core_io_ptw_pmp_2_addr; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [37:0] core_io_ptw_pmp_2_mask; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_3_cfg_l; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_ptw_pmp_3_cfg_a; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_3_cfg_x; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_3_cfg_w; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_3_cfg_r; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [35:0] core_io_ptw_pmp_3_addr; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [37:0] core_io_ptw_pmp_3_mask; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_4_cfg_l; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_ptw_pmp_4_cfg_a; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_4_cfg_x; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_4_cfg_w; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_4_cfg_r; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [35:0] core_io_ptw_pmp_4_addr; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [37:0] core_io_ptw_pmp_4_mask; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_5_cfg_l; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_ptw_pmp_5_cfg_a; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_5_cfg_x; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_5_cfg_w; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_5_cfg_r; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [35:0] core_io_ptw_pmp_5_addr; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [37:0] core_io_ptw_pmp_5_mask; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_6_cfg_l; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_ptw_pmp_6_cfg_a; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_6_cfg_x; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_6_cfg_w; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_6_cfg_r; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [35:0] core_io_ptw_pmp_6_addr; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [37:0] core_io_ptw_pmp_6_mask; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_7_cfg_l; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_ptw_pmp_7_cfg_a; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_7_cfg_x; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_7_cfg_w; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_ptw_pmp_7_cfg_r; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [35:0] core_io_ptw_pmp_7_addr; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [37:0] core_io_ptw_pmp_7_mask; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [63:0] core_io_ptw_customCSRs_csrs_0_value; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [31:0] core_io_fpu_inst; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [63:0] core_io_fpu_fromint_data; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [2:0] core_io_fpu_fcsr_rm; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_fcsr_flags_valid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [4:0] core_io_fpu_fcsr_flags_bits; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [63:0] core_io_fpu_store_data; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [63:0] core_io_fpu_toint_data; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_dmem_resp_val; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [2:0] core_io_fpu_dmem_resp_type; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [4:0] core_io_fpu_dmem_resp_tag; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [63:0] core_io_fpu_dmem_resp_data; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_valid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_fcsr_rdy; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_nack_mem; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_illegal_rm; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_killx; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_killm; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_dec_wen; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_dec_ren1; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_dec_ren2; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_dec_ren3; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_sboard_set; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_fpu_sboard_clr; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [4:0] core_io_fpu_sboard_clra; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_rocc_cmd_ready; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_rocc_cmd_valid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [6:0] core_io_rocc_cmd_bits_inst_funct; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [4:0] core_io_rocc_cmd_bits_inst_rs2; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [4:0] core_io_rocc_cmd_bits_inst_rs1; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_rocc_cmd_bits_inst_xd; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_rocc_cmd_bits_inst_xs1; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_rocc_cmd_bits_inst_xs2; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [4:0] core_io_rocc_cmd_bits_inst_rd; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [6:0] core_io_rocc_cmd_bits_inst_opcode; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [63:0] core_io_rocc_cmd_bits_rs1; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [63:0] core_io_rocc_cmd_bits_rs2; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [1:0] core_io_rocc_cmd_bits_status_prv; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_rocc_resp_ready; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_rocc_resp_valid; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [4:0] core_io_rocc_resp_bits_rd; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire [63:0] core_io_rocc_resp_bits_data; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_rocc_busy; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_rocc_interrupt; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  wire  core_io_rocc_exception; // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
  TLXbar_8 tlMasterXbar ( // @[BaseTile.scala 142:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314176.4]
    .clock(tlMasterXbar_clock),
    .reset(tlMasterXbar_reset),
    .auto_in_1_a_ready(tlMasterXbar_auto_in_1_a_ready),
    .auto_in_1_a_valid(tlMasterXbar_auto_in_1_a_valid),
    .auto_in_1_a_bits_opcode(tlMasterXbar_auto_in_1_a_bits_opcode),
    .auto_in_1_a_bits_param(tlMasterXbar_auto_in_1_a_bits_param),
    .auto_in_1_a_bits_size(tlMasterXbar_auto_in_1_a_bits_size),
    .auto_in_1_a_bits_source(tlMasterXbar_auto_in_1_a_bits_source),
    .auto_in_1_a_bits_address(tlMasterXbar_auto_in_1_a_bits_address),
    .auto_in_1_a_bits_mask(tlMasterXbar_auto_in_1_a_bits_mask),
    .auto_in_1_a_bits_data(tlMasterXbar_auto_in_1_a_bits_data),
    .auto_in_1_a_bits_corrupt(tlMasterXbar_auto_in_1_a_bits_corrupt),
    .auto_in_1_c_valid(tlMasterXbar_auto_in_1_c_valid),
    .auto_in_1_d_ready(tlMasterXbar_auto_in_1_d_ready),
    .auto_in_1_d_valid(tlMasterXbar_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode(tlMasterXbar_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_size(tlMasterXbar_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_data(tlMasterXbar_auto_in_1_d_bits_data),
    .auto_in_1_d_bits_corrupt(tlMasterXbar_auto_in_1_d_bits_corrupt),
    .auto_in_1_e_valid(tlMasterXbar_auto_in_1_e_valid),
    .auto_in_0_a_ready(tlMasterXbar_auto_in_0_a_ready),
    .auto_in_0_a_valid(tlMasterXbar_auto_in_0_a_valid),
    .auto_in_0_a_bits_opcode(tlMasterXbar_auto_in_0_a_bits_opcode),
    .auto_in_0_a_bits_param(tlMasterXbar_auto_in_0_a_bits_param),
    .auto_in_0_a_bits_size(tlMasterXbar_auto_in_0_a_bits_size),
    .auto_in_0_a_bits_source(tlMasterXbar_auto_in_0_a_bits_source),
    .auto_in_0_a_bits_address(tlMasterXbar_auto_in_0_a_bits_address),
    .auto_in_0_a_bits_mask(tlMasterXbar_auto_in_0_a_bits_mask),
    .auto_in_0_a_bits_data(tlMasterXbar_auto_in_0_a_bits_data),
    .auto_in_0_a_bits_corrupt(tlMasterXbar_auto_in_0_a_bits_corrupt),
    .auto_in_0_b_ready(tlMasterXbar_auto_in_0_b_ready),
    .auto_in_0_b_valid(tlMasterXbar_auto_in_0_b_valid),
    .auto_in_0_b_bits_param(tlMasterXbar_auto_in_0_b_bits_param),
    .auto_in_0_b_bits_size(tlMasterXbar_auto_in_0_b_bits_size),
    .auto_in_0_b_bits_source(tlMasterXbar_auto_in_0_b_bits_source),
    .auto_in_0_b_bits_address(tlMasterXbar_auto_in_0_b_bits_address),
    .auto_in_0_c_ready(tlMasterXbar_auto_in_0_c_ready),
    .auto_in_0_c_valid(tlMasterXbar_auto_in_0_c_valid),
    .auto_in_0_c_bits_opcode(tlMasterXbar_auto_in_0_c_bits_opcode),
    .auto_in_0_c_bits_param(tlMasterXbar_auto_in_0_c_bits_param),
    .auto_in_0_c_bits_size(tlMasterXbar_auto_in_0_c_bits_size),
    .auto_in_0_c_bits_source(tlMasterXbar_auto_in_0_c_bits_source),
    .auto_in_0_c_bits_address(tlMasterXbar_auto_in_0_c_bits_address),
    .auto_in_0_c_bits_data(tlMasterXbar_auto_in_0_c_bits_data),
    .auto_in_0_c_bits_corrupt(tlMasterXbar_auto_in_0_c_bits_corrupt),
    .auto_in_0_d_ready(tlMasterXbar_auto_in_0_d_ready),
    .auto_in_0_d_valid(tlMasterXbar_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode(tlMasterXbar_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param(tlMasterXbar_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size(tlMasterXbar_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source(tlMasterXbar_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink(tlMasterXbar_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied(tlMasterXbar_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data(tlMasterXbar_auto_in_0_d_bits_data),
    .auto_in_0_e_ready(tlMasterXbar_auto_in_0_e_ready),
    .auto_in_0_e_valid(tlMasterXbar_auto_in_0_e_valid),
    .auto_in_0_e_bits_sink(tlMasterXbar_auto_in_0_e_bits_sink),
    .auto_out_a_ready(tlMasterXbar_auto_out_a_ready),
    .auto_out_a_valid(tlMasterXbar_auto_out_a_valid),
    .auto_out_a_bits_opcode(tlMasterXbar_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(tlMasterXbar_auto_out_a_bits_param),
    .auto_out_a_bits_size(tlMasterXbar_auto_out_a_bits_size),
    .auto_out_a_bits_source(tlMasterXbar_auto_out_a_bits_source),
    .auto_out_a_bits_address(tlMasterXbar_auto_out_a_bits_address),
    .auto_out_a_bits_mask(tlMasterXbar_auto_out_a_bits_mask),
    .auto_out_a_bits_data(tlMasterXbar_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(tlMasterXbar_auto_out_a_bits_corrupt),
    .auto_out_b_ready(tlMasterXbar_auto_out_b_ready),
    .auto_out_b_valid(tlMasterXbar_auto_out_b_valid),
    .auto_out_b_bits_opcode(tlMasterXbar_auto_out_b_bits_opcode),
    .auto_out_b_bits_param(tlMasterXbar_auto_out_b_bits_param),
    .auto_out_b_bits_size(tlMasterXbar_auto_out_b_bits_size),
    .auto_out_b_bits_source(tlMasterXbar_auto_out_b_bits_source),
    .auto_out_b_bits_address(tlMasterXbar_auto_out_b_bits_address),
    .auto_out_b_bits_mask(tlMasterXbar_auto_out_b_bits_mask),
    .auto_out_b_bits_corrupt(tlMasterXbar_auto_out_b_bits_corrupt),
    .auto_out_c_ready(tlMasterXbar_auto_out_c_ready),
    .auto_out_c_valid(tlMasterXbar_auto_out_c_valid),
    .auto_out_c_bits_opcode(tlMasterXbar_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(tlMasterXbar_auto_out_c_bits_param),
    .auto_out_c_bits_size(tlMasterXbar_auto_out_c_bits_size),
    .auto_out_c_bits_source(tlMasterXbar_auto_out_c_bits_source),
    .auto_out_c_bits_address(tlMasterXbar_auto_out_c_bits_address),
    .auto_out_c_bits_data(tlMasterXbar_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt(tlMasterXbar_auto_out_c_bits_corrupt),
    .auto_out_d_ready(tlMasterXbar_auto_out_d_ready),
    .auto_out_d_valid(tlMasterXbar_auto_out_d_valid),
    .auto_out_d_bits_opcode(tlMasterXbar_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(tlMasterXbar_auto_out_d_bits_param),
    .auto_out_d_bits_size(tlMasterXbar_auto_out_d_bits_size),
    .auto_out_d_bits_source(tlMasterXbar_auto_out_d_bits_source),
    .auto_out_d_bits_sink(tlMasterXbar_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(tlMasterXbar_auto_out_d_bits_denied),
    .auto_out_d_bits_data(tlMasterXbar_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(tlMasterXbar_auto_out_d_bits_corrupt),
    .auto_out_e_ready(tlMasterXbar_auto_out_e_ready),
    .auto_out_e_valid(tlMasterXbar_auto_out_e_valid),
    .auto_out_e_bits_sink(tlMasterXbar_auto_out_e_bits_sink)
  );
  IntXbar_1 intXbar ( // @[BaseTile.scala 144:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314188.4]
    .auto_int_in_3_0(intXbar_auto_int_in_3_0),
    .auto_int_in_2_0(intXbar_auto_int_in_2_0),
    .auto_int_in_1_0(intXbar_auto_int_in_1_0),
    .auto_int_in_1_1(intXbar_auto_int_in_1_1),
    .auto_int_in_0_0(intXbar_auto_int_in_0_0),
    .auto_int_out_0(intXbar_auto_int_out_0),
    .auto_int_out_1(intXbar_auto_int_out_1),
    .auto_int_out_2(intXbar_auto_int_out_2),
    .auto_int_out_3(intXbar_auto_int_out_3),
    .auto_int_out_4(intXbar_auto_int_out_4)
  );
  DCache dcache ( // @[HellaCache.scala 215:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314194.4]
    .gated_clock(dcache_gated_clock),
    .reset(dcache_reset),
    .auto_out_a_ready(dcache_auto_out_a_ready),
    .auto_out_a_valid(dcache_auto_out_a_valid),
    .auto_out_a_bits_opcode(dcache_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(dcache_auto_out_a_bits_param),
    .auto_out_a_bits_size(dcache_auto_out_a_bits_size),
    .auto_out_a_bits_source(dcache_auto_out_a_bits_source),
    .auto_out_a_bits_address(dcache_auto_out_a_bits_address),
    .auto_out_a_bits_mask(dcache_auto_out_a_bits_mask),
    .auto_out_a_bits_data(dcache_auto_out_a_bits_data),
    .auto_out_b_ready(dcache_auto_out_b_ready),
    .auto_out_b_valid(dcache_auto_out_b_valid),
    .auto_out_b_bits_param(dcache_auto_out_b_bits_param),
    .auto_out_b_bits_size(dcache_auto_out_b_bits_size),
    .auto_out_b_bits_source(dcache_auto_out_b_bits_source),
    .auto_out_b_bits_address(dcache_auto_out_b_bits_address),
    .auto_out_c_ready(dcache_auto_out_c_ready),
    .auto_out_c_valid(dcache_auto_out_c_valid),
    .auto_out_c_bits_opcode(dcache_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(dcache_auto_out_c_bits_param),
    .auto_out_c_bits_size(dcache_auto_out_c_bits_size),
    .auto_out_c_bits_source(dcache_auto_out_c_bits_source),
    .auto_out_c_bits_address(dcache_auto_out_c_bits_address),
    .auto_out_c_bits_data(dcache_auto_out_c_bits_data),
    .auto_out_d_ready(dcache_auto_out_d_ready),
    .auto_out_d_valid(dcache_auto_out_d_valid),
    .auto_out_d_bits_opcode(dcache_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(dcache_auto_out_d_bits_param),
    .auto_out_d_bits_size(dcache_auto_out_d_bits_size),
    .auto_out_d_bits_source(dcache_auto_out_d_bits_source),
    .auto_out_d_bits_sink(dcache_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(dcache_auto_out_d_bits_denied),
    .auto_out_d_bits_data(dcache_auto_out_d_bits_data),
    .auto_out_e_ready(dcache_auto_out_e_ready),
    .auto_out_e_valid(dcache_auto_out_e_valid),
    .auto_out_e_bits_sink(dcache_auto_out_e_bits_sink),
    .io_cpu_req_ready(dcache_io_cpu_req_ready),
    .io_cpu_req_valid(dcache_io_cpu_req_valid),
    .io_cpu_req_bits_addr(dcache_io_cpu_req_bits_addr),
    .io_cpu_req_bits_tag(dcache_io_cpu_req_bits_tag),
    .io_cpu_req_bits_cmd(dcache_io_cpu_req_bits_cmd),
    .io_cpu_req_bits_typ(dcache_io_cpu_req_bits_typ),
    .io_cpu_req_bits_phys(dcache_io_cpu_req_bits_phys),
    .io_cpu_s1_kill(dcache_io_cpu_s1_kill),
    .io_cpu_s1_data_data(dcache_io_cpu_s1_data_data),
    .io_cpu_s1_data_mask(dcache_io_cpu_s1_data_mask),
    .io_cpu_s2_nack(dcache_io_cpu_s2_nack),
    .io_cpu_s2_kill(dcache_io_cpu_s2_kill),
    .io_cpu_resp_valid(dcache_io_cpu_resp_valid),
    .io_cpu_resp_bits_addr(dcache_io_cpu_resp_bits_addr),
    .io_cpu_resp_bits_tag(dcache_io_cpu_resp_bits_tag),
    .io_cpu_resp_bits_cmd(dcache_io_cpu_resp_bits_cmd),
    .io_cpu_resp_bits_typ(dcache_io_cpu_resp_bits_typ),
    .io_cpu_resp_bits_data(dcache_io_cpu_resp_bits_data),
    .io_cpu_resp_bits_replay(dcache_io_cpu_resp_bits_replay),
    .io_cpu_resp_bits_has_data(dcache_io_cpu_resp_bits_has_data),
    .io_cpu_resp_bits_data_word_bypass(dcache_io_cpu_resp_bits_data_word_bypass),
    .io_cpu_resp_bits_store_data(dcache_io_cpu_resp_bits_store_data),
    .io_cpu_replay_next(dcache_io_cpu_replay_next),
    .io_cpu_s2_xcpt_ma_ld(dcache_io_cpu_s2_xcpt_ma_ld),
    .io_cpu_s2_xcpt_ma_st(dcache_io_cpu_s2_xcpt_ma_st),
    .io_cpu_s2_xcpt_pf_ld(dcache_io_cpu_s2_xcpt_pf_ld),
    .io_cpu_s2_xcpt_pf_st(dcache_io_cpu_s2_xcpt_pf_st),
    .io_cpu_s2_xcpt_ae_ld(dcache_io_cpu_s2_xcpt_ae_ld),
    .io_cpu_s2_xcpt_ae_st(dcache_io_cpu_s2_xcpt_ae_st),
    .io_cpu_ordered(dcache_io_cpu_ordered),
    .io_cpu_perf_grant(dcache_io_cpu_perf_grant),
    .io_cpu_keep_clock_enabled(dcache_io_cpu_keep_clock_enabled),
    .io_cpu_clock_enabled(dcache_io_cpu_clock_enabled),
    .io_ptw_req_ready(dcache_io_ptw_req_ready),
    .io_ptw_req_valid(dcache_io_ptw_req_valid),
    .io_ptw_req_bits_valid(dcache_io_ptw_req_bits_valid),
    .io_ptw_req_bits_bits_addr(dcache_io_ptw_req_bits_bits_addr),
    .io_ptw_resp_valid(dcache_io_ptw_resp_valid),
    .io_ptw_resp_bits_ae(dcache_io_ptw_resp_bits_ae),
    .io_ptw_resp_bits_pte_ppn(dcache_io_ptw_resp_bits_pte_ppn),
    .io_ptw_resp_bits_pte_d(dcache_io_ptw_resp_bits_pte_d),
    .io_ptw_resp_bits_pte_a(dcache_io_ptw_resp_bits_pte_a),
    .io_ptw_resp_bits_pte_g(dcache_io_ptw_resp_bits_pte_g),
    .io_ptw_resp_bits_pte_u(dcache_io_ptw_resp_bits_pte_u),
    .io_ptw_resp_bits_pte_x(dcache_io_ptw_resp_bits_pte_x),
    .io_ptw_resp_bits_pte_w(dcache_io_ptw_resp_bits_pte_w),
    .io_ptw_resp_bits_pte_r(dcache_io_ptw_resp_bits_pte_r),
    .io_ptw_resp_bits_pte_v(dcache_io_ptw_resp_bits_pte_v),
    .io_ptw_resp_bits_level(dcache_io_ptw_resp_bits_level),
    .io_ptw_resp_bits_fragmented_superpage(dcache_io_ptw_resp_bits_fragmented_superpage),
    .io_ptw_resp_bits_homogeneous(dcache_io_ptw_resp_bits_homogeneous),
    .io_ptw_ptbr_mode(dcache_io_ptw_ptbr_mode),
    .io_ptw_status_dprv(dcache_io_ptw_status_dprv),
    .io_ptw_status_mxr(dcache_io_ptw_status_mxr),
    .io_ptw_status_sum(dcache_io_ptw_status_sum),
    .io_ptw_pmp_0_cfg_l(dcache_io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_a(dcache_io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x(dcache_io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w(dcache_io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r(dcache_io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr(dcache_io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask(dcache_io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l(dcache_io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_a(dcache_io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x(dcache_io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w(dcache_io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r(dcache_io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr(dcache_io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask(dcache_io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l(dcache_io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_a(dcache_io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x(dcache_io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w(dcache_io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r(dcache_io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr(dcache_io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask(dcache_io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l(dcache_io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_a(dcache_io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x(dcache_io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w(dcache_io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r(dcache_io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr(dcache_io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask(dcache_io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l(dcache_io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_a(dcache_io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x(dcache_io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w(dcache_io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r(dcache_io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr(dcache_io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask(dcache_io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l(dcache_io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_a(dcache_io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x(dcache_io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w(dcache_io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r(dcache_io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr(dcache_io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask(dcache_io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l(dcache_io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_a(dcache_io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x(dcache_io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w(dcache_io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r(dcache_io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr(dcache_io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask(dcache_io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l(dcache_io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_a(dcache_io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x(dcache_io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w(dcache_io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r(dcache_io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr(dcache_io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask(dcache_io_ptw_pmp_7_mask),
    .io_ptw_customCSRs_csrs_0_value(dcache_io_ptw_customCSRs_csrs_0_value)
  );
  ManycoreAccelerator manycore_rocc ( // @[ManycoreRoCCAccel.scala 151:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314201.4]
    .clock(manycore_rocc_clock),
    .reset(manycore_rocc_reset),
    .io_cmd_ready(manycore_rocc_io_cmd_ready),
    .io_cmd_valid(manycore_rocc_io_cmd_valid),
    .io_cmd_bits_inst_funct(manycore_rocc_io_cmd_bits_inst_funct),
    .io_cmd_bits_inst_rs2(manycore_rocc_io_cmd_bits_inst_rs2),
    .io_cmd_bits_inst_rs1(manycore_rocc_io_cmd_bits_inst_rs1),
    .io_cmd_bits_inst_xd(manycore_rocc_io_cmd_bits_inst_xd),
    .io_cmd_bits_inst_xs1(manycore_rocc_io_cmd_bits_inst_xs1),
    .io_cmd_bits_inst_xs2(manycore_rocc_io_cmd_bits_inst_xs2),
    .io_cmd_bits_inst_rd(manycore_rocc_io_cmd_bits_inst_rd),
    .io_cmd_bits_inst_opcode(manycore_rocc_io_cmd_bits_inst_opcode),
    .io_cmd_bits_rs1(manycore_rocc_io_cmd_bits_rs1),
    .io_cmd_bits_rs2(manycore_rocc_io_cmd_bits_rs2),
    .io_cmd_bits_status_prv(manycore_rocc_io_cmd_bits_status_prv),
    .io_resp_ready(manycore_rocc_io_resp_ready),
    .io_resp_valid(manycore_rocc_io_resp_valid),
    .io_resp_bits_rd(manycore_rocc_io_resp_bits_rd),
    .io_resp_bits_data(manycore_rocc_io_resp_bits_data),
    .io_mem_req_ready(manycore_rocc_io_mem_req_ready),
    .io_mem_req_valid(manycore_rocc_io_mem_req_valid),
    .io_mem_req_bits_addr(manycore_rocc_io_mem_req_bits_addr),
    .io_mem_req_bits_tag(manycore_rocc_io_mem_req_bits_tag),
    .io_mem_req_bits_cmd(manycore_rocc_io_mem_req_bits_cmd),
    .io_mem_req_bits_phys(manycore_rocc_io_mem_req_bits_phys),
    .io_mem_req_bits_data(manycore_rocc_io_mem_req_bits_data),
    .io_mem_resp_valid(manycore_rocc_io_mem_resp_valid),
    .io_mem_resp_bits_addr(manycore_rocc_io_mem_resp_bits_addr),
    .io_mem_resp_bits_tag(manycore_rocc_io_mem_resp_bits_tag),
    .io_mem_resp_bits_cmd(manycore_rocc_io_mem_resp_bits_cmd),
    .io_mem_resp_bits_data(manycore_rocc_io_mem_resp_bits_data),
    .io_mem_resp_bits_replay(manycore_rocc_io_mem_resp_bits_replay),
    .io_mem_resp_bits_has_data(manycore_rocc_io_mem_resp_bits_has_data),
    .io_mem_resp_bits_data_word_bypass(manycore_rocc_io_mem_resp_bits_data_word_bypass),
    .io_mem_resp_bits_store_data(manycore_rocc_io_mem_resp_bits_store_data),
    .io_busy(manycore_rocc_io_busy),
    .io_interrupt(manycore_rocc_io_interrupt),
    .io_exception(manycore_rocc_io_exception)
  );
  Frontend frontend ( // @[Frontend.scala 340:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314208.4]
    .gated_clock(frontend_gated_clock),
    .reset(frontend_reset),
    .auto_icache_master_out_a_ready(frontend_auto_icache_master_out_a_ready),
    .auto_icache_master_out_a_valid(frontend_auto_icache_master_out_a_valid),
    .auto_icache_master_out_a_bits_address(frontend_auto_icache_master_out_a_bits_address),
    .auto_icache_master_out_d_valid(frontend_auto_icache_master_out_d_valid),
    .auto_icache_master_out_d_bits_opcode(frontend_auto_icache_master_out_d_bits_opcode),
    .auto_icache_master_out_d_bits_size(frontend_auto_icache_master_out_d_bits_size),
    .auto_icache_master_out_d_bits_data(frontend_auto_icache_master_out_d_bits_data),
    .auto_icache_master_out_d_bits_corrupt(frontend_auto_icache_master_out_d_bits_corrupt),
    .io_reset_vector(frontend_io_reset_vector),
    .io_cpu_might_request(frontend_io_cpu_might_request),
    .io_cpu_req_valid(frontend_io_cpu_req_valid),
    .io_cpu_req_bits_pc(frontend_io_cpu_req_bits_pc),
    .io_cpu_req_bits_speculative(frontend_io_cpu_req_bits_speculative),
    .io_cpu_sfence_valid(frontend_io_cpu_sfence_valid),
    .io_cpu_sfence_bits_rs1(frontend_io_cpu_sfence_bits_rs1),
    .io_cpu_sfence_bits_rs2(frontend_io_cpu_sfence_bits_rs2),
    .io_cpu_sfence_bits_addr(frontend_io_cpu_sfence_bits_addr),
    .io_cpu_resp_ready(frontend_io_cpu_resp_ready),
    .io_cpu_resp_valid(frontend_io_cpu_resp_valid),
    .io_cpu_resp_bits_btb_taken(frontend_io_cpu_resp_bits_btb_taken),
    .io_cpu_resp_bits_btb_bridx(frontend_io_cpu_resp_bits_btb_bridx),
    .io_cpu_resp_bits_btb_entry(frontend_io_cpu_resp_bits_btb_entry),
    .io_cpu_resp_bits_btb_bht_history(frontend_io_cpu_resp_bits_btb_bht_history),
    .io_cpu_resp_bits_pc(frontend_io_cpu_resp_bits_pc),
    .io_cpu_resp_bits_data(frontend_io_cpu_resp_bits_data),
    .io_cpu_resp_bits_xcpt_pf_inst(frontend_io_cpu_resp_bits_xcpt_pf_inst),
    .io_cpu_resp_bits_xcpt_ae_inst(frontend_io_cpu_resp_bits_xcpt_ae_inst),
    .io_cpu_resp_bits_replay(frontend_io_cpu_resp_bits_replay),
    .io_cpu_btb_update_valid(frontend_io_cpu_btb_update_valid),
    .io_cpu_btb_update_bits_prediction_entry(frontend_io_cpu_btb_update_bits_prediction_entry),
    .io_cpu_btb_update_bits_pc(frontend_io_cpu_btb_update_bits_pc),
    .io_cpu_btb_update_bits_isValid(frontend_io_cpu_btb_update_bits_isValid),
    .io_cpu_btb_update_bits_br_pc(frontend_io_cpu_btb_update_bits_br_pc),
    .io_cpu_btb_update_bits_cfiType(frontend_io_cpu_btb_update_bits_cfiType),
    .io_cpu_bht_update_valid(frontend_io_cpu_bht_update_valid),
    .io_cpu_bht_update_bits_prediction_history(frontend_io_cpu_bht_update_bits_prediction_history),
    .io_cpu_bht_update_bits_pc(frontend_io_cpu_bht_update_bits_pc),
    .io_cpu_bht_update_bits_branch(frontend_io_cpu_bht_update_bits_branch),
    .io_cpu_bht_update_bits_taken(frontend_io_cpu_bht_update_bits_taken),
    .io_cpu_bht_update_bits_mispredict(frontend_io_cpu_bht_update_bits_mispredict),
    .io_cpu_flush_icache(frontend_io_cpu_flush_icache),
    .io_cpu_npc(frontend_io_cpu_npc),
    .io_ptw_req_ready(frontend_io_ptw_req_ready),
    .io_ptw_req_valid(frontend_io_ptw_req_valid),
    .io_ptw_req_bits_valid(frontend_io_ptw_req_bits_valid),
    .io_ptw_req_bits_bits_addr(frontend_io_ptw_req_bits_bits_addr),
    .io_ptw_resp_valid(frontend_io_ptw_resp_valid),
    .io_ptw_resp_bits_ae(frontend_io_ptw_resp_bits_ae),
    .io_ptw_resp_bits_pte_ppn(frontend_io_ptw_resp_bits_pte_ppn),
    .io_ptw_resp_bits_pte_d(frontend_io_ptw_resp_bits_pte_d),
    .io_ptw_resp_bits_pte_a(frontend_io_ptw_resp_bits_pte_a),
    .io_ptw_resp_bits_pte_g(frontend_io_ptw_resp_bits_pte_g),
    .io_ptw_resp_bits_pte_u(frontend_io_ptw_resp_bits_pte_u),
    .io_ptw_resp_bits_pte_x(frontend_io_ptw_resp_bits_pte_x),
    .io_ptw_resp_bits_pte_w(frontend_io_ptw_resp_bits_pte_w),
    .io_ptw_resp_bits_pte_r(frontend_io_ptw_resp_bits_pte_r),
    .io_ptw_resp_bits_pte_v(frontend_io_ptw_resp_bits_pte_v),
    .io_ptw_resp_bits_level(frontend_io_ptw_resp_bits_level),
    .io_ptw_resp_bits_fragmented_superpage(frontend_io_ptw_resp_bits_fragmented_superpage),
    .io_ptw_resp_bits_homogeneous(frontend_io_ptw_resp_bits_homogeneous),
    .io_ptw_ptbr_mode(frontend_io_ptw_ptbr_mode),
    .io_ptw_status_prv(frontend_io_ptw_status_prv),
    .io_ptw_pmp_0_cfg_l(frontend_io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_a(frontend_io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x(frontend_io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w(frontend_io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r(frontend_io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr(frontend_io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask(frontend_io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l(frontend_io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_a(frontend_io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x(frontend_io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w(frontend_io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r(frontend_io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr(frontend_io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask(frontend_io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l(frontend_io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_a(frontend_io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x(frontend_io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w(frontend_io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r(frontend_io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr(frontend_io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask(frontend_io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l(frontend_io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_a(frontend_io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x(frontend_io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w(frontend_io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r(frontend_io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr(frontend_io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask(frontend_io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l(frontend_io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_a(frontend_io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x(frontend_io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w(frontend_io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r(frontend_io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr(frontend_io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask(frontend_io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l(frontend_io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_a(frontend_io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x(frontend_io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w(frontend_io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r(frontend_io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr(frontend_io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask(frontend_io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l(frontend_io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_a(frontend_io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x(frontend_io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w(frontend_io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r(frontend_io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr(frontend_io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask(frontend_io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l(frontend_io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_a(frontend_io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x(frontend_io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w(frontend_io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r(frontend_io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr(frontend_io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask(frontend_io_ptw_pmp_7_mask)
  );
  TLBuffer_23 buffer ( // @[Buffer.scala 69:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314227.4]
    .clock(buffer_clock),
    .reset(buffer_reset),
    .auto_in_a_ready(buffer_auto_in_a_ready),
    .auto_in_a_valid(buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(buffer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(buffer_auto_in_a_bits_corrupt),
    .auto_in_b_ready(buffer_auto_in_b_ready),
    .auto_in_b_valid(buffer_auto_in_b_valid),
    .auto_in_b_bits_opcode(buffer_auto_in_b_bits_opcode),
    .auto_in_b_bits_param(buffer_auto_in_b_bits_param),
    .auto_in_b_bits_size(buffer_auto_in_b_bits_size),
    .auto_in_b_bits_source(buffer_auto_in_b_bits_source),
    .auto_in_b_bits_address(buffer_auto_in_b_bits_address),
    .auto_in_b_bits_mask(buffer_auto_in_b_bits_mask),
    .auto_in_b_bits_corrupt(buffer_auto_in_b_bits_corrupt),
    .auto_in_c_ready(buffer_auto_in_c_ready),
    .auto_in_c_valid(buffer_auto_in_c_valid),
    .auto_in_c_bits_opcode(buffer_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(buffer_auto_in_c_bits_param),
    .auto_in_c_bits_size(buffer_auto_in_c_bits_size),
    .auto_in_c_bits_source(buffer_auto_in_c_bits_source),
    .auto_in_c_bits_address(buffer_auto_in_c_bits_address),
    .auto_in_c_bits_data(buffer_auto_in_c_bits_data),
    .auto_in_c_bits_corrupt(buffer_auto_in_c_bits_corrupt),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_auto_in_d_bits_corrupt),
    .auto_in_e_ready(buffer_auto_in_e_ready),
    .auto_in_e_valid(buffer_auto_in_e_valid),
    .auto_in_e_bits_sink(buffer_auto_in_e_bits_sink),
    .auto_out_a_ready(buffer_auto_out_a_ready),
    .auto_out_a_valid(buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
    .auto_out_b_ready(buffer_auto_out_b_ready),
    .auto_out_b_valid(buffer_auto_out_b_valid),
    .auto_out_b_bits_opcode(buffer_auto_out_b_bits_opcode),
    .auto_out_b_bits_param(buffer_auto_out_b_bits_param),
    .auto_out_b_bits_size(buffer_auto_out_b_bits_size),
    .auto_out_b_bits_source(buffer_auto_out_b_bits_source),
    .auto_out_b_bits_address(buffer_auto_out_b_bits_address),
    .auto_out_b_bits_mask(buffer_auto_out_b_bits_mask),
    .auto_out_b_bits_corrupt(buffer_auto_out_b_bits_corrupt),
    .auto_out_c_ready(buffer_auto_out_c_ready),
    .auto_out_c_valid(buffer_auto_out_c_valid),
    .auto_out_c_bits_opcode(buffer_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(buffer_auto_out_c_bits_param),
    .auto_out_c_bits_size(buffer_auto_out_c_bits_size),
    .auto_out_c_bits_source(buffer_auto_out_c_bits_source),
    .auto_out_c_bits_address(buffer_auto_out_c_bits_address),
    .auto_out_c_bits_data(buffer_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt(buffer_auto_out_c_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt),
    .auto_out_e_ready(buffer_auto_out_e_ready),
    .auto_out_e_valid(buffer_auto_out_e_valid),
    .auto_out_e_bits_sink(buffer_auto_out_e_bits_sink)
  );
  IntSyncCrossingSink intsink ( // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314239.4]
    .clock(intsink_clock),
    .auto_in_sync_0(intsink_auto_in_sync_0),
    .auto_out_0(intsink_auto_out_0)
  );
  IntSyncCrossingSink_1 intsink_1 ( // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314245.4]
    .auto_in_sync_0(intsink_1_auto_in_sync_0),
    .auto_in_sync_1(intsink_1_auto_in_sync_1),
    .auto_out_0(intsink_1_auto_out_0),
    .auto_out_1(intsink_1_auto_out_1)
  );
  IntSyncCrossingSink_2 intsink_2 ( // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314251.4]
    .auto_in_sync_0(intsink_2_auto_in_sync_0),
    .auto_out_0(intsink_2_auto_out_0)
  );
  IntSyncCrossingSink_2 intsink_3 ( // @[Crossing.scala 63:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314257.4]
    .auto_in_sync_0(intsink_3_auto_in_sync_0),
    .auto_out_0(intsink_3_auto_out_0)
  );
  FPU fpuOpt ( // @[RocketTile.scala 168:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314344.4]
    .clock(fpuOpt_clock),
    .reset(fpuOpt_reset),
    .io_inst(fpuOpt_io_inst),
    .io_fromint_data(fpuOpt_io_fromint_data),
    .io_fcsr_rm(fpuOpt_io_fcsr_rm),
    .io_fcsr_flags_valid(fpuOpt_io_fcsr_flags_valid),
    .io_fcsr_flags_bits(fpuOpt_io_fcsr_flags_bits),
    .io_store_data(fpuOpt_io_store_data),
    .io_toint_data(fpuOpt_io_toint_data),
    .io_dmem_resp_val(fpuOpt_io_dmem_resp_val),
    .io_dmem_resp_type(fpuOpt_io_dmem_resp_type),
    .io_dmem_resp_tag(fpuOpt_io_dmem_resp_tag),
    .io_dmem_resp_data(fpuOpt_io_dmem_resp_data),
    .io_valid(fpuOpt_io_valid),
    .io_fcsr_rdy(fpuOpt_io_fcsr_rdy),
    .io_nack_mem(fpuOpt_io_nack_mem),
    .io_illegal_rm(fpuOpt_io_illegal_rm),
    .io_killx(fpuOpt_io_killx),
    .io_killm(fpuOpt_io_killm),
    .io_dec_wen(fpuOpt_io_dec_wen),
    .io_dec_ren1(fpuOpt_io_dec_ren1),
    .io_dec_ren2(fpuOpt_io_dec_ren2),
    .io_dec_ren3(fpuOpt_io_dec_ren3),
    .io_sboard_set(fpuOpt_io_sboard_set),
    .io_sboard_clr(fpuOpt_io_sboard_clr),
    .io_sboard_clra(fpuOpt_io_sboard_clra),
    .io_cp_req_ready(fpuOpt_io_cp_req_ready),
    .io_cp_req_valid(fpuOpt_io_cp_req_valid),
    .io_cp_req_bits_ren2(fpuOpt_io_cp_req_bits_ren2),
    .io_cp_req_bits_ren3(fpuOpt_io_cp_req_bits_ren3),
    .io_cp_req_bits_swap23(fpuOpt_io_cp_req_bits_swap23),
    .io_cp_req_bits_singleIn(fpuOpt_io_cp_req_bits_singleIn),
    .io_cp_req_bits_singleOut(fpuOpt_io_cp_req_bits_singleOut),
    .io_cp_req_bits_fromint(fpuOpt_io_cp_req_bits_fromint),
    .io_cp_req_bits_toint(fpuOpt_io_cp_req_bits_toint),
    .io_cp_req_bits_fastpipe(fpuOpt_io_cp_req_bits_fastpipe),
    .io_cp_req_bits_fma(fpuOpt_io_cp_req_bits_fma),
    .io_cp_req_bits_div(fpuOpt_io_cp_req_bits_div),
    .io_cp_req_bits_sqrt(fpuOpt_io_cp_req_bits_sqrt),
    .io_cp_req_bits_wflags(fpuOpt_io_cp_req_bits_wflags),
    .io_cp_req_bits_rm(fpuOpt_io_cp_req_bits_rm),
    .io_cp_req_bits_fmaCmd(fpuOpt_io_cp_req_bits_fmaCmd),
    .io_cp_req_bits_typ(fpuOpt_io_cp_req_bits_typ),
    .io_cp_req_bits_in1(fpuOpt_io_cp_req_bits_in1),
    .io_cp_req_bits_in2(fpuOpt_io_cp_req_bits_in2),
    .io_cp_req_bits_in3(fpuOpt_io_cp_req_bits_in3)
  );
  HellaCacheArbiter dcacheArb ( // @[HellaCache.scala 227:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314348.4]
    .clock(dcacheArb_clock),
    .io_requestor_0_req_ready(dcacheArb_io_requestor_0_req_ready),
    .io_requestor_0_req_valid(dcacheArb_io_requestor_0_req_valid),
    .io_requestor_0_req_bits_addr(dcacheArb_io_requestor_0_req_bits_addr),
    .io_requestor_0_req_bits_tag(dcacheArb_io_requestor_0_req_bits_tag),
    .io_requestor_0_req_bits_cmd(dcacheArb_io_requestor_0_req_bits_cmd),
    .io_requestor_0_req_bits_typ(dcacheArb_io_requestor_0_req_bits_typ),
    .io_requestor_0_req_bits_phys(dcacheArb_io_requestor_0_req_bits_phys),
    .io_requestor_0_s1_kill(dcacheArb_io_requestor_0_s1_kill),
    .io_requestor_0_s1_data_data(dcacheArb_io_requestor_0_s1_data_data),
    .io_requestor_0_s1_data_mask(dcacheArb_io_requestor_0_s1_data_mask),
    .io_requestor_0_s2_nack(dcacheArb_io_requestor_0_s2_nack),
    .io_requestor_0_s2_kill(dcacheArb_io_requestor_0_s2_kill),
    .io_requestor_0_resp_valid(dcacheArb_io_requestor_0_resp_valid),
    .io_requestor_0_resp_bits_data_word_bypass(dcacheArb_io_requestor_0_resp_bits_data_word_bypass),
    .io_requestor_0_s2_xcpt_ae_ld(dcacheArb_io_requestor_0_s2_xcpt_ae_ld),
    .io_requestor_0_keep_clock_enabled(dcacheArb_io_requestor_0_keep_clock_enabled),
    .io_requestor_1_req_ready(dcacheArb_io_requestor_1_req_ready),
    .io_requestor_1_req_valid(dcacheArb_io_requestor_1_req_valid),
    .io_requestor_1_req_bits_addr(dcacheArb_io_requestor_1_req_bits_addr),
    .io_requestor_1_req_bits_tag(dcacheArb_io_requestor_1_req_bits_tag),
    .io_requestor_1_req_bits_cmd(dcacheArb_io_requestor_1_req_bits_cmd),
    .io_requestor_1_req_bits_typ(dcacheArb_io_requestor_1_req_bits_typ),
    .io_requestor_1_req_bits_phys(dcacheArb_io_requestor_1_req_bits_phys),
    .io_requestor_1_s1_kill(dcacheArb_io_requestor_1_s1_kill),
    .io_requestor_1_s1_data_data(dcacheArb_io_requestor_1_s1_data_data),
    .io_requestor_1_s1_data_mask(dcacheArb_io_requestor_1_s1_data_mask),
    .io_requestor_1_s2_nack(dcacheArb_io_requestor_1_s2_nack),
    .io_requestor_1_s2_kill(dcacheArb_io_requestor_1_s2_kill),
    .io_requestor_1_resp_valid(dcacheArb_io_requestor_1_resp_valid),
    .io_requestor_1_resp_bits_addr(dcacheArb_io_requestor_1_resp_bits_addr),
    .io_requestor_1_resp_bits_tag(dcacheArb_io_requestor_1_resp_bits_tag),
    .io_requestor_1_resp_bits_cmd(dcacheArb_io_requestor_1_resp_bits_cmd),
    .io_requestor_1_resp_bits_data(dcacheArb_io_requestor_1_resp_bits_data),
    .io_requestor_1_resp_bits_replay(dcacheArb_io_requestor_1_resp_bits_replay),
    .io_requestor_1_resp_bits_has_data(dcacheArb_io_requestor_1_resp_bits_has_data),
    .io_requestor_1_resp_bits_data_word_bypass(dcacheArb_io_requestor_1_resp_bits_data_word_bypass),
    .io_requestor_1_resp_bits_store_data(dcacheArb_io_requestor_1_resp_bits_store_data),
    .io_requestor_1_s2_xcpt_ma_ld(dcacheArb_io_requestor_1_s2_xcpt_ma_ld),
    .io_requestor_1_s2_xcpt_ma_st(dcacheArb_io_requestor_1_s2_xcpt_ma_st),
    .io_requestor_1_s2_xcpt_pf_ld(dcacheArb_io_requestor_1_s2_xcpt_pf_ld),
    .io_requestor_1_s2_xcpt_pf_st(dcacheArb_io_requestor_1_s2_xcpt_pf_st),
    .io_requestor_1_s2_xcpt_ae_ld(dcacheArb_io_requestor_1_s2_xcpt_ae_ld),
    .io_requestor_1_s2_xcpt_ae_st(dcacheArb_io_requestor_1_s2_xcpt_ae_st),
    .io_requestor_1_keep_clock_enabled(dcacheArb_io_requestor_1_keep_clock_enabled),
    .io_requestor_2_req_ready(dcacheArb_io_requestor_2_req_ready),
    .io_requestor_2_req_valid(dcacheArb_io_requestor_2_req_valid),
    .io_requestor_2_req_bits_addr(dcacheArb_io_requestor_2_req_bits_addr),
    .io_requestor_2_req_bits_tag(dcacheArb_io_requestor_2_req_bits_tag),
    .io_requestor_2_req_bits_cmd(dcacheArb_io_requestor_2_req_bits_cmd),
    .io_requestor_2_req_bits_typ(dcacheArb_io_requestor_2_req_bits_typ),
    .io_requestor_2_req_bits_phys(dcacheArb_io_requestor_2_req_bits_phys),
    .io_requestor_2_s1_kill(dcacheArb_io_requestor_2_s1_kill),
    .io_requestor_2_s1_data_data(dcacheArb_io_requestor_2_s1_data_data),
    .io_requestor_2_s1_data_mask(dcacheArb_io_requestor_2_s1_data_mask),
    .io_requestor_2_s2_nack(dcacheArb_io_requestor_2_s2_nack),
    .io_requestor_2_s2_kill(dcacheArb_io_requestor_2_s2_kill),
    .io_requestor_2_resp_valid(dcacheArb_io_requestor_2_resp_valid),
    .io_requestor_2_resp_bits_tag(dcacheArb_io_requestor_2_resp_bits_tag),
    .io_requestor_2_resp_bits_typ(dcacheArb_io_requestor_2_resp_bits_typ),
    .io_requestor_2_resp_bits_data(dcacheArb_io_requestor_2_resp_bits_data),
    .io_requestor_2_resp_bits_replay(dcacheArb_io_requestor_2_resp_bits_replay),
    .io_requestor_2_resp_bits_has_data(dcacheArb_io_requestor_2_resp_bits_has_data),
    .io_requestor_2_resp_bits_data_word_bypass(dcacheArb_io_requestor_2_resp_bits_data_word_bypass),
    .io_requestor_2_replay_next(dcacheArb_io_requestor_2_replay_next),
    .io_requestor_2_s2_xcpt_ma_ld(dcacheArb_io_requestor_2_s2_xcpt_ma_ld),
    .io_requestor_2_s2_xcpt_ma_st(dcacheArb_io_requestor_2_s2_xcpt_ma_st),
    .io_requestor_2_s2_xcpt_pf_ld(dcacheArb_io_requestor_2_s2_xcpt_pf_ld),
    .io_requestor_2_s2_xcpt_pf_st(dcacheArb_io_requestor_2_s2_xcpt_pf_st),
    .io_requestor_2_s2_xcpt_ae_ld(dcacheArb_io_requestor_2_s2_xcpt_ae_ld),
    .io_requestor_2_s2_xcpt_ae_st(dcacheArb_io_requestor_2_s2_xcpt_ae_st),
    .io_requestor_2_ordered(dcacheArb_io_requestor_2_ordered),
    .io_requestor_2_perf_grant(dcacheArb_io_requestor_2_perf_grant),
    .io_requestor_2_keep_clock_enabled(dcacheArb_io_requestor_2_keep_clock_enabled),
    .io_requestor_2_clock_enabled(dcacheArb_io_requestor_2_clock_enabled),
    .io_mem_req_ready(dcacheArb_io_mem_req_ready),
    .io_mem_req_valid(dcacheArb_io_mem_req_valid),
    .io_mem_req_bits_addr(dcacheArb_io_mem_req_bits_addr),
    .io_mem_req_bits_tag(dcacheArb_io_mem_req_bits_tag),
    .io_mem_req_bits_cmd(dcacheArb_io_mem_req_bits_cmd),
    .io_mem_req_bits_typ(dcacheArb_io_mem_req_bits_typ),
    .io_mem_req_bits_phys(dcacheArb_io_mem_req_bits_phys),
    .io_mem_s1_kill(dcacheArb_io_mem_s1_kill),
    .io_mem_s1_data_data(dcacheArb_io_mem_s1_data_data),
    .io_mem_s1_data_mask(dcacheArb_io_mem_s1_data_mask),
    .io_mem_s2_nack(dcacheArb_io_mem_s2_nack),
    .io_mem_s2_kill(dcacheArb_io_mem_s2_kill),
    .io_mem_resp_valid(dcacheArb_io_mem_resp_valid),
    .io_mem_resp_bits_addr(dcacheArb_io_mem_resp_bits_addr),
    .io_mem_resp_bits_tag(dcacheArb_io_mem_resp_bits_tag),
    .io_mem_resp_bits_cmd(dcacheArb_io_mem_resp_bits_cmd),
    .io_mem_resp_bits_typ(dcacheArb_io_mem_resp_bits_typ),
    .io_mem_resp_bits_data(dcacheArb_io_mem_resp_bits_data),
    .io_mem_resp_bits_replay(dcacheArb_io_mem_resp_bits_replay),
    .io_mem_resp_bits_has_data(dcacheArb_io_mem_resp_bits_has_data),
    .io_mem_resp_bits_data_word_bypass(dcacheArb_io_mem_resp_bits_data_word_bypass),
    .io_mem_resp_bits_store_data(dcacheArb_io_mem_resp_bits_store_data),
    .io_mem_replay_next(dcacheArb_io_mem_replay_next),
    .io_mem_s2_xcpt_ma_ld(dcacheArb_io_mem_s2_xcpt_ma_ld),
    .io_mem_s2_xcpt_ma_st(dcacheArb_io_mem_s2_xcpt_ma_st),
    .io_mem_s2_xcpt_pf_ld(dcacheArb_io_mem_s2_xcpt_pf_ld),
    .io_mem_s2_xcpt_pf_st(dcacheArb_io_mem_s2_xcpt_pf_st),
    .io_mem_s2_xcpt_ae_ld(dcacheArb_io_mem_s2_xcpt_ae_ld),
    .io_mem_s2_xcpt_ae_st(dcacheArb_io_mem_s2_xcpt_ae_st),
    .io_mem_ordered(dcacheArb_io_mem_ordered),
    .io_mem_perf_grant(dcacheArb_io_mem_perf_grant),
    .io_mem_keep_clock_enabled(dcacheArb_io_mem_keep_clock_enabled),
    .io_mem_clock_enabled(dcacheArb_io_mem_clock_enabled)
  );
  PTW ptw ( // @[PTW.scala 379:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314353.4]
    .clock(ptw_clock),
    .reset(ptw_reset),
    .io_requestor_0_req_ready(ptw_io_requestor_0_req_ready),
    .io_requestor_0_req_valid(ptw_io_requestor_0_req_valid),
    .io_requestor_0_req_bits_valid(ptw_io_requestor_0_req_bits_valid),
    .io_requestor_0_req_bits_bits_addr(ptw_io_requestor_0_req_bits_bits_addr),
    .io_requestor_0_resp_valid(ptw_io_requestor_0_resp_valid),
    .io_requestor_0_resp_bits_ae(ptw_io_requestor_0_resp_bits_ae),
    .io_requestor_0_resp_bits_pte_ppn(ptw_io_requestor_0_resp_bits_pte_ppn),
    .io_requestor_0_resp_bits_pte_d(ptw_io_requestor_0_resp_bits_pte_d),
    .io_requestor_0_resp_bits_pte_a(ptw_io_requestor_0_resp_bits_pte_a),
    .io_requestor_0_resp_bits_pte_g(ptw_io_requestor_0_resp_bits_pte_g),
    .io_requestor_0_resp_bits_pte_u(ptw_io_requestor_0_resp_bits_pte_u),
    .io_requestor_0_resp_bits_pte_x(ptw_io_requestor_0_resp_bits_pte_x),
    .io_requestor_0_resp_bits_pte_w(ptw_io_requestor_0_resp_bits_pte_w),
    .io_requestor_0_resp_bits_pte_r(ptw_io_requestor_0_resp_bits_pte_r),
    .io_requestor_0_resp_bits_pte_v(ptw_io_requestor_0_resp_bits_pte_v),
    .io_requestor_0_resp_bits_level(ptw_io_requestor_0_resp_bits_level),
    .io_requestor_0_resp_bits_homogeneous(ptw_io_requestor_0_resp_bits_homogeneous),
    .io_requestor_0_ptbr_mode(ptw_io_requestor_0_ptbr_mode),
    .io_requestor_0_status_dprv(ptw_io_requestor_0_status_dprv),
    .io_requestor_0_status_mxr(ptw_io_requestor_0_status_mxr),
    .io_requestor_0_status_sum(ptw_io_requestor_0_status_sum),
    .io_requestor_0_pmp_0_cfg_l(ptw_io_requestor_0_pmp_0_cfg_l),
    .io_requestor_0_pmp_0_cfg_a(ptw_io_requestor_0_pmp_0_cfg_a),
    .io_requestor_0_pmp_0_cfg_x(ptw_io_requestor_0_pmp_0_cfg_x),
    .io_requestor_0_pmp_0_cfg_w(ptw_io_requestor_0_pmp_0_cfg_w),
    .io_requestor_0_pmp_0_cfg_r(ptw_io_requestor_0_pmp_0_cfg_r),
    .io_requestor_0_pmp_0_addr(ptw_io_requestor_0_pmp_0_addr),
    .io_requestor_0_pmp_0_mask(ptw_io_requestor_0_pmp_0_mask),
    .io_requestor_0_pmp_1_cfg_l(ptw_io_requestor_0_pmp_1_cfg_l),
    .io_requestor_0_pmp_1_cfg_a(ptw_io_requestor_0_pmp_1_cfg_a),
    .io_requestor_0_pmp_1_cfg_x(ptw_io_requestor_0_pmp_1_cfg_x),
    .io_requestor_0_pmp_1_cfg_w(ptw_io_requestor_0_pmp_1_cfg_w),
    .io_requestor_0_pmp_1_cfg_r(ptw_io_requestor_0_pmp_1_cfg_r),
    .io_requestor_0_pmp_1_addr(ptw_io_requestor_0_pmp_1_addr),
    .io_requestor_0_pmp_1_mask(ptw_io_requestor_0_pmp_1_mask),
    .io_requestor_0_pmp_2_cfg_l(ptw_io_requestor_0_pmp_2_cfg_l),
    .io_requestor_0_pmp_2_cfg_a(ptw_io_requestor_0_pmp_2_cfg_a),
    .io_requestor_0_pmp_2_cfg_x(ptw_io_requestor_0_pmp_2_cfg_x),
    .io_requestor_0_pmp_2_cfg_w(ptw_io_requestor_0_pmp_2_cfg_w),
    .io_requestor_0_pmp_2_cfg_r(ptw_io_requestor_0_pmp_2_cfg_r),
    .io_requestor_0_pmp_2_addr(ptw_io_requestor_0_pmp_2_addr),
    .io_requestor_0_pmp_2_mask(ptw_io_requestor_0_pmp_2_mask),
    .io_requestor_0_pmp_3_cfg_l(ptw_io_requestor_0_pmp_3_cfg_l),
    .io_requestor_0_pmp_3_cfg_a(ptw_io_requestor_0_pmp_3_cfg_a),
    .io_requestor_0_pmp_3_cfg_x(ptw_io_requestor_0_pmp_3_cfg_x),
    .io_requestor_0_pmp_3_cfg_w(ptw_io_requestor_0_pmp_3_cfg_w),
    .io_requestor_0_pmp_3_cfg_r(ptw_io_requestor_0_pmp_3_cfg_r),
    .io_requestor_0_pmp_3_addr(ptw_io_requestor_0_pmp_3_addr),
    .io_requestor_0_pmp_3_mask(ptw_io_requestor_0_pmp_3_mask),
    .io_requestor_0_pmp_4_cfg_l(ptw_io_requestor_0_pmp_4_cfg_l),
    .io_requestor_0_pmp_4_cfg_a(ptw_io_requestor_0_pmp_4_cfg_a),
    .io_requestor_0_pmp_4_cfg_x(ptw_io_requestor_0_pmp_4_cfg_x),
    .io_requestor_0_pmp_4_cfg_w(ptw_io_requestor_0_pmp_4_cfg_w),
    .io_requestor_0_pmp_4_cfg_r(ptw_io_requestor_0_pmp_4_cfg_r),
    .io_requestor_0_pmp_4_addr(ptw_io_requestor_0_pmp_4_addr),
    .io_requestor_0_pmp_4_mask(ptw_io_requestor_0_pmp_4_mask),
    .io_requestor_0_pmp_5_cfg_l(ptw_io_requestor_0_pmp_5_cfg_l),
    .io_requestor_0_pmp_5_cfg_a(ptw_io_requestor_0_pmp_5_cfg_a),
    .io_requestor_0_pmp_5_cfg_x(ptw_io_requestor_0_pmp_5_cfg_x),
    .io_requestor_0_pmp_5_cfg_w(ptw_io_requestor_0_pmp_5_cfg_w),
    .io_requestor_0_pmp_5_cfg_r(ptw_io_requestor_0_pmp_5_cfg_r),
    .io_requestor_0_pmp_5_addr(ptw_io_requestor_0_pmp_5_addr),
    .io_requestor_0_pmp_5_mask(ptw_io_requestor_0_pmp_5_mask),
    .io_requestor_0_pmp_6_cfg_l(ptw_io_requestor_0_pmp_6_cfg_l),
    .io_requestor_0_pmp_6_cfg_a(ptw_io_requestor_0_pmp_6_cfg_a),
    .io_requestor_0_pmp_6_cfg_x(ptw_io_requestor_0_pmp_6_cfg_x),
    .io_requestor_0_pmp_6_cfg_w(ptw_io_requestor_0_pmp_6_cfg_w),
    .io_requestor_0_pmp_6_cfg_r(ptw_io_requestor_0_pmp_6_cfg_r),
    .io_requestor_0_pmp_6_addr(ptw_io_requestor_0_pmp_6_addr),
    .io_requestor_0_pmp_6_mask(ptw_io_requestor_0_pmp_6_mask),
    .io_requestor_0_pmp_7_cfg_l(ptw_io_requestor_0_pmp_7_cfg_l),
    .io_requestor_0_pmp_7_cfg_a(ptw_io_requestor_0_pmp_7_cfg_a),
    .io_requestor_0_pmp_7_cfg_x(ptw_io_requestor_0_pmp_7_cfg_x),
    .io_requestor_0_pmp_7_cfg_w(ptw_io_requestor_0_pmp_7_cfg_w),
    .io_requestor_0_pmp_7_cfg_r(ptw_io_requestor_0_pmp_7_cfg_r),
    .io_requestor_0_pmp_7_addr(ptw_io_requestor_0_pmp_7_addr),
    .io_requestor_0_pmp_7_mask(ptw_io_requestor_0_pmp_7_mask),
    .io_requestor_0_customCSRs_csrs_0_value(ptw_io_requestor_0_customCSRs_csrs_0_value),
    .io_requestor_1_req_ready(ptw_io_requestor_1_req_ready),
    .io_requestor_1_req_valid(ptw_io_requestor_1_req_valid),
    .io_requestor_1_req_bits_valid(ptw_io_requestor_1_req_bits_valid),
    .io_requestor_1_req_bits_bits_addr(ptw_io_requestor_1_req_bits_bits_addr),
    .io_requestor_1_resp_valid(ptw_io_requestor_1_resp_valid),
    .io_requestor_1_resp_bits_ae(ptw_io_requestor_1_resp_bits_ae),
    .io_requestor_1_resp_bits_pte_ppn(ptw_io_requestor_1_resp_bits_pte_ppn),
    .io_requestor_1_resp_bits_pte_d(ptw_io_requestor_1_resp_bits_pte_d),
    .io_requestor_1_resp_bits_pte_a(ptw_io_requestor_1_resp_bits_pte_a),
    .io_requestor_1_resp_bits_pte_g(ptw_io_requestor_1_resp_bits_pte_g),
    .io_requestor_1_resp_bits_pte_u(ptw_io_requestor_1_resp_bits_pte_u),
    .io_requestor_1_resp_bits_pte_x(ptw_io_requestor_1_resp_bits_pte_x),
    .io_requestor_1_resp_bits_pte_w(ptw_io_requestor_1_resp_bits_pte_w),
    .io_requestor_1_resp_bits_pte_r(ptw_io_requestor_1_resp_bits_pte_r),
    .io_requestor_1_resp_bits_pte_v(ptw_io_requestor_1_resp_bits_pte_v),
    .io_requestor_1_resp_bits_level(ptw_io_requestor_1_resp_bits_level),
    .io_requestor_1_resp_bits_homogeneous(ptw_io_requestor_1_resp_bits_homogeneous),
    .io_requestor_1_ptbr_mode(ptw_io_requestor_1_ptbr_mode),
    .io_requestor_1_status_prv(ptw_io_requestor_1_status_prv),
    .io_requestor_1_pmp_0_cfg_l(ptw_io_requestor_1_pmp_0_cfg_l),
    .io_requestor_1_pmp_0_cfg_a(ptw_io_requestor_1_pmp_0_cfg_a),
    .io_requestor_1_pmp_0_cfg_x(ptw_io_requestor_1_pmp_0_cfg_x),
    .io_requestor_1_pmp_0_cfg_w(ptw_io_requestor_1_pmp_0_cfg_w),
    .io_requestor_1_pmp_0_cfg_r(ptw_io_requestor_1_pmp_0_cfg_r),
    .io_requestor_1_pmp_0_addr(ptw_io_requestor_1_pmp_0_addr),
    .io_requestor_1_pmp_0_mask(ptw_io_requestor_1_pmp_0_mask),
    .io_requestor_1_pmp_1_cfg_l(ptw_io_requestor_1_pmp_1_cfg_l),
    .io_requestor_1_pmp_1_cfg_a(ptw_io_requestor_1_pmp_1_cfg_a),
    .io_requestor_1_pmp_1_cfg_x(ptw_io_requestor_1_pmp_1_cfg_x),
    .io_requestor_1_pmp_1_cfg_w(ptw_io_requestor_1_pmp_1_cfg_w),
    .io_requestor_1_pmp_1_cfg_r(ptw_io_requestor_1_pmp_1_cfg_r),
    .io_requestor_1_pmp_1_addr(ptw_io_requestor_1_pmp_1_addr),
    .io_requestor_1_pmp_1_mask(ptw_io_requestor_1_pmp_1_mask),
    .io_requestor_1_pmp_2_cfg_l(ptw_io_requestor_1_pmp_2_cfg_l),
    .io_requestor_1_pmp_2_cfg_a(ptw_io_requestor_1_pmp_2_cfg_a),
    .io_requestor_1_pmp_2_cfg_x(ptw_io_requestor_1_pmp_2_cfg_x),
    .io_requestor_1_pmp_2_cfg_w(ptw_io_requestor_1_pmp_2_cfg_w),
    .io_requestor_1_pmp_2_cfg_r(ptw_io_requestor_1_pmp_2_cfg_r),
    .io_requestor_1_pmp_2_addr(ptw_io_requestor_1_pmp_2_addr),
    .io_requestor_1_pmp_2_mask(ptw_io_requestor_1_pmp_2_mask),
    .io_requestor_1_pmp_3_cfg_l(ptw_io_requestor_1_pmp_3_cfg_l),
    .io_requestor_1_pmp_3_cfg_a(ptw_io_requestor_1_pmp_3_cfg_a),
    .io_requestor_1_pmp_3_cfg_x(ptw_io_requestor_1_pmp_3_cfg_x),
    .io_requestor_1_pmp_3_cfg_w(ptw_io_requestor_1_pmp_3_cfg_w),
    .io_requestor_1_pmp_3_cfg_r(ptw_io_requestor_1_pmp_3_cfg_r),
    .io_requestor_1_pmp_3_addr(ptw_io_requestor_1_pmp_3_addr),
    .io_requestor_1_pmp_3_mask(ptw_io_requestor_1_pmp_3_mask),
    .io_requestor_1_pmp_4_cfg_l(ptw_io_requestor_1_pmp_4_cfg_l),
    .io_requestor_1_pmp_4_cfg_a(ptw_io_requestor_1_pmp_4_cfg_a),
    .io_requestor_1_pmp_4_cfg_x(ptw_io_requestor_1_pmp_4_cfg_x),
    .io_requestor_1_pmp_4_cfg_w(ptw_io_requestor_1_pmp_4_cfg_w),
    .io_requestor_1_pmp_4_cfg_r(ptw_io_requestor_1_pmp_4_cfg_r),
    .io_requestor_1_pmp_4_addr(ptw_io_requestor_1_pmp_4_addr),
    .io_requestor_1_pmp_4_mask(ptw_io_requestor_1_pmp_4_mask),
    .io_requestor_1_pmp_5_cfg_l(ptw_io_requestor_1_pmp_5_cfg_l),
    .io_requestor_1_pmp_5_cfg_a(ptw_io_requestor_1_pmp_5_cfg_a),
    .io_requestor_1_pmp_5_cfg_x(ptw_io_requestor_1_pmp_5_cfg_x),
    .io_requestor_1_pmp_5_cfg_w(ptw_io_requestor_1_pmp_5_cfg_w),
    .io_requestor_1_pmp_5_cfg_r(ptw_io_requestor_1_pmp_5_cfg_r),
    .io_requestor_1_pmp_5_addr(ptw_io_requestor_1_pmp_5_addr),
    .io_requestor_1_pmp_5_mask(ptw_io_requestor_1_pmp_5_mask),
    .io_requestor_1_pmp_6_cfg_l(ptw_io_requestor_1_pmp_6_cfg_l),
    .io_requestor_1_pmp_6_cfg_a(ptw_io_requestor_1_pmp_6_cfg_a),
    .io_requestor_1_pmp_6_cfg_x(ptw_io_requestor_1_pmp_6_cfg_x),
    .io_requestor_1_pmp_6_cfg_w(ptw_io_requestor_1_pmp_6_cfg_w),
    .io_requestor_1_pmp_6_cfg_r(ptw_io_requestor_1_pmp_6_cfg_r),
    .io_requestor_1_pmp_6_addr(ptw_io_requestor_1_pmp_6_addr),
    .io_requestor_1_pmp_6_mask(ptw_io_requestor_1_pmp_6_mask),
    .io_requestor_1_pmp_7_cfg_l(ptw_io_requestor_1_pmp_7_cfg_l),
    .io_requestor_1_pmp_7_cfg_a(ptw_io_requestor_1_pmp_7_cfg_a),
    .io_requestor_1_pmp_7_cfg_x(ptw_io_requestor_1_pmp_7_cfg_x),
    .io_requestor_1_pmp_7_cfg_w(ptw_io_requestor_1_pmp_7_cfg_w),
    .io_requestor_1_pmp_7_cfg_r(ptw_io_requestor_1_pmp_7_cfg_r),
    .io_requestor_1_pmp_7_addr(ptw_io_requestor_1_pmp_7_addr),
    .io_requestor_1_pmp_7_mask(ptw_io_requestor_1_pmp_7_mask),
    .io_mem_req_ready(ptw_io_mem_req_ready),
    .io_mem_req_valid(ptw_io_mem_req_valid),
    .io_mem_req_bits_addr(ptw_io_mem_req_bits_addr),
    .io_mem_s1_kill(ptw_io_mem_s1_kill),
    .io_mem_s2_nack(ptw_io_mem_s2_nack),
    .io_mem_resp_valid(ptw_io_mem_resp_valid),
    .io_mem_resp_bits_data_word_bypass(ptw_io_mem_resp_bits_data_word_bypass),
    .io_mem_s2_xcpt_ae_ld(ptw_io_mem_s2_xcpt_ae_ld),
    .io_dpath_ptbr_mode(ptw_io_dpath_ptbr_mode),
    .io_dpath_ptbr_ppn(ptw_io_dpath_ptbr_ppn),
    .io_dpath_sfence_valid(ptw_io_dpath_sfence_valid),
    .io_dpath_sfence_bits_rs1(ptw_io_dpath_sfence_bits_rs1),
    .io_dpath_status_dprv(ptw_io_dpath_status_dprv),
    .io_dpath_status_prv(ptw_io_dpath_status_prv),
    .io_dpath_status_mxr(ptw_io_dpath_status_mxr),
    .io_dpath_status_sum(ptw_io_dpath_status_sum),
    .io_dpath_pmp_0_cfg_l(ptw_io_dpath_pmp_0_cfg_l),
    .io_dpath_pmp_0_cfg_a(ptw_io_dpath_pmp_0_cfg_a),
    .io_dpath_pmp_0_cfg_x(ptw_io_dpath_pmp_0_cfg_x),
    .io_dpath_pmp_0_cfg_w(ptw_io_dpath_pmp_0_cfg_w),
    .io_dpath_pmp_0_cfg_r(ptw_io_dpath_pmp_0_cfg_r),
    .io_dpath_pmp_0_addr(ptw_io_dpath_pmp_0_addr),
    .io_dpath_pmp_0_mask(ptw_io_dpath_pmp_0_mask),
    .io_dpath_pmp_1_cfg_l(ptw_io_dpath_pmp_1_cfg_l),
    .io_dpath_pmp_1_cfg_a(ptw_io_dpath_pmp_1_cfg_a),
    .io_dpath_pmp_1_cfg_x(ptw_io_dpath_pmp_1_cfg_x),
    .io_dpath_pmp_1_cfg_w(ptw_io_dpath_pmp_1_cfg_w),
    .io_dpath_pmp_1_cfg_r(ptw_io_dpath_pmp_1_cfg_r),
    .io_dpath_pmp_1_addr(ptw_io_dpath_pmp_1_addr),
    .io_dpath_pmp_1_mask(ptw_io_dpath_pmp_1_mask),
    .io_dpath_pmp_2_cfg_l(ptw_io_dpath_pmp_2_cfg_l),
    .io_dpath_pmp_2_cfg_a(ptw_io_dpath_pmp_2_cfg_a),
    .io_dpath_pmp_2_cfg_x(ptw_io_dpath_pmp_2_cfg_x),
    .io_dpath_pmp_2_cfg_w(ptw_io_dpath_pmp_2_cfg_w),
    .io_dpath_pmp_2_cfg_r(ptw_io_dpath_pmp_2_cfg_r),
    .io_dpath_pmp_2_addr(ptw_io_dpath_pmp_2_addr),
    .io_dpath_pmp_2_mask(ptw_io_dpath_pmp_2_mask),
    .io_dpath_pmp_3_cfg_l(ptw_io_dpath_pmp_3_cfg_l),
    .io_dpath_pmp_3_cfg_a(ptw_io_dpath_pmp_3_cfg_a),
    .io_dpath_pmp_3_cfg_x(ptw_io_dpath_pmp_3_cfg_x),
    .io_dpath_pmp_3_cfg_w(ptw_io_dpath_pmp_3_cfg_w),
    .io_dpath_pmp_3_cfg_r(ptw_io_dpath_pmp_3_cfg_r),
    .io_dpath_pmp_3_addr(ptw_io_dpath_pmp_3_addr),
    .io_dpath_pmp_3_mask(ptw_io_dpath_pmp_3_mask),
    .io_dpath_pmp_4_cfg_l(ptw_io_dpath_pmp_4_cfg_l),
    .io_dpath_pmp_4_cfg_a(ptw_io_dpath_pmp_4_cfg_a),
    .io_dpath_pmp_4_cfg_x(ptw_io_dpath_pmp_4_cfg_x),
    .io_dpath_pmp_4_cfg_w(ptw_io_dpath_pmp_4_cfg_w),
    .io_dpath_pmp_4_cfg_r(ptw_io_dpath_pmp_4_cfg_r),
    .io_dpath_pmp_4_addr(ptw_io_dpath_pmp_4_addr),
    .io_dpath_pmp_4_mask(ptw_io_dpath_pmp_4_mask),
    .io_dpath_pmp_5_cfg_l(ptw_io_dpath_pmp_5_cfg_l),
    .io_dpath_pmp_5_cfg_a(ptw_io_dpath_pmp_5_cfg_a),
    .io_dpath_pmp_5_cfg_x(ptw_io_dpath_pmp_5_cfg_x),
    .io_dpath_pmp_5_cfg_w(ptw_io_dpath_pmp_5_cfg_w),
    .io_dpath_pmp_5_cfg_r(ptw_io_dpath_pmp_5_cfg_r),
    .io_dpath_pmp_5_addr(ptw_io_dpath_pmp_5_addr),
    .io_dpath_pmp_5_mask(ptw_io_dpath_pmp_5_mask),
    .io_dpath_pmp_6_cfg_l(ptw_io_dpath_pmp_6_cfg_l),
    .io_dpath_pmp_6_cfg_a(ptw_io_dpath_pmp_6_cfg_a),
    .io_dpath_pmp_6_cfg_x(ptw_io_dpath_pmp_6_cfg_x),
    .io_dpath_pmp_6_cfg_w(ptw_io_dpath_pmp_6_cfg_w),
    .io_dpath_pmp_6_cfg_r(ptw_io_dpath_pmp_6_cfg_r),
    .io_dpath_pmp_6_addr(ptw_io_dpath_pmp_6_addr),
    .io_dpath_pmp_6_mask(ptw_io_dpath_pmp_6_mask),
    .io_dpath_pmp_7_cfg_l(ptw_io_dpath_pmp_7_cfg_l),
    .io_dpath_pmp_7_cfg_a(ptw_io_dpath_pmp_7_cfg_a),
    .io_dpath_pmp_7_cfg_x(ptw_io_dpath_pmp_7_cfg_x),
    .io_dpath_pmp_7_cfg_w(ptw_io_dpath_pmp_7_cfg_w),
    .io_dpath_pmp_7_cfg_r(ptw_io_dpath_pmp_7_cfg_r),
    .io_dpath_pmp_7_addr(ptw_io_dpath_pmp_7_addr),
    .io_dpath_pmp_7_mask(ptw_io_dpath_pmp_7_mask),
    .io_dpath_customCSRs_csrs_0_value(ptw_io_dpath_customCSRs_csrs_0_value)
  );
  RRArbiter_1 respArb ( // @[LazyRoCC.scala 86:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314357.4]
    .io_in_0_ready(respArb_io_in_0_ready),
    .io_in_0_valid(respArb_io_in_0_valid),
    .io_in_0_bits_rd(respArb_io_in_0_bits_rd),
    .io_in_0_bits_data(respArb_io_in_0_bits_data),
    .io_out_ready(respArb_io_out_ready),
    .io_out_valid(respArb_io_out_valid),
    .io_out_bits_rd(respArb_io_out_bits_rd),
    .io_out_bits_data(respArb_io_out_bits_data)
  );
  RoccCommandRouter cmdRouter ( // @[LazyRoCC.scala 87:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314361.4]
    .clock(cmdRouter_clock),
    .reset(cmdRouter_reset),
    .io_in_ready(cmdRouter_io_in_ready),
    .io_in_valid(cmdRouter_io_in_valid),
    .io_in_bits_inst_funct(cmdRouter_io_in_bits_inst_funct),
    .io_in_bits_inst_rs2(cmdRouter_io_in_bits_inst_rs2),
    .io_in_bits_inst_rs1(cmdRouter_io_in_bits_inst_rs1),
    .io_in_bits_inst_xd(cmdRouter_io_in_bits_inst_xd),
    .io_in_bits_inst_xs1(cmdRouter_io_in_bits_inst_xs1),
    .io_in_bits_inst_xs2(cmdRouter_io_in_bits_inst_xs2),
    .io_in_bits_inst_rd(cmdRouter_io_in_bits_inst_rd),
    .io_in_bits_inst_opcode(cmdRouter_io_in_bits_inst_opcode),
    .io_in_bits_rs1(cmdRouter_io_in_bits_rs1),
    .io_in_bits_rs2(cmdRouter_io_in_bits_rs2),
    .io_in_bits_status_prv(cmdRouter_io_in_bits_status_prv),
    .io_out_0_ready(cmdRouter_io_out_0_ready),
    .io_out_0_valid(cmdRouter_io_out_0_valid),
    .io_out_0_bits_inst_funct(cmdRouter_io_out_0_bits_inst_funct),
    .io_out_0_bits_inst_rs2(cmdRouter_io_out_0_bits_inst_rs2),
    .io_out_0_bits_inst_rs1(cmdRouter_io_out_0_bits_inst_rs1),
    .io_out_0_bits_inst_xd(cmdRouter_io_out_0_bits_inst_xd),
    .io_out_0_bits_inst_xs1(cmdRouter_io_out_0_bits_inst_xs1),
    .io_out_0_bits_inst_xs2(cmdRouter_io_out_0_bits_inst_xs2),
    .io_out_0_bits_inst_rd(cmdRouter_io_out_0_bits_inst_rd),
    .io_out_0_bits_inst_opcode(cmdRouter_io_out_0_bits_inst_opcode),
    .io_out_0_bits_rs1(cmdRouter_io_out_0_bits_rs1),
    .io_out_0_bits_rs2(cmdRouter_io_out_0_bits_rs2),
    .io_out_0_bits_status_prv(cmdRouter_io_out_0_bits_status_prv),
    .io_busy(cmdRouter_io_busy)
  );
  SimpleHellaCacheIF SimpleHellaCacheIF ( // @[LazyRoCC.scala 91:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314366.4]
    .clock(SimpleHellaCacheIF_clock),
    .reset(SimpleHellaCacheIF_reset),
    .io_requestor_req_ready(SimpleHellaCacheIF_io_requestor_req_ready),
    .io_requestor_req_valid(SimpleHellaCacheIF_io_requestor_req_valid),
    .io_requestor_req_bits_addr(SimpleHellaCacheIF_io_requestor_req_bits_addr),
    .io_requestor_req_bits_tag(SimpleHellaCacheIF_io_requestor_req_bits_tag),
    .io_requestor_req_bits_cmd(SimpleHellaCacheIF_io_requestor_req_bits_cmd),
    .io_requestor_req_bits_typ(SimpleHellaCacheIF_io_requestor_req_bits_typ),
    .io_requestor_req_bits_phys(SimpleHellaCacheIF_io_requestor_req_bits_phys),
    .io_requestor_req_bits_data(SimpleHellaCacheIF_io_requestor_req_bits_data),
    .io_requestor_resp_valid(SimpleHellaCacheIF_io_requestor_resp_valid),
    .io_requestor_resp_bits_addr(SimpleHellaCacheIF_io_requestor_resp_bits_addr),
    .io_requestor_resp_bits_tag(SimpleHellaCacheIF_io_requestor_resp_bits_tag),
    .io_requestor_resp_bits_cmd(SimpleHellaCacheIF_io_requestor_resp_bits_cmd),
    .io_requestor_resp_bits_data(SimpleHellaCacheIF_io_requestor_resp_bits_data),
    .io_requestor_resp_bits_replay(SimpleHellaCacheIF_io_requestor_resp_bits_replay),
    .io_requestor_resp_bits_has_data(SimpleHellaCacheIF_io_requestor_resp_bits_has_data),
    .io_requestor_resp_bits_data_word_bypass(SimpleHellaCacheIF_io_requestor_resp_bits_data_word_bypass),
    .io_requestor_resp_bits_store_data(SimpleHellaCacheIF_io_requestor_resp_bits_store_data),
    .io_cache_req_ready(SimpleHellaCacheIF_io_cache_req_ready),
    .io_cache_req_valid(SimpleHellaCacheIF_io_cache_req_valid),
    .io_cache_req_bits_addr(SimpleHellaCacheIF_io_cache_req_bits_addr),
    .io_cache_req_bits_tag(SimpleHellaCacheIF_io_cache_req_bits_tag),
    .io_cache_req_bits_cmd(SimpleHellaCacheIF_io_cache_req_bits_cmd),
    .io_cache_req_bits_typ(SimpleHellaCacheIF_io_cache_req_bits_typ),
    .io_cache_req_bits_phys(SimpleHellaCacheIF_io_cache_req_bits_phys),
    .io_cache_s1_kill(SimpleHellaCacheIF_io_cache_s1_kill),
    .io_cache_s1_data_data(SimpleHellaCacheIF_io_cache_s1_data_data),
    .io_cache_s2_nack(SimpleHellaCacheIF_io_cache_s2_nack),
    .io_cache_resp_valid(SimpleHellaCacheIF_io_cache_resp_valid),
    .io_cache_resp_bits_addr(SimpleHellaCacheIF_io_cache_resp_bits_addr),
    .io_cache_resp_bits_tag(SimpleHellaCacheIF_io_cache_resp_bits_tag),
    .io_cache_resp_bits_cmd(SimpleHellaCacheIF_io_cache_resp_bits_cmd),
    .io_cache_resp_bits_data(SimpleHellaCacheIF_io_cache_resp_bits_data),
    .io_cache_resp_bits_replay(SimpleHellaCacheIF_io_cache_resp_bits_replay),
    .io_cache_resp_bits_has_data(SimpleHellaCacheIF_io_cache_resp_bits_has_data),
    .io_cache_resp_bits_data_word_bypass(SimpleHellaCacheIF_io_cache_resp_bits_data_word_bypass),
    .io_cache_resp_bits_store_data(SimpleHellaCacheIF_io_cache_resp_bits_store_data),
    .io_cache_s2_xcpt_ma_ld(SimpleHellaCacheIF_io_cache_s2_xcpt_ma_ld),
    .io_cache_s2_xcpt_ma_st(SimpleHellaCacheIF_io_cache_s2_xcpt_ma_st),
    .io_cache_s2_xcpt_pf_ld(SimpleHellaCacheIF_io_cache_s2_xcpt_pf_ld),
    .io_cache_s2_xcpt_pf_st(SimpleHellaCacheIF_io_cache_s2_xcpt_pf_st),
    .io_cache_s2_xcpt_ae_ld(SimpleHellaCacheIF_io_cache_s2_xcpt_ae_ld),
    .io_cache_s2_xcpt_ae_st(SimpleHellaCacheIF_io_cache_s2_xcpt_ae_st)
  );
  Queue_25 Queue ( // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314371.4]
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_rd(Queue_io_enq_bits_rd),
    .io_enq_bits_data(Queue_io_enq_bits_data),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_rd(Queue_io_deq_bits_rd),
    .io_deq_bits_data(Queue_io_deq_bits_data)
  );
  Rocket core ( // @[RocketTile.scala 115:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314381.4]
    .clock(core_clock),
    .reset(core_reset),
    .io_hartid(core_io_hartid),
    .io_interrupts_debug(core_io_interrupts_debug),
    .io_interrupts_mtip(core_io_interrupts_mtip),
    .io_interrupts_msip(core_io_interrupts_msip),
    .io_interrupts_meip(core_io_interrupts_meip),
    .io_interrupts_seip(core_io_interrupts_seip),
    .io_imem_might_request(core_io_imem_might_request),
    .io_imem_req_valid(core_io_imem_req_valid),
    .io_imem_req_bits_pc(core_io_imem_req_bits_pc),
    .io_imem_req_bits_speculative(core_io_imem_req_bits_speculative),
    .io_imem_sfence_valid(core_io_imem_sfence_valid),
    .io_imem_sfence_bits_rs1(core_io_imem_sfence_bits_rs1),
    .io_imem_sfence_bits_rs2(core_io_imem_sfence_bits_rs2),
    .io_imem_sfence_bits_addr(core_io_imem_sfence_bits_addr),
    .io_imem_resp_ready(core_io_imem_resp_ready),
    .io_imem_resp_valid(core_io_imem_resp_valid),
    .io_imem_resp_bits_btb_taken(core_io_imem_resp_bits_btb_taken),
    .io_imem_resp_bits_btb_bridx(core_io_imem_resp_bits_btb_bridx),
    .io_imem_resp_bits_btb_entry(core_io_imem_resp_bits_btb_entry),
    .io_imem_resp_bits_btb_bht_history(core_io_imem_resp_bits_btb_bht_history),
    .io_imem_resp_bits_pc(core_io_imem_resp_bits_pc),
    .io_imem_resp_bits_data(core_io_imem_resp_bits_data),
    .io_imem_resp_bits_xcpt_pf_inst(core_io_imem_resp_bits_xcpt_pf_inst),
    .io_imem_resp_bits_xcpt_ae_inst(core_io_imem_resp_bits_xcpt_ae_inst),
    .io_imem_resp_bits_replay(core_io_imem_resp_bits_replay),
    .io_imem_btb_update_valid(core_io_imem_btb_update_valid),
    .io_imem_btb_update_bits_prediction_entry(core_io_imem_btb_update_bits_prediction_entry),
    .io_imem_btb_update_bits_pc(core_io_imem_btb_update_bits_pc),
    .io_imem_btb_update_bits_isValid(core_io_imem_btb_update_bits_isValid),
    .io_imem_btb_update_bits_br_pc(core_io_imem_btb_update_bits_br_pc),
    .io_imem_btb_update_bits_cfiType(core_io_imem_btb_update_bits_cfiType),
    .io_imem_bht_update_valid(core_io_imem_bht_update_valid),
    .io_imem_bht_update_bits_prediction_history(core_io_imem_bht_update_bits_prediction_history),
    .io_imem_bht_update_bits_pc(core_io_imem_bht_update_bits_pc),
    .io_imem_bht_update_bits_branch(core_io_imem_bht_update_bits_branch),
    .io_imem_bht_update_bits_taken(core_io_imem_bht_update_bits_taken),
    .io_imem_bht_update_bits_mispredict(core_io_imem_bht_update_bits_mispredict),
    .io_imem_flush_icache(core_io_imem_flush_icache),
    .io_dmem_req_ready(core_io_dmem_req_ready),
    .io_dmem_req_valid(core_io_dmem_req_valid),
    .io_dmem_req_bits_addr(core_io_dmem_req_bits_addr),
    .io_dmem_req_bits_tag(core_io_dmem_req_bits_tag),
    .io_dmem_req_bits_cmd(core_io_dmem_req_bits_cmd),
    .io_dmem_req_bits_typ(core_io_dmem_req_bits_typ),
    .io_dmem_s1_kill(core_io_dmem_s1_kill),
    .io_dmem_s1_data_data(core_io_dmem_s1_data_data),
    .io_dmem_s2_nack(core_io_dmem_s2_nack),
    .io_dmem_resp_valid(core_io_dmem_resp_valid),
    .io_dmem_resp_bits_tag(core_io_dmem_resp_bits_tag),
    .io_dmem_resp_bits_typ(core_io_dmem_resp_bits_typ),
    .io_dmem_resp_bits_data(core_io_dmem_resp_bits_data),
    .io_dmem_resp_bits_replay(core_io_dmem_resp_bits_replay),
    .io_dmem_resp_bits_has_data(core_io_dmem_resp_bits_has_data),
    .io_dmem_resp_bits_data_word_bypass(core_io_dmem_resp_bits_data_word_bypass),
    .io_dmem_replay_next(core_io_dmem_replay_next),
    .io_dmem_s2_xcpt_ma_ld(core_io_dmem_s2_xcpt_ma_ld),
    .io_dmem_s2_xcpt_ma_st(core_io_dmem_s2_xcpt_ma_st),
    .io_dmem_s2_xcpt_pf_ld(core_io_dmem_s2_xcpt_pf_ld),
    .io_dmem_s2_xcpt_pf_st(core_io_dmem_s2_xcpt_pf_st),
    .io_dmem_s2_xcpt_ae_ld(core_io_dmem_s2_xcpt_ae_ld),
    .io_dmem_s2_xcpt_ae_st(core_io_dmem_s2_xcpt_ae_st),
    .io_dmem_ordered(core_io_dmem_ordered),
    .io_dmem_perf_grant(core_io_dmem_perf_grant),
    .io_dmem_keep_clock_enabled(core_io_dmem_keep_clock_enabled),
    .io_dmem_clock_enabled(core_io_dmem_clock_enabled),
    .io_ptw_ptbr_mode(core_io_ptw_ptbr_mode),
    .io_ptw_ptbr_ppn(core_io_ptw_ptbr_ppn),
    .io_ptw_sfence_valid(core_io_ptw_sfence_valid),
    .io_ptw_sfence_bits_rs1(core_io_ptw_sfence_bits_rs1),
    .io_ptw_status_dprv(core_io_ptw_status_dprv),
    .io_ptw_status_prv(core_io_ptw_status_prv),
    .io_ptw_status_mxr(core_io_ptw_status_mxr),
    .io_ptw_status_sum(core_io_ptw_status_sum),
    .io_ptw_pmp_0_cfg_l(core_io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_a(core_io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x(core_io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w(core_io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r(core_io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr(core_io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask(core_io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l(core_io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_a(core_io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x(core_io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w(core_io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r(core_io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr(core_io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask(core_io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l(core_io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_a(core_io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x(core_io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w(core_io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r(core_io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr(core_io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask(core_io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l(core_io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_a(core_io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x(core_io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w(core_io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r(core_io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr(core_io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask(core_io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l(core_io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_a(core_io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x(core_io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w(core_io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r(core_io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr(core_io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask(core_io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l(core_io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_a(core_io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x(core_io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w(core_io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r(core_io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr(core_io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask(core_io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l(core_io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_a(core_io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x(core_io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w(core_io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r(core_io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr(core_io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask(core_io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l(core_io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_a(core_io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x(core_io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w(core_io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r(core_io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr(core_io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask(core_io_ptw_pmp_7_mask),
    .io_ptw_customCSRs_csrs_0_value(core_io_ptw_customCSRs_csrs_0_value),
    .io_fpu_inst(core_io_fpu_inst),
    .io_fpu_fromint_data(core_io_fpu_fromint_data),
    .io_fpu_fcsr_rm(core_io_fpu_fcsr_rm),
    .io_fpu_fcsr_flags_valid(core_io_fpu_fcsr_flags_valid),
    .io_fpu_fcsr_flags_bits(core_io_fpu_fcsr_flags_bits),
    .io_fpu_store_data(core_io_fpu_store_data),
    .io_fpu_toint_data(core_io_fpu_toint_data),
    .io_fpu_dmem_resp_val(core_io_fpu_dmem_resp_val),
    .io_fpu_dmem_resp_type(core_io_fpu_dmem_resp_type),
    .io_fpu_dmem_resp_tag(core_io_fpu_dmem_resp_tag),
    .io_fpu_dmem_resp_data(core_io_fpu_dmem_resp_data),
    .io_fpu_valid(core_io_fpu_valid),
    .io_fpu_fcsr_rdy(core_io_fpu_fcsr_rdy),
    .io_fpu_nack_mem(core_io_fpu_nack_mem),
    .io_fpu_illegal_rm(core_io_fpu_illegal_rm),
    .io_fpu_killx(core_io_fpu_killx),
    .io_fpu_killm(core_io_fpu_killm),
    .io_fpu_dec_wen(core_io_fpu_dec_wen),
    .io_fpu_dec_ren1(core_io_fpu_dec_ren1),
    .io_fpu_dec_ren2(core_io_fpu_dec_ren2),
    .io_fpu_dec_ren3(core_io_fpu_dec_ren3),
    .io_fpu_sboard_set(core_io_fpu_sboard_set),
    .io_fpu_sboard_clr(core_io_fpu_sboard_clr),
    .io_fpu_sboard_clra(core_io_fpu_sboard_clra),
    .io_rocc_cmd_ready(core_io_rocc_cmd_ready),
    .io_rocc_cmd_valid(core_io_rocc_cmd_valid),
    .io_rocc_cmd_bits_inst_funct(core_io_rocc_cmd_bits_inst_funct),
    .io_rocc_cmd_bits_inst_rs2(core_io_rocc_cmd_bits_inst_rs2),
    .io_rocc_cmd_bits_inst_rs1(core_io_rocc_cmd_bits_inst_rs1),
    .io_rocc_cmd_bits_inst_xd(core_io_rocc_cmd_bits_inst_xd),
    .io_rocc_cmd_bits_inst_xs1(core_io_rocc_cmd_bits_inst_xs1),
    .io_rocc_cmd_bits_inst_xs2(core_io_rocc_cmd_bits_inst_xs2),
    .io_rocc_cmd_bits_inst_rd(core_io_rocc_cmd_bits_inst_rd),
    .io_rocc_cmd_bits_inst_opcode(core_io_rocc_cmd_bits_inst_opcode),
    .io_rocc_cmd_bits_rs1(core_io_rocc_cmd_bits_rs1),
    .io_rocc_cmd_bits_rs2(core_io_rocc_cmd_bits_rs2),
    .io_rocc_cmd_bits_status_prv(core_io_rocc_cmd_bits_status_prv),
    .io_rocc_resp_ready(core_io_rocc_resp_ready),
    .io_rocc_resp_valid(core_io_rocc_resp_valid),
    .io_rocc_resp_bits_rd(core_io_rocc_resp_bits_rd),
    .io_rocc_resp_bits_data(core_io_rocc_resp_bits_data),
    .io_rocc_busy(core_io_rocc_busy),
    .io_rocc_interrupt(core_io_rocc_interrupt),
    .io_rocc_exception(core_io_rocc_exception)
  );
  assign auto_tl_master_xing_out_a_valid = buffer_auto_out_a_valid; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_a_bits_param = buffer_auto_out_a_bits_param; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_a_bits_size = buffer_auto_out_a_bits_size; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_a_bits_source = buffer_auto_out_a_bits_source; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_a_bits_address = buffer_auto_out_a_bits_address; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_a_bits_mask = buffer_auto_out_a_bits_mask; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_a_bits_data = buffer_auto_out_a_bits_data; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_b_ready = buffer_auto_out_b_ready; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_c_valid = buffer_auto_out_c_valid; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_c_bits_opcode = buffer_auto_out_c_bits_opcode; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_c_bits_param = buffer_auto_out_c_bits_param; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_c_bits_size = buffer_auto_out_c_bits_size; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_c_bits_source = buffer_auto_out_c_bits_source; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_c_bits_address = buffer_auto_out_c_bits_address; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_c_bits_data = buffer_auto_out_c_bits_data; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_c_bits_corrupt = buffer_auto_out_c_bits_corrupt; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_d_ready = buffer_auto_out_d_ready; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_e_valid = buffer_auto_out_e_valid; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign auto_tl_master_xing_out_e_bits_sink = buffer_auto_out_e_bits_sink; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314339.4]
  assign tlMasterXbar_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314180.4]
  assign tlMasterXbar_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314181.4]
  assign tlMasterXbar_auto_in_1_a_valid = frontend_auto_icache_master_out_a_valid; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign tlMasterXbar_auto_in_1_a_bits_opcode = 3'h4; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign tlMasterXbar_auto_in_1_a_bits_param = 3'h0; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign tlMasterXbar_auto_in_1_a_bits_size = 3'h6; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign tlMasterXbar_auto_in_1_a_bits_source = 1'h0; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign tlMasterXbar_auto_in_1_a_bits_address = frontend_auto_icache_master_out_a_bits_address; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign tlMasterXbar_auto_in_1_a_bits_mask = 8'hff; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign tlMasterXbar_auto_in_1_a_bits_data = 64'h0; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign tlMasterXbar_auto_in_1_a_bits_corrupt = 1'h0; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign tlMasterXbar_auto_in_1_c_valid = 1'h0; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign tlMasterXbar_auto_in_1_d_ready = 1'h1; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign tlMasterXbar_auto_in_1_e_valid = 1'h0; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign tlMasterXbar_auto_in_0_a_valid = dcache_auto_out_a_valid; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_a_bits_opcode = dcache_auto_out_a_bits_opcode; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_a_bits_param = dcache_auto_out_a_bits_param; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_a_bits_size = dcache_auto_out_a_bits_size; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_a_bits_source = dcache_auto_out_a_bits_source; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_a_bits_address = dcache_auto_out_a_bits_address; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_a_bits_mask = dcache_auto_out_a_bits_mask; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_a_bits_data = dcache_auto_out_a_bits_data; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_a_bits_corrupt = 1'h0; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_b_ready = dcache_auto_out_b_ready; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_c_valid = dcache_auto_out_c_valid; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_c_bits_opcode = dcache_auto_out_c_bits_opcode; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_c_bits_param = dcache_auto_out_c_bits_param; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_c_bits_size = dcache_auto_out_c_bits_size; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_c_bits_source = dcache_auto_out_c_bits_source; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_c_bits_address = dcache_auto_out_c_bits_address; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_c_bits_data = dcache_auto_out_c_bits_data; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_c_bits_corrupt = 1'h0; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_d_ready = dcache_auto_out_d_ready; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_e_valid = dcache_auto_out_e_valid; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_in_0_e_bits_sink = dcache_auto_out_e_bits_sink; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign tlMasterXbar_auto_out_a_ready = buffer_auto_in_a_ready; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_b_valid = buffer_auto_in_b_valid; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_b_bits_opcode = buffer_auto_in_b_bits_opcode; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_b_bits_param = buffer_auto_in_b_bits_param; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_b_bits_size = buffer_auto_in_b_bits_size; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_b_bits_source = buffer_auto_in_b_bits_source; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_b_bits_address = buffer_auto_in_b_bits_address; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_b_bits_mask = buffer_auto_in_b_bits_mask; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_b_bits_corrupt = buffer_auto_in_b_bits_corrupt; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_c_ready = buffer_auto_in_c_ready; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_d_valid = buffer_auto_in_d_valid; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_d_bits_opcode = buffer_auto_in_d_bits_opcode; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_d_bits_param = buffer_auto_in_d_bits_param; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_d_bits_size = buffer_auto_in_d_bits_size; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_d_bits_source = buffer_auto_in_d_bits_source; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_d_bits_sink = buffer_auto_in_d_bits_sink; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_d_bits_denied = buffer_auto_in_d_bits_denied; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_d_bits_data = buffer_auto_in_d_bits_data; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign tlMasterXbar_auto_out_e_ready = buffer_auto_in_e_ready; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314322.4]
  assign intXbar_auto_int_in_3_0 = intsink_3_auto_out_0; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314327.4]
  assign intXbar_auto_int_in_2_0 = intsink_2_auto_out_0; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314326.4]
  assign intXbar_auto_int_in_1_0 = intsink_1_auto_out_0; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314325.4]
  assign intXbar_auto_int_in_1_1 = intsink_1_auto_out_1; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314325.4]
  assign intXbar_auto_int_in_0_0 = intsink_auto_out_0; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314324.4]
  assign dcache_gated_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314199.4]
  assign dcache_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314200.4]
  assign dcache_auto_out_a_ready = tlMasterXbar_auto_in_0_a_ready; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_b_valid = tlMasterXbar_auto_in_0_b_valid; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_b_bits_param = tlMasterXbar_auto_in_0_b_bits_param; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_b_bits_size = tlMasterXbar_auto_in_0_b_bits_size; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_b_bits_source = tlMasterXbar_auto_in_0_b_bits_source; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_b_bits_address = tlMasterXbar_auto_in_0_b_bits_address; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_c_ready = tlMasterXbar_auto_in_0_c_ready; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_d_valid = tlMasterXbar_auto_in_0_d_valid; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_d_bits_opcode = tlMasterXbar_auto_in_0_d_bits_opcode; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_d_bits_param = tlMasterXbar_auto_in_0_d_bits_param; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_d_bits_size = tlMasterXbar_auto_in_0_d_bits_size; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_d_bits_source = tlMasterXbar_auto_in_0_d_bits_source; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_d_bits_sink = tlMasterXbar_auto_in_0_d_bits_sink; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_d_bits_denied = tlMasterXbar_auto_in_0_d_bits_denied; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_d_bits_data = tlMasterXbar_auto_in_0_d_bits_data; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_auto_out_e_ready = tlMasterXbar_auto_in_0_e_ready; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314328.4]
  assign dcache_io_cpu_req_valid = dcacheArb_io_mem_req_valid; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcache_io_cpu_req_bits_addr = dcacheArb_io_mem_req_bits_addr; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcache_io_cpu_req_bits_tag = dcacheArb_io_mem_req_bits_tag; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcache_io_cpu_req_bits_cmd = dcacheArb_io_mem_req_bits_cmd; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcache_io_cpu_req_bits_typ = dcacheArb_io_mem_req_bits_typ; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcache_io_cpu_req_bits_phys = dcacheArb_io_mem_req_bits_phys; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcache_io_cpu_s1_kill = dcacheArb_io_mem_s1_kill; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcache_io_cpu_s1_data_data = dcacheArb_io_mem_s1_data_data; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcache_io_cpu_s1_data_mask = dcacheArb_io_mem_s1_data_mask; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcache_io_cpu_s2_kill = dcacheArb_io_mem_s2_kill; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcache_io_cpu_keep_clock_enabled = dcacheArb_io_mem_keep_clock_enabled; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcache_io_ptw_req_ready = ptw_io_requestor_0_req_ready; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_valid = ptw_io_requestor_0_resp_valid; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_ae = ptw_io_requestor_0_resp_bits_ae; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_pte_ppn = ptw_io_requestor_0_resp_bits_pte_ppn; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_pte_d = ptw_io_requestor_0_resp_bits_pte_d; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_pte_a = ptw_io_requestor_0_resp_bits_pte_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_pte_g = ptw_io_requestor_0_resp_bits_pte_g; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_pte_u = ptw_io_requestor_0_resp_bits_pte_u; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_pte_x = ptw_io_requestor_0_resp_bits_pte_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_pte_w = ptw_io_requestor_0_resp_bits_pte_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_pte_r = ptw_io_requestor_0_resp_bits_pte_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_pte_v = ptw_io_requestor_0_resp_bits_pte_v; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_level = ptw_io_requestor_0_resp_bits_level; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_fragmented_superpage = 1'h0; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_resp_bits_homogeneous = ptw_io_requestor_0_resp_bits_homogeneous; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_ptbr_mode = ptw_io_requestor_0_ptbr_mode; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_status_dprv = ptw_io_requestor_0_status_dprv; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_status_mxr = ptw_io_requestor_0_status_mxr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_status_sum = ptw_io_requestor_0_status_sum; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_0_cfg_l = ptw_io_requestor_0_pmp_0_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_0_cfg_a = ptw_io_requestor_0_pmp_0_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_0_cfg_x = ptw_io_requestor_0_pmp_0_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_0_cfg_w = ptw_io_requestor_0_pmp_0_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_0_cfg_r = ptw_io_requestor_0_pmp_0_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_0_addr = ptw_io_requestor_0_pmp_0_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_0_mask = ptw_io_requestor_0_pmp_0_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_1_cfg_l = ptw_io_requestor_0_pmp_1_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_1_cfg_a = ptw_io_requestor_0_pmp_1_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_1_cfg_x = ptw_io_requestor_0_pmp_1_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_1_cfg_w = ptw_io_requestor_0_pmp_1_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_1_cfg_r = ptw_io_requestor_0_pmp_1_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_1_addr = ptw_io_requestor_0_pmp_1_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_1_mask = ptw_io_requestor_0_pmp_1_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_2_cfg_l = ptw_io_requestor_0_pmp_2_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_2_cfg_a = ptw_io_requestor_0_pmp_2_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_2_cfg_x = ptw_io_requestor_0_pmp_2_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_2_cfg_w = ptw_io_requestor_0_pmp_2_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_2_cfg_r = ptw_io_requestor_0_pmp_2_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_2_addr = ptw_io_requestor_0_pmp_2_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_2_mask = ptw_io_requestor_0_pmp_2_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_3_cfg_l = ptw_io_requestor_0_pmp_3_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_3_cfg_a = ptw_io_requestor_0_pmp_3_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_3_cfg_x = ptw_io_requestor_0_pmp_3_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_3_cfg_w = ptw_io_requestor_0_pmp_3_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_3_cfg_r = ptw_io_requestor_0_pmp_3_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_3_addr = ptw_io_requestor_0_pmp_3_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_3_mask = ptw_io_requestor_0_pmp_3_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_4_cfg_l = ptw_io_requestor_0_pmp_4_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_4_cfg_a = ptw_io_requestor_0_pmp_4_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_4_cfg_x = ptw_io_requestor_0_pmp_4_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_4_cfg_w = ptw_io_requestor_0_pmp_4_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_4_cfg_r = ptw_io_requestor_0_pmp_4_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_4_addr = ptw_io_requestor_0_pmp_4_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_4_mask = ptw_io_requestor_0_pmp_4_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_5_cfg_l = ptw_io_requestor_0_pmp_5_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_5_cfg_a = ptw_io_requestor_0_pmp_5_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_5_cfg_x = ptw_io_requestor_0_pmp_5_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_5_cfg_w = ptw_io_requestor_0_pmp_5_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_5_cfg_r = ptw_io_requestor_0_pmp_5_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_5_addr = ptw_io_requestor_0_pmp_5_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_5_mask = ptw_io_requestor_0_pmp_5_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_6_cfg_l = ptw_io_requestor_0_pmp_6_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_6_cfg_a = ptw_io_requestor_0_pmp_6_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_6_cfg_x = ptw_io_requestor_0_pmp_6_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_6_cfg_w = ptw_io_requestor_0_pmp_6_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_6_cfg_r = ptw_io_requestor_0_pmp_6_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_6_addr = ptw_io_requestor_0_pmp_6_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_6_mask = ptw_io_requestor_0_pmp_6_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_7_cfg_l = ptw_io_requestor_0_pmp_7_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_7_cfg_a = ptw_io_requestor_0_pmp_7_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_7_cfg_x = ptw_io_requestor_0_pmp_7_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_7_cfg_w = ptw_io_requestor_0_pmp_7_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_7_cfg_r = ptw_io_requestor_0_pmp_7_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_7_addr = ptw_io_requestor_0_pmp_7_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_pmp_7_mask = ptw_io_requestor_0_pmp_7_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign dcache_io_ptw_customCSRs_csrs_0_value = ptw_io_requestor_0_customCSRs_csrs_0_value; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign manycore_rocc_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314206.4]
  assign manycore_rocc_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314207.4]
  assign manycore_rocc_io_cmd_valid = cmdRouter_io_out_0_valid; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign manycore_rocc_io_cmd_bits_inst_funct = cmdRouter_io_out_0_bits_inst_funct; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign manycore_rocc_io_cmd_bits_inst_rs2 = cmdRouter_io_out_0_bits_inst_rs2; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign manycore_rocc_io_cmd_bits_inst_rs1 = cmdRouter_io_out_0_bits_inst_rs1; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign manycore_rocc_io_cmd_bits_inst_xd = cmdRouter_io_out_0_bits_inst_xd; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign manycore_rocc_io_cmd_bits_inst_xs1 = cmdRouter_io_out_0_bits_inst_xs1; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign manycore_rocc_io_cmd_bits_inst_xs2 = cmdRouter_io_out_0_bits_inst_xs2; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign manycore_rocc_io_cmd_bits_inst_rd = cmdRouter_io_out_0_bits_inst_rd; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign manycore_rocc_io_cmd_bits_inst_opcode = cmdRouter_io_out_0_bits_inst_opcode; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign manycore_rocc_io_cmd_bits_rs1 = cmdRouter_io_out_0_bits_rs1; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign manycore_rocc_io_cmd_bits_rs2 = cmdRouter_io_out_0_bits_rs2; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign manycore_rocc_io_cmd_bits_status_prv = cmdRouter_io_out_0_bits_status_prv; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign manycore_rocc_io_resp_ready = Queue_io_enq_ready; // @[Decoupled.scala 296:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314377.4]
  assign manycore_rocc_io_mem_req_ready = SimpleHellaCacheIF_io_requestor_req_ready; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign manycore_rocc_io_mem_resp_valid = SimpleHellaCacheIF_io_requestor_resp_valid; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign manycore_rocc_io_mem_resp_bits_addr = SimpleHellaCacheIF_io_requestor_resp_bits_addr; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign manycore_rocc_io_mem_resp_bits_tag = SimpleHellaCacheIF_io_requestor_resp_bits_tag; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign manycore_rocc_io_mem_resp_bits_cmd = SimpleHellaCacheIF_io_requestor_resp_bits_cmd; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign manycore_rocc_io_mem_resp_bits_data = SimpleHellaCacheIF_io_requestor_resp_bits_data; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign manycore_rocc_io_mem_resp_bits_replay = SimpleHellaCacheIF_io_requestor_resp_bits_replay; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign manycore_rocc_io_mem_resp_bits_has_data = SimpleHellaCacheIF_io_requestor_resp_bits_has_data; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign manycore_rocc_io_mem_resp_bits_data_word_bypass = SimpleHellaCacheIF_io_requestor_resp_bits_data_word_bypass; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign manycore_rocc_io_mem_resp_bits_store_data = SimpleHellaCacheIF_io_requestor_resp_bits_store_data; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign manycore_rocc_io_exception = core_io_rocc_exception; // @[RocketTile.scala 140:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314399.4]
  assign frontend_gated_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314213.4]
  assign frontend_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314214.4]
  assign frontend_auto_icache_master_out_a_ready = tlMasterXbar_auto_in_1_a_ready; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign frontend_auto_icache_master_out_d_valid = tlMasterXbar_auto_in_1_d_valid; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign frontend_auto_icache_master_out_d_bits_opcode = tlMasterXbar_auto_in_1_d_bits_opcode; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign frontend_auto_icache_master_out_d_bits_size = tlMasterXbar_auto_in_1_d_bits_size; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign frontend_auto_icache_master_out_d_bits_data = tlMasterXbar_auto_in_1_d_bits_data; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign frontend_auto_icache_master_out_d_bits_corrupt = tlMasterXbar_auto_in_1_d_bits_corrupt; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314329.4]
  assign frontend_io_reset_vector = 38'h10000; // @[RocketTile.scala 131:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314393.4]
  assign frontend_io_cpu_might_request = core_io_imem_might_request; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_req_valid = core_io_imem_req_valid; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_req_bits_pc = core_io_imem_req_bits_pc; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_req_bits_speculative = core_io_imem_req_bits_speculative; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_sfence_valid = core_io_imem_sfence_valid; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_sfence_bits_rs1 = core_io_imem_sfence_bits_rs1; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_sfence_bits_rs2 = core_io_imem_sfence_bits_rs2; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_sfence_bits_addr = core_io_imem_sfence_bits_addr; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_resp_ready = core_io_imem_resp_ready; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_btb_update_valid = core_io_imem_btb_update_valid; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_btb_update_bits_prediction_entry = core_io_imem_btb_update_bits_prediction_entry; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_btb_update_bits_pc = core_io_imem_btb_update_bits_pc; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_btb_update_bits_isValid = core_io_imem_btb_update_bits_isValid; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_btb_update_bits_br_pc = core_io_imem_btb_update_bits_br_pc; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_btb_update_bits_cfiType = core_io_imem_btb_update_bits_cfiType; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_bht_update_valid = core_io_imem_bht_update_valid; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_bht_update_bits_prediction_history = core_io_imem_bht_update_bits_prediction_history; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_bht_update_bits_pc = core_io_imem_bht_update_bits_pc; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_bht_update_bits_branch = core_io_imem_bht_update_bits_branch; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_bht_update_bits_taken = core_io_imem_bht_update_bits_taken; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_bht_update_bits_mispredict = core_io_imem_bht_update_bits_mispredict; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_cpu_flush_icache = core_io_imem_flush_icache; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign frontend_io_ptw_req_ready = ptw_io_requestor_1_req_ready; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_valid = ptw_io_requestor_1_resp_valid; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_ae = ptw_io_requestor_1_resp_bits_ae; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_pte_ppn = ptw_io_requestor_1_resp_bits_pte_ppn; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_pte_d = ptw_io_requestor_1_resp_bits_pte_d; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_pte_a = ptw_io_requestor_1_resp_bits_pte_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_pte_g = ptw_io_requestor_1_resp_bits_pte_g; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_pte_u = ptw_io_requestor_1_resp_bits_pte_u; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_pte_x = ptw_io_requestor_1_resp_bits_pte_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_pte_w = ptw_io_requestor_1_resp_bits_pte_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_pte_r = ptw_io_requestor_1_resp_bits_pte_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_pte_v = ptw_io_requestor_1_resp_bits_pte_v; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_level = ptw_io_requestor_1_resp_bits_level; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_fragmented_superpage = 1'h0; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_resp_bits_homogeneous = ptw_io_requestor_1_resp_bits_homogeneous; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_ptbr_mode = ptw_io_requestor_1_ptbr_mode; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_status_prv = ptw_io_requestor_1_status_prv; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_0_cfg_l = ptw_io_requestor_1_pmp_0_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_0_cfg_a = ptw_io_requestor_1_pmp_0_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_0_cfg_x = ptw_io_requestor_1_pmp_0_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_0_cfg_w = ptw_io_requestor_1_pmp_0_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_0_cfg_r = ptw_io_requestor_1_pmp_0_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_0_addr = ptw_io_requestor_1_pmp_0_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_0_mask = ptw_io_requestor_1_pmp_0_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_1_cfg_l = ptw_io_requestor_1_pmp_1_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_1_cfg_a = ptw_io_requestor_1_pmp_1_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_1_cfg_x = ptw_io_requestor_1_pmp_1_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_1_cfg_w = ptw_io_requestor_1_pmp_1_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_1_cfg_r = ptw_io_requestor_1_pmp_1_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_1_addr = ptw_io_requestor_1_pmp_1_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_1_mask = ptw_io_requestor_1_pmp_1_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_2_cfg_l = ptw_io_requestor_1_pmp_2_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_2_cfg_a = ptw_io_requestor_1_pmp_2_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_2_cfg_x = ptw_io_requestor_1_pmp_2_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_2_cfg_w = ptw_io_requestor_1_pmp_2_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_2_cfg_r = ptw_io_requestor_1_pmp_2_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_2_addr = ptw_io_requestor_1_pmp_2_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_2_mask = ptw_io_requestor_1_pmp_2_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_3_cfg_l = ptw_io_requestor_1_pmp_3_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_3_cfg_a = ptw_io_requestor_1_pmp_3_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_3_cfg_x = ptw_io_requestor_1_pmp_3_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_3_cfg_w = ptw_io_requestor_1_pmp_3_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_3_cfg_r = ptw_io_requestor_1_pmp_3_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_3_addr = ptw_io_requestor_1_pmp_3_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_3_mask = ptw_io_requestor_1_pmp_3_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_4_cfg_l = ptw_io_requestor_1_pmp_4_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_4_cfg_a = ptw_io_requestor_1_pmp_4_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_4_cfg_x = ptw_io_requestor_1_pmp_4_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_4_cfg_w = ptw_io_requestor_1_pmp_4_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_4_cfg_r = ptw_io_requestor_1_pmp_4_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_4_addr = ptw_io_requestor_1_pmp_4_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_4_mask = ptw_io_requestor_1_pmp_4_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_5_cfg_l = ptw_io_requestor_1_pmp_5_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_5_cfg_a = ptw_io_requestor_1_pmp_5_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_5_cfg_x = ptw_io_requestor_1_pmp_5_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_5_cfg_w = ptw_io_requestor_1_pmp_5_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_5_cfg_r = ptw_io_requestor_1_pmp_5_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_5_addr = ptw_io_requestor_1_pmp_5_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_5_mask = ptw_io_requestor_1_pmp_5_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_6_cfg_l = ptw_io_requestor_1_pmp_6_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_6_cfg_a = ptw_io_requestor_1_pmp_6_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_6_cfg_x = ptw_io_requestor_1_pmp_6_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_6_cfg_w = ptw_io_requestor_1_pmp_6_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_6_cfg_r = ptw_io_requestor_1_pmp_6_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_6_addr = ptw_io_requestor_1_pmp_6_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_6_mask = ptw_io_requestor_1_pmp_6_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_7_cfg_l = ptw_io_requestor_1_pmp_7_cfg_l; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_7_cfg_a = ptw_io_requestor_1_pmp_7_cfg_a; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_7_cfg_x = ptw_io_requestor_1_pmp_7_cfg_x; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_7_cfg_w = ptw_io_requestor_1_pmp_7_cfg_w; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_7_cfg_r = ptw_io_requestor_1_pmp_7_cfg_r; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_7_addr = ptw_io_requestor_1_pmp_7_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign frontend_io_ptw_pmp_7_mask = ptw_io_requestor_1_pmp_7_mask; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign buffer_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314231.4]
  assign buffer_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314232.4]
  assign buffer_auto_in_a_valid = tlMasterXbar_auto_out_a_valid; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_a_bits_opcode = tlMasterXbar_auto_out_a_bits_opcode; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_a_bits_param = tlMasterXbar_auto_out_a_bits_param; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_a_bits_size = tlMasterXbar_auto_out_a_bits_size; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_a_bits_source = tlMasterXbar_auto_out_a_bits_source; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_a_bits_address = tlMasterXbar_auto_out_a_bits_address; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_a_bits_mask = tlMasterXbar_auto_out_a_bits_mask; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_a_bits_data = tlMasterXbar_auto_out_a_bits_data; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_a_bits_corrupt = tlMasterXbar_auto_out_a_bits_corrupt; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_b_ready = tlMasterXbar_auto_out_b_ready; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_c_valid = tlMasterXbar_auto_out_c_valid; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_c_bits_opcode = tlMasterXbar_auto_out_c_bits_opcode; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_c_bits_param = tlMasterXbar_auto_out_c_bits_param; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_c_bits_size = tlMasterXbar_auto_out_c_bits_size; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_c_bits_source = tlMasterXbar_auto_out_c_bits_source; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_c_bits_address = tlMasterXbar_auto_out_c_bits_address; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_c_bits_data = tlMasterXbar_auto_out_c_bits_data; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_c_bits_corrupt = tlMasterXbar_auto_out_c_bits_corrupt; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_d_ready = tlMasterXbar_auto_out_d_ready; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_e_valid = tlMasterXbar_auto_out_e_valid; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_in_e_bits_sink = tlMasterXbar_auto_out_e_bits_sink; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314330.4]
  assign buffer_auto_out_a_ready = auto_tl_master_xing_out_a_ready; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_b_valid = auto_tl_master_xing_out_b_valid; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_b_bits_opcode = auto_tl_master_xing_out_b_bits_opcode; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_b_bits_param = auto_tl_master_xing_out_b_bits_param; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_b_bits_size = auto_tl_master_xing_out_b_bits_size; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_b_bits_source = auto_tl_master_xing_out_b_bits_source; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_b_bits_address = auto_tl_master_xing_out_b_bits_address; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_b_bits_mask = auto_tl_master_xing_out_b_bits_mask; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_b_bits_corrupt = auto_tl_master_xing_out_b_bits_corrupt; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_c_ready = auto_tl_master_xing_out_c_ready; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_d_valid = auto_tl_master_xing_out_d_valid; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_d_bits_opcode = auto_tl_master_xing_out_d_bits_opcode; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_d_bits_param = auto_tl_master_xing_out_d_bits_param; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_d_bits_size = auto_tl_master_xing_out_d_bits_size; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_d_bits_source = auto_tl_master_xing_out_d_bits_source; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_d_bits_sink = auto_tl_master_xing_out_d_bits_sink; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_d_bits_denied = auto_tl_master_xing_out_d_bits_denied; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_d_bits_data = auto_tl_master_xing_out_d_bits_data; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_d_bits_corrupt = auto_tl_master_xing_out_d_bits_corrupt; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign buffer_auto_out_e_ready = auto_tl_master_xing_out_e_ready; // @[LazyModule.scala 167:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314331.4]
  assign intsink_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314243.4]
  assign intsink_auto_in_sync_0 = auto_intsink_in_sync_0; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314343.4]
  assign intsink_1_auto_in_sync_0 = auto_int_in_xing_in_0_sync_0; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314334.4]
  assign intsink_1_auto_in_sync_1 = auto_int_in_xing_in_0_sync_1; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314334.4]
  assign intsink_2_auto_in_sync_0 = auto_int_in_xing_in_1_sync_0; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314336.4]
  assign intsink_3_auto_in_sync_0 = auto_int_in_xing_in_2_sync_0; // @[LazyModule.scala 167:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314338.4]
  assign fpuOpt_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314346.4]
  assign fpuOpt_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314347.4]
  assign fpuOpt_io_inst = core_io_fpu_inst; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign fpuOpt_io_fromint_data = core_io_fpu_fromint_data; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign fpuOpt_io_fcsr_rm = core_io_fpu_fcsr_rm; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign fpuOpt_io_dmem_resp_val = core_io_fpu_dmem_resp_val; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign fpuOpt_io_dmem_resp_type = core_io_fpu_dmem_resp_type; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign fpuOpt_io_dmem_resp_tag = core_io_fpu_dmem_resp_tag; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign fpuOpt_io_dmem_resp_data = core_io_fpu_dmem_resp_data; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign fpuOpt_io_valid = core_io_fpu_valid; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign fpuOpt_io_killx = core_io_fpu_killx; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign fpuOpt_io_killm = core_io_fpu_killm; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign fpuOpt_io_cp_req_valid = 1'h0; // @[LazyRoCC.scala 109:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314379.4]
  assign fpuOpt_io_cp_req_bits_ren2 = 1'h0;
  assign fpuOpt_io_cp_req_bits_ren3 = 1'h0;
  assign fpuOpt_io_cp_req_bits_swap23 = 1'h0;
  assign fpuOpt_io_cp_req_bits_singleIn = 1'h0;
  assign fpuOpt_io_cp_req_bits_singleOut = 1'h0;
  assign fpuOpt_io_cp_req_bits_fromint = 1'h0;
  assign fpuOpt_io_cp_req_bits_toint = 1'h0;
  assign fpuOpt_io_cp_req_bits_fastpipe = 1'h0;
  assign fpuOpt_io_cp_req_bits_fma = 1'h0;
  assign fpuOpt_io_cp_req_bits_div = 1'h0;
  assign fpuOpt_io_cp_req_bits_sqrt = 1'h0;
  assign fpuOpt_io_cp_req_bits_wflags = 1'h0;
  assign fpuOpt_io_cp_req_bits_rm = 3'h0;
  assign fpuOpt_io_cp_req_bits_fmaCmd = 2'h0;
  assign fpuOpt_io_cp_req_bits_typ = 2'h0;
  assign fpuOpt_io_cp_req_bits_in1 = 65'h0;
  assign fpuOpt_io_cp_req_bits_in2 = 65'h0;
  assign fpuOpt_io_cp_req_bits_in3 = 65'h0;
  assign dcacheArb_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314350.4]
  assign dcacheArb_io_requestor_0_req_valid = ptw_io_mem_req_valid; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign dcacheArb_io_requestor_0_req_bits_addr = ptw_io_mem_req_bits_addr; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign dcacheArb_io_requestor_0_req_bits_tag = 8'h0; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign dcacheArb_io_requestor_0_req_bits_cmd = 5'h0; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign dcacheArb_io_requestor_0_req_bits_typ = 3'h3; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign dcacheArb_io_requestor_0_req_bits_phys = 1'h1; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign dcacheArb_io_requestor_0_s1_kill = ptw_io_mem_s1_kill; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign dcacheArb_io_requestor_0_s1_data_data = 64'h0; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign dcacheArb_io_requestor_0_s1_data_mask = 8'h0; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign dcacheArb_io_requestor_0_s2_kill = 1'h0; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign dcacheArb_io_requestor_0_keep_clock_enabled = 1'h0; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign dcacheArb_io_requestor_1_req_valid = SimpleHellaCacheIF_io_cache_req_valid; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign dcacheArb_io_requestor_1_req_bits_addr = SimpleHellaCacheIF_io_cache_req_bits_addr; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign dcacheArb_io_requestor_1_req_bits_tag = SimpleHellaCacheIF_io_cache_req_bits_tag; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign dcacheArb_io_requestor_1_req_bits_cmd = SimpleHellaCacheIF_io_cache_req_bits_cmd; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign dcacheArb_io_requestor_1_req_bits_typ = SimpleHellaCacheIF_io_cache_req_bits_typ; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign dcacheArb_io_requestor_1_req_bits_phys = SimpleHellaCacheIF_io_cache_req_bits_phys; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign dcacheArb_io_requestor_1_s1_kill = SimpleHellaCacheIF_io_cache_s1_kill; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign dcacheArb_io_requestor_1_s1_data_data = SimpleHellaCacheIF_io_cache_s1_data_data; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign dcacheArb_io_requestor_1_s1_data_mask = 8'h0; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign dcacheArb_io_requestor_1_s2_kill = 1'h0; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign dcacheArb_io_requestor_1_keep_clock_enabled = 1'h0; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign dcacheArb_io_requestor_2_req_valid = core_io_dmem_req_valid; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign dcacheArb_io_requestor_2_req_bits_addr = core_io_dmem_req_bits_addr; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign dcacheArb_io_requestor_2_req_bits_tag = core_io_dmem_req_bits_tag; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign dcacheArb_io_requestor_2_req_bits_cmd = core_io_dmem_req_bits_cmd; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign dcacheArb_io_requestor_2_req_bits_typ = core_io_dmem_req_bits_typ; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign dcacheArb_io_requestor_2_req_bits_phys = 1'h0; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign dcacheArb_io_requestor_2_s1_kill = core_io_dmem_s1_kill; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign dcacheArb_io_requestor_2_s1_data_data = core_io_dmem_s1_data_data; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign dcacheArb_io_requestor_2_s1_data_mask = 8'h0; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign dcacheArb_io_requestor_2_s2_kill = 1'h0; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign dcacheArb_io_requestor_2_keep_clock_enabled = core_io_dmem_keep_clock_enabled; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign dcacheArb_io_mem_req_ready = dcache_io_cpu_req_ready; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_s2_nack = dcache_io_cpu_s2_nack; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_resp_valid = dcache_io_cpu_resp_valid; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_resp_bits_addr = dcache_io_cpu_resp_bits_addr; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_resp_bits_tag = dcache_io_cpu_resp_bits_tag; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_resp_bits_cmd = dcache_io_cpu_resp_bits_cmd; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_resp_bits_typ = dcache_io_cpu_resp_bits_typ; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_resp_bits_data = dcache_io_cpu_resp_bits_data; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_resp_bits_replay = dcache_io_cpu_resp_bits_replay; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_resp_bits_has_data = dcache_io_cpu_resp_bits_has_data; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_resp_bits_data_word_bypass = dcache_io_cpu_resp_bits_data_word_bypass; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_resp_bits_store_data = dcache_io_cpu_resp_bits_store_data; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_replay_next = dcache_io_cpu_replay_next; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_s2_xcpt_ma_ld = dcache_io_cpu_s2_xcpt_ma_ld; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_s2_xcpt_ma_st = dcache_io_cpu_s2_xcpt_ma_st; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_s2_xcpt_pf_ld = dcache_io_cpu_s2_xcpt_pf_ld; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_s2_xcpt_pf_st = dcache_io_cpu_s2_xcpt_pf_st; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_s2_xcpt_ae_ld = dcache_io_cpu_s2_xcpt_ae_ld; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_s2_xcpt_ae_st = dcache_io_cpu_s2_xcpt_ae_st; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_ordered = dcache_io_cpu_ordered; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_perf_grant = dcache_io_cpu_perf_grant; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign dcacheArb_io_mem_clock_enabled = dcache_io_cpu_clock_enabled; // @[HellaCache.scala 228:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314352.4]
  assign ptw_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314355.4]
  assign ptw_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314356.4]
  assign ptw_io_requestor_0_req_valid = dcache_io_ptw_req_valid; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign ptw_io_requestor_0_req_bits_valid = dcache_io_ptw_req_bits_valid; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign ptw_io_requestor_0_req_bits_bits_addr = dcache_io_ptw_req_bits_bits_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314411.4]
  assign ptw_io_requestor_1_req_valid = frontend_io_ptw_req_valid; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign ptw_io_requestor_1_req_bits_valid = frontend_io_ptw_req_bits_valid; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign ptw_io_requestor_1_req_bits_bits_addr = frontend_io_ptw_req_bits_bits_addr; // @[RocketTile.scala 164:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314412.4]
  assign ptw_io_mem_req_ready = dcacheArb_io_requestor_0_req_ready; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign ptw_io_mem_s2_nack = dcacheArb_io_requestor_0_s2_nack; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign ptw_io_mem_resp_valid = dcacheArb_io_requestor_0_resp_valid; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign ptw_io_mem_resp_bits_data_word_bypass = dcacheArb_io_requestor_0_resp_bits_data_word_bypass; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign ptw_io_mem_s2_xcpt_ae_ld = dcacheArb_io_requestor_0_s2_xcpt_ae_ld; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314408.4]
  assign ptw_io_dpath_ptbr_mode = core_io_ptw_ptbr_mode; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_ptbr_ppn = core_io_ptw_ptbr_ppn; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_sfence_valid = core_io_ptw_sfence_valid; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_sfence_bits_rs1 = core_io_ptw_sfence_bits_rs1; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_status_dprv = core_io_ptw_status_dprv; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_status_prv = core_io_ptw_status_prv; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_status_mxr = core_io_ptw_status_mxr; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_status_sum = core_io_ptw_status_sum; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_0_cfg_l = core_io_ptw_pmp_0_cfg_l; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_0_cfg_a = core_io_ptw_pmp_0_cfg_a; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_0_cfg_x = core_io_ptw_pmp_0_cfg_x; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_0_cfg_w = core_io_ptw_pmp_0_cfg_w; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_0_cfg_r = core_io_ptw_pmp_0_cfg_r; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_0_addr = core_io_ptw_pmp_0_addr; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_0_mask = core_io_ptw_pmp_0_mask; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_1_cfg_l = core_io_ptw_pmp_1_cfg_l; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_1_cfg_a = core_io_ptw_pmp_1_cfg_a; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_1_cfg_x = core_io_ptw_pmp_1_cfg_x; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_1_cfg_w = core_io_ptw_pmp_1_cfg_w; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_1_cfg_r = core_io_ptw_pmp_1_cfg_r; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_1_addr = core_io_ptw_pmp_1_addr; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_1_mask = core_io_ptw_pmp_1_mask; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_2_cfg_l = core_io_ptw_pmp_2_cfg_l; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_2_cfg_a = core_io_ptw_pmp_2_cfg_a; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_2_cfg_x = core_io_ptw_pmp_2_cfg_x; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_2_cfg_w = core_io_ptw_pmp_2_cfg_w; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_2_cfg_r = core_io_ptw_pmp_2_cfg_r; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_2_addr = core_io_ptw_pmp_2_addr; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_2_mask = core_io_ptw_pmp_2_mask; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_3_cfg_l = core_io_ptw_pmp_3_cfg_l; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_3_cfg_a = core_io_ptw_pmp_3_cfg_a; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_3_cfg_x = core_io_ptw_pmp_3_cfg_x; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_3_cfg_w = core_io_ptw_pmp_3_cfg_w; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_3_cfg_r = core_io_ptw_pmp_3_cfg_r; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_3_addr = core_io_ptw_pmp_3_addr; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_3_mask = core_io_ptw_pmp_3_mask; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_4_cfg_l = core_io_ptw_pmp_4_cfg_l; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_4_cfg_a = core_io_ptw_pmp_4_cfg_a; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_4_cfg_x = core_io_ptw_pmp_4_cfg_x; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_4_cfg_w = core_io_ptw_pmp_4_cfg_w; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_4_cfg_r = core_io_ptw_pmp_4_cfg_r; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_4_addr = core_io_ptw_pmp_4_addr; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_4_mask = core_io_ptw_pmp_4_mask; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_5_cfg_l = core_io_ptw_pmp_5_cfg_l; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_5_cfg_a = core_io_ptw_pmp_5_cfg_a; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_5_cfg_x = core_io_ptw_pmp_5_cfg_x; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_5_cfg_w = core_io_ptw_pmp_5_cfg_w; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_5_cfg_r = core_io_ptw_pmp_5_cfg_r; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_5_addr = core_io_ptw_pmp_5_addr; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_5_mask = core_io_ptw_pmp_5_mask; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_6_cfg_l = core_io_ptw_pmp_6_cfg_l; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_6_cfg_a = core_io_ptw_pmp_6_cfg_a; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_6_cfg_x = core_io_ptw_pmp_6_cfg_x; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_6_cfg_w = core_io_ptw_pmp_6_cfg_w; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_6_cfg_r = core_io_ptw_pmp_6_cfg_r; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_6_addr = core_io_ptw_pmp_6_addr; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_6_mask = core_io_ptw_pmp_6_mask; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_7_cfg_l = core_io_ptw_pmp_7_cfg_l; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_7_cfg_a = core_io_ptw_pmp_7_cfg_a; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_7_cfg_x = core_io_ptw_pmp_7_cfg_x; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_7_cfg_w = core_io_ptw_pmp_7_cfg_w; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_7_cfg_r = core_io_ptw_pmp_7_cfg_r; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_7_addr = core_io_ptw_pmp_7_addr; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_pmp_7_mask = core_io_ptw_pmp_7_mask; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign ptw_io_dpath_customCSRs_csrs_0_value = 64'h0; // @[RocketTile.scala 136:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314397.4]
  assign respArb_io_in_0_valid = Queue_io_deq_valid; // @[LazyRoCC.scala 94:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314378.4]
  assign respArb_io_in_0_bits_rd = Queue_io_deq_bits_rd; // @[LazyRoCC.scala 94:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314378.4]
  assign respArb_io_in_0_bits_data = Queue_io_deq_bits_data; // @[LazyRoCC.scala 94:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314378.4]
  assign respArb_io_out_ready = core_io_rocc_resp_ready; // @[RocketTile.scala 141:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314400.4]
  assign cmdRouter_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314363.4]
  assign cmdRouter_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314364.4]
  assign cmdRouter_io_in_valid = core_io_rocc_cmd_valid; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign cmdRouter_io_in_bits_inst_funct = core_io_rocc_cmd_bits_inst_funct; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign cmdRouter_io_in_bits_inst_rs2 = core_io_rocc_cmd_bits_inst_rs2; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign cmdRouter_io_in_bits_inst_rs1 = core_io_rocc_cmd_bits_inst_rs1; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign cmdRouter_io_in_bits_inst_xd = core_io_rocc_cmd_bits_inst_xd; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign cmdRouter_io_in_bits_inst_xs1 = core_io_rocc_cmd_bits_inst_xs1; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign cmdRouter_io_in_bits_inst_xs2 = core_io_rocc_cmd_bits_inst_xs2; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign cmdRouter_io_in_bits_inst_rd = core_io_rocc_cmd_bits_inst_rd; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign cmdRouter_io_in_bits_inst_opcode = core_io_rocc_cmd_bits_inst_opcode; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign cmdRouter_io_in_bits_rs1 = core_io_rocc_cmd_bits_rs1; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign cmdRouter_io_in_bits_rs2 = core_io_rocc_cmd_bits_rs2; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign cmdRouter_io_in_bits_status_prv = core_io_rocc_cmd_bits_status_prv; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign cmdRouter_io_out_0_ready = manycore_rocc_io_cmd_ready; // @[LazyRoCC.scala 90:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314365.4]
  assign SimpleHellaCacheIF_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314368.4]
  assign SimpleHellaCacheIF_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314369.4]
  assign SimpleHellaCacheIF_io_requestor_req_valid = manycore_rocc_io_mem_req_valid; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign SimpleHellaCacheIF_io_requestor_req_bits_addr = manycore_rocc_io_mem_req_bits_addr; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign SimpleHellaCacheIF_io_requestor_req_bits_tag = manycore_rocc_io_mem_req_bits_tag; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign SimpleHellaCacheIF_io_requestor_req_bits_cmd = manycore_rocc_io_mem_req_bits_cmd; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign SimpleHellaCacheIF_io_requestor_req_bits_typ = 3'h0; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign SimpleHellaCacheIF_io_requestor_req_bits_phys = manycore_rocc_io_mem_req_bits_phys; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign SimpleHellaCacheIF_io_requestor_req_bits_data = manycore_rocc_io_mem_req_bits_data; // @[LazyRoCC.scala 92:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314370.4]
  assign SimpleHellaCacheIF_io_cache_req_ready = dcacheArb_io_requestor_1_req_ready; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_s2_nack = dcacheArb_io_requestor_1_s2_nack; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_resp_valid = dcacheArb_io_requestor_1_resp_valid; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_resp_bits_addr = dcacheArb_io_requestor_1_resp_bits_addr; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_resp_bits_tag = dcacheArb_io_requestor_1_resp_bits_tag; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_resp_bits_cmd = dcacheArb_io_requestor_1_resp_bits_cmd; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_resp_bits_data = dcacheArb_io_requestor_1_resp_bits_data; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_resp_bits_replay = dcacheArb_io_requestor_1_resp_bits_replay; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_resp_bits_has_data = dcacheArb_io_requestor_1_resp_bits_has_data; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_resp_bits_data_word_bypass = dcacheArb_io_requestor_1_resp_bits_data_word_bypass; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_resp_bits_store_data = dcacheArb_io_requestor_1_resp_bits_store_data; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_s2_xcpt_ma_ld = dcacheArb_io_requestor_1_s2_xcpt_ma_ld; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_s2_xcpt_ma_st = dcacheArb_io_requestor_1_s2_xcpt_ma_st; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_s2_xcpt_pf_ld = dcacheArb_io_requestor_1_s2_xcpt_pf_ld; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_s2_xcpt_pf_st = dcacheArb_io_requestor_1_s2_xcpt_pf_st; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_s2_xcpt_ae_ld = dcacheArb_io_requestor_1_s2_xcpt_ae_ld; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign SimpleHellaCacheIF_io_cache_s2_xcpt_ae_st = dcacheArb_io_requestor_1_s2_xcpt_ae_st; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314409.4]
  assign Queue_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314372.4]
  assign Queue_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314373.4]
  assign Queue_io_enq_valid = manycore_rocc_io_resp_valid; // @[Decoupled.scala 294:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314374.4]
  assign Queue_io_enq_bits_rd = manycore_rocc_io_resp_bits_rd; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314376.4]
  assign Queue_io_enq_bits_data = manycore_rocc_io_resp_bits_data; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314375.4]
  assign Queue_io_deq_ready = respArb_io_in_0_ready; // @[LazyRoCC.scala 94:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314378.4]
  assign core_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314383.4]
  assign core_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314384.4]
  assign core_io_hartid = constants_hartid; // @[RocketTile.scala 127:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314391.4]
  assign core_io_interrupts_debug = intXbar_auto_int_out_0; // @[Interrupts.scala 75:93:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314386.4]
  assign core_io_interrupts_mtip = intXbar_auto_int_out_2; // @[Interrupts.scala 75:93:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314388.4]
  assign core_io_interrupts_msip = intXbar_auto_int_out_1; // @[Interrupts.scala 75:93:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314387.4]
  assign core_io_interrupts_meip = intXbar_auto_int_out_3; // @[Interrupts.scala 75:93:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314389.4]
  assign core_io_interrupts_seip = intXbar_auto_int_out_4; // @[Interrupts.scala 75:93:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314390.4]
  assign core_io_imem_resp_valid = frontend_io_cpu_resp_valid; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign core_io_imem_resp_bits_btb_taken = frontend_io_cpu_resp_bits_btb_taken; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign core_io_imem_resp_bits_btb_bridx = frontend_io_cpu_resp_bits_btb_bridx; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign core_io_imem_resp_bits_btb_entry = frontend_io_cpu_resp_bits_btb_entry; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign core_io_imem_resp_bits_btb_bht_history = frontend_io_cpu_resp_bits_btb_bht_history; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign core_io_imem_resp_bits_pc = frontend_io_cpu_resp_bits_pc; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign core_io_imem_resp_bits_data = frontend_io_cpu_resp_bits_data; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign core_io_imem_resp_bits_xcpt_pf_inst = frontend_io_cpu_resp_bits_xcpt_pf_inst; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign core_io_imem_resp_bits_xcpt_ae_inst = frontend_io_cpu_resp_bits_xcpt_ae_inst; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign core_io_imem_resp_bits_replay = frontend_io_cpu_resp_bits_replay; // @[RocketTile.scala 130:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314392.4]
  assign core_io_dmem_req_ready = dcacheArb_io_requestor_2_req_ready; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_s2_nack = dcacheArb_io_requestor_2_s2_nack; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_resp_valid = dcacheArb_io_requestor_2_resp_valid; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_resp_bits_tag = dcacheArb_io_requestor_2_resp_bits_tag; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_resp_bits_typ = dcacheArb_io_requestor_2_resp_bits_typ; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_resp_bits_data = dcacheArb_io_requestor_2_resp_bits_data; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_resp_bits_replay = dcacheArb_io_requestor_2_resp_bits_replay; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_resp_bits_has_data = dcacheArb_io_requestor_2_resp_bits_has_data; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_resp_bits_data_word_bypass = dcacheArb_io_requestor_2_resp_bits_data_word_bypass; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_replay_next = dcacheArb_io_requestor_2_replay_next; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_s2_xcpt_ma_ld = dcacheArb_io_requestor_2_s2_xcpt_ma_ld; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_s2_xcpt_ma_st = dcacheArb_io_requestor_2_s2_xcpt_ma_st; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_s2_xcpt_pf_ld = dcacheArb_io_requestor_2_s2_xcpt_pf_ld; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_s2_xcpt_pf_st = dcacheArb_io_requestor_2_s2_xcpt_pf_st; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_s2_xcpt_ae_ld = dcacheArb_io_requestor_2_s2_xcpt_ae_ld; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_s2_xcpt_ae_st = dcacheArb_io_requestor_2_s2_xcpt_ae_st; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_ordered = dcacheArb_io_requestor_2_ordered; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_perf_grant = dcacheArb_io_requestor_2_perf_grant; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_dmem_clock_enabled = dcacheArb_io_requestor_2_clock_enabled; // @[RocketTile.scala 163:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314410.4]
  assign core_io_fpu_fcsr_flags_valid = fpuOpt_io_fcsr_flags_valid; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_fcsr_flags_bits = fpuOpt_io_fcsr_flags_bits; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_store_data = fpuOpt_io_store_data; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_toint_data = fpuOpt_io_toint_data; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_fcsr_rdy = fpuOpt_io_fcsr_rdy; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_nack_mem = fpuOpt_io_nack_mem; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_illegal_rm = fpuOpt_io_illegal_rm; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_dec_wen = fpuOpt_io_dec_wen; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_dec_ren1 = fpuOpt_io_dec_ren1; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_dec_ren2 = fpuOpt_io_dec_ren2; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_dec_ren3 = fpuOpt_io_dec_ren3; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_sboard_set = fpuOpt_io_sboard_set; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_sboard_clr = fpuOpt_io_sboard_clr; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_fpu_sboard_clra = fpuOpt_io_sboard_clra; // @[RocketTile.scala 135:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314396.4]
  assign core_io_rocc_cmd_ready = cmdRouter_io_in_ready; // @[RocketTile.scala 139:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314398.4]
  assign core_io_rocc_resp_valid = respArb_io_out_valid; // @[RocketTile.scala 141:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314400.4]
  assign core_io_rocc_resp_bits_rd = respArb_io_out_bits_rd; // @[RocketTile.scala 141:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314400.4]
  assign core_io_rocc_resp_bits_data = respArb_io_out_bits_data; // @[RocketTile.scala 141:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314400.4]
  assign core_io_rocc_busy = cmdRouter_io_busy | manycore_rocc_io_busy; // @[RocketTile.scala 142:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314402.4]
  assign core_io_rocc_interrupt = manycore_rocc_io_interrupt; // @[RocketTile.scala 143:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314403.4]
endmodule