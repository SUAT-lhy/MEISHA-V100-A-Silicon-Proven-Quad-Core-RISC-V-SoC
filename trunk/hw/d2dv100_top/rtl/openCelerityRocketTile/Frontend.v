module Frontend( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290363.2]
  input         gated_clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290364.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290365.4]
  input         auto_icache_master_out_a_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290366.4]
  output        auto_icache_master_out_a_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290366.4]
  output [37:0] auto_icache_master_out_a_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290366.4]
  input         auto_icache_master_out_d_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290366.4]
  input  [2:0]  auto_icache_master_out_d_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290366.4]
  input  [2:0]  auto_icache_master_out_d_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290366.4]
  input  [63:0] auto_icache_master_out_d_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290366.4]
  input         auto_icache_master_out_d_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290366.4]
  input  [37:0] io_reset_vector, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_might_request, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_req_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [39:0] io_cpu_req_bits_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_req_bits_speculative, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_sfence_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_sfence_bits_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_sfence_bits_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [38:0] io_cpu_sfence_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_resp_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output        io_cpu_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output        io_cpu_resp_bits_btb_taken, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output        io_cpu_resp_bits_btb_bridx, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output [4:0]  io_cpu_resp_bits_btb_entry, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output [7:0]  io_cpu_resp_bits_btb_bht_history, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output [39:0] io_cpu_resp_bits_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output [31:0] io_cpu_resp_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output        io_cpu_resp_bits_xcpt_pf_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output        io_cpu_resp_bits_xcpt_ae_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output        io_cpu_resp_bits_replay, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_btb_update_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [4:0]  io_cpu_btb_update_bits_prediction_entry, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [38:0] io_cpu_btb_update_bits_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_btb_update_bits_isValid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [38:0] io_cpu_btb_update_bits_br_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [1:0]  io_cpu_btb_update_bits_cfiType, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_bht_update_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [7:0]  io_cpu_bht_update_bits_prediction_history, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [38:0] io_cpu_bht_update_bits_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_bht_update_bits_branch, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_bht_update_bits_taken, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_bht_update_bits_mispredict, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_cpu_flush_icache, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output [39:0] io_cpu_npc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_req_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output        io_ptw_req_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output        io_ptw_req_bits_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  output [26:0] io_ptw_req_bits_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_resp_bits_ae, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [53:0] io_ptw_resp_bits_pte_ppn, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_resp_bits_pte_d, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_resp_bits_pte_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_resp_bits_pte_g, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_resp_bits_pte_u, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_resp_bits_pte_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_resp_bits_pte_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_resp_bits_pte_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_resp_bits_pte_v, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [1:0]  io_ptw_resp_bits_level, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_resp_bits_fragmented_superpage, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_resp_bits_homogeneous, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [3:0]  io_ptw_ptbr_mode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [1:0]  io_ptw_status_prv, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_0_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [1:0]  io_ptw_pmp_0_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_0_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_0_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_0_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [35:0] io_ptw_pmp_0_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [37:0] io_ptw_pmp_0_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_1_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [1:0]  io_ptw_pmp_1_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_1_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_1_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_1_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [35:0] io_ptw_pmp_1_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [37:0] io_ptw_pmp_1_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_2_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [1:0]  io_ptw_pmp_2_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_2_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_2_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_2_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [35:0] io_ptw_pmp_2_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [37:0] io_ptw_pmp_2_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_3_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [1:0]  io_ptw_pmp_3_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_3_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_3_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_3_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [35:0] io_ptw_pmp_3_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [37:0] io_ptw_pmp_3_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_4_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [1:0]  io_ptw_pmp_4_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_4_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_4_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_4_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [35:0] io_ptw_pmp_4_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [37:0] io_ptw_pmp_4_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_5_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [1:0]  io_ptw_pmp_5_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_5_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_5_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_5_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [35:0] io_ptw_pmp_5_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [37:0] io_ptw_pmp_5_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_6_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [1:0]  io_ptw_pmp_6_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_6_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_6_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_6_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [35:0] io_ptw_pmp_6_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [37:0] io_ptw_pmp_6_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_7_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [1:0]  io_ptw_pmp_7_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_7_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_7_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input         io_ptw_pmp_7_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [35:0] io_ptw_pmp_7_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
  input  [37:0] io_ptw_pmp_7_mask // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290367.4]
);
  wire  icache_clock; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  icache_reset; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  icache_auto_master_out_a_ready; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  icache_auto_master_out_a_valid; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire [37:0] icache_auto_master_out_a_bits_address; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  icache_auto_master_out_d_valid; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire [2:0] icache_auto_master_out_d_bits_opcode; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire [2:0] icache_auto_master_out_d_bits_size; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire [63:0] icache_auto_master_out_d_bits_data; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  icache_auto_master_out_d_bits_corrupt; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  icache_io_req_ready; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  icache_io_req_valid; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire [38:0] icache_io_req_bits_addr; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire [37:0] icache_io_s1_paddr; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  icache_io_s1_kill; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  icache_io_s2_kill; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  icache_io_resp_valid; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire [31:0] icache_io_resp_bits_data; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  icache_io_resp_bits_ae; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  icache_io_invalidate; // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
  wire  fq_clock; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_reset; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_enq_ready; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_enq_valid; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_enq_bits_btb_taken; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_enq_bits_btb_bridx; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire [4:0] fq_io_enq_bits_btb_entry; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire [7:0] fq_io_enq_bits_btb_bht_history; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire [39:0] fq_io_enq_bits_pc; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire [31:0] fq_io_enq_bits_data; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire [1:0] fq_io_enq_bits_mask; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_enq_bits_xcpt_pf_inst; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_enq_bits_xcpt_ae_inst; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_enq_bits_replay; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_deq_ready; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_deq_valid; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_deq_bits_btb_taken; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_deq_bits_btb_bridx; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire [4:0] fq_io_deq_bits_btb_entry; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire [7:0] fq_io_deq_bits_btb_bht_history; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire [39:0] fq_io_deq_bits_pc; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire [31:0] fq_io_deq_bits_data; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_deq_bits_xcpt_pf_inst; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_deq_bits_xcpt_ae_inst; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  fq_io_deq_bits_replay; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire [4:0] fq_io_mask; // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
  wire  tlb_clock; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_reset; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_req_ready; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_req_valid; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [39:0] tlb_io_req_bits_vaddr; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_resp_miss; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [37:0] tlb_io_resp_paddr; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_resp_pf_inst; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_resp_ae_inst; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_resp_cacheable; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_sfence_valid; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_sfence_bits_rs1; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_sfence_bits_rs2; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [38:0] tlb_io_sfence_bits_addr; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_req_ready; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_req_valid; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_req_bits_valid; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [26:0] tlb_io_ptw_req_bits_bits_addr; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_resp_valid; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_resp_bits_ae; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [53:0] tlb_io_ptw_resp_bits_pte_ppn; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_resp_bits_pte_d; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_resp_bits_pte_a; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_resp_bits_pte_g; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_resp_bits_pte_u; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_resp_bits_pte_x; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_resp_bits_pte_w; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_resp_bits_pte_r; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_resp_bits_pte_v; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [1:0] tlb_io_ptw_resp_bits_level; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_resp_bits_fragmented_superpage; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_resp_bits_homogeneous; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [3:0] tlb_io_ptw_ptbr_mode; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [1:0] tlb_io_ptw_status_prv; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_0_cfg_l; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [1:0] tlb_io_ptw_pmp_0_cfg_a; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_0_cfg_x; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_0_cfg_w; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_0_cfg_r; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [35:0] tlb_io_ptw_pmp_0_addr; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [37:0] tlb_io_ptw_pmp_0_mask; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_1_cfg_l; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [1:0] tlb_io_ptw_pmp_1_cfg_a; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_1_cfg_x; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_1_cfg_w; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_1_cfg_r; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [35:0] tlb_io_ptw_pmp_1_addr; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [37:0] tlb_io_ptw_pmp_1_mask; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_2_cfg_l; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [1:0] tlb_io_ptw_pmp_2_cfg_a; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_2_cfg_x; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_2_cfg_w; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_2_cfg_r; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [35:0] tlb_io_ptw_pmp_2_addr; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [37:0] tlb_io_ptw_pmp_2_mask; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_3_cfg_l; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [1:0] tlb_io_ptw_pmp_3_cfg_a; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_3_cfg_x; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_3_cfg_w; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_3_cfg_r; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [35:0] tlb_io_ptw_pmp_3_addr; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [37:0] tlb_io_ptw_pmp_3_mask; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_4_cfg_l; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [1:0] tlb_io_ptw_pmp_4_cfg_a; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_4_cfg_x; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_4_cfg_w; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_4_cfg_r; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [35:0] tlb_io_ptw_pmp_4_addr; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [37:0] tlb_io_ptw_pmp_4_mask; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_5_cfg_l; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [1:0] tlb_io_ptw_pmp_5_cfg_a; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_5_cfg_x; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_5_cfg_w; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_5_cfg_r; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [35:0] tlb_io_ptw_pmp_5_addr; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [37:0] tlb_io_ptw_pmp_5_mask; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_6_cfg_l; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [1:0] tlb_io_ptw_pmp_6_cfg_a; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_6_cfg_x; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_6_cfg_w; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_6_cfg_r; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [35:0] tlb_io_ptw_pmp_6_addr; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [37:0] tlb_io_ptw_pmp_6_mask; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_7_cfg_l; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [1:0] tlb_io_ptw_pmp_7_cfg_a; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_7_cfg_x; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_7_cfg_w; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_ptw_pmp_7_cfg_r; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [35:0] tlb_io_ptw_pmp_7_addr; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire [37:0] tlb_io_ptw_pmp_7_mask; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  tlb_io_kill; // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
  wire  btb_clock; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_reset; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [38:0] btb_io_req_bits_addr; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_resp_valid; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_resp_bits_taken; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_resp_bits_bridx; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [38:0] btb_io_resp_bits_target; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [4:0] btb_io_resp_bits_entry; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [7:0] btb_io_resp_bits_bht_history; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_resp_bits_bht_value; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_btb_update_valid; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [4:0] btb_io_btb_update_bits_prediction_entry; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [38:0] btb_io_btb_update_bits_pc; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_btb_update_bits_isValid; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [38:0] btb_io_btb_update_bits_br_pc; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [1:0] btb_io_btb_update_bits_cfiType; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_bht_update_valid; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [7:0] btb_io_bht_update_bits_prediction_history; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [38:0] btb_io_bht_update_bits_pc; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_bht_update_bits_branch; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_bht_update_bits_taken; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_bht_update_bits_mispredict; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_bht_advance_valid; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_bht_advance_bits_bht_value; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_ras_update_valid; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [1:0] btb_io_ras_update_bits_cfiType; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [38:0] btb_io_ras_update_bits_returnAddr; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_ras_head_valid; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire [38:0] btb_io_ras_head_bits; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  btb_io_flush; // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
  wire  _T_198; // @[Frontend.scala 86:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290389.4]
  wire  _T_199; // @[Frontend.scala 86:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290390.4]
  wire  _T_200; // @[Frontend.scala 86:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290391.4]
  wire  _T_201; // @[Frontend.scala 86:102:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290392.4]
  wire  _T_202; // @[Frontend.scala 86:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290393.4]
  wire  _T_203; // @[Frontend.scala 86:130:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290394.4]
  wire  _T_205; // @[Frontend.scala 86:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290396.4]
  wire  _T_206; // @[Frontend.scala 86:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290397.4]
  wire  _T_207; // @[Frontend.scala 97:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290408.4]
  wire  _T_208; // @[Frontend.scala 97:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290409.4]
  wire  s0_valid; // @[Frontend.scala 97:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290410.4]
  reg  s1_valid; // @[Frontend.scala 98:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290411.4]
  reg [31:0] _RAND_0;
  reg [39:0] s1_pc; // @[Frontend.scala 99:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290413.4]
  reg [63:0] _RAND_1;
  reg  s1_speculative; // @[Frontend.scala 100:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290414.4]
  reg [31:0] _RAND_2;
  reg  s2_valid; // @[Frontend.scala 101:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290415.4]
  reg [31:0] _RAND_3;
  wire [37:0] _T_214; // @[Frontend.scala 331:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290416.4]
  wire [37:0] _T_215; // @[Frontend.scala 331:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290417.4]
  wire [37:0] _T_216; // @[Frontend.scala 331:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290418.4]
  reg [39:0] s2_pc; // @[Frontend.scala 102:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290419.4]
  reg [63:0] _RAND_4;
  reg  s2_btb_resp_valid; // @[Frontend.scala 103:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290420.4]
  reg [31:0] _RAND_5;
  reg  s2_btb_resp_bits_taken; // @[Frontend.scala 104:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290421.4]
  reg [31:0] _RAND_6;
  reg  s2_btb_resp_bits_bridx; // @[Frontend.scala 104:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290421.4]
  reg [31:0] _RAND_7;
  reg [4:0] s2_btb_resp_bits_entry; // @[Frontend.scala 104:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290421.4]
  reg [31:0] _RAND_8;
  reg [7:0] s2_btb_resp_bits_bht_history; // @[Frontend.scala 104:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290421.4]
  reg [31:0] _RAND_9;
  reg  s2_btb_resp_bits_bht_value; // @[Frontend.scala 104:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290421.4]
  reg [31:0] _RAND_10;
  wire  s2_btb_taken; // @[Frontend.scala 105:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290422.4]
  reg  s2_tlb_resp_miss; // @[Frontend.scala 106:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290423.4]
  reg [31:0] _RAND_11;
  reg  s2_tlb_resp_pf_inst; // @[Frontend.scala 106:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290423.4]
  reg [31:0] _RAND_12;
  reg  s2_tlb_resp_ae_inst; // @[Frontend.scala 106:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290423.4]
  reg [31:0] _RAND_13;
  reg  s2_tlb_resp_cacheable; // @[Frontend.scala 106:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290423.4]
  reg [31:0] _RAND_14;
  wire  s2_xcpt; // @[Frontend.scala 107:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290424.4]
  reg  s2_speculative; // @[Frontend.scala 108:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290425.4]
  reg [31:0] _RAND_15;
  reg  s2_partial_insn_valid; // @[Frontend.scala 109:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290426.4]
  reg [31:0] _RAND_16;
  reg [15:0] s2_partial_insn; // @[Frontend.scala 110:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290427.4]
  reg [31:0] _RAND_17;
  reg  wrong_path; // @[Frontend.scala 111:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290428.4]
  reg [31:0] _RAND_18;
  wire [39:0] _T_223; // @[Frontend.scala 113:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290429.4]
  wire [39:0] _T_224; // @[Frontend.scala 113:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290430.4]
  wire [39:0] s1_base_pc; // @[Frontend.scala 113:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290431.4]
  wire [39:0] ntpc; // @[Frontend.scala 114:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290433.4]
  wire  _T_229; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290442.4]
  wire  _T_230; // @[Frontend.scala 119:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290443.4]
  wire  _T_231; // @[Frontend.scala 119:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290444.4]
  wire  _T_232; // @[Frontend.scala 119:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290445.4]
  reg  _T_235; // @[Frontend.scala 119:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290447.4]
  reg [31:0] _RAND_19;
  wire  s2_replay; // @[Frontend.scala 119:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290449.4]
  wire  _T_233; // @[Frontend.scala 119:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290446.4]
  wire [1:0] _T_295; // @[Frontend.scala 199:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290593.4]
  wire  _T_296; // @[Frontend.scala 199:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290594.4]
  wire  _T_297; // @[Frontend.scala 200:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290595.4]
  wire  taken_prevRVI; // @[Frontend.scala 200:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290596.4]
  wire [15:0] taken_bits; // @[Frontend.scala 202:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290600.4]
  wire [31:0] taken_rviBits; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290603.4]
  wire [6:0] _T_302; // @[Frontend.scala 206:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290606.4]
  wire  taken_rviJump; // @[Frontend.scala 206:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290607.4]
  wire  taken_rviJALR; // @[Frontend.scala 207:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290609.4]
  wire  _T_490; // @[Frontend.scala 221:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290808.4]
  wire  taken_rviBranch; // @[Frontend.scala 205:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290605.4]
  wire  _T_491; // @[Frontend.scala 221:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290809.4]
  wire  _T_492; // @[Frontend.scala 221:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290810.4]
  wire  _T_493; // @[Frontend.scala 221:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290811.4]
  wire  _T_298; // @[Frontend.scala 201:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290597.4]
  wire  _T_299; // @[Frontend.scala 201:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290598.4]
  wire  taken_valid; // @[Frontend.scala 201:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290599.4]
  wire [15:0] _T_318; // @[Frontend.scala 212:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290628.4]
  wire  taken_rvcJump; // @[Frontend.scala 212:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290629.4]
  wire [15:0] _T_360; // @[Frontend.scala 216:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290674.4]
  wire  _T_361; // @[Frontend.scala 216:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290675.4]
  wire [4:0] _T_362; // @[Frontend.scala 216:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290676.4]
  wire  _T_363; // @[Frontend.scala 216:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290677.4]
  wire  taken_rvcJALR; // @[Frontend.scala 216:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290678.4]
  wire  _T_494; // @[Frontend.scala 222:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290812.4]
  wire  _T_354; // @[Frontend.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290666.4]
  wire  taken_rvcJR; // @[Frontend.scala 214:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290669.4]
  wire  _T_495; // @[Frontend.scala 222:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290813.4]
  wire  _T_313; // @[Frontend.scala 210:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290621.4]
  wire  _T_315; // @[Frontend.scala 210:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290623.4]
  wire  taken_rvcBranch; // @[Frontend.scala 210:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290624.4]
  wire  _T_496; // @[Frontend.scala 222:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290814.4]
  wire  _T_497; // @[Frontend.scala 222:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290815.4]
  wire  _T_498; // @[Frontend.scala 222:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290816.4]
  wire  taken_taken; // @[Frontend.scala 221:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290817.4]
  wire  taken_idx; // @[Frontend.scala 236:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291162.4]
  wire  _T_798; // @[Frontend.scala 245:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291185.6]
  wire [1:0] _T_562; // @[Frontend.scala 199:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290915.4]
  wire  _T_563; // @[Frontend.scala 199:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290916.4]
  wire  _T_564; // @[Frontend.scala 200:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290917.4]
  wire  taken_prevRVI_1; // @[Frontend.scala 200:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290918.4]
  wire [15:0] taken_bits_1; // @[Frontend.scala 202:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290922.4]
  wire [31:0] taken_rviBits_1; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290925.4]
  wire [6:0] _T_570; // @[Frontend.scala 207:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290930.4]
  wire  taken_rviJALR_1; // @[Frontend.scala 207:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290931.4]
  wire  _T_571; // @[Frontend.scala 208:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290932.4]
  wire  _T_572; // @[Frontend.scala 208:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290933.4]
  wire  _T_573; // @[Frontend.scala 208:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290934.4]
  wire [4:0] _T_574; // @[Frontend.scala 208:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290935.4]
  wire [4:0] _T_575; // @[Frontend.scala 208:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290936.4]
  wire  _T_576; // @[Frontend.scala 208:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290937.4]
  wire  taken_rviReturn_1; // @[Frontend.scala 208:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290938.4]
  wire  _T_766; // @[Frontend.scala 223:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291140.4]
  wire  _T_565; // @[Frontend.scala 201:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290919.4]
  wire  _T_566; // @[Frontend.scala 201:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290920.4]
  wire  taken_valid_1; // @[Frontend.scala 201:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290921.4]
  wire [15:0] _T_620; // @[Frontend.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290987.4]
  wire  _T_621; // @[Frontend.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290988.4]
  wire [4:0] _T_622; // @[Frontend.scala 214:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290989.4]
  wire  _T_623; // @[Frontend.scala 214:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290990.4]
  wire  taken_rvcJR_1; // @[Frontend.scala 214:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290991.4]
  wire [4:0] _T_624; // @[Frontend.scala 215:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290992.4]
  wire [4:0] _T_625; // @[Frontend.scala 215:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290993.4]
  wire  _T_626; // @[Frontend.scala 215:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290994.4]
  wire  taken_rvcReturn_1; // @[Frontend.scala 215:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290995.4]
  wire  _T_767; // @[Frontend.scala 223:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291141.4]
  wire  _T_768; // @[Frontend.scala 223:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291142.4]
  wire  taken_predictReturn_1; // @[Frontend.scala 223:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291143.4]
  wire  _T_807; // @[Frontend.scala 249:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291198.8]
  wire  _T_304; // @[Frontend.scala 208:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290610.4]
  wire  _T_305; // @[Frontend.scala 208:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290611.4]
  wire  _T_306; // @[Frontend.scala 208:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290612.4]
  wire [4:0] _T_307; // @[Frontend.scala 208:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290613.4]
  wire [4:0] _T_308; // @[Frontend.scala 208:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290614.4]
  wire  _T_309; // @[Frontend.scala 208:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290615.4]
  wire  taken_rviReturn; // @[Frontend.scala 208:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290616.4]
  wire  _T_499; // @[Frontend.scala 223:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290818.4]
  wire [4:0] _T_357; // @[Frontend.scala 215:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290670.4]
  wire [4:0] _T_358; // @[Frontend.scala 215:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290671.4]
  wire  _T_359; // @[Frontend.scala 215:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290672.4]
  wire  taken_rvcReturn; // @[Frontend.scala 215:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290673.4]
  wire  _T_500; // @[Frontend.scala 223:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290819.4]
  wire  _T_501; // @[Frontend.scala 223:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290820.4]
  wire  taken_predictReturn; // @[Frontend.scala 223:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290821.4]
  wire  _T_540; // @[Frontend.scala 249:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290876.8]
  wire  _GEN_44; // @[Frontend.scala 245:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290864.6]
  wire  _GEN_77; // @[Frontend.scala 249:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291199.8]
  wire  _GEN_80; // @[Frontend.scala 245:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291186.6]
  wire  useRAS; // @[Frontend.scala 236:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291163.4]
  wire  taken_rviBranch_1; // @[Frontend.scala 205:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290927.4]
  wire  _T_771; // @[Frontend.scala 225:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291147.4]
  wire [15:0] _T_579; // @[Frontend.scala 210:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290942.4]
  wire  _T_580; // @[Frontend.scala 210:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290943.4]
  wire  _T_582; // @[Frontend.scala 210:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290945.4]
  wire  taken_rvcBranch_1; // @[Frontend.scala 210:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290946.4]
  wire  _T_772; // @[Frontend.scala 225:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291148.4]
  wire  _T_773; // @[Frontend.scala 225:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291149.4]
  wire  taken_predictBranch_1; // @[Frontend.scala 225:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291150.4]
  wire  taken_rviJump_1; // @[Frontend.scala 206:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290929.4]
  wire  _T_769; // @[Frontend.scala 224:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291144.4]
  wire  taken_rvcJump_1; // @[Frontend.scala 212:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290951.4]
  wire  _T_770; // @[Frontend.scala 224:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291145.4]
  wire  taken_predictJump_1; // @[Frontend.scala 224:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291146.4]
  wire  _T_808; // @[Frontend.scala 252:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291202.8]
  wire  _T_809; // @[Frontend.scala 252:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291203.8]
  wire [39:0] _T_277; // @[Frontend.scala 192:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290558.4]
  wire [39:0] _T_278; // @[Frontend.scala 192:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290559.4]
  wire [39:0] s2_base_pc; // @[Frontend.scala 192:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290560.4]
  wire [39:0] taken_pc_1; // @[Frontend.scala 253:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291205.10]
  wire [40:0] _T_810; // @[Frontend.scala 256:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291206.10]
  wire [40:0] _T_811; // @[Frontend.scala 256:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291207.10]
  wire [39:0] _T_812; // @[Frontend.scala 256:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291208.10]
  wire [39:0] _T_813; // @[Frontend.scala 256:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291209.10]
  wire [39:0] _T_814; // @[Frontend.scala 256:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291210.10]
  wire  _T_631; // @[Frontend.scala 218:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291002.4]
  wire  _T_633; // @[RocketCore.scala 932:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291004.4]
  wire  _T_634; // @[RocketCore.scala 932:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291005.4]
  wire  _T_689; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291060.4]
  wire [10:0] _T_639; // @[RocketCore.scala 933:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291010.4]
  wire [10:0] _T_688; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291059.4]
  wire [11:0] _T_690; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291061.4]
  wire [7:0] _T_643; // @[RocketCore.scala 934:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291014.4]
  wire [7:0] _T_644; // @[RocketCore.scala 934:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291015.4]
  wire [7:0] _T_686; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291057.4]
  wire  _T_650; // @[RocketCore.scala 936:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291021.4]
  wire  _T_651; // @[RocketCore.scala 936:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291022.4]
  wire  _T_654; // @[RocketCore.scala 937:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291025.4]
  wire  _T_685; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291056.4]
  wire [8:0] _T_687; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291058.4]
  wire [20:0] _T_691; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291062.4]
  wire [5:0] _T_661; // @[RocketCore.scala 938:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291032.4]
  wire [3:0] _T_667; // @[RocketCore.scala 940:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291038.4]
  wire [3:0] _T_670; // @[RocketCore.scala 941:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291041.4]
  wire [9:0] _T_683; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291054.4]
  wire [10:0] _T_684; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291055.4]
  wire [31:0] _T_692; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291063.4]
  wire [31:0] _T_693; // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291064.4]
  wire [7:0] _T_707; // @[RocketCore.scala 934:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291078.4]
  wire [7:0] _T_748; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291119.4]
  wire  _T_747; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291118.4]
  wire [8:0] _T_749; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291120.4]
  wire [20:0] _T_753; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291124.4]
  wire [9:0] _T_745; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291116.4]
  wire [10:0] _T_746; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291117.4]
  wire [31:0] _T_754; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291125.4]
  wire [31:0] _T_755; // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291126.4]
  wire [31:0] taken_rviImm_1; // @[Frontend.scala 218:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291127.4]
  wire  _T_587; // @[Frontend.scala 213:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290953.4]
  wire  _T_588; // @[RVC.scala 45:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290954.4]
  wire [4:0] _T_590; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290956.4]
  wire [1:0] _T_591; // @[RVC.scala 45:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290957.4]
  wire [6:0] _T_597; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290963.4]
  wire  _T_592; // @[RVC.scala 45:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290958.4]
  wire [7:0] _T_598; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290964.4]
  wire [1:0] _T_593; // @[RVC.scala 45:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290959.4]
  wire [1:0] _T_594; // @[RVC.scala 45:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290960.4]
  wire [3:0] _T_595; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290961.4]
  wire [4:0] _T_596; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290962.4]
  wire [12:0] _T_599; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290965.4]
  wire [12:0] _T_600; // @[Frontend.scala 213:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290966.4]
  wire [9:0] _T_603; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290969.4]
  wire  _T_604; // @[RVC.scala 44:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290970.4]
  wire [10:0] _T_615; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290981.4]
  wire [1:0] _T_605; // @[RVC.scala 44:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290971.4]
  wire [12:0] _T_616; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290982.4]
  wire  _T_606; // @[RVC.scala 44:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290972.4]
  wire  _T_607; // @[RVC.scala 44:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290973.4]
  wire [1:0] _T_614; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290980.4]
  wire [14:0] _T_617; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290983.4]
  wire  _T_609; // @[RVC.scala 44:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290975.4]
  wire [1:0] _T_612; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290978.4]
  wire [2:0] _T_610; // @[RVC.scala 44:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290976.4]
  wire [3:0] _T_611; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290977.4]
  wire [5:0] _T_613; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290979.4]
  wire [20:0] _T_618; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290984.4]
  wire [20:0] _T_619; // @[Frontend.scala 213:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290985.4]
  wire [20:0] taken_rvcImm_1; // @[Frontend.scala 213:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290986.4]
  wire [31:0] _T_815; // @[Frontend.scala 256:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291211.10]
  wire [39:0] _GEN_126; // @[Frontend.scala 256:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291212.10]
  wire [39:0] _T_817; // @[Frontend.scala 256:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291213.10]
  wire [39:0] taken_npc_1; // @[Frontend.scala 256:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291214.10]
  wire [39:0] _T_818; // @[Frontend.scala 257:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291215.10]
  wire  _T_504; // @[Frontend.scala 225:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290825.4]
  wire  _T_505; // @[Frontend.scala 225:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290826.4]
  wire  _T_506; // @[Frontend.scala 225:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290827.4]
  wire  taken_predictBranch; // @[Frontend.scala 225:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290828.4]
  wire  _T_502; // @[Frontend.scala 224:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290822.4]
  wire  _T_503; // @[Frontend.scala 224:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290823.4]
  wire  taken_predictJump; // @[Frontend.scala 224:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290824.4]
  wire  _T_541; // @[Frontend.scala 252:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290880.8]
  wire  _T_542; // @[Frontend.scala 252:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290881.8]
  wire [39:0] _T_543; // @[Frontend.scala 255:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290884.10]
  wire  _T_364; // @[Frontend.scala 218:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290680.4]
  wire  _T_366; // @[RocketCore.scala 932:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290682.4]
  wire  _T_367; // @[RocketCore.scala 932:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290683.4]
  wire  _T_422; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290738.4]
  wire [10:0] _T_372; // @[RocketCore.scala 933:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290688.4]
  wire [10:0] _T_421; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290737.4]
  wire [11:0] _T_423; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290739.4]
  wire [7:0] _T_376; // @[RocketCore.scala 934:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290692.4]
  wire [7:0] _T_377; // @[RocketCore.scala 934:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290693.4]
  wire [7:0] _T_419; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290735.4]
  wire  _T_383; // @[RocketCore.scala 936:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290699.4]
  wire  _T_384; // @[RocketCore.scala 936:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290700.4]
  wire  _T_387; // @[RocketCore.scala 937:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290703.4]
  wire  _T_418; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290734.4]
  wire [8:0] _T_420; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290736.4]
  wire [20:0] _T_424; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290740.4]
  wire [5:0] _T_394; // @[RocketCore.scala 938:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290710.4]
  wire [3:0] _T_400; // @[RocketCore.scala 940:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290716.4]
  wire [3:0] _T_403; // @[RocketCore.scala 941:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290719.4]
  wire [9:0] _T_416; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290732.4]
  wire [10:0] _T_417; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290733.4]
  wire [31:0] _T_425; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290741.4]
  wire [31:0] _T_426; // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290742.4]
  wire [7:0] _T_440; // @[RocketCore.scala 934:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290756.4]
  wire [7:0] _T_481; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290797.4]
  wire  _T_480; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290796.4]
  wire [8:0] _T_482; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290798.4]
  wire [20:0] _T_486; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290802.4]
  wire [9:0] _T_478; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290794.4]
  wire [10:0] _T_479; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290795.4]
  wire [31:0] _T_487; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290803.4]
  wire [31:0] _T_488; // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290804.4]
  wire [31:0] taken_rviImm; // @[Frontend.scala 218:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290805.4]
  wire [32:0] _T_544; // @[Frontend.scala 255:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290885.10]
  wire  _T_320; // @[Frontend.scala 213:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290631.4]
  wire  _T_321; // @[RVC.scala 45:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290632.4]
  wire [4:0] _T_323; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290634.4]
  wire [1:0] _T_324; // @[RVC.scala 45:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290635.4]
  wire [6:0] _T_330; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290641.4]
  wire  _T_325; // @[RVC.scala 45:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290636.4]
  wire [7:0] _T_331; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290642.4]
  wire [1:0] _T_326; // @[RVC.scala 45:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290637.4]
  wire [1:0] _T_327; // @[RVC.scala 45:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290638.4]
  wire [3:0] _T_328; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290639.4]
  wire [4:0] _T_329; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290640.4]
  wire [12:0] _T_332; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290643.4]
  wire [12:0] _T_333; // @[Frontend.scala 213:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290644.4]
  wire [9:0] _T_336; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290647.4]
  wire  _T_337; // @[RVC.scala 44:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290648.4]
  wire [10:0] _T_348; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290659.4]
  wire [1:0] _T_338; // @[RVC.scala 44:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290649.4]
  wire [12:0] _T_349; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290660.4]
  wire  _T_339; // @[RVC.scala 44:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290650.4]
  wire  _T_340; // @[RVC.scala 44:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290651.4]
  wire [1:0] _T_347; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290658.4]
  wire [14:0] _T_350; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290661.4]
  wire  _T_342; // @[RVC.scala 44:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290653.4]
  wire [1:0] _T_345; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290656.4]
  wire [2:0] _T_343; // @[RVC.scala 44:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290654.4]
  wire [3:0] _T_344; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290655.4]
  wire [5:0] _T_346; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290657.4]
  wire [20:0] _T_351; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290662.4]
  wire [20:0] _T_352; // @[Frontend.scala 213:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290663.4]
  wire [20:0] taken_rvcImm; // @[Frontend.scala 213:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290664.4]
  wire [32:0] _T_545; // @[Frontend.scala 255:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290886.10]
  wire [39:0] _GEN_127; // @[Frontend.scala 255:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290887.10]
  wire [39:0] _T_547; // @[Frontend.scala 255:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290888.10]
  wire [39:0] taken_npc; // @[Frontend.scala 255:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290889.10]
  wire [39:0] _T_548; // @[Frontend.scala 257:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290890.10]
  wire  predicted_taken; // @[Frontend.scala 183:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290545.4]
  wire  _T_275; // @[package.scala 106:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290547.6]
  wire [39:0] _T_276; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290548.6]
  wire [39:0] _GEN_27; // @[Frontend.scala 183:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290546.4]
  wire [39:0] _GEN_42; // @[Frontend.scala 252:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290882.8]
  wire [39:0] _GEN_45; // @[Frontend.scala 245:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290864.6]
  wire [39:0] _GEN_78; // @[Frontend.scala 252:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291204.8]
  wire [39:0] _GEN_81; // @[Frontend.scala 245:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291186.6]
  wire [39:0] _GEN_98; // @[Frontend.scala 236:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291163.4]
  wire [39:0] predicted_npc; // @[Frontend.scala 296:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291253.4]
  wire [39:0] npc; // @[Frontend.scala 120:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290451.4]
  wire  _T_237; // @[Frontend.scala 126:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290453.4]
  wire  _T_238; // @[Frontend.scala 126:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290454.4]
  wire  _T_239; // @[Frontend.scala 126:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290455.4]
  wire  s0_speculative; // @[Frontend.scala 126:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290456.4]
  wire  _T_243; // @[Frontend.scala 132:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290464.4]
  wire  _T_757; // @[Frontend.scala 221:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291130.4]
  wire  _T_758; // @[Frontend.scala 221:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291131.4]
  wire  _T_759; // @[Frontend.scala 221:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291132.4]
  wire  _T_760; // @[Frontend.scala 221:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291133.4]
  wire  _T_628; // @[Frontend.scala 216:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290997.4]
  wire  taken_rvcJALR_1; // @[Frontend.scala 216:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291000.4]
  wire  _T_761; // @[Frontend.scala 222:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291134.4]
  wire  _T_762; // @[Frontend.scala 222:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291135.4]
  wire  _T_763; // @[Frontend.scala 222:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291136.4]
  wire  _T_764; // @[Frontend.scala 222:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291137.4]
  wire  _T_765; // @[Frontend.scala 222:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291138.4]
  wire  taken_taken_1; // @[Frontend.scala 221:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291139.4]
  wire  taken; // @[Frontend.scala 277:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291252.4]
  wire  _GEN_115; // @[Frontend.scala 307:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291269.8]
  wire  _GEN_119; // @[Frontend.scala 303:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291264.6]
  wire  s2_redirect; // @[Frontend.scala 302:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291263.4]
  wire  _T_244; // @[Frontend.scala 133:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290466.6]
  wire  _T_248; // @[Frontend.scala 153:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290488.4]
  wire  _T_250; // @[Frontend.scala 154:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290491.4]
  wire  _T_251; // @[Frontend.scala 154:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290492.4]
  reg  _T_254; // @[Frontend.scala 157:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290496.4]
  reg [31:0] _RAND_20;
  wire  _T_255; // @[Frontend.scala 157:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290498.4]
  wire  _T_256; // @[Frontend.scala 157:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290499.4]
  wire  _T_257; // @[Frontend.scala 157:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290500.4]
  wire  _T_258; // @[Frontend.scala 157:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290501.4]
  wire [39:0] _T_260; // @[Frontend.scala 159:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290505.4]
  wire [39:0] _T_261; // @[Frontend.scala 331:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290506.4]
  wire [39:0] _T_262; // @[Frontend.scala 331:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290507.4]
  wire  _T_264; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290511.4]
  wire [2:0] _T_265; // @[Frontend.scala 162:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290512.4]
  wire  _T_266; // @[Frontend.scala 163:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290514.4]
  wire  _T_267; // @[Frontend.scala 163:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290515.4]
  wire  _T_268; // @[Frontend.scala 163:104:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290516.4]
  wire  _T_269; // @[Frontend.scala 163:101:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290517.4]
  wire  _T_271; // @[Frontend.scala 167:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290523.4]
  wire  _T_283; // @[Frontend.scala 283:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290571.4]
  wire  _T_284; // @[Frontend.scala 284:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290573.6]
  wire  fetch_bubble_likely; // @[Frontend.scala 284:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290574.6]
  wire  _T_286; // @[Frontend.scala 285:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290576.6]
  wire  _T_287; // @[Frontend.scala 285:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290577.6]
  wire  _T_288; // @[Frontend.scala 285:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290578.6]
  wire  _T_825; // @[Frontend.scala 264:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291229.6]
  wire  _T_827; // @[Frontend.scala 264:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291231.6]
  wire  _T_828; // @[Frontend.scala 264:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291232.6]
  wire  _T_829; // @[Frontend.scala 264:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291233.6]
  wire  _T_830; // @[Frontend.scala 264:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291234.6]
  wire  _T_557; // @[Frontend.scala 264:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290906.6]
  wire  _T_558; // @[Frontend.scala 264:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290907.6]
  wire  _T_559; // @[Frontend.scala 264:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290908.6]
  wire  _T_560; // @[Frontend.scala 264:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290909.6]
  wire  _GEN_91; // @[Frontend.scala 264:125:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291235.6]
  wire  updateBTB; // @[Frontend.scala 236:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291163.4]
  wire  _T_289; // @[Frontend.scala 285:89:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290579.6]
  wire [1:0] _GEN_128; // @[Frontend.scala 289:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290584.6]
  wire [1:0] _T_290; // @[Frontend.scala 289:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290584.6]
  wire [39:0] _GEN_129; // @[Frontend.scala 289:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290585.6]
  wire [39:0] _T_291; // @[Frontend.scala 289:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290585.6]
  wire [39:0] _GEN_35; // @[Frontend.scala 283:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290572.4]
  wire [39:0] _GEN_36; // @[Frontend.scala 283:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290572.4]
  wire [1:0] after_idx; // @[Frontend.scala 236:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291163.4]
  wire [2:0] _GEN_130; // @[Frontend.scala 293:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290589.4]
  wire [2:0] _T_292; // @[Frontend.scala 293:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290589.4]
  wire [39:0] _GEN_131; // @[Frontend.scala 293:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290590.4]
  wire [39:0] _T_294; // @[Frontend.scala 293:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290591.4]
  wire  _T_310; // @[Frontend.scala 209:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290617.4]
  wire  taken_rviCall; // @[Frontend.scala 209:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290619.4]
  wire  _T_507; // @[Frontend.scala 227:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290829.4]
  wire  _T_508; // @[Frontend.scala 227:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290830.4]
  wire  _T_509; // @[Frontend.scala 227:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290831.4]
  wire  _T_510; // @[Frontend.scala 227:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290832.4]
  wire  _T_512; // @[Frontend.scala 227:86:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290834.4]
  wire  _GEN_38; // @[Frontend.scala 227:95:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290835.4]
  wire  _GEN_39; // @[Frontend.scala 227:95:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290835.4]
  wire  _T_517; // @[Frontend.scala 239:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290847.6]
  wire  _T_518; // @[Frontend.scala 239:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290848.6]
  wire  _T_519; // @[Frontend.scala 239:127:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290849.6]
  wire  _T_520; // @[Frontend.scala 239:115:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290850.6]
  wire  _T_521; // @[Frontend.scala 239:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290851.6]
  wire  _T_522; // @[Frontend.scala 239:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290852.6]
  wire  _T_523; // @[Frontend.scala 240:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290854.6]
  wire  _T_524; // @[Frontend.scala 241:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290855.6]
  wire  _T_525; // @[Frontend.scala 242:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290856.6]
  wire  _T_528; // @[Frontend.scala 242:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290859.6]
  wire [1:0] _T_529; // @[Frontend.scala 241:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290860.6]
  wire [1:0] _T_530; // @[Frontend.scala 240:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290861.6]
  wire  _T_533; // @[Frontend.scala 246:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290866.8]
  wire  _T_534; // @[Frontend.scala 246:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290867.8]
  wire  _T_535; // @[Frontend.scala 246:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290868.8]
  wire  _T_536; // @[Frontend.scala 246:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290869.8]
  wire  _T_537; // @[Frontend.scala 246:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290870.8]
  wire  _T_538; // @[Frontend.scala 246:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290871.8]
  wire  _T_539; // @[Frontend.scala 246:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290872.8]
  wire  _GEN_46; // @[Frontend.scala 260:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290897.6]
  wire [1:0] _T_567; // @[Frontend.scala 199:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290923.4]
  wire  taken_rvc_1; // @[Frontend.scala 199:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290924.4]
  wire  _T_577; // @[Frontend.scala 209:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290939.4]
  wire  taken_rviCall_1; // @[Frontend.scala 209:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290941.4]
  wire  _T_776; // @[Frontend.scala 227:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291153.4]
  wire  _T_777; // @[Frontend.scala 227:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291154.4]
  wire  _T_778; // @[Frontend.scala 227:89:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291155.4]
  wire  _T_779; // @[Frontend.scala 227:86:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291156.4]
  wire  _T_784; // @[Frontend.scala 239:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291169.6]
  wire  _T_785; // @[Frontend.scala 239:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291170.6]
  wire  _T_786; // @[Frontend.scala 239:127:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291171.6]
  wire  _T_787; // @[Frontend.scala 239:115:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291172.6]
  wire  _T_788; // @[Frontend.scala 239:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291173.6]
  wire  _T_789; // @[Frontend.scala 239:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291174.6]
  wire  _T_790; // @[Frontend.scala 240:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291176.6]
  wire  _T_791; // @[Frontend.scala 241:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291177.6]
  wire  _T_792; // @[Frontend.scala 242:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291178.6]
  wire  _T_795; // @[Frontend.scala 242:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291181.6]
  wire [1:0] _T_796; // @[Frontend.scala 241:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291182.6]
  wire [1:0] _T_797; // @[Frontend.scala 240:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291183.6]
  wire  _T_800; // @[Frontend.scala 246:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291188.8]
  wire  _T_801; // @[Frontend.scala 246:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291189.8]
  wire  _T_802; // @[Frontend.scala 246:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291190.8]
  wire  _T_803; // @[Frontend.scala 246:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291191.8]
  wire  _T_804; // @[Frontend.scala 246:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291192.8]
  wire  _T_805; // @[Frontend.scala 246:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291193.8]
  wire  _T_806; // @[Frontend.scala 246:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291194.8]
  wire  _GEN_82; // @[Frontend.scala 260:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291222.6]
  wire  _T_833; // @[Frontend.scala 272:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291243.6]
  wire  _T_835; // @[Frontend.scala 272:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291245.6]
  wire [15:0] _T_836; // @[Frontend.scala 274:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291248.8]
  wire  _T_838; // @[Frontend.scala 299:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291257.4]
  wire  _T_839; // @[Frontend.scala 299:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291258.4]
  wire  _GEN_116; // @[Frontend.scala 303:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291264.6]
  wire  _GEN_117; // @[Frontend.scala 303:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291264.6]
  wire [4:0] _GEN_118; // @[Frontend.scala 303:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291264.6]
  wire  _T_842; // @[Frontend.scala 311:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291274.4]
  wire  _T_844; // @[Frontend.scala 311:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291276.4]
  wire  _T_846; // @[Frontend.scala 311:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291278.4]
  wire  _T_847; // @[Frontend.scala 311:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291279.4]
  ICache icache ( // @[Frontend.scala 61:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290373.4]
    .clock(icache_clock),
    .reset(icache_reset),
    .auto_master_out_a_ready(icache_auto_master_out_a_ready),
    .auto_master_out_a_valid(icache_auto_master_out_a_valid),
    .auto_master_out_a_bits_address(icache_auto_master_out_a_bits_address[37:0]),
    .auto_master_out_d_valid(icache_auto_master_out_d_valid),
    .auto_master_out_d_bits_opcode(icache_auto_master_out_d_bits_opcode),
    .auto_master_out_d_bits_size(icache_auto_master_out_d_bits_size),
    .auto_master_out_d_bits_data(icache_auto_master_out_d_bits_data),
    .auto_master_out_d_bits_corrupt(icache_auto_master_out_d_bits_corrupt),
    .io_req_ready(icache_io_req_ready),
    .io_req_valid(icache_io_req_valid),
    .io_req_bits_addr(icache_io_req_bits_addr),
    .io_s1_paddr(icache_io_s1_paddr),
    .io_s1_kill(icache_io_s1_kill),
    .io_s2_kill(icache_io_s2_kill),
    .io_resp_valid(icache_io_resp_valid),
    .io_resp_bits_data(icache_io_resp_bits_data),
    .io_resp_bits_ae(icache_io_resp_bits_ae),
    .io_invalidate(icache_io_invalidate)
  );
  ShiftQueue fq ( // @[Frontend.scala 82:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290383.4]
    .clock(fq_clock),
    .reset(fq_reset),
    .io_enq_ready(fq_io_enq_ready),
    .io_enq_valid(fq_io_enq_valid),
    .io_enq_bits_btb_taken(fq_io_enq_bits_btb_taken),
    .io_enq_bits_btb_bridx(fq_io_enq_bits_btb_bridx),
    .io_enq_bits_btb_entry(fq_io_enq_bits_btb_entry),
    .io_enq_bits_btb_bht_history(fq_io_enq_bits_btb_bht_history),
    .io_enq_bits_pc(fq_io_enq_bits_pc),
    .io_enq_bits_data(fq_io_enq_bits_data),
    .io_enq_bits_mask(fq_io_enq_bits_mask),
    .io_enq_bits_xcpt_pf_inst(fq_io_enq_bits_xcpt_pf_inst),
    .io_enq_bits_xcpt_ae_inst(fq_io_enq_bits_xcpt_ae_inst),
    .io_enq_bits_replay(fq_io_enq_bits_replay),
    .io_deq_ready(fq_io_deq_ready),
    .io_deq_valid(fq_io_deq_valid),
    .io_deq_bits_btb_taken(fq_io_deq_bits_btb_taken),
    .io_deq_bits_btb_bridx(fq_io_deq_bits_btb_bridx),
    .io_deq_bits_btb_entry(fq_io_deq_bits_btb_entry),
    .io_deq_bits_btb_bht_history(fq_io_deq_bits_btb_bht_history),
    .io_deq_bits_pc(fq_io_deq_bits_pc),
    .io_deq_bits_data(fq_io_deq_bits_data),
    .io_deq_bits_xcpt_pf_inst(fq_io_deq_bits_xcpt_pf_inst),
    .io_deq_bits_xcpt_ae_inst(fq_io_deq_bits_xcpt_ae_inst),
    .io_deq_bits_replay(fq_io_deq_bits_replay),
    .io_mask(fq_io_mask)
  );
  TLB_1 tlb ( // @[Frontend.scala 95:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290404.4]
    .clock(tlb_clock),
    .reset(tlb_reset),
    .io_req_ready(tlb_io_req_ready),
    .io_req_valid(tlb_io_req_valid),
    .io_req_bits_vaddr(tlb_io_req_bits_vaddr),
    .io_resp_miss(tlb_io_resp_miss),
    .io_resp_paddr(tlb_io_resp_paddr),
    .io_resp_pf_inst(tlb_io_resp_pf_inst),
    .io_resp_ae_inst(tlb_io_resp_ae_inst),
    .io_resp_cacheable(tlb_io_resp_cacheable),
    .io_sfence_valid(tlb_io_sfence_valid),
    .io_sfence_bits_rs1(tlb_io_sfence_bits_rs1),
    .io_sfence_bits_rs2(tlb_io_sfence_bits_rs2),
    .io_sfence_bits_addr(tlb_io_sfence_bits_addr),
    .io_ptw_req_ready(tlb_io_ptw_req_ready),
    .io_ptw_req_valid(tlb_io_ptw_req_valid),
    .io_ptw_req_bits_valid(tlb_io_ptw_req_bits_valid),
    .io_ptw_req_bits_bits_addr(tlb_io_ptw_req_bits_bits_addr),
    .io_ptw_resp_valid(tlb_io_ptw_resp_valid),
    .io_ptw_resp_bits_ae(tlb_io_ptw_resp_bits_ae),
    .io_ptw_resp_bits_pte_ppn(tlb_io_ptw_resp_bits_pte_ppn),
    .io_ptw_resp_bits_pte_d(tlb_io_ptw_resp_bits_pte_d),
    .io_ptw_resp_bits_pte_a(tlb_io_ptw_resp_bits_pte_a),
    .io_ptw_resp_bits_pte_g(tlb_io_ptw_resp_bits_pte_g),
    .io_ptw_resp_bits_pte_u(tlb_io_ptw_resp_bits_pte_u),
    .io_ptw_resp_bits_pte_x(tlb_io_ptw_resp_bits_pte_x),
    .io_ptw_resp_bits_pte_w(tlb_io_ptw_resp_bits_pte_w),
    .io_ptw_resp_bits_pte_r(tlb_io_ptw_resp_bits_pte_r),
    .io_ptw_resp_bits_pte_v(tlb_io_ptw_resp_bits_pte_v),
    .io_ptw_resp_bits_level(tlb_io_ptw_resp_bits_level),
    .io_ptw_resp_bits_fragmented_superpage(tlb_io_ptw_resp_bits_fragmented_superpage),
    .io_ptw_resp_bits_homogeneous(tlb_io_ptw_resp_bits_homogeneous),
    .io_ptw_ptbr_mode(tlb_io_ptw_ptbr_mode),
    .io_ptw_status_prv(tlb_io_ptw_status_prv),
    .io_ptw_pmp_0_cfg_l(tlb_io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_a(tlb_io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x(tlb_io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w(tlb_io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r(tlb_io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr(tlb_io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask(tlb_io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l(tlb_io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_a(tlb_io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x(tlb_io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w(tlb_io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r(tlb_io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr(tlb_io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask(tlb_io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l(tlb_io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_a(tlb_io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x(tlb_io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w(tlb_io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r(tlb_io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr(tlb_io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask(tlb_io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l(tlb_io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_a(tlb_io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x(tlb_io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w(tlb_io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r(tlb_io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr(tlb_io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask(tlb_io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l(tlb_io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_a(tlb_io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x(tlb_io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w(tlb_io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r(tlb_io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr(tlb_io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask(tlb_io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l(tlb_io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_a(tlb_io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x(tlb_io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w(tlb_io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r(tlb_io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr(tlb_io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask(tlb_io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l(tlb_io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_a(tlb_io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x(tlb_io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w(tlb_io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r(tlb_io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr(tlb_io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask(tlb_io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l(tlb_io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_a(tlb_io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x(tlb_io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w(tlb_io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r(tlb_io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr(tlb_io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask(tlb_io_ptw_pmp_7_mask),
    .io_kill(tlb_io_kill)
  );
  BTB btb ( // @[Frontend.scala 170:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290527.4]
    .clock(btb_clock),
    .reset(btb_reset),
    .io_req_bits_addr(btb_io_req_bits_addr),
    .io_resp_valid(btb_io_resp_valid),
    .io_resp_bits_taken(btb_io_resp_bits_taken),
    .io_resp_bits_bridx(btb_io_resp_bits_bridx),
    .io_resp_bits_target(btb_io_resp_bits_target),
    .io_resp_bits_entry(btb_io_resp_bits_entry),
    .io_resp_bits_bht_history(btb_io_resp_bits_bht_history),
    .io_resp_bits_bht_value(btb_io_resp_bits_bht_value),
    .io_btb_update_valid(btb_io_btb_update_valid),
    .io_btb_update_bits_prediction_entry(btb_io_btb_update_bits_prediction_entry),
    .io_btb_update_bits_pc(btb_io_btb_update_bits_pc),
    .io_btb_update_bits_isValid(btb_io_btb_update_bits_isValid),
    .io_btb_update_bits_br_pc(btb_io_btb_update_bits_br_pc),
    .io_btb_update_bits_cfiType(btb_io_btb_update_bits_cfiType),
    .io_bht_update_valid(btb_io_bht_update_valid),
    .io_bht_update_bits_prediction_history(btb_io_bht_update_bits_prediction_history),
    .io_bht_update_bits_pc(btb_io_bht_update_bits_pc),
    .io_bht_update_bits_branch(btb_io_bht_update_bits_branch),
    .io_bht_update_bits_taken(btb_io_bht_update_bits_taken),
    .io_bht_update_bits_mispredict(btb_io_bht_update_bits_mispredict),
    .io_bht_advance_valid(btb_io_bht_advance_valid),
    .io_bht_advance_bits_bht_value(btb_io_bht_advance_bits_bht_value),
    .io_ras_update_valid(btb_io_ras_update_valid),
    .io_ras_update_bits_cfiType(btb_io_ras_update_bits_cfiType),
    .io_ras_update_bits_returnAddr(btb_io_ras_update_bits_returnAddr),
    .io_ras_head_valid(btb_io_ras_head_valid),
    .io_ras_head_bits(btb_io_ras_head_bits),
    .io_flush(btb_io_flush)
  );
  assign _T_198 = io_cpu_req_valid | io_cpu_sfence_valid; // @[Frontend.scala 86:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290389.4]
  assign _T_199 = _T_198 | io_cpu_flush_icache; // @[Frontend.scala 86:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290390.4]
  assign _T_200 = _T_199 | io_cpu_bht_update_valid; // @[Frontend.scala 86:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290391.4]
  assign _T_201 = _T_200 | io_cpu_btb_update_valid; // @[Frontend.scala 86:102:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290392.4]
  assign _T_202 = _T_201 == 1'h0; // @[Frontend.scala 86:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290393.4]
  assign _T_203 = _T_202 | io_cpu_might_request; // @[Frontend.scala 86:130:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290394.4]
  assign _T_205 = _T_203 | reset; // @[Frontend.scala 86:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290396.4]
  assign _T_206 = _T_205 == 1'h0; // @[Frontend.scala 86:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290397.4]
  assign _T_207 = fq_io_mask[2]; // @[Frontend.scala 97:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290408.4]
  assign _T_208 = _T_207 == 1'h0; // @[Frontend.scala 97:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290409.4]
  assign s0_valid = io_cpu_req_valid | _T_208; // @[Frontend.scala 97:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290410.4]
  assign _T_214 = ~ io_reset_vector; // @[Frontend.scala 331:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290416.4]
  assign _T_215 = _T_214 | 38'h1; // @[Frontend.scala 331:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290417.4]
  assign _T_216 = ~ _T_215; // @[Frontend.scala 331:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290418.4]
  assign s2_btb_taken = s2_btb_resp_valid & s2_btb_resp_bits_taken; // @[Frontend.scala 105:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290422.4]
  assign s2_xcpt = s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst; // @[Frontend.scala 107:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290424.4]
  assign _T_223 = ~ s1_pc; // @[Frontend.scala 113:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290429.4]
  assign _T_224 = _T_223 | 40'h3; // @[Frontend.scala 113:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290430.4]
  assign s1_base_pc = ~ _T_224; // @[Frontend.scala 113:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290431.4]
  assign ntpc = s1_base_pc + 40'h4; // @[Frontend.scala 114:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290433.4]
  assign _T_229 = fq_io_enq_ready & fq_io_enq_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290442.4]
  assign _T_230 = _T_229 == 1'h0; // @[Frontend.scala 119:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290443.4]
  assign _T_231 = s2_valid & _T_230; // @[Frontend.scala 119:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290444.4]
  assign _T_232 = s0_valid == 1'h0; // @[Frontend.scala 119:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290445.4]
  assign s2_replay = _T_231 | _T_235; // @[Frontend.scala 119:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290449.4]
  assign _T_233 = s2_replay & _T_232; // @[Frontend.scala 119:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290446.4]
  assign _T_295 = s2_partial_insn[1:0]; // @[Frontend.scala 199:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290593.4]
  assign _T_296 = _T_295 != 2'h3; // @[Frontend.scala 199:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290594.4]
  assign _T_297 = _T_296 == 1'h0; // @[Frontend.scala 200:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290595.4]
  assign taken_prevRVI = s2_partial_insn_valid & _T_297; // @[Frontend.scala 200:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290596.4]
  assign taken_bits = fq_io_enq_bits_data[15:0]; // @[Frontend.scala 202:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290600.4]
  assign taken_rviBits = {taken_bits,s2_partial_insn}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290603.4]
  assign _T_302 = taken_rviBits[6:0]; // @[Frontend.scala 206:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290606.4]
  assign taken_rviJump = _T_302 == 7'h6f; // @[Frontend.scala 206:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290607.4]
  assign taken_rviJALR = _T_302 == 7'h67; // @[Frontend.scala 207:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290609.4]
  assign _T_490 = taken_rviJump | taken_rviJALR; // @[Frontend.scala 221:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290808.4]
  assign taken_rviBranch = _T_302 == 7'h63; // @[Frontend.scala 205:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290605.4]
  assign _T_491 = taken_rviBranch & s2_btb_resp_bits_bht_value; // @[Frontend.scala 221:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290809.4]
  assign _T_492 = _T_490 | _T_491; // @[Frontend.scala 221:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290810.4]
  assign _T_493 = taken_prevRVI & _T_492; // @[Frontend.scala 221:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290811.4]
  assign _T_298 = fq_io_enq_bits_mask[0]; // @[Frontend.scala 201:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290597.4]
  assign _T_299 = taken_prevRVI == 1'h0; // @[Frontend.scala 201:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290598.4]
  assign taken_valid = _T_298 & _T_299; // @[Frontend.scala 201:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290599.4]
  assign _T_318 = taken_bits & 16'he003; // @[Frontend.scala 212:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290628.4]
  assign taken_rvcJump = 16'ha001 == _T_318; // @[Frontend.scala 212:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290629.4]
  assign _T_360 = taken_bits & 16'hf003; // @[Frontend.scala 216:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290674.4]
  assign _T_361 = 16'h9002 == _T_360; // @[Frontend.scala 216:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290675.4]
  assign _T_362 = taken_bits[6:2]; // @[Frontend.scala 216:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290676.4]
  assign _T_363 = _T_362 == 5'h0; // @[Frontend.scala 216:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290677.4]
  assign taken_rvcJALR = _T_361 & _T_363; // @[Frontend.scala 216:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290678.4]
  assign _T_494 = taken_rvcJump | taken_rvcJALR; // @[Frontend.scala 222:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290812.4]
  assign _T_354 = 16'h8002 == _T_360; // @[Frontend.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290666.4]
  assign taken_rvcJR = _T_354 & _T_363; // @[Frontend.scala 214:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290669.4]
  assign _T_495 = _T_494 | taken_rvcJR; // @[Frontend.scala 222:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290813.4]
  assign _T_313 = 16'hc001 == _T_318; // @[Frontend.scala 210:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290621.4]
  assign _T_315 = 16'he001 == _T_318; // @[Frontend.scala 210:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290623.4]
  assign taken_rvcBranch = _T_313 | _T_315; // @[Frontend.scala 210:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290624.4]
  assign _T_496 = taken_rvcBranch & s2_btb_resp_bits_bht_value; // @[Frontend.scala 222:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290814.4]
  assign _T_497 = _T_495 | _T_496; // @[Frontend.scala 222:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290815.4]
  assign _T_498 = taken_valid & _T_497; // @[Frontend.scala 222:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290816.4]
  assign taken_taken = _T_493 | _T_498; // @[Frontend.scala 221:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290817.4]
  assign taken_idx = taken_taken == 1'h0; // @[Frontend.scala 236:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291162.4]
  assign _T_798 = s2_btb_taken == 1'h0; // @[Frontend.scala 245:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291185.6]
  assign _T_562 = taken_bits[1:0]; // @[Frontend.scala 199:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290915.4]
  assign _T_563 = _T_562 != 2'h3; // @[Frontend.scala 199:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290916.4]
  assign _T_564 = _T_563 == 1'h0; // @[Frontend.scala 200:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290917.4]
  assign taken_prevRVI_1 = taken_valid & _T_564; // @[Frontend.scala 200:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290918.4]
  assign taken_bits_1 = fq_io_enq_bits_data[31:16]; // @[Frontend.scala 202:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290922.4]
  assign taken_rviBits_1 = {taken_bits_1,taken_bits}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290925.4]
  assign _T_570 = taken_rviBits_1[6:0]; // @[Frontend.scala 207:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290930.4]
  assign taken_rviJALR_1 = _T_570 == 7'h67; // @[Frontend.scala 207:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290931.4]
  assign _T_571 = taken_rviBits_1[7]; // @[Frontend.scala 208:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290932.4]
  assign _T_572 = _T_571 == 1'h0; // @[Frontend.scala 208:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290933.4]
  assign _T_573 = taken_rviJALR_1 & _T_572; // @[Frontend.scala 208:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290934.4]
  assign _T_574 = taken_rviBits_1[19:15]; // @[Frontend.scala 208:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290935.4]
  assign _T_575 = _T_574 & 5'h1b; // @[Frontend.scala 208:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290936.4]
  assign _T_576 = 5'h1 == _T_575; // @[Frontend.scala 208:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290937.4]
  assign taken_rviReturn_1 = _T_573 & _T_576; // @[Frontend.scala 208:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290938.4]
  assign _T_766 = taken_prevRVI_1 & taken_rviReturn_1; // @[Frontend.scala 223:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291140.4]
  assign _T_565 = fq_io_enq_bits_mask[1]; // @[Frontend.scala 201:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290919.4]
  assign _T_566 = taken_prevRVI_1 == 1'h0; // @[Frontend.scala 201:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290920.4]
  assign taken_valid_1 = _T_565 & _T_566; // @[Frontend.scala 201:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290921.4]
  assign _T_620 = taken_bits_1 & 16'hf003; // @[Frontend.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290987.4]
  assign _T_621 = 16'h8002 == _T_620; // @[Frontend.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290988.4]
  assign _T_622 = taken_bits_1[6:2]; // @[Frontend.scala 214:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290989.4]
  assign _T_623 = _T_622 == 5'h0; // @[Frontend.scala 214:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290990.4]
  assign taken_rvcJR_1 = _T_621 & _T_623; // @[Frontend.scala 214:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290991.4]
  assign _T_624 = taken_bits_1[11:7]; // @[Frontend.scala 215:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290992.4]
  assign _T_625 = _T_624 & 5'h1b; // @[Frontend.scala 215:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290993.4]
  assign _T_626 = 5'h1 == _T_625; // @[Frontend.scala 215:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290994.4]
  assign taken_rvcReturn_1 = taken_rvcJR_1 & _T_626; // @[Frontend.scala 215:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290995.4]
  assign _T_767 = taken_valid_1 & taken_rvcReturn_1; // @[Frontend.scala 223:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291141.4]
  assign _T_768 = _T_766 | _T_767; // @[Frontend.scala 223:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291142.4]
  assign taken_predictReturn_1 = btb_io_ras_head_valid & _T_768; // @[Frontend.scala 223:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291143.4]
  assign _T_807 = s2_valid & taken_predictReturn_1; // @[Frontend.scala 249:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291198.8]
  assign _T_304 = taken_rviBits[7]; // @[Frontend.scala 208:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290610.4]
  assign _T_305 = _T_304 == 1'h0; // @[Frontend.scala 208:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290611.4]
  assign _T_306 = taken_rviJALR & _T_305; // @[Frontend.scala 208:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290612.4]
  assign _T_307 = taken_rviBits[19:15]; // @[Frontend.scala 208:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290613.4]
  assign _T_308 = _T_307 & 5'h1b; // @[Frontend.scala 208:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290614.4]
  assign _T_309 = 5'h1 == _T_308; // @[Frontend.scala 208:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290615.4]
  assign taken_rviReturn = _T_306 & _T_309; // @[Frontend.scala 208:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290616.4]
  assign _T_499 = taken_prevRVI & taken_rviReturn; // @[Frontend.scala 223:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290818.4]
  assign _T_357 = taken_bits[11:7]; // @[Frontend.scala 215:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290670.4]
  assign _T_358 = _T_357 & 5'h1b; // @[Frontend.scala 215:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290671.4]
  assign _T_359 = 5'h1 == _T_358; // @[Frontend.scala 215:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290672.4]
  assign taken_rvcReturn = taken_rvcJR & _T_359; // @[Frontend.scala 215:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290673.4]
  assign _T_500 = taken_valid & taken_rvcReturn; // @[Frontend.scala 223:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290819.4]
  assign _T_501 = _T_499 | _T_500; // @[Frontend.scala 223:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290820.4]
  assign taken_predictReturn = btb_io_ras_head_valid & _T_501; // @[Frontend.scala 223:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290821.4]
  assign _T_540 = s2_valid & taken_predictReturn; // @[Frontend.scala 249:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290876.8]
  assign _GEN_44 = _T_798 ? _T_540 : 1'h0; // @[Frontend.scala 245:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290864.6]
  assign _GEN_77 = _T_807 ? 1'h1 : _GEN_44; // @[Frontend.scala 249:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291199.8]
  assign _GEN_80 = _T_798 ? _GEN_77 : _GEN_44; // @[Frontend.scala 245:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291186.6]
  assign useRAS = taken_idx ? _GEN_80 : _GEN_44; // @[Frontend.scala 236:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291163.4]
  assign taken_rviBranch_1 = _T_570 == 7'h63; // @[Frontend.scala 205:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290927.4]
  assign _T_771 = taken_prevRVI_1 & taken_rviBranch_1; // @[Frontend.scala 225:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291147.4]
  assign _T_579 = taken_bits_1 & 16'he003; // @[Frontend.scala 210:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290942.4]
  assign _T_580 = 16'hc001 == _T_579; // @[Frontend.scala 210:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290943.4]
  assign _T_582 = 16'he001 == _T_579; // @[Frontend.scala 210:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290945.4]
  assign taken_rvcBranch_1 = _T_580 | _T_582; // @[Frontend.scala 210:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290946.4]
  assign _T_772 = taken_valid_1 & taken_rvcBranch_1; // @[Frontend.scala 225:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291148.4]
  assign _T_773 = _T_771 | _T_772; // @[Frontend.scala 225:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291149.4]
  assign taken_predictBranch_1 = s2_btb_resp_bits_bht_value & _T_773; // @[Frontend.scala 225:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291150.4]
  assign taken_rviJump_1 = _T_570 == 7'h6f; // @[Frontend.scala 206:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290929.4]
  assign _T_769 = taken_prevRVI_1 & taken_rviJump_1; // @[Frontend.scala 224:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291144.4]
  assign taken_rvcJump_1 = 16'ha001 == _T_579; // @[Frontend.scala 212:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290951.4]
  assign _T_770 = taken_valid_1 & taken_rvcJump_1; // @[Frontend.scala 224:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291145.4]
  assign taken_predictJump_1 = _T_769 | _T_770; // @[Frontend.scala 224:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291146.4]
  assign _T_808 = taken_predictBranch_1 | taken_predictJump_1; // @[Frontend.scala 252:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291202.8]
  assign _T_809 = s2_valid & _T_808; // @[Frontend.scala 252:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291203.8]
  assign _T_277 = ~ s2_pc; // @[Frontend.scala 192:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290558.4]
  assign _T_278 = _T_277 | 40'h3; // @[Frontend.scala 192:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290559.4]
  assign s2_base_pc = ~ _T_278; // @[Frontend.scala 192:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290560.4]
  assign taken_pc_1 = s2_base_pc | 40'h2; // @[Frontend.scala 253:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291205.10]
  assign _T_810 = taken_pc_1 - 40'h2; // @[Frontend.scala 256:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291206.10]
  assign _T_811 = $unsigned(_T_810); // @[Frontend.scala 256:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291207.10]
  assign _T_812 = _T_811[39:0]; // @[Frontend.scala 256:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291208.10]
  assign _T_813 = taken_prevRVI_1 ? _T_812 : taken_pc_1; // @[Frontend.scala 256:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291209.10]
  assign _T_814 = $signed(_T_813); // @[Frontend.scala 256:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291210.10]
  assign _T_631 = taken_rviBits_1[3]; // @[Frontend.scala 218:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291002.4]
  assign _T_633 = taken_rviBits_1[31]; // @[RocketCore.scala 932:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291004.4]
  assign _T_634 = $signed(_T_633); // @[RocketCore.scala 932:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291005.4]
  assign _T_689 = $unsigned(_T_634); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291060.4]
  assign _T_639 = {11{_T_634}}; // @[RocketCore.scala 933:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291010.4]
  assign _T_688 = $unsigned(_T_639); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291059.4]
  assign _T_690 = {_T_689,_T_688}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291061.4]
  assign _T_643 = taken_rviBits_1[19:12]; // @[RocketCore.scala 934:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291014.4]
  assign _T_644 = $signed(_T_643); // @[RocketCore.scala 934:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291015.4]
  assign _T_686 = $unsigned(_T_644); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291057.4]
  assign _T_650 = taken_rviBits_1[20]; // @[RocketCore.scala 936:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291021.4]
  assign _T_651 = $signed(_T_650); // @[RocketCore.scala 936:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291022.4]
  assign _T_654 = $signed(_T_571); // @[RocketCore.scala 937:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291025.4]
  assign _T_685 = $unsigned(_T_651); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291056.4]
  assign _T_687 = {_T_686,_T_685}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291058.4]
  assign _T_691 = {_T_690,_T_687}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291062.4]
  assign _T_661 = taken_rviBits_1[30:25]; // @[RocketCore.scala 938:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291032.4]
  assign _T_667 = taken_rviBits_1[11:8]; // @[RocketCore.scala 940:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291038.4]
  assign _T_670 = taken_rviBits_1[24:21]; // @[RocketCore.scala 941:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291041.4]
  assign _T_683 = {_T_661,_T_670}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291054.4]
  assign _T_684 = {_T_683,1'h0}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291055.4]
  assign _T_692 = {_T_691,_T_684}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291063.4]
  assign _T_693 = $signed(_T_692); // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291064.4]
  assign _T_707 = {8{_T_634}}; // @[RocketCore.scala 934:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291078.4]
  assign _T_748 = $unsigned(_T_707); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291119.4]
  assign _T_747 = $unsigned(_T_654); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291118.4]
  assign _T_749 = {_T_748,_T_747}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291120.4]
  assign _T_753 = {_T_690,_T_749}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291124.4]
  assign _T_745 = {_T_661,_T_667}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291116.4]
  assign _T_746 = {_T_745,1'h0}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291117.4]
  assign _T_754 = {_T_753,_T_746}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291125.4]
  assign _T_755 = $signed(_T_754); // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291126.4]
  assign taken_rviImm_1 = _T_631 ? $signed(_T_693) : $signed(_T_755); // @[Frontend.scala 218:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291127.4]
  assign _T_587 = taken_bits_1[14]; // @[Frontend.scala 213:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290953.4]
  assign _T_588 = taken_bits_1[12]; // @[RVC.scala 45:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290954.4]
  assign _T_590 = _T_588 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290956.4]
  assign _T_591 = taken_bits_1[6:5]; // @[RVC.scala 45:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290957.4]
  assign _T_597 = {_T_590,_T_591}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290963.4]
  assign _T_592 = taken_bits_1[2]; // @[RVC.scala 45:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290958.4]
  assign _T_598 = {_T_597,_T_592}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290964.4]
  assign _T_593 = taken_bits_1[11:10]; // @[RVC.scala 45:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290959.4]
  assign _T_594 = taken_bits_1[4:3]; // @[RVC.scala 45:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290960.4]
  assign _T_595 = {_T_593,_T_594}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290961.4]
  assign _T_596 = {_T_595,1'h0}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290962.4]
  assign _T_599 = {_T_598,_T_596}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290965.4]
  assign _T_600 = $signed(_T_599); // @[Frontend.scala 213:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290966.4]
  assign _T_603 = _T_588 ? 10'h3ff : 10'h0; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290969.4]
  assign _T_604 = taken_bits_1[8]; // @[RVC.scala 44:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290970.4]
  assign _T_615 = {_T_603,_T_604}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290981.4]
  assign _T_605 = taken_bits_1[10:9]; // @[RVC.scala 44:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290971.4]
  assign _T_616 = {_T_615,_T_605}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290982.4]
  assign _T_606 = taken_bits_1[6]; // @[RVC.scala 44:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290972.4]
  assign _T_607 = taken_bits_1[7]; // @[RVC.scala 44:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290973.4]
  assign _T_614 = {_T_606,_T_607}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290980.4]
  assign _T_617 = {_T_616,_T_614}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290983.4]
  assign _T_609 = taken_bits_1[11]; // @[RVC.scala 44:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290975.4]
  assign _T_612 = {_T_592,_T_609}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290978.4]
  assign _T_610 = taken_bits_1[5:3]; // @[RVC.scala 44:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290976.4]
  assign _T_611 = {_T_610,1'h0}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290977.4]
  assign _T_613 = {_T_612,_T_611}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290979.4]
  assign _T_618 = {_T_617,_T_613}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290984.4]
  assign _T_619 = $signed(_T_618); // @[Frontend.scala 213:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290985.4]
  assign taken_rvcImm_1 = _T_587 ? $signed({{8{_T_600[12]}},_T_600}) : $signed(_T_619); // @[Frontend.scala 213:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290986.4]
  assign _T_815 = taken_prevRVI_1 ? $signed(taken_rviImm_1) : $signed({{11{taken_rvcImm_1[20]}},taken_rvcImm_1}); // @[Frontend.scala 256:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291211.10]
  assign _GEN_126 = {{8{_T_815[31]}},_T_815}; // @[Frontend.scala 256:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291212.10]
  assign _T_817 = $signed(_T_814) + $signed(_GEN_126); // @[Frontend.scala 256:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291213.10]
  assign taken_npc_1 = $signed(_T_817); // @[Frontend.scala 256:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291214.10]
  assign _T_818 = $unsigned(taken_npc_1); // @[Frontend.scala 257:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291215.10]
  assign _T_504 = taken_prevRVI & taken_rviBranch; // @[Frontend.scala 225:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290825.4]
  assign _T_505 = taken_valid & taken_rvcBranch; // @[Frontend.scala 225:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290826.4]
  assign _T_506 = _T_504 | _T_505; // @[Frontend.scala 225:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290827.4]
  assign taken_predictBranch = s2_btb_resp_bits_bht_value & _T_506; // @[Frontend.scala 225:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290828.4]
  assign _T_502 = taken_prevRVI & taken_rviJump; // @[Frontend.scala 224:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290822.4]
  assign _T_503 = taken_valid & taken_rvcJump; // @[Frontend.scala 224:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290823.4]
  assign taken_predictJump = _T_502 | _T_503; // @[Frontend.scala 224:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290824.4]
  assign _T_541 = taken_predictBranch | taken_predictJump; // @[Frontend.scala 252:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290880.8]
  assign _T_542 = s2_valid & _T_541; // @[Frontend.scala 252:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290881.8]
  assign _T_543 = $signed(s2_base_pc); // @[Frontend.scala 255:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290884.10]
  assign _T_364 = taken_rviBits[3]; // @[Frontend.scala 218:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290680.4]
  assign _T_366 = taken_rviBits[31]; // @[RocketCore.scala 932:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290682.4]
  assign _T_367 = $signed(_T_366); // @[RocketCore.scala 932:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290683.4]
  assign _T_422 = $unsigned(_T_367); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290738.4]
  assign _T_372 = {11{_T_367}}; // @[RocketCore.scala 933:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290688.4]
  assign _T_421 = $unsigned(_T_372); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290737.4]
  assign _T_423 = {_T_422,_T_421}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290739.4]
  assign _T_376 = taken_rviBits[19:12]; // @[RocketCore.scala 934:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290692.4]
  assign _T_377 = $signed(_T_376); // @[RocketCore.scala 934:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290693.4]
  assign _T_419 = $unsigned(_T_377); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290735.4]
  assign _T_383 = taken_rviBits[20]; // @[RocketCore.scala 936:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290699.4]
  assign _T_384 = $signed(_T_383); // @[RocketCore.scala 936:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290700.4]
  assign _T_387 = $signed(_T_304); // @[RocketCore.scala 937:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290703.4]
  assign _T_418 = $unsigned(_T_384); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290734.4]
  assign _T_420 = {_T_419,_T_418}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290736.4]
  assign _T_424 = {_T_423,_T_420}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290740.4]
  assign _T_394 = taken_rviBits[30:25]; // @[RocketCore.scala 938:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290710.4]
  assign _T_400 = taken_rviBits[11:8]; // @[RocketCore.scala 940:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290716.4]
  assign _T_403 = taken_rviBits[24:21]; // @[RocketCore.scala 941:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290719.4]
  assign _T_416 = {_T_394,_T_403}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290732.4]
  assign _T_417 = {_T_416,1'h0}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290733.4]
  assign _T_425 = {_T_424,_T_417}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290741.4]
  assign _T_426 = $signed(_T_425); // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290742.4]
  assign _T_440 = {8{_T_367}}; // @[RocketCore.scala 934:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290756.4]
  assign _T_481 = $unsigned(_T_440); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290797.4]
  assign _T_480 = $unsigned(_T_387); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290796.4]
  assign _T_482 = {_T_481,_T_480}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290798.4]
  assign _T_486 = {_T_423,_T_482}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290802.4]
  assign _T_478 = {_T_394,_T_400}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290794.4]
  assign _T_479 = {_T_478,1'h0}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290795.4]
  assign _T_487 = {_T_486,_T_479}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290803.4]
  assign _T_488 = $signed(_T_487); // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290804.4]
  assign taken_rviImm = _T_364 ? $signed(_T_426) : $signed(_T_488); // @[Frontend.scala 218:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290805.4]
  assign _T_544 = $signed(taken_rviImm) - $signed(32'sh2); // @[Frontend.scala 255:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290885.10]
  assign _T_320 = taken_bits[14]; // @[Frontend.scala 213:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290631.4]
  assign _T_321 = taken_bits[12]; // @[RVC.scala 45:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290632.4]
  assign _T_323 = _T_321 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290634.4]
  assign _T_324 = taken_bits[6:5]; // @[RVC.scala 45:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290635.4]
  assign _T_330 = {_T_323,_T_324}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290641.4]
  assign _T_325 = taken_bits[2]; // @[RVC.scala 45:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290636.4]
  assign _T_331 = {_T_330,_T_325}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290642.4]
  assign _T_326 = taken_bits[11:10]; // @[RVC.scala 45:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290637.4]
  assign _T_327 = taken_bits[4:3]; // @[RVC.scala 45:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290638.4]
  assign _T_328 = {_T_326,_T_327}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290639.4]
  assign _T_329 = {_T_328,1'h0}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290640.4]
  assign _T_332 = {_T_331,_T_329}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290643.4]
  assign _T_333 = $signed(_T_332); // @[Frontend.scala 213:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290644.4]
  assign _T_336 = _T_321 ? 10'h3ff : 10'h0; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290647.4]
  assign _T_337 = taken_bits[8]; // @[RVC.scala 44:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290648.4]
  assign _T_348 = {_T_336,_T_337}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290659.4]
  assign _T_338 = taken_bits[10:9]; // @[RVC.scala 44:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290649.4]
  assign _T_349 = {_T_348,_T_338}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290660.4]
  assign _T_339 = taken_bits[6]; // @[RVC.scala 44:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290650.4]
  assign _T_340 = taken_bits[7]; // @[RVC.scala 44:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290651.4]
  assign _T_347 = {_T_339,_T_340}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290658.4]
  assign _T_350 = {_T_349,_T_347}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290661.4]
  assign _T_342 = taken_bits[11]; // @[RVC.scala 44:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290653.4]
  assign _T_345 = {_T_325,_T_342}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290656.4]
  assign _T_343 = taken_bits[5:3]; // @[RVC.scala 44:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290654.4]
  assign _T_344 = {_T_343,1'h0}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290655.4]
  assign _T_346 = {_T_345,_T_344}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290657.4]
  assign _T_351 = {_T_350,_T_346}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290662.4]
  assign _T_352 = $signed(_T_351); // @[Frontend.scala 213:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290663.4]
  assign taken_rvcImm = _T_320 ? $signed({{8{_T_333[12]}},_T_333}) : $signed(_T_352); // @[Frontend.scala 213:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290664.4]
  assign _T_545 = taken_prevRVI ? $signed(_T_544) : $signed({{12{taken_rvcImm[20]}},taken_rvcImm}); // @[Frontend.scala 255:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290886.10]
  assign _GEN_127 = {{7{_T_545[32]}},_T_545}; // @[Frontend.scala 255:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290887.10]
  assign _T_547 = $signed(_T_543) + $signed(_GEN_127); // @[Frontend.scala 255:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290888.10]
  assign taken_npc = $signed(_T_547); // @[Frontend.scala 255:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290889.10]
  assign _T_548 = $unsigned(taken_npc); // @[Frontend.scala 257:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290890.10]
  assign predicted_taken = btb_io_resp_valid & btb_io_resp_bits_taken; // @[Frontend.scala 183:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290545.4]
  assign _T_275 = btb_io_resp_bits_target[38]; // @[package.scala 106:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290547.6]
  assign _T_276 = {_T_275,btb_io_resp_bits_target}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290548.6]
  assign _GEN_27 = predicted_taken ? _T_276 : ntpc; // @[Frontend.scala 183:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290546.4]
  assign _GEN_42 = _T_542 ? _T_548 : _GEN_27; // @[Frontend.scala 252:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290882.8]
  assign _GEN_45 = _T_798 ? _GEN_42 : _GEN_27; // @[Frontend.scala 245:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290864.6]
  assign _GEN_78 = _T_809 ? _T_818 : _GEN_45; // @[Frontend.scala 252:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291204.8]
  assign _GEN_81 = _T_798 ? _GEN_78 : _GEN_45; // @[Frontend.scala 245:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291186.6]
  assign _GEN_98 = taken_idx ? _GEN_81 : _GEN_45; // @[Frontend.scala 236:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291163.4]
  assign predicted_npc = useRAS ? {{1'd0}, btb_io_ras_head_bits} : _GEN_98; // @[Frontend.scala 296:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291253.4]
  assign npc = s2_replay ? s2_pc : predicted_npc; // @[Frontend.scala 120:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290451.4]
  assign _T_237 = s2_speculative == 1'h0; // @[Frontend.scala 126:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290453.4]
  assign _T_238 = s2_valid & _T_237; // @[Frontend.scala 126:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290454.4]
  assign _T_239 = s1_speculative | _T_238; // @[Frontend.scala 126:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290455.4]
  assign s0_speculative = _T_239 | predicted_taken; // @[Frontend.scala 126:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290456.4]
  assign _T_243 = s2_replay == 1'h0; // @[Frontend.scala 132:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290464.4]
  assign _T_757 = taken_rviJump_1 | taken_rviJALR_1; // @[Frontend.scala 221:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291130.4]
  assign _T_758 = taken_rviBranch_1 & s2_btb_resp_bits_bht_value; // @[Frontend.scala 221:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291131.4]
  assign _T_759 = _T_757 | _T_758; // @[Frontend.scala 221:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291132.4]
  assign _T_760 = taken_prevRVI_1 & _T_759; // @[Frontend.scala 221:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291133.4]
  assign _T_628 = 16'h9002 == _T_620; // @[Frontend.scala 216:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290997.4]
  assign taken_rvcJALR_1 = _T_628 & _T_623; // @[Frontend.scala 216:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291000.4]
  assign _T_761 = taken_rvcJump_1 | taken_rvcJALR_1; // @[Frontend.scala 222:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291134.4]
  assign _T_762 = _T_761 | taken_rvcJR_1; // @[Frontend.scala 222:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291135.4]
  assign _T_763 = taken_rvcBranch_1 & s2_btb_resp_bits_bht_value; // @[Frontend.scala 222:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291136.4]
  assign _T_764 = _T_762 | _T_763; // @[Frontend.scala 222:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291137.4]
  assign _T_765 = taken_valid_1 & _T_764; // @[Frontend.scala 222:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291138.4]
  assign taken_taken_1 = _T_760 | _T_765; // @[Frontend.scala 221:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291139.4]
  assign taken = taken_taken | taken_taken_1; // @[Frontend.scala 277:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291252.4]
  assign _GEN_115 = _T_229 ? 1'h1 : io_cpu_req_valid; // @[Frontend.scala 307:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291269.8]
  assign _GEN_119 = taken ? _GEN_115 : io_cpu_req_valid; // @[Frontend.scala 303:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291264.6]
  assign s2_redirect = _T_798 ? _GEN_119 : io_cpu_req_valid; // @[Frontend.scala 302:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291263.4]
  assign _T_244 = s2_redirect == 1'h0; // @[Frontend.scala 133:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290466.6]
  assign _T_248 = s2_redirect | tlb_io_resp_miss; // @[Frontend.scala 153:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290488.4]
  assign _T_250 = s2_tlb_resp_cacheable == 1'h0; // @[Frontend.scala 154:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290491.4]
  assign _T_251 = s2_speculative & _T_250; // @[Frontend.scala 154:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290492.4]
  assign _T_255 = _T_254 & s2_valid; // @[Frontend.scala 157:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290498.4]
  assign _T_256 = s2_tlb_resp_miss == 1'h0; // @[Frontend.scala 157:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290499.4]
  assign _T_257 = _T_256 & icache_io_s2_kill; // @[Frontend.scala 157:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290500.4]
  assign _T_258 = icache_io_resp_valid | _T_257; // @[Frontend.scala 157:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290501.4]
  assign _T_260 = io_cpu_req_valid ? io_cpu_req_bits_pc : npc; // @[Frontend.scala 159:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290505.4]
  assign _T_261 = ~ _T_260; // @[Frontend.scala 331:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290506.4]
  assign _T_262 = _T_261 | 40'h1; // @[Frontend.scala 331:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290507.4]
  assign _T_264 = s2_pc[1]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290511.4]
  assign _T_265 = 3'h3 << _T_264; // @[Frontend.scala 162:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290512.4]
  assign _T_266 = icache_io_resp_valid == 1'h0; // @[Frontend.scala 163:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290514.4]
  assign _T_267 = icache_io_s2_kill & _T_266; // @[Frontend.scala 163:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290515.4]
  assign _T_268 = s2_xcpt == 1'h0; // @[Frontend.scala 163:104:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290516.4]
  assign _T_269 = _T_267 & _T_268; // @[Frontend.scala 163:101:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290517.4]
  assign _T_271 = icache_io_resp_valid & icache_io_resp_bits_ae; // @[Frontend.scala 167:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290523.4]
  assign _T_283 = io_cpu_btb_update_valid == 1'h0; // @[Frontend.scala 283:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290571.4]
  assign _T_284 = fq_io_mask[1]; // @[Frontend.scala 284:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290573.6]
  assign fetch_bubble_likely = _T_284 == 1'h0; // @[Frontend.scala 284:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290574.6]
  assign _T_286 = wrong_path == 1'h0; // @[Frontend.scala 285:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290576.6]
  assign _T_287 = _T_229 & _T_286; // @[Frontend.scala 285:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290577.6]
  assign _T_288 = _T_287 & fetch_bubble_likely; // @[Frontend.scala 285:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290578.6]
  assign _T_825 = s2_btb_resp_valid == 1'h0; // @[Frontend.scala 264:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291229.6]
  assign _T_827 = taken_predictBranch_1 & s2_btb_resp_bits_bht_value; // @[Frontend.scala 264:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291231.6]
  assign _T_828 = _T_827 | taken_predictJump_1; // @[Frontend.scala 264:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291232.6]
  assign _T_829 = _T_828 | taken_predictReturn_1; // @[Frontend.scala 264:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291233.6]
  assign _T_830 = _T_825 & _T_829; // @[Frontend.scala 264:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291234.6]
  assign _T_557 = taken_predictBranch & s2_btb_resp_bits_bht_value; // @[Frontend.scala 264:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290906.6]
  assign _T_558 = _T_557 | taken_predictJump; // @[Frontend.scala 264:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290907.6]
  assign _T_559 = _T_558 | taken_predictReturn; // @[Frontend.scala 264:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290908.6]
  assign _T_560 = _T_825 & _T_559; // @[Frontend.scala 264:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290909.6]
  assign _GEN_91 = _T_830 ? 1'h1 : _T_560; // @[Frontend.scala 264:125:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291235.6]
  assign updateBTB = taken_idx ? _GEN_91 : _T_560; // @[Frontend.scala 236:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291163.4]
  assign _T_289 = _T_288 & updateBTB; // @[Frontend.scala 285:89:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290579.6]
  assign _GEN_128 = {{1'd0}, taken_idx}; // @[Frontend.scala 289:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290584.6]
  assign _T_290 = _GEN_128 << 1; // @[Frontend.scala 289:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290584.6]
  assign _GEN_129 = {{38'd0}, _T_290}; // @[Frontend.scala 289:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290585.6]
  assign _T_291 = s2_base_pc | _GEN_129; // @[Frontend.scala 289:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290585.6]
  assign _GEN_35 = _T_283 ? _T_291 : {{1'd0}, io_cpu_btb_update_bits_br_pc}; // @[Frontend.scala 283:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290572.4]
  assign _GEN_36 = _T_283 ? s2_base_pc : {{1'd0}, io_cpu_btb_update_bits_pc}; // @[Frontend.scala 283:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290572.4]
  assign after_idx = taken_idx ? 2'h2 : 2'h1; // @[Frontend.scala 236:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291163.4]
  assign _GEN_130 = {{1'd0}, after_idx}; // @[Frontend.scala 293:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290589.4]
  assign _T_292 = _GEN_130 << 1; // @[Frontend.scala 293:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290589.4]
  assign _GEN_131 = {{37'd0}, _T_292}; // @[Frontend.scala 293:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290590.4]
  assign _T_294 = s2_base_pc + _GEN_131; // @[Frontend.scala 293:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290591.4]
  assign _T_310 = taken_rviJALR | taken_rviJump; // @[Frontend.scala 209:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290617.4]
  assign taken_rviCall = _T_310 & _T_304; // @[Frontend.scala 209:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290619.4]
  assign _T_507 = s2_valid & s2_btb_resp_valid; // @[Frontend.scala 227:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290829.4]
  assign _T_508 = s2_btb_resp_bits_bridx == 1'h0; // @[Frontend.scala 227:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290830.4]
  assign _T_509 = _T_507 & _T_508; // @[Frontend.scala 227:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290831.4]
  assign _T_510 = _T_509 & taken_valid; // @[Frontend.scala 227:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290832.4]
  assign _T_512 = _T_510 & _T_564; // @[Frontend.scala 227:86:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290834.4]
  assign _GEN_38 = _T_512 ? 1'h1 : _T_269; // @[Frontend.scala 227:95:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290835.4]
  assign _GEN_39 = _T_512 ? 1'h1 : wrong_path; // @[Frontend.scala 227:95:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290835.4]
  assign _T_517 = taken_rviCall | taken_rviReturn; // @[Frontend.scala 239:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290847.6]
  assign _T_518 = taken_prevRVI & _T_517; // @[Frontend.scala 239:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290848.6]
  assign _T_519 = taken_rvcJALR | taken_rvcReturn; // @[Frontend.scala 239:127:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290849.6]
  assign _T_520 = taken_valid & _T_519; // @[Frontend.scala 239:115:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290850.6]
  assign _T_521 = _T_518 | _T_520; // @[Frontend.scala 239:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290851.6]
  assign _T_522 = _T_287 & _T_521; // @[Frontend.scala 239:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290852.6]
  assign _T_523 = taken_prevRVI ? taken_rviReturn : taken_rvcReturn; // @[Frontend.scala 240:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290854.6]
  assign _T_524 = taken_prevRVI ? taken_rviCall : taken_rvcJALR; // @[Frontend.scala 241:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290855.6]
  assign _T_525 = taken_prevRVI ? taken_rviBranch : taken_rvcBranch; // @[Frontend.scala 242:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290856.6]
  assign _T_528 = _T_525 ? 1'h0 : 1'h1; // @[Frontend.scala 242:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290859.6]
  assign _T_529 = _T_524 ? 2'h2 : {{1'd0}, _T_528}; // @[Frontend.scala 241:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290860.6]
  assign _T_530 = _T_523 ? 2'h3 : _T_529; // @[Frontend.scala 240:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290861.6]
  assign _T_533 = _T_229 & taken_taken; // @[Frontend.scala 246:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290866.8]
  assign _T_534 = taken_predictBranch == 1'h0; // @[Frontend.scala 246:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290867.8]
  assign _T_535 = _T_533 & _T_534; // @[Frontend.scala 246:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290868.8]
  assign _T_536 = taken_predictJump == 1'h0; // @[Frontend.scala 246:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290869.8]
  assign _T_537 = _T_535 & _T_536; // @[Frontend.scala 246:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290870.8]
  assign _T_538 = taken_predictReturn == 1'h0; // @[Frontend.scala 246:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290871.8]
  assign _T_539 = _T_537 & _T_538; // @[Frontend.scala 246:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290872.8]
  assign _GEN_46 = _T_506 ? _T_287 : 1'h0; // @[Frontend.scala 260:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290897.6]
  assign _T_567 = taken_bits_1[1:0]; // @[Frontend.scala 199:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290923.4]
  assign taken_rvc_1 = _T_567 != 2'h3; // @[Frontend.scala 199:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290924.4]
  assign _T_577 = taken_rviJALR_1 | taken_rviJump_1; // @[Frontend.scala 209:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290939.4]
  assign taken_rviCall_1 = _T_577 & _T_571; // @[Frontend.scala 209:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290941.4]
  assign _T_776 = _T_507 & s2_btb_resp_bits_bridx; // @[Frontend.scala 227:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291153.4]
  assign _T_777 = _T_776 & taken_valid_1; // @[Frontend.scala 227:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291154.4]
  assign _T_778 = taken_rvc_1 == 1'h0; // @[Frontend.scala 227:89:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291155.4]
  assign _T_779 = _T_777 & _T_778; // @[Frontend.scala 227:86:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291156.4]
  assign _T_784 = taken_rviCall_1 | taken_rviReturn_1; // @[Frontend.scala 239:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291169.6]
  assign _T_785 = taken_prevRVI_1 & _T_784; // @[Frontend.scala 239:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291170.6]
  assign _T_786 = taken_rvcJALR_1 | taken_rvcReturn_1; // @[Frontend.scala 239:127:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291171.6]
  assign _T_787 = taken_valid_1 & _T_786; // @[Frontend.scala 239:115:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291172.6]
  assign _T_788 = _T_785 | _T_787; // @[Frontend.scala 239:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291173.6]
  assign _T_789 = _T_287 & _T_788; // @[Frontend.scala 239:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291174.6]
  assign _T_790 = taken_prevRVI_1 ? taken_rviReturn_1 : taken_rvcReturn_1; // @[Frontend.scala 240:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291176.6]
  assign _T_791 = taken_prevRVI_1 ? taken_rviCall_1 : taken_rvcJALR_1; // @[Frontend.scala 241:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291177.6]
  assign _T_792 = taken_prevRVI_1 ? taken_rviBranch_1 : taken_rvcBranch_1; // @[Frontend.scala 242:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291178.6]
  assign _T_795 = _T_792 ? 1'h0 : 1'h1; // @[Frontend.scala 242:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291181.6]
  assign _T_796 = _T_791 ? 2'h2 : {{1'd0}, _T_795}; // @[Frontend.scala 241:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291182.6]
  assign _T_797 = _T_790 ? 2'h3 : _T_796; // @[Frontend.scala 240:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291183.6]
  assign _T_800 = _T_229 & taken_taken_1; // @[Frontend.scala 246:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291188.8]
  assign _T_801 = taken_predictBranch_1 == 1'h0; // @[Frontend.scala 246:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291189.8]
  assign _T_802 = _T_800 & _T_801; // @[Frontend.scala 246:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291190.8]
  assign _T_803 = taken_predictJump_1 == 1'h0; // @[Frontend.scala 246:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291191.8]
  assign _T_804 = _T_802 & _T_803; // @[Frontend.scala 246:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291192.8]
  assign _T_805 = taken_predictReturn_1 == 1'h0; // @[Frontend.scala 246:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291193.8]
  assign _T_806 = _T_804 & _T_805; // @[Frontend.scala 246:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291194.8]
  assign _GEN_82 = _T_773 ? _T_287 : _GEN_46; // @[Frontend.scala 260:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291222.6]
  assign _T_833 = taken_valid_1 & taken_idx; // @[Frontend.scala 272:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291243.6]
  assign _T_835 = _T_833 & _T_778; // @[Frontend.scala 272:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291245.6]
  assign _T_836 = taken_bits_1 | 16'h3; // @[Frontend.scala 274:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291248.8]
  assign _T_838 = s2_btb_taken | taken; // @[Frontend.scala 299:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291257.4]
  assign _T_839 = _T_229 & _T_838; // @[Frontend.scala 299:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291258.4]
  assign _GEN_116 = taken ? taken_idx : s2_btb_resp_bits_bridx; // @[Frontend.scala 303:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291264.6]
  assign _GEN_117 = taken ? 1'h1 : s2_btb_taken; // @[Frontend.scala 303:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291264.6]
  assign _GEN_118 = taken ? 5'h1c : s2_btb_resp_bits_entry; // @[Frontend.scala 303:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291264.6]
  assign _T_842 = s2_partial_insn_valid == 1'h0; // @[Frontend.scala 311:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291274.4]
  assign _T_844 = _T_842 | _T_298; // @[Frontend.scala 311:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291276.4]
  assign _T_846 = _T_844 | reset; // @[Frontend.scala 311:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291278.4]
  assign _T_847 = _T_846 == 1'h0; // @[Frontend.scala 311:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291279.4]
  assign auto_icache_master_out_a_valid = icache_auto_master_out_a_valid; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290380.4]
  assign auto_icache_master_out_a_bits_address = icache_auto_master_out_a_bits_address; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290380.4]
  assign io_cpu_resp_valid = fq_io_deq_valid; // @[Frontend.scala 316:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291290.4]
  assign io_cpu_resp_bits_btb_taken = fq_io_deq_bits_btb_taken; // @[Frontend.scala 316:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291290.4]
  assign io_cpu_resp_bits_btb_bridx = fq_io_deq_bits_btb_bridx; // @[Frontend.scala 316:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291290.4]
  assign io_cpu_resp_bits_btb_entry = fq_io_deq_bits_btb_entry; // @[Frontend.scala 316:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291290.4]
  assign io_cpu_resp_bits_btb_bht_history = fq_io_deq_bits_btb_bht_history; // @[Frontend.scala 316:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291290.4]
  assign io_cpu_resp_bits_pc = fq_io_deq_bits_pc; // @[Frontend.scala 316:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291290.4]
  assign io_cpu_resp_bits_data = fq_io_deq_bits_data; // @[Frontend.scala 316:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291290.4]
  assign io_cpu_resp_bits_xcpt_pf_inst = fq_io_deq_bits_xcpt_pf_inst; // @[Frontend.scala 316:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291290.4]
  assign io_cpu_resp_bits_xcpt_ae_inst = fq_io_deq_bits_xcpt_ae_inst; // @[Frontend.scala 316:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291290.4]
  assign io_cpu_resp_bits_replay = fq_io_deq_bits_replay; // @[Frontend.scala 316:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291290.4]
  assign io_cpu_npc = ~ _T_262; // @[Frontend.scala 159:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290509.4]
  assign io_ptw_req_valid = tlb_io_ptw_req_valid; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign io_ptw_req_bits_valid = tlb_io_ptw_req_bits_valid; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign io_ptw_req_bits_bits_addr = tlb_io_ptw_req_bits_bits_addr; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign icache_clock = gated_clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290378.4 Frontend.scala 91:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290402.4]
  assign icache_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290379.4]
  assign icache_auto_master_out_a_ready = auto_icache_master_out_a_ready; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290380.4]
  assign icache_auto_master_out_d_valid = auto_icache_master_out_d_valid; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290380.4]
  assign icache_auto_master_out_d_bits_opcode = auto_icache_master_out_d_bits_opcode; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290380.4]
  assign icache_auto_master_out_d_bits_size = auto_icache_master_out_d_bits_size; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290380.4]
  assign icache_auto_master_out_d_bits_data = auto_icache_master_out_d_bits_data; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290380.4]
  assign icache_auto_master_out_d_bits_corrupt = auto_icache_master_out_d_bits_corrupt; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290380.4]
  assign icache_io_req_valid = io_cpu_req_valid | _T_208; // @[Frontend.scala 148:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290483.4]
  assign icache_io_req_bits_addr = io_cpu_npc[38:0]; // @[Frontend.scala 149:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290484.4]
  assign icache_io_s1_paddr = tlb_io_resp_paddr; // @[Frontend.scala 151:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290486.4]
  assign icache_io_s1_kill = _T_248 | s2_replay; // @[Frontend.scala 153:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290490.4]
  assign icache_io_s2_kill = _T_251 | s2_xcpt; // @[Frontend.scala 154:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290494.4]
  assign icache_io_invalidate = io_cpu_flush_icache; // @[Frontend.scala 150:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290485.4]
  assign fq_clock = gated_clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290385.4]
  assign fq_reset = reset | io_cpu_req_valid; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290386.4]
  assign fq_io_enq_valid = _T_255 & _T_258; // @[Frontend.scala 157:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290503.4]
  assign fq_io_enq_bits_btb_taken = _T_798 ? _GEN_117 : s2_btb_taken; // @[Frontend.scala 164:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290520.4 Frontend.scala 165:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290521.4 Frontend.scala 305:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291266.8]
  assign fq_io_enq_bits_btb_bridx = _T_798 ? _GEN_116 : s2_btb_resp_bits_bridx; // @[Frontend.scala 164:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290520.4 Frontend.scala 304:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291265.8]
  assign fq_io_enq_bits_btb_entry = _T_798 ? _GEN_118 : s2_btb_resp_bits_entry; // @[Frontend.scala 164:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290520.4 Frontend.scala 306:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291267.8]
  assign fq_io_enq_bits_btb_bht_history = s2_btb_resp_bits_bht_history; // @[Frontend.scala 164:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290520.4]
  assign fq_io_enq_bits_pc = s2_pc; // @[Frontend.scala 158:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290504.4]
  assign fq_io_enq_bits_data = icache_io_resp_bits_data; // @[Frontend.scala 161:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290510.4]
  assign fq_io_enq_bits_mask = _T_265[1:0]; // @[Frontend.scala 162:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290513.4]
  assign fq_io_enq_bits_xcpt_pf_inst = s2_tlb_resp_pf_inst; // @[Frontend.scala 166:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290522.4]
  assign fq_io_enq_bits_xcpt_ae_inst = _T_271 ? 1'h1 : s2_tlb_resp_ae_inst; // @[Frontend.scala 166:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290522.4 Frontend.scala 167:87:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290525.6]
  assign fq_io_enq_bits_replay = _T_779 ? 1'h1 : _GEN_38; // @[Frontend.scala 163:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290519.4 Frontend.scala 231:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290837.6 Frontend.scala 231:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291159.6]
  assign fq_io_deq_ready = io_cpu_resp_ready; // @[Frontend.scala 316:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291290.4]
  assign tlb_clock = gated_clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290406.4]
  assign tlb_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290407.4]
  assign tlb_io_req_valid = s1_valid & _T_243; // @[Frontend.scala 140:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290475.4]
  assign tlb_io_req_bits_vaddr = s1_pc; // @[Frontend.scala 141:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290476.4]
  assign tlb_io_sfence_valid = io_cpu_sfence_valid; // @[Frontend.scala 144:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290479.4]
  assign tlb_io_sfence_bits_rs1 = io_cpu_sfence_bits_rs1; // @[Frontend.scala 144:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290479.4]
  assign tlb_io_sfence_bits_rs2 = io_cpu_sfence_bits_rs2; // @[Frontend.scala 144:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290479.4]
  assign tlb_io_sfence_bits_addr = io_cpu_sfence_bits_addr; // @[Frontend.scala 144:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290479.4]
  assign tlb_io_ptw_req_ready = io_ptw_req_ready; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_valid = io_ptw_resp_valid; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_ae = io_ptw_resp_bits_ae; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_pte_ppn = io_ptw_resp_bits_pte_ppn; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_pte_d = io_ptw_resp_bits_pte_d; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_pte_a = io_ptw_resp_bits_pte_a; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_pte_g = io_ptw_resp_bits_pte_g; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_pte_u = io_ptw_resp_bits_pte_u; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_pte_x = io_ptw_resp_bits_pte_x; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_pte_w = io_ptw_resp_bits_pte_w; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_pte_r = io_ptw_resp_bits_pte_r; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_pte_v = io_ptw_resp_bits_pte_v; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_level = io_ptw_resp_bits_level; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_fragmented_superpage = io_ptw_resp_bits_fragmented_superpage; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_resp_bits_homogeneous = io_ptw_resp_bits_homogeneous; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_ptbr_mode = io_ptw_ptbr_mode; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_status_prv = io_ptw_status_prv; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_0_cfg_l = io_ptw_pmp_0_cfg_l; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_0_cfg_a = io_ptw_pmp_0_cfg_a; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_0_cfg_x = io_ptw_pmp_0_cfg_x; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_0_cfg_w = io_ptw_pmp_0_cfg_w; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_0_cfg_r = io_ptw_pmp_0_cfg_r; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_0_addr = io_ptw_pmp_0_addr; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_0_mask = io_ptw_pmp_0_mask; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_1_cfg_l = io_ptw_pmp_1_cfg_l; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_1_cfg_a = io_ptw_pmp_1_cfg_a; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_1_cfg_x = io_ptw_pmp_1_cfg_x; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_1_cfg_w = io_ptw_pmp_1_cfg_w; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_1_cfg_r = io_ptw_pmp_1_cfg_r; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_1_addr = io_ptw_pmp_1_addr; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_1_mask = io_ptw_pmp_1_mask; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_2_cfg_l = io_ptw_pmp_2_cfg_l; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_2_cfg_a = io_ptw_pmp_2_cfg_a; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_2_cfg_x = io_ptw_pmp_2_cfg_x; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_2_cfg_w = io_ptw_pmp_2_cfg_w; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_2_cfg_r = io_ptw_pmp_2_cfg_r; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_2_addr = io_ptw_pmp_2_addr; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_2_mask = io_ptw_pmp_2_mask; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_3_cfg_l = io_ptw_pmp_3_cfg_l; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_3_cfg_a = io_ptw_pmp_3_cfg_a; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_3_cfg_x = io_ptw_pmp_3_cfg_x; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_3_cfg_w = io_ptw_pmp_3_cfg_w; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_3_cfg_r = io_ptw_pmp_3_cfg_r; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_3_addr = io_ptw_pmp_3_addr; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_3_mask = io_ptw_pmp_3_mask; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_4_cfg_l = io_ptw_pmp_4_cfg_l; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_4_cfg_a = io_ptw_pmp_4_cfg_a; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_4_cfg_x = io_ptw_pmp_4_cfg_x; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_4_cfg_w = io_ptw_pmp_4_cfg_w; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_4_cfg_r = io_ptw_pmp_4_cfg_r; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_4_addr = io_ptw_pmp_4_addr; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_4_mask = io_ptw_pmp_4_mask; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_5_cfg_l = io_ptw_pmp_5_cfg_l; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_5_cfg_a = io_ptw_pmp_5_cfg_a; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_5_cfg_x = io_ptw_pmp_5_cfg_x; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_5_cfg_w = io_ptw_pmp_5_cfg_w; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_5_cfg_r = io_ptw_pmp_5_cfg_r; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_5_addr = io_ptw_pmp_5_addr; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_5_mask = io_ptw_pmp_5_mask; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_6_cfg_l = io_ptw_pmp_6_cfg_l; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_6_cfg_a = io_ptw_pmp_6_cfg_a; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_6_cfg_x = io_ptw_pmp_6_cfg_x; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_6_cfg_w = io_ptw_pmp_6_cfg_w; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_6_cfg_r = io_ptw_pmp_6_cfg_r; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_6_addr = io_ptw_pmp_6_addr; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_6_mask = io_ptw_pmp_6_mask; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_7_cfg_l = io_ptw_pmp_7_cfg_l; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_7_cfg_a = io_ptw_pmp_7_cfg_a; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_7_cfg_x = io_ptw_pmp_7_cfg_x; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_7_cfg_w = io_ptw_pmp_7_cfg_w; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_7_cfg_r = io_ptw_pmp_7_cfg_r; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_7_addr = io_ptw_pmp_7_addr; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_ptw_pmp_7_mask = io_ptw_pmp_7_mask; // @[Frontend.scala 139:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290472.4]
  assign tlb_io_kill = s2_valid == 1'h0; // @[Frontend.scala 145:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290481.4]
  assign btb_clock = gated_clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290529.4]
  assign btb_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290530.4]
  assign btb_io_req_bits_addr = s1_pc[38:0]; // @[Frontend.scala 173:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290533.4]
  assign btb_io_btb_update_valid = _T_283 ? _T_289 : io_cpu_btb_update_valid; // @[Frontend.scala 174:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290534.4 Frontend.scala 285:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290580.6]
  assign btb_io_btb_update_bits_prediction_entry = _T_283 ? 5'h1c : io_cpu_btb_update_bits_prediction_entry; // @[Frontend.scala 174:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290534.4 Frontend.scala 286:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290581.6]
  assign btb_io_btb_update_bits_pc = _GEN_36[38:0]; // @[Frontend.scala 174:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290534.4 Frontend.scala 290:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290587.6]
  assign btb_io_btb_update_bits_isValid = _T_283 ? 1'h1 : io_cpu_btb_update_bits_isValid; // @[Frontend.scala 174:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290534.4 Frontend.scala 287:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290582.6]
  assign btb_io_btb_update_bits_br_pc = _GEN_35[38:0]; // @[Frontend.scala 174:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290534.4 Frontend.scala 289:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290586.6]
  assign btb_io_btb_update_bits_cfiType = _T_283 ? btb_io_ras_update_bits_cfiType : io_cpu_btb_update_bits_cfiType; // @[Frontend.scala 174:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290534.4 Frontend.scala 288:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290583.6]
  assign btb_io_bht_update_valid = io_cpu_bht_update_valid; // @[Frontend.scala 175:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290535.4 Frontend.scala 190:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290556.6]
  assign btb_io_bht_update_bits_prediction_history = io_cpu_bht_update_bits_prediction_history; // @[Frontend.scala 175:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290535.4]
  assign btb_io_bht_update_bits_pc = io_cpu_bht_update_bits_pc; // @[Frontend.scala 175:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290535.4]
  assign btb_io_bht_update_bits_branch = io_cpu_bht_update_bits_branch; // @[Frontend.scala 175:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290535.4]
  assign btb_io_bht_update_bits_taken = io_cpu_bht_update_bits_taken; // @[Frontend.scala 175:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290535.4]
  assign btb_io_bht_update_bits_mispredict = io_cpu_bht_update_bits_mispredict; // @[Frontend.scala 175:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290535.4]
  assign btb_io_bht_advance_valid = taken_idx ? _GEN_82 : _GEN_46; // @[Frontend.scala 177:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290537.4 Frontend.scala 261:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290901.8 Frontend.scala 261:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291226.8]
  assign btb_io_bht_advance_bits_bht_value = s2_btb_resp_bits_bht_value; // @[Frontend.scala 262:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290902.8 Frontend.scala 262:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291227.8]
  assign btb_io_ras_update_valid = taken_idx ? _T_789 : _T_522; // @[Frontend.scala 176:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290536.4 Frontend.scala 239:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290853.6 Frontend.scala 239:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291175.6]
  assign btb_io_ras_update_bits_cfiType = taken_idx ? _T_797 : _T_530; // @[Frontend.scala 240:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290862.6 Frontend.scala 240:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291184.6]
  assign btb_io_ras_update_bits_returnAddr = _T_294[38:0]; // @[Frontend.scala 293:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290592.4]
  assign btb_io_flush = _T_779 ? 1'h1 : _T_512; // @[Frontend.scala 171:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290531.4 Frontend.scala 189:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290553.6 Frontend.scala 230:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290836.6 Frontend.scala 230:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291158.6]
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
  s1_valid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  s1_pc = _RAND_1[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  s1_speculative = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  s2_valid = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{`RANDOM}};
  s2_pc = _RAND_4[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  s2_btb_resp_valid = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  s2_btb_resp_bits_taken = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  s2_btb_resp_bits_bridx = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  s2_btb_resp_bits_entry = _RAND_8[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  s2_btb_resp_bits_bht_history = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  s2_btb_resp_bits_bht_value = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  s2_tlb_resp_miss = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  s2_tlb_resp_pf_inst = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  s2_tlb_resp_ae_inst = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  s2_tlb_resp_cacheable = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  s2_speculative = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  s2_partial_insn_valid = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  s2_partial_insn = _RAND_17[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  wrong_path = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_235 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_254 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge gated_clock) begin
    s1_valid <= io_cpu_req_valid | _T_208;
    s1_pc <= io_cpu_npc;
    if (io_cpu_req_valid) begin
      s1_speculative <= io_cpu_req_bits_speculative;
    end else begin
      if (s2_replay) begin
        s1_speculative <= s2_speculative;
      end else begin
        s1_speculative <= s0_speculative;
      end
    end
    if (reset) begin
      s2_valid <= 1'h0;
    end else begin
      if (_T_243) begin
        s2_valid <= _T_244;
      end else begin
        s2_valid <= 1'h0;
      end
    end
    if (reset) begin
      s2_pc <= {{2'd0}, _T_216};
    end else begin
      if (_T_243) begin
        s2_pc <= s1_pc;
      end
    end
    if (_T_243) begin
      s2_btb_resp_valid <= btb_io_resp_valid;
    end
    if (_T_243) begin
      s2_btb_resp_bits_taken <= btb_io_resp_bits_taken;
    end
    if (_T_243) begin
      s2_btb_resp_bits_bridx <= btb_io_resp_bits_bridx;
    end
    if (_T_243) begin
      s2_btb_resp_bits_entry <= btb_io_resp_bits_entry;
    end
    if (_T_243) begin
      s2_btb_resp_bits_bht_history <= btb_io_resp_bits_bht_history;
    end
    if (_T_243) begin
      s2_btb_resp_bits_bht_value <= btb_io_resp_bits_bht_value;
    end
    if (_T_243) begin
      s2_tlb_resp_miss <= tlb_io_resp_miss;
    end
    if (_T_243) begin
      s2_tlb_resp_pf_inst <= tlb_io_resp_pf_inst;
    end
    if (_T_243) begin
      s2_tlb_resp_ae_inst <= tlb_io_resp_ae_inst;
    end
    if (_T_243) begin
      s2_tlb_resp_cacheable <= tlb_io_resp_cacheable;
    end
    if (reset) begin
      s2_speculative <= 1'h0;
    end else begin
      if (_T_243) begin
        s2_speculative <= s1_speculative;
      end
    end
    if (reset) begin
      s2_partial_insn_valid <= 1'h0;
    end else begin
      if (s2_redirect) begin
        s2_partial_insn_valid <= 1'h0;
      end else begin
        if (_T_839) begin
          s2_partial_insn_valid <= 1'h0;
        end else begin
          if (_T_229) begin
            s2_partial_insn_valid <= _T_835;
          end
        end
      end
    end
    if (_T_229) begin
      if (_T_835) begin
        s2_partial_insn <= _T_836;
      end
    end
    if (io_cpu_req_valid) begin
      wrong_path <= 1'h0;
    end else begin
      if (taken_idx) begin
        if (_T_798) begin
          if (_T_806) begin
            wrong_path <= 1'h1;
          end else begin
            if (_T_779) begin
              wrong_path <= 1'h1;
            end else begin
              if (_T_798) begin
                if (_T_539) begin
                  wrong_path <= 1'h1;
                end else begin
                  if (_T_512) begin
                    wrong_path <= 1'h1;
                  end
                end
              end else begin
                if (_T_512) begin
                  wrong_path <= 1'h1;
                end
              end
            end
          end
        end else begin
          if (_T_779) begin
            wrong_path <= 1'h1;
          end else begin
            if (_T_798) begin
              if (_T_539) begin
                wrong_path <= 1'h1;
              end else begin
                if (_T_512) begin
                  wrong_path <= 1'h1;
                end
              end
            end else begin
              if (_T_512) begin
                wrong_path <= 1'h1;
              end
            end
          end
        end
      end else begin
        if (_T_779) begin
          wrong_path <= 1'h1;
        end else begin
          if (_T_798) begin
            if (_T_539) begin
              wrong_path <= 1'h1;
            end else begin
              wrong_path <= _GEN_39;
            end
          end else begin
            wrong_path <= _GEN_39;
          end
        end
      end
    end
    if (reset) begin
      _T_235 <= 1'h1;
    end else begin
      _T_235 <= _T_233;
    end
    _T_254 <= s1_valid;
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_206) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Frontend.scala:86 assert(!(io.cpu.req.valid || io.cpu.sfence.valid || io.cpu.flush_icache || io.cpu.bht_update.valid || io.cpu.btb_update.valid) || io.cpu.might_request)\n"); // @[Frontend.scala 86:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290399.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_206) begin
          $fatal; // @[Frontend.scala 86:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@290400.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_847) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Frontend.scala:311 assert(!s2_partial_insn_valid || fq.io.enq.bits.mask(0))\n"); // @[Frontend.scala 311:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291281.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_847) begin
          $fatal; // @[Frontend.scala 311:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@291282.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
