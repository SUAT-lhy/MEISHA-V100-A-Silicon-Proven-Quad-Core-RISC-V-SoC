module DCache( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276379.2]
  input         gated_clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276380.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276381.4]
  input         auto_out_a_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output        auto_out_a_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output [2:0]  auto_out_a_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output [2:0]  auto_out_a_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output [2:0]  auto_out_a_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output        auto_out_a_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output [37:0] auto_out_a_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output [7:0]  auto_out_a_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output [63:0] auto_out_a_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output        auto_out_b_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input         auto_out_b_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input  [1:0]  auto_out_b_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input  [2:0]  auto_out_b_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input         auto_out_b_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input  [37:0] auto_out_b_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input         auto_out_c_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output        auto_out_c_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output [2:0]  auto_out_c_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output [2:0]  auto_out_c_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output [2:0]  auto_out_c_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output        auto_out_c_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output [37:0] auto_out_c_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output [63:0] auto_out_c_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output        auto_out_d_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input         auto_out_d_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input  [2:0]  auto_out_d_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input  [1:0]  auto_out_d_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input  [2:0]  auto_out_d_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input         auto_out_d_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input  [2:0]  auto_out_d_bits_sink, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input         auto_out_d_bits_denied, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input  [63:0] auto_out_d_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  input         auto_out_e_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output        auto_out_e_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output [2:0]  auto_out_e_bits_sink, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276382.4]
  output        io_cpu_req_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_cpu_req_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [39:0] io_cpu_req_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [7:0]  io_cpu_req_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [4:0]  io_cpu_req_bits_cmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [2:0]  io_cpu_req_bits_typ, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_cpu_req_bits_phys, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_cpu_s1_kill, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [63:0] io_cpu_s1_data_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [7:0]  io_cpu_s1_data_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_s2_nack, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_cpu_s2_kill, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output [39:0] io_cpu_resp_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output [7:0]  io_cpu_resp_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output [4:0]  io_cpu_resp_bits_cmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output [2:0]  io_cpu_resp_bits_typ, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output [63:0] io_cpu_resp_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_resp_bits_replay, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_resp_bits_has_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output [63:0] io_cpu_resp_bits_data_word_bypass, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output [63:0] io_cpu_resp_bits_store_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_replay_next, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_s2_xcpt_ma_ld, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_s2_xcpt_ma_st, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_s2_xcpt_pf_ld, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_s2_xcpt_pf_st, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_s2_xcpt_ae_ld, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_s2_xcpt_ae_st, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_ordered, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_perf_grant, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_cpu_keep_clock_enabled, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_cpu_clock_enabled, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_req_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_ptw_req_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output        io_ptw_req_bits_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  output [26:0] io_ptw_req_bits_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_resp_bits_ae, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [53:0] io_ptw_resp_bits_pte_ppn, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_resp_bits_pte_d, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_resp_bits_pte_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_resp_bits_pte_g, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_resp_bits_pte_u, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_resp_bits_pte_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_resp_bits_pte_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_resp_bits_pte_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_resp_bits_pte_v, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [1:0]  io_ptw_resp_bits_level, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_resp_bits_fragmented_superpage, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_resp_bits_homogeneous, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [3:0]  io_ptw_ptbr_mode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [1:0]  io_ptw_status_dprv, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_status_mxr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_status_sum, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_0_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [1:0]  io_ptw_pmp_0_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_0_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_0_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_0_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [35:0] io_ptw_pmp_0_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [37:0] io_ptw_pmp_0_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_1_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [1:0]  io_ptw_pmp_1_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_1_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_1_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_1_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [35:0] io_ptw_pmp_1_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [37:0] io_ptw_pmp_1_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_2_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [1:0]  io_ptw_pmp_2_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_2_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_2_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_2_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [35:0] io_ptw_pmp_2_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [37:0] io_ptw_pmp_2_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_3_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [1:0]  io_ptw_pmp_3_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_3_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_3_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_3_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [35:0] io_ptw_pmp_3_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [37:0] io_ptw_pmp_3_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_4_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [1:0]  io_ptw_pmp_4_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_4_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_4_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_4_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [35:0] io_ptw_pmp_4_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [37:0] io_ptw_pmp_4_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_5_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [1:0]  io_ptw_pmp_5_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_5_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_5_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_5_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [35:0] io_ptw_pmp_5_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [37:0] io_ptw_pmp_5_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_6_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [1:0]  io_ptw_pmp_6_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_6_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_6_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_6_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [35:0] io_ptw_pmp_6_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [37:0] io_ptw_pmp_6_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_7_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [1:0]  io_ptw_pmp_7_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_7_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_7_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input         io_ptw_pmp_7_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [35:0] io_ptw_pmp_7_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [37:0] io_ptw_pmp_7_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
  input  [63:0] io_ptw_customCSRs_csrs_0_value // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276383.4]
);
  wire  metaArb_io_in_0_valid; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [39:0] metaArb_io_in_0_bits_addr; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [5:0] metaArb_io_in_0_bits_idx; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [27:0] metaArb_io_in_0_bits_data; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_in_2_valid; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_in_2_bits_write; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [39:0] metaArb_io_in_2_bits_addr; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [5:0] metaArb_io_in_2_bits_idx; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [3:0] metaArb_io_in_2_bits_way_en; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [27:0] metaArb_io_in_2_bits_data; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_in_3_valid; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [39:0] metaArb_io_in_3_bits_addr; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [5:0] metaArb_io_in_3_bits_idx; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [3:0] metaArb_io_in_3_bits_way_en; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [27:0] metaArb_io_in_3_bits_data; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_in_4_ready; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_in_4_valid; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [39:0] metaArb_io_in_4_bits_addr; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [5:0] metaArb_io_in_4_bits_idx; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [3:0] metaArb_io_in_4_bits_way_en; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [27:0] metaArb_io_in_4_bits_data; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_in_5_ready; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_in_5_valid; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [39:0] metaArb_io_in_5_bits_addr; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [5:0] metaArb_io_in_5_bits_idx; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_in_6_ready; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_in_6_valid; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [39:0] metaArb_io_in_6_bits_addr; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [5:0] metaArb_io_in_6_bits_idx; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [3:0] metaArb_io_in_6_bits_way_en; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [27:0] metaArb_io_in_6_bits_data; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_in_7_ready; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_in_7_valid; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [39:0] metaArb_io_in_7_bits_addr; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [5:0] metaArb_io_in_7_bits_idx; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [3:0] metaArb_io_in_7_bits_way_en; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [27:0] metaArb_io_in_7_bits_data; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_out_ready; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_out_valid; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire  metaArb_io_out_bits_write; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [39:0] metaArb_io_out_bits_addr; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [5:0] metaArb_io_out_bits_idx; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [3:0] metaArb_io_out_bits_way_en; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  wire [27:0] metaArb_io_out_bits_data; // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
  reg [27:0] tag_array_0 [0:63]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  reg [31:0] _RAND_0;
  wire [27:0] tag_array_0_s1_meta_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire [5:0] tag_array_0_s1_meta_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire [27:0] tag_array_0__T_553_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire [5:0] tag_array_0__T_553_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire  tag_array_0__T_553_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire  tag_array_0__T_553_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  reg [27:0] tag_array_1 [0:63]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  reg [31:0] _RAND_1;
  wire [27:0] tag_array_1_s1_meta_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire [5:0] tag_array_1_s1_meta_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire [27:0] tag_array_1__T_553_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire [5:0] tag_array_1__T_553_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire  tag_array_1__T_553_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire  tag_array_1__T_553_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  reg [27:0] tag_array_2 [0:63]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  reg [31:0] _RAND_2;
  wire [27:0] tag_array_2_s1_meta_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire [5:0] tag_array_2_s1_meta_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire [27:0] tag_array_2__T_553_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire [5:0] tag_array_2__T_553_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire  tag_array_2__T_553_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire  tag_array_2__T_553_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  reg [27:0] tag_array_3 [0:63]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  reg [31:0] _RAND_3;
  wire [27:0] tag_array_3_s1_meta_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire [5:0] tag_array_3_s1_meta_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire [27:0] tag_array_3__T_553_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire [5:0] tag_array_3__T_553_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire  tag_array_3__T_553_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire  tag_array_3__T_553_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  wire  data_clock; // @[DCache.scala 108:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276415.4]
  wire  data_io_req_valid; // @[DCache.scala 108:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276415.4]
  wire [11:0] data_io_req_bits_addr; // @[DCache.scala 108:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276415.4]
  wire  data_io_req_bits_write; // @[DCache.scala 108:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276415.4]
  wire [63:0] data_io_req_bits_wdata; // @[DCache.scala 108:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276415.4]
  wire [7:0] data_io_req_bits_eccMask; // @[DCache.scala 108:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276415.4]
  wire [3:0] data_io_req_bits_way_en; // @[DCache.scala 108:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276415.4]
  wire [63:0] data_io_resp_0; // @[DCache.scala 108:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276415.4]
  wire [63:0] data_io_resp_1; // @[DCache.scala 108:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276415.4]
  wire [63:0] data_io_resp_2; // @[DCache.scala 108:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276415.4]
  wire [63:0] data_io_resp_3; // @[DCache.scala 108:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276415.4]
  wire  dataArb_io_in_0_valid; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [11:0] dataArb_io_in_0_bits_addr; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire  dataArb_io_in_0_bits_write; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [63:0] dataArb_io_in_0_bits_wdata; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [7:0] dataArb_io_in_0_bits_eccMask; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [3:0] dataArb_io_in_0_bits_way_en; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire  dataArb_io_in_1_ready; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire  dataArb_io_in_1_valid; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [11:0] dataArb_io_in_1_bits_addr; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire  dataArb_io_in_1_bits_write; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [63:0] dataArb_io_in_1_bits_wdata; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [7:0] dataArb_io_in_1_bits_eccMask; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [3:0] dataArb_io_in_1_bits_way_en; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire  dataArb_io_in_2_ready; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire  dataArb_io_in_2_valid; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [11:0] dataArb_io_in_2_bits_addr; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [63:0] dataArb_io_in_2_bits_wdata; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [7:0] dataArb_io_in_2_bits_eccMask; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire  dataArb_io_in_3_ready; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire  dataArb_io_in_3_valid; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [11:0] dataArb_io_in_3_bits_addr; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [63:0] dataArb_io_in_3_bits_wdata; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [7:0] dataArb_io_in_3_bits_eccMask; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire  dataArb_io_out_valid; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [11:0] dataArb_io_out_bits_addr; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire  dataArb_io_out_bits_write; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [63:0] dataArb_io_out_bits_wdata; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [7:0] dataArb_io_out_bits_eccMask; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire [3:0] dataArb_io_out_bits_way_en; // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
  wire  tlb_clock; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_reset; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_req_ready; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_req_valid; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [39:0] tlb_io_req_bits_vaddr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_req_bits_passthrough; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [1:0] tlb_io_req_bits_size; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [4:0] tlb_io_req_bits_cmd; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_resp_miss; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [37:0] tlb_io_resp_paddr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_resp_pf_ld; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_resp_pf_st; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_resp_ae_ld; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_resp_ae_st; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_resp_ma_ld; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_resp_ma_st; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_resp_cacheable; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_sfence_valid; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_sfence_bits_rs1; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_sfence_bits_rs2; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [38:0] tlb_io_sfence_bits_addr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_req_ready; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_req_valid; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_req_bits_valid; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [26:0] tlb_io_ptw_req_bits_bits_addr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_resp_valid; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_resp_bits_ae; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [53:0] tlb_io_ptw_resp_bits_pte_ppn; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_resp_bits_pte_d; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_resp_bits_pte_a; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_resp_bits_pte_g; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_resp_bits_pte_u; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_resp_bits_pte_x; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_resp_bits_pte_w; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_resp_bits_pte_r; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_resp_bits_pte_v; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [1:0] tlb_io_ptw_resp_bits_level; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_resp_bits_fragmented_superpage; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_resp_bits_homogeneous; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [3:0] tlb_io_ptw_ptbr_mode; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [1:0] tlb_io_ptw_status_dprv; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_status_mxr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_status_sum; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_0_cfg_l; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [1:0] tlb_io_ptw_pmp_0_cfg_a; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_0_cfg_x; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_0_cfg_w; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_0_cfg_r; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [35:0] tlb_io_ptw_pmp_0_addr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [37:0] tlb_io_ptw_pmp_0_mask; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_1_cfg_l; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [1:0] tlb_io_ptw_pmp_1_cfg_a; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_1_cfg_x; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_1_cfg_w; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_1_cfg_r; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [35:0] tlb_io_ptw_pmp_1_addr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [37:0] tlb_io_ptw_pmp_1_mask; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_2_cfg_l; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [1:0] tlb_io_ptw_pmp_2_cfg_a; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_2_cfg_x; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_2_cfg_w; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_2_cfg_r; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [35:0] tlb_io_ptw_pmp_2_addr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [37:0] tlb_io_ptw_pmp_2_mask; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_3_cfg_l; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [1:0] tlb_io_ptw_pmp_3_cfg_a; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_3_cfg_x; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_3_cfg_w; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_3_cfg_r; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [35:0] tlb_io_ptw_pmp_3_addr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [37:0] tlb_io_ptw_pmp_3_mask; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_4_cfg_l; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [1:0] tlb_io_ptw_pmp_4_cfg_a; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_4_cfg_x; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_4_cfg_w; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_4_cfg_r; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [35:0] tlb_io_ptw_pmp_4_addr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [37:0] tlb_io_ptw_pmp_4_mask; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_5_cfg_l; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [1:0] tlb_io_ptw_pmp_5_cfg_a; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_5_cfg_x; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_5_cfg_w; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_5_cfg_r; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [35:0] tlb_io_ptw_pmp_5_addr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [37:0] tlb_io_ptw_pmp_5_mask; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_6_cfg_l; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [1:0] tlb_io_ptw_pmp_6_cfg_a; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_6_cfg_x; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_6_cfg_w; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_6_cfg_r; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [35:0] tlb_io_ptw_pmp_6_addr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [37:0] tlb_io_ptw_pmp_6_mask; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_7_cfg_l; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [1:0] tlb_io_ptw_pmp_7_cfg_a; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_7_cfg_x; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_7_cfg_w; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_ptw_pmp_7_cfg_r; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [35:0] tlb_io_ptw_pmp_7_addr; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [37:0] tlb_io_ptw_pmp_7_mask; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire  tlb_io_kill; // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
  wire [7:0] amoalu_io_mask; // @[DCache.scala 743:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280631.4]
  wire [4:0] amoalu_io_cmd; // @[DCache.scala 743:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280631.4]
  wire [63:0] amoalu_io_lhs; // @[DCache.scala 743:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280631.4]
  wire [63:0] amoalu_io_rhs; // @[DCache.scala 743:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280631.4]
  wire [63:0] amoalu_io_out; // @[DCache.scala 743:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280631.4]
  reg  clock_en_reg; // @[DCache.scala 88:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276392.4]
  reg [31:0] _RAND_4;
  reg [15:0] lfsr; // @[LFSR.scala 22:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276397.4]
  reg [31:0] _RAND_5;
  wire  _T_235; // @[LFSR.scala 23:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276399.6]
  wire  _T_236; // @[LFSR.scala 23:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276400.6]
  wire  _T_237; // @[LFSR.scala 23:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276401.6]
  wire  _T_238; // @[LFSR.scala 23:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276402.6]
  wire  _T_239; // @[LFSR.scala 23:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276403.6]
  wire  _T_240; // @[LFSR.scala 23:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276404.6]
  wire  _T_241; // @[LFSR.scala 23:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276405.6]
  wire [14:0] _T_242; // @[LFSR.scala 23:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276406.6]
  wire [15:0] _T_243; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276407.6]
  wire  grantIsUncachedData; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279902.4]
  reg  blockUncachedGrant; // @[DCache.scala 572:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280116.4]
  reg [31:0] _RAND_6;
  reg  s1_valid; // @[DCache.scala 131:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276450.4]
  reg [31:0] _RAND_7;
  wire  _T_3420; // @[DCache.scala 574:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280118.4]
  wire  _T_3421; // @[DCache.scala 574:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280119.4]
  wire  grantIsRefill; // @[DCache.scala 491:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279907.4]
  wire  _T_3331; // @[DCache.scala 544:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280008.4]
  wire  _T_3332; // @[DCache.scala 544:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280009.4]
  wire  _T_3284; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279903.4]
  wire  grantIsCached; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279905.4]
  reg [3:0] _T_3271; // @[Edges.scala 229:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279881.4]
  reg [31:0] _RAND_8;
  wire  d_first; // @[Edges.scala 231:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279885.4]
  wire  _T_3292; // @[DCache.scala 496:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279917.4]
  wire  _T_3293; // @[DCache.scala 496:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279918.4]
  wire  _T_3295; // @[DCache.scala 496:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279920.4]
  wire  _GEN_169; // @[DCache.scala 544:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280010.4]
  wire  tl_out__d_ready; // @[DCache.scala 574:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280120.4]
  wire  _T_3296; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279922.4]
  wire  _T_3275; // @[Edges.scala 232:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279886.4]
  wire  _T_3268; // @[Edges.scala 106:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279879.4]
  wire [13:0] _T_3264; // @[package.scala 185:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279875.4]
  wire [6:0] _T_3265; // @[package.scala 185:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279876.4]
  wire [6:0] _T_3266; // @[package.scala 185:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279877.4]
  wire [3:0] _T_3267; // @[Edges.scala 220:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279878.4]
  wire [3:0] _T_3269; // @[Edges.scala 221:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279880.4]
  wire  _T_3276; // @[Edges.scala 232:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279887.4]
  wire  d_last; // @[Edges.scala 232:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279888.4]
  wire  _GEN_147; // @[DCache.scala 498:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279924.6]
  wire  _GEN_159; // @[DCache.scala 497:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279923.4]
  wire [63:0] _T_256; // @[DCache.scala 112:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276427.4]
  wire [7:0] _T_257; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276428.4]
  wire [7:0] _T_258; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276429.4]
  wire [7:0] _T_259; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276430.4]
  wire [7:0] _T_260; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276431.4]
  wire [7:0] _T_261; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276432.4]
  wire [7:0] _T_262; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276433.4]
  wire [7:0] _T_263; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276434.4]
  wire [7:0] _T_264; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276435.4]
  wire [15:0] _T_265; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276436.4]
  wire [15:0] _T_266; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276437.4]
  wire [31:0] _T_267; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276438.4]
  wire [15:0] _T_268; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276439.4]
  wire [15:0] _T_269; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276440.4]
  wire [31:0] _T_270; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276441.4]
  wire  _T_274; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276449.4]
  reg  s1_probe; // @[DCache.scala 132:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276453.4]
  reg [31:0] _RAND_9;
  reg  s2_probe; // @[DCache.scala 232:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276968.4]
  reg [31:0] _RAND_10;
  wire  _T_720; // @[DCache.scala 233:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276970.4]
  reg [2:0] release_state; // @[DCache.scala 155:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276543.4]
  reg [31:0] _RAND_11;
  wire  _T_721; // @[DCache.scala 233:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276971.4]
  wire  releaseInFlight; // @[DCache.scala 233:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276972.4]
  reg  grantInProgress; // @[DCache.scala 492:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279908.4]
  reg [31:0] _RAND_12;
  wire  _T_3425; // @[DCache.scala 587:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280132.4]
  reg [2:0] blockProbeAfterGrantCount; // @[DCache.scala 493:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279909.4]
  reg [31:0] _RAND_13;
  wire  _T_3426; // @[DCache.scala 587:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280133.4]
  wire  _T_3427; // @[DCache.scala 587:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280134.4]
  reg [6:0] lrscCount; // @[DCache.scala 327:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277626.4]
  reg [31:0] _RAND_14;
  wire  lrscValid; // @[DCache.scala 328:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277627.4]
  wire  block_probe; // @[DCache.scala 587:89:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280135.4]
  wire  _T_3431; // @[DCache.scala 589:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280140.4]
  wire  _T_3432; // @[DCache.scala 589:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280141.4]
  wire  _T_3433; // @[DCache.scala 589:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280142.4]
  wire  _T_3434; // @[DCache.scala 589:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280143.4]
  reg  s2_valid_pre_xcpt; // @[DCache.scala 230:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276958.4]
  reg [31:0] _RAND_15;
  wire [1:0] _T_714; // @[DCache.scala 231:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276962.4]
  wire [2:0] _T_715; // @[DCache.scala 231:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276963.4]
  wire [1:0] _T_712; // @[DCache.scala 231:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276960.4]
  wire [2:0] _T_713; // @[DCache.scala 231:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276961.4]
  wire [5:0] _T_716; // @[DCache.scala 231:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276964.4]
  wire  _T_717; // @[DCache.scala 231:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276965.4]
  wire  _T_718; // @[DCache.scala 231:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276966.4]
  wire  s2_valid; // @[DCache.scala 231:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276967.4]
  wire  _T_3435; // @[DCache.scala 589:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280144.4]
  wire  tl_out__b_ready; // @[DCache.scala 589:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280145.4]
  wire  _T_276; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276452.4]
  reg [1:0] probe_bits_param; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276456.4]
  reg [31:0] _RAND_16;
  reg [2:0] probe_bits_size; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276456.4]
  reg [31:0] _RAND_17;
  reg  probe_bits_source; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276456.4]
  reg [31:0] _RAND_18;
  reg [37:0] probe_bits_address; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276456.4]
  reg [63:0] _RAND_19;
  wire  _T_281; // @[DCache.scala 135:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276470.4]
  wire  s1_valid_masked; // @[DCache.scala 135:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276471.4]
  reg [1:0] s2_probe_state_state; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277170.4]
  reg [31:0] _RAND_20;
  wire [3:0] _T_1055; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277408.4]
  wire  _T_1112; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277465.4]
  wire  _T_1108; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277461.4]
  wire  _T_1104; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277457.4]
  wire  _T_1100; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277453.4]
  wire  _T_1096; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277449.4]
  wire  _T_1092; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277445.4]
  wire  _T_1088; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277441.4]
  wire  _T_1084; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277437.4]
  wire  _T_1080; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277433.4]
  wire  _T_1076; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277429.4]
  wire  _T_1072; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277425.4]
  wire  _T_1068; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277421.4]
  wire  _T_1085; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277438.4]
  wire  _T_1089; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277442.4]
  wire  _T_1093; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277446.4]
  wire  _T_1097; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277450.4]
  wire  _T_1101; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277454.4]
  wire  _T_1105; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277458.4]
  wire  _T_1109; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277462.4]
  wire  s2_prb_ack_data; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277466.4]
  wire  _T_3506; // @[Metadata.scala 50:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280284.10]
  reg [3:0] _T_3449; // @[Edges.scala 229:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280163.4]
  reg [31:0] _RAND_21;
  wire  _T_3453; // @[Edges.scala 232:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280168.4]
  wire  _T_3517; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280337.4]
  wire  _T_3518; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280338.4]
  wire  _T_3519; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280339.4]
  wire  _T_3516; // @[DCache.scala 655:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280330.4]
  wire  _T_3515; // @[DCache.scala 650:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280322.4]
  wire [2:0] _GEN_251; // @[DCache.scala 655:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280331.4]
  wire [2:0] tl_out__c_bits_opcode; // @[DCache.scala 659:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280340.4]
  wire  _T_3446; // @[Edges.scala 102:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280161.4]
  wire [2:0] tl_out__c_bits_size; // @[DCache.scala 659:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280340.4]
  wire [13:0] _T_3442; // @[package.scala 185:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280157.4]
  wire [6:0] _T_3443; // @[package.scala 185:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280158.4]
  wire [6:0] _T_3444; // @[package.scala 185:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280159.4]
  wire [3:0] _T_3445; // @[Edges.scala 220:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280160.4]
  wire [3:0] _T_3447; // @[Edges.scala 221:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280162.4]
  wire  _T_3454; // @[Edges.scala 232:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280169.4]
  wire  c_last; // @[Edges.scala 232:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280170.4]
  wire  _T_3514; // @[DCache.scala 646:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280315.4]
  reg  s2_release_data_valid; // @[DCache.scala 600:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280185.4]
  reg [31:0] _RAND_22;
  wire  _GEN_200; // @[DCache.scala 624:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280280.8]
  wire  _GEN_221; // @[DCache.scala 620:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280272.4]
  wire  _GEN_238; // @[DCache.scala 646:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280316.4]
  wire  tl_out__c_valid; // @[DCache.scala 650:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280323.4]
  wire  _T_3440; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280155.4]
  wire  releaseDone; // @[Edges.scala 233:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280171.4]
  wire  _T_3508; // @[DCache.scala 632:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280293.12]
  wire  _GEN_198; // @[DCache.scala 626:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280285.10]
  wire  probeNack; // @[DCache.scala 624:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280280.8]
  reg [4:0] s1_req_cmd; // @[DCache.scala 137:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276474.4]
  reg [31:0] _RAND_23;
  wire  _T_288; // @[Consts.scala 93:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276488.4]
  wire  _T_289; // @[Consts.scala 93:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276489.4]
  wire  _T_290; // @[Consts.scala 93:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276490.4]
  wire  _T_291; // @[Consts.scala 93:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276491.4]
  wire  _T_292; // @[Consts.scala 93:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276492.4]
  wire  _T_293; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276493.4]
  wire  _T_294; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276494.4]
  wire  _T_297; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276497.4]
  wire  _T_295; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276495.4]
  wire  _T_298; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276498.4]
  wire  _T_296; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276496.4]
  wire  _T_299; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276499.4]
  wire  _T_300; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276500.4]
  wire  _T_301; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276501.4]
  wire  _T_305; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276505.4]
  wire  _T_302; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276502.4]
  wire  _T_306; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276506.4]
  wire  _T_303; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276503.4]
  wire  _T_307; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276507.4]
  wire  _T_304; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276504.4]
  wire  _T_308; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276508.4]
  wire  _T_309; // @[Consts.scala 91:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276509.4]
  wire  s1_read; // @[Consts.scala 93:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276510.4]
  reg  _T_724; // @[DCache.scala 234:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276974.4]
  reg [31:0] _RAND_24;
  wire  s2_valid_masked; // @[DCache.scala 234:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276976.4]
  reg [4:0] s2_req_cmd; // @[DCache.scala 236:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276979.4]
  reg [31:0] _RAND_25;
  wire  _T_735; // @[Consts.scala 93:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276997.4]
  wire  _T_736; // @[Consts.scala 93:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276998.4]
  wire  _T_737; // @[Consts.scala 93:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276999.4]
  wire  _T_738; // @[Consts.scala 93:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277000.4]
  wire  _T_739; // @[Consts.scala 93:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277001.4]
  wire  _T_740; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277002.4]
  wire  _T_741; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277003.4]
  wire  _T_744; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277006.4]
  wire  _T_742; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277004.4]
  wire  _T_745; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277007.4]
  wire  _T_743; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277005.4]
  wire  _T_746; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277008.4]
  wire  _T_747; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277009.4]
  wire  _T_748; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277010.4]
  wire  _T_752; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277014.4]
  wire  _T_749; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277011.4]
  wire  _T_753; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277015.4]
  wire  _T_750; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277012.4]
  wire  _T_754; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277016.4]
  wire  _T_751; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277013.4]
  wire  _T_755; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277017.4]
  wire  _T_756; // @[Consts.scala 91:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277018.4]
  wire  s2_read; // @[Consts.scala 93:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277019.4]
  wire  _T_757; // @[Consts.scala 94:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277020.4]
  wire  _T_758; // @[Consts.scala 94:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277021.4]
  wire  _T_759; // @[Consts.scala 94:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277022.4]
  wire  _T_761; // @[Consts.scala 94:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277024.4]
  wire  s2_write; // @[Consts.scala 94:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277042.4]
  wire  s2_readwrite; // @[DCache.scala 247:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277043.4]
  wire  _T_1019; // @[DCache.scala 282:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277354.4]
  wire  _T_912; // @[Consts.scala 95:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277236.4]
  wire  _T_913; // @[Consts.scala 95:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277237.4]
  wire  _T_915; // @[Consts.scala 95:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277239.4]
  wire [1:0] _T_916; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277240.4]
  reg [1:0] s2_hit_state_state; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277179.4]
  reg [31:0] _RAND_26;
  wire [3:0] _T_917; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277241.4]
  wire  _T_975; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277299.4]
  wire  _T_972; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277296.4]
  wire  _T_969; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277293.4]
  wire  _T_966; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277290.4]
  wire  _T_963; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277287.4]
  wire  _T_960; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277284.4]
  wire  _T_957; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277281.4]
  wire  _T_954; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277278.4]
  wire  _T_951; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277275.4]
  wire  _T_948; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277272.4]
  wire  _T_945; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277269.4]
  wire  _T_942; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277266.4]
  wire  _T_961; // @[Misc.scala 37:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277285.4]
  wire  _T_964; // @[Misc.scala 37:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277288.4]
  wire  _T_967; // @[Misc.scala 37:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277291.4]
  wire  _T_970; // @[Misc.scala 37:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277294.4]
  wire  _T_973; // @[Misc.scala 37:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277297.4]
  wire  s2_hit; // @[Misc.scala 37:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277300.4]
  wire  s2_valid_hit_pre_data_ecc; // @[DCache.scala 282:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277357.4]
  wire  _T_1403; // @[DCache.scala 345:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277841.4]
  reg [33:0] lrscAddr; // @[DCache.scala 330:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277631.4]
  reg [63:0] _RAND_27;
  reg [39:0] s2_req_addr; // @[DCache.scala 236:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276979.4]
  reg [63:0] _RAND_28;
  wire [33:0] _T_1240; // @[DCache.scala 331:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277632.4]
  wire  lrscAddrMatch; // @[DCache.scala 331:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277633.4]
  wire  _T_1241; // @[DCache.scala 332:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277634.4]
  wire  _T_1242; // @[DCache.scala 332:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277635.4]
  wire  s2_sc_fail; // @[DCache.scala 332:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277636.4]
  wire  _T_1404; // @[DCache.scala 345:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277842.4]
  wire  _T_1405; // @[DCache.scala 345:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277843.4]
  reg  pstore1_held; // @[DCache.scala 359:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277838.4]
  reg [31:0] _RAND_29;
  wire  pstore1_valid_pre_kill; // @[DCache.scala 361:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277844.4]
  reg [39:0] pstore1_addr; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277679.4]
  reg [63:0] _RAND_30;
  wire [8:0] _T_1575; // @[DCache.scala 414:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278063.4]
  reg [39:0] s1_req_addr; // @[DCache.scala 137:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276474.4]
  reg [63:0] _RAND_31;
  wire [8:0] _T_1576; // @[DCache.scala 414:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278064.4]
  wire  _T_1577; // @[DCache.scala 414:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278065.4]
  wire  _T_310; // @[Consts.scala 94:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276511.4]
  wire  _T_311; // @[Consts.scala 94:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276512.4]
  wire  _T_312; // @[Consts.scala 94:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276513.4]
  wire  _T_314; // @[Consts.scala 94:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276515.4]
  wire  s1_write; // @[Consts.scala 94:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276533.4]
  reg [7:0] pstore1_mask; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277694.4]
  reg [31:0] _RAND_32;
  wire  _T_1585; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278073.4]
  wire  _T_1584; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278072.4]
  wire [1:0] _T_1598; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278086.4]
  wire  _T_1583; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278071.4]
  wire  _T_1582; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278070.4]
  wire [1:0] _T_1597; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278085.4]
  wire [3:0] _T_1599; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278087.4]
  wire  _T_1581; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278069.4]
  wire  _T_1580; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278068.4]
  wire [1:0] _T_1595; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278083.4]
  wire  _T_1579; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278067.4]
  wire  _T_1578; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278066.4]
  wire [1:0] _T_1594; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278082.4]
  wire [3:0] _T_1596; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278084.4]
  wire [7:0] _T_1600; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278088.4]
  wire  _T_1608; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278096.4]
  wire  _T_1607; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278095.4]
  wire [1:0] _T_1613; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278101.4]
  wire  _T_1606; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278094.4]
  wire  _T_1605; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278093.4]
  wire [1:0] _T_1612; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278100.4]
  wire [3:0] _T_1614; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278102.4]
  wire  _T_1604; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278092.4]
  wire  _T_1603; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278091.4]
  wire [1:0] _T_1610; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278098.4]
  wire  _T_1602; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278090.4]
  wire  _T_1601; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278089.4]
  wire [1:0] _T_1609; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278097.4]
  wire [3:0] _T_1611; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278099.4]
  wire [7:0] _T_1615; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278103.4]
  wire  _T_701; // @[AMOALU.scala 17:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276947.4]
  wire  _T_693; // @[AMOALU.scala 17:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276939.4]
  wire  _T_685; // @[AMOALU.scala 17:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276931.4]
  reg [2:0] s1_req_typ; // @[DCache.scala 137:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276474.4]
  reg [31:0] _RAND_33;
  wire [1:0] _T_684; // @[AMOALU.scala 10:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276930.4]
  wire  _T_687; // @[AMOALU.scala 17:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276933.4]
  wire  _T_689; // @[AMOALU.scala 17:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276935.4]
  wire  _T_691; // @[AMOALU.scala 18:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276937.4]
  wire [1:0] _T_692; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276938.4]
  wire [1:0] _T_694; // @[AMOALU.scala 17:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276940.4]
  wire  _T_695; // @[AMOALU.scala 17:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276941.4]
  wire [1:0] _T_696; // @[AMOALU.scala 17:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276942.4]
  wire [1:0] _T_697; // @[AMOALU.scala 17:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276943.4]
  wire [1:0] _T_699; // @[AMOALU.scala 18:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276945.4]
  wire [3:0] _T_700; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276946.4]
  wire [3:0] _T_702; // @[AMOALU.scala 17:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276948.4]
  wire  _T_703; // @[AMOALU.scala 17:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276949.4]
  wire [3:0] _T_704; // @[AMOALU.scala 17:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276950.4]
  wire [3:0] _T_705; // @[AMOALU.scala 17:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276951.4]
  wire [3:0] _T_707; // @[AMOALU.scala 18:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276953.4]
  wire [7:0] _T_708; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276954.4]
  wire [7:0] s1_mask; // @[DCache.scala 228:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276955.4]
  wire  _T_1623; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278111.4]
  wire  _T_1622; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278110.4]
  wire [1:0] _T_1636; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278124.4]
  wire  _T_1621; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278109.4]
  wire  _T_1620; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278108.4]
  wire [1:0] _T_1635; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278123.4]
  wire [3:0] _T_1637; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278125.4]
  wire  _T_1619; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278107.4]
  wire  _T_1618; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278106.4]
  wire [1:0] _T_1633; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278121.4]
  wire  _T_1617; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278105.4]
  wire  _T_1616; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278104.4]
  wire [1:0] _T_1632; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278120.4]
  wire [3:0] _T_1634; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278122.4]
  wire [7:0] _T_1638; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278126.4]
  wire  _T_1646; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278134.4]
  wire  _T_1645; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278133.4]
  wire [1:0] _T_1651; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278139.4]
  wire  _T_1644; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278132.4]
  wire  _T_1643; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278131.4]
  wire [1:0] _T_1650; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278138.4]
  wire [3:0] _T_1652; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278140.4]
  wire  _T_1642; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278130.4]
  wire  _T_1641; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278129.4]
  wire [1:0] _T_1648; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278136.4]
  wire  _T_1640; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278128.4]
  wire  _T_1639; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278127.4]
  wire [1:0] _T_1647; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278135.4]
  wire [3:0] _T_1649; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278137.4]
  wire [7:0] _T_1653; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278141.4]
  wire [7:0] _T_1654; // @[DCache.scala 415:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278142.4]
  wire  _T_1655; // @[DCache.scala 415:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278143.4]
  wire [7:0] _T_1656; // @[DCache.scala 415:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278144.4]
  wire  _T_1657; // @[DCache.scala 415:84:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278145.4]
  wire  _T_1658; // @[DCache.scala 415:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278146.4]
  wire  _T_1659; // @[DCache.scala 414:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278147.4]
  wire  _T_1660; // @[DCache.scala 417:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278148.4]
  reg  pstore2_valid; // @[DCache.scala 356:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277767.4]
  reg [31:0] _RAND_34;
  reg [39:0] pstore2_addr; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277916.4]
  reg [63:0] _RAND_35;
  wire [8:0] _T_1661; // @[DCache.scala 414:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278149.4]
  wire  _T_1663; // @[DCache.scala 414:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278151.4]
  reg [7:0] mask; // @[DCache.scala 387:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277996.4]
  reg [31:0] _RAND_36;
  wire  _T_1671; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278159.4]
  wire  _T_1670; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278158.4]
  wire [1:0] _T_1684; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278172.4]
  wire  _T_1669; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278157.4]
  wire  _T_1668; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278156.4]
  wire [1:0] _T_1683; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278171.4]
  wire [3:0] _T_1685; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278173.4]
  wire  _T_1667; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278155.4]
  wire  _T_1666; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278154.4]
  wire [1:0] _T_1681; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278169.4]
  wire  _T_1665; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278153.4]
  wire  _T_1664; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278152.4]
  wire [1:0] _T_1680; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278168.4]
  wire [3:0] _T_1682; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278170.4]
  wire [7:0] _T_1686; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278174.4]
  wire  _T_1694; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278182.4]
  wire  _T_1693; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278181.4]
  wire [1:0] _T_1699; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278187.4]
  wire  _T_1692; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278180.4]
  wire  _T_1691; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278179.4]
  wire [1:0] _T_1698; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278186.4]
  wire [3:0] _T_1700; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278188.4]
  wire  _T_1690; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278178.4]
  wire  _T_1689; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278177.4]
  wire [1:0] _T_1696; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278184.4]
  wire  _T_1688; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278176.4]
  wire  _T_1687; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278175.4]
  wire [1:0] _T_1695; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278183.4]
  wire [3:0] _T_1697; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278185.4]
  wire [7:0] _T_1701; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278189.4]
  wire [7:0] _T_1740; // @[DCache.scala 415:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278228.4]
  wire  _T_1741; // @[DCache.scala 415:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278229.4]
  wire [7:0] _T_1742; // @[DCache.scala 415:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278230.4]
  wire  _T_1743; // @[DCache.scala 415:84:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278231.4]
  wire  _T_1744; // @[DCache.scala 415:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278232.4]
  wire  _T_1745; // @[DCache.scala 414:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278233.4]
  wire  _T_1746; // @[DCache.scala 418:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278234.4]
  wire  s1_hazard; // @[DCache.scala 417:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278235.4]
  wire  s1_raw_hazard; // @[DCache.scala 419:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278236.4]
  wire  _T_1747; // @[DCache.scala 424:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278238.4]
  wire [1:0] _T_944; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277268.4]
  wire [1:0] _T_947; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277271.4]
  wire [1:0] _T_950; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277274.4]
  wire [1:0] _T_953; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277277.4]
  wire [1:0] _T_956; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277280.4]
  wire [1:0] _T_959; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277283.4]
  wire [1:0] _T_962; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277286.4]
  wire [1:0] _T_965; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277289.4]
  wire [1:0] _T_968; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277292.4]
  wire [1:0] _T_971; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277295.4]
  wire [1:0] _T_974; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277298.4]
  wire [1:0] s2_grow_param; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277301.4]
  wire  _T_1181; // @[Metadata.scala 46:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277542.4]
  wire  s2_update_meta; // @[Metadata.scala 47:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277543.4]
  wire  _T_1187; // @[DCache.scala 301:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277550.4]
  wire  _T_1188; // @[DCache.scala 301:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277551.4]
  wire  s1_readwrite; // @[DCache.scala 146:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276534.4]
  wire  _T_529; // @[DCache.scala 193:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276758.4]
  wire  _T_530; // @[DCache.scala 193:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276759.4]
  wire  _GEN_74; // @[DCache.scala 301:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277552.4]
  wire  _GEN_98; // @[DCache.scala 424:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278239.4]
  wire  _GEN_219; // @[DCache.scala 635:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280298.6]
  wire  s1_nack; // @[DCache.scala 620:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280272.4]
  wire  _T_282; // @[DCache.scala 136:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276472.4]
  wire  s1_valid_not_nacked; // @[DCache.scala 136:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276473.4]
  reg [7:0] s1_req_tag; // @[DCache.scala 137:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276474.4]
  reg [31:0] _RAND_37;
  reg  s1_req_phys; // @[DCache.scala 137:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276474.4]
  reg [31:0] _RAND_38;
  wire  _T_283; // @[DCache.scala 138:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276475.4]
  wire  s0_clk_en; // @[DCache.scala 138:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276476.4]
  wire [33:0] _T_284; // @[DCache.scala 141:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276479.6]
  wire [5:0] _T_285; // @[DCache.scala 141:86:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276480.6]
  wire [39:0] _T_286; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276481.6]
  wire  _T_287; // @[DCache.scala 142:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276483.6]
  wire  s1_sfence; // @[DCache.scala 147:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276535.4]
  reg  s1_flush_valid; // @[DCache.scala 148:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276536.4]
  reg [31:0] _RAND_39;
  reg  cached_grant_wait; // @[DCache.scala 152:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276539.4]
  reg [31:0] _RAND_40;
  reg  release_ack_wait; // @[DCache.scala 153:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276540.4]
  reg [31:0] _RAND_41;
  wire  can_acquire_before_release; // @[DCache.scala 154:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276541.4]
  wire  inWriteback; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276548.4]
  wire  _T_343; // @[DCache.scala 159:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276551.4]
  wire  _T_344; // @[DCache.scala 159:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276552.4]
  wire  _T_345; // @[DCache.scala 159:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276553.4]
  wire  _T_347; // @[DCache.scala 159:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276555.4]
  reg  uncachedInFlight_0; // @[DCache.scala 162:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276560.4]
  reg [31:0] _RAND_42;
  reg [39:0] uncachedReqs_0_addr; // @[DCache.scala 163:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276561.4]
  reg [63:0] _RAND_43;
  reg [7:0] uncachedReqs_0_tag; // @[DCache.scala 163:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276561.4]
  reg [31:0] _RAND_44;
  reg [2:0] uncachedReqs_0_typ; // @[DCache.scala 163:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276561.4]
  reg [31:0] _RAND_45;
  wire  _T_374; // @[Consts.scala 93:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276562.4]
  wire  _T_375; // @[Consts.scala 93:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276563.4]
  wire  _T_376; // @[Consts.scala 93:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276564.4]
  wire  _T_377; // @[Consts.scala 93:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276565.4]
  wire  _T_378; // @[Consts.scala 93:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276566.4]
  wire  _T_379; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276567.4]
  wire  _T_380; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276568.4]
  wire  _T_381; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276569.4]
  wire  _T_382; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276570.4]
  wire  _T_383; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276571.4]
  wire  _T_384; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276572.4]
  wire  _T_385; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276573.4]
  wire  _T_386; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276574.4]
  wire  _T_387; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276575.4]
  wire  _T_388; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276576.4]
  wire  _T_389; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276577.4]
  wire  _T_390; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276578.4]
  wire  _T_391; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276579.4]
  wire  _T_392; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276580.4]
  wire  _T_393; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276581.4]
  wire  _T_394; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276582.4]
  wire  _T_395; // @[Consts.scala 91:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276583.4]
  wire  s0_read; // @[Consts.scala 93:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276584.4]
  wire  _T_396; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276585.4]
  wire  _T_397; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276586.4]
  wire  _T_398; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276587.4]
  wire  res; // @[DCache.scala 912:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276588.4]
  wire  _T_426; // @[Consts.scala 94:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276616.4]
  wire  _T_427; // @[Consts.scala 94:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276617.4]
  wire  _T_429; // @[Consts.scala 94:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276619.4]
  wire  _T_447; // @[Consts.scala 94:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276637.4]
  wire  _T_452; // @[DCache.scala 918:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276642.4]
  wire  _T_453; // @[DCache.scala 917:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276643.4]
  wire  _T_454; // @[DCache.scala 913:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276644.4]
  wire  _T_455; // @[DCache.scala 913:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276645.4]
  wire  _T_457; // @[DCache.scala 913:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276647.4]
  wire  _T_458; // @[DCache.scala 913:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276648.4]
  wire  _T_459; // @[DCache.scala 167:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276653.4]
  wire  _T_462; // @[DCache.scala 173:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276662.4]
  wire  _T_463; // @[DCache.scala 173:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276663.4]
  wire  _GEN_16; // @[DCache.scala 173:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276664.4]
  wire  _GEN_18; // @[DCache.scala 181:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276733.4]
  wire  _T_524; // @[DCache.scala 192:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276750.4]
  wire  _T_525; // @[DCache.scala 192:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276751.4]
  wire  _T_526; // @[DCache.scala 192:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276752.4]
  wire  _T_527; // @[DCache.scala 192:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276753.4]
  wire  _T_528; // @[DCache.scala 192:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276754.4]
  wire  _GEN_19; // @[DCache.scala 192:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276755.4]
  wire [1:0] s1_victim_way; // @[Replacement.scala 19:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276773.4]
  wire [5:0] _GEN_29; // @[DCache.scala 213:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276778.4]
  wire  _GEN_41; // @[DCache.scala 217:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276808.4]
  wire [27:0] _T_586; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276816.4 :sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276818.4]
  wire [25:0] _T_587; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276819.4]
  wire [1:0] _T_588; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276821.4]
  wire [27:0] _T_593; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276825.4 :sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276827.4]
  wire [25:0] _T_594; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276828.4]
  wire [1:0] _T_595; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276830.4]
  wire [27:0] _T_600; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276834.4 :sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276836.4]
  wire [25:0] _T_601; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276837.4]
  wire [1:0] _T_602; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276839.4]
  wire [27:0] _T_607; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276843.4 :sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276845.4]
  wire [25:0] _T_608; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276846.4]
  wire [1:0] _T_609; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276848.4]
  wire [25:0] s1_tag; // @[DCache.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276850.4]
  wire  _T_610; // @[Metadata.scala 50:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276851.4]
  wire  _T_611; // @[DCache.scala 220:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276852.4]
  wire  _T_612; // @[DCache.scala 220:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276853.4]
  wire  _T_613; // @[Metadata.scala 50:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276854.4]
  wire  _T_614; // @[DCache.scala 220:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276855.4]
  wire  _T_615; // @[DCache.scala 220:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276856.4]
  wire  _T_616; // @[Metadata.scala 50:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276857.4]
  wire  _T_617; // @[DCache.scala 220:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276858.4]
  wire  _T_618; // @[DCache.scala 220:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276859.4]
  wire  _T_619; // @[Metadata.scala 50:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276860.4]
  wire  _T_620; // @[DCache.scala 220:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276861.4]
  wire  _T_621; // @[DCache.scala 220:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276862.4]
  wire [1:0] _T_622; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276863.4]
  wire [1:0] _T_623; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276864.4]
  wire [3:0] s1_meta_hit_way; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276865.4]
  wire  _T_627; // @[DCache.scala 222:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276870.4]
  wire  _T_628; // @[DCache.scala 222:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276871.4]
  wire [1:0] _T_629; // @[DCache.scala 222:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276872.4]
  wire  _T_632; // @[DCache.scala 222:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276875.4]
  wire [1:0] _T_633; // @[DCache.scala 222:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276876.4]
  wire  _T_636; // @[DCache.scala 222:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276879.4]
  wire [1:0] _T_637; // @[DCache.scala 222:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276880.4]
  wire  _T_640; // @[DCache.scala 222:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276883.4]
  wire [1:0] _T_641; // @[DCache.scala 222:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276884.4]
  wire [1:0] _T_642; // @[DCache.scala 223:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276885.4]
  wire [1:0] _T_643; // @[DCache.scala 223:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276886.4]
  wire [1:0] s1_meta_hit_state_state; // @[DCache.scala 223:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276887.4]
  wire  _T_651; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276897.4]
  wire  _T_653; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276899.4]
  wire  _T_655; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276901.4]
  wire  s2_hit_valid; // @[Metadata.scala 50:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277189.4]
  reg [3:0] s2_hit_way; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277174.4]
  reg [31:0] _RAND_46;
  reg [1:0] _T_1046; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277389.4]
  reg [31:0] _RAND_47;
  wire [3:0] _T_1047; // @[OneHot.scala 45:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277393.4]
  wire [3:0] s2_victim_way; // @[DCache.scala 292:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277394.4]
  reg [3:0] s2_probe_way; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277166.4]
  reg [31:0] _RAND_48;
  wire [3:0] releaseWay; // @[DCache.scala 659:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280340.4]
  wire [3:0] _T_656; // @[DCache.scala 226:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276903.4]
  wire [7:0] _T_658; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276907.4]
  wire [7:0] _T_659; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276908.4]
  wire [7:0] _T_660; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276909.4]
  wire [7:0] _T_661; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276910.4]
  wire [7:0] _T_662; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276911.4]
  wire [7:0] _T_663; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276912.4]
  wire [7:0] _T_664; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276913.4]
  wire [7:0] _T_665; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276914.4]
  wire [15:0] _T_666; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276915.4]
  wire [15:0] _T_667; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276916.4]
  wire [31:0] _T_668; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276917.4]
  wire [15:0] _T_669; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276918.4]
  wire [15:0] _T_670; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276919.4]
  wire [31:0] _T_671; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276920.4]
  wire [63:0] s1_all_data_ways_4; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276921.4]
  wire  _T_709; // @[DCache.scala 230:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276956.4]
  wire  _T_710; // @[DCache.scala 230:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276957.4]
  wire  _T_725; // @[DCache.scala 235:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276977.4]
  wire  s2_valid_not_killed; // @[DCache.scala 235:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276978.4]
  reg [7:0] s2_req_tag; // @[DCache.scala 236:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276979.4]
  reg [31:0] _RAND_49;
  reg [2:0] s2_req_typ; // @[DCache.scala 236:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276979.4]
  reg [31:0] _RAND_50;
  reg  s2_uncached; // @[DCache.scala 237:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276980.4]
  reg [31:0] _RAND_51;
  reg [39:0] s2_uncached_resp_addr; // @[DCache.scala 238:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276981.4]
  reg [63:0] _RAND_52;
  wire  _T_728; // @[DCache.scala 239:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276982.4]
  wire  _T_729; // @[DCache.scala 242:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276986.6]
  reg [39:0] _T_732; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276990.4]
  reg [63:0] _RAND_53;
  wire [27:0] _T_733; // @[DCache.scala 244:84:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276994.4]
  wire [11:0] _T_734; // @[DCache.scala 244:109:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276995.4]
  wire [39:0] s2_vaddr; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276996.4]
  reg  s2_flush_valid_pre_tag_ecc; // @[DCache.scala 248:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277044.4]
  reg [31:0] _RAND_54;
  wire  en; // @[DCache.scala 258:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277143.4]
  wire  _T_3281; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279898.4]
  wire  _T_3283; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279900.4]
  wire  _T_3282; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279899.4]
  wire  grantIsUncached; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279901.4]
  wire [4:0] _GEN_129; // @[DCache.scala 516:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279959.10]
  wire [4:0] _GEN_137; // @[DCache.scala 507:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279941.8]
  wire [4:0] _GEN_149; // @[DCache.scala 498:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279924.6]
  wire [4:0] s1_data_way; // @[DCache.scala 497:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279923.4]
  wire  _T_839; // @[Mux.scala 21:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277144.4]
  wire  _T_840; // @[Mux.scala 21:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277145.4]
  wire  _T_841; // @[Mux.scala 21:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277146.4]
  wire  _T_842; // @[Mux.scala 21:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277147.4]
  wire  _T_843; // @[Mux.scala 21:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277148.4]
  wire [63:0] s1_all_data_ways_0; // @[DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276922.4 DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276924.4]
  wire [63:0] _T_845; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277149.4]
  wire [63:0] s1_all_data_ways_1; // @[DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276922.4 DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276925.4]
  wire [63:0] _T_846; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277150.4]
  wire [63:0] s1_all_data_ways_2; // @[DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276922.4 DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276926.4]
  wire [63:0] _T_847; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277151.4]
  wire [63:0] s1_all_data_ways_3; // @[DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276922.4 DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276927.4]
  wire [63:0] _T_848; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277152.4]
  wire [63:0] _T_849; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277153.4]
  wire [63:0] _T_850; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277154.4]
  wire [63:0] _T_851; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277155.4]
  wire [63:0] _T_852; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277156.4]
  wire [63:0] _T_853; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277157.4]
  wire  _T_857; // @[DCache.scala 264:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277161.4]
  reg [63:0] s2_data; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277162.4]
  reg [63:0] _RAND_55;
  wire [7:0] _T_977; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277305.4]
  wire [7:0] _T_978; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277306.4]
  wire [7:0] _T_979; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277307.4]
  wire [7:0] _T_980; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277308.4]
  wire [7:0] _T_981; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277309.4]
  wire [7:0] _T_982; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277310.4]
  wire [7:0] _T_983; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277311.4]
  wire [7:0] _T_984; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277312.4]
  wire [15:0] _T_1007; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277340.4]
  wire [15:0] _T_1008; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277341.4]
  wire [31:0] _T_1009; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277342.4]
  wire [15:0] _T_1010; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277343.4]
  wire [15:0] _T_1011; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277344.4]
  wire [31:0] _T_1012; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277345.4]
  wire [63:0] s2_data_corrected; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277346.4]
  wire  _T_1030; // @[DCache.scala 285:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277368.4]
  wire  _T_1031; // @[DCache.scala 285:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277369.4]
  wire  s2_valid_miss; // @[DCache.scala 285:84:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277370.4]
  wire  _T_1032; // @[DCache.scala 286:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277371.4]
  wire  _T_1033; // @[DCache.scala 286:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277372.4]
  wire  _T_1035; // @[DCache.scala 286:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277374.4]
  wire  s2_valid_cached_miss; // @[DCache.scala 286:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277375.4]
  wire  s2_want_victimize; // @[DCache.scala 288:102:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277377.4]
  wire  _T_1038; // @[DCache.scala 289:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277379.4]
  wire  s2_cannot_victimize; // @[DCache.scala 289:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277380.4]
  wire  _T_1039; // @[DCache.scala 290:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277381.4]
  wire  s2_victimize; // @[DCache.scala 290:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277382.4]
  wire  _T_1040; // @[DCache.scala 291:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277383.4]
  wire  _T_1041; // @[DCache.scala 291:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277384.4]
  wire  _T_1042; // @[DCache.scala 291:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277385.4]
  wire  _T_1043; // @[DCache.scala 291:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277386.4]
  wire  s2_valid_uncached_pending; // @[DCache.scala 291:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277387.4]
  reg [25:0] s2_victim_tag; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277397.4]
  reg [31:0] _RAND_56;
  reg [1:0] _T_1054_state; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277403.4]
  reg [31:0] _RAND_57;
  wire [1:0] s2_victim_state_state; // @[DCache.scala 294:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277407.4]
  wire [2:0] _T_1070; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277423.4]
  wire [2:0] _T_1074; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277427.4]
  wire [2:0] _T_1078; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277431.4]
  wire [2:0] _T_1082; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277435.4]
  wire [2:0] _T_1086; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277439.4]
  wire [2:0] _T_1090; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277443.4]
  wire [1:0] _T_1091; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277444.4]
  wire [2:0] _T_1094; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277447.4]
  wire [1:0] _T_1095; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277448.4]
  wire [2:0] _T_1098; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277451.4]
  wire [1:0] _T_1099; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277452.4]
  wire [2:0] _T_1102; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277455.4]
  wire [1:0] _T_1103; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277456.4]
  wire [2:0] _T_1106; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277459.4]
  wire [1:0] _T_1107; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277460.4]
  wire [2:0] _T_1110; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277463.4]
  wire [1:0] _T_1111; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277464.4]
  wire [2:0] s2_report_param; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277467.4]
  wire [1:0] probeNewCoh_state; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277468.4]
  wire [3:0] _T_1121; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277478.4]
  wire  _T_1134; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277491.4]
  wire [2:0] _T_1136; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277493.4]
  wire  _T_1138; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277495.4]
  wire [2:0] _T_1140; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277497.4]
  wire  _T_1142; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277499.4]
  wire [2:0] _T_1144; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277501.4]
  wire  _T_1146; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277503.4]
  wire [2:0] _T_1148; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277505.4]
  wire  _T_1150; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277507.4]
  wire  _T_1151; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277508.4]
  wire [2:0] _T_1152; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277509.4]
  wire  _T_1154; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277511.4]
  wire  _T_1155; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277512.4]
  wire [2:0] _T_1156; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277513.4]
  wire [1:0] _T_1157; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277514.4]
  wire  _T_1158; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277515.4]
  wire  _T_1159; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277516.4]
  wire [2:0] _T_1160; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277517.4]
  wire [1:0] _T_1161; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277518.4]
  wire  _T_1162; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277519.4]
  wire  _T_1163; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277520.4]
  wire [2:0] _T_1164; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277521.4]
  wire [1:0] _T_1165; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277522.4]
  wire  _T_1166; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277523.4]
  wire  _T_1167; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277524.4]
  wire [2:0] _T_1168; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277525.4]
  wire [1:0] _T_1169; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277526.4]
  wire  _T_1170; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277527.4]
  wire  _T_1171; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277528.4]
  wire [2:0] _T_1172; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277529.4]
  wire [1:0] _T_1173; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277530.4]
  wire  _T_1174; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277531.4]
  wire  _T_1175; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277532.4]
  wire [2:0] _T_1176; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277533.4]
  wire [1:0] _T_1177; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277534.4]
  wire  _T_1178; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277535.4]
  wire  s2_victim_dirty; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277536.4]
  wire [2:0] s2_shrink_param; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277537.4]
  wire [1:0] voluntaryNewCoh_state; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277538.4]
  wire  _T_1182; // @[DCache.scala 300:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277544.4]
  wire  _T_1183; // @[DCache.scala 300:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277545.4]
  wire  _T_1184; // @[DCache.scala 300:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277546.4]
  wire  _T_1185; // @[DCache.scala 300:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277547.4]
  wire  _T_1186; // @[DCache.scala 300:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277548.4]
  wire [5:0] _T_1208; // @[DCache.scala 927:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277578.4]
  wire [27:0] _T_1211; // @[DCache.scala 309:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277582.4]
  wire  _T_1219; // @[DCache.scala 317:87:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277598.4]
  wire  _T_1220; // @[DCache.scala 317:84:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277599.4]
  wire [11:0] _T_1225; // @[DCache.scala 321:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277608.4]
  wire [27:0] _T_1227; // @[DCache.scala 322:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277611.4]
  wire [1:0] _T_1230_state; // @[DCache.scala 322:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277615.4]
  wire [25:0] _T_1232_tag; // @[HellaCache.scala 240:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277616.4 HellaCache.scala 241:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277618.4]
  wire  _T_1237; // @[DCache.scala 329:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277628.4]
  wire  _T_1238; // @[DCache.scala 329:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277629.4]
  wire  lrscBackingOff; // @[DCache.scala 329:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277630.4]
  wire  _T_1243; // @[DCache.scala 333:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277637.4]
  wire  _T_1245; // @[DCache.scala 333:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277639.4]
  wire  _T_1246; // @[DCache.scala 333:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277640.4]
  wire  _T_1248; // @[DCache.scala 333:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277642.4]
  wire [7:0] _T_1252; // @[DCache.scala 337:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277651.6]
  wire [7:0] _T_1253; // @[DCache.scala 337:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277652.6]
  wire [6:0] _T_1254; // @[DCache.scala 337:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277653.6]
  wire  _T_1255; // @[DCache.scala 338:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277656.4]
  wire  _T_1264; // @[DCache.scala 347:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277673.4]
  reg [4:0] pstore1_cmd; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277674.4]
  reg [31:0] _RAND_58;
  reg [63:0] pstore1_data; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277684.4]
  reg [63:0] _RAND_59;
  reg [3:0] pstore1_way; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277689.4]
  reg [31:0] _RAND_60;
  wire  _T_1325; // @[DCache.scala 918:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277751.4]
  wire  _T_1326; // @[DCache.scala 917:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277752.4]
  reg  pstore1_rmw; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277754.4]
  reg [31:0] _RAND_61;
  wire  _T_1330; // @[DCache.scala 354:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277759.4]
  wire  _T_1335; // @[DCache.scala 346:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277765.4]
  wire  pstore_drain_opportunistic; // @[DCache.scala 357:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277837.4]
  wire  pstore1_valid_likely; // @[DCache.scala 360:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277840.4]
  wire  pstore1_valid; // @[DCache.scala 363:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277850.4]
  wire  _T_1412; // @[DCache.scala 365:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277853.4]
  wire  _T_1413; // @[DCache.scala 365:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277854.4]
  wire  _T_1414; // @[DCache.scala 365:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277855.4]
  wire  pstore_drain_structural; // @[DCache.scala 365:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277856.4]
  wire  _T_1424; // @[DCache.scala 366:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277866.4]
  wire  _T_1425; // @[DCache.scala 366:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277867.4]
  wire  _T_1427; // @[DCache.scala 366:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277869.4]
  wire  _T_1428; // @[DCache.scala 366:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277870.4]
  wire  _T_1442; // @[DCache.scala 374:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277889.4]
  wire  _T_1443; // @[DCache.scala 374:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277890.4]
  wire  _T_1444; // @[DCache.scala 374:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277891.4]
  wire  _T_1445; // @[DCache.scala 374:107:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277892.4]
  wire  _T_1446; // @[DCache.scala 374:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277893.4]
  wire  pstore_drain; // @[DCache.scala 373:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277894.4]
  wire  _T_1456; // @[DCache.scala 377:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277904.4]
  wire  _T_1457; // @[DCache.scala 377:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277905.4]
  wire  _T_1460; // @[DCache.scala 378:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277909.4]
  wire  advance_pstore1; // @[DCache.scala 378:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277910.4]
  wire  _T_1462; // @[DCache.scala 379:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277912.4]
  reg [3:0] pstore2_way; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277921.4]
  reg [31:0] _RAND_62;
  wire [63:0] pstore1_storegen_data; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277698.4 :sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277700.4 DCache.scala 748:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280639.4]
  wire [7:0] _T_1468; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277925.4]
  reg [7:0] _T_1473; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277929.4]
  reg [31:0] _RAND_63;
  wire [7:0] _T_1474; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277933.4]
  reg [7:0] _T_1479; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277937.4]
  reg [31:0] _RAND_64;
  wire [7:0] _T_1480; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277941.4]
  reg [7:0] _T_1485; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277945.4]
  reg [31:0] _RAND_65;
  wire [7:0] _T_1486; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277949.4]
  reg [7:0] _T_1491; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277953.4]
  reg [31:0] _RAND_66;
  wire [7:0] _T_1492; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277957.4]
  reg [7:0] _T_1497; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277961.4]
  reg [31:0] _RAND_67;
  wire [7:0] _T_1498; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277965.4]
  reg [7:0] _T_1503; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277969.4]
  reg [31:0] _RAND_68;
  wire [7:0] _T_1504; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277973.4]
  reg [7:0] _T_1509; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277977.4]
  reg [31:0] _RAND_69;
  wire [7:0] _T_1510; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277981.4]
  reg [7:0] _T_1515; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277985.4]
  reg [31:0] _RAND_70;
  wire [15:0] _T_1516; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277989.4]
  wire [15:0] _T_1517; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277990.4]
  wire [31:0] _T_1518; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277991.4]
  wire [15:0] _T_1519; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277992.4]
  wire [15:0] _T_1520; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277993.4]
  wire [31:0] _T_1521; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277994.4]
  wire [63:0] pstore2_storegen_data; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277995.4]
  wire [7:0] _T_1525; // @[DCache.scala 390:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278001.6]
  wire [7:0] _T_1527; // @[DCache.scala 390:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278003.6]
  wire  _T_1540; // @[DCache.scala 374:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278020.4]
  wire  _T_1541; // @[DCache.scala 374:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278021.4]
  wire  _T_1543; // @[DCache.scala 374:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278023.4]
  wire [39:0] _T_1546; // @[DCache.scala 405:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278028.4]
  wire [7:0] _T_1551; // @[DCache.scala 410:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278038.4]
  wire  _T_1552; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278039.4]
  wire  _T_1553; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278040.4]
  wire  _T_1554; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278041.4]
  wire  _T_1555; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278042.4]
  wire  _T_1556; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278043.4]
  wire  _T_1557; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278044.4]
  wire  _T_1558; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278045.4]
  wire  _T_1559; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278046.4]
  wire [1:0] _T_1568; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278055.4]
  wire [1:0] _T_1569; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278056.4]
  wire [3:0] _T_1570; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278057.4]
  wire [1:0] _T_1571; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278058.4]
  wire [1:0] _T_1572; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278059.4]
  wire [3:0] _T_1573; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278060.4]
  wire [1:0] _GEN_324; // @[DCache.scala 430:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278246.4]
  wire [1:0] _T_1751; // @[DCache.scala 430:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278246.4]
  wire  _T_1752; // @[OneHot.scala 39:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278247.4]
  wire  a_source; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278249.4]
  wire [39:0] _GEN_325; // @[DCache.scala 431:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278251.4]
  wire [39:0] acquire_address; // @[DCache.scala 431:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278251.4]
  wire [1:0] a_size; // @[Consts.scala 19:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278252.4]
  wire [2:0] _T_1814; // @[Misc.scala 206:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278318.4]
  wire [1:0] _T_1815; // @[OneHot.scala 51:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278319.4]
  wire [3:0] _T_1816; // @[OneHot.scala 52:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278320.4]
  wire [2:0] _T_1817; // @[OneHot.scala 52:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278321.4]
  wire [2:0] _T_1818; // @[Misc.scala 206:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278322.4]
  wire  _T_1819; // @[Misc.scala 210:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278323.4]
  wire  _T_1820; // @[Misc.scala 213:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278324.4]
  wire  _T_1821; // @[Misc.scala 214:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278325.4]
  wire  _T_1822; // @[Misc.scala 215:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278326.4]
  wire  _T_1824; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278328.4]
  wire  _T_1825; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278329.4]
  wire  _T_1827; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278331.4]
  wire  _T_1828; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278332.4]
  wire  _T_1829; // @[Misc.scala 213:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278333.4]
  wire  _T_1830; // @[Misc.scala 214:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278334.4]
  wire  _T_1831; // @[Misc.scala 215:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278335.4]
  wire  _T_1832; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278336.4]
  wire  _T_1833; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278337.4]
  wire  _T_1834; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278338.4]
  wire  _T_1835; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278339.4]
  wire  _T_1836; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278340.4]
  wire  _T_1837; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278341.4]
  wire  _T_1838; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278342.4]
  wire  _T_1839; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278343.4]
  wire  _T_1840; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278344.4]
  wire  _T_1841; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278345.4]
  wire  _T_1842; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278346.4]
  wire  _T_1843; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278347.4]
  wire  _T_1844; // @[Misc.scala 213:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278348.4]
  wire  _T_1845; // @[Misc.scala 214:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278349.4]
  wire  _T_1846; // @[Misc.scala 215:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278350.4]
  wire  _T_1847; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278351.4]
  wire  _T_1848; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278352.4]
  wire  _T_1849; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278353.4]
  wire  _T_1850; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278354.4]
  wire  _T_1851; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278355.4]
  wire  _T_1852; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278356.4]
  wire  _T_1853; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278357.4]
  wire  _T_1854; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278358.4]
  wire  _T_1855; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278359.4]
  wire  _T_1856; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278360.4]
  wire  _T_1857; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278361.4]
  wire  _T_1858; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278362.4]
  wire  _T_1859; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278363.4]
  wire  _T_1860; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278364.4]
  wire  _T_1861; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278365.4]
  wire  _T_1862; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278366.4]
  wire  _T_1863; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278367.4]
  wire  _T_1864; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278368.4]
  wire  _T_1865; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278369.4]
  wire  _T_1866; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278370.4]
  wire  _T_1867; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278371.4]
  wire  _T_1868; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278372.4]
  wire  _T_1869; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278373.4]
  wire  _T_1870; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278374.4]
  wire [1:0] _T_1871; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278375.4]
  wire [1:0] _T_1872; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278376.4]
  wire [3:0] _T_1873; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278377.4]
  wire [1:0] _T_1874; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278378.4]
  wire [1:0] _T_1875; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278379.4]
  wire [3:0] _T_1876; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278380.4]
  wire [7:0] get_mask; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278381.4]
  wire  _T_3100; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279688.4]
  wire [2:0] _T_3101_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  wire [2:0] _T_3101_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  wire [2:0] _T_3101_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  wire  _T_3101_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  wire [37:0] _T_3035_address; // @[Edges.scala 476:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279614.4 Edges.scala 481:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279620.4]
  wire [37:0] _T_3101_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  wire [7:0] _T_3101_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  wire [63:0] _T_3101_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  wire  _T_3102; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279690.4]
  wire [2:0] _T_3103_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  wire [2:0] _T_3103_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  wire [2:0] _T_3103_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  wire  _T_3103_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  wire [37:0] _T_3103_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  wire [7:0] _T_3103_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  wire [63:0] _T_3103_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  wire  _T_3104; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279692.4]
  wire [2:0] _T_3105_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  wire [2:0] _T_3105_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  wire [2:0] _T_3105_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  wire  _T_3105_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  wire [37:0] _T_3105_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  wire [7:0] _T_3105_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  wire [63:0] _T_3105_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  wire  _T_3106; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279694.4]
  wire [2:0] _T_3107_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  wire [2:0] _T_3107_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  wire [2:0] _T_3107_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  wire  _T_3107_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  wire [37:0] _T_3107_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  wire [7:0] _T_3107_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  wire [63:0] _T_3107_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  wire  _T_3108; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279696.4]
  wire [2:0] _T_3109_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  wire [2:0] _T_3109_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  wire [2:0] _T_3109_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  wire  _T_3109_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  wire [37:0] _T_3109_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  wire [7:0] _T_3109_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  wire [63:0] _T_3109_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  wire  _T_3110; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279698.4]
  wire [2:0] _T_3111_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  wire [2:0] _T_3111_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  wire [2:0] _T_3111_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  wire  _T_3111_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  wire [37:0] _T_3111_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  wire [7:0] _T_3111_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  wire [63:0] _T_3111_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  wire  _T_3112; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279700.4]
  wire [2:0] _T_3113_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  wire [2:0] _T_3113_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  wire [2:0] _T_3113_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  wire  _T_3113_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  wire [37:0] _T_3113_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  wire [7:0] _T_3113_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  wire [63:0] _T_3113_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  wire  _T_3114; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279702.4]
  wire [2:0] _T_3115_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  wire [2:0] _T_3115_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  wire [2:0] _T_3115_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  wire  _T_3115_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  wire [37:0] _T_3115_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  wire [7:0] _T_3115_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  wire [63:0] _T_3115_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  wire  _T_3116; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279704.4]
  wire [2:0] atomics_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  wire [2:0] atomics_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  wire [2:0] atomics_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  wire  atomics_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  wire [37:0] atomics_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  wire [7:0] atomics_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  wire [63:0] atomics_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  wire  _T_3120; // @[DCache.scala 454:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279709.4]
  wire  _T_3121; // @[DCache.scala 454:128:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279710.4]
  wire  tl_out_a_valid; // @[DCache.scala 454:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279711.4]
  wire  _T_3252; // @[DCache.scala 455:89:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279850.4]
  wire  _T_3253; // @[DCache.scala 455:109:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279851.4]
  wire [2:0] _T_3254_opcode; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  wire [2:0] _T_3254_param; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  wire [2:0] _T_3254_size; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  wire  _T_3254_source; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  wire [37:0] _T_3254_address; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  wire [7:0] _T_3254_mask; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  wire [63:0] _T_3254_data; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  wire [2:0] _T_3255_opcode; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  wire [2:0] _T_3255_param; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  wire [2:0] _T_3255_size; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  wire  _T_3255_source; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  wire [37:0] _T_3255_address; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  wire [7:0] _T_3255_mask; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  wire [63:0] _T_3255_data; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  wire [2:0] _T_3187_param; // @[Edges.scala 323:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279776.4 Edges.scala 325:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279779.4]
  wire [37:0] _T_3187_address; // @[Edges.scala 323:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279776.4 Edges.scala 328:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279782.4]
  wire [1:0] _T_3258; // @[OneHot.scala 52:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279857.4]
  wire  a_sel; // @[DCache.scala 458:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279859.4]
  wire  _T_3260; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279860.4]
  wire [4:0] _T_3272; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279882.4]
  wire [4:0] _T_3273; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279883.4]
  wire [3:0] _T_3274; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279884.4]
  wire  d_done; // @[Edges.scala 233:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279889.4]
  wire [3:0] _T_3277; // @[Edges.scala 234:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279890.4]
  wire [3:0] _T_3278; // @[Edges.scala 234:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279891.4]
  wire [6:0] _GEN_327; // @[Edges.scala 269:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279896.4]
  wire [6:0] d_address_inc; // @[Edges.scala 269:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279896.4]
  wire  grantIsVoluntary; // @[DCache.scala 490:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279906.4]
  wire [3:0] _T_3289; // @[DCache.scala 494:97:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279912.6]
  wire [3:0] _T_3290; // @[DCache.scala 494:97:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279913.6]
  wire [2:0] _T_3291; // @[DCache.scala 494:97:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279914.6]
  wire  _T_3298; // @[DCache.scala 500:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279927.8]
  wire  _T_3299; // @[DCache.scala 500:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279928.8]
  wire [1:0] _T_3301; // @[OneHot.scala 52:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279943.10]
  wire  d_sel; // @[DCache.scala 508:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279945.10]
  wire  _T_3305; // @[DCache.scala 511:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279948.10]
  wire  _T_3307; // @[DCache.scala 512:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279951.12]
  wire  _T_3308; // @[DCache.scala 512:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279952.12]
  wire [34:0] _T_3310; // @[DCache.scala 524:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279965.12]
  wire [37:0] _GEN_328; // @[DCache.scala 524:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279966.12]
  wire [37:0] dontCareBits; // @[DCache.scala 524:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279966.12]
  wire [2:0] _T_3311; // @[DCache.scala 525:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279967.12]
  wire [37:0] _GEN_329; // @[DCache.scala 525:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279968.12]
  wire [37:0] _T_3312; // @[DCache.scala 525:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279968.12]
  wire  _T_3314; // @[DCache.scala 530:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279976.12]
  wire  _T_3315; // @[DCache.scala 530:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279977.12]
  wire  _T_3316; // @[DCache.scala 536:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279985.4]
  wire  _T_3317; // @[DCache.scala 536:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279986.4]
  wire  tl_out__e_valid; // @[DCache.scala 544:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280010.4]
  wire  _T_3321; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279993.4]
  wire  _T_3323; // @[DCache.scala 538:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279995.4]
  wire  _T_3324; // @[DCache.scala 538:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279996.4]
  wire  _T_3325; // @[DCache.scala 538:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279997.4]
  wire  _T_3327; // @[DCache.scala 538:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279999.4]
  wire  _T_3328; // @[DCache.scala 538:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280000.4]
  wire  _T_3329; // @[DCache.scala 543:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280005.4]
  wire [33:0] _T_3333; // @[DCache.scala 550:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280015.4]
  wire [39:0] _GEN_330; // @[DCache.scala 550:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280016.4]
  wire [39:0] _T_3334; // @[DCache.scala 550:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280016.4]
  wire [39:0] _GEN_331; // @[DCache.scala 550:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280017.4]
  wire [39:0] _T_3335; // @[DCache.scala 550:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280017.4]
  wire  _T_3338; // @[DCache.scala 564:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280026.4]
  wire  _T_3339; // @[DCache.scala 564:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280027.4]
  wire [3:0] _T_3397; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280090.4]
  wire  _T_3406; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280099.4]
  wire [1:0] _T_3407; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280100.4]
  wire  _T_3408; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280101.4]
  wire [1:0] _T_3409; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280102.4]
  wire  _T_3410; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280103.4]
  wire [1:0] _T_3411; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280104.4]
  wire  _T_3412; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280105.4]
  wire [1:0] _T_3413; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280106.4]
  wire  _GEN_170; // @[DCache.scala 577:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280122.6]
  wire  _GEN_171; // @[DCache.scala 577:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280122.6]
  wire  _GEN_172; // @[DCache.scala 577:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280122.6]
  wire  _T_3429; // @[DCache.scala 588:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280137.4]
  wire  _T_3430; // @[DCache.scala 588:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280138.4]
  wire [5:0] _T_3437; // @[DCache.scala 927:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280148.4]
  wire [1:0] _T_3438; // @[DCache.scala 592:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280150.4]
  wire [39:0] _T_3439; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280151.4]
  wire [4:0] _T_3450; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280164.4]
  wire [4:0] _T_3451; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280165.4]
  wire [3:0] _T_3452; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280166.4]
  wire  c_first; // @[Edges.scala 231:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280167.4]
  wire [3:0] _T_3455; // @[Edges.scala 234:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280172.4]
  wire [3:0] c_count; // @[Edges.scala 234:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280173.4]
  wire  _T_3457; // @[DCache.scala 598:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280178.4]
  wire  releaseRejected; // @[DCache.scala 598:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280179.4]
  reg  s1_release_data_valid; // @[DCache.scala 599:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280181.4]
  reg [31:0] _RAND_71;
  wire  _T_3460; // @[DCache.scala 600:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280183.4]
  wire [4:0] _T_3463; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280187.4]
  wire [1:0] _T_3464; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280188.4]
  wire [1:0] _GEN_332; // @[DCache.scala 601:101:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280189.4]
  wire [1:0] _T_3466; // @[DCache.scala 601:101:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280190.4]
  wire [1:0] _T_3467; // @[DCache.scala 601:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280191.4]
  wire [4:0] _GEN_333; // @[DCache.scala 601:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280192.4]
  wire [4:0] releaseDataBeat; // @[DCache.scala 601:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280193.4]
  wire  _T_3493; // @[DCache.scala 615:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280249.4]
  wire  _T_3494; // @[DCache.scala 616:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280251.6]
  wire  _T_3497; // @[DCache.scala 616:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280254.6]
  wire  _T_3499; // @[DCache.scala 616:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280256.6]
  wire  _T_3500; // @[DCache.scala 616:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280257.6]
  wire [5:0] _T_3501; // @[DCache.scala 618:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280263.6]
  wire [31:0] _T_3502; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280264.6]
  wire [37:0] _GEN_334; // @[DCache.scala 618:96:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280265.6]
  wire [37:0] res_2_address; // @[DCache.scala 618:96:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280265.6]
  wire [2:0] _GEN_180; // @[DCache.scala 615:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280250.4]
  wire [2:0] _T_3507; // @[DCache.scala 629:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280288.12]
  wire [2:0] _T_3509; // @[DCache.scala 633:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280295.12]
  wire [2:0] _GEN_191; // @[DCache.scala 626:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280285.10]
  wire [2:0] _GEN_197; // @[DCache.scala 626:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280285.10]
  wire [2:0] _GEN_199; // @[DCache.scala 624:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280280.8]
  wire [2:0] _GEN_202; // @[DCache.scala 624:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280280.8]
  wire [2:0] _GEN_220; // @[DCache.scala 620:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280272.4]
  wire [2:0] _GEN_223; // @[DCache.scala 620:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280272.4]
  wire  _T_3510; // @[DCache.scala 637:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280302.4]
  wire [39:0] _T_3513; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280308.6]
  wire [2:0] _GEN_230; // @[DCache.scala 641:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280310.6]
  wire [2:0] _GEN_235; // @[DCache.scala 637:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280303.4]
  wire [2:0] _GEN_237; // @[DCache.scala 648:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280318.6]
  wire [2:0] _GEN_239; // @[DCache.scala 646:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280316.4]
  wire [2:0] _GEN_243; // @[DCache.scala 650:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280323.4]
  wire [2:0] _GEN_252; // @[DCache.scala 655:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280331.4]
  wire  _T_3583; // @[DCache.scala 668:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280417.6]
  wire [1:0] newCoh_state; // @[DCache.scala 659:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280340.4]
  wire  _T_3585; // @[DCache.scala 676:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280427.4]
  wire [11:0] _GEN_342; // @[DCache.scala 679:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280433.4]
  wire [11:0] _T_3588; // @[DCache.scala 679:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280433.4]
  wire [2:0] _T_3589; // @[DCache.scala 679:90:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280434.4]
  wire [5:0] _GEN_343; // @[DCache.scala 679:117:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280435.4]
  wire [5:0] _T_3590; // @[DCache.scala 679:117:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280435.4]
  wire [11:0] _GEN_344; // @[DCache.scala 679:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280436.4]
  wire  _T_3595; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280443.4]
  wire [11:0] _T_3599; // @[DCache.scala 687:90:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280451.4]
  wire [25:0] _T_3601; // @[DCache.scala 688:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280454.4]
  wire  _T_3605; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280461.4]
  wire  _T_3610; // @[DCache.scala 701:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280475.4]
  wire  _T_3611; // @[DCache.scala 701:94:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280476.4]
  wire  _T_3613; // @[DCache.scala 701:115:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280478.4]
  reg  _T_3617; // @[DCache.scala 705:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280483.4]
  reg [31:0] _RAND_72;
  reg  _T_3619_pf_ld; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280485.4]
  reg [31:0] _RAND_73;
  reg  _T_3619_pf_st; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280485.4]
  reg [31:0] _RAND_74;
  reg  _T_3619_ae_ld; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280485.4]
  reg [31:0] _RAND_75;
  reg  _T_3619_ae_st; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280485.4]
  reg [31:0] _RAND_76;
  reg  _T_3619_ma_ld; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280485.4]
  reg [31:0] _RAND_77;
  reg  _T_3619_ma_st; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280485.4]
  reg [31:0] _RAND_78;
  reg  doUncachedResp; // @[DCache.scala 720:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280539.4]
  reg [31:0] _RAND_79;
  wire  _T_3646; // @[DCache.scala 723:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280548.6]
  wire  _T_3647; // @[DCache.scala 723:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280549.6]
  wire  _T_3649; // @[Consts.scala 20:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280563.4]
  wire  _T_3650; // @[Consts.scala 20:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280564.4]
  wire [31:0] _T_3653; // @[AMOALU.scala 39:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280567.4]
  wire [31:0] _T_3654; // @[AMOALU.scala 39:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280568.4]
  wire [31:0] _T_3655; // @[AMOALU.scala 39:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280569.4]
  wire  _T_3658; // @[AMOALU.scala 42:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280572.4]
  wire  _T_3660; // @[AMOALU.scala 42:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280574.4]
  wire  _T_3661; // @[AMOALU.scala 42:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280575.4]
  wire [31:0] _T_3663; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280577.4]
  wire [31:0] _T_3665; // @[AMOALU.scala 42:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280579.4]
  wire [63:0] _T_3666; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280580.4]
  wire [15:0] _T_3668; // @[AMOALU.scala 39:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280582.4]
  wire [15:0] _T_3669; // @[AMOALU.scala 39:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280583.4]
  wire [15:0] _T_3670; // @[AMOALU.scala 39:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280584.4]
  wire  _T_3673; // @[AMOALU.scala 42:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280587.4]
  wire  _T_3675; // @[AMOALU.scala 42:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280589.4]
  wire  _T_3676; // @[AMOALU.scala 42:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280590.4]
  wire [47:0] _T_3678; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280592.4]
  wire [47:0] _T_3679; // @[AMOALU.scala 42:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280593.4]
  wire [47:0] _T_3680; // @[AMOALU.scala 42:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280594.4]
  wire [63:0] _T_3681; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280595.4]
  wire [7:0] _T_3683; // @[AMOALU.scala 39:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280597.4]
  wire [7:0] _T_3684; // @[AMOALU.scala 39:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280598.4]
  wire [7:0] _T_3685; // @[AMOALU.scala 39:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280599.4]
  wire [7:0] _T_3687; // @[AMOALU.scala 41:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280601.4]
  wire  _T_3688; // @[AMOALU.scala 42:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280602.4]
  wire  _T_3689; // @[AMOALU.scala 42:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280603.4]
  wire  _T_3690; // @[AMOALU.scala 42:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280604.4]
  wire  _T_3691; // @[AMOALU.scala 42:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280605.4]
  wire [55:0] _T_3693; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280607.4]
  wire [55:0] _T_3694; // @[AMOALU.scala 42:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280608.4]
  wire [55:0] _T_3695; // @[AMOALU.scala 42:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280609.4]
  wire [63:0] _T_3696; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280610.4]
  wire [63:0] _GEN_345; // @[DCache.scala 735:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280611.4]
  reg  resetting; // @[DCache.scala 757:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280640.4]
  reg [31:0] _RAND_80;
  reg  _T_3716; // @[DCache.scala 759:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280642.4]
  reg [31:0] _RAND_81;
  reg [7:0] flushCounter; // @[DCache.scala 762:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280649.4]
  reg [31:0] _RAND_82;
  wire [8:0] flushCounterNext; // @[DCache.scala 763:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280650.4]
  wire [2:0] _T_3720; // @[DCache.scala 764:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280651.4]
  wire  flushDone; // @[DCache.scala 764:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280652.4]
  wire  _T_3721; // @[DCache.scala 766:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280654.4]
  wire  _T_3722; // @[DCache.scala 766:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280655.4]
  wire  _T_3737; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280676.4]
  wire  _T_3739; // @[DCache.scala 774:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280678.4]
  wire  _T_3741; // @[DCache.scala 774:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280680.4]
  wire  _T_3743; // @[DCache.scala 774:95:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280682.4]
  wire [11:0] _GEN_346; // @[DCache.scala 778:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280691.4]
  wire [11:0] _T_3748; // @[DCache.scala 778:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280691.4]
  wire [8:0] _GEN_295; // @[DCache.scala 805:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280711.4]
  wire  _T_3757; // @[CustomCSRs.scala 37:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280717.4]
  wire  _T_3758; // @[DCache.scala 814:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280718.4]
  wire  _T_3759; // @[DCache.scala 815:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280719.4]
  wire  _T_3760; // @[DCache.scala 816:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280720.4]
  wire  _T_3761; // @[DCache.scala 817:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280721.4]
  wire  _T_3762; // @[DCache.scala 817:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280722.4]
  wire  _T_3763; // @[DCache.scala 818:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280723.4]
  wire  _T_3764; // @[DCache.scala 818:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280724.4]
  wire  _T_3765; // @[DCache.scala 819:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280725.4]
  wire  _T_3767; // @[DCache.scala 819:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280727.4]
  wire  _T_3768; // @[DCache.scala 820:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280728.4]
  wire  _T_3772; // @[DCache.scala 821:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280732.4]
  wire  _T_3773; // @[DCache.scala 822:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280733.4]
  wire  _T_3775; // @[DCache.scala 823:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280735.4]
  wire  _T_3777; // @[DCache.scala 823:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280737.4]
  wire  _T_3842; // @[DCache.scala 861:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280817.4]
  wire  _GEN_351; // @[DCache.scala 500:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279930.10]
  wire  _GEN_354; // @[DCache.scala 512:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279954.14]
  wire  _GEN_355; // @[DCache.scala 512:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279954.14]
  wire  _GEN_356; // @[DCache.scala 512:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279954.14]
  wire  _GEN_363; // @[DCache.scala 530:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279979.14]
  wire  _GEN_364; // @[DCache.scala 530:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279979.14]
  wire  _GEN_365; // @[DCache.scala 530:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279979.14]
  reg [5:0] tag_array_0_s1_meta_addr_pipe_0;
  reg [31:0] _RAND_83;
  reg [5:0] tag_array_1_s1_meta_addr_pipe_0;
  reg [31:0] _RAND_84;
  reg [5:0] tag_array_2_s1_meta_addr_pipe_0;
  reg [31:0] _RAND_85;
  reg [5:0] tag_array_3_s1_meta_addr_pipe_0;
  reg [31:0] _RAND_86;
  Arbiter metaArb ( // @[DCache.scala 98:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276410.4]
    .io_in_0_valid(metaArb_io_in_0_valid),
    .io_in_0_bits_addr(metaArb_io_in_0_bits_addr),
    .io_in_0_bits_idx(metaArb_io_in_0_bits_idx),
    .io_in_0_bits_data(metaArb_io_in_0_bits_data),
    .io_in_2_valid(metaArb_io_in_2_valid),
    .io_in_2_bits_write(metaArb_io_in_2_bits_write),
    .io_in_2_bits_addr(metaArb_io_in_2_bits_addr),
    .io_in_2_bits_idx(metaArb_io_in_2_bits_idx),
    .io_in_2_bits_way_en(metaArb_io_in_2_bits_way_en),
    .io_in_2_bits_data(metaArb_io_in_2_bits_data),
    .io_in_3_valid(metaArb_io_in_3_valid),
    .io_in_3_bits_addr(metaArb_io_in_3_bits_addr),
    .io_in_3_bits_idx(metaArb_io_in_3_bits_idx),
    .io_in_3_bits_way_en(metaArb_io_in_3_bits_way_en),
    .io_in_3_bits_data(metaArb_io_in_3_bits_data),
    .io_in_4_ready(metaArb_io_in_4_ready),
    .io_in_4_valid(metaArb_io_in_4_valid),
    .io_in_4_bits_addr(metaArb_io_in_4_bits_addr),
    .io_in_4_bits_idx(metaArb_io_in_4_bits_idx),
    .io_in_4_bits_way_en(metaArb_io_in_4_bits_way_en),
    .io_in_4_bits_data(metaArb_io_in_4_bits_data),
    .io_in_5_ready(metaArb_io_in_5_ready),
    .io_in_5_valid(metaArb_io_in_5_valid),
    .io_in_5_bits_addr(metaArb_io_in_5_bits_addr),
    .io_in_5_bits_idx(metaArb_io_in_5_bits_idx),
    .io_in_6_ready(metaArb_io_in_6_ready),
    .io_in_6_valid(metaArb_io_in_6_valid),
    .io_in_6_bits_addr(metaArb_io_in_6_bits_addr),
    .io_in_6_bits_idx(metaArb_io_in_6_bits_idx),
    .io_in_6_bits_way_en(metaArb_io_in_6_bits_way_en),
    .io_in_6_bits_data(metaArb_io_in_6_bits_data),
    .io_in_7_ready(metaArb_io_in_7_ready),
    .io_in_7_valid(metaArb_io_in_7_valid),
    .io_in_7_bits_addr(metaArb_io_in_7_bits_addr),
    .io_in_7_bits_idx(metaArb_io_in_7_bits_idx),
    .io_in_7_bits_way_en(metaArb_io_in_7_bits_way_en),
    .io_in_7_bits_data(metaArb_io_in_7_bits_data),
    .io_out_ready(metaArb_io_out_ready),
    .io_out_valid(metaArb_io_out_valid),
    .io_out_bits_write(metaArb_io_out_bits_write),
    .io_out_bits_addr(metaArb_io_out_bits_addr),
    .io_out_bits_idx(metaArb_io_out_bits_idx),
    .io_out_bits_way_en(metaArb_io_out_bits_way_en),
    .io_out_bits_data(metaArb_io_out_bits_data)
  );
  DCacheDataArray data ( // @[DCache.scala 108:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276415.4]
    .clock(data_clock),
    .io_req_valid(data_io_req_valid),
    .io_req_bits_addr(data_io_req_bits_addr),
    .io_req_bits_write(data_io_req_bits_write),
    .io_req_bits_wdata(data_io_req_bits_wdata),
    .io_req_bits_eccMask(data_io_req_bits_eccMask),
    .io_req_bits_way_en(data_io_req_bits_way_en),
    .io_resp_0(data_io_resp_0),
    .io_resp_1(data_io_resp_1),
    .io_resp_2(data_io_resp_2),
    .io_resp_3(data_io_resp_3)
  );
  Arbiter_1 dataArb ( // @[DCache.scala 109:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276419.4]
    .io_in_0_valid(dataArb_io_in_0_valid),
    .io_in_0_bits_addr(dataArb_io_in_0_bits_addr),
    .io_in_0_bits_write(dataArb_io_in_0_bits_write),
    .io_in_0_bits_wdata(dataArb_io_in_0_bits_wdata),
    .io_in_0_bits_eccMask(dataArb_io_in_0_bits_eccMask),
    .io_in_0_bits_way_en(dataArb_io_in_0_bits_way_en),
    .io_in_1_ready(dataArb_io_in_1_ready),
    .io_in_1_valid(dataArb_io_in_1_valid),
    .io_in_1_bits_addr(dataArb_io_in_1_bits_addr),
    .io_in_1_bits_write(dataArb_io_in_1_bits_write),
    .io_in_1_bits_wdata(dataArb_io_in_1_bits_wdata),
    .io_in_1_bits_eccMask(dataArb_io_in_1_bits_eccMask),
    .io_in_1_bits_way_en(dataArb_io_in_1_bits_way_en),
    .io_in_2_ready(dataArb_io_in_2_ready),
    .io_in_2_valid(dataArb_io_in_2_valid),
    .io_in_2_bits_addr(dataArb_io_in_2_bits_addr),
    .io_in_2_bits_wdata(dataArb_io_in_2_bits_wdata),
    .io_in_2_bits_eccMask(dataArb_io_in_2_bits_eccMask),
    .io_in_3_ready(dataArb_io_in_3_ready),
    .io_in_3_valid(dataArb_io_in_3_valid),
    .io_in_3_bits_addr(dataArb_io_in_3_bits_addr),
    .io_in_3_bits_wdata(dataArb_io_in_3_bits_wdata),
    .io_in_3_bits_eccMask(dataArb_io_in_3_bits_eccMask),
    .io_out_valid(dataArb_io_out_valid),
    .io_out_bits_addr(dataArb_io_out_bits_addr),
    .io_out_bits_write(dataArb_io_out_bits_write),
    .io_out_bits_wdata(dataArb_io_out_bits_wdata),
    .io_out_bits_eccMask(dataArb_io_out_bits_eccMask),
    .io_out_bits_way_en(dataArb_io_out_bits_way_en)
  );
  TLB tlb ( // @[DCache.scala 184:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276736.4]
    .clock(tlb_clock),
    .reset(tlb_reset),
    .io_req_ready(tlb_io_req_ready),
    .io_req_valid(tlb_io_req_valid),
    .io_req_bits_vaddr(tlb_io_req_bits_vaddr),
    .io_req_bits_passthrough(tlb_io_req_bits_passthrough),
    .io_req_bits_size(tlb_io_req_bits_size),
    .io_req_bits_cmd(tlb_io_req_bits_cmd),
    .io_resp_miss(tlb_io_resp_miss),
    .io_resp_paddr(tlb_io_resp_paddr),
    .io_resp_pf_ld(tlb_io_resp_pf_ld),
    .io_resp_pf_st(tlb_io_resp_pf_st),
    .io_resp_ae_ld(tlb_io_resp_ae_ld),
    .io_resp_ae_st(tlb_io_resp_ae_st),
    .io_resp_ma_ld(tlb_io_resp_ma_ld),
    .io_resp_ma_st(tlb_io_resp_ma_st),
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
    .io_ptw_status_dprv(tlb_io_ptw_status_dprv),
    .io_ptw_status_mxr(tlb_io_ptw_status_mxr),
    .io_ptw_status_sum(tlb_io_ptw_status_sum),
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
  AMOALU amoalu ( // @[DCache.scala 743:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280631.4]
    .io_mask(amoalu_io_mask),
    .io_cmd(amoalu_io_cmd),
    .io_lhs(amoalu_io_lhs),
    .io_rhs(amoalu_io_rhs),
    .io_out(amoalu_io_out)
  );
  assign tag_array_0_s1_meta_addr = tag_array_0_s1_meta_addr_pipe_0;
  assign tag_array_0_s1_meta_data = tag_array_0[tag_array_0_s1_meta_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  assign tag_array_0__T_553_data = metaArb_io_out_bits_data;
  assign tag_array_0__T_553_addr = metaArb_io_out_bits_idx;
  assign tag_array_0__T_553_mask = metaArb_io_out_bits_way_en[0];
  assign tag_array_0__T_553_en = metaArb_io_out_valid & metaArb_io_out_bits_write;
  assign tag_array_1_s1_meta_addr = tag_array_1_s1_meta_addr_pipe_0;
  assign tag_array_1_s1_meta_data = tag_array_1[tag_array_1_s1_meta_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  assign tag_array_1__T_553_data = metaArb_io_out_bits_data;
  assign tag_array_1__T_553_addr = metaArb_io_out_bits_idx;
  assign tag_array_1__T_553_mask = metaArb_io_out_bits_way_en[1];
  assign tag_array_1__T_553_en = metaArb_io_out_valid & metaArb_io_out_bits_write;
  assign tag_array_2_s1_meta_addr = tag_array_2_s1_meta_addr_pipe_0;
  assign tag_array_2_s1_meta_data = tag_array_2[tag_array_2_s1_meta_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  assign tag_array_2__T_553_data = metaArb_io_out_bits_data;
  assign tag_array_2__T_553_addr = metaArb_io_out_bits_idx;
  assign tag_array_2__T_553_mask = metaArb_io_out_bits_way_en[2];
  assign tag_array_2__T_553_en = metaArb_io_out_valid & metaArb_io_out_bits_write;
  assign tag_array_3_s1_meta_addr = tag_array_3_s1_meta_addr_pipe_0;
  assign tag_array_3_s1_meta_data = tag_array_3[tag_array_3_s1_meta_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
  assign tag_array_3__T_553_data = metaArb_io_out_bits_data;
  assign tag_array_3__T_553_addr = metaArb_io_out_bits_idx;
  assign tag_array_3__T_553_mask = metaArb_io_out_bits_way_en[3];
  assign tag_array_3__T_553_en = metaArb_io_out_valid & metaArb_io_out_bits_write;
  assign _T_235 = lfsr[0]; // @[LFSR.scala 23:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276399.6]
  assign _T_236 = lfsr[2]; // @[LFSR.scala 23:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276400.6]
  assign _T_237 = _T_235 ^ _T_236; // @[LFSR.scala 23:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276401.6]
  assign _T_238 = lfsr[3]; // @[LFSR.scala 23:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276402.6]
  assign _T_239 = _T_237 ^ _T_238; // @[LFSR.scala 23:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276403.6]
  assign _T_240 = lfsr[5]; // @[LFSR.scala 23:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276404.6]
  assign _T_241 = _T_239 ^ _T_240; // @[LFSR.scala 23:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276405.6]
  assign _T_242 = lfsr[15:1]; // @[LFSR.scala 23:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276406.6]
  assign _T_243 = {_T_241,_T_242}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276407.6]
  assign grantIsUncachedData = auto_out_d_bits_opcode == 3'h1; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279902.4]
  assign _T_3420 = blockUncachedGrant | s1_valid; // @[DCache.scala 574:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280118.4]
  assign _T_3421 = grantIsUncachedData & _T_3420; // @[DCache.scala 574:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280119.4]
  assign grantIsRefill = auto_out_d_bits_opcode == 3'h5; // @[DCache.scala 491:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279907.4]
  assign _T_3331 = dataArb_io_in_1_ready == 1'h0; // @[DCache.scala 544:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280008.4]
  assign _T_3332 = grantIsRefill & _T_3331; // @[DCache.scala 544:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280009.4]
  assign _T_3284 = auto_out_d_bits_opcode == 3'h4; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279903.4]
  assign grantIsCached = _T_3284 | grantIsRefill; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279905.4]
  assign d_first = _T_3271 == 4'h0; // @[Edges.scala 231:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279885.4]
  assign _T_3292 = d_first == 1'h0; // @[DCache.scala 496:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279917.4]
  assign _T_3293 = _T_3292 | auto_out_e_ready; // @[DCache.scala 496:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279918.4]
  assign _T_3295 = grantIsCached ? _T_3293 : 1'h1; // @[DCache.scala 496:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279920.4]
  assign _GEN_169 = _T_3332 ? 1'h0 : _T_3295; // @[DCache.scala 544:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280010.4]
  assign tl_out__d_ready = _T_3421 ? 1'h0 : _GEN_169; // @[DCache.scala 574:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280120.4]
  assign _T_3296 = tl_out__d_ready & auto_out_d_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279922.4]
  assign _T_3275 = _T_3271 == 4'h1; // @[Edges.scala 232:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279886.4]
  assign _T_3268 = auto_out_d_bits_opcode[0]; // @[Edges.scala 106:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279879.4]
  assign _T_3264 = 14'h7f << auto_out_d_bits_size; // @[package.scala 185:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279875.4]
  assign _T_3265 = _T_3264[6:0]; // @[package.scala 185:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279876.4]
  assign _T_3266 = ~ _T_3265; // @[package.scala 185:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279877.4]
  assign _T_3267 = _T_3266[6:3]; // @[Edges.scala 220:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279878.4]
  assign _T_3269 = _T_3268 ? _T_3267 : 4'h0; // @[Edges.scala 221:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279880.4]
  assign _T_3276 = _T_3269 == 4'h0; // @[Edges.scala 232:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279887.4]
  assign d_last = _T_3275 | _T_3276; // @[Edges.scala 232:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279888.4]
  assign _GEN_147 = grantIsCached ? d_last : 1'h0; // @[DCache.scala 498:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279924.6]
  assign _GEN_159 = _T_3296 ? _GEN_147 : 1'h0; // @[DCache.scala 497:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279923.4]
  assign _T_256 = dataArb_io_out_bits_wdata; // @[DCache.scala 112:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276427.4]
  assign _T_257 = _T_256[7:0]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276428.4]
  assign _T_258 = _T_256[15:8]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276429.4]
  assign _T_259 = _T_256[23:16]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276430.4]
  assign _T_260 = _T_256[31:24]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276431.4]
  assign _T_261 = _T_256[39:32]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276432.4]
  assign _T_262 = _T_256[47:40]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276433.4]
  assign _T_263 = _T_256[55:48]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276434.4]
  assign _T_264 = _T_256[63:56]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276435.4]
  assign _T_265 = {_T_258,_T_257}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276436.4]
  assign _T_266 = {_T_260,_T_259}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276437.4]
  assign _T_267 = {_T_266,_T_265}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276438.4]
  assign _T_268 = {_T_262,_T_261}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276439.4]
  assign _T_269 = {_T_264,_T_263}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276440.4]
  assign _T_270 = {_T_269,_T_268}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276441.4]
  assign _T_274 = io_cpu_req_ready & io_cpu_req_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276449.4]
  assign _T_720 = s1_probe | s2_probe; // @[DCache.scala 233:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276970.4]
  assign _T_721 = release_state != 3'h0; // @[DCache.scala 233:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276971.4]
  assign releaseInFlight = _T_720 | _T_721; // @[DCache.scala 233:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276972.4]
  assign _T_3425 = releaseInFlight | grantInProgress; // @[DCache.scala 587:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280132.4]
  assign _T_3426 = blockProbeAfterGrantCount > 3'h0; // @[DCache.scala 587:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280133.4]
  assign _T_3427 = _T_3425 | _T_3426; // @[DCache.scala 587:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280134.4]
  assign lrscValid = lrscCount > 7'h3; // @[DCache.scala 328:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277627.4]
  assign block_probe = _T_3427 | lrscValid; // @[DCache.scala 587:89:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280135.4]
  assign _T_3431 = block_probe == 1'h0; // @[DCache.scala 589:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280140.4]
  assign _T_3432 = metaArb_io_in_6_ready & _T_3431; // @[DCache.scala 589:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280141.4]
  assign _T_3433 = s1_valid == 1'h0; // @[DCache.scala 589:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280142.4]
  assign _T_3434 = _T_3432 & _T_3433; // @[DCache.scala 589:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280143.4]
  assign _T_714 = {io_cpu_s2_xcpt_ma_ld,io_cpu_s2_xcpt_ma_st}; // @[DCache.scala 231:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276962.4]
  assign _T_715 = {_T_714,io_cpu_s2_xcpt_pf_ld}; // @[DCache.scala 231:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276963.4]
  assign _T_712 = {io_cpu_s2_xcpt_pf_st,io_cpu_s2_xcpt_ae_ld}; // @[DCache.scala 231:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276960.4]
  assign _T_713 = {_T_712,io_cpu_s2_xcpt_ae_st}; // @[DCache.scala 231:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276961.4]
  assign _T_716 = {_T_715,_T_713}; // @[DCache.scala 231:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276964.4]
  assign _T_717 = _T_716 != 6'h0; // @[DCache.scala 231:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276965.4]
  assign _T_718 = _T_717 == 1'h0; // @[DCache.scala 231:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276966.4]
  assign s2_valid = s2_valid_pre_xcpt & _T_718; // @[DCache.scala 231:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276967.4]
  assign _T_3435 = s2_valid == 1'h0; // @[DCache.scala 589:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280144.4]
  assign tl_out__b_ready = _T_3434 & _T_3435; // @[DCache.scala 589:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280145.4]
  assign _T_276 = tl_out__b_ready & auto_out_b_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276452.4]
  assign _T_281 = io_cpu_s1_kill == 1'h0; // @[DCache.scala 135:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276470.4]
  assign s1_valid_masked = s1_valid & _T_281; // @[DCache.scala 135:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276471.4]
  assign _T_1055 = {probe_bits_param,s2_probe_state_state}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277408.4]
  assign _T_1112 = 4'h3 == _T_1055; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277465.4]
  assign _T_1108 = 4'h2 == _T_1055; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277461.4]
  assign _T_1104 = 4'h1 == _T_1055; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277457.4]
  assign _T_1100 = 4'h0 == _T_1055; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277453.4]
  assign _T_1096 = 4'h7 == _T_1055; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277449.4]
  assign _T_1092 = 4'h6 == _T_1055; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277445.4]
  assign _T_1088 = 4'h5 == _T_1055; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277441.4]
  assign _T_1084 = 4'h4 == _T_1055; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277437.4]
  assign _T_1080 = 4'hb == _T_1055; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277433.4]
  assign _T_1076 = 4'ha == _T_1055; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277429.4]
  assign _T_1072 = 4'h9 == _T_1055; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277425.4]
  assign _T_1068 = 4'h8 == _T_1055; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277421.4]
  assign _T_1085 = _T_1084 ? 1'h0 : _T_1080; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277438.4]
  assign _T_1089 = _T_1088 ? 1'h0 : _T_1085; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277442.4]
  assign _T_1093 = _T_1092 ? 1'h0 : _T_1089; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277446.4]
  assign _T_1097 = _T_1096 ? 1'h1 : _T_1093; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277450.4]
  assign _T_1101 = _T_1100 ? 1'h0 : _T_1097; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277454.4]
  assign _T_1105 = _T_1104 ? 1'h0 : _T_1101; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277458.4]
  assign _T_1109 = _T_1108 ? 1'h0 : _T_1105; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277462.4]
  assign s2_prb_ack_data = _T_1112 ? 1'h1 : _T_1109; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277466.4]
  assign _T_3506 = s2_probe_state_state > 2'h0; // @[Metadata.scala 50:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280284.10]
  assign _T_3453 = _T_3449 == 4'h1; // @[Edges.scala 232:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280168.4]
  assign _T_3517 = release_state == 3'h1; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280337.4]
  assign _T_3518 = release_state == 3'h6; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280338.4]
  assign _T_3519 = _T_3517 | _T_3518; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280339.4]
  assign _T_3516 = release_state == 3'h2; // @[DCache.scala 655:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280330.4]
  assign _T_3515 = release_state == 3'h3; // @[DCache.scala 650:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280322.4]
  assign _GEN_251 = _T_3516 ? 3'h5 : 3'h4; // @[DCache.scala 655:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280331.4]
  assign tl_out__c_bits_opcode = _T_3519 ? 3'h7 : _GEN_251; // @[DCache.scala 659:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280340.4]
  assign _T_3446 = tl_out__c_bits_opcode[0]; // @[Edges.scala 102:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280161.4]
  assign tl_out__c_bits_size = _T_3519 ? 3'h6 : probe_bits_size; // @[DCache.scala 659:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280340.4]
  assign _T_3442 = 14'h7f << tl_out__c_bits_size; // @[package.scala 185:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280157.4]
  assign _T_3443 = _T_3442[6:0]; // @[package.scala 185:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280158.4]
  assign _T_3444 = ~ _T_3443; // @[package.scala 185:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280159.4]
  assign _T_3445 = _T_3444[6:3]; // @[Edges.scala 220:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280160.4]
  assign _T_3447 = _T_3446 ? _T_3445 : 4'h0; // @[Edges.scala 221:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280162.4]
  assign _T_3454 = _T_3447 == 4'h0; // @[Edges.scala 232:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280169.4]
  assign c_last = _T_3453 | _T_3454; // @[Edges.scala 232:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280170.4]
  assign _T_3514 = release_state == 3'h5; // @[DCache.scala 646:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280315.4]
  assign _GEN_200 = s2_prb_ack_data ? s2_release_data_valid : 1'h1; // @[DCache.scala 624:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280280.8]
  assign _GEN_221 = s2_probe ? _GEN_200 : s2_release_data_valid; // @[DCache.scala 620:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280272.4]
  assign _GEN_238 = _T_3514 ? 1'h1 : _GEN_221; // @[DCache.scala 646:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280316.4]
  assign tl_out__c_valid = _T_3515 ? 1'h1 : _GEN_238; // @[DCache.scala 650:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280323.4]
  assign _T_3440 = auto_out_c_ready & tl_out__c_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280155.4]
  assign releaseDone = c_last & _T_3440; // @[Edges.scala 233:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280171.4]
  assign _T_3508 = releaseDone == 1'h0; // @[DCache.scala 632:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280293.12]
  assign _GEN_198 = _T_3506 ? 1'h1 : _T_3508; // @[DCache.scala 626:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280285.10]
  assign probeNack = s2_prb_ack_data ? 1'h1 : _GEN_198; // @[DCache.scala 624:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280280.8]
  assign _T_288 = s1_req_cmd == 5'h0; // @[Consts.scala 93:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276488.4]
  assign _T_289 = s1_req_cmd == 5'h6; // @[Consts.scala 93:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276489.4]
  assign _T_290 = _T_288 | _T_289; // @[Consts.scala 93:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276490.4]
  assign _T_291 = s1_req_cmd == 5'h7; // @[Consts.scala 93:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276491.4]
  assign _T_292 = _T_290 | _T_291; // @[Consts.scala 93:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276492.4]
  assign _T_293 = s1_req_cmd == 5'h4; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276493.4]
  assign _T_294 = s1_req_cmd == 5'h9; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276494.4]
  assign _T_297 = _T_293 | _T_294; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276497.4]
  assign _T_295 = s1_req_cmd == 5'ha; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276495.4]
  assign _T_298 = _T_297 | _T_295; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276498.4]
  assign _T_296 = s1_req_cmd == 5'hb; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276496.4]
  assign _T_299 = _T_298 | _T_296; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276499.4]
  assign _T_300 = s1_req_cmd == 5'h8; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276500.4]
  assign _T_301 = s1_req_cmd == 5'hc; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276501.4]
  assign _T_305 = _T_300 | _T_301; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276505.4]
  assign _T_302 = s1_req_cmd == 5'hd; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276502.4]
  assign _T_306 = _T_305 | _T_302; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276506.4]
  assign _T_303 = s1_req_cmd == 5'he; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276503.4]
  assign _T_307 = _T_306 | _T_303; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276507.4]
  assign _T_304 = s1_req_cmd == 5'hf; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276504.4]
  assign _T_308 = _T_307 | _T_304; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276508.4]
  assign _T_309 = _T_299 | _T_308; // @[Consts.scala 91:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276509.4]
  assign s1_read = _T_292 | _T_309; // @[Consts.scala 93:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276510.4]
  assign s2_valid_masked = s2_valid & _T_724; // @[DCache.scala 234:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276976.4]
  assign _T_735 = s2_req_cmd == 5'h0; // @[Consts.scala 93:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276997.4]
  assign _T_736 = s2_req_cmd == 5'h6; // @[Consts.scala 93:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276998.4]
  assign _T_737 = _T_735 | _T_736; // @[Consts.scala 93:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276999.4]
  assign _T_738 = s2_req_cmd == 5'h7; // @[Consts.scala 93:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277000.4]
  assign _T_739 = _T_737 | _T_738; // @[Consts.scala 93:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277001.4]
  assign _T_740 = s2_req_cmd == 5'h4; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277002.4]
  assign _T_741 = s2_req_cmd == 5'h9; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277003.4]
  assign _T_744 = _T_740 | _T_741; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277006.4]
  assign _T_742 = s2_req_cmd == 5'ha; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277004.4]
  assign _T_745 = _T_744 | _T_742; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277007.4]
  assign _T_743 = s2_req_cmd == 5'hb; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277005.4]
  assign _T_746 = _T_745 | _T_743; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277008.4]
  assign _T_747 = s2_req_cmd == 5'h8; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277009.4]
  assign _T_748 = s2_req_cmd == 5'hc; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277010.4]
  assign _T_752 = _T_747 | _T_748; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277014.4]
  assign _T_749 = s2_req_cmd == 5'hd; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277011.4]
  assign _T_753 = _T_752 | _T_749; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277015.4]
  assign _T_750 = s2_req_cmd == 5'he; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277012.4]
  assign _T_754 = _T_753 | _T_750; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277016.4]
  assign _T_751 = s2_req_cmd == 5'hf; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277013.4]
  assign _T_755 = _T_754 | _T_751; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277017.4]
  assign _T_756 = _T_746 | _T_755; // @[Consts.scala 91:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277018.4]
  assign s2_read = _T_739 | _T_756; // @[Consts.scala 93:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277019.4]
  assign _T_757 = s2_req_cmd == 5'h1; // @[Consts.scala 94:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277020.4]
  assign _T_758 = s2_req_cmd == 5'h11; // @[Consts.scala 94:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277021.4]
  assign _T_759 = _T_757 | _T_758; // @[Consts.scala 94:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277022.4]
  assign _T_761 = _T_759 | _T_738; // @[Consts.scala 94:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277024.4]
  assign s2_write = _T_761 | _T_756; // @[Consts.scala 94:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277042.4]
  assign s2_readwrite = s2_read | s2_write; // @[DCache.scala 247:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277043.4]
  assign _T_1019 = s2_valid_masked & s2_readwrite; // @[DCache.scala 282:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277354.4]
  assign _T_912 = s2_req_cmd == 5'h3; // @[Consts.scala 95:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277236.4]
  assign _T_913 = s2_write | _T_912; // @[Consts.scala 95:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277237.4]
  assign _T_915 = _T_913 | _T_736; // @[Consts.scala 95:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277239.4]
  assign _T_916 = {s2_write,_T_915}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277240.4]
  assign _T_917 = {_T_916,s2_hit_state_state}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277241.4]
  assign _T_975 = 4'h3 == _T_917; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277299.4]
  assign _T_972 = 4'h2 == _T_917; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277296.4]
  assign _T_969 = 4'h1 == _T_917; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277293.4]
  assign _T_966 = 4'h7 == _T_917; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277290.4]
  assign _T_963 = 4'h6 == _T_917; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277287.4]
  assign _T_960 = 4'hf == _T_917; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277284.4]
  assign _T_957 = 4'he == _T_917; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277281.4]
  assign _T_954 = 4'h0 == _T_917; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277278.4]
  assign _T_951 = 4'h5 == _T_917; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277275.4]
  assign _T_948 = 4'h4 == _T_917; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277272.4]
  assign _T_945 = 4'hd == _T_917; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277269.4]
  assign _T_942 = 4'hc == _T_917; // @[Misc.scala 51:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277266.4]
  assign _T_961 = _T_960 ? 1'h1 : _T_957; // @[Misc.scala 37:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277285.4]
  assign _T_964 = _T_963 ? 1'h1 : _T_961; // @[Misc.scala 37:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277288.4]
  assign _T_967 = _T_966 ? 1'h1 : _T_964; // @[Misc.scala 37:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277291.4]
  assign _T_970 = _T_969 ? 1'h1 : _T_967; // @[Misc.scala 37:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277294.4]
  assign _T_973 = _T_972 ? 1'h1 : _T_970; // @[Misc.scala 37:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277297.4]
  assign s2_hit = _T_975 ? 1'h1 : _T_973; // @[Misc.scala 37:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277300.4]
  assign s2_valid_hit_pre_data_ecc = _T_1019 & s2_hit; // @[DCache.scala 282:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277357.4]
  assign _T_1403 = s2_valid_hit_pre_data_ecc & s2_write; // @[DCache.scala 345:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277841.4]
  assign _T_1240 = s2_req_addr[39:6]; // @[DCache.scala 331:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277632.4]
  assign lrscAddrMatch = lrscAddr == _T_1240; // @[DCache.scala 331:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277633.4]
  assign _T_1241 = lrscValid & lrscAddrMatch; // @[DCache.scala 332:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277634.4]
  assign _T_1242 = _T_1241 == 1'h0; // @[DCache.scala 332:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277635.4]
  assign s2_sc_fail = _T_738 & _T_1242; // @[DCache.scala 332:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277636.4]
  assign _T_1404 = s2_sc_fail == 1'h0; // @[DCache.scala 345:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277842.4]
  assign _T_1405 = _T_1403 & _T_1404; // @[DCache.scala 345:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277843.4]
  assign pstore1_valid_pre_kill = _T_1405 | pstore1_held; // @[DCache.scala 361:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277844.4]
  assign _T_1575 = pstore1_addr[11:3]; // @[DCache.scala 414:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278063.4]
  assign _T_1576 = s1_req_addr[11:3]; // @[DCache.scala 414:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278064.4]
  assign _T_1577 = _T_1575 == _T_1576; // @[DCache.scala 414:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278065.4]
  assign _T_310 = s1_req_cmd == 5'h1; // @[Consts.scala 94:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276511.4]
  assign _T_311 = s1_req_cmd == 5'h11; // @[Consts.scala 94:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276512.4]
  assign _T_312 = _T_310 | _T_311; // @[Consts.scala 94:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276513.4]
  assign _T_314 = _T_312 | _T_291; // @[Consts.scala 94:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276515.4]
  assign s1_write = _T_314 | _T_309; // @[Consts.scala 94:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276533.4]
  assign _T_1585 = pstore1_mask[7]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278073.4]
  assign _T_1584 = pstore1_mask[6]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278072.4]
  assign _T_1598 = {_T_1585,_T_1584}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278086.4]
  assign _T_1583 = pstore1_mask[5]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278071.4]
  assign _T_1582 = pstore1_mask[4]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278070.4]
  assign _T_1597 = {_T_1583,_T_1582}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278085.4]
  assign _T_1599 = {_T_1598,_T_1597}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278087.4]
  assign _T_1581 = pstore1_mask[3]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278069.4]
  assign _T_1580 = pstore1_mask[2]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278068.4]
  assign _T_1595 = {_T_1581,_T_1580}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278083.4]
  assign _T_1579 = pstore1_mask[1]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278067.4]
  assign _T_1578 = pstore1_mask[0]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278066.4]
  assign _T_1594 = {_T_1579,_T_1578}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278082.4]
  assign _T_1596 = {_T_1595,_T_1594}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278084.4]
  assign _T_1600 = {_T_1599,_T_1596}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278088.4]
  assign _T_1608 = _T_1600[7]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278096.4]
  assign _T_1607 = _T_1600[6]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278095.4]
  assign _T_1613 = {_T_1608,_T_1607}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278101.4]
  assign _T_1606 = _T_1600[5]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278094.4]
  assign _T_1605 = _T_1600[4]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278093.4]
  assign _T_1612 = {_T_1606,_T_1605}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278100.4]
  assign _T_1614 = {_T_1613,_T_1612}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278102.4]
  assign _T_1604 = _T_1600[3]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278092.4]
  assign _T_1603 = _T_1600[2]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278091.4]
  assign _T_1610 = {_T_1604,_T_1603}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278098.4]
  assign _T_1602 = _T_1600[1]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278090.4]
  assign _T_1601 = _T_1600[0]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278089.4]
  assign _T_1609 = {_T_1602,_T_1601}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278097.4]
  assign _T_1611 = {_T_1610,_T_1609}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278099.4]
  assign _T_1615 = {_T_1614,_T_1611}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278103.4]
  assign _T_701 = s1_req_addr[2]; // @[AMOALU.scala 17:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276947.4]
  assign _T_693 = s1_req_addr[1]; // @[AMOALU.scala 17:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276939.4]
  assign _T_685 = s1_req_addr[0]; // @[AMOALU.scala 17:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276931.4]
  assign _T_684 = s1_req_typ[1:0]; // @[AMOALU.scala 10:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276930.4]
  assign _T_687 = _T_684 >= 2'h1; // @[AMOALU.scala 17:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276933.4]
  assign _T_689 = _T_685 | _T_687; // @[AMOALU.scala 17:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276935.4]
  assign _T_691 = _T_685 ? 1'h0 : 1'h1; // @[AMOALU.scala 18:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276937.4]
  assign _T_692 = {_T_689,_T_691}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276938.4]
  assign _T_694 = _T_693 ? _T_692 : 2'h0; // @[AMOALU.scala 17:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276940.4]
  assign _T_695 = _T_684 >= 2'h2; // @[AMOALU.scala 17:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276941.4]
  assign _T_696 = _T_695 ? 2'h3 : 2'h0; // @[AMOALU.scala 17:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276942.4]
  assign _T_697 = _T_694 | _T_696; // @[AMOALU.scala 17:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276943.4]
  assign _T_699 = _T_693 ? 2'h0 : _T_692; // @[AMOALU.scala 18:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276945.4]
  assign _T_700 = {_T_697,_T_699}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276946.4]
  assign _T_702 = _T_701 ? _T_700 : 4'h0; // @[AMOALU.scala 17:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276948.4]
  assign _T_703 = _T_684 >= 2'h3; // @[AMOALU.scala 17:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276949.4]
  assign _T_704 = _T_703 ? 4'hf : 4'h0; // @[AMOALU.scala 17:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276950.4]
  assign _T_705 = _T_702 | _T_704; // @[AMOALU.scala 17:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276951.4]
  assign _T_707 = _T_701 ? 4'h0 : _T_700; // @[AMOALU.scala 18:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276953.4]
  assign _T_708 = {_T_705,_T_707}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276954.4]
  assign s1_mask = _T_311 ? io_cpu_s1_data_mask : _T_708; // @[DCache.scala 228:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276955.4]
  assign _T_1623 = s1_mask[7]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278111.4]
  assign _T_1622 = s1_mask[6]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278110.4]
  assign _T_1636 = {_T_1623,_T_1622}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278124.4]
  assign _T_1621 = s1_mask[5]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278109.4]
  assign _T_1620 = s1_mask[4]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278108.4]
  assign _T_1635 = {_T_1621,_T_1620}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278123.4]
  assign _T_1637 = {_T_1636,_T_1635}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278125.4]
  assign _T_1619 = s1_mask[3]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278107.4]
  assign _T_1618 = s1_mask[2]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278106.4]
  assign _T_1633 = {_T_1619,_T_1618}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278121.4]
  assign _T_1617 = s1_mask[1]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278105.4]
  assign _T_1616 = s1_mask[0]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278104.4]
  assign _T_1632 = {_T_1617,_T_1616}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278120.4]
  assign _T_1634 = {_T_1633,_T_1632}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278122.4]
  assign _T_1638 = {_T_1637,_T_1634}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278126.4]
  assign _T_1646 = _T_1638[7]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278134.4]
  assign _T_1645 = _T_1638[6]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278133.4]
  assign _T_1651 = {_T_1646,_T_1645}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278139.4]
  assign _T_1644 = _T_1638[5]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278132.4]
  assign _T_1643 = _T_1638[4]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278131.4]
  assign _T_1650 = {_T_1644,_T_1643}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278138.4]
  assign _T_1652 = {_T_1651,_T_1650}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278140.4]
  assign _T_1642 = _T_1638[3]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278130.4]
  assign _T_1641 = _T_1638[2]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278129.4]
  assign _T_1648 = {_T_1642,_T_1641}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278136.4]
  assign _T_1640 = _T_1638[1]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278128.4]
  assign _T_1639 = _T_1638[0]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278127.4]
  assign _T_1647 = {_T_1640,_T_1639}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278135.4]
  assign _T_1649 = {_T_1648,_T_1647}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278137.4]
  assign _T_1653 = {_T_1652,_T_1649}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278141.4]
  assign _T_1654 = _T_1615 & _T_1653; // @[DCache.scala 415:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278142.4]
  assign _T_1655 = _T_1654 != 8'h0; // @[DCache.scala 415:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278143.4]
  assign _T_1656 = pstore1_mask & s1_mask; // @[DCache.scala 415:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278144.4]
  assign _T_1657 = _T_1656 != 8'h0; // @[DCache.scala 415:84:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278145.4]
  assign _T_1658 = s1_write ? _T_1655 : _T_1657; // @[DCache.scala 415:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278146.4]
  assign _T_1659 = _T_1577 & _T_1658; // @[DCache.scala 414:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278147.4]
  assign _T_1660 = pstore1_valid_pre_kill & _T_1659; // @[DCache.scala 417:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278148.4]
  assign _T_1661 = pstore2_addr[11:3]; // @[DCache.scala 414:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278149.4]
  assign _T_1663 = _T_1661 == _T_1576; // @[DCache.scala 414:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278151.4]
  assign _T_1671 = mask[7]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278159.4]
  assign _T_1670 = mask[6]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278158.4]
  assign _T_1684 = {_T_1671,_T_1670}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278172.4]
  assign _T_1669 = mask[5]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278157.4]
  assign _T_1668 = mask[4]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278156.4]
  assign _T_1683 = {_T_1669,_T_1668}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278171.4]
  assign _T_1685 = {_T_1684,_T_1683}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278173.4]
  assign _T_1667 = mask[3]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278155.4]
  assign _T_1666 = mask[2]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278154.4]
  assign _T_1681 = {_T_1667,_T_1666}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278169.4]
  assign _T_1665 = mask[1]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278153.4]
  assign _T_1664 = mask[0]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278152.4]
  assign _T_1680 = {_T_1665,_T_1664}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278168.4]
  assign _T_1682 = {_T_1681,_T_1680}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278170.4]
  assign _T_1686 = {_T_1685,_T_1682}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278174.4]
  assign _T_1694 = _T_1686[7]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278182.4]
  assign _T_1693 = _T_1686[6]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278181.4]
  assign _T_1699 = {_T_1694,_T_1693}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278187.4]
  assign _T_1692 = _T_1686[5]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278180.4]
  assign _T_1691 = _T_1686[4]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278179.4]
  assign _T_1698 = {_T_1692,_T_1691}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278186.4]
  assign _T_1700 = {_T_1699,_T_1698}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278188.4]
  assign _T_1690 = _T_1686[3]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278178.4]
  assign _T_1689 = _T_1686[2]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278177.4]
  assign _T_1696 = {_T_1690,_T_1689}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278184.4]
  assign _T_1688 = _T_1686[1]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278176.4]
  assign _T_1687 = _T_1686[0]; // @[Bitwise.scala 27:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278175.4]
  assign _T_1695 = {_T_1688,_T_1687}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278183.4]
  assign _T_1697 = {_T_1696,_T_1695}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278185.4]
  assign _T_1701 = {_T_1700,_T_1697}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278189.4]
  assign _T_1740 = _T_1701 & _T_1653; // @[DCache.scala 415:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278228.4]
  assign _T_1741 = _T_1740 != 8'h0; // @[DCache.scala 415:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278229.4]
  assign _T_1742 = mask & s1_mask; // @[DCache.scala 415:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278230.4]
  assign _T_1743 = _T_1742 != 8'h0; // @[DCache.scala 415:84:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278231.4]
  assign _T_1744 = s1_write ? _T_1741 : _T_1743; // @[DCache.scala 415:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278232.4]
  assign _T_1745 = _T_1663 & _T_1744; // @[DCache.scala 414:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278233.4]
  assign _T_1746 = pstore2_valid & _T_1745; // @[DCache.scala 418:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278234.4]
  assign s1_hazard = _T_1660 | _T_1746; // @[DCache.scala 417:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278235.4]
  assign s1_raw_hazard = s1_read & s1_hazard; // @[DCache.scala 419:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278236.4]
  assign _T_1747 = s1_valid & s1_raw_hazard; // @[DCache.scala 424:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278238.4]
  assign _T_944 = _T_942 ? 2'h1 : 2'h0; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277268.4]
  assign _T_947 = _T_945 ? 2'h2 : _T_944; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277271.4]
  assign _T_950 = _T_948 ? 2'h1 : _T_947; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277274.4]
  assign _T_953 = _T_951 ? 2'h2 : _T_950; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277277.4]
  assign _T_956 = _T_954 ? 2'h0 : _T_953; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277280.4]
  assign _T_959 = _T_957 ? 2'h3 : _T_956; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277283.4]
  assign _T_962 = _T_960 ? 2'h3 : _T_959; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277286.4]
  assign _T_965 = _T_963 ? 2'h2 : _T_962; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277289.4]
  assign _T_968 = _T_966 ? 2'h3 : _T_965; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277292.4]
  assign _T_971 = _T_969 ? 2'h1 : _T_968; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277295.4]
  assign _T_974 = _T_972 ? 2'h2 : _T_971; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277298.4]
  assign s2_grow_param = _T_975 ? 2'h3 : _T_974; // @[Misc.scala 37:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277301.4]
  assign _T_1181 = s2_hit_state_state == s2_grow_param; // @[Metadata.scala 46:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277542.4]
  assign s2_update_meta = _T_1181 == 1'h0; // @[Metadata.scala 47:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277543.4]
  assign _T_1187 = s2_valid_hit_pre_data_ecc & s2_update_meta; // @[DCache.scala 301:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277550.4]
  assign _T_1188 = io_cpu_s2_nack | _T_1187; // @[DCache.scala 301:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277551.4]
  assign s1_readwrite = s1_read | s1_write; // @[DCache.scala 146:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276534.4]
  assign _T_529 = s1_valid & s1_readwrite; // @[DCache.scala 193:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276758.4]
  assign _T_530 = _T_529 & tlb_io_resp_miss; // @[DCache.scala 193:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276759.4]
  assign _GEN_74 = _T_1188 ? 1'h1 : _T_530; // @[DCache.scala 301:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277552.4]
  assign _GEN_98 = _T_1747 ? 1'h1 : _GEN_74; // @[DCache.scala 424:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278239.4]
  assign _GEN_219 = probeNack ? 1'h1 : _GEN_98; // @[DCache.scala 635:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280298.6]
  assign s1_nack = s2_probe ? _GEN_219 : _GEN_98; // @[DCache.scala 620:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280272.4]
  assign _T_282 = s1_nack == 1'h0; // @[DCache.scala 136:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276472.4]
  assign s1_valid_not_nacked = s1_valid & _T_282; // @[DCache.scala 136:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276473.4]
  assign _T_283 = metaArb_io_out_bits_write == 1'h0; // @[DCache.scala 138:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276475.4]
  assign s0_clk_en = metaArb_io_out_valid & _T_283; // @[DCache.scala 138:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276476.4]
  assign _T_284 = metaArb_io_out_bits_addr[39:6]; // @[DCache.scala 141:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276479.6]
  assign _T_285 = io_cpu_req_bits_addr[5:0]; // @[DCache.scala 141:86:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276480.6]
  assign _T_286 = {_T_284,_T_285}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276481.6]
  assign _T_287 = metaArb_io_in_7_ready == 1'h0; // @[DCache.scala 142:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276483.6]
  assign s1_sfence = s1_req_cmd == 5'h14; // @[DCache.scala 147:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276535.4]
  assign can_acquire_before_release = release_ack_wait == 1'h0; // @[DCache.scala 154:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276541.4]
  assign inWriteback = _T_3517 | _T_3516; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276548.4]
  assign _T_343 = release_state == 3'h0; // @[DCache.scala 159:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276551.4]
  assign _T_344 = cached_grant_wait == 1'h0; // @[DCache.scala 159:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276552.4]
  assign _T_345 = _T_343 & _T_344; // @[DCache.scala 159:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276553.4]
  assign _T_347 = _T_345 & _T_282; // @[DCache.scala 159:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276555.4]
  assign _T_374 = io_cpu_req_bits_cmd == 5'h0; // @[Consts.scala 93:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276562.4]
  assign _T_375 = io_cpu_req_bits_cmd == 5'h6; // @[Consts.scala 93:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276563.4]
  assign _T_376 = _T_374 | _T_375; // @[Consts.scala 93:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276564.4]
  assign _T_377 = io_cpu_req_bits_cmd == 5'h7; // @[Consts.scala 93:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276565.4]
  assign _T_378 = _T_376 | _T_377; // @[Consts.scala 93:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276566.4]
  assign _T_379 = io_cpu_req_bits_cmd == 5'h4; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276567.4]
  assign _T_380 = io_cpu_req_bits_cmd == 5'h9; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276568.4]
  assign _T_381 = io_cpu_req_bits_cmd == 5'ha; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276569.4]
  assign _T_382 = io_cpu_req_bits_cmd == 5'hb; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276570.4]
  assign _T_383 = _T_379 | _T_380; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276571.4]
  assign _T_384 = _T_383 | _T_381; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276572.4]
  assign _T_385 = _T_384 | _T_382; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276573.4]
  assign _T_386 = io_cpu_req_bits_cmd == 5'h8; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276574.4]
  assign _T_387 = io_cpu_req_bits_cmd == 5'hc; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276575.4]
  assign _T_388 = io_cpu_req_bits_cmd == 5'hd; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276576.4]
  assign _T_389 = io_cpu_req_bits_cmd == 5'he; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276577.4]
  assign _T_390 = io_cpu_req_bits_cmd == 5'hf; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276578.4]
  assign _T_391 = _T_386 | _T_387; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276579.4]
  assign _T_392 = _T_391 | _T_388; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276580.4]
  assign _T_393 = _T_392 | _T_389; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276581.4]
  assign _T_394 = _T_393 | _T_390; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276582.4]
  assign _T_395 = _T_385 | _T_394; // @[Consts.scala 91:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276583.4]
  assign s0_read = _T_378 | _T_395; // @[Consts.scala 93:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276584.4]
  assign _T_396 = io_cpu_req_bits_cmd == 5'h1; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276585.4]
  assign _T_397 = io_cpu_req_bits_cmd == 5'h3; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276586.4]
  assign _T_398 = _T_396 | _T_397; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276587.4]
  assign res = _T_398 == 1'h0; // @[DCache.scala 912:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276588.4]
  assign _T_426 = io_cpu_req_bits_cmd == 5'h11; // @[Consts.scala 94:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276616.4]
  assign _T_427 = _T_396 | _T_426; // @[Consts.scala 94:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276617.4]
  assign _T_429 = _T_427 | _T_377; // @[Consts.scala 94:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276619.4]
  assign _T_447 = _T_429 | _T_395; // @[Consts.scala 94:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276637.4]
  assign _T_452 = _T_447 & _T_426; // @[DCache.scala 918:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276642.4]
  assign _T_453 = s0_read | _T_452; // @[DCache.scala 917:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276643.4]
  assign _T_454 = _T_453 == 1'h0; // @[DCache.scala 913:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276644.4]
  assign _T_455 = _T_454 | res; // @[DCache.scala 913:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276645.4]
  assign _T_457 = _T_455 | reset; // @[DCache.scala 913:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276647.4]
  assign _T_458 = _T_457 == 1'h0; // @[DCache.scala 913:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276648.4]
  assign _T_459 = io_cpu_req_valid & res; // @[DCache.scala 167:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276653.4]
  assign _T_462 = dataArb_io_in_3_ready == 1'h0; // @[DCache.scala 173:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276662.4]
  assign _T_463 = _T_462 & s0_read; // @[DCache.scala 173:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276663.4]
  assign _GEN_16 = _T_463 ? 1'h0 : _T_347; // @[DCache.scala 173:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276664.4]
  assign _GEN_18 = _T_287 ? 1'h0 : _GEN_16; // @[DCache.scala 181:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276733.4]
  assign _T_524 = tlb_io_req_ready == 1'h0; // @[DCache.scala 192:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276750.4]
  assign _T_525 = tlb_io_ptw_resp_valid == 1'h0; // @[DCache.scala 192:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276751.4]
  assign _T_526 = _T_524 & _T_525; // @[DCache.scala 192:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276752.4]
  assign _T_527 = io_cpu_req_bits_phys == 1'h0; // @[DCache.scala 192:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276753.4]
  assign _T_528 = _T_526 & _T_527; // @[DCache.scala 192:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276754.4]
  assign _GEN_19 = _T_528 ? 1'h0 : _GEN_18; // @[DCache.scala 192:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276755.4]
  assign s1_victim_way = lfsr[1:0]; // @[Replacement.scala 19:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276773.4]
  assign _GEN_29 = metaArb_io_out_bits_idx; // @[DCache.scala 213:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276778.4]
  assign _GEN_41 = s0_clk_en; // @[DCache.scala 217:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276808.4]
  assign _T_586 = tag_array_0_s1_meta_data; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276816.4 :sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276818.4]
  assign _T_587 = _T_586[25:0]; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276819.4]
  assign _T_588 = _T_586[27:26]; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276821.4]
  assign _T_593 = tag_array_1_s1_meta_data; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276825.4 :sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276827.4]
  assign _T_594 = _T_593[25:0]; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276828.4]
  assign _T_595 = _T_593[27:26]; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276830.4]
  assign _T_600 = tag_array_2_s1_meta_data; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276834.4 :sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276836.4]
  assign _T_601 = _T_600[25:0]; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276837.4]
  assign _T_602 = _T_600[27:26]; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276839.4]
  assign _T_607 = tag_array_3_s1_meta_data; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276843.4 :sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276845.4]
  assign _T_608 = _T_607[25:0]; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276846.4]
  assign _T_609 = _T_607[27:26]; // @[DCache.scala 218:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276848.4]
  assign s1_tag = tlb_io_resp_paddr[37:12]; // @[DCache.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276850.4]
  assign _T_610 = _T_588 > 2'h0; // @[Metadata.scala 50:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276851.4]
  assign _T_611 = _T_587 == s1_tag; // @[DCache.scala 220:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276852.4]
  assign _T_612 = _T_610 & _T_611; // @[DCache.scala 220:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276853.4]
  assign _T_613 = _T_595 > 2'h0; // @[Metadata.scala 50:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276854.4]
  assign _T_614 = _T_594 == s1_tag; // @[DCache.scala 220:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276855.4]
  assign _T_615 = _T_613 & _T_614; // @[DCache.scala 220:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276856.4]
  assign _T_616 = _T_602 > 2'h0; // @[Metadata.scala 50:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276857.4]
  assign _T_617 = _T_601 == s1_tag; // @[DCache.scala 220:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276858.4]
  assign _T_618 = _T_616 & _T_617; // @[DCache.scala 220:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276859.4]
  assign _T_619 = _T_609 > 2'h0; // @[Metadata.scala 50:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276860.4]
  assign _T_620 = _T_608 == s1_tag; // @[DCache.scala 220:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276861.4]
  assign _T_621 = _T_619 & _T_620; // @[DCache.scala 220:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276862.4]
  assign _T_622 = {_T_615,_T_612}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276863.4]
  assign _T_623 = {_T_621,_T_618}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276864.4]
  assign s1_meta_hit_way = {_T_623,_T_622}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276865.4]
  assign _T_627 = s1_flush_valid == 1'h0; // @[DCache.scala 222:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276870.4]
  assign _T_628 = _T_611 & _T_627; // @[DCache.scala 222:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276871.4]
  assign _T_629 = _T_628 ? _T_588 : 2'h0; // @[DCache.scala 222:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276872.4]
  assign _T_632 = _T_614 & _T_627; // @[DCache.scala 222:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276875.4]
  assign _T_633 = _T_632 ? _T_595 : 2'h0; // @[DCache.scala 222:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276876.4]
  assign _T_636 = _T_617 & _T_627; // @[DCache.scala 222:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276879.4]
  assign _T_637 = _T_636 ? _T_602 : 2'h0; // @[DCache.scala 222:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276880.4]
  assign _T_640 = _T_620 & _T_627; // @[DCache.scala 222:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276883.4]
  assign _T_641 = _T_640 ? _T_609 : 2'h0; // @[DCache.scala 222:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276884.4]
  assign _T_642 = _T_629 | _T_633; // @[DCache.scala 223:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276885.4]
  assign _T_643 = _T_642 | _T_637; // @[DCache.scala 223:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276886.4]
  assign s1_meta_hit_state_state = _T_643 | _T_641; // @[DCache.scala 223:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276887.4]
  assign _T_651 = s1_victim_way == 2'h1; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276897.4]
  assign _T_653 = s1_victim_way == 2'h2; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276899.4]
  assign _T_655 = s1_victim_way == 2'h3; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276901.4]
  assign s2_hit_valid = s2_hit_state_state > 2'h0; // @[Metadata.scala 50:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277189.4]
  assign _T_1047 = 4'h1 << _T_1046; // @[OneHot.scala 45:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277393.4]
  assign s2_victim_way = s2_hit_valid ? s2_hit_way : _T_1047; // @[DCache.scala 292:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277394.4]
  assign releaseWay = _T_3519 ? s2_victim_way : s2_probe_way; // @[DCache.scala 659:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280340.4]
  assign _T_656 = inWriteback ? releaseWay : s1_meta_hit_way; // @[DCache.scala 226:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276903.4]
  assign _T_658 = auto_out_d_bits_data[7:0]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276907.4]
  assign _T_659 = auto_out_d_bits_data[15:8]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276908.4]
  assign _T_660 = auto_out_d_bits_data[23:16]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276909.4]
  assign _T_661 = auto_out_d_bits_data[31:24]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276910.4]
  assign _T_662 = auto_out_d_bits_data[39:32]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276911.4]
  assign _T_663 = auto_out_d_bits_data[47:40]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276912.4]
  assign _T_664 = auto_out_d_bits_data[55:48]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276913.4]
  assign _T_665 = auto_out_d_bits_data[63:56]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276914.4]
  assign _T_666 = {_T_659,_T_658}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276915.4]
  assign _T_667 = {_T_661,_T_660}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276916.4]
  assign _T_668 = {_T_667,_T_666}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276917.4]
  assign _T_669 = {_T_663,_T_662}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276918.4]
  assign _T_670 = {_T_665,_T_664}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276919.4]
  assign _T_671 = {_T_670,_T_669}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276920.4]
  assign s1_all_data_ways_4 = {_T_671,_T_668}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276921.4]
  assign _T_709 = s1_sfence == 1'h0; // @[DCache.scala 230:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276956.4]
  assign _T_710 = s1_valid_masked & _T_709; // @[DCache.scala 230:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276957.4]
  assign _T_725 = io_cpu_s2_kill == 1'h0; // @[DCache.scala 235:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276977.4]
  assign s2_valid_not_killed = s2_valid_masked & _T_725; // @[DCache.scala 235:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276978.4]
  assign _T_728 = s1_valid_not_nacked | s1_flush_valid; // @[DCache.scala 239:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276982.4]
  assign _T_729 = tlb_io_resp_cacheable == 1'h0; // @[DCache.scala 242:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276986.6]
  assign _T_733 = _T_732[39:12]; // @[DCache.scala 244:84:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276994.4]
  assign _T_734 = s2_req_addr[11:0]; // @[DCache.scala 244:109:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276995.4]
  assign s2_vaddr = {_T_733,_T_734}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276996.4]
  assign en = s1_valid | inWriteback; // @[DCache.scala 258:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277143.4]
  assign _T_3281 = auto_out_d_bits_opcode == 3'h0; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279898.4]
  assign _T_3283 = grantIsUncachedData | _T_3281; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279900.4]
  assign _T_3282 = auto_out_d_bits_opcode == 3'h2; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279899.4]
  assign grantIsUncached = _T_3283 | _T_3282; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279901.4]
  assign _GEN_129 = grantIsUncachedData ? 5'h10 : {{1'd0}, _T_656}; // @[DCache.scala 516:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279959.10]
  assign _GEN_137 = grantIsUncached ? _GEN_129 : {{1'd0}, _T_656}; // @[DCache.scala 507:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279941.8]
  assign _GEN_149 = grantIsCached ? {{1'd0}, _T_656} : _GEN_137; // @[DCache.scala 498:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279924.6]
  assign s1_data_way = _T_3296 ? _GEN_149 : {{1'd0}, _T_656}; // @[DCache.scala 497:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279923.4]
  assign _T_839 = s1_data_way[0]; // @[Mux.scala 21:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277144.4]
  assign _T_840 = s1_data_way[1]; // @[Mux.scala 21:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277145.4]
  assign _T_841 = s1_data_way[2]; // @[Mux.scala 21:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277146.4]
  assign _T_842 = s1_data_way[3]; // @[Mux.scala 21:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277147.4]
  assign _T_843 = s1_data_way[4]; // @[Mux.scala 21:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277148.4]
  assign s1_all_data_ways_0 = data_io_resp_0; // @[DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276922.4 DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276924.4]
  assign _T_845 = _T_839 ? s1_all_data_ways_0 : 64'h0; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277149.4]
  assign s1_all_data_ways_1 = data_io_resp_1; // @[DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276922.4 DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276925.4]
  assign _T_846 = _T_840 ? s1_all_data_ways_1 : 64'h0; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277150.4]
  assign s1_all_data_ways_2 = data_io_resp_2; // @[DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276922.4 DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276926.4]
  assign _T_847 = _T_841 ? s1_all_data_ways_2 : 64'h0; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277151.4]
  assign s1_all_data_ways_3 = data_io_resp_3; // @[DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276922.4 DCache.scala 227:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276927.4]
  assign _T_848 = _T_842 ? s1_all_data_ways_3 : 64'h0; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277152.4]
  assign _T_849 = _T_843 ? s1_all_data_ways_4 : 64'h0; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277153.4]
  assign _T_850 = _T_845 | _T_846; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277154.4]
  assign _T_851 = _T_850 | _T_847; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277155.4]
  assign _T_852 = _T_851 | _T_848; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277156.4]
  assign _T_853 = _T_852 | _T_849; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277157.4]
  assign _T_857 = en | _T_3296; // @[DCache.scala 264:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277161.4]
  assign _T_977 = s2_data[7:0]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277305.4]
  assign _T_978 = s2_data[15:8]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277306.4]
  assign _T_979 = s2_data[23:16]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277307.4]
  assign _T_980 = s2_data[31:24]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277308.4]
  assign _T_981 = s2_data[39:32]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277309.4]
  assign _T_982 = s2_data[47:40]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277310.4]
  assign _T_983 = s2_data[55:48]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277311.4]
  assign _T_984 = s2_data[63:56]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277312.4]
  assign _T_1007 = {_T_978,_T_977}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277340.4]
  assign _T_1008 = {_T_980,_T_979}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277341.4]
  assign _T_1009 = {_T_1008,_T_1007}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277342.4]
  assign _T_1010 = {_T_982,_T_981}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277343.4]
  assign _T_1011 = {_T_984,_T_983}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277344.4]
  assign _T_1012 = {_T_1011,_T_1010}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277345.4]
  assign s2_data_corrected = {_T_1012,_T_1009}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277346.4]
  assign _T_1030 = s2_hit == 1'h0; // @[DCache.scala 285:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277368.4]
  assign _T_1031 = _T_1019 & _T_1030; // @[DCache.scala 285:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277369.4]
  assign s2_valid_miss = _T_1031 & can_acquire_before_release; // @[DCache.scala 285:84:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277370.4]
  assign _T_1032 = s2_uncached == 1'h0; // @[DCache.scala 286:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277371.4]
  assign _T_1033 = s2_valid_miss & _T_1032; // @[DCache.scala 286:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277372.4]
  assign _T_1035 = uncachedInFlight_0 == 1'h0; // @[DCache.scala 286:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277374.4]
  assign s2_valid_cached_miss = _T_1033 & _T_1035; // @[DCache.scala 286:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277375.4]
  assign s2_want_victimize = s2_valid_cached_miss | s2_flush_valid_pre_tag_ecc; // @[DCache.scala 288:102:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277377.4]
  assign _T_1038 = s2_flush_valid_pre_tag_ecc == 1'h0; // @[DCache.scala 289:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277379.4]
  assign s2_cannot_victimize = _T_1038 & io_cpu_s2_kill; // @[DCache.scala 289:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277380.4]
  assign _T_1039 = s2_cannot_victimize == 1'h0; // @[DCache.scala 290:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277381.4]
  assign s2_victimize = s2_want_victimize & _T_1039; // @[DCache.scala 290:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277382.4]
  assign _T_1040 = s2_valid_miss & s2_uncached; // @[DCache.scala 291:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277383.4]
  assign _T_1041 = ~ uncachedInFlight_0; // @[DCache.scala 291:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277384.4]
  assign _T_1042 = _T_1041 == 1'h0; // @[DCache.scala 291:92:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277385.4]
  assign _T_1043 = _T_1042 == 1'h0; // @[DCache.scala 291:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277386.4]
  assign s2_valid_uncached_pending = _T_1040 & _T_1043; // @[DCache.scala 291:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277387.4]
  assign s2_victim_state_state = s2_hit_valid ? s2_hit_state_state : _T_1054_state; // @[DCache.scala 294:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277407.4]
  assign _T_1070 = _T_1068 ? 3'h5 : 3'h0; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277423.4]
  assign _T_1074 = _T_1072 ? 3'h2 : _T_1070; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277427.4]
  assign _T_1078 = _T_1076 ? 3'h1 : _T_1074; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277431.4]
  assign _T_1082 = _T_1080 ? 3'h1 : _T_1078; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277435.4]
  assign _T_1086 = _T_1084 ? 3'h2 : _T_1082; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277439.4]
  assign _T_1090 = _T_1088 ? 3'h4 : _T_1086; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277443.4]
  assign _T_1091 = _T_1088 ? 2'h1 : 2'h0; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277444.4]
  assign _T_1094 = _T_1092 ? 3'h0 : _T_1090; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277447.4]
  assign _T_1095 = _T_1092 ? 2'h1 : _T_1091; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277448.4]
  assign _T_1098 = _T_1096 ? 3'h0 : _T_1094; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277451.4]
  assign _T_1099 = _T_1096 ? 2'h1 : _T_1095; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277452.4]
  assign _T_1102 = _T_1100 ? 3'h5 : _T_1098; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277455.4]
  assign _T_1103 = _T_1100 ? 2'h0 : _T_1099; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277456.4]
  assign _T_1106 = _T_1104 ? 3'h4 : _T_1102; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277459.4]
  assign _T_1107 = _T_1104 ? 2'h1 : _T_1103; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277460.4]
  assign _T_1110 = _T_1108 ? 3'h3 : _T_1106; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277463.4]
  assign _T_1111 = _T_1108 ? 2'h2 : _T_1107; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277464.4]
  assign s2_report_param = _T_1112 ? 3'h3 : _T_1110; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277467.4]
  assign probeNewCoh_state = _T_1112 ? 2'h2 : _T_1111; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277468.4]
  assign _T_1121 = {2'h2,s2_victim_state_state}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277478.4]
  assign _T_1134 = 4'h8 == _T_1121; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277491.4]
  assign _T_1136 = _T_1134 ? 3'h5 : 3'h0; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277493.4]
  assign _T_1138 = 4'h9 == _T_1121; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277495.4]
  assign _T_1140 = _T_1138 ? 3'h2 : _T_1136; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277497.4]
  assign _T_1142 = 4'ha == _T_1121; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277499.4]
  assign _T_1144 = _T_1142 ? 3'h1 : _T_1140; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277501.4]
  assign _T_1146 = 4'hb == _T_1121; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277503.4]
  assign _T_1148 = _T_1146 ? 3'h1 : _T_1144; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277505.4]
  assign _T_1150 = 4'h4 == _T_1121; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277507.4]
  assign _T_1151 = _T_1150 ? 1'h0 : _T_1146; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277508.4]
  assign _T_1152 = _T_1150 ? 3'h2 : _T_1148; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277509.4]
  assign _T_1154 = 4'h5 == _T_1121; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277511.4]
  assign _T_1155 = _T_1154 ? 1'h0 : _T_1151; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277512.4]
  assign _T_1156 = _T_1154 ? 3'h4 : _T_1152; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277513.4]
  assign _T_1157 = _T_1154 ? 2'h1 : 2'h0; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277514.4]
  assign _T_1158 = 4'h6 == _T_1121; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277515.4]
  assign _T_1159 = _T_1158 ? 1'h0 : _T_1155; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277516.4]
  assign _T_1160 = _T_1158 ? 3'h0 : _T_1156; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277517.4]
  assign _T_1161 = _T_1158 ? 2'h1 : _T_1157; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277518.4]
  assign _T_1162 = 4'h7 == _T_1121; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277519.4]
  assign _T_1163 = _T_1162 ? 1'h1 : _T_1159; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277520.4]
  assign _T_1164 = _T_1162 ? 3'h0 : _T_1160; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277521.4]
  assign _T_1165 = _T_1162 ? 2'h1 : _T_1161; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277522.4]
  assign _T_1166 = 4'h0 == _T_1121; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277523.4]
  assign _T_1167 = _T_1166 ? 1'h0 : _T_1163; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277524.4]
  assign _T_1168 = _T_1166 ? 3'h5 : _T_1164; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277525.4]
  assign _T_1169 = _T_1166 ? 2'h0 : _T_1165; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277526.4]
  assign _T_1170 = 4'h1 == _T_1121; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277527.4]
  assign _T_1171 = _T_1170 ? 1'h0 : _T_1167; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277528.4]
  assign _T_1172 = _T_1170 ? 3'h4 : _T_1168; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277529.4]
  assign _T_1173 = _T_1170 ? 2'h1 : _T_1169; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277530.4]
  assign _T_1174 = 4'h2 == _T_1121; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277531.4]
  assign _T_1175 = _T_1174 ? 1'h0 : _T_1171; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277532.4]
  assign _T_1176 = _T_1174 ? 3'h3 : _T_1172; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277533.4]
  assign _T_1177 = _T_1174 ? 2'h2 : _T_1173; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277534.4]
  assign _T_1178 = 4'h3 == _T_1121; // @[Misc.scala 58:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277535.4]
  assign s2_victim_dirty = _T_1178 ? 1'h1 : _T_1175; // @[Misc.scala 40:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277536.4]
  assign s2_shrink_param = _T_1178 ? 3'h3 : _T_1176; // @[Misc.scala 40:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277537.4]
  assign voluntaryNewCoh_state = _T_1178 ? 2'h2 : _T_1177; // @[Misc.scala 40:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277538.4]
  assign _T_1182 = s2_valid_hit_pre_data_ecc == 1'h0; // @[DCache.scala 300:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277544.4]
  assign _T_1183 = s2_valid & _T_1182; // @[DCache.scala 300:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277545.4]
  assign _T_1184 = s2_valid_uncached_pending & auto_out_a_ready; // @[DCache.scala 300:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277546.4]
  assign _T_1185 = _T_1184 == 1'h0; // @[DCache.scala 300:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277547.4]
  assign _T_1186 = _T_1183 & _T_1185; // @[DCache.scala 300:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277548.4]
  assign _T_1208 = probe_bits_address[11:6]; // @[DCache.scala 927:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277578.4]
  assign _T_1211 = io_cpu_req_bits_addr[39:12]; // @[DCache.scala 309:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277582.4]
  assign _T_1219 = s2_victim_dirty == 1'h0; // @[DCache.scala 317:87:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277598.4]
  assign _T_1220 = s2_want_victimize & _T_1219; // @[DCache.scala 317:84:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277599.4]
  assign _T_1225 = s2_vaddr[11:0]; // @[DCache.scala 321:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277608.4]
  assign _T_1227 = s2_req_addr[39:12]; // @[DCache.scala 322:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277611.4]
  assign _T_1230_state = s2_valid_hit_pre_data_ecc ? s2_grow_param : 2'h0; // @[DCache.scala 322:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277615.4]
  assign _T_1232_tag = _T_1227[25:0]; // @[HellaCache.scala 240:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277616.4 HellaCache.scala 241:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277618.4]
  assign _T_1237 = lrscCount > 7'h0; // @[DCache.scala 329:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277628.4]
  assign _T_1238 = lrscValid == 1'h0; // @[DCache.scala 329:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277629.4]
  assign lrscBackingOff = _T_1237 & _T_1238; // @[DCache.scala 329:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277630.4]
  assign _T_1243 = s2_valid_hit_pre_data_ecc & _T_736; // @[DCache.scala 333:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277637.4]
  assign _T_1245 = _T_1243 & _T_344; // @[DCache.scala 333:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277639.4]
  assign _T_1246 = _T_1245 | s2_valid_cached_miss; // @[DCache.scala 333:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277640.4]
  assign _T_1248 = _T_1246 & _T_725; // @[DCache.scala 333:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277642.4]
  assign _T_1252 = lrscCount - 7'h1; // @[DCache.scala 337:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277651.6]
  assign _T_1253 = $unsigned(_T_1252); // @[DCache.scala 337:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277652.6]
  assign _T_1254 = _T_1253[6:0]; // @[DCache.scala 337:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277653.6]
  assign _T_1255 = s2_valid_not_killed & lrscValid; // @[DCache.scala 338:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277656.4]
  assign _T_1264 = s1_valid_not_nacked & s1_write; // @[DCache.scala 347:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277673.4]
  assign _T_1325 = s1_write & _T_311; // @[DCache.scala 918:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277751.4]
  assign _T_1326 = s1_read | _T_1325; // @[DCache.scala 917:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277752.4]
  assign _T_1330 = s2_valid & s2_write; // @[DCache.scala 354:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277759.4]
  assign _T_1335 = _T_1405 & _T_725; // @[DCache.scala 346:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277765.4]
  assign pstore_drain_opportunistic = _T_459 == 1'h0; // @[DCache.scala 357:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277837.4]
  assign pstore1_valid_likely = _T_1330 | pstore1_held; // @[DCache.scala 360:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277840.4]
  assign pstore1_valid = _T_1335 | pstore1_held; // @[DCache.scala 363:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277850.4]
  assign _T_1412 = pstore1_valid_likely & pstore2_valid; // @[DCache.scala 365:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277853.4]
  assign _T_1413 = s1_valid & s1_write; // @[DCache.scala 365:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277854.4]
  assign _T_1414 = _T_1413 | pstore1_rmw; // @[DCache.scala 365:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277855.4]
  assign pstore_drain_structural = _T_1412 & _T_1414; // @[DCache.scala 365:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277856.4]
  assign _T_1424 = pstore1_valid == pstore1_valid; // @[DCache.scala 366:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277866.4]
  assign _T_1425 = pstore1_rmw | _T_1424; // @[DCache.scala 366:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277867.4]
  assign _T_1427 = _T_1425 | reset; // @[DCache.scala 366:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277869.4]
  assign _T_1428 = _T_1427 == 1'h0; // @[DCache.scala 366:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277870.4]
  assign _T_1442 = pstore1_rmw == 1'h0; // @[DCache.scala 374:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277889.4]
  assign _T_1443 = pstore1_valid & _T_1442; // @[DCache.scala 374:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277890.4]
  assign _T_1444 = _T_1443 | pstore2_valid; // @[DCache.scala 374:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277891.4]
  assign _T_1445 = pstore_drain_opportunistic | releaseInFlight; // @[DCache.scala 374:107:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277892.4]
  assign _T_1446 = _T_1444 & _T_1445; // @[DCache.scala 374:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277893.4]
  assign pstore_drain = pstore_drain_structural | _T_1446; // @[DCache.scala 373:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277894.4]
  assign _T_1456 = pstore1_valid & pstore2_valid; // @[DCache.scala 377:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277904.4]
  assign _T_1457 = pstore_drain == 1'h0; // @[DCache.scala 377:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277905.4]
  assign _T_1460 = pstore2_valid == pstore_drain; // @[DCache.scala 378:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277909.4]
  assign advance_pstore1 = pstore1_valid & _T_1460; // @[DCache.scala 378:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277910.4]
  assign _T_1462 = pstore2_valid & _T_1457; // @[DCache.scala 379:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277912.4]
  assign pstore1_storegen_data = amoalu_io_out; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277698.4 :sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277700.4 DCache.scala 748:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280639.4]
  assign _T_1468 = pstore1_storegen_data[7:0]; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277925.4]
  assign _T_1474 = pstore1_storegen_data[15:8]; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277933.4]
  assign _T_1480 = pstore1_storegen_data[23:16]; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277941.4]
  assign _T_1486 = pstore1_storegen_data[31:24]; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277949.4]
  assign _T_1492 = pstore1_storegen_data[39:32]; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277957.4]
  assign _T_1498 = pstore1_storegen_data[47:40]; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277965.4]
  assign _T_1504 = pstore1_storegen_data[55:48]; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277973.4]
  assign _T_1510 = pstore1_storegen_data[63:56]; // @[DCache.scala 384:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277981.4]
  assign _T_1516 = {_T_1479,_T_1473}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277989.4]
  assign _T_1517 = {_T_1491,_T_1485}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277990.4]
  assign _T_1518 = {_T_1517,_T_1516}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277991.4]
  assign _T_1519 = {_T_1503,_T_1497}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277992.4]
  assign _T_1520 = {_T_1515,_T_1509}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277993.4]
  assign _T_1521 = {_T_1520,_T_1519}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277994.4]
  assign pstore2_storegen_data = {_T_1521,_T_1518}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277995.4]
  assign _T_1525 = ~ pstore1_mask; // @[DCache.scala 390:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278001.6]
  assign _T_1527 = ~ _T_1525; // @[DCache.scala 390:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278003.6]
  assign _T_1540 = pstore1_valid_pre_kill & _T_1442; // @[DCache.scala 374:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278020.4]
  assign _T_1541 = _T_1540 | pstore2_valid; // @[DCache.scala 374:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278021.4]
  assign _T_1543 = _T_1541 & _T_1445; // @[DCache.scala 374:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278023.4]
  assign _T_1546 = pstore2_valid ? pstore2_addr : pstore1_addr; // @[DCache.scala 405:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278028.4]
  assign _T_1551 = pstore2_valid ? mask : pstore1_mask; // @[DCache.scala 410:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278038.4]
  assign _T_1552 = _T_1551[0]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278039.4]
  assign _T_1553 = _T_1551[1]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278040.4]
  assign _T_1554 = _T_1551[2]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278041.4]
  assign _T_1555 = _T_1551[3]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278042.4]
  assign _T_1556 = _T_1551[4]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278043.4]
  assign _T_1557 = _T_1551[5]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278044.4]
  assign _T_1558 = _T_1551[6]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278045.4]
  assign _T_1559 = _T_1551[7]; // @[package.scala 156:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278046.4]
  assign _T_1568 = {_T_1553,_T_1552}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278055.4]
  assign _T_1569 = {_T_1555,_T_1554}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278056.4]
  assign _T_1570 = {_T_1569,_T_1568}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278057.4]
  assign _T_1571 = {_T_1557,_T_1556}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278058.4]
  assign _T_1572 = {_T_1559,_T_1558}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278059.4]
  assign _T_1573 = {_T_1572,_T_1571}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278060.4]
  assign _GEN_324 = {{1'd0}, _T_1041}; // @[DCache.scala 430:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278246.4]
  assign _T_1751 = _GEN_324 << 1; // @[DCache.scala 430:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278246.4]
  assign _T_1752 = _T_1751[0]; // @[OneHot.scala 39:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278247.4]
  assign a_source = _T_1752 ? 1'h0 : 1'h1; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278249.4]
  assign _GEN_325 = {{6'd0}, _T_1240}; // @[DCache.scala 431:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278251.4]
  assign acquire_address = _GEN_325 << 6; // @[DCache.scala 431:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278251.4]
  assign a_size = s2_req_typ[1:0]; // @[Consts.scala 19:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278252.4]
  assign _T_1814 = {{1'd0}, a_size}; // @[Misc.scala 206:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278318.4]
  assign _T_1815 = _T_1814[1:0]; // @[OneHot.scala 51:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278319.4]
  assign _T_1816 = 4'h1 << _T_1815; // @[OneHot.scala 52:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278320.4]
  assign _T_1817 = _T_1816[2:0]; // @[OneHot.scala 52:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278321.4]
  assign _T_1818 = _T_1817 | 3'h1; // @[Misc.scala 206:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278322.4]
  assign _T_1819 = a_size >= 2'h3; // @[Misc.scala 210:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278323.4]
  assign _T_1820 = _T_1818[2]; // @[Misc.scala 213:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278324.4]
  assign _T_1821 = s2_req_addr[2]; // @[Misc.scala 214:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278325.4]
  assign _T_1822 = _T_1821 == 1'h0; // @[Misc.scala 215:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278326.4]
  assign _T_1824 = _T_1820 & _T_1822; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278328.4]
  assign _T_1825 = _T_1819 | _T_1824; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278329.4]
  assign _T_1827 = _T_1820 & _T_1821; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278331.4]
  assign _T_1828 = _T_1819 | _T_1827; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278332.4]
  assign _T_1829 = _T_1818[1]; // @[Misc.scala 213:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278333.4]
  assign _T_1830 = s2_req_addr[1]; // @[Misc.scala 214:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278334.4]
  assign _T_1831 = _T_1830 == 1'h0; // @[Misc.scala 215:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278335.4]
  assign _T_1832 = _T_1822 & _T_1831; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278336.4]
  assign _T_1833 = _T_1829 & _T_1832; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278337.4]
  assign _T_1834 = _T_1825 | _T_1833; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278338.4]
  assign _T_1835 = _T_1822 & _T_1830; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278339.4]
  assign _T_1836 = _T_1829 & _T_1835; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278340.4]
  assign _T_1837 = _T_1825 | _T_1836; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278341.4]
  assign _T_1838 = _T_1821 & _T_1831; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278342.4]
  assign _T_1839 = _T_1829 & _T_1838; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278343.4]
  assign _T_1840 = _T_1828 | _T_1839; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278344.4]
  assign _T_1841 = _T_1821 & _T_1830; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278345.4]
  assign _T_1842 = _T_1829 & _T_1841; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278346.4]
  assign _T_1843 = _T_1828 | _T_1842; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278347.4]
  assign _T_1844 = _T_1818[0]; // @[Misc.scala 213:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278348.4]
  assign _T_1845 = s2_req_addr[0]; // @[Misc.scala 214:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278349.4]
  assign _T_1846 = _T_1845 == 1'h0; // @[Misc.scala 215:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278350.4]
  assign _T_1847 = _T_1832 & _T_1846; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278351.4]
  assign _T_1848 = _T_1844 & _T_1847; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278352.4]
  assign _T_1849 = _T_1834 | _T_1848; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278353.4]
  assign _T_1850 = _T_1832 & _T_1845; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278354.4]
  assign _T_1851 = _T_1844 & _T_1850; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278355.4]
  assign _T_1852 = _T_1834 | _T_1851; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278356.4]
  assign _T_1853 = _T_1835 & _T_1846; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278357.4]
  assign _T_1854 = _T_1844 & _T_1853; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278358.4]
  assign _T_1855 = _T_1837 | _T_1854; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278359.4]
  assign _T_1856 = _T_1835 & _T_1845; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278360.4]
  assign _T_1857 = _T_1844 & _T_1856; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278361.4]
  assign _T_1858 = _T_1837 | _T_1857; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278362.4]
  assign _T_1859 = _T_1838 & _T_1846; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278363.4]
  assign _T_1860 = _T_1844 & _T_1859; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278364.4]
  assign _T_1861 = _T_1840 | _T_1860; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278365.4]
  assign _T_1862 = _T_1838 & _T_1845; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278366.4]
  assign _T_1863 = _T_1844 & _T_1862; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278367.4]
  assign _T_1864 = _T_1840 | _T_1863; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278368.4]
  assign _T_1865 = _T_1841 & _T_1846; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278369.4]
  assign _T_1866 = _T_1844 & _T_1865; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278370.4]
  assign _T_1867 = _T_1843 | _T_1866; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278371.4]
  assign _T_1868 = _T_1841 & _T_1845; // @[Misc.scala 218:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278372.4]
  assign _T_1869 = _T_1844 & _T_1868; // @[Misc.scala 219:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278373.4]
  assign _T_1870 = _T_1843 | _T_1869; // @[Misc.scala 219:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278374.4]
  assign _T_1871 = {_T_1852,_T_1849}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278375.4]
  assign _T_1872 = {_T_1858,_T_1855}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278376.4]
  assign _T_1873 = {_T_1872,_T_1871}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278377.4]
  assign _T_1874 = {_T_1864,_T_1861}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278378.4]
  assign _T_1875 = {_T_1870,_T_1867}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278379.4]
  assign _T_1876 = {_T_1875,_T_1874}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278380.4]
  assign get_mask = {_T_1876,_T_1873}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278381.4]
  assign _T_3100 = 5'hf == s2_req_cmd; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279688.4]
  assign _T_3101_opcode = _T_3100 ? 3'h2 : 3'h0; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  assign _T_3101_param = _T_3100 ? 3'h3 : 3'h0; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  assign _T_3101_size = _T_3100 ? _T_1814 : 3'h0; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  assign _T_3101_source = _T_3100 ? a_source : 1'h0; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  assign _T_3035_address = s2_req_addr[37:0]; // @[Edges.scala 476:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279614.4 Edges.scala 481:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279620.4]
  assign _T_3101_address = _T_3100 ? _T_3035_address : 38'h0; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  assign _T_3101_mask = _T_3100 ? get_mask : 8'h0; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  assign _T_3101_data = _T_3100 ? pstore1_data : 64'h0; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279689.4]
  assign _T_3102 = 5'he == s2_req_cmd; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279690.4]
  assign _T_3103_opcode = _T_3102 ? 3'h2 : _T_3101_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  assign _T_3103_param = _T_3102 ? 3'h2 : _T_3101_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  assign _T_3103_size = _T_3102 ? _T_1814 : _T_3101_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  assign _T_3103_source = _T_3102 ? a_source : _T_3101_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  assign _T_3103_address = _T_3102 ? _T_3035_address : _T_3101_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  assign _T_3103_mask = _T_3102 ? get_mask : _T_3101_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  assign _T_3103_data = _T_3102 ? pstore1_data : _T_3101_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279691.4]
  assign _T_3104 = 5'hd == s2_req_cmd; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279692.4]
  assign _T_3105_opcode = _T_3104 ? 3'h2 : _T_3103_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  assign _T_3105_param = _T_3104 ? 3'h1 : _T_3103_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  assign _T_3105_size = _T_3104 ? _T_1814 : _T_3103_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  assign _T_3105_source = _T_3104 ? a_source : _T_3103_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  assign _T_3105_address = _T_3104 ? _T_3035_address : _T_3103_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  assign _T_3105_mask = _T_3104 ? get_mask : _T_3103_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  assign _T_3105_data = _T_3104 ? pstore1_data : _T_3103_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279693.4]
  assign _T_3106 = 5'hc == s2_req_cmd; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279694.4]
  assign _T_3107_opcode = _T_3106 ? 3'h2 : _T_3105_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  assign _T_3107_param = _T_3106 ? 3'h0 : _T_3105_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  assign _T_3107_size = _T_3106 ? _T_1814 : _T_3105_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  assign _T_3107_source = _T_3106 ? a_source : _T_3105_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  assign _T_3107_address = _T_3106 ? _T_3035_address : _T_3105_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  assign _T_3107_mask = _T_3106 ? get_mask : _T_3105_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  assign _T_3107_data = _T_3106 ? pstore1_data : _T_3105_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279695.4]
  assign _T_3108 = 5'h8 == s2_req_cmd; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279696.4]
  assign _T_3109_opcode = _T_3108 ? 3'h2 : _T_3107_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  assign _T_3109_param = _T_3108 ? 3'h4 : _T_3107_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  assign _T_3109_size = _T_3108 ? _T_1814 : _T_3107_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  assign _T_3109_source = _T_3108 ? a_source : _T_3107_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  assign _T_3109_address = _T_3108 ? _T_3035_address : _T_3107_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  assign _T_3109_mask = _T_3108 ? get_mask : _T_3107_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  assign _T_3109_data = _T_3108 ? pstore1_data : _T_3107_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279697.4]
  assign _T_3110 = 5'hb == s2_req_cmd; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279698.4]
  assign _T_3111_opcode = _T_3110 ? 3'h3 : _T_3109_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  assign _T_3111_param = _T_3110 ? 3'h2 : _T_3109_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  assign _T_3111_size = _T_3110 ? _T_1814 : _T_3109_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  assign _T_3111_source = _T_3110 ? a_source : _T_3109_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  assign _T_3111_address = _T_3110 ? _T_3035_address : _T_3109_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  assign _T_3111_mask = _T_3110 ? get_mask : _T_3109_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  assign _T_3111_data = _T_3110 ? pstore1_data : _T_3109_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279699.4]
  assign _T_3112 = 5'ha == s2_req_cmd; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279700.4]
  assign _T_3113_opcode = _T_3112 ? 3'h3 : _T_3111_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  assign _T_3113_param = _T_3112 ? 3'h1 : _T_3111_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  assign _T_3113_size = _T_3112 ? _T_1814 : _T_3111_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  assign _T_3113_source = _T_3112 ? a_source : _T_3111_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  assign _T_3113_address = _T_3112 ? _T_3035_address : _T_3111_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  assign _T_3113_mask = _T_3112 ? get_mask : _T_3111_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  assign _T_3113_data = _T_3112 ? pstore1_data : _T_3111_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279701.4]
  assign _T_3114 = 5'h9 == s2_req_cmd; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279702.4]
  assign _T_3115_opcode = _T_3114 ? 3'h3 : _T_3113_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  assign _T_3115_param = _T_3114 ? 3'h0 : _T_3113_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  assign _T_3115_size = _T_3114 ? _T_1814 : _T_3113_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  assign _T_3115_source = _T_3114 ? a_source : _T_3113_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  assign _T_3115_address = _T_3114 ? _T_3035_address : _T_3113_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  assign _T_3115_mask = _T_3114 ? get_mask : _T_3113_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  assign _T_3115_data = _T_3114 ? pstore1_data : _T_3113_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279703.4]
  assign _T_3116 = 5'h4 == s2_req_cmd; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279704.4]
  assign atomics_opcode = _T_3116 ? 3'h3 : _T_3115_opcode; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  assign atomics_param = _T_3116 ? 3'h3 : _T_3115_param; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  assign atomics_size = _T_3116 ? _T_1814 : _T_3115_size; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  assign atomics_source = _T_3116 ? a_source : _T_3115_source; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  assign atomics_address = _T_3116 ? _T_3035_address : _T_3115_address; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  assign atomics_mask = _T_3116 ? get_mask : _T_3115_mask; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  assign atomics_data = _T_3116 ? pstore1_data : _T_3115_data; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279705.4]
  assign _T_3120 = s2_valid_cached_miss & _T_1219; // @[DCache.scala 454:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279709.4]
  assign _T_3121 = _T_3120 | s2_valid_uncached_pending; // @[DCache.scala 454:128:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279710.4]
  assign tl_out_a_valid = _T_725 & _T_3121; // @[DCache.scala 454:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279711.4]
  assign _T_3252 = s2_write == 1'h0; // @[DCache.scala 455:89:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279850.4]
  assign _T_3253 = s2_read == 1'h0; // @[DCache.scala 455:109:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279851.4]
  assign _T_3254_opcode = _T_3253 ? 3'h0 : atomics_opcode; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  assign _T_3254_param = _T_3253 ? 3'h0 : atomics_param; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  assign _T_3254_size = _T_3253 ? _T_1814 : atomics_size; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  assign _T_3254_source = _T_3253 ? a_source : atomics_source; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  assign _T_3254_address = _T_3253 ? _T_3035_address : atomics_address; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  assign _T_3254_mask = _T_3253 ? get_mask : atomics_mask; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  assign _T_3254_data = _T_3253 ? pstore1_data : atomics_data; // @[DCache.scala 455:108:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279852.4]
  assign _T_3255_opcode = _T_3252 ? 3'h4 : _T_3254_opcode; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  assign _T_3255_param = _T_3252 ? 3'h0 : _T_3254_param; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  assign _T_3255_size = _T_3252 ? _T_1814 : _T_3254_size; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  assign _T_3255_source = _T_3252 ? a_source : _T_3254_source; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  assign _T_3255_address = _T_3252 ? _T_3035_address : _T_3254_address; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  assign _T_3255_mask = _T_3252 ? get_mask : _T_3254_mask; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  assign _T_3255_data = _T_3252 ? 64'h0 : _T_3254_data; // @[DCache.scala 455:88:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279853.4]
  assign _T_3187_param = {{1'd0}, s2_grow_param}; // @[Edges.scala 323:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279776.4 Edges.scala 325:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279779.4]
  assign _T_3187_address = acquire_address[37:0]; // @[Edges.scala 323:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279776.4 Edges.scala 328:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279782.4]
  assign _T_3258 = 2'h1 << a_source; // @[OneHot.scala 52:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279857.4]
  assign a_sel = _T_3258[1:1]; // @[DCache.scala 458:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279859.4]
  assign _T_3260 = auto_out_a_ready & tl_out_a_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279860.4]
  assign _T_3272 = _T_3271 - 4'h1; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279882.4]
  assign _T_3273 = $unsigned(_T_3272); // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279883.4]
  assign _T_3274 = _T_3273[3:0]; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279884.4]
  assign d_done = d_last & _T_3296; // @[Edges.scala 233:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279889.4]
  assign _T_3277 = ~ _T_3274; // @[Edges.scala 234:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279890.4]
  assign _T_3278 = _T_3269 & _T_3277; // @[Edges.scala 234:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279891.4]
  assign _GEN_327 = {{3'd0}, _T_3278}; // @[Edges.scala 269:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279896.4]
  assign d_address_inc = _GEN_327 << 3; // @[Edges.scala 269:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279896.4]
  assign grantIsVoluntary = auto_out_d_bits_opcode == 3'h6; // @[DCache.scala 490:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279906.4]
  assign _T_3289 = blockProbeAfterGrantCount - 3'h1; // @[DCache.scala 494:97:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279912.6]
  assign _T_3290 = $unsigned(_T_3289); // @[DCache.scala 494:97:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279913.6]
  assign _T_3291 = _T_3290[2:0]; // @[DCache.scala 494:97:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279914.6]
  assign _T_3298 = cached_grant_wait | reset; // @[DCache.scala 500:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279927.8]
  assign _T_3299 = _T_3298 == 1'h0; // @[DCache.scala 500:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279928.8]
  assign _T_3301 = 2'h1 << auto_out_d_bits_source; // @[OneHot.scala 52:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279943.10]
  assign d_sel = _T_3301[1:1]; // @[DCache.scala 508:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279945.10]
  assign _T_3305 = d_sel & d_last; // @[DCache.scala 511:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279948.10]
  assign _T_3307 = uncachedInFlight_0 | reset; // @[DCache.scala 512:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279951.12]
  assign _T_3308 = _T_3307 == 1'h0; // @[DCache.scala 512:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279952.12]
  assign _T_3310 = tlb_io_resp_paddr[37:3]; // @[DCache.scala 524:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279965.12]
  assign _GEN_328 = {{3'd0}, _T_3310}; // @[DCache.scala 524:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279966.12]
  assign dontCareBits = _GEN_328 << 3; // @[DCache.scala 524:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279966.12]
  assign _T_3311 = uncachedReqs_0_addr[2:0]; // @[DCache.scala 525:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279967.12]
  assign _GEN_329 = {{35'd0}, _T_3311}; // @[DCache.scala 525:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279968.12]
  assign _T_3312 = dontCareBits | _GEN_329; // @[DCache.scala 525:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279968.12]
  assign _T_3314 = release_ack_wait | reset; // @[DCache.scala 530:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279976.12]
  assign _T_3315 = _T_3314 == 1'h0; // @[DCache.scala 530:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279977.12]
  assign _T_3316 = auto_out_d_valid & d_first; // @[DCache.scala 536:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279985.4]
  assign _T_3317 = _T_3316 & grantIsCached; // @[DCache.scala 536:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279986.4]
  assign tl_out__e_valid = _T_3332 ? 1'h0 : _T_3317; // @[DCache.scala 544:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280010.4]
  assign _T_3321 = auto_out_e_ready & tl_out__e_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279993.4]
  assign _T_3323 = _T_3296 & d_first; // @[DCache.scala 538:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279995.4]
  assign _T_3324 = _T_3323 & grantIsCached; // @[DCache.scala 538:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279996.4]
  assign _T_3325 = _T_3321 == _T_3324; // @[DCache.scala 538:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279997.4]
  assign _T_3327 = _T_3325 | reset; // @[DCache.scala 538:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279999.4]
  assign _T_3328 = _T_3327 == 1'h0; // @[DCache.scala 538:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280000.4]
  assign _T_3329 = auto_out_d_valid & grantIsRefill; // @[DCache.scala 543:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280005.4]
  assign _T_3333 = s2_vaddr[39:6]; // @[DCache.scala 550:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280015.4]
  assign _GEN_330 = {{6'd0}, _T_3333}; // @[DCache.scala 550:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280016.4]
  assign _T_3334 = _GEN_330 << 6; // @[DCache.scala 550:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280016.4]
  assign _GEN_331 = {{33'd0}, d_address_inc}; // @[DCache.scala 550:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280017.4]
  assign _T_3335 = _T_3334 | _GEN_331; // @[DCache.scala 550:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280017.4]
  assign _T_3338 = grantIsCached & d_done; // @[DCache.scala 564:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280026.4]
  assign _T_3339 = auto_out_d_bits_denied == 1'h0; // @[DCache.scala 564:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280027.4]
  assign _T_3397 = {_T_916,auto_out_d_bits_param}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280090.4]
  assign _T_3406 = 4'hc == _T_3397; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280099.4]
  assign _T_3407 = _T_3406 ? 2'h3 : 2'h0; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280100.4]
  assign _T_3408 = 4'h4 == _T_3397; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280101.4]
  assign _T_3409 = _T_3408 ? 2'h2 : _T_3407; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280102.4]
  assign _T_3410 = 4'h0 == _T_3397; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280103.4]
  assign _T_3411 = _T_3410 ? 2'h2 : _T_3409; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280104.4]
  assign _T_3412 = 4'h1 == _T_3397; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280105.4]
  assign _T_3413 = _T_3412 ? 2'h1 : _T_3411; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280106.4]
  assign _GEN_170 = auto_out_d_valid ? 1'h0 : _GEN_19; // @[DCache.scala 577:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280122.6]
  assign _GEN_171 = auto_out_d_valid ? 1'h1 : _T_3329; // @[DCache.scala 577:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280122.6]
  assign _GEN_172 = auto_out_d_valid ? 1'h0 : 1'h1; // @[DCache.scala 577:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280122.6]
  assign _T_3429 = _T_3431 | lrscBackingOff; // @[DCache.scala 588:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280137.4]
  assign _T_3430 = auto_out_b_valid & _T_3429; // @[DCache.scala 588:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280138.4]
  assign _T_3437 = auto_out_b_bits_address[11:6]; // @[DCache.scala 927:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280148.4]
  assign _T_3438 = io_cpu_req_bits_addr[39:38]; // @[DCache.scala 592:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280150.4]
  assign _T_3439 = {_T_3438,auto_out_b_bits_address}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280151.4]
  assign _T_3450 = _T_3449 - 4'h1; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280164.4]
  assign _T_3451 = $unsigned(_T_3450); // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280165.4]
  assign _T_3452 = _T_3451[3:0]; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280166.4]
  assign c_first = _T_3449 == 4'h0; // @[Edges.scala 231:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280167.4]
  assign _T_3455 = ~ _T_3452; // @[Edges.scala 234:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280172.4]
  assign c_count = _T_3447 & _T_3455; // @[Edges.scala 234:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280173.4]
  assign _T_3457 = auto_out_c_ready == 1'h0; // @[DCache.scala 598:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280178.4]
  assign releaseRejected = tl_out__c_valid & _T_3457; // @[DCache.scala 598:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280179.4]
  assign _T_3460 = releaseRejected == 1'h0; // @[DCache.scala 600:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280183.4]
  assign _T_3463 = {1'h0,c_count}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280187.4]
  assign _T_3464 = {1'h0,s2_release_data_valid}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280188.4]
  assign _GEN_332 = {{1'd0}, s1_release_data_valid}; // @[DCache.scala 601:101:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280189.4]
  assign _T_3466 = _GEN_332 + _T_3464; // @[DCache.scala 601:101:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280190.4]
  assign _T_3467 = releaseRejected ? 2'h0 : _T_3466; // @[DCache.scala 601:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280191.4]
  assign _GEN_333 = {{3'd0}, _T_3467}; // @[DCache.scala 601:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280192.4]
  assign releaseDataBeat = _T_3463 + _GEN_333; // @[DCache.scala 601:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280193.4]
  assign _T_3493 = s2_victimize & s2_victim_dirty; // @[DCache.scala 615:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280249.4]
  assign _T_3494 = s2_valid & s2_hit_valid; // @[DCache.scala 616:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280251.6]
  assign _T_3497 = _T_3494 == 1'h0; // @[DCache.scala 616:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280254.6]
  assign _T_3499 = _T_3497 | reset; // @[DCache.scala 616:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280256.6]
  assign _T_3500 = _T_3499 == 1'h0; // @[DCache.scala 616:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280257.6]
  assign _T_3501 = s2_req_addr[11:6]; // @[DCache.scala 618:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280263.6]
  assign _T_3502 = {s2_victim_tag,_T_3501}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280264.6]
  assign _GEN_334 = {{6'd0}, _T_3502}; // @[DCache.scala 618:96:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280265.6]
  assign res_2_address = _GEN_334 << 6; // @[DCache.scala 618:96:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280265.6]
  assign _GEN_180 = _T_3493 ? 3'h1 : release_state; // @[DCache.scala 615:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280250.4]
  assign _T_3507 = releaseDone ? 3'h7 : 3'h3; // @[DCache.scala 629:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280288.12]
  assign _T_3509 = releaseDone ? 3'h0 : 3'h5; // @[DCache.scala 633:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280295.12]
  assign _GEN_191 = _T_3506 ? s2_report_param : 3'h5; // @[DCache.scala 626:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280285.10]
  assign _GEN_197 = _T_3506 ? _T_3507 : _T_3509; // @[DCache.scala 626:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280285.10]
  assign _GEN_199 = s2_prb_ack_data ? 3'h2 : _GEN_197; // @[DCache.scala 624:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280280.8]
  assign _GEN_202 = s2_prb_ack_data ? 3'h5 : _GEN_191; // @[DCache.scala 624:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280280.8]
  assign _GEN_220 = s2_probe ? _GEN_199 : _GEN_180; // @[DCache.scala 620:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280272.4]
  assign _GEN_223 = s2_probe ? _GEN_202 : 3'h5; // @[DCache.scala 620:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280272.4]
  assign _T_3510 = release_state == 3'h4; // @[DCache.scala 637:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280302.4]
  assign _T_3513 = {_T_3438,probe_bits_address}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280308.6]
  assign _GEN_230 = metaArb_io_in_6_ready ? 3'h0 : _GEN_220; // @[DCache.scala 641:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280310.6]
  assign _GEN_235 = _T_3510 ? _GEN_230 : _GEN_220; // @[DCache.scala 637:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280303.4]
  assign _GEN_237 = releaseDone ? 3'h0 : _GEN_235; // @[DCache.scala 648:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280318.6]
  assign _GEN_239 = _T_3514 ? _GEN_237 : _GEN_235; // @[DCache.scala 646:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280316.4]
  assign _GEN_243 = _T_3515 ? s2_report_param : _GEN_223; // @[DCache.scala 650:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280323.4]
  assign _GEN_252 = _T_3516 ? s2_report_param : _GEN_243; // @[DCache.scala 655:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280331.4]
  assign _T_3583 = _T_3440 & c_first; // @[DCache.scala 668:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280417.6]
  assign newCoh_state = _T_3519 ? voluntaryNewCoh_state : probeNewCoh_state; // @[DCache.scala 659:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280340.4]
  assign _T_3585 = releaseDataBeat < 5'h8; // @[DCache.scala 676:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280427.4]
  assign _GEN_342 = {{6'd0}, _T_1208}; // @[DCache.scala 679:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280433.4]
  assign _T_3588 = _GEN_342 << 6; // @[DCache.scala 679:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280433.4]
  assign _T_3589 = releaseDataBeat[2:0]; // @[DCache.scala 679:90:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280434.4]
  assign _GEN_343 = {{3'd0}, _T_3589}; // @[DCache.scala 679:117:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280435.4]
  assign _T_3590 = _GEN_343 << 3; // @[DCache.scala 679:117:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280435.4]
  assign _GEN_344 = {{6'd0}, _T_3590}; // @[DCache.scala 679:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280436.4]
  assign _T_3595 = release_state == 3'h7; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280443.4]
  assign _T_3599 = probe_bits_address[11:0]; // @[DCache.scala 687:90:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280451.4]
  assign _T_3601 = probe_bits_address[37:12]; // @[DCache.scala 688:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280454.4]
  assign _T_3605 = metaArb_io_in_4_ready & metaArb_io_in_4_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280461.4]
  assign _T_3610 = s1_valid | s2_valid; // @[DCache.scala 701:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280475.4]
  assign _T_3611 = _T_3610 | cached_grant_wait; // @[DCache.scala 701:94:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280476.4]
  assign _T_3613 = _T_3611 | uncachedInFlight_0; // @[DCache.scala 701:115:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280478.4]
  assign _T_3646 = _T_1182 | reset; // @[DCache.scala 723:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280548.6]
  assign _T_3647 = _T_3646 == 1'h0; // @[DCache.scala 723:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280549.6]
  assign _T_3649 = s2_req_typ[2]; // @[Consts.scala 20:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280563.4]
  assign _T_3650 = _T_3649 == 1'h0; // @[Consts.scala 20:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280564.4]
  assign _T_3653 = s2_data_corrected[63:32]; // @[AMOALU.scala 39:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280567.4]
  assign _T_3654 = s2_data_corrected[31:0]; // @[AMOALU.scala 39:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280568.4]
  assign _T_3655 = _T_1821 ? _T_3653 : _T_3654; // @[AMOALU.scala 39:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280569.4]
  assign _T_3658 = a_size == 2'h2; // @[AMOALU.scala 42:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280572.4]
  assign _T_3660 = _T_3655[31]; // @[AMOALU.scala 42:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280574.4]
  assign _T_3661 = _T_3650 & _T_3660; // @[AMOALU.scala 42:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280575.4]
  assign _T_3663 = _T_3661 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280577.4]
  assign _T_3665 = _T_3658 ? _T_3663 : _T_3653; // @[AMOALU.scala 42:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280579.4]
  assign _T_3666 = {_T_3665,_T_3655}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280580.4]
  assign _T_3668 = _T_3666[31:16]; // @[AMOALU.scala 39:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280582.4]
  assign _T_3669 = _T_3666[15:0]; // @[AMOALU.scala 39:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280583.4]
  assign _T_3670 = _T_1830 ? _T_3668 : _T_3669; // @[AMOALU.scala 39:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280584.4]
  assign _T_3673 = a_size == 2'h1; // @[AMOALU.scala 42:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280587.4]
  assign _T_3675 = _T_3670[15]; // @[AMOALU.scala 42:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280589.4]
  assign _T_3676 = _T_3650 & _T_3675; // @[AMOALU.scala 42:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280590.4]
  assign _T_3678 = _T_3676 ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280592.4]
  assign _T_3679 = _T_3666[63:16]; // @[AMOALU.scala 42:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280593.4]
  assign _T_3680 = _T_3673 ? _T_3678 : _T_3679; // @[AMOALU.scala 42:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280594.4]
  assign _T_3681 = {_T_3680,_T_3670}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280595.4]
  assign _T_3683 = _T_3681[15:8]; // @[AMOALU.scala 39:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280597.4]
  assign _T_3684 = _T_3681[7:0]; // @[AMOALU.scala 39:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280598.4]
  assign _T_3685 = _T_1845 ? _T_3683 : _T_3684; // @[AMOALU.scala 39:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280599.4]
  assign _T_3687 = _T_738 ? 8'h0 : _T_3685; // @[AMOALU.scala 41:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280601.4]
  assign _T_3688 = a_size == 2'h0; // @[AMOALU.scala 42:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280602.4]
  assign _T_3689 = _T_3688 | _T_738; // @[AMOALU.scala 42:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280603.4]
  assign _T_3690 = _T_3687[7]; // @[AMOALU.scala 42:85:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280604.4]
  assign _T_3691 = _T_3650 & _T_3690; // @[AMOALU.scala 42:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280605.4]
  assign _T_3693 = _T_3691 ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280607.4]
  assign _T_3694 = _T_3681[63:8]; // @[AMOALU.scala 42:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280608.4]
  assign _T_3695 = _T_3689 ? _T_3693 : _T_3694; // @[AMOALU.scala 42:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280609.4]
  assign _T_3696 = {_T_3695,_T_3687}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280610.4]
  assign _GEN_345 = {{63'd0}, s2_sc_fail}; // @[DCache.scala 735:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280611.4]
  assign flushCounterNext = flushCounter + 8'h1; // @[DCache.scala 763:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280650.4]
  assign _T_3720 = flushCounterNext[8:6]; // @[DCache.scala 764:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280651.4]
  assign flushDone = _T_3720 == 3'h4; // @[DCache.scala 764:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280652.4]
  assign _T_3721 = s2_req_cmd == 5'h5; // @[DCache.scala 766:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280654.4]
  assign _T_3722 = s2_valid_masked & _T_3721; // @[DCache.scala 766:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280655.4]
  assign _T_3737 = metaArb_io_in_5_ready & metaArb_io_in_5_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280676.4]
  assign _T_3739 = _T_3737 & _T_627; // @[DCache.scala 774:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280678.4]
  assign _T_3741 = _T_3739 & _T_1038; // @[DCache.scala 774:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280680.4]
  assign _T_3743 = _T_3741 & _T_343; // @[DCache.scala 774:95:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280682.4]
  assign _GEN_346 = {{6'd0}, metaArb_io_in_5_bits_idx}; // @[DCache.scala 778:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280691.4]
  assign _T_3748 = _GEN_346 << 6; // @[DCache.scala 778:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280691.4]
  assign _GEN_295 = resetting ? flushCounterNext : {{1'd0}, flushCounter}; // @[DCache.scala 805:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280711.4]
  assign _T_3757 = io_ptw_customCSRs_csrs_0_value[0]; // @[CustomCSRs.scala 37:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280717.4]
  assign _T_3758 = _T_3757 | io_cpu_keep_clock_enabled; // @[DCache.scala 814:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280718.4]
  assign _T_3759 = _T_3758 | metaArb_io_out_valid; // @[DCache.scala 815:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280719.4]
  assign _T_3760 = _T_3759 | s1_probe; // @[DCache.scala 816:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280720.4]
  assign _T_3761 = _T_3760 | s2_probe; // @[DCache.scala 817:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280721.4]
  assign _T_3762 = _T_3761 | s1_valid; // @[DCache.scala 817:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280722.4]
  assign _T_3763 = _T_3762 | s2_valid_pre_xcpt; // @[DCache.scala 818:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280723.4]
  assign _T_3764 = _T_3763 | pstore1_held; // @[DCache.scala 818:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280724.4]
  assign _T_3765 = _T_3764 | pstore2_valid; // @[DCache.scala 819:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280725.4]
  assign _T_3767 = _T_3765 | _T_721; // @[DCache.scala 819:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280727.4]
  assign _T_3768 = _T_3767 | release_ack_wait; // @[DCache.scala 820:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280728.4]
  assign _T_3772 = _T_3768 | _T_524; // @[DCache.scala 821:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280732.4]
  assign _T_3773 = _T_3772 | cached_grant_wait; // @[DCache.scala 822:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280733.4]
  assign _T_3775 = _T_3773 | uncachedInFlight_0; // @[DCache.scala 823:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280735.4]
  assign _T_3777 = _T_3775 | _T_1237; // @[DCache.scala 823:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280737.4]
  assign _T_3842 = grantIsCached == 1'h0; // @[DCache.scala 861:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280817.4]
  assign auto_out_a_valid = _T_725 & _T_3121; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_a_bits_opcode = _T_1032 ? 3'h6 : _T_3255_opcode; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_a_bits_param = _T_1032 ? _T_3187_param : _T_3255_param; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_a_bits_size = _T_1032 ? 3'h6 : _T_3255_size; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_a_bits_source = _T_1032 ? 1'h0 : _T_3255_source; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_a_bits_address = _T_1032 ? _T_3187_address : _T_3255_address; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_a_bits_mask = _T_1032 ? 8'hff : _T_3255_mask; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_a_bits_data = _T_1032 ? 64'h0 : _T_3255_data; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_b_ready = _T_3434 & _T_3435; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_c_valid = _T_3515 ? 1'h1 : _GEN_238; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_c_bits_opcode = _T_3519 ? 3'h7 : _GEN_251; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_c_bits_param = _T_3519 ? s2_shrink_param : _GEN_252; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_c_bits_size = _T_3519 ? 3'h6 : probe_bits_size; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_c_bits_source = probe_bits_source; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_c_bits_address = probe_bits_address; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_c_bits_data = {_T_1012,_T_1009}; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_d_ready = _T_3421 ? 1'h0 : _GEN_169; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_e_valid = _T_3332 ? 1'h0 : _T_3317; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign auto_out_e_bits_sink = auto_out_d_bits_sink; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276391.4]
  assign io_cpu_req_ready = _T_3421 ? _GEN_170 : _GEN_19; // @[DCache.scala 159:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276556.4 DCache.scala 173:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276665.6 DCache.scala 181:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276734.6 DCache.scala 192:98:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276756.6 DCache.scala 578:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280123.8]
  assign io_cpu_s2_nack = _T_3722 ? 1'h0 : _T_1186; // @[DCache.scala 300:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277549.4 DCache.scala 767:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280658.6]
  assign io_cpu_resp_valid = doUncachedResp ? 1'h1 : s2_valid_hit_pre_data_ecc; // @[DCache.scala 692:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280465.4 DCache.scala 724:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280554.6]
  assign io_cpu_resp_bits_addr = doUncachedResp ? s2_uncached_resp_addr : s2_req_addr; // @[DCache.scala 693:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280466.4 DCache.scala 726:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280556.6]
  assign io_cpu_resp_bits_tag = s2_req_tag; // @[DCache.scala 693:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280466.4]
  assign io_cpu_resp_bits_cmd = s2_req_cmd; // @[DCache.scala 693:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280466.4]
  assign io_cpu_resp_bits_typ = s2_req_typ; // @[DCache.scala 693:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280466.4]
  assign io_cpu_resp_bits_data = _T_3696 | _GEN_345; // @[DCache.scala 693:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280466.4 DCache.scala 735:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280612.4]
  assign io_cpu_resp_bits_replay = doUncachedResp; // @[DCache.scala 695:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280468.4 DCache.scala 725:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280555.6]
  assign io_cpu_resp_bits_has_data = _T_739 | _T_756; // @[DCache.scala 694:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280467.4]
  assign io_cpu_resp_bits_data_word_bypass = {_T_3665,_T_3655}; // @[DCache.scala 736:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280628.4]
  assign io_cpu_resp_bits_store_data = pstore1_data; // @[DCache.scala 738:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280630.4]
  assign io_cpu_replay_next = _T_3296 & grantIsUncachedData; // @[DCache.scala 719:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280538.4]
  assign io_cpu_s2_xcpt_ma_ld = _T_3617 ? _T_3619_ma_ld : 1'h0; // @[DCache.scala 705:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280533.4]
  assign io_cpu_s2_xcpt_ma_st = _T_3617 ? _T_3619_ma_st : 1'h0; // @[DCache.scala 705:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280533.4]
  assign io_cpu_s2_xcpt_pf_ld = _T_3617 ? _T_3619_pf_ld : 1'h0; // @[DCache.scala 705:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280533.4]
  assign io_cpu_s2_xcpt_pf_st = _T_3617 ? _T_3619_pf_st : 1'h0; // @[DCache.scala 705:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280533.4]
  assign io_cpu_s2_xcpt_ae_ld = _T_3617 ? _T_3619_ae_ld : 1'h0; // @[DCache.scala 705:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280533.4]
  assign io_cpu_s2_xcpt_ae_st = _T_3617 ? _T_3619_ae_st : 1'h0; // @[DCache.scala 705:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280533.4]
  assign io_cpu_ordered = _T_3613 == 1'h0; // @[DCache.scala 701:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280480.4]
  assign io_cpu_perf_grant = d_last & _T_3296; // @[DCache.scala 829:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280790.4]
  assign io_cpu_clock_enabled = clock_en_reg; // @[DCache.scala 89:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276393.4]
  assign io_ptw_req_valid = tlb_io_ptw_req_valid; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign io_ptw_req_bits_valid = tlb_io_ptw_req_bits_valid; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign io_ptw_req_bits_bits_addr = tlb_io_ptw_req_bits_bits_addr; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign metaArb_io_in_0_valid = resetting; // @[DCache.scala 800:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280696.4]
  assign metaArb_io_in_0_bits_addr = metaArb_io_in_5_bits_addr; // @[DCache.scala 801:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280697.4]
  assign metaArb_io_in_0_bits_idx = metaArb_io_in_5_bits_idx; // @[DCache.scala 801:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280697.4]
  assign metaArb_io_in_0_bits_data = {2'h0,_T_1232_tag}; // @[DCache.scala 801:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280697.4 DCache.scala 804:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280710.4]
  assign metaArb_io_in_2_valid = _T_1187 | _T_1220; // @[DCache.scala 317:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277601.4]
  assign metaArb_io_in_2_bits_write = s2_cannot_victimize == 1'h0; // @[DCache.scala 318:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277603.4]
  assign metaArb_io_in_2_bits_addr = {_T_1211,_T_1225}; // @[DCache.scala 321:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277610.4]
  assign metaArb_io_in_2_bits_idx = s2_vaddr[11:6]; // @[DCache.scala 320:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277606.4]
  assign metaArb_io_in_2_bits_way_en = s2_hit_valid ? s2_hit_way : _T_1047; // @[DCache.scala 319:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277604.4]
  assign metaArb_io_in_2_bits_data = {_T_1230_state,_T_1232_tag}; // @[DCache.scala 322:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277621.4]
  assign metaArb_io_in_3_valid = _T_3338 & _T_3339; // @[DCache.scala 564:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280029.4]
  assign metaArb_io_in_3_bits_addr = {_T_1211,_T_1225}; // @[DCache.scala 568:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280037.4]
  assign metaArb_io_in_3_bits_idx = s2_vaddr[11:6]; // @[DCache.scala 567:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280033.4]
  assign metaArb_io_in_3_bits_way_en = s2_hit_valid ? s2_hit_way : _T_1047; // @[DCache.scala 566:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280031.4]
  assign metaArb_io_in_3_bits_data = {_T_3413,_T_1232_tag}; // @[DCache.scala 569:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280115.4]
  assign metaArb_io_in_4_valid = _T_3518 | _T_3595; // @[DCache.scala 683:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280445.4]
  assign metaArb_io_in_4_bits_addr = {_T_1211,_T_3599}; // @[DCache.scala 687:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280453.4]
  assign metaArb_io_in_4_bits_idx = probe_bits_address[11:6]; // @[DCache.scala 686:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280449.4]
  assign metaArb_io_in_4_bits_way_en = _T_3519 ? s2_victim_way : s2_probe_way; // @[DCache.scala 685:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280447.4]
  assign metaArb_io_in_4_bits_data = {newCoh_state,_T_3601}; // @[DCache.scala 688:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280460.4]
  assign metaArb_io_in_5_valid = 1'h0; // @[DCache.scala 775:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280686.4]
  assign metaArb_io_in_5_bits_addr = {_T_1211,_T_3748}; // @[DCache.scala 778:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280693.4]
  assign metaArb_io_in_5_bits_idx = flushCounter[5:0]; // @[DCache.scala 777:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280689.4]
  assign metaArb_io_in_6_valid = _T_3510 ? 1'h1 : _T_3430; // @[DCache.scala 588:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280139.4 DCache.scala 638:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280304.6]
  assign metaArb_io_in_6_bits_addr = _T_3510 ? _T_3513 : _T_3439; // @[DCache.scala 592:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280152.4 DCache.scala 640:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280309.6]
  assign metaArb_io_in_6_bits_idx = _T_3510 ? _T_1208 : _T_3437; // @[DCache.scala 591:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280149.4 DCache.scala 639:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280306.6]
  assign metaArb_io_in_6_bits_way_en = metaArb_io_in_4_bits_way_en; // @[DCache.scala 593:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280153.4]
  assign metaArb_io_in_6_bits_data = metaArb_io_in_4_bits_data; // @[DCache.scala 594:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280154.4]
  assign metaArb_io_in_7_valid = io_cpu_req_valid; // @[DCache.scala 175:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276725.4]
  assign metaArb_io_in_7_bits_addr = io_cpu_req_bits_addr; // @[DCache.scala 178:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276729.4]
  assign metaArb_io_in_7_bits_idx = io_cpu_req_bits_addr[11:6]; // @[DCache.scala 177:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276728.4]
  assign metaArb_io_in_7_bits_way_en = metaArb_io_in_4_bits_way_en; // @[DCache.scala 179:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276730.4]
  assign metaArb_io_in_7_bits_data = metaArb_io_in_4_bits_data; // @[DCache.scala 180:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276731.4]
  assign metaArb_io_out_ready = clock_en_reg; // @[DCache.scala 114:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276445.4]
  assign data_clock = gated_clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276417.4]
  assign data_io_req_valid = dataArb_io_out_valid; // @[DCache.scala 111:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276426.4]
  assign data_io_req_bits_addr = dataArb_io_out_bits_addr; // @[DCache.scala 111:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276426.4]
  assign data_io_req_bits_write = dataArb_io_out_bits_write; // @[DCache.scala 111:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276426.4]
  assign data_io_req_bits_wdata = {_T_270,_T_267}; // @[DCache.scala 111:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276426.4 DCache.scala 112:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276443.4]
  assign data_io_req_bits_eccMask = dataArb_io_out_bits_eccMask; // @[DCache.scala 111:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276426.4]
  assign data_io_req_bits_way_en = dataArb_io_out_bits_way_en; // @[DCache.scala 111:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276426.4]
  assign dataArb_io_in_0_valid = pstore_drain_structural | _T_1543; // @[DCache.scala 403:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278026.4]
  assign dataArb_io_in_0_bits_addr = _T_1546[11:0]; // @[DCache.scala 405:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278029.4]
  assign dataArb_io_in_0_bits_write = pstore_drain_structural | _T_1446; // @[DCache.scala 404:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278027.4]
  assign dataArb_io_in_0_bits_wdata = pstore2_valid ? pstore2_storegen_data : pstore1_data; // @[DCache.scala 407:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278033.4]
  assign dataArb_io_in_0_bits_eccMask = {_T_1573,_T_1570}; // @[DCache.scala 410:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278062.4]
  assign dataArb_io_in_0_bits_way_en = pstore2_valid ? pstore2_way : pstore1_way; // @[DCache.scala 406:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@278031.4]
  assign dataArb_io_in_1_valid = _T_3421 ? _GEN_171 : _T_3329; // @[DCache.scala 543:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280007.4 DCache.scala 579:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280124.8]
  assign dataArb_io_in_1_bits_addr = _T_3335[11:0]; // @[DCache.scala 550:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280018.4]
  assign dataArb_io_in_1_bits_write = _T_3421 ? _GEN_172 : 1'h1; // @[DCache.scala 549:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280014.4 DCache.scala 580:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280125.8]
  assign dataArb_io_in_1_bits_wdata = auto_out_d_bits_data; // @[DCache.scala 110:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276423.4 DCache.scala 552:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280020.4]
  assign dataArb_io_in_1_bits_eccMask = 8'hff; // @[DCache.scala 555:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280025.4]
  assign dataArb_io_in_1_bits_way_en = s2_hit_valid ? s2_hit_way : _T_1047; // @[DCache.scala 551:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280019.4]
  assign dataArb_io_in_2_valid = inWriteback & _T_3585; // @[DCache.scala 676:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280429.4]
  assign dataArb_io_in_2_bits_addr = _T_3588 | _GEN_344; // @[DCache.scala 677:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280430.4 DCache.scala 679:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280437.4]
  assign dataArb_io_in_2_bits_wdata = dataArb_io_in_1_bits_wdata; // @[DCache.scala 110:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276424.4 DCache.scala 677:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280430.4]
  assign dataArb_io_in_2_bits_eccMask = dataArb_io_in_1_bits_eccMask; // @[DCache.scala 677:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280430.4]
  assign dataArb_io_in_3_valid = io_cpu_req_valid & res; // @[DCache.scala 167:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276654.4]
  assign dataArb_io_in_3_bits_addr = io_cpu_req_bits_addr[11:0]; // @[DCache.scala 168:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276655.4 DCache.scala 170:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276657.4]
  assign dataArb_io_in_3_bits_wdata = dataArb_io_in_1_bits_wdata; // @[DCache.scala 110:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276425.4 DCache.scala 168:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276655.4]
  assign dataArb_io_in_3_bits_eccMask = dataArb_io_in_1_bits_eccMask; // @[DCache.scala 168:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276655.4]
  assign tlb_clock = gated_clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276738.4]
  assign tlb_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276739.4]
  assign tlb_io_req_valid = s1_valid_masked & s1_readwrite; // @[DCache.scala 187:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276745.4]
  assign tlb_io_req_bits_vaddr = s1_req_addr; // @[DCache.scala 189:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276747.4]
  assign tlb_io_req_bits_passthrough = s1_req_phys; // @[DCache.scala 188:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276746.4]
  assign tlb_io_req_bits_size = s1_req_typ[1:0]; // @[DCache.scala 190:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276748.4]
  assign tlb_io_req_bits_cmd = s1_req_cmd; // @[DCache.scala 191:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276749.4]
  assign tlb_io_sfence_valid = s1_valid_masked & s1_sfence; // @[DCache.scala 195:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276766.4]
  assign tlb_io_sfence_bits_rs1 = s1_req_typ[0]; // @[DCache.scala 196:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276768.4]
  assign tlb_io_sfence_bits_rs2 = s1_req_typ[1]; // @[DCache.scala 197:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276770.4]
  assign tlb_io_sfence_bits_addr = s1_req_addr[38:0]; // @[DCache.scala 199:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276772.4]
  assign tlb_io_ptw_req_ready = io_ptw_req_ready; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_valid = io_ptw_resp_valid; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_ae = io_ptw_resp_bits_ae; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_pte_ppn = io_ptw_resp_bits_pte_ppn; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_pte_d = io_ptw_resp_bits_pte_d; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_pte_a = io_ptw_resp_bits_pte_a; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_pte_g = io_ptw_resp_bits_pte_g; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_pte_u = io_ptw_resp_bits_pte_u; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_pte_x = io_ptw_resp_bits_pte_x; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_pte_w = io_ptw_resp_bits_pte_w; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_pte_r = io_ptw_resp_bits_pte_r; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_pte_v = io_ptw_resp_bits_pte_v; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_level = io_ptw_resp_bits_level; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_fragmented_superpage = io_ptw_resp_bits_fragmented_superpage; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_resp_bits_homogeneous = io_ptw_resp_bits_homogeneous; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_ptbr_mode = io_ptw_ptbr_mode; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_status_dprv = io_ptw_status_dprv; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_status_mxr = io_ptw_status_mxr; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_status_sum = io_ptw_status_sum; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_0_cfg_l = io_ptw_pmp_0_cfg_l; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_0_cfg_a = io_ptw_pmp_0_cfg_a; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_0_cfg_x = io_ptw_pmp_0_cfg_x; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_0_cfg_w = io_ptw_pmp_0_cfg_w; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_0_cfg_r = io_ptw_pmp_0_cfg_r; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_0_addr = io_ptw_pmp_0_addr; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_0_mask = io_ptw_pmp_0_mask; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_1_cfg_l = io_ptw_pmp_1_cfg_l; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_1_cfg_a = io_ptw_pmp_1_cfg_a; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_1_cfg_x = io_ptw_pmp_1_cfg_x; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_1_cfg_w = io_ptw_pmp_1_cfg_w; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_1_cfg_r = io_ptw_pmp_1_cfg_r; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_1_addr = io_ptw_pmp_1_addr; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_1_mask = io_ptw_pmp_1_mask; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_2_cfg_l = io_ptw_pmp_2_cfg_l; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_2_cfg_a = io_ptw_pmp_2_cfg_a; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_2_cfg_x = io_ptw_pmp_2_cfg_x; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_2_cfg_w = io_ptw_pmp_2_cfg_w; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_2_cfg_r = io_ptw_pmp_2_cfg_r; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_2_addr = io_ptw_pmp_2_addr; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_2_mask = io_ptw_pmp_2_mask; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_3_cfg_l = io_ptw_pmp_3_cfg_l; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_3_cfg_a = io_ptw_pmp_3_cfg_a; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_3_cfg_x = io_ptw_pmp_3_cfg_x; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_3_cfg_w = io_ptw_pmp_3_cfg_w; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_3_cfg_r = io_ptw_pmp_3_cfg_r; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_3_addr = io_ptw_pmp_3_addr; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_3_mask = io_ptw_pmp_3_mask; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_4_cfg_l = io_ptw_pmp_4_cfg_l; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_4_cfg_a = io_ptw_pmp_4_cfg_a; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_4_cfg_x = io_ptw_pmp_4_cfg_x; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_4_cfg_w = io_ptw_pmp_4_cfg_w; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_4_cfg_r = io_ptw_pmp_4_cfg_r; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_4_addr = io_ptw_pmp_4_addr; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_4_mask = io_ptw_pmp_4_mask; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_5_cfg_l = io_ptw_pmp_5_cfg_l; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_5_cfg_a = io_ptw_pmp_5_cfg_a; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_5_cfg_x = io_ptw_pmp_5_cfg_x; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_5_cfg_w = io_ptw_pmp_5_cfg_w; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_5_cfg_r = io_ptw_pmp_5_cfg_r; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_5_addr = io_ptw_pmp_5_addr; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_5_mask = io_ptw_pmp_5_mask; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_6_cfg_l = io_ptw_pmp_6_cfg_l; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_6_cfg_a = io_ptw_pmp_6_cfg_a; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_6_cfg_x = io_ptw_pmp_6_cfg_x; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_6_cfg_w = io_ptw_pmp_6_cfg_w; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_6_cfg_r = io_ptw_pmp_6_cfg_r; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_6_addr = io_ptw_pmp_6_addr; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_6_mask = io_ptw_pmp_6_mask; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_7_cfg_l = io_ptw_pmp_7_cfg_l; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_7_cfg_a = io_ptw_pmp_7_cfg_a; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_7_cfg_x = io_ptw_pmp_7_cfg_x; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_7_cfg_w = io_ptw_pmp_7_cfg_w; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_7_cfg_r = io_ptw_pmp_7_cfg_r; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_7_addr = io_ptw_pmp_7_addr; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_ptw_pmp_7_mask = io_ptw_pmp_7_mask; // @[DCache.scala 185:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276740.4]
  assign tlb_io_kill = io_cpu_s2_kill; // @[DCache.scala 186:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276741.4]
  assign amoalu_io_mask = pstore1_mask; // @[DCache.scala 744:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280635.4]
  assign amoalu_io_cmd = pstore1_cmd; // @[DCache.scala 745:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280636.4]
  assign amoalu_io_lhs = {_T_1012,_T_1009}; // @[DCache.scala 746:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280637.4]
  assign amoalu_io_rhs = pstore1_data; // @[DCache.scala 747:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280638.4]
  assign _GEN_351 = _T_3296 & grantIsCached; // @[DCache.scala 500:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279930.10]
  assign _GEN_354 = _T_3296 & _T_3842; // @[DCache.scala 512:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279954.14]
  assign _GEN_355 = _GEN_354 & grantIsUncached; // @[DCache.scala 512:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279954.14]
  assign _GEN_356 = _GEN_355 & _T_3305; // @[DCache.scala 512:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279954.14]
  assign _GEN_363 = grantIsUncached == 1'h0; // @[DCache.scala 530:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279979.14]
  assign _GEN_364 = _GEN_354 & _GEN_363; // @[DCache.scala 530:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279979.14]
  assign _GEN_365 = _GEN_364 & grantIsVoluntary; // @[DCache.scala 530:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279979.14]
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
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_0[initvar] = _RAND_0[27:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_1[initvar] = _RAND_1[27:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_2[initvar] = _RAND_2[27:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_3[initvar] = _RAND_3[27:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  clock_en_reg = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  lfsr = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  blockUncachedGrant = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  s1_valid = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_3271 = _RAND_8[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  s1_probe = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  s2_probe = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  release_state = _RAND_11[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  grantInProgress = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  blockProbeAfterGrantCount = _RAND_13[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  lrscCount = _RAND_14[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  s2_valid_pre_xcpt = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  probe_bits_param = _RAND_16[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  probe_bits_size = _RAND_17[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  probe_bits_source = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {2{`RANDOM}};
  probe_bits_address = _RAND_19[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  s2_probe_state_state = _RAND_20[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_3449 = _RAND_21[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  s2_release_data_valid = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  s1_req_cmd = _RAND_23[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_724 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  s2_req_cmd = _RAND_25[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  s2_hit_state_state = _RAND_26[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {2{`RANDOM}};
  lrscAddr = _RAND_27[33:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {2{`RANDOM}};
  s2_req_addr = _RAND_28[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  pstore1_held = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {2{`RANDOM}};
  pstore1_addr = _RAND_30[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {2{`RANDOM}};
  s1_req_addr = _RAND_31[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  pstore1_mask = _RAND_32[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  s1_req_typ = _RAND_33[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  pstore2_valid = _RAND_34[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {2{`RANDOM}};
  pstore2_addr = _RAND_35[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  mask = _RAND_36[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  s1_req_tag = _RAND_37[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  s1_req_phys = _RAND_38[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  s1_flush_valid = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  cached_grant_wait = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  release_ack_wait = _RAND_41[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  uncachedInFlight_0 = _RAND_42[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {2{`RANDOM}};
  uncachedReqs_0_addr = _RAND_43[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  uncachedReqs_0_tag = _RAND_44[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  uncachedReqs_0_typ = _RAND_45[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  s2_hit_way = _RAND_46[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  _T_1046 = _RAND_47[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  s2_probe_way = _RAND_48[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  s2_req_tag = _RAND_49[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  s2_req_typ = _RAND_50[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  s2_uncached = _RAND_51[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {2{`RANDOM}};
  s2_uncached_resp_addr = _RAND_52[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {2{`RANDOM}};
  _T_732 = _RAND_53[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{`RANDOM}};
  s2_flush_valid_pre_tag_ecc = _RAND_54[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {2{`RANDOM}};
  s2_data = _RAND_55[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{`RANDOM}};
  s2_victim_tag = _RAND_56[25:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{`RANDOM}};
  _T_1054_state = _RAND_57[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{`RANDOM}};
  pstore1_cmd = _RAND_58[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {2{`RANDOM}};
  pstore1_data = _RAND_59[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {1{`RANDOM}};
  pstore1_way = _RAND_60[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{`RANDOM}};
  pstore1_rmw = _RAND_61[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{`RANDOM}};
  pstore2_way = _RAND_62[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{`RANDOM}};
  _T_1473 = _RAND_63[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_64 = {1{`RANDOM}};
  _T_1479 = _RAND_64[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_65 = {1{`RANDOM}};
  _T_1485 = _RAND_65[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_66 = {1{`RANDOM}};
  _T_1491 = _RAND_66[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_67 = {1{`RANDOM}};
  _T_1497 = _RAND_67[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_68 = {1{`RANDOM}};
  _T_1503 = _RAND_68[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_69 = {1{`RANDOM}};
  _T_1509 = _RAND_69[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_70 = {1{`RANDOM}};
  _T_1515 = _RAND_70[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_71 = {1{`RANDOM}};
  s1_release_data_valid = _RAND_71[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_72 = {1{`RANDOM}};
  _T_3617 = _RAND_72[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_73 = {1{`RANDOM}};
  _T_3619_pf_ld = _RAND_73[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_74 = {1{`RANDOM}};
  _T_3619_pf_st = _RAND_74[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_75 = {1{`RANDOM}};
  _T_3619_ae_ld = _RAND_75[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_76 = {1{`RANDOM}};
  _T_3619_ae_st = _RAND_76[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_77 = {1{`RANDOM}};
  _T_3619_ma_ld = _RAND_77[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_78 = {1{`RANDOM}};
  _T_3619_ma_st = _RAND_78[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_79 = {1{`RANDOM}};
  doUncachedResp = _RAND_79[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_80 = {1{`RANDOM}};
  resetting = _RAND_80[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_81 = {1{`RANDOM}};
  _T_3716 = _RAND_81[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_82 = {1{`RANDOM}};
  flushCounter = _RAND_82[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_83 = {1{`RANDOM}};
  tag_array_0_s1_meta_addr_pipe_0 = _RAND_83[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_84 = {1{`RANDOM}};
  tag_array_1_s1_meta_addr_pipe_0 = _RAND_84[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_85 = {1{`RANDOM}};
  tag_array_2_s1_meta_addr_pipe_0 = _RAND_85[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_86 = {1{`RANDOM}};
  tag_array_3_s1_meta_addr_pipe_0 = _RAND_86[5:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge gated_clock) begin
    if(tag_array_0__T_553_en & tag_array_0__T_553_mask) begin
      tag_array_0[tag_array_0__T_553_addr] <= tag_array_0__T_553_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
    end
    if(tag_array_1__T_553_en & tag_array_1__T_553_mask) begin
      tag_array_1[tag_array_1__T_553_addr] <= tag_array_1__T_553_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
    end
    if(tag_array_2__T_553_en & tag_array_2__T_553_mask) begin
      tag_array_2[tag_array_2__T_553_addr] <= tag_array_2__T_553_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
    end
    if(tag_array_3__T_553_en & tag_array_3__T_553_mask) begin
      tag_array_3[tag_array_3__T_553_addr] <= tag_array_3__T_553_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276414.4]
    end
    clock_en_reg <= _T_3777 | _T_3426;
    if (reset) begin
      lfsr <= 16'h1;
    end else begin
      if (_GEN_159) begin
        lfsr <= _T_243;
      end
    end
    if (_T_3421) begin
      if (auto_out_d_valid) begin
        blockUncachedGrant <= _T_3331;
      end else begin
        blockUncachedGrant <= dataArb_io_out_valid;
      end
    end else begin
      blockUncachedGrant <= dataArb_io_out_valid;
    end
    if (reset) begin
      s1_valid <= 1'h0;
    end else begin
      s1_valid <= _T_274;
    end
    if (reset) begin
      _T_3271 <= 4'h0;
    end else begin
      if (_T_3296) begin
        if (d_first) begin
          if (_T_3268) begin
            _T_3271 <= _T_3267;
          end else begin
            _T_3271 <= 4'h0;
          end
        end else begin
          _T_3271 <= _T_3274;
        end
      end
    end
    if (reset) begin
      s1_probe <= 1'h0;
    end else begin
      if (_T_3510) begin
        if (metaArb_io_in_6_ready) begin
          s1_probe <= 1'h1;
        end else begin
          s1_probe <= _T_276;
        end
      end else begin
        s1_probe <= _T_276;
      end
    end
    if (reset) begin
      s2_probe <= 1'h0;
    end else begin
      s2_probe <= s1_probe;
    end
    if (reset) begin
      release_state <= 3'h0;
    end else begin
      if (_T_3605) begin
        release_state <= 3'h0;
      end else begin
        if (_T_3519) begin
          if (releaseDone) begin
            release_state <= 3'h6;
          end else begin
            if (_T_3516) begin
              if (releaseDone) begin
                release_state <= 3'h7;
              end else begin
                if (_T_3515) begin
                  if (releaseDone) begin
                    release_state <= 3'h7;
                  end else begin
                    if (_T_3514) begin
                      if (releaseDone) begin
                        release_state <= 3'h0;
                      end else begin
                        if (_T_3510) begin
                          if (metaArb_io_in_6_ready) begin
                            release_state <= 3'h0;
                          end else begin
                            if (s2_probe) begin
                              if (s2_prb_ack_data) begin
                                release_state <= 3'h2;
                              end else begin
                                if (_T_3506) begin
                                  if (releaseDone) begin
                                    release_state <= 3'h7;
                                  end else begin
                                    release_state <= 3'h3;
                                  end
                                end else begin
                                  if (releaseDone) begin
                                    release_state <= 3'h0;
                                  end else begin
                                    release_state <= 3'h5;
                                  end
                                end
                              end
                            end else begin
                              if (_T_3493) begin
                                release_state <= 3'h1;
                              end
                            end
                          end
                        end else begin
                          if (s2_probe) begin
                            if (s2_prb_ack_data) begin
                              release_state <= 3'h2;
                            end else begin
                              if (_T_3506) begin
                                if (releaseDone) begin
                                  release_state <= 3'h7;
                                end else begin
                                  release_state <= 3'h3;
                                end
                              end else begin
                                if (releaseDone) begin
                                  release_state <= 3'h0;
                                end else begin
                                  release_state <= 3'h5;
                                end
                              end
                            end
                          end else begin
                            if (_T_3493) begin
                              release_state <= 3'h1;
                            end
                          end
                        end
                      end
                    end else begin
                      if (_T_3510) begin
                        if (metaArb_io_in_6_ready) begin
                          release_state <= 3'h0;
                        end else begin
                          if (s2_probe) begin
                            if (s2_prb_ack_data) begin
                              release_state <= 3'h2;
                            end else begin
                              if (_T_3506) begin
                                if (releaseDone) begin
                                  release_state <= 3'h7;
                                end else begin
                                  release_state <= 3'h3;
                                end
                              end else begin
                                if (releaseDone) begin
                                  release_state <= 3'h0;
                                end else begin
                                  release_state <= 3'h5;
                                end
                              end
                            end
                          end else begin
                            if (_T_3493) begin
                              release_state <= 3'h1;
                            end
                          end
                        end
                      end else begin
                        if (s2_probe) begin
                          if (s2_prb_ack_data) begin
                            release_state <= 3'h2;
                          end else begin
                            if (_T_3506) begin
                              if (releaseDone) begin
                                release_state <= 3'h7;
                              end else begin
                                release_state <= 3'h3;
                              end
                            end else begin
                              if (releaseDone) begin
                                release_state <= 3'h0;
                              end else begin
                                release_state <= 3'h5;
                              end
                            end
                          end
                        end else begin
                          if (_T_3493) begin
                            release_state <= 3'h1;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (_T_3514) begin
                    if (releaseDone) begin
                      release_state <= 3'h0;
                    end else begin
                      if (_T_3510) begin
                        if (metaArb_io_in_6_ready) begin
                          release_state <= 3'h0;
                        end else begin
                          release_state <= _GEN_220;
                        end
                      end else begin
                        release_state <= _GEN_220;
                      end
                    end
                  end else begin
                    if (_T_3510) begin
                      if (metaArb_io_in_6_ready) begin
                        release_state <= 3'h0;
                      end else begin
                        release_state <= _GEN_220;
                      end
                    end else begin
                      release_state <= _GEN_220;
                    end
                  end
                end
              end
            end else begin
              if (_T_3515) begin
                if (releaseDone) begin
                  release_state <= 3'h7;
                end else begin
                  if (_T_3514) begin
                    if (releaseDone) begin
                      release_state <= 3'h0;
                    end else begin
                      release_state <= _GEN_235;
                    end
                  end else begin
                    release_state <= _GEN_235;
                  end
                end
              end else begin
                if (_T_3514) begin
                  if (releaseDone) begin
                    release_state <= 3'h0;
                  end else begin
                    release_state <= _GEN_235;
                  end
                end else begin
                  release_state <= _GEN_235;
                end
              end
            end
          end
        end else begin
          if (_T_3516) begin
            if (releaseDone) begin
              release_state <= 3'h7;
            end else begin
              if (_T_3515) begin
                if (releaseDone) begin
                  release_state <= 3'h7;
                end else begin
                  release_state <= _GEN_239;
                end
              end else begin
                release_state <= _GEN_239;
              end
            end
          end else begin
            if (_T_3515) begin
              if (releaseDone) begin
                release_state <= 3'h7;
              end else begin
                release_state <= _GEN_239;
              end
            end else begin
              release_state <= _GEN_239;
            end
          end
        end
      end
    end
    if (reset) begin
      grantInProgress <= 1'h0;
    end else begin
      if (_T_3296) begin
        if (grantIsCached) begin
          if (d_last) begin
            grantInProgress <= 1'h0;
          end else begin
            grantInProgress <= 1'h1;
          end
        end
      end
    end
    if (reset) begin
      blockProbeAfterGrantCount <= 3'h0;
    end else begin
      if (_T_3296) begin
        if (grantIsCached) begin
          if (d_last) begin
            blockProbeAfterGrantCount <= 3'h7;
          end else begin
            if (_T_3426) begin
              blockProbeAfterGrantCount <= _T_3291;
            end
          end
        end else begin
          if (_T_3426) begin
            blockProbeAfterGrantCount <= _T_3291;
          end
        end
      end else begin
        if (_T_3426) begin
          blockProbeAfterGrantCount <= _T_3291;
        end
      end
    end
    if (reset) begin
      lrscCount <= 7'h0;
    end else begin
      if (s1_probe) begin
        lrscCount <= 7'h0;
      end else begin
        if (_T_1255) begin
          lrscCount <= 7'h3;
        end else begin
          if (_T_1237) begin
            lrscCount <= _T_1254;
          end else begin
            if (_T_1248) begin
              if (s2_hit) begin
                lrscCount <= 7'h4f;
              end else begin
                lrscCount <= 7'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      s2_valid_pre_xcpt <= 1'h0;
    end else begin
      s2_valid_pre_xcpt <= _T_710;
    end
    if (_T_3493) begin
      probe_bits_param <= 2'h0;
    end else begin
      if (_T_276) begin
        probe_bits_param <= auto_out_b_bits_param;
      end
    end
    if (_T_3493) begin
      probe_bits_size <= 3'h0;
    end else begin
      if (_T_276) begin
        probe_bits_size <= auto_out_b_bits_size;
      end
    end
    if (_T_3493) begin
      probe_bits_source <= 1'h0;
    end else begin
      if (_T_276) begin
        probe_bits_source <= auto_out_b_bits_source;
      end
    end
    if (_T_3493) begin
      probe_bits_address <= res_2_address;
    end else begin
      if (_T_276) begin
        probe_bits_address <= auto_out_b_bits_address;
      end
    end
    if (s1_probe) begin
      s2_probe_state_state <= s1_meta_hit_state_state;
    end
    if (reset) begin
      _T_3449 <= 4'h0;
    end else begin
      if (_T_3440) begin
        if (c_first) begin
          if (_T_3446) begin
            _T_3449 <= _T_3445;
          end else begin
            _T_3449 <= 4'h0;
          end
        end else begin
          _T_3449 <= _T_3452;
        end
      end
    end
    s2_release_data_valid <= s1_release_data_valid & _T_3460;
    if (s0_clk_en) begin
      s1_req_cmd <= io_cpu_req_bits_cmd;
    end
    _T_724 <= s1_nack == 1'h0;
    if (_T_3296) begin
      if (grantIsCached) begin
        if (_T_728) begin
          s2_req_cmd <= s1_req_cmd;
        end
      end else begin
        if (grantIsUncached) begin
          if (grantIsUncachedData) begin
            s2_req_cmd <= 5'h0;
          end else begin
            if (_T_728) begin
              s2_req_cmd <= s1_req_cmd;
            end
          end
        end else begin
          if (_T_728) begin
            s2_req_cmd <= s1_req_cmd;
          end
        end
      end
    end else begin
      if (_T_728) begin
        s2_req_cmd <= s1_req_cmd;
      end
    end
    if (_T_728) begin
      s2_hit_state_state <= s1_meta_hit_state_state;
    end
    if (_T_1248) begin
      lrscAddr <= _T_1240;
    end
    if (_T_3296) begin
      if (grantIsCached) begin
        if (_T_728) begin
          s2_req_addr <= {{2'd0}, tlb_io_resp_paddr};
        end
      end else begin
        if (grantIsUncached) begin
          if (grantIsUncachedData) begin
            s2_req_addr <= {{2'd0}, _T_3312};
          end else begin
            if (_T_728) begin
              s2_req_addr <= {{2'd0}, tlb_io_resp_paddr};
            end
          end
        end else begin
          if (_T_728) begin
            s2_req_addr <= {{2'd0}, tlb_io_resp_paddr};
          end
        end
      end
    end else begin
      if (_T_728) begin
        s2_req_addr <= {{2'd0}, tlb_io_resp_paddr};
      end
    end
    pstore1_held <= _T_1456 & _T_1457;
    if (_T_1264) begin
      pstore1_addr <= s1_req_addr;
    end
    if (s0_clk_en) begin
      s1_req_addr <= _T_286;
    end
    if (_T_1264) begin
      if (_T_311) begin
        pstore1_mask <= io_cpu_s1_data_mask;
      end else begin
        pstore1_mask <= _T_708;
      end
    end
    if (s0_clk_en) begin
      s1_req_typ <= io_cpu_req_bits_typ;
    end
    pstore2_valid <= _T_1462 | advance_pstore1;
    if (advance_pstore1) begin
      pstore2_addr <= pstore1_addr;
    end
    if (advance_pstore1) begin
      mask <= _T_1527;
    end
    if (s0_clk_en) begin
      s1_req_tag <= io_cpu_req_bits_tag;
    end
    if (s0_clk_en) begin
      if (_T_287) begin
        s1_req_phys <= 1'h1;
      end else begin
        s1_req_phys <= io_cpu_req_bits_phys;
      end
    end
    s1_flush_valid <= _T_3743 & can_acquire_before_release;
    if (reset) begin
      cached_grant_wait <= 1'h0;
    end else begin
      if (_T_3296) begin
        if (grantIsCached) begin
          if (d_last) begin
            cached_grant_wait <= 1'h0;
          end else begin
            if (_T_3260) begin
              if (!(s2_uncached)) begin
                cached_grant_wait <= 1'h1;
              end
            end
          end
        end else begin
          if (_T_3260) begin
            if (!(s2_uncached)) begin
              cached_grant_wait <= 1'h1;
            end
          end
        end
      end else begin
        if (_T_3260) begin
          if (!(s2_uncached)) begin
            cached_grant_wait <= 1'h1;
          end
        end
      end
    end
    if (reset) begin
      release_ack_wait <= 1'h0;
    end else begin
      if (_T_3519) begin
        if (_T_3583) begin
          release_ack_wait <= 1'h1;
        end else begin
          if (_T_3296) begin
            if (!(grantIsCached)) begin
              if (!(grantIsUncached)) begin
                if (grantIsVoluntary) begin
                  release_ack_wait <= 1'h0;
                end
              end
            end
          end
        end
      end else begin
        if (_T_3296) begin
          if (!(grantIsCached)) begin
            if (!(grantIsUncached)) begin
              if (grantIsVoluntary) begin
                release_ack_wait <= 1'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      uncachedInFlight_0 <= 1'h0;
    end else begin
      if (_T_3296) begin
        if (grantIsCached) begin
          if (_T_3260) begin
            if (s2_uncached) begin
              if (a_sel) begin
                uncachedInFlight_0 <= 1'h1;
              end
            end
          end
        end else begin
          if (grantIsUncached) begin
            if (_T_3305) begin
              uncachedInFlight_0 <= 1'h0;
            end else begin
              if (_T_3260) begin
                if (s2_uncached) begin
                  if (a_sel) begin
                    uncachedInFlight_0 <= 1'h1;
                  end
                end
              end
            end
          end else begin
            if (_T_3260) begin
              if (s2_uncached) begin
                if (a_sel) begin
                  uncachedInFlight_0 <= 1'h1;
                end
              end
            end
          end
        end
      end else begin
        if (_T_3260) begin
          if (s2_uncached) begin
            if (a_sel) begin
              uncachedInFlight_0 <= 1'h1;
            end
          end
        end
      end
    end
    if (_T_3260) begin
      if (s2_uncached) begin
        if (a_sel) begin
          uncachedReqs_0_addr <= s2_req_addr;
        end
      end
    end
    if (_T_3260) begin
      if (s2_uncached) begin
        if (a_sel) begin
          uncachedReqs_0_tag <= s2_req_tag;
        end
      end
    end
    if (_T_3260) begin
      if (s2_uncached) begin
        if (a_sel) begin
          uncachedReqs_0_typ <= s2_req_typ;
        end
      end
    end
    if (s1_valid_not_nacked) begin
      s2_hit_way <= s1_meta_hit_way;
    end
    if (_T_728) begin
      _T_1046 <= s1_victim_way;
    end
    if (s1_probe) begin
      s2_probe_way <= s1_meta_hit_way;
    end
    if (_T_3296) begin
      if (grantIsCached) begin
        if (_T_728) begin
          s2_req_tag <= s1_req_tag;
        end
      end else begin
        if (grantIsUncached) begin
          if (grantIsUncachedData) begin
            s2_req_tag <= uncachedReqs_0_tag;
          end else begin
            if (_T_728) begin
              s2_req_tag <= s1_req_tag;
            end
          end
        end else begin
          if (_T_728) begin
            s2_req_tag <= s1_req_tag;
          end
        end
      end
    end else begin
      if (_T_728) begin
        s2_req_tag <= s1_req_tag;
      end
    end
    if (_T_3296) begin
      if (grantIsCached) begin
        if (_T_728) begin
          s2_req_typ <= s1_req_typ;
        end
      end else begin
        if (grantIsUncached) begin
          if (grantIsUncachedData) begin
            s2_req_typ <= uncachedReqs_0_typ;
          end else begin
            if (_T_728) begin
              s2_req_typ <= s1_req_typ;
            end
          end
        end else begin
          if (_T_728) begin
            s2_req_typ <= s1_req_typ;
          end
        end
      end
    end else begin
      if (_T_728) begin
        s2_req_typ <= s1_req_typ;
      end
    end
    if (_T_728) begin
      s2_uncached <= _T_729;
    end
    if (_T_3296) begin
      if (!(grantIsCached)) begin
        if (grantIsUncached) begin
          if (grantIsUncachedData) begin
            s2_uncached_resp_addr <= uncachedReqs_0_addr;
          end
        end
      end
    end
    if (_T_728) begin
      _T_732 <= s1_req_addr;
    end
    s2_flush_valid_pre_tag_ecc <= s1_flush_valid;
    if (_T_857) begin
      s2_data <= _T_853;
    end
    if (_T_728) begin
      if (_T_655) begin
        s2_victim_tag <= _T_608;
      end else begin
        if (_T_653) begin
          s2_victim_tag <= _T_601;
        end else begin
          if (_T_651) begin
            s2_victim_tag <= _T_594;
          end else begin
            s2_victim_tag <= _T_587;
          end
        end
      end
    end
    if (_T_728) begin
      if (_T_655) begin
        _T_1054_state <= _T_609;
      end else begin
        if (_T_653) begin
          _T_1054_state <= _T_602;
        end else begin
          if (_T_651) begin
            _T_1054_state <= _T_595;
          end else begin
            _T_1054_state <= _T_588;
          end
        end
      end
    end
    if (_T_1264) begin
      pstore1_cmd <= s1_req_cmd;
    end
    if (_T_1264) begin
      pstore1_data <= io_cpu_s1_data_data;
    end
    if (_T_1264) begin
      pstore1_way <= s1_meta_hit_way;
    end
    if (_T_1264) begin
      pstore1_rmw <= _T_1326;
    end
    if (advance_pstore1) begin
      pstore2_way <= pstore1_way;
    end
    if (advance_pstore1) begin
      _T_1473 <= _T_1468;
    end
    if (advance_pstore1) begin
      _T_1479 <= _T_1474;
    end
    if (advance_pstore1) begin
      _T_1485 <= _T_1480;
    end
    if (advance_pstore1) begin
      _T_1491 <= _T_1486;
    end
    if (advance_pstore1) begin
      _T_1497 <= _T_1492;
    end
    if (advance_pstore1) begin
      _T_1503 <= _T_1498;
    end
    if (advance_pstore1) begin
      _T_1509 <= _T_1504;
    end
    if (advance_pstore1) begin
      _T_1515 <= _T_1510;
    end
    s1_release_data_valid <= dataArb_io_in_2_ready & dataArb_io_in_2_valid;
    _T_3617 <= tlb_io_req_valid & _T_282;
    if (s1_valid_not_nacked) begin
      _T_3619_pf_ld <= tlb_io_resp_pf_ld;
    end
    if (s1_valid_not_nacked) begin
      _T_3619_pf_st <= tlb_io_resp_pf_st;
    end
    if (s1_valid_not_nacked) begin
      _T_3619_ae_ld <= tlb_io_resp_ae_ld;
    end
    if (s1_valid_not_nacked) begin
      _T_3619_ae_st <= tlb_io_resp_ae_st;
    end
    if (s1_valid_not_nacked) begin
      _T_3619_ma_ld <= tlb_io_resp_ma_ld;
    end
    if (s1_valid_not_nacked) begin
      _T_3619_ma_st <= tlb_io_resp_ma_st;
    end
    doUncachedResp <= io_cpu_replay_next;
    if (reset) begin
      resetting <= 1'h0;
    end else begin
      if (resetting) begin
        if (flushDone) begin
          resetting <= 1'h0;
        end else begin
          if (_T_3716) begin
            resetting <= 1'h1;
          end
        end
      end else begin
        if (_T_3716) begin
          resetting <= 1'h1;
        end
      end
    end
    _T_3716 <= reset;
    if (reset) begin
      flushCounter <= 8'hc0;
    end else begin
      flushCounter <= _GEN_295[7:0];
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_458) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:913 assert(!needsRead(req) || res)\n"); // @[DCache.scala 913:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276650.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_458) begin
          $fatal; // @[DCache.scala 913:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@276651.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_458) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:913 assert(!needsRead(req) || res)\n"); // @[DCache.scala 913:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277833.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_458) begin
          $fatal; // @[DCache.scala 913:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277834.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1428) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:366 assert(pstore1_rmw || pstore1_valid_not_rmw(io.cpu.s2_kill) === pstore1_valid)\n"); // @[DCache.scala 366:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277872.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1428) begin
          $fatal; // @[DCache.scala 366:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@277873.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_351 & _T_3299) begin
          $fwrite(32'h80000002,"Assertion failed: A GrantData was unexpected by the dcache.\n    at DCache.scala:500 assert(cached_grant_wait, \"A GrantData was unexpected by the dcache.\")\n"); // @[DCache.scala 500:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279930.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_351 & _T_3299) begin
          $fatal; // @[DCache.scala 500:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279931.10]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_356 & _T_3308) begin
          $fwrite(32'h80000002,"Assertion failed: An AccessAck was unexpected by the dcache.\n    at DCache.scala:512 assert(f, \"An AccessAck was unexpected by the dcache.\") // TODO must handle Ack coming back on same cycle!\n"); // @[DCache.scala 512:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279954.14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_356 & _T_3308) begin
          $fatal; // @[DCache.scala 512:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279955.14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_365 & _T_3315) begin
          $fwrite(32'h80000002,"Assertion failed: A ReleaseAck was unexpected by the dcache.\n    at DCache.scala:530 assert(release_ack_wait, \"A ReleaseAck was unexpected by the dcache.\") // TODO should handle Ack coming back on same cycle!\n"); // @[DCache.scala 530:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279979.14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_365 & _T_3315) begin
          $fatal; // @[DCache.scala 530:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@279980.14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3328) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:538 assert(tl_out.e.fire() === (tl_out.d.fire() && d_first && grantIsCached))\n"); // @[DCache.scala 538:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280002.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_3328) begin
          $fatal; // @[DCache.scala 538:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280003.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3493 & _T_3500) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:616 assert(!(s2_valid && s2_hit_valid && !s2_data_error))\n"); // @[DCache.scala 616:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280259.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_3493 & _T_3500) begin
          $fatal; // @[DCache.scala 616:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280260.8]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (doUncachedResp & _T_3647) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:723 assert(!s2_valid_hit)\n"); // @[DCache.scala 723:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280551.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (doUncachedResp & _T_3647) begin
          $fatal; // @[DCache.scala 723:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@280552.8]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    if (_GEN_41) begin
      tag_array_0_s1_meta_addr_pipe_0 <= _GEN_29;
    end
    if (_GEN_41) begin
      tag_array_1_s1_meta_addr_pipe_0 <= _GEN_29;
    end
    if (_GEN_41) begin
      tag_array_2_s1_meta_addr_pipe_0 <= _GEN_29;
    end
    if (_GEN_41) begin
      tag_array_3_s1_meta_addr_pipe_0 <= _GEN_29;
    end
  end
endmodule