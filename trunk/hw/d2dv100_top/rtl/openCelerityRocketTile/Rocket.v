module Rocket( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312121.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312122.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312123.4]
  input  [1:0]  io_hartid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_interrupts_debug, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_interrupts_mtip, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_interrupts_msip, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_interrupts_meip, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_interrupts_seip, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_might_request, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_req_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [39:0] io_imem_req_bits_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_req_bits_speculative, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_sfence_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_sfence_bits_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_sfence_bits_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [38:0] io_imem_sfence_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_resp_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_imem_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_imem_resp_bits_btb_taken, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_imem_resp_bits_btb_bridx, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [4:0]  io_imem_resp_bits_btb_entry, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [7:0]  io_imem_resp_bits_btb_bht_history, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [39:0] io_imem_resp_bits_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [31:0] io_imem_resp_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_imem_resp_bits_xcpt_pf_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_imem_resp_bits_xcpt_ae_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_imem_resp_bits_replay, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_btb_update_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [4:0]  io_imem_btb_update_bits_prediction_entry, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [38:0] io_imem_btb_update_bits_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_btb_update_bits_isValid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [38:0] io_imem_btb_update_bits_br_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [1:0]  io_imem_btb_update_bits_cfiType, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_bht_update_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [7:0]  io_imem_bht_update_bits_prediction_history, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [38:0] io_imem_bht_update_bits_pc, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_bht_update_bits_branch, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_bht_update_bits_taken, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_bht_update_bits_mispredict, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_imem_flush_icache, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_req_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_dmem_req_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [39:0] io_dmem_req_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [7:0]  io_dmem_req_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [4:0]  io_dmem_req_bits_cmd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [2:0]  io_dmem_req_bits_typ, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_dmem_s1_kill, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [63:0] io_dmem_s1_data_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_s2_nack, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [7:0]  io_dmem_resp_bits_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [2:0]  io_dmem_resp_bits_typ, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [63:0] io_dmem_resp_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_resp_bits_replay, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_resp_bits_has_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [63:0] io_dmem_resp_bits_data_word_bypass, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_replay_next, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_s2_xcpt_ma_ld, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_s2_xcpt_ma_st, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_s2_xcpt_pf_ld, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_s2_xcpt_pf_st, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_s2_xcpt_ae_ld, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_s2_xcpt_ae_st, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_ordered, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_perf_grant, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_dmem_keep_clock_enabled, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_dmem_clock_enabled, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [3:0]  io_ptw_ptbr_mode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [43:0] io_ptw_ptbr_ppn, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_sfence_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_sfence_bits_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [1:0]  io_ptw_status_dprv, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [1:0]  io_ptw_status_prv, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_status_mxr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_status_sum, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_0_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [1:0]  io_ptw_pmp_0_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_0_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_0_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_0_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [35:0] io_ptw_pmp_0_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [37:0] io_ptw_pmp_0_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_1_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [1:0]  io_ptw_pmp_1_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_1_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_1_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_1_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [35:0] io_ptw_pmp_1_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [37:0] io_ptw_pmp_1_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_2_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [1:0]  io_ptw_pmp_2_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_2_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_2_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_2_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [35:0] io_ptw_pmp_2_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [37:0] io_ptw_pmp_2_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_3_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [1:0]  io_ptw_pmp_3_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_3_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_3_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_3_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [35:0] io_ptw_pmp_3_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [37:0] io_ptw_pmp_3_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_4_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [1:0]  io_ptw_pmp_4_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_4_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_4_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_4_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [35:0] io_ptw_pmp_4_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [37:0] io_ptw_pmp_4_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_5_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [1:0]  io_ptw_pmp_5_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_5_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_5_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_5_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [35:0] io_ptw_pmp_5_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [37:0] io_ptw_pmp_5_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_6_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [1:0]  io_ptw_pmp_6_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_6_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_6_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_6_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [35:0] io_ptw_pmp_6_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [37:0] io_ptw_pmp_6_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_7_cfg_l, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [1:0]  io_ptw_pmp_7_cfg_a, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_7_cfg_x, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_7_cfg_w, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_ptw_pmp_7_cfg_r, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [35:0] io_ptw_pmp_7_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [37:0] io_ptw_pmp_7_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [63:0] io_ptw_customCSRs_csrs_0_value, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [31:0] io_fpu_inst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [63:0] io_fpu_fromint_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [2:0]  io_fpu_fcsr_rm, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_fpu_fcsr_flags_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [4:0]  io_fpu_fcsr_flags_bits, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [63:0] io_fpu_store_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [63:0] io_fpu_toint_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_fpu_dmem_resp_val, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [2:0]  io_fpu_dmem_resp_type, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [4:0]  io_fpu_dmem_resp_tag, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [63:0] io_fpu_dmem_resp_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_fpu_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_fpu_fcsr_rdy, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_fpu_nack_mem, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_fpu_illegal_rm, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_fpu_killx, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_fpu_killm, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_fpu_dec_wen, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_fpu_dec_ren1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_fpu_dec_ren2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_fpu_dec_ren3, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_fpu_sboard_set, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_fpu_sboard_clr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [4:0]  io_fpu_sboard_clra, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_rocc_cmd_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_rocc_cmd_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [6:0]  io_rocc_cmd_bits_inst_funct, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [4:0]  io_rocc_cmd_bits_inst_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [4:0]  io_rocc_cmd_bits_inst_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_rocc_cmd_bits_inst_xd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_rocc_cmd_bits_inst_xs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_rocc_cmd_bits_inst_xs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [4:0]  io_rocc_cmd_bits_inst_rd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [6:0]  io_rocc_cmd_bits_inst_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [63:0] io_rocc_cmd_bits_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [63:0] io_rocc_cmd_bits_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output [1:0]  io_rocc_cmd_bits_status_prv, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_rocc_resp_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_rocc_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [4:0]  io_rocc_resp_bits_rd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input  [63:0] io_rocc_resp_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_rocc_busy, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  input         io_rocc_interrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
  output        io_rocc_exception // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312124.4]
);
  wire  ibuf_clock; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_reset; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_imem_ready; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_imem_valid; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_imem_bits_btb_taken; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_imem_bits_btb_bridx; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [4:0] ibuf_io_imem_bits_btb_entry; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [7:0] ibuf_io_imem_bits_btb_bht_history; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [39:0] ibuf_io_imem_bits_pc; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [31:0] ibuf_io_imem_bits_data; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_imem_bits_xcpt_pf_inst; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_imem_bits_xcpt_ae_inst; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_imem_bits_replay; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_kill; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [39:0] ibuf_io_pc; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [4:0] ibuf_io_btb_resp_entry; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [7:0] ibuf_io_btb_resp_bht_history; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_inst_0_ready; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_inst_0_valid; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_inst_0_bits_xcpt0_pf_inst; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_inst_0_bits_xcpt0_ae_inst; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_inst_0_bits_xcpt1_pf_inst; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_inst_0_bits_xcpt1_ae_inst; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_inst_0_bits_replay; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire  ibuf_io_inst_0_bits_rvc; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [31:0] ibuf_io_inst_0_bits_inst_bits; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [4:0] ibuf_io_inst_0_bits_inst_rd; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [4:0] ibuf_io_inst_0_bits_inst_rs1; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [4:0] ibuf_io_inst_0_bits_inst_rs2; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [4:0] ibuf_io_inst_0_bits_inst_rs3; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  wire [31:0] ibuf_io_inst_0_bits_raw; // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
  reg [63:0] _T_752 [0:30]; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  reg [63:0] _RAND_0;
  wire [63:0] _T_752__T_759_data; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  wire [4:0] _T_752__T_759_addr; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  reg [63:0] _RAND_1;
  wire [63:0] _T_752__T_767_data; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  wire [4:0] _T_752__T_767_addr; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  reg [63:0] _RAND_2;
  wire [63:0] _T_752__T_1493_data; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  wire [4:0] _T_752__T_1493_addr; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  wire  _T_752__T_1493_mask; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  wire  _T_752__T_1493_en; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  wire  csr_clock; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_reset; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_ungated_clock; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_interrupts_debug; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_interrupts_mtip; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_interrupts_msip; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_interrupts_meip; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_interrupts_seip; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_hartid; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [11:0] csr_io_rw_addr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [2:0] csr_io_rw_cmd; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [63:0] csr_io_rw_rdata; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [63:0] csr_io_rw_wdata; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [11:0] csr_io_decode_0_csr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_decode_0_fp_illegal; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_decode_0_fp_csr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_decode_0_rocc_illegal; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_decode_0_read_illegal; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_decode_0_write_illegal; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_decode_0_write_flush; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_decode_0_system_illegal; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_csr_stall; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_eret; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_singleStep; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_debug; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [31:0] csr_io_status_isa; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_status_dprv; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_status_prv; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_sd; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [26:0] csr_io_status_zero2; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_status_sxl; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_status_uxl; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_sd_rv32; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [7:0] csr_io_status_zero1; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_tsr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_tw; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_tvm; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_mxr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_sum; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_mprv; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_status_xs; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_status_fs; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_status_mpp; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_status_hpp; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_spp; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_mpie; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_hpie; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_spie; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_upie; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_mie; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_hie; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_sie; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_status_uie; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [3:0] csr_io_ptbr_mode; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [43:0] csr_io_ptbr_ppn; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [39:0] csr_io_evec; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_exception; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_retire; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [63:0] csr_io_cause; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [39:0] csr_io_pc; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [39:0] csr_io_tval; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [63:0] csr_io_time; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [2:0] csr_io_fcsr_rm; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_fcsr_flags_valid; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [4:0] csr_io_fcsr_flags_bits; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_rocc_interrupt; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_interrupt; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [63:0] csr_io_interrupt_cause; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_bp_0_control_action; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_bp_0_control_tmatch; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_bp_0_control_m; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_bp_0_control_s; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_bp_0_control_u; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_bp_0_control_x; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_bp_0_control_w; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_bp_0_control_r; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [38:0] csr_io_bp_0_address; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_0_cfg_l; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_pmp_0_cfg_a; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_0_cfg_x; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_0_cfg_w; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_0_cfg_r; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [35:0] csr_io_pmp_0_addr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [37:0] csr_io_pmp_0_mask; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_1_cfg_l; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_pmp_1_cfg_a; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_1_cfg_x; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_1_cfg_w; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_1_cfg_r; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [35:0] csr_io_pmp_1_addr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [37:0] csr_io_pmp_1_mask; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_2_cfg_l; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_pmp_2_cfg_a; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_2_cfg_x; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_2_cfg_w; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_2_cfg_r; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [35:0] csr_io_pmp_2_addr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [37:0] csr_io_pmp_2_mask; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_3_cfg_l; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_pmp_3_cfg_a; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_3_cfg_x; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_3_cfg_w; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_3_cfg_r; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [35:0] csr_io_pmp_3_addr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [37:0] csr_io_pmp_3_mask; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_4_cfg_l; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_pmp_4_cfg_a; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_4_cfg_x; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_4_cfg_w; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_4_cfg_r; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [35:0] csr_io_pmp_4_addr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [37:0] csr_io_pmp_4_mask; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_5_cfg_l; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_pmp_5_cfg_a; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_5_cfg_x; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_5_cfg_w; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_5_cfg_r; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [35:0] csr_io_pmp_5_addr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [37:0] csr_io_pmp_5_mask; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_6_cfg_l; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_pmp_6_cfg_a; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_6_cfg_x; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_6_cfg_w; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_6_cfg_r; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [35:0] csr_io_pmp_6_addr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [37:0] csr_io_pmp_6_mask; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_7_cfg_l; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [1:0] csr_io_pmp_7_cfg_a; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_7_cfg_x; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_7_cfg_w; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_pmp_7_cfg_r; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [35:0] csr_io_pmp_7_addr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [37:0] csr_io_pmp_7_mask; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [31:0] csr_io_inst_0; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_trace_0_valid; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [39:0] csr_io_trace_0_iaddr; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire [31:0] csr_io_trace_0_insn; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  csr_io_trace_0_exception; // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
  wire  bpu_io_status_debug; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire [1:0] bpu_io_status_prv; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_bp_0_control_action; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire [1:0] bpu_io_bp_0_control_tmatch; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_bp_0_control_m; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_bp_0_control_s; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_bp_0_control_u; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_bp_0_control_x; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_bp_0_control_w; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_bp_0_control_r; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire [38:0] bpu_io_bp_0_address; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire [38:0] bpu_io_pc; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire [38:0] bpu_io_ea; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_xcpt_if; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_xcpt_ld; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_xcpt_st; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_debug_if; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_debug_ld; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  bpu_io_debug_st; // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
  wire  alu_io_dw; // @[RocketCore.scala 339:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313035.4]
  wire [3:0] alu_io_fn; // @[RocketCore.scala 339:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313035.4]
  wire [63:0] alu_io_in2; // @[RocketCore.scala 339:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313035.4]
  wire [63:0] alu_io_in1; // @[RocketCore.scala 339:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313035.4]
  wire [63:0] alu_io_out; // @[RocketCore.scala 339:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313035.4]
  wire [63:0] alu_io_adder_out; // @[RocketCore.scala 339:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313035.4]
  wire  alu_io_cmp_out; // @[RocketCore.scala 339:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313035.4]
  wire  div_clock; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire  div_reset; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire  div_io_req_ready; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire  div_io_req_valid; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire [3:0] div_io_req_bits_fn; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire  div_io_req_bits_dw; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire [63:0] div_io_req_bits_in1; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire [63:0] div_io_req_bits_in2; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire [4:0] div_io_req_bits_tag; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire  div_io_kill; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire  div_io_resp_ready; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire  div_io_resp_valid; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire [63:0] div_io_resp_bits_data; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire [4:0] div_io_resp_bits_tag; // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
  wire  PlusArgTimeout_clock; // @[PlusArg.scala 51:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314160.4]
  wire  PlusArgTimeout_reset; // @[PlusArg.scala 51:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314160.4]
  wire [31:0] PlusArgTimeout_io_count; // @[PlusArg.scala 51:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314160.4]
  reg  imem_might_request_reg; // @[RocketCore.scala 98:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312131.4]
  reg [31:0] _RAND_3;
  reg  ex_ctrl_fp; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_4;
  reg  ex_ctrl_rocc; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_5;
  reg  ex_ctrl_branch; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_6;
  reg  ex_ctrl_jal; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_7;
  reg  ex_ctrl_jalr; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_8;
  reg  ex_ctrl_rxs2; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_9;
  reg [1:0] ex_ctrl_sel_alu2; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_10;
  reg [1:0] ex_ctrl_sel_alu1; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_11;
  reg [2:0] ex_ctrl_sel_imm; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_12;
  reg  ex_ctrl_alu_dw; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_13;
  reg [3:0] ex_ctrl_alu_fn; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_14;
  reg  ex_ctrl_mem; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_15;
  reg [4:0] ex_ctrl_mem_cmd; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_16;
  reg [2:0] ex_ctrl_mem_type; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_17;
  reg  ex_ctrl_wfd; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_18;
  reg  ex_ctrl_div; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_19;
  reg  ex_ctrl_wxd; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_20;
  reg [2:0] ex_ctrl_csr; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_21;
  reg  ex_ctrl_fence_i; // @[RocketCore.scala 168:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312135.4]
  reg [31:0] _RAND_22;
  reg  mem_ctrl_fp; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_23;
  reg  mem_ctrl_rocc; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_24;
  reg  mem_ctrl_branch; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_25;
  reg  mem_ctrl_jal; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_26;
  reg  mem_ctrl_jalr; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_27;
  reg  mem_ctrl_mem; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_28;
  reg [2:0] mem_ctrl_mem_type; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_29;
  reg  mem_ctrl_wfd; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_30;
  reg  mem_ctrl_mul; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_31;
  reg  mem_ctrl_div; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_32;
  reg  mem_ctrl_wxd; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_33;
  reg [2:0] mem_ctrl_csr; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_34;
  reg  mem_ctrl_fence_i; // @[RocketCore.scala 169:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312136.4]
  reg [31:0] _RAND_35;
  reg  wb_ctrl_rocc; // @[RocketCore.scala 170:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312137.4]
  reg [31:0] _RAND_36;
  reg  wb_ctrl_mem; // @[RocketCore.scala 170:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312137.4]
  reg [31:0] _RAND_37;
  reg [2:0] wb_ctrl_mem_type; // @[RocketCore.scala 170:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312137.4]
  reg [31:0] _RAND_38;
  reg  wb_ctrl_wfd; // @[RocketCore.scala 170:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312137.4]
  reg [31:0] _RAND_39;
  reg  wb_ctrl_div; // @[RocketCore.scala 170:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312137.4]
  reg [31:0] _RAND_40;
  reg  wb_ctrl_wxd; // @[RocketCore.scala 170:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312137.4]
  reg [31:0] _RAND_41;
  reg [2:0] wb_ctrl_csr; // @[RocketCore.scala 170:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312137.4]
  reg [31:0] _RAND_42;
  reg  wb_ctrl_fence_i; // @[RocketCore.scala 170:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312137.4]
  reg [31:0] _RAND_43;
  reg  ex_reg_xcpt_interrupt; // @[RocketCore.scala 172:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312138.4]
  reg [31:0] _RAND_44;
  reg  ex_reg_valid; // @[RocketCore.scala 173:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312139.4]
  reg [31:0] _RAND_45;
  reg  ex_reg_rvc; // @[RocketCore.scala 174:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312140.4]
  reg [31:0] _RAND_46;
  reg [4:0] ex_reg_btb_resp_entry; // @[RocketCore.scala 175:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312141.4]
  reg [31:0] _RAND_47;
  reg [7:0] ex_reg_btb_resp_bht_history; // @[RocketCore.scala 175:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312141.4]
  reg [31:0] _RAND_48;
  reg  ex_reg_xcpt; // @[RocketCore.scala 176:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312142.4]
  reg [31:0] _RAND_49;
  reg  ex_reg_flush_pipe; // @[RocketCore.scala 177:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312143.4]
  reg [31:0] _RAND_50;
  reg  ex_reg_load_use; // @[RocketCore.scala 178:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312144.4]
  reg [31:0] _RAND_51;
  reg [63:0] ex_reg_cause; // @[RocketCore.scala 179:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312145.4]
  reg [63:0] _RAND_52;
  reg  ex_reg_replay; // @[RocketCore.scala 180:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312146.4]
  reg [31:0] _RAND_53;
  reg [39:0] ex_reg_pc; // @[RocketCore.scala 181:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312147.4]
  reg [63:0] _RAND_54;
  reg [31:0] ex_reg_inst; // @[RocketCore.scala 182:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312148.4]
  reg [31:0] _RAND_55;
  reg [31:0] ex_reg_raw_inst; // @[RocketCore.scala 183:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312149.4]
  reg [31:0] _RAND_56;
  reg  mem_reg_xcpt_interrupt; // @[RocketCore.scala 185:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312150.4]
  reg [31:0] _RAND_57;
  reg  mem_reg_valid; // @[RocketCore.scala 186:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312151.4]
  reg [31:0] _RAND_58;
  reg  mem_reg_rvc; // @[RocketCore.scala 187:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312152.4]
  reg [31:0] _RAND_59;
  reg [4:0] mem_reg_btb_resp_entry; // @[RocketCore.scala 188:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312153.4]
  reg [31:0] _RAND_60;
  reg [7:0] mem_reg_btb_resp_bht_history; // @[RocketCore.scala 188:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312153.4]
  reg [31:0] _RAND_61;
  reg  mem_reg_xcpt; // @[RocketCore.scala 189:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312154.4]
  reg [31:0] _RAND_62;
  reg  mem_reg_replay; // @[RocketCore.scala 190:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312155.4]
  reg [31:0] _RAND_63;
  reg  mem_reg_flush_pipe; // @[RocketCore.scala 191:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312156.4]
  reg [31:0] _RAND_64;
  reg [63:0] mem_reg_cause; // @[RocketCore.scala 192:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312157.4]
  reg [63:0] _RAND_65;
  reg  mem_reg_slow_bypass; // @[RocketCore.scala 193:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312158.4]
  reg [31:0] _RAND_66;
  reg  mem_reg_load; // @[RocketCore.scala 194:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312159.4]
  reg [31:0] _RAND_67;
  reg  mem_reg_store; // @[RocketCore.scala 195:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312160.4]
  reg [31:0] _RAND_68;
  reg  mem_reg_sfence; // @[RocketCore.scala 196:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312161.4]
  reg [31:0] _RAND_69;
  reg [39:0] mem_reg_pc; // @[RocketCore.scala 197:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312162.4]
  reg [63:0] _RAND_70;
  reg [31:0] mem_reg_inst; // @[RocketCore.scala 198:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312163.4]
  reg [31:0] _RAND_71;
  reg [31:0] mem_reg_raw_inst; // @[RocketCore.scala 199:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312164.4]
  reg [31:0] _RAND_72;
  reg [63:0] mem_reg_wdata; // @[RocketCore.scala 200:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312165.4]
  reg [63:0] _RAND_73;
  reg [63:0] mem_reg_rs2; // @[RocketCore.scala 201:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312166.4]
  reg [63:0] _RAND_74;
  reg  mem_br_taken; // @[RocketCore.scala 202:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312167.4]
  reg [31:0] _RAND_75;
  reg  wb_reg_valid; // @[RocketCore.scala 205:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312170.4]
  reg [31:0] _RAND_76;
  reg  wb_reg_xcpt; // @[RocketCore.scala 206:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312171.4]
  reg [31:0] _RAND_77;
  reg  wb_reg_replay; // @[RocketCore.scala 207:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312172.4]
  reg [31:0] _RAND_78;
  reg  wb_reg_flush_pipe; // @[RocketCore.scala 208:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312173.4]
  reg [31:0] _RAND_79;
  reg [63:0] wb_reg_cause; // @[RocketCore.scala 209:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312174.4]
  reg [63:0] _RAND_80;
  reg  wb_reg_sfence; // @[RocketCore.scala 210:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312175.4]
  reg [31:0] _RAND_81;
  reg [39:0] wb_reg_pc; // @[RocketCore.scala 211:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312176.4]
  reg [63:0] _RAND_82;
  reg [31:0] wb_reg_inst; // @[RocketCore.scala 212:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312177.4]
  reg [31:0] _RAND_83;
  reg [31:0] wb_reg_raw_inst; // @[RocketCore.scala 213:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312178.4]
  reg [31:0] _RAND_84;
  reg [63:0] wb_reg_wdata; // @[RocketCore.scala 214:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312179.4]
  reg [63:0] _RAND_85;
  reg [63:0] wb_reg_rs2; // @[RocketCore.scala 215:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312180.4]
  reg [63:0] _RAND_86;
  wire  replay_wb_common; // @[RocketCore.scala 563:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313604.4]
  wire  _T_1465; // @[RocketCore.scala 564:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313605.4]
  wire  _T_1466; // @[RocketCore.scala 564:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313606.4]
  wire  replay_wb_rocc; // @[RocketCore.scala 564:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313607.4]
  wire  replay_wb; // @[RocketCore.scala 565:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313608.4]
  wire  _T_1429; // @[RocketCore.scala 542:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313563.4]
  wire  _T_1430; // @[RocketCore.scala 542:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313564.4]
  wire  _T_1441; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313575.4]
  wire  _T_1432; // @[RocketCore.scala 543:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313566.4]
  wire  _T_1442; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313576.4]
  wire  _T_1434; // @[RocketCore.scala 544:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313568.4]
  wire  _T_1443; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313577.4]
  wire  _T_1436; // @[RocketCore.scala 545:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313570.4]
  wire  _T_1444; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313578.4]
  wire  _T_1438; // @[RocketCore.scala 546:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313572.4]
  wire  _T_1445; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313579.4]
  wire  _T_1440; // @[RocketCore.scala 547:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313574.4]
  wire  wb_xcpt; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313580.4]
  wire  _T_1467; // @[RocketCore.scala 566:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313609.4]
  wire  _T_1468; // @[RocketCore.scala 566:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313610.4]
  wire  take_pc_wb; // @[RocketCore.scala 566:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313611.4]
  wire  _T_1101; // @[RocketCore.scala 425:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313158.4]
  wire  ex_pc_valid; // @[RocketCore.scala 425:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313159.4]
  wire  _T_1274; // @[RocketCore.scala 448:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313338.4]
  wire [63:0] _T_1275; // @[RocketCore.scala 884:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313339.4]
  wire [24:0] a; // @[RocketCore.scala 884:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313340.4]
  wire  _T_1276; // @[RocketCore.scala 885:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313341.4]
  wire  _T_1277; // @[RocketCore.scala 885:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313342.4]
  wire  _T_1278; // @[RocketCore.scala 885:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313343.4]
  wire  _T_1279; // @[RocketCore.scala 885:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313344.4]
  wire  _T_1280; // @[RocketCore.scala 885:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313345.4]
  wire  _T_1281; // @[RocketCore.scala 885:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313346.4]
  wire  msb; // @[RocketCore.scala 885:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313347.4]
  wire [38:0] _T_1282; // @[RocketCore.scala 886:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313348.4]
  wire [39:0] _T_1283; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313349.4]
  wire [39:0] _T_1284; // @[RocketCore.scala 448:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313350.4]
  wire [39:0] _T_1143; // @[RocketCore.scala 444:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313206.4]
  wire  _T_1144; // @[RocketCore.scala 445:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313207.4]
  wire  _T_1146; // @[RocketCore.scala 932:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313209.4]
  wire  _T_1147; // @[RocketCore.scala 932:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313210.4]
  wire  _T_1202; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313265.4]
  wire [10:0] _T_1152; // @[RocketCore.scala 933:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313215.4]
  wire [10:0] _T_1201; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313264.4]
  wire [11:0] _T_1203; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313266.4]
  wire [7:0] _T_1156; // @[RocketCore.scala 934:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313219.4]
  wire [7:0] _T_1157; // @[RocketCore.scala 934:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313220.4]
  wire [7:0] _T_1158; // @[RocketCore.scala 934:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313221.4]
  wire [7:0] _T_1199; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313262.4]
  wire  _T_1163; // @[RocketCore.scala 936:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313226.4]
  wire  _T_1164; // @[RocketCore.scala 936:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313227.4]
  wire  _T_1166; // @[RocketCore.scala 937:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313229.4]
  wire  _T_1167; // @[RocketCore.scala 937:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313230.4]
  wire  _T_1198; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313261.4]
  wire [8:0] _T_1200; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313263.4]
  wire [20:0] _T_1204; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313267.4]
  wire [5:0] _T_1174; // @[RocketCore.scala 938:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313237.4]
  wire [3:0] _T_1180; // @[RocketCore.scala 940:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313243.4]
  wire [3:0] _T_1183; // @[RocketCore.scala 941:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313246.4]
  wire [9:0] _T_1196; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313259.4]
  wire [10:0] _T_1197; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313260.4]
  wire [31:0] _T_1205; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313268.4]
  wire [31:0] _T_1206; // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313269.4]
  wire [7:0] _T_1261; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313324.4]
  wire  _T_1260; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313323.4]
  wire [8:0] _T_1262; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313325.4]
  wire [20:0] _T_1266; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313329.4]
  wire [9:0] _T_1258; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313321.4]
  wire [10:0] _T_1259; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313322.4]
  wire [31:0] _T_1267; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313330.4]
  wire [31:0] _T_1268; // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313331.4]
  wire [3:0] _T_1269; // @[RocketCore.scala 447:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313332.4]
  wire [31:0] _T_1270; // @[RocketCore.scala 446:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313333.4]
  wire [31:0] _T_1271; // @[RocketCore.scala 445:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313334.4]
  wire [39:0] _GEN_248; // @[RocketCore.scala 444:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313335.4]
  wire [39:0] _T_1273; // @[RocketCore.scala 444:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313336.4]
  wire [39:0] mem_br_target; // @[RocketCore.scala 444:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313337.4]
  wire [39:0] _T_1285; // @[RocketCore.scala 448:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313351.4]
  wire [39:0] _T_1286; // @[RocketCore.scala 448:129:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313352.4]
  wire [39:0] _T_1287; // @[RocketCore.scala 448:129:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313353.4]
  wire [39:0] mem_npc; // @[RocketCore.scala 448:141:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313354.4]
  wire  _T_1288; // @[RocketCore.scala 450:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313355.4]
  wire  _T_1289; // @[RocketCore.scala 451:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313356.4]
  wire  _T_1290; // @[RocketCore.scala 451:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313357.4]
  wire  _T_1291; // @[RocketCore.scala 451:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313358.4]
  wire  mem_wrong_npc; // @[RocketCore.scala 450:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313359.4]
  wire  _T_1307; // @[RocketCore.scala 458:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313380.4]
  wire  take_pc_mem; // @[RocketCore.scala 458:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313381.4]
  wire  take_pc_mem_wb; // @[RocketCore.scala 218:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312183.4]
  wire [31:0] _T_263; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312192.4]
  wire  _T_264; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312193.4]
  wire [31:0] _T_265; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312194.4]
  wire  _T_266; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312195.4]
  wire [31:0] _T_267; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312196.4]
  wire  _T_268; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312197.4]
  wire [31:0] _T_269; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312198.4]
  wire  _T_270; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312199.4]
  wire [31:0] _T_271; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312200.4]
  wire  _T_272; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312201.4]
  wire [31:0] _T_273; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312202.4]
  wire  _T_274; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312203.4]
  wire [31:0] _T_275; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312204.4]
  wire  _T_276; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312205.4]
  wire [31:0] _T_277; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312206.4]
  wire  _T_278; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312207.4]
  wire [31:0] _T_279; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312208.4]
  wire  _T_280; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312209.4]
  wire  _T_282; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312211.4]
  wire [31:0] _T_283; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312212.4]
  wire  _T_284; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312213.4]
  wire [31:0] _T_285; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312214.4]
  wire  _T_286; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312215.4]
  wire [31:0] _T_287; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312216.4]
  wire  _T_288; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312217.4]
  wire [31:0] _T_289; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312218.4]
  wire  _T_290; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312219.4]
  wire [31:0] _T_291; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312220.4]
  wire  _T_292; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312221.4]
  wire [31:0] _T_293; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312222.4]
  wire  _T_294; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312223.4]
  wire [31:0] _T_295; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312224.4]
  wire  _T_296; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312225.4]
  wire  _T_298; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312227.4]
  wire [31:0] _T_299; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312228.4]
  wire  _T_300; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312229.4]
  wire  _T_302; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312231.4]
  wire [31:0] _T_303; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312232.4]
  wire  _T_304; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312233.4]
  wire [31:0] _T_305; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312234.4]
  wire  _T_306; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312235.4]
  wire [31:0] _T_307; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312236.4]
  wire  _T_308; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312237.4]
  wire  _T_310; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312239.4]
  wire [31:0] _T_311; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312240.4]
  wire  _T_312; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312241.4]
  wire [31:0] _T_313; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312242.4]
  wire  _T_314; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312243.4]
  wire [31:0] _T_315; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312244.4]
  wire  _T_316; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312245.4]
  wire [31:0] _T_317; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312246.4]
  wire  _T_318; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312247.4]
  wire  _T_319; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312248.4]
  wire [31:0] _T_320; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312249.4]
  wire  _T_321; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312250.4]
  wire [31:0] _T_322; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312251.4]
  wire  _T_323; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312252.4]
  wire [31:0] _T_324; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312253.4]
  wire  _T_325; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312254.4]
  wire [31:0] _T_326; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312255.4]
  wire  _T_327; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312256.4]
  wire [31:0] _T_328; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312257.4]
  wire  _T_329; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312258.4]
  wire  _T_331; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312260.4]
  wire [31:0] _T_332; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312261.4]
  wire  _T_333; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312262.4]
  wire  _T_334; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312263.4]
  wire [31:0] _T_335; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312264.4]
  wire  _T_336; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312265.4]
  wire [31:0] _T_337; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312266.4]
  wire  _T_338; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312267.4]
  wire [31:0] _T_339; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312268.4]
  wire  _T_340; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312269.4]
  wire [31:0] _T_341; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312270.4]
  wire  _T_342; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312271.4]
  wire [31:0] _T_343; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312272.4]
  wire  _T_344; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312273.4]
  wire [31:0] _T_345; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312274.4]
  wire  _T_346; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312275.4]
  wire [31:0] _T_347; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312276.4]
  wire  _T_348; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312277.4]
  wire [31:0] _T_349; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312278.4]
  wire  _T_350; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312279.4]
  wire  _T_352; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312281.4]
  wire  _T_353; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312282.4]
  wire  _T_354; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312283.4]
  wire  _T_355; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312284.4]
  wire  _T_356; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312285.4]
  wire  _T_357; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312286.4]
  wire  _T_358; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312287.4]
  wire  _T_359; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312288.4]
  wire  _T_360; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312289.4]
  wire  _T_361; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312290.4]
  wire  _T_362; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312291.4]
  wire  _T_363; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312292.4]
  wire  _T_364; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312293.4]
  wire  _T_365; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312294.4]
  wire  _T_366; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312295.4]
  wire  _T_367; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312296.4]
  wire  _T_368; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312297.4]
  wire  _T_369; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312298.4]
  wire  _T_370; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312299.4]
  wire  _T_371; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312300.4]
  wire  _T_372; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312301.4]
  wire  _T_373; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312302.4]
  wire  _T_374; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312303.4]
  wire  _T_375; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312304.4]
  wire  _T_376; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312305.4]
  wire  _T_377; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312306.4]
  wire  _T_378; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312307.4]
  wire  _T_379; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312308.4]
  wire  _T_380; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312309.4]
  wire  _T_381; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312310.4]
  wire  _T_382; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312311.4]
  wire  _T_383; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312312.4]
  wire  _T_384; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312313.4]
  wire  _T_385; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312314.4]
  wire  _T_386; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312315.4]
  wire  _T_387; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312316.4]
  wire  _T_388; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312317.4]
  wire  _T_389; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312318.4]
  wire  _T_390; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312319.4]
  wire  _T_391; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312320.4]
  wire  _T_392; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312321.4]
  wire  _T_393; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312322.4]
  wire  _T_394; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312323.4]
  wire  id_ctrl_legal; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312324.4]
  wire [31:0] _T_396; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312325.4]
  wire  _T_397; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312326.4]
  wire [31:0] _T_398; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312327.4]
  wire  id_ctrl_rfs3; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312328.4]
  wire [31:0] _T_400; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312329.4]
  wire  _T_401; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312330.4]
  wire  _T_403; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312332.4]
  wire  id_ctrl_fp; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312333.4]
  wire  _T_406; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312335.4]
  wire [31:0] _T_407; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312336.4]
  wire  _T_408; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312337.4]
  wire  id_ctrl_rocc; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312339.4]
  wire [31:0] _T_411; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312340.4]
  wire  id_ctrl_branch; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312341.4]
  wire [31:0] _T_414; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312343.4]
  wire  id_ctrl_jal; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312344.4]
  wire [31:0] _T_417; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312346.4]
  wire  id_ctrl_jalr; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312347.4]
  wire [31:0] _T_420; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312349.4]
  wire  _T_421; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312350.4]
  wire  _T_423; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312352.4]
  wire [31:0] _T_424; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312353.4]
  wire  _T_425; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312354.4]
  wire [31:0] _T_426; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312355.4]
  wire  id_ctrl_amo; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312356.4]
  wire [31:0] _T_428; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312357.4]
  wire  _T_429; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312358.4]
  wire [31:0] _T_430; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312359.4]
  wire  _T_431; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312360.4]
  wire  _T_433; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312362.4]
  wire  _T_434; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312363.4]
  wire  _T_435; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312364.4]
  wire  _T_436; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312365.4]
  wire  id_ctrl_rxs2; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312366.4]
  wire [31:0] _T_438; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312367.4]
  wire  _T_439; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312368.4]
  wire [31:0] _T_440; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312369.4]
  wire  _T_441; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312370.4]
  wire [31:0] _T_442; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312371.4]
  wire  _T_443; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312372.4]
  wire [31:0] _T_444; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312373.4]
  wire  _T_445; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312374.4]
  wire [31:0] _T_446; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312375.4]
  wire  _T_447; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312376.4]
  wire [31:0] _T_448; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312377.4]
  wire  _T_449; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312378.4]
  wire  _T_451; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312380.4]
  wire  _T_453; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312382.4]
  wire  _T_454; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312383.4]
  wire  _T_455; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312384.4]
  wire  _T_456; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312385.4]
  wire  _T_457; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312386.4]
  wire  id_ctrl_rxs1; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312387.4]
  wire [31:0] _T_459; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312388.4]
  wire  _T_460; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312389.4]
  wire  _T_462; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312391.4]
  wire  _T_464; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312393.4]
  wire [31:0] _T_465; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312394.4]
  wire  _T_466; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312395.4]
  wire  _T_468; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312397.4]
  wire  _T_469; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312398.4]
  wire  _T_470; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312399.4]
  wire  _T_471; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312400.4]
  wire [31:0] _T_472; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312401.4]
  wire  _T_473; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312402.4]
  wire [31:0] _T_474; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312403.4]
  wire  _T_475; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312404.4]
  wire [31:0] _T_476; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312405.4]
  wire  _T_477; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312406.4]
  wire  _T_479; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312408.4]
  wire  _T_480; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312409.4]
  wire [1:0] id_ctrl_sel_alu2; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312410.4]
  wire [31:0] _T_482; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312411.4]
  wire  _T_483; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312412.4]
  wire  _T_485; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312414.4]
  wire [31:0] _T_486; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312415.4]
  wire  _T_487; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312416.4]
  wire [31:0] _T_488; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312417.4]
  wire  _T_489; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312418.4]
  wire  _T_491; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312420.4]
  wire  _T_493; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312422.4]
  wire  _T_494; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312423.4]
  wire  _T_495; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312424.4]
  wire  _T_496; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312425.4]
  wire  _T_497; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312426.4]
  wire [31:0] _T_498; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312427.4]
  wire  _T_499; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312428.4]
  wire  _T_501; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312430.4]
  wire [1:0] id_ctrl_sel_alu1; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312431.4]
  wire  _T_504; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312433.4]
  wire  _T_506; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312435.4]
  wire  _T_508; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312437.4]
  wire [31:0] _T_509; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312438.4]
  wire  _T_510; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312439.4]
  wire  _T_512; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312441.4]
  wire [31:0] _T_513; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312442.4]
  wire  _T_514; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312443.4]
  wire [31:0] _T_515; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312444.4]
  wire  _T_516; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312445.4]
  wire  _T_518; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312447.4]
  wire  _T_520; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312449.4]
  wire  _T_521; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312450.4]
  wire [1:0] _T_522; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312451.4]
  wire [2:0] id_ctrl_sel_imm; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312452.4]
  wire [31:0] _T_524; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312453.4]
  wire  _T_525; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312454.4]
  wire [31:0] _T_526; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312455.4]
  wire  _T_527; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312456.4]
  wire [31:0] _T_528; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312457.4]
  wire  _T_529; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312458.4]
  wire  _T_531; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312460.4]
  wire  id_ctrl_alu_dw; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312461.4]
  wire [31:0] _T_533; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312462.4]
  wire  _T_534; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312463.4]
  wire [31:0] _T_535; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312464.4]
  wire  _T_536; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312465.4]
  wire [31:0] _T_537; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312466.4]
  wire  _T_538; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312467.4]
  wire [31:0] _T_539; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312468.4]
  wire  _T_540; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312469.4]
  wire  _T_542; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312471.4]
  wire  _T_543; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312472.4]
  wire  _T_544; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312473.4]
  wire [31:0] _T_545; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312474.4]
  wire  _T_546; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312475.4]
  wire [31:0] _T_547; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312476.4]
  wire  _T_548; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312477.4]
  wire  _T_550; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312479.4]
  wire [31:0] _T_551; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312480.4]
  wire  _T_552; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312481.4]
  wire [31:0] _T_553; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312482.4]
  wire  _T_554; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312483.4]
  wire [31:0] _T_555; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312484.4]
  wire  _T_556; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312485.4]
  wire [31:0] _T_557; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312486.4]
  wire  _T_558; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312487.4]
  wire  _T_560; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312489.4]
  wire  _T_561; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312490.4]
  wire  _T_562; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312491.4]
  wire  _T_563; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312492.4]
  wire  _T_564; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312493.4]
  wire  _T_565; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312494.4]
  wire [31:0] _T_566; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312495.4]
  wire  _T_567; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312496.4]
  wire [31:0] _T_568; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312497.4]
  wire  _T_569; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312498.4]
  wire [31:0] _T_570; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312499.4]
  wire  _T_571; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312500.4]
  wire  _T_573; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312502.4]
  wire  _T_575; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312504.4]
  wire  _T_577; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312506.4]
  wire  _T_578; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312507.4]
  wire  _T_579; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312508.4]
  wire  _T_580; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312509.4]
  wire [31:0] _T_581; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312510.4]
  wire  _T_582; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312511.4]
  wire [31:0] _T_583; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312512.4]
  wire  _T_584; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312513.4]
  wire [31:0] _T_585; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312514.4]
  wire  _T_586; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312515.4]
  wire  _T_588; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312517.4]
  wire  _T_589; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312518.4]
  wire  _T_590; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312519.4]
  wire  _T_591; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312520.4]
  wire [1:0] _T_592; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312521.4]
  wire [1:0] _T_593; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312522.4]
  wire [3:0] id_ctrl_alu_fn; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312523.4]
  wire [31:0] _T_595; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312524.4]
  wire  _T_596; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312525.4]
  wire [31:0] _T_597; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312526.4]
  wire  _T_598; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312527.4]
  wire  _T_600; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312529.4]
  wire  _T_601; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312530.4]
  wire  _T_602; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312531.4]
  wire  _T_603; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312532.4]
  wire  _T_604; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312533.4]
  wire  _T_605; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312534.4]
  wire  _T_606; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312535.4]
  wire  id_ctrl_mem; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312536.4]
  wire [31:0] _T_608; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312537.4]
  wire  _T_609; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312538.4]
  wire  _T_611; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312540.4]
  wire [31:0] _T_612; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312541.4]
  wire  _T_613; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312542.4]
  wire [31:0] _T_614; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312543.4]
  wire  _T_615; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312544.4]
  wire  _T_617; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312546.4]
  wire  _T_618; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312547.4]
  wire  _T_619; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312548.4]
  wire [31:0] _T_620; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312549.4]
  wire  _T_621; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312550.4]
  wire [31:0] _T_622; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312551.4]
  wire  _T_623; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312552.4]
  wire  _T_625; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312554.4]
  wire [31:0] _T_626; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312555.4]
  wire  _T_627; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312556.4]
  wire [31:0] _T_628; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312557.4]
  wire  _T_629; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312558.4]
  wire [31:0] _T_630; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312559.4]
  wire  _T_631; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312560.4]
  wire  _T_633; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312562.4]
  wire  _T_634; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312563.4]
  wire  _T_635; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312564.4]
  wire  _T_636; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312565.4]
  wire [31:0] _T_637; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312566.4]
  wire  _T_638; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312567.4]
  wire [1:0] _T_641; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312570.4]
  wire [1:0] _T_642; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312571.4]
  wire [2:0] _T_643; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312572.4]
  wire [4:0] id_ctrl_mem_cmd; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312573.4]
  wire [31:0] _T_645; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312574.4]
  wire  _T_646; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312575.4]
  wire [31:0] _T_648; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312577.4]
  wire  _T_649; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312578.4]
  wire  _T_651; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312580.4]
  wire [31:0] _T_652; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312581.4]
  wire  _T_653; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312582.4]
  wire [1:0] _T_655; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312584.4]
  wire [2:0] id_ctrl_mem_type; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312585.4]
  wire [31:0] _T_657; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312586.4]
  wire  _T_658; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312587.4]
  wire [31:0] _T_659; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312588.4]
  wire  _T_676; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312605.4]
  wire  _T_678; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312607.4]
  wire  _T_680; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312609.4]
  wire  _T_681; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312610.4]
  wire  id_ctrl_wfd; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312611.4]
  wire [31:0] _T_683; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312612.4]
  wire  id_ctrl_div; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312613.4]
  wire [31:0] _T_686; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312615.4]
  wire  _T_687; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312616.4]
  wire [31:0] _T_688; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312617.4]
  wire  _T_689; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312618.4]
  wire [31:0] _T_690; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312619.4]
  wire  _T_691; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312620.4]
  wire [31:0] _T_692; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312621.4]
  wire  _T_693; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312622.4]
  wire [31:0] _T_694; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312623.4]
  wire  _T_695; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312624.4]
  wire [31:0] _T_696; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312625.4]
  wire  _T_697; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312626.4]
  wire [31:0] _T_698; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312627.4]
  wire  _T_699; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312628.4]
  wire  _T_701; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312630.4]
  wire  _T_702; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312631.4]
  wire  _T_703; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312632.4]
  wire  _T_704; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312633.4]
  wire  _T_705; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312634.4]
  wire  _T_706; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312635.4]
  wire  _T_707; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312636.4]
  wire  _T_708; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312637.4]
  wire  id_ctrl_wxd; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312638.4]
  wire [31:0] _T_710; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312639.4]
  wire  _T_711; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312640.4]
  wire [31:0] _T_713; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312642.4]
  wire  _T_714; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312643.4]
  wire [31:0] _T_716; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312645.4]
  wire  _T_717; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312646.4]
  wire [31:0] _T_718; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312647.4]
  wire  _T_719; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312648.4]
  wire [31:0] _T_720; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312649.4]
  wire  _T_721; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312650.4]
  wire  _T_723; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312652.4]
  wire  _T_724; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312653.4]
  wire  _T_725; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312654.4]
  wire  _T_726; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312655.4]
  wire [1:0] _T_727; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312656.4]
  wire [2:0] id_ctrl_csr; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312657.4]
  wire [31:0] _T_729; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312658.4]
  wire  id_ctrl_fence_i; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312659.4]
  wire  id_ctrl_fence; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312662.4]
  wire  _T_737; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312666.4]
  wire [31:0] _T_738; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312667.4]
  wire  _T_739; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312668.4]
  wire [31:0] _T_740; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312669.4]
  wire  _T_741; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312670.4]
  wire [31:0] _T_742; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312671.4]
  wire  _T_743; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312672.4]
  wire  _T_745; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312674.4]
  wire  _T_746; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312675.4]
  wire  id_ctrl_dp; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312676.4]
  reg  id_reg_fence; // @[RocketCore.scala 236:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312708.4]
  reg [31:0] _RAND_87;
  wire  _T_755; // @[RocketCore.scala 917:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312712.4]
  wire [4:0] _T_757; // @[RocketCore.scala 911:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312714.4]
  wire [63:0] _T_760; // @[RocketCore.scala 917:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312717.4]
  wire [4:0] _T_765; // @[RocketCore.scala 911:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312723.4]
  wire [63:0] _T_768; // @[RocketCore.scala 917:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312726.4]
  wire  _T_839; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312801.4]
  wire  _T_840; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312802.4]
  wire  _T_841; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312803.4]
  wire  _T_842; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312804.4]
  wire  id_csr_en; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312805.4]
  wire  id_system_insn; // @[RocketCore.scala 246:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312806.4]
  wire  id_csr_ren; // @[RocketCore.scala 247:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312811.4]
  wire  _T_847; // @[RocketCore.scala 249:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312813.4]
  wire  id_sfence; // @[RocketCore.scala 249:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312814.4]
  wire  _T_848; // @[RocketCore.scala 250:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312815.4]
  wire  _T_849; // @[RocketCore.scala 250:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312816.4]
  wire  _T_850; // @[RocketCore.scala 250:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312817.4]
  wire  _T_851; // @[RocketCore.scala 250:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312818.4]
  wire  id_csr_flush; // @[RocketCore.scala 250:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312819.4]
  wire  _T_852; // @[RocketCore.scala 258:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312820.4]
  wire  _T_854; // @[RocketCore.scala 259:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312822.4]
  wire  _T_855; // @[RocketCore.scala 259:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312823.4]
  wire  _T_856; // @[RocketCore.scala 259:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312824.4]
  wire  _T_857; // @[RocketCore.scala 258:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312825.4]
  wire  _T_858; // @[RocketCore.scala 260:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312826.4]
  wire  _T_859; // @[RocketCore.scala 260:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312827.4]
  wire  _T_860; // @[RocketCore.scala 260:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312828.4]
  wire  _T_861; // @[RocketCore.scala 259:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312829.4]
  wire  _T_862; // @[RocketCore.scala 261:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312830.4]
  wire  _T_863; // @[RocketCore.scala 261:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312831.4]
  wire  _T_864; // @[RocketCore.scala 260:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312832.4]
  wire  _T_865; // @[RocketCore.scala 262:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312833.4]
  wire  _T_866; // @[RocketCore.scala 262:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312834.4]
  wire  _T_867; // @[RocketCore.scala 262:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312835.4]
  wire  _T_868; // @[RocketCore.scala 261:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312836.4]
  wire  _T_869; // @[RocketCore.scala 263:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312837.4]
  wire  _T_870; // @[RocketCore.scala 263:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312838.4]
  wire  _T_871; // @[RocketCore.scala 263:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312839.4]
  wire  _T_872; // @[RocketCore.scala 262:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312840.4]
  wire  _T_873; // @[RocketCore.scala 264:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312841.4]
  wire  _T_874; // @[RocketCore.scala 263:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312842.4]
  wire  _T_878; // @[RocketCore.scala 266:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312846.4]
  wire  _T_879; // @[RocketCore.scala 266:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312847.4]
  wire  _T_880; // @[RocketCore.scala 266:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312848.4]
  wire  _T_881; // @[RocketCore.scala 265:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312849.4]
  wire  _T_882; // @[RocketCore.scala 267:5:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312850.4]
  wire  _T_884; // @[RocketCore.scala 267:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312852.4]
  wire  _T_885; // @[RocketCore.scala 267:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312853.4]
  wire  id_illegal_insn; // @[RocketCore.scala 266:99:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312854.4]
  wire  id_amo_aq; // @[RocketCore.scala 269:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312855.4]
  wire  id_amo_rl; // @[RocketCore.scala 270:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312856.4]
  wire  _T_886; // @[RocketCore.scala 271:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312857.4]
  wire  id_fence_next; // @[RocketCore.scala 271:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312858.4]
  wire  _T_887; // @[RocketCore.scala 272:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312859.4]
  wire  id_mem_busy; // @[RocketCore.scala 272:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312860.4]
  wire  _T_888; // @[RocketCore.scala 273:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312861.4]
  wire  _T_889; // @[RocketCore.scala 275:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312865.4]
  wire  _T_890; // @[RocketCore.scala 275:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312866.4]
  wire  _T_891; // @[RocketCore.scala 276:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312867.4]
  wire  _T_892; // @[RocketCore.scala 275:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312868.4]
  wire  id_rocc_busy; // @[RocketCore.scala 276:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312870.4]
  wire  _T_895; // @[RocketCore.scala 277:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312872.4]
  wire  _T_896; // @[RocketCore.scala 278:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312873.4]
  wire  _T_897; // @[RocketCore.scala 278:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312874.4]
  wire  _T_898; // @[RocketCore.scala 278:97:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312875.4]
  wire  _T_899; // @[RocketCore.scala 278:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312876.4]
  wire  _T_900; // @[RocketCore.scala 278:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312877.4]
  wire  _T_901; // @[RocketCore.scala 278:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312878.4]
  wire  id_do_fence; // @[RocketCore.scala 277:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312879.4]
  wire  _T_904; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312891.4]
  wire  _T_905; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312892.4]
  wire  _T_906; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312893.4]
  wire  _T_907; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312894.4]
  wire  _T_908; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312895.4]
  wire  _T_909; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312896.4]
  wire  id_xcpt; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312897.4]
  wire [1:0] _T_910; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312898.4]
  wire [3:0] _T_911; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312899.4]
  wire [3:0] _T_912; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312900.4]
  wire [3:0] _T_913; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312901.4]
  wire [3:0] _T_914; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312902.4]
  wire [3:0] _T_915; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312903.4]
  wire [4:0] ex_waddr; // @[RocketCore.scala 313:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312916.4]
  wire [4:0] mem_waddr; // @[RocketCore.scala 314:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312917.4]
  wire [4:0] wb_waddr; // @[RocketCore.scala 315:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312918.4]
  wire  _T_926; // @[RocketCore.scala 318:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312919.4]
  wire  _T_927; // @[RocketCore.scala 319:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312920.4]
  wire  _T_928; // @[RocketCore.scala 319:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312921.4]
  wire  _T_929; // @[RocketCore.scala 319:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312922.4]
  wire  _T_931; // @[RocketCore.scala 321:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312924.4]
  wire  _T_933; // @[RocketCore.scala 321:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312926.4]
  wire  _T_934; // @[RocketCore.scala 321:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312927.4]
  wire  _T_935; // @[RocketCore.scala 321:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312928.4]
  wire  _T_936; // @[RocketCore.scala 321:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312929.4]
  wire  _T_938; // @[RocketCore.scala 321:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312931.4]
  wire  _T_939; // @[RocketCore.scala 321:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312932.4]
  wire  _T_941; // @[RocketCore.scala 321:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312934.4]
  wire  _T_942; // @[RocketCore.scala 321:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312935.4]
  wire  _T_943; // @[RocketCore.scala 321:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312936.4]
  wire  _T_944; // @[RocketCore.scala 321:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312937.4]
  wire  _T_946; // @[RocketCore.scala 321:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312939.4]
  reg  ex_reg_rs_bypass_0; // @[RocketCore.scala 325:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312940.4]
  reg [31:0] _RAND_88;
  reg  ex_reg_rs_bypass_1; // @[RocketCore.scala 325:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312940.4]
  reg [31:0] _RAND_89;
  reg [1:0] ex_reg_rs_lsb_0; // @[RocketCore.scala 326:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312941.4]
  reg [31:0] _RAND_90;
  reg [1:0] ex_reg_rs_lsb_1; // @[RocketCore.scala 326:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312941.4]
  reg [31:0] _RAND_91;
  reg [61:0] ex_reg_rs_msb_0; // @[RocketCore.scala 327:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312942.4]
  reg [63:0] _RAND_92;
  reg [61:0] ex_reg_rs_msb_1; // @[RocketCore.scala 327:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312942.4]
  reg [63:0] _RAND_93;
  wire  _T_968; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312943.4]
  wire [63:0] _T_969; // @[package.scala 31:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312944.4]
  wire  _T_970; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312945.4]
  wire [63:0] _T_971; // @[package.scala 31:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312946.4]
  wire  _T_972; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312947.4]
  wire [63:0] _T_973; // @[package.scala 31:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312948.4]
  wire [63:0] _T_974; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312949.4]
  wire [63:0] _T_975; // @[RocketCore.scala 329:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312950.4]
  wire  _T_976; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312951.4]
  wire [63:0] _T_977; // @[package.scala 31:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312952.4]
  wire  _T_978; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312953.4]
  wire [63:0] _T_979; // @[package.scala 31:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312954.4]
  wire  _T_980; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312955.4]
  wire [63:0] _T_981; // @[package.scala 31:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312956.4]
  wire [63:0] _T_982; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312957.4]
  wire [63:0] _T_983; // @[RocketCore.scala 329:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312958.4]
  wire  _T_984; // @[RocketCore.scala 932:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312959.4]
  wire  _T_985; // @[RocketCore.scala 932:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312960.4]
  wire  _T_986; // @[RocketCore.scala 932:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312961.4]
  wire  _T_987; // @[RocketCore.scala 932:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312962.4]
  wire  _T_988; // @[RocketCore.scala 933:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312963.4]
  wire [10:0] _T_989; // @[RocketCore.scala 933:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312964.4]
  wire [10:0] _T_990; // @[RocketCore.scala 933:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312965.4]
  wire [10:0] _T_991; // @[RocketCore.scala 933:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312966.4]
  wire  _T_992; // @[RocketCore.scala 934:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312967.4]
  wire  _T_993; // @[RocketCore.scala 934:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312968.4]
  wire  _T_994; // @[RocketCore.scala 934:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312969.4]
  wire [7:0] _T_995; // @[RocketCore.scala 934:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312970.4]
  wire [7:0] _T_996; // @[RocketCore.scala 934:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312971.4]
  wire [7:0] _T_997; // @[RocketCore.scala 934:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312972.4]
  wire  _T_1000; // @[RocketCore.scala 935:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312975.4]
  wire  _T_1001; // @[RocketCore.scala 936:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312976.4]
  wire  _T_1002; // @[RocketCore.scala 936:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312977.4]
  wire  _T_1003; // @[RocketCore.scala 936:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312978.4]
  wire  _T_1004; // @[RocketCore.scala 937:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312979.4]
  wire  _T_1005; // @[RocketCore.scala 937:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312980.4]
  wire  _T_1006; // @[RocketCore.scala 937:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312981.4]
  wire  _T_1007; // @[RocketCore.scala 937:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312982.4]
  wire  _T_1008; // @[RocketCore.scala 936:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312983.4]
  wire  _T_1009; // @[RocketCore.scala 935:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312984.4]
  wire [5:0] _T_1013; // @[RocketCore.scala 938:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312988.4]
  wire [5:0] _T_1014; // @[RocketCore.scala 938:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312989.4]
  wire  _T_1016; // @[RocketCore.scala 940:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312991.4]
  wire  _T_1018; // @[RocketCore.scala 940:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312993.4]
  wire [3:0] _T_1019; // @[RocketCore.scala 940:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312994.4]
  wire [3:0] _T_1021; // @[RocketCore.scala 941:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312996.4]
  wire [3:0] _T_1022; // @[RocketCore.scala 941:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312997.4]
  wire [3:0] _T_1023; // @[RocketCore.scala 941:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312998.4]
  wire [3:0] _T_1024; // @[RocketCore.scala 940:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312999.4]
  wire [3:0] _T_1025; // @[RocketCore.scala 939:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313000.4]
  wire  _T_1028; // @[RocketCore.scala 943:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313003.4]
  wire  _T_1031; // @[RocketCore.scala 944:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313006.4]
  wire  _T_1032; // @[RocketCore.scala 944:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313007.4]
  wire  _T_1033; // @[RocketCore.scala 943:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313008.4]
  wire  _T_1034; // @[RocketCore.scala 942:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313009.4]
  wire [9:0] _T_1035; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313010.4]
  wire [10:0] _T_1036; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313011.4]
  wire  _T_1037; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313012.4]
  wire [7:0] _T_1038; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313013.4]
  wire [8:0] _T_1039; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313014.4]
  wire [10:0] _T_1040; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313015.4]
  wire  _T_1041; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313016.4]
  wire [11:0] _T_1042; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313017.4]
  wire [20:0] _T_1043; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313018.4]
  wire [31:0] _T_1044; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313019.4]
  wire [31:0] ex_imm; // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313020.4]
  wire [63:0] _T_1045; // @[RocketCore.scala 332:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313021.4]
  wire [39:0] _T_1046; // @[RocketCore.scala 333:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313022.4]
  wire  _T_1047; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313023.4]
  wire [39:0] _T_1048; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313024.4]
  wire  _T_1049; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313025.4]
  wire [63:0] ex_op1; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313026.4]
  wire [63:0] _T_1050; // @[RocketCore.scala 335:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313027.4]
  wire [3:0] _T_1051; // @[RocketCore.scala 337:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313028.4]
  wire  _T_1052; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313029.4]
  wire [3:0] _T_1053; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313030.4]
  wire  _T_1054; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313031.4]
  wire [31:0] _T_1055; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313032.4]
  wire  _T_1056; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313033.4]
  wire [63:0] ex_op2; // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313034.4]
  wire  _T_1732; // @[RocketCore.scala 702:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313975.4]
  wire  _T_1733; // @[RocketCore.scala 702:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313976.4]
  wire  _T_1734; // @[RocketCore.scala 702:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313977.4]
  wire  _T_1537; // @[RocketCore.scala 634:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313748.4]
  wire  _T_1538; // @[RocketCore.scala 634:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313749.4]
  wire  _T_1585; // @[RocketCore.scala 654:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313803.4]
  wire  _T_1586; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313804.4]
  wire  _T_1539; // @[RocketCore.scala 635:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313750.4]
  wire  _T_1540; // @[RocketCore.scala 635:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313751.4]
  wire  _T_1587; // @[RocketCore.scala 654:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313805.4]
  wire  _T_1588; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313806.4]
  wire  _T_1591; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313809.4]
  wire  _T_1541; // @[RocketCore.scala 636:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313752.4]
  wire  _T_1542; // @[RocketCore.scala 636:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313753.4]
  wire  _T_1589; // @[RocketCore.scala 654:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313807.4]
  wire  _T_1590; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313808.4]
  wire  _T_1592; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313810.4]
  wire  data_hazard_ex; // @[RocketCore.scala 654:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313811.4]
  wire  _T_1579; // @[RocketCore.scala 653:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313796.4]
  wire  _T_1580; // @[RocketCore.scala 653:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313797.4]
  wire  _T_1581; // @[RocketCore.scala 653:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313798.4]
  wire  _T_1583; // @[RocketCore.scala 653:94:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313800.4]
  wire  _T_1584; // @[RocketCore.scala 653:109:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313801.4]
  wire  ex_cannot_bypass; // @[RocketCore.scala 653:123:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313802.4]
  wire  _T_1604; // @[RocketCore.scala 656:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313824.4]
  wire  _T_1594; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313813.4]
  wire  _T_1596; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313815.4]
  wire  _T_1601; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313820.4]
  wire  _T_1597; // @[RocketCore.scala 655:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313816.4]
  wire  _T_1598; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313817.4]
  wire  _T_1602; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313821.4]
  wire  _T_1600; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313819.4]
  wire  _T_1603; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313822.4]
  wire  fp_data_hazard_ex; // @[RocketCore.scala 655:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313823.4]
  wire  _T_1605; // @[RocketCore.scala 656:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313825.4]
  wire  id_ex_hazard; // @[RocketCore.scala 656:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313826.4]
  wire  _T_1612; // @[RocketCore.scala 663:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313835.4]
  wire  _T_1613; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313836.4]
  wire  _T_1614; // @[RocketCore.scala 663:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313837.4]
  wire  _T_1615; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313838.4]
  wire  _T_1618; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313841.4]
  wire  _T_1616; // @[RocketCore.scala 663:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313839.4]
  wire  _T_1617; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313840.4]
  wire  _T_1619; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313842.4]
  wire  data_hazard_mem; // @[RocketCore.scala 663:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313843.4]
  wire  _T_1606; // @[RocketCore.scala 662:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313828.4]
  wire  _T_1607; // @[RocketCore.scala 662:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313829.4]
  wire  _T_1608; // @[RocketCore.scala 662:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313830.4]
  wire  _T_1609; // @[RocketCore.scala 662:84:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313831.4]
  wire  _T_1610; // @[RocketCore.scala 662:100:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313832.4]
  wire  _T_1611; // @[RocketCore.scala 662:116:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313833.4]
  wire  mem_cannot_bypass; // @[RocketCore.scala 662:131:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313834.4]
  wire  _T_1631; // @[RocketCore.scala 665:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313856.4]
  wire  _T_1621; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313845.4]
  wire  _T_1623; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313847.4]
  wire  _T_1628; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313852.4]
  wire  _T_1624; // @[RocketCore.scala 664:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313848.4]
  wire  _T_1625; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313849.4]
  wire  _T_1629; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313853.4]
  wire  _T_1627; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313851.4]
  wire  _T_1630; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313854.4]
  wire  fp_data_hazard_mem; // @[RocketCore.scala 664:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313855.4]
  wire  _T_1632; // @[RocketCore.scala 665:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313857.4]
  wire  id_mem_hazard; // @[RocketCore.scala 665:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313858.4]
  wire  _T_1705; // @[RocketCore.scala 692:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313947.4]
  wire  _T_1635; // @[RocketCore.scala 669:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313862.4]
  wire  _T_1636; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313863.4]
  wire  _T_1637; // @[RocketCore.scala 669:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313864.4]
  wire  _T_1638; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313865.4]
  wire  _T_1641; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313868.4]
  wire  _T_1639; // @[RocketCore.scala 669:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313866.4]
  wire  _T_1640; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313867.4]
  wire  _T_1642; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313869.4]
  wire  data_hazard_wb; // @[RocketCore.scala 669:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313870.4]
  wire  _T_1102; // @[RocketCore.scala 426:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313160.4]
  wire  wb_dcache_miss; // @[RocketCore.scala 426:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313161.4]
  wire  _T_1464; // @[RocketCore.scala 562:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313602.4]
  wire  wb_set_sboard; // @[RocketCore.scala 562:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313603.4]
  wire  _T_1654; // @[RocketCore.scala 671:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313883.4]
  wire  _T_1644; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313872.4]
  wire  _T_1646; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313874.4]
  wire  _T_1651; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313879.4]
  wire  _T_1647; // @[RocketCore.scala 670:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313875.4]
  wire  _T_1648; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313876.4]
  wire  _T_1652; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313880.4]
  wire  _T_1650; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313878.4]
  wire  _T_1653; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313881.4]
  wire  fp_data_hazard_wb; // @[RocketCore.scala 670:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313882.4]
  wire  _T_1655; // @[RocketCore.scala 671:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313884.4]
  wire  id_wb_hazard; // @[RocketCore.scala 671:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313885.4]
  wire  _T_1706; // @[RocketCore.scala 692:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313948.4]
  reg [31:0] _T_1544; // @[RocketCore.scala 896:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313754.4]
  reg [31:0] _RAND_94;
  wire [30:0] _T_1545; // @[RocketCore.scala 897:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313755.4]
  wire [31:0] _GEN_250; // @[RocketCore.scala 897:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313756.4]
  wire [31:0] _T_1546; // @[RocketCore.scala 897:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313756.4]
  wire [31:0] _T_1552; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313765.4]
  wire  _T_1553; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313766.4]
  wire  dmem_resp_valid; // @[RocketCore.scala 572:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313619.4]
  wire  dmem_resp_replay; // @[RocketCore.scala 573:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313620.4]
  wire  _T_1470; // @[RocketCore.scala 569:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313613.4]
  wire  dmem_resp_xpu; // @[RocketCore.scala 569:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313615.4]
  wire  _T_1480; // @[RocketCore.scala 588:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313642.4]
  wire  _T_1479; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313635.4]
  wire  _T_1476; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313629.4]
  wire  _GEN_214; // @[RocketCore.scala 581:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313636.4]
  wire  ll_wen; // @[RocketCore.scala 588:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313643.4]
  wire [4:0] dmem_resp_waddr; // @[RocketCore.scala 571:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313618.4]
  wire [4:0] _GEN_213; // @[RocketCore.scala 581:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313636.4]
  wire [4:0] ll_waddr; // @[RocketCore.scala 588:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313643.4]
  wire  _T_1554; // @[RocketCore.scala 646:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313767.4]
  wire  _T_1555; // @[RocketCore.scala 646:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313768.4]
  wire  _T_1556; // @[RocketCore.scala 649:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313769.4]
  wire  _T_1557; // @[RocketCore.scala 649:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313770.4]
  wire  _T_1558; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313771.4]
  wire [31:0] _T_1559; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313772.4]
  wire  _T_1560; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313773.4]
  wire  _T_1561; // @[RocketCore.scala 646:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313774.4]
  wire  _T_1562; // @[RocketCore.scala 646:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313775.4]
  wire  _T_1563; // @[RocketCore.scala 649:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313776.4]
  wire  _T_1564; // @[RocketCore.scala 649:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313777.4]
  wire  _T_1565; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313778.4]
  wire  _T_1573; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313786.4]
  wire [31:0] _T_1566; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313779.4]
  wire  _T_1567; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313780.4]
  wire  _T_1568; // @[RocketCore.scala 646:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313781.4]
  wire  _T_1569; // @[RocketCore.scala 646:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313782.4]
  wire  _T_1570; // @[RocketCore.scala 649:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313783.4]
  wire  _T_1571; // @[RocketCore.scala 649:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313784.4]
  wire  _T_1572; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313785.4]
  wire  id_sboard_hazard; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313787.4]
  wire  _T_1707; // @[RocketCore.scala 692:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313949.4]
  wire  _T_1708; // @[RocketCore.scala 693:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313950.4]
  wire  _T_1709; // @[RocketCore.scala 693:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313951.4]
  wire  _T_1710; // @[RocketCore.scala 693:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313952.4]
  wire  _T_1711; // @[RocketCore.scala 692:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313953.4]
  wire  _T_1712; // @[RocketCore.scala 694:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313954.4]
  wire  _T_1713; // @[RocketCore.scala 694:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313955.4]
  wire  _T_1714; // @[RocketCore.scala 694:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313956.4]
  wire  _T_1715; // @[RocketCore.scala 693:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313957.4]
  reg [31:0] _T_1657; // @[RocketCore.scala 896:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313886.4]
  reg [31:0] _RAND_95;
  wire [31:0] _T_1676; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313914.4]
  wire  _T_1677; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313915.4]
  wire  _T_1678; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313916.4]
  wire [31:0] _T_1679; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313917.4]
  wire  _T_1680; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313918.4]
  wire  _T_1681; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313919.4]
  wire  _T_1688; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313926.4]
  wire [31:0] _T_1682; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313920.4]
  wire  _T_1683; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313921.4]
  wire  _T_1684; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313922.4]
  wire  _T_1689; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313927.4]
  wire [31:0] _T_1685; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313923.4]
  wire  _T_1686; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313924.4]
  wire  _T_1687; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313925.4]
  wire  id_stall_fpu; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313928.4]
  wire  _T_1716; // @[RocketCore.scala 695:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313958.4]
  wire  _T_1717; // @[RocketCore.scala 694:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313959.4]
  reg  blocked; // @[RocketCore.scala 684:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313929.4]
  reg [31:0] _RAND_96;
  wire  _T_1698; // @[RocketCore.scala 686:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313938.4]
  wire  dcache_blocked; // @[RocketCore.scala 686:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313939.4]
  wire  _T_1718; // @[RocketCore.scala 696:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313960.4]
  wire  _T_1719; // @[RocketCore.scala 695:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313961.4]
  reg  rocc_blocked; // @[RocketCore.scala 688:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313940.4]
  reg [31:0] _RAND_97;
  wire  _T_1720; // @[RocketCore.scala 697:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313962.4]
  wire  _T_1721; // @[RocketCore.scala 696:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313963.4]
  wire  wb_wxd; // @[RocketCore.scala 561:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313601.4]
  wire  _T_1722; // @[RocketCore.scala 698:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313964.4]
  wire  _T_1723; // @[RocketCore.scala 698:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313965.4]
  wire  _T_1724; // @[RocketCore.scala 698:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313966.4]
  wire  _T_1725; // @[RocketCore.scala 698:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313967.4]
  wire  _T_1726; // @[RocketCore.scala 698:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313968.4]
  wire  _T_1727; // @[RocketCore.scala 698:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313969.4]
  wire  _T_1728; // @[RocketCore.scala 697:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313970.4]
  wire  _T_1731; // @[RocketCore.scala 699:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313973.4]
  wire  ctrl_stalld; // @[RocketCore.scala 700:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313974.4]
  wire  _T_1735; // @[RocketCore.scala 702:89:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313978.4]
  wire  ctrl_killd; // @[RocketCore.scala 702:104:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313979.4]
  wire  _T_1060; // @[RocketCore.scala 368:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313056.4]
  wire  _T_1061; // @[RocketCore.scala 369:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313058.4]
  wire  _T_1062; // @[RocketCore.scala 369:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313059.4]
  wire [1:0] _T_1070; // @[RocketCore.scala 383:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313082.8]
  wire  _T_1071; // @[RocketCore.scala 383:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313083.8]
  wire [1:0] _T_1072; // @[RocketCore.scala 388:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313089.8]
  wire  _T_1073; // @[RocketCore.scala 388:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313090.8]
  wire  _T_1074; // @[RocketCore.scala 388:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313091.8]
  wire  _T_1075; // @[RocketCore.scala 393:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313097.6]
  wire [1:0] _T_1078; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313103.8]
  wire  _T_1079; // @[RocketCore.scala 400:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313106.6]
  wire  _T_1080; // @[RocketCore.scala 400:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313107.6]
  wire  do_bypass; // @[RocketCore.scala 400:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313108.6]
  wire  _T_1083; // @[RocketCore.scala 404:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313114.6]
  wire  _T_1084; // @[RocketCore.scala 404:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313115.6]
  wire  _T_1481; // @[RocketCore.scala 596:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313649.4]
  wire  _T_1482; // @[RocketCore.scala 596:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313650.4]
  wire  _T_1483; // @[RocketCore.scala 596:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313651.4]
  wire  wb_valid; // @[RocketCore.scala 596:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313652.4]
  wire  wb_wen; // @[RocketCore.scala 597:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313653.4]
  wire  rf_wen; // @[RocketCore.scala 598:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313654.4]
  wire [4:0] rf_waddr; // @[RocketCore.scala 599:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313655.4]
  wire  _T_1490; // @[RocketCore.scala 922:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313664.6]
  wire  _T_1494; // @[RocketCore.scala 925:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313670.8]
  wire  _T_1484; // @[RocketCore.scala 600:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313656.4]
  wire [63:0] ll_wdata; // @[RocketCore.scala 581:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313636.4]
  wire  _T_1486; // @[RocketCore.scala 602:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313658.4]
  wire [63:0] _T_1488; // @[RocketCore.scala 602:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313660.4]
  wire [63:0] _T_1489; // @[RocketCore.scala 601:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313661.4]
  wire [63:0] rf_wdata; // @[RocketCore.scala 600:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313662.4]
  wire [63:0] _GEN_219; // @[RocketCore.scala 925:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313671.8]
  wire [63:0] _GEN_226; // @[RocketCore.scala 922:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313665.6]
  wire [63:0] _GEN_233; // @[RocketCore.scala 605:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313663.4]
  wire [1:0] _T_1085; // @[RocketCore.scala 405:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313117.8]
  wire [61:0] _T_1086; // @[RocketCore.scala 406:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313119.8]
  wire  _T_1087; // @[RocketCore.scala 400:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313122.6]
  wire  _T_1088; // @[RocketCore.scala 400:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313123.6]
  wire  do_bypass_1; // @[RocketCore.scala 400:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313124.6]
  wire  _T_1091; // @[RocketCore.scala 404:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313130.6]
  wire  _T_1092; // @[RocketCore.scala 404:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313131.6]
  wire  _T_1495; // @[RocketCore.scala 925:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313674.8]
  wire [63:0] _GEN_220; // @[RocketCore.scala 925:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313675.8]
  wire [63:0] _GEN_227; // @[RocketCore.scala 922:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313665.6]
  wire [63:0] _GEN_234; // @[RocketCore.scala 605:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313663.4]
  wire [1:0] _T_1093; // @[RocketCore.scala 405:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313133.8]
  wire [61:0] _T_1094; // @[RocketCore.scala 406:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313135.8]
  wire [15:0] _T_1095; // @[RocketCore.scala 410:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313139.8]
  wire [31:0] inst; // @[RocketCore.scala 410:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313140.8]
  wire [1:0] _T_1096; // @[RocketCore.scala 412:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313142.8]
  wire [29:0] _T_1097; // @[RocketCore.scala 413:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313144.8]
  wire  _T_1633; // @[RocketCore.scala 666:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313859.4]
  wire  id_load_use; // @[RocketCore.scala 666:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313860.4]
  wire  _T_1099; // @[RocketCore.scala 416:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313149.4]
  wire  _T_1100; // @[RocketCore.scala 416:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313150.4]
  wire  _T_1103; // @[RocketCore.scala 427:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313162.4]
  wire  _T_1104; // @[RocketCore.scala 427:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313163.4]
  wire  _T_1105; // @[RocketCore.scala 428:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313164.4]
  wire  _T_1106; // @[RocketCore.scala 428:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313165.4]
  wire  replay_ex_structural; // @[RocketCore.scala 427:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313166.4]
  wire  replay_ex_load_use; // @[RocketCore.scala 429:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313167.4]
  wire  _T_1107; // @[RocketCore.scala 430:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313168.4]
  wire  _T_1108; // @[RocketCore.scala 430:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313169.4]
  wire  replay_ex; // @[RocketCore.scala 430:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313170.4]
  wire  _T_1109; // @[RocketCore.scala 431:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313171.4]
  wire  _T_1110; // @[RocketCore.scala 431:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313172.4]
  wire  ctrl_killx; // @[RocketCore.scala 431:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313173.4]
  wire  _T_1111; // @[RocketCore.scala 433:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313174.4]
  wire  _T_1122; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313181.4]
  wire  _T_1123; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313182.4]
  wire  _T_1124; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313183.4]
  wire  _T_1125; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313184.4]
  wire  _T_1127; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313186.4]
  wire  _T_1128; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313187.4]
  wire  _T_1129; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313188.4]
  wire  ex_slow_bypass; // @[RocketCore.scala 433:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313189.4]
  wire  _T_1131; // @[RocketCore.scala 434:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313191.4]
  wire  ex_sfence; // @[RocketCore.scala 434:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313192.4]
  wire  ex_xcpt; // @[RocketCore.scala 437:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313193.4]
  wire  _T_1142; // @[RocketCore.scala 443:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313204.4]
  wire  mem_pc_valid; // @[RocketCore.scala 443:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313205.4]
  wire  _T_1294; // @[RocketCore.scala 452:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313362.4]
  wire  _T_1295; // @[RocketCore.scala 452:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313363.4]
  wire  _T_1296; // @[RocketCore.scala 452:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313364.4]
  wire  mem_npc_misaligned; // @[RocketCore.scala 452:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313365.4]
  wire  _T_1297; // @[RocketCore.scala 453:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313366.4]
  wire  _T_1298; // @[RocketCore.scala 453:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313367.4]
  wire  _T_1299; // @[RocketCore.scala 453:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313368.4]
  wire [63:0] _T_1301; // @[RocketCore.scala 453:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313370.4]
  wire [63:0] mem_int_wdata; // @[RocketCore.scala 453:119:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313371.4]
  wire  _T_1302; // @[RocketCore.scala 454:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313372.4]
  wire  mem_cfi; // @[RocketCore.scala 454:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313373.4]
  wire  _T_1304; // @[RocketCore.scala 455:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313375.4]
  wire  mem_cfi_taken; // @[RocketCore.scala 455:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313376.4]
  wire  _T_1309; // @[RocketCore.scala 460:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313383.4]
  wire  _T_1316; // @[RocketCore.scala 467:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313394.4]
  wire  _T_1317; // @[Consts.scala 93:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313402.8]
  wire  _T_1318; // @[Consts.scala 93:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313403.8]
  wire  _T_1319; // @[Consts.scala 93:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313404.8]
  wire  _T_1321; // @[Consts.scala 93:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313406.8]
  wire  _T_1322; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313407.8]
  wire  _T_1323; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313408.8]
  wire  _T_1324; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313409.8]
  wire  _T_1325; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313410.8]
  wire  _T_1326; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313411.8]
  wire  _T_1327; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313412.8]
  wire  _T_1328; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313413.8]
  wire  _T_1329; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313414.8]
  wire  _T_1330; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313415.8]
  wire  _T_1331; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313416.8]
  wire  _T_1332; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313417.8]
  wire  _T_1333; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313418.8]
  wire  _T_1334; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313419.8]
  wire  _T_1335; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313420.8]
  wire  _T_1336; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313421.8]
  wire  _T_1337; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313422.8]
  wire  _T_1338; // @[Consts.scala 91:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313423.8]
  wire  _T_1339; // @[Consts.scala 93:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313424.8]
  wire  _T_1340; // @[RocketCore.scala 472:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313425.8]
  wire  _T_1341; // @[Consts.scala 94:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313427.8]
  wire  _T_1342; // @[Consts.scala 94:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313428.8]
  wire  _T_1343; // @[Consts.scala 94:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313429.8]
  wire  _T_1345; // @[Consts.scala 94:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313431.8]
  wire  _T_1363; // @[Consts.scala 94:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313449.8]
  wire  _T_1364; // @[RocketCore.scala 473:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313450.8]
  wire  _T_1365; // @[RocketCore.scala 486:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313462.8]
  wire  _T_1366; // @[RocketCore.scala 486:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313463.8]
  wire  _T_1367; // @[RocketCore.scala 486:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313464.8]
  wire [2:0] typ; // @[RocketCore.scala 487:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313466.10]
  wire [1:0] _T_1368; // @[AMOALU.scala 10:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313467.10]
  wire  _T_1369; // @[AMOALU.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313468.10]
  wire [7:0] _T_1370; // @[AMOALU.scala 26:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313469.10]
  wire [15:0] _T_1371; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313470.10]
  wire [31:0] _T_1372; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313471.10]
  wire [63:0] _T_1373; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313472.10]
  wire  _T_1374; // @[AMOALU.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313473.10]
  wire [15:0] _T_1375; // @[AMOALU.scala 26:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313474.10]
  wire [31:0] _T_1376; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313475.10]
  wire [63:0] _T_1377; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313476.10]
  wire  _T_1378; // @[AMOALU.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313477.10]
  wire [31:0] _T_1379; // @[AMOALU.scala 26:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313478.10]
  wire [63:0] _T_1380; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313479.10]
  wire  _T_1384; // @[RocketCore.scala 490:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313485.8]
  wire  _T_1385; // @[RocketCore.scala 497:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313491.4]
  wire  _T_1386; // @[RocketCore.scala 497:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313492.4]
  wire  mem_breakpoint; // @[RocketCore.scala 497:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313493.4]
  wire  _T_1387; // @[RocketCore.scala 498:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313494.4]
  wire  _T_1388; // @[RocketCore.scala 498:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313495.4]
  wire  mem_debug_breakpoint; // @[RocketCore.scala 498:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313496.4]
  wire  mem_ldst_xcpt; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313497.4]
  wire [3:0] mem_ldst_cause; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313498.4]
  wire  _T_1389; // @[RocketCore.scala 504:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313499.4]
  wire  _T_1390; // @[RocketCore.scala 505:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313500.4]
  wire  _T_1391; // @[RocketCore.scala 506:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313501.4]
  wire  _T_1392; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313502.4]
  wire  mem_xcpt; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313503.4]
  wire [3:0] _T_1393; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313504.4]
  wire  dcache_kill_mem; // @[RocketCore.scala 515:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313519.4]
  wire  _T_1407; // @[RocketCore.scala 516:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313520.4]
  wire  fpu_kill_mem; // @[RocketCore.scala 516:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313521.4]
  wire  _T_1408; // @[RocketCore.scala 517:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313522.4]
  wire  replay_mem; // @[RocketCore.scala 517:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313523.4]
  wire  _T_1409; // @[RocketCore.scala 518:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313524.4]
  wire  _T_1410; // @[RocketCore.scala 518:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313525.4]
  wire  _T_1411; // @[RocketCore.scala 518:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313526.4]
  wire  killm_common; // @[RocketCore.scala 518:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313527.4]
  reg  _T_1414; // @[RocketCore.scala 519:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313529.4]
  reg [31:0] _RAND_98;
  wire  _T_1416; // @[RocketCore.scala 520:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313533.4]
  wire  ctrl_killm; // @[RocketCore.scala 520:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313534.4]
  wire  _T_1417; // @[RocketCore.scala 523:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313535.4]
  wire  _T_1418; // @[RocketCore.scala 524:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313537.4]
  wire  _T_1425; // @[RocketCore.scala 530:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313550.6]
  wire  _T_1426; // @[RocketCore.scala 530:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313551.6]
  wire  _T_1428; // @[RocketCore.scala 531:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313554.6]
  wire [2:0] _T_1446; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313581.4]
  wire [3:0] _T_1447; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313582.4]
  wire [3:0] _T_1448; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313583.4]
  wire [3:0] _T_1449; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313584.4]
  wire [3:0] _T_1450; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313585.4]
  wire [63:0] wb_cause; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313586.4]
  wire  _T_1451; // @[RocketCore.scala 874:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313587.4]
  wire  _T_1453; // @[RocketCore.scala 874:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313589.4]
  wire  _T_1455; // @[RocketCore.scala 874:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313591.4]
  wire  _T_1457; // @[RocketCore.scala 874:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313593.4]
  wire  _T_1459; // @[RocketCore.scala 874:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313595.4]
  wire  _T_1461; // @[RocketCore.scala 874:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313597.4]
  wire  _GEN_211; // @[RocketCore.scala 581:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313636.4]
  wire [1:0] _T_1497; // @[RocketCore.scala 613:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313686.4]
  wire [1:0] _T_1498; // @[RocketCore.scala 613:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313687.4]
  wire  _T_1499; // @[RocketCore.scala 613:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313688.4]
  wire [15:0] _T_1500; // @[RocketCore.scala 613:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313689.4]
  wire [15:0] _T_1501; // @[RocketCore.scala 613:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313690.4]
  wire [15:0] _T_1502; // @[RocketCore.scala 613:119:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313691.4]
  wire  _T_1504; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313700.4]
  wire  _T_1505; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313701.4]
  wire  _T_1510; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313706.4]
  wire  _T_1513; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313709.4]
  wire  _T_1514; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313710.4]
  wire  _T_1515; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313711.4]
  wire  _T_1516; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313712.4]
  wire  _T_1517; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313713.4]
  wire  _T_1518; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313714.4]
  wire  _T_1519; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313715.4]
  wire  _T_1520; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313716.4]
  wire  _T_1521; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313717.4]
  wire  _T_1522; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313718.4]
  wire  tval_valid; // @[RocketCore.scala 620:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313719.4]
  wire [63:0] _T_1523; // @[RocketCore.scala 884:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313720.4]
  wire [24:0] a_1; // @[RocketCore.scala 884:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313721.4]
  wire  _T_1524; // @[RocketCore.scala 885:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313722.4]
  wire  _T_1525; // @[RocketCore.scala 885:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313723.4]
  wire  _T_1526; // @[RocketCore.scala 885:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313724.4]
  wire  _T_1527; // @[RocketCore.scala 885:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313725.4]
  wire  _T_1528; // @[RocketCore.scala 885:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313726.4]
  wire  _T_1529; // @[RocketCore.scala 885:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313727.4]
  wire  msb_1; // @[RocketCore.scala 885:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313728.4]
  wire [38:0] _T_1530; // @[RocketCore.scala 886:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313729.4]
  wire [39:0] _T_1531; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313730.4]
  wire [2:0] _T_1534; // @[CSR.scala 128:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313742.4]
  wire [2:0] _T_1535; // @[CSR.scala 128:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313743.4]
  wire [31:0] _T_1547; // @[RocketCore.scala 900:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313757.4]
  wire [31:0] _T_1548; // @[RocketCore.scala 900:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313758.4]
  wire [31:0] _T_1549; // @[RocketCore.scala 892:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313759.4]
  wire [31:0] _T_1550; // @[RocketCore.scala 892:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313760.4]
  wire  _T_1574; // @[RocketCore.scala 650:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313788.4]
  wire [31:0] _T_1575; // @[RocketCore.scala 900:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313789.4]
  wire [31:0] _T_1576; // @[RocketCore.scala 900:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313790.4]
  wire [31:0] _T_1577; // @[RocketCore.scala 891:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313791.4]
  wire  _T_1578; // @[RocketCore.scala 903:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313792.4]
  wire  _T_1658; // @[RocketCore.scala 675:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313887.4]
  wire  _T_1659; // @[RocketCore.scala 675:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313888.4]
  wire  _T_1660; // @[RocketCore.scala 675:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313889.4]
  wire [31:0] _T_1662; // @[RocketCore.scala 900:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313891.4]
  wire [31:0] _T_1663; // @[RocketCore.scala 891:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313892.4]
  wire  _T_1665; // @[RocketCore.scala 676:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313897.4]
  wire [31:0] _T_1666; // @[RocketCore.scala 900:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313898.4]
  wire [31:0] _T_1667; // @[RocketCore.scala 900:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313899.4]
  wire [31:0] _T_1668; // @[RocketCore.scala 892:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313900.4]
  wire [31:0] _T_1669; // @[RocketCore.scala 892:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313901.4]
  wire  _T_1670; // @[RocketCore.scala 903:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313902.4]
  wire [31:0] _T_1671; // @[RocketCore.scala 900:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313906.4]
  wire [31:0] _T_1672; // @[RocketCore.scala 900:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313907.4]
  wire [31:0] _T_1673; // @[RocketCore.scala 892:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313908.4]
  wire [31:0] _T_1674; // @[RocketCore.scala 892:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313909.4]
  wire  _T_1675; // @[RocketCore.scala 903:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313910.4]
  wire  _T_1692; // @[RocketCore.scala 685:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313931.4]
  wire  _T_1694; // @[RocketCore.scala 685:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313933.4]
  wire  _T_1695; // @[RocketCore.scala 685:95:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313934.4]
  wire  _T_1696; // @[RocketCore.scala 685:116:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313935.4]
  wire  _T_1702; // @[RocketCore.scala 689:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313943.4]
  wire  _T_1703; // @[RocketCore.scala 689:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313944.4]
  wire  _T_1738; // @[RocketCore.scala 707:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313984.4]
  wire [39:0] _T_1739; // @[RocketCore.scala 708:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313985.4]
  wire  _T_1741; // @[RocketCore.scala 710:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313988.4]
  wire  _T_1742; // @[RocketCore.scala 710:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313989.4]
  wire  _T_1744; // @[RocketCore.scala 712:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313992.4]
  wire  _T_1745; // @[CustomCSRs.scala 38:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313993.4]
  wire  _T_1752; // @[RocketCore.scala 724:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314009.4]
  wire  _T_1753; // @[RocketCore.scala 724:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314010.4]
  wire  _T_1754; // @[RocketCore.scala 724:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314011.4]
  wire  _T_1755; // @[RocketCore.scala 724:90:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314012.4]
  wire  _T_1757; // @[RocketCore.scala 727:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314016.4]
  wire  _T_1758; // @[RocketCore.scala 727:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314017.4]
  wire  _T_1759; // @[RocketCore.scala 727:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314018.4]
  wire [4:0] _T_1760; // @[RocketCore.scala 728:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314019.4]
  wire [4:0] _T_1761; // @[RocketCore.scala 728:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314020.4]
  wire  _T_1762; // @[RocketCore.scala 728:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314021.4]
  wire  _T_1763; // @[RocketCore.scala 728:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314022.4]
  wire [1:0] _T_1766; // @[RocketCore.scala 728:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314025.4]
  wire [1:0] _T_1768; // @[RocketCore.scala 732:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314029.4]
  wire [39:0] _GEN_251; // @[RocketCore.scala 732:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314030.4]
  wire [39:0] _T_1770; // @[RocketCore.scala 732:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314031.4]
  wire [38:0] _T_1771; // @[RocketCore.scala 733:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314033.4]
  wire [38:0] _T_1772; // @[RocketCore.scala 733:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314034.4]
  wire [5:0] ex_dcache_tag; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314062.4]
  wire [24:0] a_2; // @[RocketCore.scala 884:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314068.4]
  wire  _T_1782; // @[RocketCore.scala 885:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314069.4]
  wire  _T_1783; // @[RocketCore.scala 885:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314070.4]
  wire  _T_1784; // @[RocketCore.scala 885:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314071.4]
  wire  _T_1785; // @[RocketCore.scala 885:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314072.4]
  wire  _T_1786; // @[RocketCore.scala 885:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314073.4]
  wire  _T_1787; // @[RocketCore.scala 885:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314074.4]
  wire  msb_2; // @[RocketCore.scala 885:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314075.4]
  wire [38:0] _T_1788; // @[RocketCore.scala 886:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314076.4]
  wire  _T_1791; // @[RocketCore.scala 763:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314081.4]
  wire  _T_1795; // @[RocketCore.scala 768:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314088.4]
  wire  _T_1797; // @[RocketCore.scala 769:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314091.4]
  wire [4:0] _T_1809; // @[RocketCore.scala 771:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314110.4]
  wire [4:0] _T_1810; // @[RocketCore.scala 771:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314112.4]
  wire [31:0] coreMonitorBundle_time; // @[RocketCore.scala 811:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314126.4]
  wire  _T_1817; // @[RocketCore.scala 812:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314128.4]
  wire  coreMonitorBundle_valid; // @[RocketCore.scala 812:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314129.4]
  wire [39:0] coreMonitorBundle_pc; // @[RocketCore.scala 813:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314131.4]
  wire  _T_1821; // @[RocketCore.scala 814:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314134.4]
  wire  _T_1822; // @[RocketCore.scala 814:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314135.4]
  wire [4:0] coreMonitorBundle_wrdst; // @[RocketCore.scala 814:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314136.4]
  reg [63:0] _T_1826; // @[RocketCore.scala 818:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314142.4]
  reg [63:0] _RAND_99;
  reg [63:0] coreMonitorBundle_rd0val; // @[RocketCore.scala 818:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314144.4]
  reg [63:0] _RAND_100;
  reg [63:0] _T_1831; // @[RocketCore.scala 820:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314149.4]
  reg [63:0] _RAND_101;
  reg [63:0] coreMonitorBundle_rd1val; // @[RocketCore.scala 820:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314151.4]
  reg [63:0] _RAND_102;
  wire  _T_1835; // @[RocketCore.scala 852:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314156.4]
  wire [31:0] coreMonitorBundle_inst; // @[RocketCore.scala 808:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314123.4 RocketCore.scala 821:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314154.4]
  IBuf ibuf ( // @[RocketCore.scala 222:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312184.4]
    .clock(ibuf_clock),
    .reset(ibuf_reset),
    .io_imem_ready(ibuf_io_imem_ready),
    .io_imem_valid(ibuf_io_imem_valid),
    .io_imem_bits_btb_taken(ibuf_io_imem_bits_btb_taken),
    .io_imem_bits_btb_bridx(ibuf_io_imem_bits_btb_bridx),
    .io_imem_bits_btb_entry(ibuf_io_imem_bits_btb_entry),
    .io_imem_bits_btb_bht_history(ibuf_io_imem_bits_btb_bht_history),
    .io_imem_bits_pc(ibuf_io_imem_bits_pc),
    .io_imem_bits_data(ibuf_io_imem_bits_data),
    .io_imem_bits_xcpt_pf_inst(ibuf_io_imem_bits_xcpt_pf_inst),
    .io_imem_bits_xcpt_ae_inst(ibuf_io_imem_bits_xcpt_ae_inst),
    .io_imem_bits_replay(ibuf_io_imem_bits_replay),
    .io_kill(ibuf_io_kill),
    .io_pc(ibuf_io_pc),
    .io_btb_resp_entry(ibuf_io_btb_resp_entry),
    .io_btb_resp_bht_history(ibuf_io_btb_resp_bht_history),
    .io_inst_0_ready(ibuf_io_inst_0_ready),
    .io_inst_0_valid(ibuf_io_inst_0_valid),
    .io_inst_0_bits_xcpt0_pf_inst(ibuf_io_inst_0_bits_xcpt0_pf_inst),
    .io_inst_0_bits_xcpt0_ae_inst(ibuf_io_inst_0_bits_xcpt0_ae_inst),
    .io_inst_0_bits_xcpt1_pf_inst(ibuf_io_inst_0_bits_xcpt1_pf_inst),
    .io_inst_0_bits_xcpt1_ae_inst(ibuf_io_inst_0_bits_xcpt1_ae_inst),
    .io_inst_0_bits_replay(ibuf_io_inst_0_bits_replay),
    .io_inst_0_bits_rvc(ibuf_io_inst_0_bits_rvc),
    .io_inst_0_bits_inst_bits(ibuf_io_inst_0_bits_inst_bits),
    .io_inst_0_bits_inst_rd(ibuf_io_inst_0_bits_inst_rd),
    .io_inst_0_bits_inst_rs1(ibuf_io_inst_0_bits_inst_rs1),
    .io_inst_0_bits_inst_rs2(ibuf_io_inst_0_bits_inst_rs2),
    .io_inst_0_bits_inst_rs3(ibuf_io_inst_0_bits_inst_rs3),
    .io_inst_0_bits_raw(ibuf_io_inst_0_bits_raw)
  );
  CSRFile csr ( // @[RocketCore.scala 244:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312797.4]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_ungated_clock(csr_io_ungated_clock),
    .io_interrupts_debug(csr_io_interrupts_debug),
    .io_interrupts_mtip(csr_io_interrupts_mtip),
    .io_interrupts_msip(csr_io_interrupts_msip),
    .io_interrupts_meip(csr_io_interrupts_meip),
    .io_interrupts_seip(csr_io_interrupts_seip),
    .io_hartid(csr_io_hartid),
    .io_rw_addr(csr_io_rw_addr),
    .io_rw_cmd(csr_io_rw_cmd),
    .io_rw_rdata(csr_io_rw_rdata),
    .io_rw_wdata(csr_io_rw_wdata),
    .io_decode_0_csr(csr_io_decode_0_csr),
    .io_decode_0_fp_illegal(csr_io_decode_0_fp_illegal),
    .io_decode_0_fp_csr(csr_io_decode_0_fp_csr),
    .io_decode_0_rocc_illegal(csr_io_decode_0_rocc_illegal),
    .io_decode_0_read_illegal(csr_io_decode_0_read_illegal),
    .io_decode_0_write_illegal(csr_io_decode_0_write_illegal),
    .io_decode_0_write_flush(csr_io_decode_0_write_flush),
    .io_decode_0_system_illegal(csr_io_decode_0_system_illegal),
    .io_csr_stall(csr_io_csr_stall),
    .io_eret(csr_io_eret),
    .io_singleStep(csr_io_singleStep),
    .io_status_debug(csr_io_status_debug),
    .io_status_isa(csr_io_status_isa),
    .io_status_dprv(csr_io_status_dprv),
    .io_status_prv(csr_io_status_prv),
    .io_status_sd(csr_io_status_sd),
    .io_status_zero2(csr_io_status_zero2),
    .io_status_sxl(csr_io_status_sxl),
    .io_status_uxl(csr_io_status_uxl),
    .io_status_sd_rv32(csr_io_status_sd_rv32),
    .io_status_zero1(csr_io_status_zero1),
    .io_status_tsr(csr_io_status_tsr),
    .io_status_tw(csr_io_status_tw),
    .io_status_tvm(csr_io_status_tvm),
    .io_status_mxr(csr_io_status_mxr),
    .io_status_sum(csr_io_status_sum),
    .io_status_mprv(csr_io_status_mprv),
    .io_status_xs(csr_io_status_xs),
    .io_status_fs(csr_io_status_fs),
    .io_status_mpp(csr_io_status_mpp),
    .io_status_hpp(csr_io_status_hpp),
    .io_status_spp(csr_io_status_spp),
    .io_status_mpie(csr_io_status_mpie),
    .io_status_hpie(csr_io_status_hpie),
    .io_status_spie(csr_io_status_spie),
    .io_status_upie(csr_io_status_upie),
    .io_status_mie(csr_io_status_mie),
    .io_status_hie(csr_io_status_hie),
    .io_status_sie(csr_io_status_sie),
    .io_status_uie(csr_io_status_uie),
    .io_ptbr_mode(csr_io_ptbr_mode),
    .io_ptbr_ppn(csr_io_ptbr_ppn),
    .io_evec(csr_io_evec),
    .io_exception(csr_io_exception),
    .io_retire(csr_io_retire),
    .io_cause(csr_io_cause),
    .io_pc(csr_io_pc),
    .io_tval(csr_io_tval),
    .io_time(csr_io_time),
    .io_fcsr_rm(csr_io_fcsr_rm),
    .io_fcsr_flags_valid(csr_io_fcsr_flags_valid),
    .io_fcsr_flags_bits(csr_io_fcsr_flags_bits),
    .io_rocc_interrupt(csr_io_rocc_interrupt),
    .io_interrupt(csr_io_interrupt),
    .io_interrupt_cause(csr_io_interrupt_cause),
    .io_bp_0_control_action(csr_io_bp_0_control_action),
    .io_bp_0_control_tmatch(csr_io_bp_0_control_tmatch),
    .io_bp_0_control_m(csr_io_bp_0_control_m),
    .io_bp_0_control_s(csr_io_bp_0_control_s),
    .io_bp_0_control_u(csr_io_bp_0_control_u),
    .io_bp_0_control_x(csr_io_bp_0_control_x),
    .io_bp_0_control_w(csr_io_bp_0_control_w),
    .io_bp_0_control_r(csr_io_bp_0_control_r),
    .io_bp_0_address(csr_io_bp_0_address),
    .io_pmp_0_cfg_l(csr_io_pmp_0_cfg_l),
    .io_pmp_0_cfg_a(csr_io_pmp_0_cfg_a),
    .io_pmp_0_cfg_x(csr_io_pmp_0_cfg_x),
    .io_pmp_0_cfg_w(csr_io_pmp_0_cfg_w),
    .io_pmp_0_cfg_r(csr_io_pmp_0_cfg_r),
    .io_pmp_0_addr(csr_io_pmp_0_addr),
    .io_pmp_0_mask(csr_io_pmp_0_mask),
    .io_pmp_1_cfg_l(csr_io_pmp_1_cfg_l),
    .io_pmp_1_cfg_a(csr_io_pmp_1_cfg_a),
    .io_pmp_1_cfg_x(csr_io_pmp_1_cfg_x),
    .io_pmp_1_cfg_w(csr_io_pmp_1_cfg_w),
    .io_pmp_1_cfg_r(csr_io_pmp_1_cfg_r),
    .io_pmp_1_addr(csr_io_pmp_1_addr),
    .io_pmp_1_mask(csr_io_pmp_1_mask),
    .io_pmp_2_cfg_l(csr_io_pmp_2_cfg_l),
    .io_pmp_2_cfg_a(csr_io_pmp_2_cfg_a),
    .io_pmp_2_cfg_x(csr_io_pmp_2_cfg_x),
    .io_pmp_2_cfg_w(csr_io_pmp_2_cfg_w),
    .io_pmp_2_cfg_r(csr_io_pmp_2_cfg_r),
    .io_pmp_2_addr(csr_io_pmp_2_addr),
    .io_pmp_2_mask(csr_io_pmp_2_mask),
    .io_pmp_3_cfg_l(csr_io_pmp_3_cfg_l),
    .io_pmp_3_cfg_a(csr_io_pmp_3_cfg_a),
    .io_pmp_3_cfg_x(csr_io_pmp_3_cfg_x),
    .io_pmp_3_cfg_w(csr_io_pmp_3_cfg_w),
    .io_pmp_3_cfg_r(csr_io_pmp_3_cfg_r),
    .io_pmp_3_addr(csr_io_pmp_3_addr),
    .io_pmp_3_mask(csr_io_pmp_3_mask),
    .io_pmp_4_cfg_l(csr_io_pmp_4_cfg_l),
    .io_pmp_4_cfg_a(csr_io_pmp_4_cfg_a),
    .io_pmp_4_cfg_x(csr_io_pmp_4_cfg_x),
    .io_pmp_4_cfg_w(csr_io_pmp_4_cfg_w),
    .io_pmp_4_cfg_r(csr_io_pmp_4_cfg_r),
    .io_pmp_4_addr(csr_io_pmp_4_addr),
    .io_pmp_4_mask(csr_io_pmp_4_mask),
    .io_pmp_5_cfg_l(csr_io_pmp_5_cfg_l),
    .io_pmp_5_cfg_a(csr_io_pmp_5_cfg_a),
    .io_pmp_5_cfg_x(csr_io_pmp_5_cfg_x),
    .io_pmp_5_cfg_w(csr_io_pmp_5_cfg_w),
    .io_pmp_5_cfg_r(csr_io_pmp_5_cfg_r),
    .io_pmp_5_addr(csr_io_pmp_5_addr),
    .io_pmp_5_mask(csr_io_pmp_5_mask),
    .io_pmp_6_cfg_l(csr_io_pmp_6_cfg_l),
    .io_pmp_6_cfg_a(csr_io_pmp_6_cfg_a),
    .io_pmp_6_cfg_x(csr_io_pmp_6_cfg_x),
    .io_pmp_6_cfg_w(csr_io_pmp_6_cfg_w),
    .io_pmp_6_cfg_r(csr_io_pmp_6_cfg_r),
    .io_pmp_6_addr(csr_io_pmp_6_addr),
    .io_pmp_6_mask(csr_io_pmp_6_mask),
    .io_pmp_7_cfg_l(csr_io_pmp_7_cfg_l),
    .io_pmp_7_cfg_a(csr_io_pmp_7_cfg_a),
    .io_pmp_7_cfg_x(csr_io_pmp_7_cfg_x),
    .io_pmp_7_cfg_w(csr_io_pmp_7_cfg_w),
    .io_pmp_7_cfg_r(csr_io_pmp_7_cfg_r),
    .io_pmp_7_addr(csr_io_pmp_7_addr),
    .io_pmp_7_mask(csr_io_pmp_7_mask),
    .io_inst_0(csr_io_inst_0),
    .io_trace_0_valid(csr_io_trace_0_valid),
    .io_trace_0_iaddr(csr_io_trace_0_iaddr),
    .io_trace_0_insn(csr_io_trace_0_insn),
    .io_trace_0_exception(csr_io_trace_0_exception)
  );
  BreakpointUnit bpu ( // @[RocketCore.scala 280:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312883.4]
    .io_status_debug(bpu_io_status_debug),
    .io_status_prv(bpu_io_status_prv),
    .io_bp_0_control_action(bpu_io_bp_0_control_action),
    .io_bp_0_control_tmatch(bpu_io_bp_0_control_tmatch),
    .io_bp_0_control_m(bpu_io_bp_0_control_m),
    .io_bp_0_control_s(bpu_io_bp_0_control_s),
    .io_bp_0_control_u(bpu_io_bp_0_control_u),
    .io_bp_0_control_x(bpu_io_bp_0_control_x),
    .io_bp_0_control_w(bpu_io_bp_0_control_w),
    .io_bp_0_control_r(bpu_io_bp_0_control_r),
    .io_bp_0_address(bpu_io_bp_0_address),
    .io_pc(bpu_io_pc),
    .io_ea(bpu_io_ea),
    .io_xcpt_if(bpu_io_xcpt_if),
    .io_xcpt_ld(bpu_io_xcpt_ld),
    .io_xcpt_st(bpu_io_xcpt_st),
    .io_debug_if(bpu_io_debug_if),
    .io_debug_ld(bpu_io_debug_ld),
    .io_debug_st(bpu_io_debug_st)
  );
  ALU alu ( // @[RocketCore.scala 339:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313035.4]
    .io_dw(alu_io_dw),
    .io_fn(alu_io_fn),
    .io_in2(alu_io_in2),
    .io_in1(alu_io_in1),
    .io_out(alu_io_out),
    .io_adder_out(alu_io_adder_out),
    .io_cmp_out(alu_io_cmp_out)
  );
  MulDiv div ( // @[RocketCore.scala 354:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313045.4]
    .clock(div_clock),
    .reset(div_reset),
    .io_req_ready(div_io_req_ready),
    .io_req_valid(div_io_req_valid),
    .io_req_bits_fn(div_io_req_bits_fn),
    .io_req_bits_dw(div_io_req_bits_dw),
    .io_req_bits_in1(div_io_req_bits_in1),
    .io_req_bits_in2(div_io_req_bits_in2),
    .io_req_bits_tag(div_io_req_bits_tag),
    .io_kill(div_io_kill),
    .io_resp_ready(div_io_resp_ready),
    .io_resp_valid(div_io_resp_valid),
    .io_resp_bits_data(div_io_resp_bits_data),
    .io_resp_bits_tag(div_io_resp_bits_tag)
  );
  PlusArgTimeout PlusArgTimeout ( // @[PlusArg.scala 51:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314160.4]
    .clock(PlusArgTimeout_clock),
    .reset(PlusArgTimeout_reset),
    .io_count(PlusArgTimeout_io_count)
  );
  assign _T_752__T_759_addr = ~ _T_757;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign _T_752__T_759_data = _T_752[_T_752__T_759_addr]; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  `else
  assign _T_752__T_759_data = _T_752__T_759_addr >= 5'h1f ? _RAND_1[63:0] : _T_752[_T_752__T_759_addr]; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign _T_752__T_767_addr = ~ _T_765;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign _T_752__T_767_data = _T_752[_T_752__T_767_addr]; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  `else
  assign _T_752__T_767_data = _T_752__T_767_addr >= 5'h1f ? _RAND_2[63:0] : _T_752[_T_752__T_767_addr]; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign _T_752__T_1493_data = _T_1484 ? io_dmem_resp_bits_data : _T_1489;
  assign _T_752__T_1493_addr = ~ rf_waddr;
  assign _T_752__T_1493_mask = 1'h1;
  assign _T_752__T_1493_en = rf_wen ? _T_1490 : 1'h0;
  assign replay_wb_common = io_dmem_s2_nack | wb_reg_replay; // @[RocketCore.scala 563:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313604.4]
  assign _T_1465 = wb_reg_valid & wb_ctrl_rocc; // @[RocketCore.scala 564:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313605.4]
  assign _T_1466 = io_rocc_cmd_ready == 1'h0; // @[RocketCore.scala 564:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313606.4]
  assign replay_wb_rocc = _T_1465 & _T_1466; // @[RocketCore.scala 564:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313607.4]
  assign replay_wb = replay_wb_common | replay_wb_rocc; // @[RocketCore.scala 565:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313608.4]
  assign _T_1429 = wb_reg_valid & wb_ctrl_mem; // @[RocketCore.scala 542:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313563.4]
  assign _T_1430 = _T_1429 & io_dmem_s2_xcpt_ma_st; // @[RocketCore.scala 542:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313564.4]
  assign _T_1441 = wb_reg_xcpt | _T_1430; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313575.4]
  assign _T_1432 = _T_1429 & io_dmem_s2_xcpt_ma_ld; // @[RocketCore.scala 543:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313566.4]
  assign _T_1442 = _T_1441 | _T_1432; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313576.4]
  assign _T_1434 = _T_1429 & io_dmem_s2_xcpt_pf_st; // @[RocketCore.scala 544:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313568.4]
  assign _T_1443 = _T_1442 | _T_1434; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313577.4]
  assign _T_1436 = _T_1429 & io_dmem_s2_xcpt_pf_ld; // @[RocketCore.scala 545:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313570.4]
  assign _T_1444 = _T_1443 | _T_1436; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313578.4]
  assign _T_1438 = _T_1429 & io_dmem_s2_xcpt_ae_st; // @[RocketCore.scala 546:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313572.4]
  assign _T_1445 = _T_1444 | _T_1438; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313579.4]
  assign _T_1440 = _T_1429 & io_dmem_s2_xcpt_ae_ld; // @[RocketCore.scala 547:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313574.4]
  assign wb_xcpt = _T_1445 | _T_1440; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313580.4]
  assign _T_1467 = replay_wb | wb_xcpt; // @[RocketCore.scala 566:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313609.4]
  assign _T_1468 = _T_1467 | csr_io_eret; // @[RocketCore.scala 566:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313610.4]
  assign take_pc_wb = _T_1468 | wb_reg_flush_pipe; // @[RocketCore.scala 566:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313611.4]
  assign _T_1101 = ex_reg_valid | ex_reg_replay; // @[RocketCore.scala 425:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313158.4]
  assign ex_pc_valid = _T_1101 | ex_reg_xcpt_interrupt; // @[RocketCore.scala 425:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313159.4]
  assign _T_1274 = mem_ctrl_jalr | mem_reg_sfence; // @[RocketCore.scala 448:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313338.4]
  assign _T_1275 = $signed(mem_reg_wdata); // @[RocketCore.scala 884:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313339.4]
  assign a = _T_1275[63:39]; // @[RocketCore.scala 884:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313340.4]
  assign _T_1276 = $signed(a) == $signed(25'sh0); // @[RocketCore.scala 885:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313341.4]
  assign _T_1277 = $signed(a) == $signed(-25'sh1); // @[RocketCore.scala 885:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313342.4]
  assign _T_1278 = _T_1276 | _T_1277; // @[RocketCore.scala 885:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313343.4]
  assign _T_1279 = mem_reg_wdata[39]; // @[RocketCore.scala 885:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313344.4]
  assign _T_1280 = mem_reg_wdata[38]; // @[RocketCore.scala 885:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313345.4]
  assign _T_1281 = _T_1280 == 1'h0; // @[RocketCore.scala 885:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313346.4]
  assign msb = _T_1278 ? _T_1279 : _T_1281; // @[RocketCore.scala 885:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313347.4]
  assign _T_1282 = mem_reg_wdata[38:0]; // @[RocketCore.scala 886:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313348.4]
  assign _T_1283 = {msb,_T_1282}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313349.4]
  assign _T_1284 = $signed(_T_1283); // @[RocketCore.scala 448:106:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313350.4]
  assign _T_1143 = $signed(mem_reg_pc); // @[RocketCore.scala 444:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313206.4]
  assign _T_1144 = mem_ctrl_branch & mem_br_taken; // @[RocketCore.scala 445:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313207.4]
  assign _T_1146 = mem_reg_inst[31]; // @[RocketCore.scala 932:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313209.4]
  assign _T_1147 = $signed(_T_1146); // @[RocketCore.scala 932:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313210.4]
  assign _T_1202 = $unsigned(_T_1147); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313265.4]
  assign _T_1152 = {11{_T_1147}}; // @[RocketCore.scala 933:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313215.4]
  assign _T_1201 = $unsigned(_T_1152); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313264.4]
  assign _T_1203 = {_T_1202,_T_1201}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313266.4]
  assign _T_1156 = mem_reg_inst[19:12]; // @[RocketCore.scala 934:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313219.4]
  assign _T_1157 = $signed(_T_1156); // @[RocketCore.scala 934:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313220.4]
  assign _T_1158 = {8{_T_1147}}; // @[RocketCore.scala 934:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313221.4]
  assign _T_1199 = $unsigned(_T_1158); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313262.4]
  assign _T_1163 = mem_reg_inst[20]; // @[RocketCore.scala 936:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313226.4]
  assign _T_1164 = $signed(_T_1163); // @[RocketCore.scala 936:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313227.4]
  assign _T_1166 = mem_reg_inst[7]; // @[RocketCore.scala 937:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313229.4]
  assign _T_1167 = $signed(_T_1166); // @[RocketCore.scala 937:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313230.4]
  assign _T_1198 = $unsigned(_T_1167); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313261.4]
  assign _T_1200 = {_T_1199,_T_1198}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313263.4]
  assign _T_1204 = {_T_1203,_T_1200}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313267.4]
  assign _T_1174 = mem_reg_inst[30:25]; // @[RocketCore.scala 938:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313237.4]
  assign _T_1180 = mem_reg_inst[11:8]; // @[RocketCore.scala 940:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313243.4]
  assign _T_1183 = mem_reg_inst[24:21]; // @[RocketCore.scala 941:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313246.4]
  assign _T_1196 = {_T_1174,_T_1180}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313259.4]
  assign _T_1197 = {_T_1196,1'h0}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313260.4]
  assign _T_1205 = {_T_1204,_T_1197}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313268.4]
  assign _T_1206 = $signed(_T_1205); // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313269.4]
  assign _T_1261 = $unsigned(_T_1157); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313324.4]
  assign _T_1260 = $unsigned(_T_1164); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313323.4]
  assign _T_1262 = {_T_1261,_T_1260}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313325.4]
  assign _T_1266 = {_T_1203,_T_1262}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313329.4]
  assign _T_1258 = {_T_1174,_T_1183}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313321.4]
  assign _T_1259 = {_T_1258,1'h0}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313322.4]
  assign _T_1267 = {_T_1266,_T_1259}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313330.4]
  assign _T_1268 = $signed(_T_1267); // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313331.4]
  assign _T_1269 = mem_reg_rvc ? $signed(4'sh2) : $signed(4'sh4); // @[RocketCore.scala 447:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313332.4]
  assign _T_1270 = mem_ctrl_jal ? $signed(_T_1268) : $signed({{28{_T_1269[3]}},_T_1269}); // @[RocketCore.scala 446:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313333.4]
  assign _T_1271 = _T_1144 ? $signed(_T_1206) : $signed(_T_1270); // @[RocketCore.scala 445:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313334.4]
  assign _GEN_248 = {{8{_T_1271[31]}},_T_1271}; // @[RocketCore.scala 444:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313335.4]
  assign _T_1273 = $signed(_T_1143) + $signed(_GEN_248); // @[RocketCore.scala 444:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313336.4]
  assign mem_br_target = $signed(_T_1273); // @[RocketCore.scala 444:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313337.4]
  assign _T_1285 = _T_1274 ? $signed(_T_1284) : $signed(mem_br_target); // @[RocketCore.scala 448:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313351.4]
  assign _T_1286 = $signed(_T_1285) & $signed(-40'sh2); // @[RocketCore.scala 448:129:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313352.4]
  assign _T_1287 = $signed(_T_1286); // @[RocketCore.scala 448:129:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313353.4]
  assign mem_npc = $unsigned(_T_1287); // @[RocketCore.scala 448:141:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313354.4]
  assign _T_1288 = mem_npc != ex_reg_pc; // @[RocketCore.scala 450:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313355.4]
  assign _T_1289 = ibuf_io_inst_0_valid | ibuf_io_imem_valid; // @[RocketCore.scala 451:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313356.4]
  assign _T_1290 = mem_npc != ibuf_io_pc; // @[RocketCore.scala 451:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313357.4]
  assign _T_1291 = _T_1289 ? _T_1290 : 1'h1; // @[RocketCore.scala 451:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313358.4]
  assign mem_wrong_npc = ex_pc_valid ? _T_1288 : _T_1291; // @[RocketCore.scala 450:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313359.4]
  assign _T_1307 = mem_wrong_npc | mem_reg_sfence; // @[RocketCore.scala 458:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313380.4]
  assign take_pc_mem = mem_reg_valid & _T_1307; // @[RocketCore.scala 458:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313381.4]
  assign take_pc_mem_wb = take_pc_wb | take_pc_mem; // @[RocketCore.scala 218:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312183.4]
  assign _T_263 = ibuf_io_inst_0_bits_inst_bits & 32'h207f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312192.4]
  assign _T_264 = _T_263 == 32'h3; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312193.4]
  assign _T_265 = ibuf_io_inst_0_bits_inst_bits & 32'h106f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312194.4]
  assign _T_266 = _T_265 == 32'h3; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312195.4]
  assign _T_267 = ibuf_io_inst_0_bits_inst_bits & 32'h105f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312196.4]
  assign _T_268 = _T_267 == 32'hb; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312197.4]
  assign _T_269 = ibuf_io_inst_0_bits_inst_bits & 32'h607f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312198.4]
  assign _T_270 = _T_269 == 32'hf; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312199.4]
  assign _T_271 = ibuf_io_inst_0_bits_inst_bits & 32'h5f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312200.4]
  assign _T_272 = _T_271 == 32'h17; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312201.4]
  assign _T_273 = ibuf_io_inst_0_bits_inst_bits & 32'hfc00007f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312202.4]
  assign _T_274 = _T_273 == 32'h33; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312203.4]
  assign _T_275 = ibuf_io_inst_0_bits_inst_bits & 32'hbe007077; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312204.4]
  assign _T_276 = _T_275 == 32'h33; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312205.4]
  assign _T_277 = ibuf_io_inst_0_bits_inst_bits & 32'h4000073; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312206.4]
  assign _T_278 = _T_277 == 32'h43; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312207.4]
  assign _T_279 = ibuf_io_inst_0_bits_inst_bits & 32'he400007f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312208.4]
  assign _T_280 = _T_279 == 32'h53; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312209.4]
  assign _T_282 = _T_267 == 32'h5b; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312211.4]
  assign _T_283 = ibuf_io_inst_0_bits_inst_bits & 32'h707b; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312212.4]
  assign _T_284 = _T_283 == 32'h63; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312213.4]
  assign _T_285 = ibuf_io_inst_0_bits_inst_bits & 32'h7f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312214.4]
  assign _T_286 = _T_285 == 32'h6f; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312215.4]
  assign _T_287 = ibuf_io_inst_0_bits_inst_bits & 32'hffefffff; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312216.4]
  assign _T_288 = _T_287 == 32'h73; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312217.4]
  assign _T_289 = ibuf_io_inst_0_bits_inst_bits & 32'hfc00305f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312218.4]
  assign _T_290 = _T_289 == 32'h1013; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312219.4]
  assign _T_291 = ibuf_io_inst_0_bits_inst_bits & 32'hfe00305f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312220.4]
  assign _T_292 = _T_291 == 32'h101b; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312221.4]
  assign _T_293 = ibuf_io_inst_0_bits_inst_bits & 32'h605b; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312222.4]
  assign _T_294 = _T_293 == 32'h2003; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312223.4]
  assign _T_295 = ibuf_io_inst_0_bits_inst_bits & 32'h205f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312224.4]
  assign _T_296 = _T_295 == 32'h200b; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312225.4]
  assign _T_298 = _T_263 == 32'h2013; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312227.4]
  assign _T_299 = ibuf_io_inst_0_bits_inst_bits & 32'h1800607f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312228.4]
  assign _T_300 = _T_299 == 32'h202f; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312229.4]
  assign _T_302 = _T_295 == 32'h205b; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312231.4]
  assign _T_303 = ibuf_io_inst_0_bits_inst_bits & 32'h2077; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312232.4]
  assign _T_304 = _T_303 == 32'h2073; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312233.4]
  assign _T_305 = ibuf_io_inst_0_bits_inst_bits & 32'hbc00707f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312234.4]
  assign _T_306 = _T_305 == 32'h5013; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312235.4]
  assign _T_307 = ibuf_io_inst_0_bits_inst_bits & 32'hbe00705f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312236.4]
  assign _T_308 = _T_307 == 32'h501b; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312237.4]
  assign _T_310 = _T_275 == 32'h5033; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312239.4]
  assign _T_311 = ibuf_io_inst_0_bits_inst_bits & 32'hfe004077; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312240.4]
  assign _T_312 = _T_311 == 32'h2004033; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312241.4]
  assign _T_313 = ibuf_io_inst_0_bits_inst_bits & 32'he800607f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312242.4]
  assign _T_314 = _T_313 == 32'h800202f; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312243.4]
  assign _T_315 = ibuf_io_inst_0_bits_inst_bits & 32'hf9f0607f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312244.4]
  assign _T_316 = _T_315 == 32'h1000202f; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312245.4]
  assign _T_317 = ibuf_io_inst_0_bits_inst_bits & 32'hdfffffff; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312246.4]
  assign _T_318 = _T_317 == 32'h10200073; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312247.4]
  assign _T_319 = ibuf_io_inst_0_bits_inst_bits == 32'h10500073; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312248.4]
  assign _T_320 = ibuf_io_inst_0_bits_inst_bits & 32'hfe007fff; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312249.4]
  assign _T_321 = _T_320 == 32'h12000073; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312250.4]
  assign _T_322 = ibuf_io_inst_0_bits_inst_bits & 32'hf400607f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312251.4]
  assign _T_323 = _T_322 == 32'h20000053; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312252.4]
  assign _T_324 = ibuf_io_inst_0_bits_inst_bits & 32'h7c00607f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312253.4]
  assign _T_325 = _T_324 == 32'h20000053; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312254.4]
  assign _T_326 = ibuf_io_inst_0_bits_inst_bits & 32'h7c00507f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312255.4]
  assign _T_327 = _T_326 == 32'h20000053; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312256.4]
  assign _T_328 = ibuf_io_inst_0_bits_inst_bits & 32'h7ff0007f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312257.4]
  assign _T_329 = _T_328 == 32'h40100053; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312258.4]
  assign _T_331 = _T_328 == 32'h42000053; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312260.4]
  assign _T_332 = ibuf_io_inst_0_bits_inst_bits & 32'hfdf0007f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312261.4]
  assign _T_333 = _T_332 == 32'h58000053; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312262.4]
  assign _T_334 = ibuf_io_inst_0_bits_inst_bits == 32'h7b200073; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312263.4]
  assign _T_335 = ibuf_io_inst_0_bits_inst_bits & 32'hedc0007f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312264.4]
  assign _T_336 = _T_335 == 32'hc0000053; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312265.4]
  assign _T_337 = ibuf_io_inst_0_bits_inst_bits & 32'hfdf0607f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312266.4]
  assign _T_338 = _T_337 == 32'he0000053; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312267.4]
  assign _T_339 = ibuf_io_inst_0_bits_inst_bits & 32'hedf0707f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312268.4]
  assign _T_340 = _T_339 == 32'he0000053; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312269.4]
  assign _T_341 = ibuf_io_inst_0_bits_inst_bits & 32'h306f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312270.4]
  assign _T_342 = _T_341 == 32'h1063; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312271.4]
  assign _T_343 = ibuf_io_inst_0_bits_inst_bits & 32'h407f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312272.4]
  assign _T_344 = _T_343 == 32'h4063; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312273.4]
  assign _T_345 = ibuf_io_inst_0_bits_inst_bits & 32'hfc007077; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312274.4]
  assign _T_346 = _T_345 == 32'h33; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312275.4]
  assign _T_347 = ibuf_io_inst_0_bits_inst_bits & 32'h7067; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312276.4]
  assign _T_348 = _T_347 == 32'h3; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312277.4]
  assign _T_349 = ibuf_io_inst_0_bits_inst_bits & 32'h405f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312278.4]
  assign _T_350 = _T_349 == 32'h3; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312279.4]
  assign _T_352 = _T_264 | _T_266; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312281.4]
  assign _T_353 = _T_352 | _T_268; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312282.4]
  assign _T_354 = _T_353 | _T_270; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312283.4]
  assign _T_355 = _T_354 | _T_272; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312284.4]
  assign _T_356 = _T_355 | _T_274; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312285.4]
  assign _T_357 = _T_356 | _T_276; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312286.4]
  assign _T_358 = _T_357 | _T_278; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312287.4]
  assign _T_359 = _T_358 | _T_280; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312288.4]
  assign _T_360 = _T_359 | _T_282; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312289.4]
  assign _T_361 = _T_360 | _T_284; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312290.4]
  assign _T_362 = _T_361 | _T_286; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312291.4]
  assign _T_363 = _T_362 | _T_288; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312292.4]
  assign _T_364 = _T_363 | _T_290; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312293.4]
  assign _T_365 = _T_364 | _T_292; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312294.4]
  assign _T_366 = _T_365 | _T_294; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312295.4]
  assign _T_367 = _T_366 | _T_296; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312296.4]
  assign _T_368 = _T_367 | _T_298; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312297.4]
  assign _T_369 = _T_368 | _T_300; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312298.4]
  assign _T_370 = _T_369 | _T_302; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312299.4]
  assign _T_371 = _T_370 | _T_304; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312300.4]
  assign _T_372 = _T_371 | _T_306; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312301.4]
  assign _T_373 = _T_372 | _T_308; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312302.4]
  assign _T_374 = _T_373 | _T_310; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312303.4]
  assign _T_375 = _T_374 | _T_312; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312304.4]
  assign _T_376 = _T_375 | _T_314; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312305.4]
  assign _T_377 = _T_376 | _T_316; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312306.4]
  assign _T_378 = _T_377 | _T_318; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312307.4]
  assign _T_379 = _T_378 | _T_319; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312308.4]
  assign _T_380 = _T_379 | _T_321; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312309.4]
  assign _T_381 = _T_380 | _T_323; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312310.4]
  assign _T_382 = _T_381 | _T_325; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312311.4]
  assign _T_383 = _T_382 | _T_327; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312312.4]
  assign _T_384 = _T_383 | _T_329; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312313.4]
  assign _T_385 = _T_384 | _T_331; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312314.4]
  assign _T_386 = _T_385 | _T_333; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312315.4]
  assign _T_387 = _T_386 | _T_334; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312316.4]
  assign _T_388 = _T_387 | _T_336; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312317.4]
  assign _T_389 = _T_388 | _T_338; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312318.4]
  assign _T_390 = _T_389 | _T_340; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312319.4]
  assign _T_391 = _T_390 | _T_342; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312320.4]
  assign _T_392 = _T_391 | _T_344; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312321.4]
  assign _T_393 = _T_392 | _T_346; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312322.4]
  assign _T_394 = _T_393 | _T_348; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312323.4]
  assign id_ctrl_legal = _T_394 | _T_350; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312324.4]
  assign _T_396 = ibuf_io_inst_0_bits_inst_bits & 32'h5c; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312325.4]
  assign _T_397 = _T_396 == 32'h4; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312326.4]
  assign _T_398 = ibuf_io_inst_0_bits_inst_bits & 32'h70; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312327.4]
  assign id_ctrl_rfs3 = _T_398 == 32'h40; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312328.4]
  assign _T_400 = ibuf_io_inst_0_bits_inst_bits & 32'h68; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312329.4]
  assign _T_401 = _T_400 == 32'h40; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312330.4]
  assign _T_403 = _T_397 | id_ctrl_rfs3; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312332.4]
  assign id_ctrl_fp = _T_403 | _T_401; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312333.4]
  assign _T_406 = _T_396 == 32'h8; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312335.4]
  assign _T_407 = ibuf_io_inst_0_bits_inst_bits & 32'h58; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312336.4]
  assign _T_408 = _T_407 == 32'h58; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312337.4]
  assign id_ctrl_rocc = _T_406 | _T_408; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312339.4]
  assign _T_411 = ibuf_io_inst_0_bits_inst_bits & 32'h74; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312340.4]
  assign id_ctrl_branch = _T_411 == 32'h60; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312341.4]
  assign _T_414 = ibuf_io_inst_0_bits_inst_bits & 32'h78; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312343.4]
  assign id_ctrl_jal = _T_414 == 32'h68; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312344.4]
  assign _T_417 = ibuf_io_inst_0_bits_inst_bits & 32'h203c; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312346.4]
  assign id_ctrl_jalr = _T_417 == 32'h24; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312347.4]
  assign _T_420 = ibuf_io_inst_0_bits_inst_bits & 32'h3c; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312349.4]
  assign _T_421 = _T_420 == 32'h20; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312350.4]
  assign _T_423 = _T_411 == 32'h30; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312352.4]
  assign _T_424 = ibuf_io_inst_0_bits_inst_bits & 32'h105c; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312353.4]
  assign _T_425 = _T_424 == 32'h1008; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312354.4]
  assign _T_426 = ibuf_io_inst_0_bits_inst_bits & 32'h204c; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312355.4]
  assign id_ctrl_amo = _T_426 == 32'h200c; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312356.4]
  assign _T_428 = ibuf_io_inst_0_bits_inst_bits & 32'h3018; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312357.4]
  assign _T_429 = _T_428 == 32'h3018; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312358.4]
  assign _T_430 = ibuf_io_inst_0_bits_inst_bits & 32'h4200302c; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312359.4]
  assign _T_431 = _T_430 == 32'h2000020; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312360.4]
  assign _T_433 = _T_421 | _T_423; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312362.4]
  assign _T_434 = _T_433 | _T_425; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312363.4]
  assign _T_435 = _T_434 | id_ctrl_amo; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312364.4]
  assign _T_436 = _T_435 | _T_429; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312365.4]
  assign id_ctrl_rxs2 = _T_436 | _T_431; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312366.4]
  assign _T_438 = ibuf_io_inst_0_bits_inst_bits & 32'h54; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312367.4]
  assign _T_439 = _T_438 == 32'h10; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312368.4]
  assign _T_440 = ibuf_io_inst_0_bits_inst_bits & 32'h402c; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312369.4]
  assign _T_441 = _T_440 == 32'h20; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312370.4]
  assign _T_442 = ibuf_io_inst_0_bits_inst_bits & 32'h38; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312371.4]
  assign _T_443 = _T_442 == 32'h20; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312372.4]
  assign _T_444 = ibuf_io_inst_0_bits_inst_bits & 32'h2050; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312373.4]
  assign _T_445 = _T_444 == 32'h2000; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312374.4]
  assign _T_446 = ibuf_io_inst_0_bits_inst_bits & 32'h2018; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312375.4]
  assign _T_447 = _T_446 == 32'h2018; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312376.4]
  assign _T_448 = ibuf_io_inst_0_bits_inst_bits & 32'h9000003c; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312377.4]
  assign _T_449 = _T_448 == 32'h90000010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312378.4]
  assign _T_451 = _T_407 == 32'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312380.4]
  assign _T_453 = _T_439 | _T_441; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312382.4]
  assign _T_454 = _T_453 | _T_443; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312383.4]
  assign _T_455 = _T_454 | _T_445; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312384.4]
  assign _T_456 = _T_455 | _T_447; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312385.4]
  assign _T_457 = _T_456 | _T_449; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312386.4]
  assign id_ctrl_rxs1 = _T_457 | _T_451; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312387.4]
  assign _T_459 = ibuf_io_inst_0_bits_inst_bits & 32'hc; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312388.4]
  assign _T_460 = _T_459 == 32'h4; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312389.4]
  assign _T_462 = _T_398 == 32'h10; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312391.4]
  assign _T_464 = _T_407 == 32'h48; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312393.4]
  assign _T_465 = ibuf_io_inst_0_bits_inst_bits & 32'h4058; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312394.4]
  assign _T_466 = _T_465 == 32'h4050; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312395.4]
  assign _T_468 = _T_451 | _T_460; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312397.4]
  assign _T_469 = _T_468 | _T_462; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312398.4]
  assign _T_470 = _T_469 | _T_464; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312399.4]
  assign _T_471 = _T_470 | _T_466; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312400.4]
  assign _T_472 = ibuf_io_inst_0_bits_inst_bits & 32'h18; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312401.4]
  assign _T_473 = _T_472 == 32'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312402.4]
  assign _T_474 = ibuf_io_inst_0_bits_inst_bits & 32'h50; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312403.4]
  assign _T_475 = _T_474 == 32'h10; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312404.4]
  assign _T_476 = ibuf_io_inst_0_bits_inst_bits & 32'h4008; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312405.4]
  assign _T_477 = _T_476 == 32'h4000; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312406.4]
  assign _T_479 = _T_473 | _T_475; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312408.4]
  assign _T_480 = _T_479 | _T_477; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312409.4]
  assign id_ctrl_sel_alu2 = {_T_480,_T_471}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312410.4]
  assign _T_482 = ibuf_io_inst_0_bits_inst_bits & 32'h4004; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312411.4]
  assign _T_483 = _T_482 == 32'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312412.4]
  assign _T_485 = _T_474 == 32'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312414.4]
  assign _T_486 = ibuf_io_inst_0_bits_inst_bits & 32'h44; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312415.4]
  assign _T_487 = _T_486 == 32'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312416.4]
  assign _T_488 = ibuf_io_inst_0_bits_inst_bits & 32'h24; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312417.4]
  assign _T_489 = _T_488 == 32'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312418.4]
  assign _T_491 = _T_459 == 32'h8; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312420.4]
  assign _T_493 = _T_483 | _T_485; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312422.4]
  assign _T_494 = _T_493 | _T_487; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312423.4]
  assign _T_495 = _T_494 | _T_489; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312424.4]
  assign _T_496 = _T_495 | _T_473; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312425.4]
  assign _T_497 = _T_496 | _T_491; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312426.4]
  assign _T_498 = ibuf_io_inst_0_bits_inst_bits & 32'h34; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312427.4]
  assign _T_499 = _T_498 == 32'h14; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312428.4]
  assign _T_501 = _T_499 | _T_464; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312430.4]
  assign id_ctrl_sel_alu1 = {_T_501,_T_497}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312431.4]
  assign _T_504 = _T_472 == 32'h8; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312433.4]
  assign _T_506 = _T_486 == 32'h40; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312435.4]
  assign _T_508 = _T_504 | _T_506; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312437.4]
  assign _T_509 = ibuf_io_inst_0_bits_inst_bits & 32'h14; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312438.4]
  assign _T_510 = _T_509 == 32'h14; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312439.4]
  assign _T_512 = _T_504 | _T_510; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312441.4]
  assign _T_513 = ibuf_io_inst_0_bits_inst_bits & 32'h30; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312442.4]
  assign _T_514 = _T_513 == 32'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312443.4]
  assign _T_515 = ibuf_io_inst_0_bits_inst_bits & 32'h201c; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312444.4]
  assign _T_516 = _T_515 == 32'h4; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312445.4]
  assign _T_518 = _T_509 == 32'h10; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312447.4]
  assign _T_520 = _T_514 | _T_516; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312449.4]
  assign _T_521 = _T_520 | _T_518; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312450.4]
  assign _T_522 = {_T_521,_T_512}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312451.4]
  assign id_ctrl_sel_imm = {_T_522,_T_508}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312452.4]
  assign _T_524 = ibuf_io_inst_0_bits_inst_bits & 32'h10; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312453.4]
  assign _T_525 = _T_524 == 32'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312454.4]
  assign _T_526 = ibuf_io_inst_0_bits_inst_bits & 32'h8; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312455.4]
  assign _T_527 = _T_526 == 32'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312456.4]
  assign _T_528 = ibuf_io_inst_0_bits_inst_bits & 32'h40; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312457.4]
  assign _T_529 = _T_528 == 32'h40; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312458.4]
  assign _T_531 = _T_525 | _T_527; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312460.4]
  assign id_ctrl_alu_dw = _T_531 | _T_529; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312461.4]
  assign _T_533 = ibuf_io_inst_0_bits_inst_bits & 32'h3054; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312462.4]
  assign _T_534 = _T_533 == 32'h1010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312463.4]
  assign _T_535 = ibuf_io_inst_0_bits_inst_bits & 32'h1058; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312464.4]
  assign _T_536 = _T_535 == 32'h1040; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312465.4]
  assign _T_537 = ibuf_io_inst_0_bits_inst_bits & 32'h5054; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312466.4]
  assign _T_538 = _T_537 == 32'h5010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312467.4]
  assign _T_539 = ibuf_io_inst_0_bits_inst_bits & 32'h2001074; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312468.4]
  assign _T_540 = _T_539 == 32'h2001030; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312469.4]
  assign _T_542 = _T_534 | _T_536; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312471.4]
  assign _T_543 = _T_542 | _T_538; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312472.4]
  assign _T_544 = _T_543 | _T_540; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312473.4]
  assign _T_545 = ibuf_io_inst_0_bits_inst_bits & 32'h4054; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312474.4]
  assign _T_546 = _T_545 == 32'h40; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312475.4]
  assign _T_547 = ibuf_io_inst_0_bits_inst_bits & 32'h2058; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312476.4]
  assign _T_548 = _T_547 == 32'h2040; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312477.4]
  assign _T_550 = _T_533 == 32'h3010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312479.4]
  assign _T_551 = ibuf_io_inst_0_bits_inst_bits & 32'h6054; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312480.4]
  assign _T_552 = _T_551 == 32'h6010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312481.4]
  assign _T_553 = ibuf_io_inst_0_bits_inst_bits & 32'h2002074; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312482.4]
  assign _T_554 = _T_553 == 32'h2002030; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312483.4]
  assign _T_555 = ibuf_io_inst_0_bits_inst_bits & 32'h40000074; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312484.4]
  assign _T_556 = _T_555 == 32'h40000030; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312485.4]
  assign _T_557 = ibuf_io_inst_0_bits_inst_bits & 32'h40001054; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312486.4]
  assign _T_558 = _T_557 == 32'h40001010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312487.4]
  assign _T_560 = _T_546 | _T_548; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312489.4]
  assign _T_561 = _T_560 | _T_550; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312490.4]
  assign _T_562 = _T_561 | _T_552; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312491.4]
  assign _T_563 = _T_562 | _T_554; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312492.4]
  assign _T_564 = _T_563 | _T_556; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312493.4]
  assign _T_565 = _T_564 | _T_558; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312494.4]
  assign _T_566 = ibuf_io_inst_0_bits_inst_bits & 32'h2002054; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312495.4]
  assign _T_567 = _T_566 == 32'h2010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312496.4]
  assign _T_568 = ibuf_io_inst_0_bits_inst_bits & 32'h2074; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312497.4]
  assign _T_569 = _T_568 == 32'h2010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312498.4]
  assign _T_570 = ibuf_io_inst_0_bits_inst_bits & 32'h40004054; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312499.4]
  assign _T_571 = _T_570 == 32'h4010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312500.4]
  assign _T_573 = _T_537 == 32'h4010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312502.4]
  assign _T_575 = _T_465 == 32'h4040; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312504.4]
  assign _T_577 = _T_567 | _T_569; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312506.4]
  assign _T_578 = _T_577 | _T_571; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312507.4]
  assign _T_579 = _T_578 | _T_573; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312508.4]
  assign _T_580 = _T_579 | _T_575; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312509.4]
  assign _T_581 = ibuf_io_inst_0_bits_inst_bits & 32'h2006054; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312510.4]
  assign _T_582 = _T_581 == 32'h2010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312511.4]
  assign _T_583 = ibuf_io_inst_0_bits_inst_bits & 32'h6074; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312512.4]
  assign _T_584 = _T_583 == 32'h2010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312513.4]
  assign _T_585 = ibuf_io_inst_0_bits_inst_bits & 32'h40003054; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312514.4]
  assign _T_586 = _T_585 == 32'h40001010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312515.4]
  assign _T_588 = _T_582 | _T_584; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312517.4]
  assign _T_589 = _T_588 | _T_575; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312518.4]
  assign _T_590 = _T_589 | _T_556; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312519.4]
  assign _T_591 = _T_590 | _T_586; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312520.4]
  assign _T_592 = {_T_565,_T_544}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312521.4]
  assign _T_593 = {_T_591,_T_580}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312522.4]
  assign id_ctrl_alu_fn = {_T_593,_T_592}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312523.4]
  assign _T_595 = ibuf_io_inst_0_bits_inst_bits & 32'h107f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312524.4]
  assign _T_596 = _T_595 == 32'h3; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312525.4]
  assign _T_597 = ibuf_io_inst_0_bits_inst_bits & 32'h707f; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312526.4]
  assign _T_598 = _T_597 == 32'h100f; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312527.4]
  assign _T_600 = _T_350 | _T_264; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312529.4]
  assign _T_601 = _T_600 | _T_596; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312530.4]
  assign _T_602 = _T_601 | _T_598; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312531.4]
  assign _T_603 = _T_602 | _T_294; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312532.4]
  assign _T_604 = _T_603 | _T_300; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312533.4]
  assign _T_605 = _T_604 | _T_314; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312534.4]
  assign _T_606 = _T_605 | _T_316; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312535.4]
  assign id_ctrl_mem = _T_606 | _T_321; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312536.4]
  assign _T_608 = ibuf_io_inst_0_bits_inst_bits & 32'h2008; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312537.4]
  assign _T_609 = _T_608 == 32'h8; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312538.4]
  assign _T_611 = _T_400 == 32'h20; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312540.4]
  assign _T_612 = ibuf_io_inst_0_bits_inst_bits & 32'h18000020; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312541.4]
  assign _T_613 = _T_612 == 32'h18000020; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312542.4]
  assign _T_614 = ibuf_io_inst_0_bits_inst_bits & 32'h20000020; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312543.4]
  assign _T_615 = _T_614 == 32'h20000020; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312544.4]
  assign _T_617 = _T_609 | _T_611; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312546.4]
  assign _T_618 = _T_617 | _T_613; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312547.4]
  assign _T_619 = _T_618 | _T_615; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312548.4]
  assign _T_620 = ibuf_io_inst_0_bits_inst_bits & 32'h10002008; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312549.4]
  assign _T_621 = _T_620 == 32'h10002008; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312550.4]
  assign _T_622 = ibuf_io_inst_0_bits_inst_bits & 32'h40002008; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312551.4]
  assign _T_623 = _T_622 == 32'h40002008; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312552.4]
  assign _T_625 = _T_621 | _T_623; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312554.4]
  assign _T_626 = ibuf_io_inst_0_bits_inst_bits & 32'h8000008; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312555.4]
  assign _T_627 = _T_626 == 32'h8000008; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312556.4]
  assign _T_628 = ibuf_io_inst_0_bits_inst_bits & 32'h10000008; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312557.4]
  assign _T_629 = _T_628 == 32'h10000008; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312558.4]
  assign _T_630 = ibuf_io_inst_0_bits_inst_bits & 32'h80000008; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312559.4]
  assign _T_631 = _T_630 == 32'h80000008; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312560.4]
  assign _T_633 = _T_609 | _T_529; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312562.4]
  assign _T_634 = _T_633 | _T_627; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312563.4]
  assign _T_635 = _T_634 | _T_629; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312564.4]
  assign _T_636 = _T_635 | _T_631; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312565.4]
  assign _T_637 = ibuf_io_inst_0_bits_inst_bits & 32'h18002008; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312566.4]
  assign _T_638 = _T_637 == 32'h2008; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312567.4]
  assign _T_641 = {_T_625,_T_619}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312570.4]
  assign _T_642 = {_T_529,_T_638}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312571.4]
  assign _T_643 = {_T_642,_T_636}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312572.4]
  assign id_ctrl_mem_cmd = {_T_643,_T_641}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312573.4]
  assign _T_645 = ibuf_io_inst_0_bits_inst_bits & 32'h1000; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312574.4]
  assign _T_646 = _T_645 == 32'h1000; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312575.4]
  assign _T_648 = ibuf_io_inst_0_bits_inst_bits & 32'h2000; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312577.4]
  assign _T_649 = _T_648 == 32'h2000; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312578.4]
  assign _T_651 = _T_529 | _T_649; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312580.4]
  assign _T_652 = ibuf_io_inst_0_bits_inst_bits & 32'h4000; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312581.4]
  assign _T_653 = _T_652 == 32'h4000; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312582.4]
  assign _T_655 = {_T_653,_T_651}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312584.4]
  assign id_ctrl_mem_type = {_T_655,_T_646}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312585.4]
  assign _T_657 = ibuf_io_inst_0_bits_inst_bits & 32'h80000068; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312586.4]
  assign _T_658 = _T_657 == 32'h40; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312587.4]
  assign _T_659 = ibuf_io_inst_0_bits_inst_bits & 32'h10000068; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312588.4]
  assign _T_676 = _T_420 == 32'h4; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312605.4]
  assign _T_678 = _T_659 == 32'h10000040; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312607.4]
  assign _T_680 = _T_676 | _T_658; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312609.4]
  assign _T_681 = _T_680 | id_ctrl_rfs3; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312610.4]
  assign id_ctrl_wfd = _T_681 | _T_678; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312611.4]
  assign _T_683 = ibuf_io_inst_0_bits_inst_bits & 32'h2000074; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312612.4]
  assign id_ctrl_div = _T_683 == 32'h2000030; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312613.4]
  assign _T_686 = ibuf_io_inst_0_bits_inst_bits & 32'h6c; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312615.4]
  assign _T_687 = _T_686 == 32'h0; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312616.4]
  assign _T_688 = ibuf_io_inst_0_bits_inst_bits & 32'h2024; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312617.4]
  assign _T_689 = _T_688 == 32'h24; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312618.4]
  assign _T_690 = ibuf_io_inst_0_bits_inst_bits & 32'h1038; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312619.4]
  assign _T_691 = _T_690 == 32'h1030; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312620.4]
  assign _T_692 = ibuf_io_inst_0_bits_inst_bits & 32'h2038; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312621.4]
  assign _T_693 = _T_692 == 32'h2030; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312622.4]
  assign _T_694 = ibuf_io_inst_0_bits_inst_bits & 32'h4040; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312623.4]
  assign _T_695 = _T_694 == 32'h4000; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312624.4]
  assign _T_696 = ibuf_io_inst_0_bits_inst_bits & 32'h4018; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312625.4]
  assign _T_697 = _T_696 == 32'h4018; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312626.4]
  assign _T_698 = ibuf_io_inst_0_bits_inst_bits & 32'h90000018; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312627.4]
  assign _T_699 = _T_698 == 32'h80000010; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312628.4]
  assign _T_701 = _T_687 | _T_475; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312630.4]
  assign _T_702 = _T_701 | _T_689; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312631.4]
  assign _T_703 = _T_702 | id_ctrl_jal; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312632.4]
  assign _T_704 = _T_703 | _T_691; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312633.4]
  assign _T_705 = _T_704 | id_ctrl_amo; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312634.4]
  assign _T_706 = _T_705 | _T_693; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312635.4]
  assign _T_707 = _T_706 | _T_695; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312636.4]
  assign _T_708 = _T_707 | _T_697; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312637.4]
  assign id_ctrl_wxd = _T_708 | _T_699; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312638.4]
  assign _T_710 = ibuf_io_inst_0_bits_inst_bits & 32'h1078; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312639.4]
  assign _T_711 = _T_710 == 32'h1070; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312640.4]
  assign _T_713 = ibuf_io_inst_0_bits_inst_bits & 32'h2078; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312642.4]
  assign _T_714 = _T_713 == 32'h2070; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312643.4]
  assign _T_716 = ibuf_io_inst_0_bits_inst_bits & 32'h10000078; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312645.4]
  assign _T_717 = _T_716 == 32'h70; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312646.4]
  assign _T_718 = ibuf_io_inst_0_bits_inst_bits & 32'h1200003c; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312647.4]
  assign _T_719 = _T_718 == 32'h10000030; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312648.4]
  assign _T_720 = ibuf_io_inst_0_bits_inst_bits & 32'he0000058; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312649.4]
  assign _T_721 = _T_720 == 32'h60000050; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312650.4]
  assign _T_723 = _T_717 | _T_711; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312652.4]
  assign _T_724 = _T_723 | _T_714; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312653.4]
  assign _T_725 = _T_724 | _T_719; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312654.4]
  assign _T_726 = _T_725 | _T_721; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312655.4]
  assign _T_727 = {_T_726,_T_714}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312656.4]
  assign id_ctrl_csr = {_T_727,_T_711}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312657.4]
  assign _T_729 = ibuf_io_inst_0_bits_inst_bits & 32'h3058; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312658.4]
  assign id_ctrl_fence_i = _T_729 == 32'h1008; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312659.4]
  assign id_ctrl_fence = _T_533 == 32'h4; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312662.4]
  assign _T_737 = _T_424 == 32'h1004; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312666.4]
  assign _T_738 = ibuf_io_inst_0_bits_inst_bits & 32'h2000070; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312667.4]
  assign _T_739 = _T_738 == 32'h2000040; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312668.4]
  assign _T_740 = ibuf_io_inst_0_bits_inst_bits & 32'h2000068; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312669.4]
  assign _T_741 = _T_740 == 32'h2000040; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312670.4]
  assign _T_742 = ibuf_io_inst_0_bits_inst_bits & 32'hd0000078; // @[Decode.scala 14:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312671.4]
  assign _T_743 = _T_742 == 32'h40000050; // @[Decode.scala 14:121:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312672.4]
  assign _T_745 = _T_737 | _T_739; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312674.4]
  assign _T_746 = _T_745 | _T_741; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312675.4]
  assign id_ctrl_dp = _T_746 | _T_743; // @[Decode.scala 15:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312676.4]
  assign _T_755 = ibuf_io_inst_0_bits_inst_rs1 == 5'h0; // @[RocketCore.scala 917:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312712.4]
  assign _T_757 = ibuf_io_inst_0_bits_inst_rs1; // @[RocketCore.scala 911:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312714.4]
  assign _T_760 = _T_752__T_759_data; // @[RocketCore.scala 917:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312717.4]
  assign _T_765 = ibuf_io_inst_0_bits_inst_rs2; // @[RocketCore.scala 911:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312723.4]
  assign _T_768 = _T_752__T_767_data; // @[RocketCore.scala 917:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312726.4]
  assign _T_839 = id_ctrl_csr == 3'h6; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312801.4]
  assign _T_840 = id_ctrl_csr == 3'h7; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312802.4]
  assign _T_841 = id_ctrl_csr == 3'h5; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312803.4]
  assign _T_842 = _T_839 | _T_840; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312804.4]
  assign id_csr_en = _T_842 | _T_841; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312805.4]
  assign id_system_insn = id_ctrl_csr == 3'h4; // @[RocketCore.scala 246:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312806.4]
  assign id_csr_ren = _T_842 & _T_755; // @[RocketCore.scala 247:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312811.4]
  assign _T_847 = id_ctrl_mem_cmd == 5'h14; // @[RocketCore.scala 249:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312813.4]
  assign id_sfence = id_ctrl_mem & _T_847; // @[RocketCore.scala 249:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312814.4]
  assign _T_848 = id_sfence | id_system_insn; // @[RocketCore.scala 250:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312815.4]
  assign _T_849 = id_csr_ren == 1'h0; // @[RocketCore.scala 250:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312816.4]
  assign _T_850 = id_csr_en & _T_849; // @[RocketCore.scala 250:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312817.4]
  assign _T_851 = _T_850 & csr_io_decode_0_write_flush; // @[RocketCore.scala 250:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312818.4]
  assign id_csr_flush = _T_848 | _T_851; // @[RocketCore.scala 250:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312819.4]
  assign _T_852 = id_ctrl_legal == 1'h0; // @[RocketCore.scala 258:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312820.4]
  assign _T_854 = csr_io_status_isa[12]; // @[RocketCore.scala 259:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312822.4]
  assign _T_855 = _T_854 == 1'h0; // @[RocketCore.scala 259:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312823.4]
  assign _T_856 = id_ctrl_div & _T_855; // @[RocketCore.scala 259:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312824.4]
  assign _T_857 = _T_852 | _T_856; // @[RocketCore.scala 258:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312825.4]
  assign _T_858 = csr_io_status_isa[0]; // @[RocketCore.scala 260:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312826.4]
  assign _T_859 = _T_858 == 1'h0; // @[RocketCore.scala 260:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312827.4]
  assign _T_860 = id_ctrl_amo & _T_859; // @[RocketCore.scala 260:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312828.4]
  assign _T_861 = _T_857 | _T_860; // @[RocketCore.scala 259:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312829.4]
  assign _T_862 = csr_io_decode_0_fp_illegal | io_fpu_illegal_rm; // @[RocketCore.scala 261:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312830.4]
  assign _T_863 = id_ctrl_fp & _T_862; // @[RocketCore.scala 261:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312831.4]
  assign _T_864 = _T_861 | _T_863; // @[RocketCore.scala 260:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312832.4]
  assign _T_865 = csr_io_status_isa[3]; // @[RocketCore.scala 262:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312833.4]
  assign _T_866 = _T_865 == 1'h0; // @[RocketCore.scala 262:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312834.4]
  assign _T_867 = id_ctrl_dp & _T_866; // @[RocketCore.scala 262:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312835.4]
  assign _T_868 = _T_864 | _T_867; // @[RocketCore.scala 261:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312836.4]
  assign _T_869 = csr_io_status_isa[2]; // @[RocketCore.scala 263:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312837.4]
  assign _T_870 = _T_869 == 1'h0; // @[RocketCore.scala 263:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312838.4]
  assign _T_871 = ibuf_io_inst_0_bits_rvc & _T_870; // @[RocketCore.scala 263:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312839.4]
  assign _T_872 = _T_868 | _T_871; // @[RocketCore.scala 262:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312840.4]
  assign _T_873 = id_ctrl_rocc & csr_io_decode_0_rocc_illegal; // @[RocketCore.scala 264:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312841.4]
  assign _T_874 = _T_872 | _T_873; // @[RocketCore.scala 263:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312842.4]
  assign _T_878 = _T_849 & csr_io_decode_0_write_illegal; // @[RocketCore.scala 266:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312846.4]
  assign _T_879 = csr_io_decode_0_read_illegal | _T_878; // @[RocketCore.scala 266:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312847.4]
  assign _T_880 = id_csr_en & _T_879; // @[RocketCore.scala 266:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312848.4]
  assign _T_881 = _T_874 | _T_880; // @[RocketCore.scala 265:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312849.4]
  assign _T_882 = ibuf_io_inst_0_bits_rvc == 1'h0; // @[RocketCore.scala 267:5:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312850.4]
  assign _T_884 = _T_848 & csr_io_decode_0_system_illegal; // @[RocketCore.scala 267:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312852.4]
  assign _T_885 = _T_882 & _T_884; // @[RocketCore.scala 267:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312853.4]
  assign id_illegal_insn = _T_881 | _T_885; // @[RocketCore.scala 266:99:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312854.4]
  assign id_amo_aq = ibuf_io_inst_0_bits_inst_bits[26]; // @[RocketCore.scala 269:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312855.4]
  assign id_amo_rl = ibuf_io_inst_0_bits_inst_bits[25]; // @[RocketCore.scala 270:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312856.4]
  assign _T_886 = id_ctrl_amo & id_amo_aq; // @[RocketCore.scala 271:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312857.4]
  assign id_fence_next = id_ctrl_fence | _T_886; // @[RocketCore.scala 271:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312858.4]
  assign _T_887 = io_dmem_ordered == 1'h0; // @[RocketCore.scala 272:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312859.4]
  assign id_mem_busy = _T_887 | io_dmem_req_valid; // @[RocketCore.scala 272:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312860.4]
  assign _T_888 = id_mem_busy == 1'h0; // @[RocketCore.scala 273:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312861.4]
  assign _T_889 = ex_reg_valid & ex_ctrl_rocc; // @[RocketCore.scala 275:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312865.4]
  assign _T_890 = io_rocc_busy | _T_889; // @[RocketCore.scala 275:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312866.4]
  assign _T_891 = mem_reg_valid & mem_ctrl_rocc; // @[RocketCore.scala 276:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312867.4]
  assign _T_892 = _T_890 | _T_891; // @[RocketCore.scala 275:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312868.4]
  assign id_rocc_busy = _T_892 | _T_1465; // @[RocketCore.scala 276:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312870.4]
  assign _T_895 = id_rocc_busy & id_ctrl_fence; // @[RocketCore.scala 277:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312872.4]
  assign _T_896 = id_ctrl_amo & id_amo_rl; // @[RocketCore.scala 278:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312873.4]
  assign _T_897 = _T_896 | id_ctrl_fence_i; // @[RocketCore.scala 278:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312874.4]
  assign _T_898 = id_ctrl_mem | id_ctrl_rocc; // @[RocketCore.scala 278:97:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312875.4]
  assign _T_899 = id_reg_fence & _T_898; // @[RocketCore.scala 278:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312876.4]
  assign _T_900 = _T_897 | _T_899; // @[RocketCore.scala 278:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312877.4]
  assign _T_901 = id_mem_busy & _T_900; // @[RocketCore.scala 278:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312878.4]
  assign id_do_fence = _T_895 | _T_901; // @[RocketCore.scala 277:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312879.4]
  assign _T_904 = csr_io_interrupt | bpu_io_debug_if; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312891.4]
  assign _T_905 = _T_904 | bpu_io_xcpt_if; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312892.4]
  assign _T_906 = _T_905 | ibuf_io_inst_0_bits_xcpt0_pf_inst; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312893.4]
  assign _T_907 = _T_906 | ibuf_io_inst_0_bits_xcpt0_ae_inst; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312894.4]
  assign _T_908 = _T_907 | ibuf_io_inst_0_bits_xcpt1_pf_inst; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312895.4]
  assign _T_909 = _T_908 | ibuf_io_inst_0_bits_xcpt1_ae_inst; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312896.4]
  assign id_xcpt = _T_909 | id_illegal_insn; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312897.4]
  assign _T_910 = ibuf_io_inst_0_bits_xcpt1_ae_inst ? 2'h1 : 2'h2; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312898.4]
  assign _T_911 = ibuf_io_inst_0_bits_xcpt1_pf_inst ? 4'hc : {{2'd0}, _T_910}; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312899.4]
  assign _T_912 = ibuf_io_inst_0_bits_xcpt0_ae_inst ? 4'h1 : _T_911; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312900.4]
  assign _T_913 = ibuf_io_inst_0_bits_xcpt0_pf_inst ? 4'hc : _T_912; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312901.4]
  assign _T_914 = bpu_io_xcpt_if ? 4'h3 : _T_913; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312902.4]
  assign _T_915 = bpu_io_debug_if ? 4'he : _T_914; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312903.4]
  assign ex_waddr = ex_reg_inst[11:7]; // @[RocketCore.scala 313:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312916.4]
  assign mem_waddr = mem_reg_inst[11:7]; // @[RocketCore.scala 314:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312917.4]
  assign wb_waddr = wb_reg_inst[11:7]; // @[RocketCore.scala 315:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312918.4]
  assign _T_926 = ex_reg_valid & ex_ctrl_wxd; // @[RocketCore.scala 318:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312919.4]
  assign _T_927 = mem_reg_valid & mem_ctrl_wxd; // @[RocketCore.scala 319:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312920.4]
  assign _T_928 = mem_ctrl_mem == 1'h0; // @[RocketCore.scala 319:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312921.4]
  assign _T_929 = _T_927 & _T_928; // @[RocketCore.scala 319:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312922.4]
  assign _T_931 = 5'h0 == ibuf_io_inst_0_bits_inst_rs1; // @[RocketCore.scala 321:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312924.4]
  assign _T_933 = ex_waddr == ibuf_io_inst_0_bits_inst_rs1; // @[RocketCore.scala 321:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312926.4]
  assign _T_934 = _T_926 & _T_933; // @[RocketCore.scala 321:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312927.4]
  assign _T_935 = mem_waddr == ibuf_io_inst_0_bits_inst_rs1; // @[RocketCore.scala 321:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312928.4]
  assign _T_936 = _T_929 & _T_935; // @[RocketCore.scala 321:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312929.4]
  assign _T_938 = _T_927 & _T_935; // @[RocketCore.scala 321:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312931.4]
  assign _T_939 = 5'h0 == ibuf_io_inst_0_bits_inst_rs2; // @[RocketCore.scala 321:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312932.4]
  assign _T_941 = ex_waddr == ibuf_io_inst_0_bits_inst_rs2; // @[RocketCore.scala 321:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312934.4]
  assign _T_942 = _T_926 & _T_941; // @[RocketCore.scala 321:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312935.4]
  assign _T_943 = mem_waddr == ibuf_io_inst_0_bits_inst_rs2; // @[RocketCore.scala 321:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312936.4]
  assign _T_944 = _T_929 & _T_943; // @[RocketCore.scala 321:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312937.4]
  assign _T_946 = _T_927 & _T_943; // @[RocketCore.scala 321:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312939.4]
  assign _T_968 = ex_reg_rs_lsb_0 == 2'h1; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312943.4]
  assign _T_969 = _T_968 ? mem_reg_wdata : 64'h0; // @[package.scala 31:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312944.4]
  assign _T_970 = ex_reg_rs_lsb_0 == 2'h2; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312945.4]
  assign _T_971 = _T_970 ? wb_reg_wdata : _T_969; // @[package.scala 31:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312946.4]
  assign _T_972 = ex_reg_rs_lsb_0 == 2'h3; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312947.4]
  assign _T_973 = _T_972 ? io_dmem_resp_bits_data_word_bypass : _T_971; // @[package.scala 31:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312948.4]
  assign _T_974 = {ex_reg_rs_msb_0,ex_reg_rs_lsb_0}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312949.4]
  assign _T_975 = ex_reg_rs_bypass_0 ? _T_973 : _T_974; // @[RocketCore.scala 329:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312950.4]
  assign _T_976 = ex_reg_rs_lsb_1 == 2'h1; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312951.4]
  assign _T_977 = _T_976 ? mem_reg_wdata : 64'h0; // @[package.scala 31:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312952.4]
  assign _T_978 = ex_reg_rs_lsb_1 == 2'h2; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312953.4]
  assign _T_979 = _T_978 ? wb_reg_wdata : _T_977; // @[package.scala 31:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312954.4]
  assign _T_980 = ex_reg_rs_lsb_1 == 2'h3; // @[package.scala 31:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312955.4]
  assign _T_981 = _T_980 ? io_dmem_resp_bits_data_word_bypass : _T_979; // @[package.scala 31:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312956.4]
  assign _T_982 = {ex_reg_rs_msb_1,ex_reg_rs_lsb_1}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312957.4]
  assign _T_983 = ex_reg_rs_bypass_1 ? _T_981 : _T_982; // @[RocketCore.scala 329:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312958.4]
  assign _T_984 = ex_ctrl_sel_imm == 3'h5; // @[RocketCore.scala 932:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312959.4]
  assign _T_985 = ex_reg_inst[31]; // @[RocketCore.scala 932:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312960.4]
  assign _T_986 = $signed(_T_985); // @[RocketCore.scala 932:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312961.4]
  assign _T_987 = _T_984 ? $signed(1'sh0) : $signed(_T_986); // @[RocketCore.scala 932:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312962.4]
  assign _T_988 = ex_ctrl_sel_imm == 3'h2; // @[RocketCore.scala 933:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312963.4]
  assign _T_989 = ex_reg_inst[30:20]; // @[RocketCore.scala 933:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312964.4]
  assign _T_990 = $signed(_T_989); // @[RocketCore.scala 933:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312965.4]
  assign _T_991 = _T_988 ? $signed(_T_990) : $signed({11{_T_987}}); // @[RocketCore.scala 933:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312966.4]
  assign _T_992 = ex_ctrl_sel_imm != 3'h2; // @[RocketCore.scala 934:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312967.4]
  assign _T_993 = ex_ctrl_sel_imm != 3'h3; // @[RocketCore.scala 934:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312968.4]
  assign _T_994 = _T_992 & _T_993; // @[RocketCore.scala 934:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312969.4]
  assign _T_995 = ex_reg_inst[19:12]; // @[RocketCore.scala 934:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312970.4]
  assign _T_996 = $signed(_T_995); // @[RocketCore.scala 934:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312971.4]
  assign _T_997 = _T_994 ? $signed({8{_T_987}}) : $signed(_T_996); // @[RocketCore.scala 934:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312972.4]
  assign _T_1000 = _T_988 | _T_984; // @[RocketCore.scala 935:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312975.4]
  assign _T_1001 = ex_ctrl_sel_imm == 3'h3; // @[RocketCore.scala 936:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312976.4]
  assign _T_1002 = ex_reg_inst[20]; // @[RocketCore.scala 936:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312977.4]
  assign _T_1003 = $signed(_T_1002); // @[RocketCore.scala 936:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312978.4]
  assign _T_1004 = ex_ctrl_sel_imm == 3'h1; // @[RocketCore.scala 937:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312979.4]
  assign _T_1005 = ex_reg_inst[7]; // @[RocketCore.scala 937:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312980.4]
  assign _T_1006 = $signed(_T_1005); // @[RocketCore.scala 937:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312981.4]
  assign _T_1007 = _T_1004 ? $signed(_T_1006) : $signed(_T_987); // @[RocketCore.scala 937:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312982.4]
  assign _T_1008 = _T_1001 ? $signed(_T_1003) : $signed(_T_1007); // @[RocketCore.scala 936:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312983.4]
  assign _T_1009 = _T_1000 ? $signed(1'sh0) : $signed(_T_1008); // @[RocketCore.scala 935:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312984.4]
  assign _T_1013 = ex_reg_inst[30:25]; // @[RocketCore.scala 938:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312988.4]
  assign _T_1014 = _T_1000 ? 6'h0 : _T_1013; // @[RocketCore.scala 938:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312989.4]
  assign _T_1016 = ex_ctrl_sel_imm == 3'h0; // @[RocketCore.scala 940:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312991.4]
  assign _T_1018 = _T_1016 | _T_1004; // @[RocketCore.scala 940:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312993.4]
  assign _T_1019 = ex_reg_inst[11:8]; // @[RocketCore.scala 940:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312994.4]
  assign _T_1021 = ex_reg_inst[19:16]; // @[RocketCore.scala 941:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312996.4]
  assign _T_1022 = ex_reg_inst[24:21]; // @[RocketCore.scala 941:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312997.4]
  assign _T_1023 = _T_984 ? _T_1021 : _T_1022; // @[RocketCore.scala 941:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312998.4]
  assign _T_1024 = _T_1018 ? _T_1019 : _T_1023; // @[RocketCore.scala 940:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312999.4]
  assign _T_1025 = _T_988 ? 4'h0 : _T_1024; // @[RocketCore.scala 939:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313000.4]
  assign _T_1028 = ex_ctrl_sel_imm == 3'h4; // @[RocketCore.scala 943:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313003.4]
  assign _T_1031 = ex_reg_inst[15]; // @[RocketCore.scala 944:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313006.4]
  assign _T_1032 = _T_984 ? _T_1031 : 1'h0; // @[RocketCore.scala 944:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313007.4]
  assign _T_1033 = _T_1028 ? _T_1002 : _T_1032; // @[RocketCore.scala 943:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313008.4]
  assign _T_1034 = _T_1016 ? _T_1005 : _T_1033; // @[RocketCore.scala 942:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313009.4]
  assign _T_1035 = {_T_1014,_T_1025}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313010.4]
  assign _T_1036 = {_T_1035,_T_1034}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313011.4]
  assign _T_1037 = $unsigned(_T_1009); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313012.4]
  assign _T_1038 = $unsigned(_T_997); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313013.4]
  assign _T_1039 = {_T_1038,_T_1037}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313014.4]
  assign _T_1040 = $unsigned(_T_991); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313015.4]
  assign _T_1041 = $unsigned(_T_987); // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313016.4]
  assign _T_1042 = {_T_1041,_T_1040}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313017.4]
  assign _T_1043 = {_T_1042,_T_1039}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313018.4]
  assign _T_1044 = {_T_1043,_T_1036}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313019.4]
  assign ex_imm = $signed(_T_1044); // @[RocketCore.scala 946:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313020.4]
  assign _T_1045 = $signed(_T_975); // @[RocketCore.scala 332:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313021.4]
  assign _T_1046 = $signed(ex_reg_pc); // @[RocketCore.scala 333:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313022.4]
  assign _T_1047 = 2'h2 == ex_ctrl_sel_alu1; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313023.4]
  assign _T_1048 = _T_1047 ? $signed(_T_1046) : $signed(40'sh0); // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313024.4]
  assign _T_1049 = 2'h1 == ex_ctrl_sel_alu1; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313025.4]
  assign ex_op1 = _T_1049 ? $signed(_T_1045) : $signed({{24{_T_1048[39]}},_T_1048}); // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313026.4]
  assign _T_1050 = $signed(_T_983); // @[RocketCore.scala 335:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313027.4]
  assign _T_1051 = ex_reg_rvc ? $signed(4'sh2) : $signed(4'sh4); // @[RocketCore.scala 337:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313028.4]
  assign _T_1052 = 2'h1 == ex_ctrl_sel_alu2; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313029.4]
  assign _T_1053 = _T_1052 ? $signed(_T_1051) : $signed(4'sh0); // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313030.4]
  assign _T_1054 = 2'h3 == ex_ctrl_sel_alu2; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313031.4]
  assign _T_1055 = _T_1054 ? $signed(ex_imm) : $signed({{28{_T_1053[3]}},_T_1053}); // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313032.4]
  assign _T_1056 = 2'h2 == ex_ctrl_sel_alu2; // @[Mux.scala 46:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313033.4]
  assign ex_op2 = _T_1056 ? $signed(_T_1050) : $signed({{32{_T_1055[31]}},_T_1055}); // @[Mux.scala 46:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313034.4]
  assign _T_1732 = ibuf_io_inst_0_valid == 1'h0; // @[RocketCore.scala 702:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313975.4]
  assign _T_1733 = _T_1732 | ibuf_io_inst_0_bits_replay; // @[RocketCore.scala 702:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313976.4]
  assign _T_1734 = _T_1733 | take_pc_mem_wb; // @[RocketCore.scala 702:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313977.4]
  assign _T_1537 = ibuf_io_inst_0_bits_inst_rs1 != 5'h0; // @[RocketCore.scala 634:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313748.4]
  assign _T_1538 = id_ctrl_rxs1 & _T_1537; // @[RocketCore.scala 634:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313749.4]
  assign _T_1585 = ibuf_io_inst_0_bits_inst_rs1 == ex_waddr; // @[RocketCore.scala 654:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313803.4]
  assign _T_1586 = _T_1538 & _T_1585; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313804.4]
  assign _T_1539 = ibuf_io_inst_0_bits_inst_rs2 != 5'h0; // @[RocketCore.scala 635:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313750.4]
  assign _T_1540 = id_ctrl_rxs2 & _T_1539; // @[RocketCore.scala 635:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313751.4]
  assign _T_1587 = ibuf_io_inst_0_bits_inst_rs2 == ex_waddr; // @[RocketCore.scala 654:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313805.4]
  assign _T_1588 = _T_1540 & _T_1587; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313806.4]
  assign _T_1591 = _T_1586 | _T_1588; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313809.4]
  assign _T_1541 = ibuf_io_inst_0_bits_inst_rd != 5'h0; // @[RocketCore.scala 636:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313752.4]
  assign _T_1542 = id_ctrl_wxd & _T_1541; // @[RocketCore.scala 636:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313753.4]
  assign _T_1589 = ibuf_io_inst_0_bits_inst_rd == ex_waddr; // @[RocketCore.scala 654:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313807.4]
  assign _T_1590 = _T_1542 & _T_1589; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313808.4]
  assign _T_1592 = _T_1591 | _T_1590; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313810.4]
  assign data_hazard_ex = ex_ctrl_wxd & _T_1592; // @[RocketCore.scala 654:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313811.4]
  assign _T_1579 = ex_ctrl_csr != 3'h0; // @[RocketCore.scala 653:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313796.4]
  assign _T_1580 = _T_1579 | ex_ctrl_jalr; // @[RocketCore.scala 653:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313797.4]
  assign _T_1581 = _T_1580 | ex_ctrl_mem; // @[RocketCore.scala 653:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313798.4]
  assign _T_1583 = _T_1581 | ex_ctrl_div; // @[RocketCore.scala 653:94:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313800.4]
  assign _T_1584 = _T_1583 | ex_ctrl_fp; // @[RocketCore.scala 653:109:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313801.4]
  assign ex_cannot_bypass = _T_1584 | ex_ctrl_rocc; // @[RocketCore.scala 653:123:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313802.4]
  assign _T_1604 = data_hazard_ex & ex_cannot_bypass; // @[RocketCore.scala 656:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313824.4]
  assign _T_1594 = io_fpu_dec_ren1 & _T_1585; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313813.4]
  assign _T_1596 = io_fpu_dec_ren2 & _T_1587; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313815.4]
  assign _T_1601 = _T_1594 | _T_1596; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313820.4]
  assign _T_1597 = ibuf_io_inst_0_bits_inst_rs3 == ex_waddr; // @[RocketCore.scala 655:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313816.4]
  assign _T_1598 = io_fpu_dec_ren3 & _T_1597; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313817.4]
  assign _T_1602 = _T_1601 | _T_1598; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313821.4]
  assign _T_1600 = io_fpu_dec_wen & _T_1589; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313819.4]
  assign _T_1603 = _T_1602 | _T_1600; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313822.4]
  assign fp_data_hazard_ex = ex_ctrl_wfd & _T_1603; // @[RocketCore.scala 655:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313823.4]
  assign _T_1605 = _T_1604 | fp_data_hazard_ex; // @[RocketCore.scala 656:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313825.4]
  assign id_ex_hazard = ex_reg_valid & _T_1605; // @[RocketCore.scala 656:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313826.4]
  assign _T_1612 = ibuf_io_inst_0_bits_inst_rs1 == mem_waddr; // @[RocketCore.scala 663:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313835.4]
  assign _T_1613 = _T_1538 & _T_1612; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313836.4]
  assign _T_1614 = ibuf_io_inst_0_bits_inst_rs2 == mem_waddr; // @[RocketCore.scala 663:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313837.4]
  assign _T_1615 = _T_1540 & _T_1614; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313838.4]
  assign _T_1618 = _T_1613 | _T_1615; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313841.4]
  assign _T_1616 = ibuf_io_inst_0_bits_inst_rd == mem_waddr; // @[RocketCore.scala 663:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313839.4]
  assign _T_1617 = _T_1542 & _T_1616; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313840.4]
  assign _T_1619 = _T_1618 | _T_1617; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313842.4]
  assign data_hazard_mem = mem_ctrl_wxd & _T_1619; // @[RocketCore.scala 663:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313843.4]
  assign _T_1606 = mem_ctrl_csr != 3'h0; // @[RocketCore.scala 662:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313828.4]
  assign _T_1607 = mem_ctrl_mem & mem_reg_slow_bypass; // @[RocketCore.scala 662:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313829.4]
  assign _T_1608 = _T_1606 | _T_1607; // @[RocketCore.scala 662:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313830.4]
  assign _T_1609 = _T_1608 | mem_ctrl_mul; // @[RocketCore.scala 662:84:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313831.4]
  assign _T_1610 = _T_1609 | mem_ctrl_div; // @[RocketCore.scala 662:100:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313832.4]
  assign _T_1611 = _T_1610 | mem_ctrl_fp; // @[RocketCore.scala 662:116:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313833.4]
  assign mem_cannot_bypass = _T_1611 | mem_ctrl_rocc; // @[RocketCore.scala 662:131:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313834.4]
  assign _T_1631 = data_hazard_mem & mem_cannot_bypass; // @[RocketCore.scala 665:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313856.4]
  assign _T_1621 = io_fpu_dec_ren1 & _T_1612; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313845.4]
  assign _T_1623 = io_fpu_dec_ren2 & _T_1614; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313847.4]
  assign _T_1628 = _T_1621 | _T_1623; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313852.4]
  assign _T_1624 = ibuf_io_inst_0_bits_inst_rs3 == mem_waddr; // @[RocketCore.scala 664:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313848.4]
  assign _T_1625 = io_fpu_dec_ren3 & _T_1624; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313849.4]
  assign _T_1629 = _T_1628 | _T_1625; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313853.4]
  assign _T_1627 = io_fpu_dec_wen & _T_1616; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313851.4]
  assign _T_1630 = _T_1629 | _T_1627; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313854.4]
  assign fp_data_hazard_mem = mem_ctrl_wfd & _T_1630; // @[RocketCore.scala 664:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313855.4]
  assign _T_1632 = _T_1631 | fp_data_hazard_mem; // @[RocketCore.scala 665:78:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313857.4]
  assign id_mem_hazard = mem_reg_valid & _T_1632; // @[RocketCore.scala 665:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313858.4]
  assign _T_1705 = id_ex_hazard | id_mem_hazard; // @[RocketCore.scala 692:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313947.4]
  assign _T_1635 = ibuf_io_inst_0_bits_inst_rs1 == wb_waddr; // @[RocketCore.scala 669:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313862.4]
  assign _T_1636 = _T_1538 & _T_1635; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313863.4]
  assign _T_1637 = ibuf_io_inst_0_bits_inst_rs2 == wb_waddr; // @[RocketCore.scala 669:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313864.4]
  assign _T_1638 = _T_1540 & _T_1637; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313865.4]
  assign _T_1641 = _T_1636 | _T_1638; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313868.4]
  assign _T_1639 = ibuf_io_inst_0_bits_inst_rd == wb_waddr; // @[RocketCore.scala 669:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313866.4]
  assign _T_1640 = _T_1542 & _T_1639; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313867.4]
  assign _T_1642 = _T_1641 | _T_1640; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313869.4]
  assign data_hazard_wb = wb_ctrl_wxd & _T_1642; // @[RocketCore.scala 669:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313870.4]
  assign _T_1102 = io_dmem_resp_valid == 1'h0; // @[RocketCore.scala 426:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313160.4]
  assign wb_dcache_miss = wb_ctrl_mem & _T_1102; // @[RocketCore.scala 426:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313161.4]
  assign _T_1464 = wb_ctrl_div | wb_dcache_miss; // @[RocketCore.scala 562:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313602.4]
  assign wb_set_sboard = _T_1464 | wb_ctrl_rocc; // @[RocketCore.scala 562:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313603.4]
  assign _T_1654 = data_hazard_wb & wb_set_sboard; // @[RocketCore.scala 671:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313883.4]
  assign _T_1644 = io_fpu_dec_ren1 & _T_1635; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313872.4]
  assign _T_1646 = io_fpu_dec_ren2 & _T_1637; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313874.4]
  assign _T_1651 = _T_1644 | _T_1646; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313879.4]
  assign _T_1647 = ibuf_io_inst_0_bits_inst_rs3 == wb_waddr; // @[RocketCore.scala 670:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313875.4]
  assign _T_1648 = io_fpu_dec_ren3 & _T_1647; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313876.4]
  assign _T_1652 = _T_1651 | _T_1648; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313880.4]
  assign _T_1650 = io_fpu_dec_wen & _T_1639; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313878.4]
  assign _T_1653 = _T_1652 | _T_1650; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313881.4]
  assign fp_data_hazard_wb = wb_ctrl_wfd & _T_1653; // @[RocketCore.scala 670:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313882.4]
  assign _T_1655 = _T_1654 | fp_data_hazard_wb; // @[RocketCore.scala 671:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313884.4]
  assign id_wb_hazard = wb_reg_valid & _T_1655; // @[RocketCore.scala 671:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313885.4]
  assign _T_1706 = _T_1705 | id_wb_hazard; // @[RocketCore.scala 692:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313948.4]
  assign _T_1545 = _T_1544[31:1]; // @[RocketCore.scala 897:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313755.4]
  assign _GEN_250 = {{1'd0}, _T_1545}; // @[RocketCore.scala 897:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313756.4]
  assign _T_1546 = _GEN_250 << 1; // @[RocketCore.scala 897:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313756.4]
  assign _T_1552 = _T_1546 >> ibuf_io_inst_0_bits_inst_rs1; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313765.4]
  assign _T_1553 = _T_1552[0]; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313766.4]
  assign dmem_resp_valid = io_dmem_resp_valid & io_dmem_resp_bits_has_data; // @[RocketCore.scala 572:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313619.4]
  assign dmem_resp_replay = dmem_resp_valid & io_dmem_resp_bits_replay; // @[RocketCore.scala 573:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313620.4]
  assign _T_1470 = io_dmem_resp_bits_tag[0]; // @[RocketCore.scala 569:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313613.4]
  assign dmem_resp_xpu = _T_1470 == 1'h0; // @[RocketCore.scala 569:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313615.4]
  assign _T_1480 = dmem_resp_replay & dmem_resp_xpu; // @[RocketCore.scala 588:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313642.4]
  assign _T_1479 = io_rocc_resp_ready & io_rocc_resp_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313635.4]
  assign _T_1476 = div_io_resp_ready & div_io_resp_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313629.4]
  assign _GEN_214 = _T_1479 ? 1'h1 : _T_1476; // @[RocketCore.scala 581:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313636.4]
  assign ll_wen = _T_1480 ? 1'h1 : _GEN_214; // @[RocketCore.scala 588:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313643.4]
  assign dmem_resp_waddr = io_dmem_resp_bits_tag[5:1]; // @[RocketCore.scala 571:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313618.4]
  assign _GEN_213 = _T_1479 ? io_rocc_resp_bits_rd : div_io_resp_bits_tag; // @[RocketCore.scala 581:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313636.4]
  assign ll_waddr = _T_1480 ? dmem_resp_waddr : _GEN_213; // @[RocketCore.scala 588:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313643.4]
  assign _T_1554 = ll_waddr == ibuf_io_inst_0_bits_inst_rs1; // @[RocketCore.scala 646:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313767.4]
  assign _T_1555 = ll_wen & _T_1554; // @[RocketCore.scala 646:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313768.4]
  assign _T_1556 = _T_1555 == 1'h0; // @[RocketCore.scala 649:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313769.4]
  assign _T_1557 = _T_1553 & _T_1556; // @[RocketCore.scala 649:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313770.4]
  assign _T_1558 = _T_1538 & _T_1557; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313771.4]
  assign _T_1559 = _T_1546 >> ibuf_io_inst_0_bits_inst_rs2; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313772.4]
  assign _T_1560 = _T_1559[0]; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313773.4]
  assign _T_1561 = ll_waddr == ibuf_io_inst_0_bits_inst_rs2; // @[RocketCore.scala 646:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313774.4]
  assign _T_1562 = ll_wen & _T_1561; // @[RocketCore.scala 646:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313775.4]
  assign _T_1563 = _T_1562 == 1'h0; // @[RocketCore.scala 649:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313776.4]
  assign _T_1564 = _T_1560 & _T_1563; // @[RocketCore.scala 649:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313777.4]
  assign _T_1565 = _T_1540 & _T_1564; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313778.4]
  assign _T_1573 = _T_1558 | _T_1565; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313786.4]
  assign _T_1566 = _T_1546 >> ibuf_io_inst_0_bits_inst_rd; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313779.4]
  assign _T_1567 = _T_1566[0]; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313780.4]
  assign _T_1568 = ll_waddr == ibuf_io_inst_0_bits_inst_rd; // @[RocketCore.scala 646:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313781.4]
  assign _T_1569 = ll_wen & _T_1568; // @[RocketCore.scala 646:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313782.4]
  assign _T_1570 = _T_1569 == 1'h0; // @[RocketCore.scala 649:80:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313783.4]
  assign _T_1571 = _T_1567 & _T_1570; // @[RocketCore.scala 649:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313784.4]
  assign _T_1572 = _T_1542 & _T_1571; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313785.4]
  assign id_sboard_hazard = _T_1573 | _T_1572; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313787.4]
  assign _T_1707 = _T_1706 | id_sboard_hazard; // @[RocketCore.scala 692:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313949.4]
  assign _T_1708 = ex_reg_valid | mem_reg_valid; // @[RocketCore.scala 693:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313950.4]
  assign _T_1709 = _T_1708 | wb_reg_valid; // @[RocketCore.scala 693:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313951.4]
  assign _T_1710 = csr_io_singleStep & _T_1709; // @[RocketCore.scala 693:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313952.4]
  assign _T_1711 = _T_1707 | _T_1710; // @[RocketCore.scala 692:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313953.4]
  assign _T_1712 = id_csr_en & csr_io_decode_0_fp_csr; // @[RocketCore.scala 694:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313954.4]
  assign _T_1713 = io_fpu_fcsr_rdy == 1'h0; // @[RocketCore.scala 694:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313955.4]
  assign _T_1714 = _T_1712 & _T_1713; // @[RocketCore.scala 694:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313956.4]
  assign _T_1715 = _T_1711 | _T_1714; // @[RocketCore.scala 693:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313957.4]
  assign _T_1676 = _T_1657 >> ibuf_io_inst_0_bits_inst_rs1; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313914.4]
  assign _T_1677 = _T_1676[0]; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313915.4]
  assign _T_1678 = io_fpu_dec_ren1 & _T_1677; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313916.4]
  assign _T_1679 = _T_1657 >> ibuf_io_inst_0_bits_inst_rs2; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313917.4]
  assign _T_1680 = _T_1679[0]; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313918.4]
  assign _T_1681 = io_fpu_dec_ren2 & _T_1680; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313919.4]
  assign _T_1688 = _T_1678 | _T_1681; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313926.4]
  assign _T_1682 = _T_1657 >> ibuf_io_inst_0_bits_inst_rs3; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313920.4]
  assign _T_1683 = _T_1682[0]; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313921.4]
  assign _T_1684 = io_fpu_dec_ren3 & _T_1683; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313922.4]
  assign _T_1689 = _T_1688 | _T_1684; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313927.4]
  assign _T_1685 = _T_1657 >> ibuf_io_inst_0_bits_inst_rd; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313923.4]
  assign _T_1686 = _T_1685[0]; // @[RocketCore.scala 893:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313924.4]
  assign _T_1687 = io_fpu_dec_wen & _T_1686; // @[RocketCore.scala 879:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313925.4]
  assign id_stall_fpu = _T_1689 | _T_1687; // @[RocketCore.scala 879:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313928.4]
  assign _T_1716 = id_ctrl_fp & id_stall_fpu; // @[RocketCore.scala 695:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313958.4]
  assign _T_1717 = _T_1715 | _T_1716; // @[RocketCore.scala 694:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313959.4]
  assign _T_1698 = io_dmem_perf_grant == 1'h0; // @[RocketCore.scala 686:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313938.4]
  assign dcache_blocked = blocked & _T_1698; // @[RocketCore.scala 686:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313939.4]
  assign _T_1718 = id_ctrl_mem & dcache_blocked; // @[RocketCore.scala 696:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313960.4]
  assign _T_1719 = _T_1717 | _T_1718; // @[RocketCore.scala 695:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313961.4]
  assign _T_1720 = id_ctrl_rocc & rocc_blocked; // @[RocketCore.scala 697:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313962.4]
  assign _T_1721 = _T_1719 | _T_1720; // @[RocketCore.scala 696:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313963.4]
  assign wb_wxd = wb_reg_valid & wb_ctrl_wxd; // @[RocketCore.scala 561:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313601.4]
  assign _T_1722 = wb_wxd == 1'h0; // @[RocketCore.scala 698:65:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313964.4]
  assign _T_1723 = div_io_resp_valid & _T_1722; // @[RocketCore.scala 698:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313965.4]
  assign _T_1724 = div_io_req_ready | _T_1723; // @[RocketCore.scala 698:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313966.4]
  assign _T_1725 = _T_1724 == 1'h0; // @[RocketCore.scala 698:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313967.4]
  assign _T_1726 = _T_1725 | div_io_req_valid; // @[RocketCore.scala 698:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313968.4]
  assign _T_1727 = id_ctrl_div & _T_1726; // @[RocketCore.scala 698:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313969.4]
  assign _T_1728 = _T_1721 | _T_1727; // @[RocketCore.scala 697:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313970.4]
  assign _T_1731 = _T_1728 | id_do_fence; // @[RocketCore.scala 699:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313973.4]
  assign ctrl_stalld = _T_1731 | csr_io_csr_stall; // @[RocketCore.scala 700:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313974.4]
  assign _T_1735 = _T_1734 | ctrl_stalld; // @[RocketCore.scala 702:89:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313978.4]
  assign ctrl_killd = _T_1735 | csr_io_interrupt; // @[RocketCore.scala 702:104:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313979.4]
  assign _T_1060 = ctrl_killd == 1'h0; // @[RocketCore.scala 368:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313056.4]
  assign _T_1061 = take_pc_mem_wb == 1'h0; // @[RocketCore.scala 369:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313058.4]
  assign _T_1062 = _T_1061 & ibuf_io_inst_0_valid; // @[RocketCore.scala 369:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313059.4]
  assign _T_1070 = {ibuf_io_inst_0_bits_xcpt1_pf_inst,ibuf_io_inst_0_bits_xcpt1_ae_inst}; // @[RocketCore.scala 383:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313082.8]
  assign _T_1071 = _T_1070 != 2'h0; // @[RocketCore.scala 383:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313083.8]
  assign _T_1072 = {ibuf_io_inst_0_bits_xcpt0_pf_inst,ibuf_io_inst_0_bits_xcpt0_ae_inst}; // @[RocketCore.scala 388:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313089.8]
  assign _T_1073 = _T_1072 != 2'h0; // @[RocketCore.scala 388:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313090.8]
  assign _T_1074 = bpu_io_xcpt_if | _T_1073; // @[RocketCore.scala 388:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313091.8]
  assign _T_1075 = id_ctrl_fence_i | id_csr_flush; // @[RocketCore.scala 393:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313097.6]
  assign _T_1078 = {_T_1539,_T_1537}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313103.8]
  assign _T_1079 = _T_931 | _T_934; // @[RocketCore.scala 400:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313106.6]
  assign _T_1080 = _T_1079 | _T_936; // @[RocketCore.scala 400:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313107.6]
  assign do_bypass = _T_1080 | _T_938; // @[RocketCore.scala 400:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313108.6]
  assign _T_1083 = do_bypass == 1'h0; // @[RocketCore.scala 404:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313114.6]
  assign _T_1084 = id_ctrl_rxs1 & _T_1083; // @[RocketCore.scala 404:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313115.6]
  assign _T_1481 = replay_wb == 1'h0; // @[RocketCore.scala 596:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313649.4]
  assign _T_1482 = wb_reg_valid & _T_1481; // @[RocketCore.scala 596:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313650.4]
  assign _T_1483 = wb_xcpt == 1'h0; // @[RocketCore.scala 596:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313651.4]
  assign wb_valid = _T_1482 & _T_1483; // @[RocketCore.scala 596:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313652.4]
  assign wb_wen = wb_valid & wb_ctrl_wxd; // @[RocketCore.scala 597:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313653.4]
  assign rf_wen = wb_wen | ll_wen; // @[RocketCore.scala 598:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313654.4]
  assign rf_waddr = ll_wen ? ll_waddr : wb_waddr; // @[RocketCore.scala 599:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313655.4]
  assign _T_1490 = rf_waddr != 5'h0; // @[RocketCore.scala 922:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313664.6]
  assign _T_1494 = rf_waddr == ibuf_io_inst_0_bits_inst_rs1; // @[RocketCore.scala 925:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313670.8]
  assign _T_1484 = dmem_resp_valid & dmem_resp_xpu; // @[RocketCore.scala 600:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313656.4]
  assign ll_wdata = _T_1479 ? io_rocc_resp_bits_data : div_io_resp_bits_data; // @[RocketCore.scala 581:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313636.4]
  assign _T_1486 = wb_ctrl_csr != 3'h0; // @[RocketCore.scala 602:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313658.4]
  assign _T_1488 = _T_1486 ? csr_io_rw_rdata : wb_reg_wdata; // @[RocketCore.scala 602:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313660.4]
  assign _T_1489 = ll_wen ? ll_wdata : _T_1488; // @[RocketCore.scala 601:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313661.4]
  assign rf_wdata = _T_1484 ? io_dmem_resp_bits_data : _T_1489; // @[RocketCore.scala 600:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313662.4]
  assign _GEN_219 = _T_1494 ? rf_wdata : _T_760; // @[RocketCore.scala 925:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313671.8]
  assign _GEN_226 = _T_1490 ? _GEN_219 : _T_760; // @[RocketCore.scala 922:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313665.6]
  assign _GEN_233 = rf_wen ? _GEN_226 : _T_760; // @[RocketCore.scala 605:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313663.4]
  assign _T_1085 = _GEN_233[1:0]; // @[RocketCore.scala 405:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313117.8]
  assign _T_1086 = _GEN_233[63:2]; // @[RocketCore.scala 406:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313119.8]
  assign _T_1087 = _T_939 | _T_942; // @[RocketCore.scala 400:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313122.6]
  assign _T_1088 = _T_1087 | _T_944; // @[RocketCore.scala 400:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313123.6]
  assign do_bypass_1 = _T_1088 | _T_946; // @[RocketCore.scala 400:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313124.6]
  assign _T_1091 = do_bypass_1 == 1'h0; // @[RocketCore.scala 404:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313130.6]
  assign _T_1092 = id_ctrl_rxs2 & _T_1091; // @[RocketCore.scala 404:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313131.6]
  assign _T_1495 = rf_waddr == ibuf_io_inst_0_bits_inst_rs2; // @[RocketCore.scala 925:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313674.8]
  assign _GEN_220 = _T_1495 ? rf_wdata : _T_768; // @[RocketCore.scala 925:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313675.8]
  assign _GEN_227 = _T_1490 ? _GEN_220 : _T_768; // @[RocketCore.scala 922:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313665.6]
  assign _GEN_234 = rf_wen ? _GEN_227 : _T_768; // @[RocketCore.scala 605:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313663.4]
  assign _T_1093 = _GEN_234[1:0]; // @[RocketCore.scala 405:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313133.8]
  assign _T_1094 = _GEN_234[63:2]; // @[RocketCore.scala 406:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313135.8]
  assign _T_1095 = ibuf_io_inst_0_bits_raw[15:0]; // @[RocketCore.scala 410:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313139.8]
  assign inst = ibuf_io_inst_0_bits_rvc ? {{16'd0}, _T_1095} : ibuf_io_inst_0_bits_raw; // @[RocketCore.scala 410:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313140.8]
  assign _T_1096 = inst[1:0]; // @[RocketCore.scala 412:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313142.8]
  assign _T_1097 = inst[31:2]; // @[RocketCore.scala 413:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313144.8]
  assign _T_1633 = mem_reg_valid & data_hazard_mem; // @[RocketCore.scala 666:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313859.4]
  assign id_load_use = _T_1633 & mem_ctrl_mem; // @[RocketCore.scala 666:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313860.4]
  assign _T_1099 = _T_1060 | csr_io_interrupt; // @[RocketCore.scala 416:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313149.4]
  assign _T_1100 = _T_1099 | ibuf_io_inst_0_bits_replay; // @[RocketCore.scala 416:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313150.4]
  assign _T_1103 = io_dmem_req_ready == 1'h0; // @[RocketCore.scala 427:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313162.4]
  assign _T_1104 = ex_ctrl_mem & _T_1103; // @[RocketCore.scala 427:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313163.4]
  assign _T_1105 = div_io_req_ready == 1'h0; // @[RocketCore.scala 428:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313164.4]
  assign _T_1106 = ex_ctrl_div & _T_1105; // @[RocketCore.scala 428:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313165.4]
  assign replay_ex_structural = _T_1104 | _T_1106; // @[RocketCore.scala 427:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313166.4]
  assign replay_ex_load_use = wb_dcache_miss & ex_reg_load_use; // @[RocketCore.scala 429:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313167.4]
  assign _T_1107 = replay_ex_structural | replay_ex_load_use; // @[RocketCore.scala 430:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313168.4]
  assign _T_1108 = ex_reg_valid & _T_1107; // @[RocketCore.scala 430:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313169.4]
  assign replay_ex = ex_reg_replay | _T_1108; // @[RocketCore.scala 430:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313170.4]
  assign _T_1109 = take_pc_mem_wb | replay_ex; // @[RocketCore.scala 431:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313171.4]
  assign _T_1110 = ex_reg_valid == 1'h0; // @[RocketCore.scala 431:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313172.4]
  assign ctrl_killx = _T_1109 | _T_1110; // @[RocketCore.scala 431:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313173.4]
  assign _T_1111 = ex_ctrl_mem_cmd == 5'h7; // @[RocketCore.scala 433:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313174.4]
  assign _T_1122 = 3'h0 == ex_ctrl_mem_type; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313181.4]
  assign _T_1123 = 3'h4 == ex_ctrl_mem_type; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313182.4]
  assign _T_1124 = 3'h1 == ex_ctrl_mem_type; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313183.4]
  assign _T_1125 = 3'h5 == ex_ctrl_mem_type; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313184.4]
  assign _T_1127 = _T_1122 | _T_1123; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313186.4]
  assign _T_1128 = _T_1127 | _T_1124; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313187.4]
  assign _T_1129 = _T_1128 | _T_1125; // @[RocketCore.scala 433:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313188.4]
  assign ex_slow_bypass = _T_1111 | _T_1129; // @[RocketCore.scala 433:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313189.4]
  assign _T_1131 = ex_ctrl_mem_cmd == 5'h14; // @[RocketCore.scala 434:67:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313191.4]
  assign ex_sfence = ex_ctrl_mem & _T_1131; // @[RocketCore.scala 434:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313192.4]
  assign ex_xcpt = ex_reg_xcpt_interrupt | ex_reg_xcpt; // @[RocketCore.scala 437:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313193.4]
  assign _T_1142 = mem_reg_valid | mem_reg_replay; // @[RocketCore.scala 443:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313204.4]
  assign mem_pc_valid = _T_1142 | mem_reg_xcpt_interrupt; // @[RocketCore.scala 443:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313205.4]
  assign _T_1294 = mem_npc[1]; // @[RocketCore.scala 452:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313362.4]
  assign _T_1295 = _T_870 & _T_1294; // @[RocketCore.scala 452:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313363.4]
  assign _T_1296 = mem_reg_sfence == 1'h0; // @[RocketCore.scala 452:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313364.4]
  assign mem_npc_misaligned = _T_1295 & _T_1296; // @[RocketCore.scala 452:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313365.4]
  assign _T_1297 = mem_reg_xcpt == 1'h0; // @[RocketCore.scala 453:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313366.4]
  assign _T_1298 = mem_ctrl_jalr ^ mem_npc_misaligned; // @[RocketCore.scala 453:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313367.4]
  assign _T_1299 = _T_1297 & _T_1298; // @[RocketCore.scala 453:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313368.4]
  assign _T_1301 = _T_1299 ? $signed({{24{mem_br_target[39]}},mem_br_target}) : $signed(_T_1275); // @[RocketCore.scala 453:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313370.4]
  assign mem_int_wdata = $unsigned(_T_1301); // @[RocketCore.scala 453:119:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313371.4]
  assign _T_1302 = mem_ctrl_branch | mem_ctrl_jalr; // @[RocketCore.scala 454:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313372.4]
  assign mem_cfi = _T_1302 | mem_ctrl_jal; // @[RocketCore.scala 454:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313373.4]
  assign _T_1304 = _T_1144 | mem_ctrl_jalr; // @[RocketCore.scala 455:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313375.4]
  assign mem_cfi_taken = _T_1304 | mem_ctrl_jal; // @[RocketCore.scala 455:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313376.4]
  assign _T_1309 = ctrl_killx == 1'h0; // @[RocketCore.scala 460:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313383.4]
  assign _T_1316 = mem_reg_valid & mem_reg_flush_pipe; // @[RocketCore.scala 467:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313394.4]
  assign _T_1317 = ex_ctrl_mem_cmd == 5'h0; // @[Consts.scala 93:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313402.8]
  assign _T_1318 = ex_ctrl_mem_cmd == 5'h6; // @[Consts.scala 93:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313403.8]
  assign _T_1319 = _T_1317 | _T_1318; // @[Consts.scala 93:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313404.8]
  assign _T_1321 = _T_1319 | _T_1111; // @[Consts.scala 93:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313406.8]
  assign _T_1322 = ex_ctrl_mem_cmd == 5'h4; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313407.8]
  assign _T_1323 = ex_ctrl_mem_cmd == 5'h9; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313408.8]
  assign _T_1324 = ex_ctrl_mem_cmd == 5'ha; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313409.8]
  assign _T_1325 = ex_ctrl_mem_cmd == 5'hb; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313410.8]
  assign _T_1326 = _T_1322 | _T_1323; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313411.8]
  assign _T_1327 = _T_1326 | _T_1324; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313412.8]
  assign _T_1328 = _T_1327 | _T_1325; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313413.8]
  assign _T_1329 = ex_ctrl_mem_cmd == 5'h8; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313414.8]
  assign _T_1330 = ex_ctrl_mem_cmd == 5'hc; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313415.8]
  assign _T_1331 = ex_ctrl_mem_cmd == 5'hd; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313416.8]
  assign _T_1332 = ex_ctrl_mem_cmd == 5'he; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313417.8]
  assign _T_1333 = ex_ctrl_mem_cmd == 5'hf; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313418.8]
  assign _T_1334 = _T_1329 | _T_1330; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313419.8]
  assign _T_1335 = _T_1334 | _T_1331; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313420.8]
  assign _T_1336 = _T_1335 | _T_1332; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313421.8]
  assign _T_1337 = _T_1336 | _T_1333; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313422.8]
  assign _T_1338 = _T_1328 | _T_1337; // @[Consts.scala 91:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313423.8]
  assign _T_1339 = _T_1321 | _T_1338; // @[Consts.scala 93:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313424.8]
  assign _T_1340 = ex_ctrl_mem & _T_1339; // @[RocketCore.scala 472:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313425.8]
  assign _T_1341 = ex_ctrl_mem_cmd == 5'h1; // @[Consts.scala 94:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313427.8]
  assign _T_1342 = ex_ctrl_mem_cmd == 5'h11; // @[Consts.scala 94:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313428.8]
  assign _T_1343 = _T_1341 | _T_1342; // @[Consts.scala 94:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313429.8]
  assign _T_1345 = _T_1343 | _T_1111; // @[Consts.scala 94:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313431.8]
  assign _T_1363 = _T_1345 | _T_1338; // @[Consts.scala 94:76:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313449.8]
  assign _T_1364 = ex_ctrl_mem & _T_1363; // @[RocketCore.scala 473:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313450.8]
  assign _T_1365 = ex_ctrl_mem | ex_ctrl_rocc; // @[RocketCore.scala 486:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313462.8]
  assign _T_1366 = _T_1365 | ex_sfence; // @[RocketCore.scala 486:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313463.8]
  assign _T_1367 = ex_ctrl_rxs2 & _T_1366; // @[RocketCore.scala 486:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313464.8]
  assign typ = ex_ctrl_rocc ? 3'h3 : ex_ctrl_mem_type; // @[RocketCore.scala 487:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313466.10]
  assign _T_1368 = typ[1:0]; // @[AMOALU.scala 10:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313467.10]
  assign _T_1369 = _T_1368 == 2'h0; // @[AMOALU.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313468.10]
  assign _T_1370 = _T_983[7:0]; // @[AMOALU.scala 26:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313469.10]
  assign _T_1371 = {_T_1370,_T_1370}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313470.10]
  assign _T_1372 = {_T_1371,_T_1371}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313471.10]
  assign _T_1373 = {_T_1372,_T_1372}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313472.10]
  assign _T_1374 = _T_1368 == 2'h1; // @[AMOALU.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313473.10]
  assign _T_1375 = _T_983[15:0]; // @[AMOALU.scala 26:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313474.10]
  assign _T_1376 = {_T_1375,_T_1375}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313475.10]
  assign _T_1377 = {_T_1376,_T_1376}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313476.10]
  assign _T_1378 = _T_1368 == 2'h2; // @[AMOALU.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313477.10]
  assign _T_1379 = _T_983[31:0]; // @[AMOALU.scala 26:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313478.10]
  assign _T_1380 = {_T_1379,_T_1379}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313479.10]
  assign _T_1384 = ex_ctrl_jalr & csr_io_status_debug; // @[RocketCore.scala 490:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313485.8]
  assign _T_1385 = mem_reg_load & bpu_io_xcpt_ld; // @[RocketCore.scala 497:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313491.4]
  assign _T_1386 = mem_reg_store & bpu_io_xcpt_st; // @[RocketCore.scala 497:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313492.4]
  assign mem_breakpoint = _T_1385 | _T_1386; // @[RocketCore.scala 497:57:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313493.4]
  assign _T_1387 = mem_reg_load & bpu_io_debug_ld; // @[RocketCore.scala 498:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313494.4]
  assign _T_1388 = mem_reg_store & bpu_io_debug_st; // @[RocketCore.scala 498:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313495.4]
  assign mem_debug_breakpoint = _T_1387 | _T_1388; // @[RocketCore.scala 498:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313496.4]
  assign mem_ldst_xcpt = mem_debug_breakpoint | mem_breakpoint; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313497.4]
  assign mem_ldst_cause = mem_debug_breakpoint ? 4'he : 4'h3; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313498.4]
  assign _T_1389 = mem_reg_xcpt_interrupt | mem_reg_xcpt; // @[RocketCore.scala 504:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313499.4]
  assign _T_1390 = mem_reg_valid & mem_npc_misaligned; // @[RocketCore.scala 505:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313500.4]
  assign _T_1391 = mem_reg_valid & mem_ldst_xcpt; // @[RocketCore.scala 506:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313501.4]
  assign _T_1392 = _T_1389 | _T_1390; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313502.4]
  assign mem_xcpt = _T_1392 | _T_1391; // @[RocketCore.scala 870:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313503.4]
  assign _T_1393 = _T_1390 ? 4'h0 : mem_ldst_cause; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313504.4]
  assign dcache_kill_mem = _T_927 & io_dmem_replay_next; // @[RocketCore.scala 515:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313519.4]
  assign _T_1407 = mem_reg_valid & mem_ctrl_fp; // @[RocketCore.scala 516:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313520.4]
  assign fpu_kill_mem = _T_1407 & io_fpu_nack_mem; // @[RocketCore.scala 516:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313521.4]
  assign _T_1408 = dcache_kill_mem | mem_reg_replay; // @[RocketCore.scala 517:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313522.4]
  assign replay_mem = _T_1408 | fpu_kill_mem; // @[RocketCore.scala 517:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313523.4]
  assign _T_1409 = dcache_kill_mem | take_pc_wb; // @[RocketCore.scala 518:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313524.4]
  assign _T_1410 = _T_1409 | mem_reg_xcpt; // @[RocketCore.scala 518:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313525.4]
  assign _T_1411 = mem_reg_valid == 1'h0; // @[RocketCore.scala 518:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313526.4]
  assign killm_common = _T_1410 | _T_1411; // @[RocketCore.scala 518:68:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313527.4]
  assign _T_1416 = killm_common | mem_xcpt; // @[RocketCore.scala 520:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313533.4]
  assign ctrl_killm = _T_1416 | fpu_kill_mem; // @[RocketCore.scala 520:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313534.4]
  assign _T_1417 = ctrl_killm == 1'h0; // @[RocketCore.scala 523:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313535.4]
  assign _T_1418 = take_pc_wb == 1'h0; // @[RocketCore.scala 524:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313537.4]
  assign _T_1425 = _T_1297 & mem_ctrl_fp; // @[RocketCore.scala 530:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313550.6]
  assign _T_1426 = _T_1425 & mem_ctrl_wxd; // @[RocketCore.scala 530:54:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313551.6]
  assign _T_1428 = mem_ctrl_rocc | mem_reg_sfence; // @[RocketCore.scala 531:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313554.6]
  assign _T_1446 = _T_1438 ? 3'h7 : 3'h5; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313581.4]
  assign _T_1447 = _T_1436 ? 4'hd : {{1'd0}, _T_1446}; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313582.4]
  assign _T_1448 = _T_1434 ? 4'hf : _T_1447; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313583.4]
  assign _T_1449 = _T_1432 ? 4'h4 : _T_1448; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313584.4]
  assign _T_1450 = _T_1430 ? 4'h6 : _T_1449; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313585.4]
  assign wb_cause = wb_reg_xcpt ? wb_reg_cause : {{60'd0}, _T_1450}; // @[Mux.scala 31:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313586.4]
  assign _T_1451 = wb_cause == 64'h6; // @[RocketCore.scala 874:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313587.4]
  assign _T_1453 = wb_cause == 64'h4; // @[RocketCore.scala 874:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313589.4]
  assign _T_1455 = wb_cause == 64'hf; // @[RocketCore.scala 874:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313591.4]
  assign _T_1457 = wb_cause == 64'hd; // @[RocketCore.scala 874:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313593.4]
  assign _T_1459 = wb_cause == 64'h7; // @[RocketCore.scala 874:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313595.4]
  assign _T_1461 = wb_cause == 64'h5; // @[RocketCore.scala 874:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313597.4]
  assign _GEN_211 = _T_1479 ? 1'h0 : _T_1722; // @[RocketCore.scala 581:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313636.4]
  assign _T_1497 = wb_reg_raw_inst[1:0]; // @[RocketCore.scala 613:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313686.4]
  assign _T_1498 = ~ _T_1497; // @[RocketCore.scala 613:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313687.4]
  assign _T_1499 = _T_1498 == 2'h0; // @[RocketCore.scala 613:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313688.4]
  assign _T_1500 = wb_reg_inst[31:16]; // @[RocketCore.scala 613:91:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313689.4]
  assign _T_1501 = _T_1499 ? _T_1500 : 16'h0; // @[RocketCore.scala 613:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313690.4]
  assign _T_1502 = wb_reg_raw_inst[15:0]; // @[RocketCore.scala 613:119:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313691.4]
  assign _T_1504 = wb_cause == 64'h2; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313700.4]
  assign _T_1505 = wb_cause == 64'h3; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313701.4]
  assign _T_1510 = wb_cause == 64'h1; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313706.4]
  assign _T_1513 = wb_cause == 64'hc; // @[package.scala 14:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313709.4]
  assign _T_1514 = _T_1504 | _T_1505; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313710.4]
  assign _T_1515 = _T_1514 | _T_1453; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313711.4]
  assign _T_1516 = _T_1515 | _T_1451; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313712.4]
  assign _T_1517 = _T_1516 | _T_1461; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313713.4]
  assign _T_1518 = _T_1517 | _T_1459; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313714.4]
  assign _T_1519 = _T_1518 | _T_1510; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313715.4]
  assign _T_1520 = _T_1519 | _T_1457; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313716.4]
  assign _T_1521 = _T_1520 | _T_1455; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313717.4]
  assign _T_1522 = _T_1521 | _T_1513; // @[package.scala 14:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313718.4]
  assign tval_valid = wb_xcpt & _T_1522; // @[RocketCore.scala 620:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313719.4]
  assign _T_1523 = $signed(wb_reg_wdata); // @[RocketCore.scala 884:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313720.4]
  assign a_1 = _T_1523[63:39]; // @[RocketCore.scala 884:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313721.4]
  assign _T_1524 = $signed(a_1) == $signed(25'sh0); // @[RocketCore.scala 885:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313722.4]
  assign _T_1525 = $signed(a_1) == $signed(-25'sh1); // @[RocketCore.scala 885:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313723.4]
  assign _T_1526 = _T_1524 | _T_1525; // @[RocketCore.scala 885:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313724.4]
  assign _T_1527 = wb_reg_wdata[39]; // @[RocketCore.scala 885:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313725.4]
  assign _T_1528 = wb_reg_wdata[38]; // @[RocketCore.scala 885:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313726.4]
  assign _T_1529 = _T_1528 == 1'h0; // @[RocketCore.scala 885:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313727.4]
  assign msb_1 = _T_1526 ? _T_1527 : _T_1529; // @[RocketCore.scala 885:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313728.4]
  assign _T_1530 = wb_reg_wdata[38:0]; // @[RocketCore.scala 886:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313729.4]
  assign _T_1531 = {msb_1,_T_1530}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313730.4]
  assign _T_1534 = wb_reg_valid ? 3'h0 : 3'h4; // @[CSR.scala 128:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313742.4]
  assign _T_1535 = ~ _T_1534; // @[CSR.scala 128:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313743.4]
  assign _T_1547 = 32'h1 << ll_waddr; // @[RocketCore.scala 900:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313757.4]
  assign _T_1548 = ll_wen ? _T_1547 : 32'h0; // @[RocketCore.scala 900:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313758.4]
  assign _T_1549 = ~ _T_1548; // @[RocketCore.scala 892:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313759.4]
  assign _T_1550 = _T_1546 & _T_1549; // @[RocketCore.scala 892:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313760.4]
  assign _T_1574 = wb_set_sboard & wb_wen; // @[RocketCore.scala 650:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313788.4]
  assign _T_1575 = 32'h1 << wb_waddr; // @[RocketCore.scala 900:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313789.4]
  assign _T_1576 = _T_1574 ? _T_1575 : 32'h0; // @[RocketCore.scala 900:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313790.4]
  assign _T_1577 = _T_1550 | _T_1576; // @[RocketCore.scala 891:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313791.4]
  assign _T_1578 = ll_wen | _T_1574; // @[RocketCore.scala 903:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313792.4]
  assign _T_1658 = wb_dcache_miss & wb_ctrl_wfd; // @[RocketCore.scala 675:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313887.4]
  assign _T_1659 = _T_1658 | io_fpu_sboard_set; // @[RocketCore.scala 675:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313888.4]
  assign _T_1660 = _T_1659 & wb_valid; // @[RocketCore.scala 675:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313889.4]
  assign _T_1662 = _T_1660 ? _T_1575 : 32'h0; // @[RocketCore.scala 900:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313891.4]
  assign _T_1663 = _T_1657 | _T_1662; // @[RocketCore.scala 891:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313892.4]
  assign _T_1665 = dmem_resp_replay & _T_1470; // @[RocketCore.scala 676:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313897.4]
  assign _T_1666 = 32'h1 << dmem_resp_waddr; // @[RocketCore.scala 900:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313898.4]
  assign _T_1667 = _T_1665 ? _T_1666 : 32'h0; // @[RocketCore.scala 900:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313899.4]
  assign _T_1668 = ~ _T_1667; // @[RocketCore.scala 892:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313900.4]
  assign _T_1669 = _T_1663 & _T_1668; // @[RocketCore.scala 892:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313901.4]
  assign _T_1670 = _T_1660 | _T_1665; // @[RocketCore.scala 903:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313902.4]
  assign _T_1671 = 32'h1 << io_fpu_sboard_clra; // @[RocketCore.scala 900:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313906.4]
  assign _T_1672 = io_fpu_sboard_clr ? _T_1671 : 32'h0; // @[RocketCore.scala 900:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313907.4]
  assign _T_1673 = ~ _T_1672; // @[RocketCore.scala 892:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313908.4]
  assign _T_1674 = _T_1669 & _T_1673; // @[RocketCore.scala 892:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313909.4]
  assign _T_1675 = _T_1670 | io_fpu_sboard_clr; // @[RocketCore.scala 903:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313910.4]
  assign _T_1692 = _T_1103 & io_dmem_clock_enabled; // @[RocketCore.scala 685:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313931.4]
  assign _T_1694 = _T_1692 & _T_1698; // @[RocketCore.scala 685:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313933.4]
  assign _T_1695 = blocked | io_dmem_req_valid; // @[RocketCore.scala 685:95:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313934.4]
  assign _T_1696 = _T_1695 | io_dmem_s2_nack; // @[RocketCore.scala 685:116:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313935.4]
  assign _T_1702 = _T_1483 & _T_1466; // @[RocketCore.scala 689:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313943.4]
  assign _T_1703 = io_rocc_cmd_valid | rocc_blocked; // @[RocketCore.scala 689:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313944.4]
  assign _T_1738 = wb_xcpt | csr_io_eret; // @[RocketCore.scala 707:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313984.4]
  assign _T_1739 = replay_wb ? wb_reg_pc : mem_npc; // @[RocketCore.scala 708:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313985.4]
  assign _T_1741 = wb_reg_valid & wb_ctrl_fence_i; // @[RocketCore.scala 710:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313988.4]
  assign _T_1742 = io_dmem_s2_nack == 1'h0; // @[RocketCore.scala 710:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313989.4]
  assign _T_1744 = ex_pc_valid | mem_pc_valid; // @[RocketCore.scala 712:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313992.4]
  assign _T_1745 = io_ptw_customCSRs_csrs_0_value[1]; // @[CustomCSRs.scala 38:61:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313993.4]
  assign _T_1752 = mem_reg_valid & _T_1418; // @[RocketCore.scala 724:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314009.4]
  assign _T_1753 = _T_1752 & mem_wrong_npc; // @[RocketCore.scala 724:60:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314010.4]
  assign _T_1754 = mem_cfi == 1'h0; // @[RocketCore.scala 724:81:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314011.4]
  assign _T_1755 = _T_1754 | mem_cfi_taken; // @[RocketCore.scala 724:90:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314012.4]
  assign _T_1757 = mem_ctrl_jal | mem_ctrl_jalr; // @[RocketCore.scala 727:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314016.4]
  assign _T_1758 = mem_waddr[0]; // @[RocketCore.scala 727:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314017.4]
  assign _T_1759 = _T_1757 & _T_1758; // @[RocketCore.scala 727:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314018.4]
  assign _T_1760 = mem_reg_inst[19:15]; // @[RocketCore.scala 728:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314019.4]
  assign _T_1761 = _T_1760 & 5'h1b; // @[RocketCore.scala 728:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314020.4]
  assign _T_1762 = 5'h1 == _T_1761; // @[RocketCore.scala 728:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314021.4]
  assign _T_1763 = mem_ctrl_jalr & _T_1762; // @[RocketCore.scala 728:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314022.4]
  assign _T_1766 = _T_1763 ? 2'h3 : {{1'd0}, _T_1757}; // @[RocketCore.scala 728:8:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314025.4]
  assign _T_1768 = mem_reg_rvc ? 2'h0 : 2'h2; // @[RocketCore.scala 732:74:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314029.4]
  assign _GEN_251 = {{38'd0}, _T_1768}; // @[RocketCore.scala 732:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314030.4]
  assign _T_1770 = mem_reg_pc + _GEN_251; // @[RocketCore.scala 732:69:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314031.4]
  assign _T_1771 = ~ io_imem_btb_update_bits_br_pc; // @[RocketCore.scala 733:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314033.4]
  assign _T_1772 = _T_1771 | 39'h3; // @[RocketCore.scala 733:66:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314034.4]
  assign ex_dcache_tag = {ex_waddr,ex_ctrl_fp}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314062.4]
  assign a_2 = _T_1045[63:39]; // @[RocketCore.scala 884:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314068.4]
  assign _T_1782 = $signed(a_2) == $signed(25'sh0); // @[RocketCore.scala 885:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314069.4]
  assign _T_1783 = $signed(a_2) == $signed(-25'sh1); // @[RocketCore.scala 885:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314070.4]
  assign _T_1784 = _T_1782 | _T_1783; // @[RocketCore.scala 885:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314071.4]
  assign _T_1785 = alu_io_adder_out[39]; // @[RocketCore.scala 885:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314072.4]
  assign _T_1786 = alu_io_adder_out[38]; // @[RocketCore.scala 885:62:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314073.4]
  assign _T_1787 = _T_1786 == 1'h0; // @[RocketCore.scala 885:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314074.4]
  assign msb_2 = _T_1784 ? _T_1785 : _T_1787; // @[RocketCore.scala 885:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314075.4]
  assign _T_1788 = alu_io_adder_out[38:0]; // @[RocketCore.scala 886:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314076.4]
  assign _T_1791 = killm_common | mem_ldst_xcpt; // @[RocketCore.scala 763:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314081.4]
  assign _T_1795 = replay_wb_common == 1'h0; // @[RocketCore.scala 768:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314088.4]
  assign _T_1797 = csr_io_status_xs != 2'h0; // @[RocketCore.scala 769:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314091.4]
  assign _T_1809 = wb_reg_inst[19:15]; // @[RocketCore.scala 771:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314110.4]
  assign _T_1810 = wb_reg_inst[24:20]; // @[RocketCore.scala 771:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314112.4]
  assign coreMonitorBundle_time = csr_io_time[31:0]; // @[RocketCore.scala 811:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314126.4]
  assign _T_1817 = csr_io_trace_0_exception == 1'h0; // @[RocketCore.scala 812:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314128.4]
  assign coreMonitorBundle_valid = csr_io_trace_0_valid & _T_1817; // @[RocketCore.scala 812:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314129.4]
  assign coreMonitorBundle_pc = csr_io_trace_0_iaddr; // @[RocketCore.scala 813:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314131.4]
  assign _T_1821 = _T_1574 == 1'h0; // @[RocketCore.scala 814:44:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314134.4]
  assign _T_1822 = rf_wen & _T_1821; // @[RocketCore.scala 814:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314135.4]
  assign coreMonitorBundle_wrdst = _T_1822 ? rf_waddr : 5'h0; // @[RocketCore.scala 814:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314136.4]
  assign _T_1835 = reset == 1'h0; // @[RocketCore.scala 852:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314156.4]
  assign coreMonitorBundle_inst = csr_io_trace_0_insn; // @[RocketCore.scala 808:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314123.4 RocketCore.scala 821:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314154.4]
  assign io_imem_might_request = imem_might_request_reg; // @[RocketCore.scala 711:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313996.4]
  assign io_imem_req_valid = take_pc_wb | take_pc_mem; // @[RocketCore.scala 704:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313981.4]
  assign io_imem_req_bits_pc = _T_1738 ? csr_io_evec : _T_1739; // @[RocketCore.scala 706:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313987.4]
  assign io_imem_req_bits_speculative = take_pc_wb == 1'h0; // @[RocketCore.scala 705:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313983.4]
  assign io_imem_sfence_valid = wb_reg_valid & wb_reg_sfence; // @[RocketCore.scala 715:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313998.4]
  assign io_imem_sfence_bits_rs1 = wb_ctrl_mem_type[0]; // @[RocketCore.scala 716:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314000.4]
  assign io_imem_sfence_bits_rs2 = wb_ctrl_mem_type[1]; // @[RocketCore.scala 717:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314002.4]
  assign io_imem_sfence_bits_addr = wb_reg_wdata[38:0]; // @[RocketCore.scala 718:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314003.4]
  assign io_imem_resp_ready = ibuf_io_imem_ready; // @[RocketCore.scala 226:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312188.4]
  assign io_imem_btb_update_valid = _T_1753 & _T_1755; // @[RocketCore.scala 724:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314014.4]
  assign io_imem_btb_update_bits_prediction_entry = mem_reg_btb_resp_entry; // @[RocketCore.scala 734:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314037.4]
  assign io_imem_btb_update_bits_pc = ~ _T_1772; // @[RocketCore.scala 733:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314036.4]
  assign io_imem_btb_update_bits_isValid = _T_1302 | mem_ctrl_jal; // @[RocketCore.scala 725:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314015.4]
  assign io_imem_btb_update_bits_br_pc = _T_1770[38:0]; // @[RocketCore.scala 732:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314032.4]
  assign io_imem_btb_update_bits_cfiType = _T_1759 ? 2'h2 : _T_1766; // @[RocketCore.scala 726:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314027.4]
  assign io_imem_bht_update_valid = mem_reg_valid & _T_1418; // @[RocketCore.scala 736:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314040.4]
  assign io_imem_bht_update_bits_prediction_history = mem_reg_btb_resp_bht_history; // @[RocketCore.scala 741:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314045.4]
  assign io_imem_bht_update_bits_pc = io_imem_btb_update_bits_pc; // @[RocketCore.scala 737:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314041.4]
  assign io_imem_bht_update_bits_branch = mem_ctrl_branch; // @[RocketCore.scala 740:34:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314044.4]
  assign io_imem_bht_update_bits_taken = mem_br_taken; // @[RocketCore.scala 738:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314042.4]
  assign io_imem_bht_update_bits_mispredict = ex_pc_valid ? _T_1288 : _T_1291; // @[RocketCore.scala 739:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314043.4]
  assign io_imem_flush_icache = _T_1741 & _T_1742; // @[RocketCore.scala 710:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313991.4]
  assign io_dmem_req_valid = ex_reg_valid & ex_ctrl_mem; // @[RocketCore.scala 754:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314061.4]
  assign io_dmem_req_bits_addr = {msb_2,_T_1788}; // @[RocketCore.scala 761:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314078.4]
  assign io_dmem_req_bits_tag = {{2'd0}, ex_dcache_tag}; // @[RocketCore.scala 757:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314063.4]
  assign io_dmem_req_bits_cmd = ex_ctrl_mem_cmd; // @[RocketCore.scala 758:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314064.4]
  assign io_dmem_req_bits_typ = ex_ctrl_mem_type; // @[RocketCore.scala 759:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314065.4]
  assign io_dmem_s1_kill = _T_1791 | fpu_kill_mem; // @[RocketCore.scala 763:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314083.4]
  assign io_dmem_s1_data_data = mem_ctrl_fp ? io_fpu_store_data : mem_reg_rs2; // @[RocketCore.scala 762:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314080.4]
  assign io_dmem_keep_clock_enabled = ibuf_io_inst_0_valid & id_ctrl_mem; // @[RocketCore.scala 766:30:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314086.4]
  assign io_ptw_ptbr_mode = csr_io_ptbr_mode; // @[RocketCore.scala 625:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313733.4]
  assign io_ptw_ptbr_ppn = csr_io_ptbr_ppn; // @[RocketCore.scala 625:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313733.4]
  assign io_ptw_sfence_valid = io_imem_sfence_valid; // @[RocketCore.scala 720:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314005.4]
  assign io_ptw_sfence_bits_rs1 = io_imem_sfence_bits_rs1; // @[RocketCore.scala 720:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314005.4]
  assign io_ptw_status_dprv = csr_io_status_dprv; // @[RocketCore.scala 627:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313738.4]
  assign io_ptw_status_prv = csr_io_status_prv; // @[RocketCore.scala 627:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313738.4]
  assign io_ptw_status_mxr = csr_io_status_mxr; // @[RocketCore.scala 627:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313738.4]
  assign io_ptw_status_sum = csr_io_status_sum; // @[RocketCore.scala 627:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313738.4]
  assign io_ptw_pmp_0_cfg_l = csr_io_pmp_0_cfg_l; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_0_cfg_a = csr_io_pmp_0_cfg_a; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_0_cfg_x = csr_io_pmp_0_cfg_x; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_0_cfg_w = csr_io_pmp_0_cfg_w; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_0_cfg_r = csr_io_pmp_0_cfg_r; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_0_addr = csr_io_pmp_0_addr; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_0_mask = csr_io_pmp_0_mask; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_1_cfg_l = csr_io_pmp_1_cfg_l; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_1_cfg_a = csr_io_pmp_1_cfg_a; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_1_cfg_x = csr_io_pmp_1_cfg_x; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_1_cfg_w = csr_io_pmp_1_cfg_w; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_1_cfg_r = csr_io_pmp_1_cfg_r; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_1_addr = csr_io_pmp_1_addr; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_1_mask = csr_io_pmp_1_mask; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_2_cfg_l = csr_io_pmp_2_cfg_l; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_2_cfg_a = csr_io_pmp_2_cfg_a; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_2_cfg_x = csr_io_pmp_2_cfg_x; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_2_cfg_w = csr_io_pmp_2_cfg_w; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_2_cfg_r = csr_io_pmp_2_cfg_r; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_2_addr = csr_io_pmp_2_addr; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_2_mask = csr_io_pmp_2_mask; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_3_cfg_l = csr_io_pmp_3_cfg_l; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_3_cfg_a = csr_io_pmp_3_cfg_a; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_3_cfg_x = csr_io_pmp_3_cfg_x; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_3_cfg_w = csr_io_pmp_3_cfg_w; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_3_cfg_r = csr_io_pmp_3_cfg_r; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_3_addr = csr_io_pmp_3_addr; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_3_mask = csr_io_pmp_3_mask; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_4_cfg_l = csr_io_pmp_4_cfg_l; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_4_cfg_a = csr_io_pmp_4_cfg_a; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_4_cfg_x = csr_io_pmp_4_cfg_x; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_4_cfg_w = csr_io_pmp_4_cfg_w; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_4_cfg_r = csr_io_pmp_4_cfg_r; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_4_addr = csr_io_pmp_4_addr; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_4_mask = csr_io_pmp_4_mask; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_5_cfg_l = csr_io_pmp_5_cfg_l; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_5_cfg_a = csr_io_pmp_5_cfg_a; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_5_cfg_x = csr_io_pmp_5_cfg_x; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_5_cfg_w = csr_io_pmp_5_cfg_w; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_5_cfg_r = csr_io_pmp_5_cfg_r; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_5_addr = csr_io_pmp_5_addr; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_5_mask = csr_io_pmp_5_mask; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_6_cfg_l = csr_io_pmp_6_cfg_l; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_6_cfg_a = csr_io_pmp_6_cfg_a; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_6_cfg_x = csr_io_pmp_6_cfg_x; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_6_cfg_w = csr_io_pmp_6_cfg_w; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_6_cfg_r = csr_io_pmp_6_cfg_r; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_6_addr = csr_io_pmp_6_addr; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_6_mask = csr_io_pmp_6_mask; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_7_cfg_l = csr_io_pmp_7_cfg_l; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_7_cfg_a = csr_io_pmp_7_cfg_a; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_7_cfg_x = csr_io_pmp_7_cfg_x; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_7_cfg_w = csr_io_pmp_7_cfg_w; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_7_cfg_r = csr_io_pmp_7_cfg_r; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_7_addr = csr_io_pmp_7_addr; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_pmp_7_mask = csr_io_pmp_7_mask; // @[RocketCore.scala 628:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313739.4]
  assign io_ptw_customCSRs_csrs_0_value = 64'h0; // @[RocketCore.scala 626:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313734.4]
  assign io_fpu_inst = ibuf_io_inst_0_bits_inst_bits; // @[RocketCore.scala 746:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314051.4]
  assign io_fpu_fromint_data = ex_reg_rs_bypass_0 ? _T_973 : _T_974; // @[RocketCore.scala 747:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314052.4]
  assign io_fpu_fcsr_rm = csr_io_fcsr_rm; // @[RocketCore.scala 616:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313696.4]
  assign io_fpu_dmem_resp_val = dmem_resp_valid & _T_1470; // @[RocketCore.scala 748:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314054.4]
  assign io_fpu_dmem_resp_type = io_dmem_resp_bits_typ; // @[RocketCore.scala 750:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314056.4]
  assign io_fpu_dmem_resp_tag = io_dmem_resp_bits_tag[5:1]; // @[RocketCore.scala 751:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314057.4]
  assign io_fpu_dmem_resp_data = io_dmem_resp_bits_data_word_bypass; // @[RocketCore.scala 749:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314055.4]
  assign io_fpu_valid = _T_1060 & id_ctrl_fp; // @[RocketCore.scala 743:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314048.4]
  assign io_fpu_killx = _T_1109 | _T_1110; // @[RocketCore.scala 744:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314049.4]
  assign io_fpu_killm = _T_1410 | _T_1411; // @[RocketCore.scala 745:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314050.4]
  assign io_rocc_cmd_valid = _T_1465 & _T_1795; // @[RocketCore.scala 768:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314090.4]
  assign io_rocc_cmd_bits_inst_funct = wb_reg_inst[31:25]; // @[RocketCore.scala 771:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314116.4]
  assign io_rocc_cmd_bits_inst_rs2 = wb_reg_inst[24:20]; // @[RocketCore.scala 771:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314116.4]
  assign io_rocc_cmd_bits_inst_rs1 = wb_reg_inst[19:15]; // @[RocketCore.scala 771:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314116.4]
  assign io_rocc_cmd_bits_inst_xd = wb_reg_inst[14]; // @[RocketCore.scala 771:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314116.4]
  assign io_rocc_cmd_bits_inst_xs1 = wb_reg_inst[13]; // @[RocketCore.scala 771:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314116.4]
  assign io_rocc_cmd_bits_inst_xs2 = wb_reg_inst[12]; // @[RocketCore.scala 771:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314116.4]
  assign io_rocc_cmd_bits_inst_rd = wb_reg_inst[11:7]; // @[RocketCore.scala 771:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314116.4]
  assign io_rocc_cmd_bits_inst_opcode = wb_reg_inst[6:0]; // @[RocketCore.scala 771:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314116.4]
  assign io_rocc_cmd_bits_rs1 = wb_reg_wdata; // @[RocketCore.scala 772:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314117.4]
  assign io_rocc_cmd_bits_rs2 = wb_reg_rs2; // @[RocketCore.scala 773:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314118.4]
  assign io_rocc_cmd_bits_status_prv = csr_io_status_prv; // @[RocketCore.scala 770:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314094.4]
  assign io_rocc_resp_ready = _T_1480 ? 1'h0 : _T_1722; // @[RocketCore.scala 580:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313634.4 RocketCore.scala 591:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313645.6]
  assign io_rocc_exception = wb_xcpt & _T_1797; // @[RocketCore.scala 769:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314093.4]
  assign ibuf_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312186.4]
  assign ibuf_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312187.4]
  assign ibuf_io_imem_valid = io_imem_resp_valid; // @[RocketCore.scala 226:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312188.4]
  assign ibuf_io_imem_bits_btb_taken = io_imem_resp_bits_btb_taken; // @[RocketCore.scala 226:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312188.4]
  assign ibuf_io_imem_bits_btb_bridx = io_imem_resp_bits_btb_bridx; // @[RocketCore.scala 226:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312188.4]
  assign ibuf_io_imem_bits_btb_entry = io_imem_resp_bits_btb_entry; // @[RocketCore.scala 226:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312188.4]
  assign ibuf_io_imem_bits_btb_bht_history = io_imem_resp_bits_btb_bht_history; // @[RocketCore.scala 226:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312188.4]
  assign ibuf_io_imem_bits_pc = io_imem_resp_bits_pc; // @[RocketCore.scala 226:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312188.4]
  assign ibuf_io_imem_bits_data = io_imem_resp_bits_data; // @[RocketCore.scala 226:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312188.4]
  assign ibuf_io_imem_bits_xcpt_pf_inst = io_imem_resp_bits_xcpt_pf_inst; // @[RocketCore.scala 226:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312188.4]
  assign ibuf_io_imem_bits_xcpt_ae_inst = io_imem_resp_bits_xcpt_ae_inst; // @[RocketCore.scala 226:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312188.4]
  assign ibuf_io_imem_bits_replay = io_imem_resp_bits_replay; // @[RocketCore.scala 226:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312188.4]
  assign ibuf_io_kill = take_pc_wb | take_pc_mem; // @[RocketCore.scala 227:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312189.4]
  assign ibuf_io_inst_0_ready = ctrl_stalld == 1'h0; // @[RocketCore.scala 722:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314007.4]
  assign csr_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312799.4]
  assign csr_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312800.4]
  assign csr_io_ungated_clock = clock; // @[RocketCore.scala 608:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313680.4]
  assign csr_io_interrupts_debug = io_interrupts_debug; // @[RocketCore.scala 614:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313694.4]
  assign csr_io_interrupts_mtip = io_interrupts_mtip; // @[RocketCore.scala 614:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313694.4]
  assign csr_io_interrupts_msip = io_interrupts_msip; // @[RocketCore.scala 614:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313694.4]
  assign csr_io_interrupts_meip = io_interrupts_meip; // @[RocketCore.scala 614:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313694.4]
  assign csr_io_interrupts_seip = io_interrupts_seip; // @[RocketCore.scala 614:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313694.4]
  assign csr_io_hartid = io_hartid; // @[RocketCore.scala 615:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313695.4]
  assign csr_io_rw_addr = wb_reg_inst[31:20]; // @[RocketCore.scala 629:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313741.4]
  assign csr_io_rw_cmd = wb_ctrl_csr & _T_1535; // @[RocketCore.scala 630:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313745.4]
  assign csr_io_rw_wdata = wb_reg_wdata; // @[RocketCore.scala 631:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313746.4]
  assign csr_io_decode_0_csr = ibuf_io_inst_0_bits_raw[31:20]; // @[RocketCore.scala 609:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313682.4]
  assign csr_io_exception = _T_1445 | _T_1440; // @[RocketCore.scala 610:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313683.4]
  assign csr_io_retire = _T_1482 & _T_1483; // @[RocketCore.scala 612:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313685.4]
  assign csr_io_cause = wb_reg_xcpt ? wb_reg_cause : {{60'd0}, _T_1450}; // @[RocketCore.scala 611:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313684.4]
  assign csr_io_pc = wb_reg_pc; // @[RocketCore.scala 619:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313699.4]
  assign csr_io_tval = tval_valid ? _T_1531 : 40'h0; // @[RocketCore.scala 624:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313732.4]
  assign csr_io_fcsr_flags_valid = io_fpu_fcsr_flags_valid; // @[RocketCore.scala 617:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313697.4]
  assign csr_io_fcsr_flags_bits = io_fpu_fcsr_flags_bits; // @[RocketCore.scala 617:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313697.4]
  assign csr_io_rocc_interrupt = io_rocc_interrupt; // @[RocketCore.scala 618:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313698.4]
  assign csr_io_inst_0 = {_T_1501,_T_1502}; // @[RocketCore.scala 613:18:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313693.4]
  assign bpu_io_status_debug = csr_io_status_debug; // @[RocketCore.scala 281:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312887.4]
  assign bpu_io_status_prv = csr_io_status_prv; // @[RocketCore.scala 281:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312887.4]
  assign bpu_io_bp_0_control_action = csr_io_bp_0_control_action; // @[RocketCore.scala 282:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312888.4]
  assign bpu_io_bp_0_control_tmatch = csr_io_bp_0_control_tmatch; // @[RocketCore.scala 282:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312888.4]
  assign bpu_io_bp_0_control_m = csr_io_bp_0_control_m; // @[RocketCore.scala 282:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312888.4]
  assign bpu_io_bp_0_control_s = csr_io_bp_0_control_s; // @[RocketCore.scala 282:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312888.4]
  assign bpu_io_bp_0_control_u = csr_io_bp_0_control_u; // @[RocketCore.scala 282:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312888.4]
  assign bpu_io_bp_0_control_x = csr_io_bp_0_control_x; // @[RocketCore.scala 282:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312888.4]
  assign bpu_io_bp_0_control_w = csr_io_bp_0_control_w; // @[RocketCore.scala 282:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312888.4]
  assign bpu_io_bp_0_control_r = csr_io_bp_0_control_r; // @[RocketCore.scala 282:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312888.4]
  assign bpu_io_bp_0_address = csr_io_bp_0_address; // @[RocketCore.scala 282:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312888.4]
  assign bpu_io_pc = ibuf_io_pc[38:0]; // @[RocketCore.scala 283:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312889.4]
  assign bpu_io_ea = mem_reg_wdata[38:0]; // @[RocketCore.scala 284:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312890.4]
  assign alu_io_dw = ex_ctrl_alu_dw; // @[RocketCore.scala 340:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313039.4]
  assign alu_io_fn = ex_ctrl_alu_fn; // @[RocketCore.scala 341:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313040.4]
  assign alu_io_in2 = $unsigned(ex_op2); // @[RocketCore.scala 342:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313042.4]
  assign alu_io_in1 = $unsigned(ex_op1); // @[RocketCore.scala 343:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313044.4]
  assign div_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313047.4]
  assign div_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313048.4]
  assign div_io_req_valid = ex_reg_valid & ex_ctrl_div; // @[RocketCore.scala 355:20:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313050.4]
  assign div_io_req_bits_fn = ex_ctrl_alu_fn; // @[RocketCore.scala 357:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313052.4]
  assign div_io_req_bits_dw = ex_ctrl_alu_dw; // @[RocketCore.scala 356:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313051.4]
  assign div_io_req_bits_in1 = ex_reg_rs_bypass_0 ? _T_973 : _T_974; // @[RocketCore.scala 358:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313053.4]
  assign div_io_req_bits_in2 = ex_reg_rs_bypass_1 ? _T_981 : _T_982; // @[RocketCore.scala 359:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313054.4]
  assign div_io_req_bits_tag = ex_reg_inst[11:7]; // @[RocketCore.scala 360:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313055.4]
  assign div_io_kill = killm_common & _T_1414; // @[RocketCore.scala 519:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313532.4]
  assign div_io_resp_ready = _T_1480 ? 1'h0 : _GEN_211; // @[RocketCore.scala 575:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313622.4 RocketCore.scala 582:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313637.6 RocketCore.scala 589:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@313644.6]
  assign PlusArgTimeout_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314162.4]
  assign PlusArgTimeout_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314163.4]
  assign PlusArgTimeout_io_count = csr_io_time[31:0]; // @[PlusArg.scala 51:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314164.4]
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
  _RAND_0 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 31; initvar = initvar+1)
    _T_752[initvar] = _RAND_0[63:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {2{`RANDOM}};
  _RAND_2 = {2{`RANDOM}};
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  imem_might_request_reg = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  ex_ctrl_fp = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  ex_ctrl_rocc = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  ex_ctrl_branch = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ex_ctrl_jal = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  ex_ctrl_jalr = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  ex_ctrl_rxs2 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  ex_ctrl_sel_alu2 = _RAND_10[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  ex_ctrl_sel_alu1 = _RAND_11[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  ex_ctrl_sel_imm = _RAND_12[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  ex_ctrl_alu_dw = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  ex_ctrl_alu_fn = _RAND_14[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  ex_ctrl_mem = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  ex_ctrl_mem_cmd = _RAND_16[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  ex_ctrl_mem_type = _RAND_17[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  ex_ctrl_wfd = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  ex_ctrl_div = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  ex_ctrl_wxd = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  ex_ctrl_csr = _RAND_21[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  ex_ctrl_fence_i = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  mem_ctrl_fp = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  mem_ctrl_rocc = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  mem_ctrl_branch = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  mem_ctrl_jal = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  mem_ctrl_jalr = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  mem_ctrl_mem = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  mem_ctrl_mem_type = _RAND_29[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  mem_ctrl_wfd = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  mem_ctrl_mul = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  mem_ctrl_div = _RAND_32[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  mem_ctrl_wxd = _RAND_33[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  mem_ctrl_csr = _RAND_34[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  mem_ctrl_fence_i = _RAND_35[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  wb_ctrl_rocc = _RAND_36[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  wb_ctrl_mem = _RAND_37[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  wb_ctrl_mem_type = _RAND_38[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  wb_ctrl_wfd = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  wb_ctrl_div = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  wb_ctrl_wxd = _RAND_41[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  wb_ctrl_csr = _RAND_42[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  wb_ctrl_fence_i = _RAND_43[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  ex_reg_xcpt_interrupt = _RAND_44[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  ex_reg_valid = _RAND_45[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  ex_reg_rvc = _RAND_46[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  ex_reg_btb_resp_entry = _RAND_47[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  ex_reg_btb_resp_bht_history = _RAND_48[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  ex_reg_xcpt = _RAND_49[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  ex_reg_flush_pipe = _RAND_50[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  ex_reg_load_use = _RAND_51[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {2{`RANDOM}};
  ex_reg_cause = _RAND_52[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  ex_reg_replay = _RAND_53[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {2{`RANDOM}};
  ex_reg_pc = _RAND_54[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  ex_reg_inst = _RAND_55[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{`RANDOM}};
  ex_reg_raw_inst = _RAND_56[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{`RANDOM}};
  mem_reg_xcpt_interrupt = _RAND_57[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{`RANDOM}};
  mem_reg_valid = _RAND_58[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{`RANDOM}};
  mem_reg_rvc = _RAND_59[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {1{`RANDOM}};
  mem_reg_btb_resp_entry = _RAND_60[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{`RANDOM}};
  mem_reg_btb_resp_bht_history = _RAND_61[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{`RANDOM}};
  mem_reg_xcpt = _RAND_62[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{`RANDOM}};
  mem_reg_replay = _RAND_63[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_64 = {1{`RANDOM}};
  mem_reg_flush_pipe = _RAND_64[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_65 = {2{`RANDOM}};
  mem_reg_cause = _RAND_65[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_66 = {1{`RANDOM}};
  mem_reg_slow_bypass = _RAND_66[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_67 = {1{`RANDOM}};
  mem_reg_load = _RAND_67[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_68 = {1{`RANDOM}};
  mem_reg_store = _RAND_68[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_69 = {1{`RANDOM}};
  mem_reg_sfence = _RAND_69[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_70 = {2{`RANDOM}};
  mem_reg_pc = _RAND_70[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_71 = {1{`RANDOM}};
  mem_reg_inst = _RAND_71[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_72 = {1{`RANDOM}};
  mem_reg_raw_inst = _RAND_72[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_73 = {2{`RANDOM}};
  mem_reg_wdata = _RAND_73[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_74 = {2{`RANDOM}};
  mem_reg_rs2 = _RAND_74[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_75 = {1{`RANDOM}};
  mem_br_taken = _RAND_75[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_76 = {1{`RANDOM}};
  wb_reg_valid = _RAND_76[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_77 = {1{`RANDOM}};
  wb_reg_xcpt = _RAND_77[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_78 = {1{`RANDOM}};
  wb_reg_replay = _RAND_78[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_79 = {1{`RANDOM}};
  wb_reg_flush_pipe = _RAND_79[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_80 = {2{`RANDOM}};
  wb_reg_cause = _RAND_80[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_81 = {1{`RANDOM}};
  wb_reg_sfence = _RAND_81[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_82 = {2{`RANDOM}};
  wb_reg_pc = _RAND_82[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_83 = {1{`RANDOM}};
  wb_reg_inst = _RAND_83[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_84 = {1{`RANDOM}};
  wb_reg_raw_inst = _RAND_84[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_85 = {2{`RANDOM}};
  wb_reg_wdata = _RAND_85[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_86 = {2{`RANDOM}};
  wb_reg_rs2 = _RAND_86[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_87 = {1{`RANDOM}};
  id_reg_fence = _RAND_87[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_88 = {1{`RANDOM}};
  ex_reg_rs_bypass_0 = _RAND_88[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_89 = {1{`RANDOM}};
  ex_reg_rs_bypass_1 = _RAND_89[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_90 = {1{`RANDOM}};
  ex_reg_rs_lsb_0 = _RAND_90[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_91 = {1{`RANDOM}};
  ex_reg_rs_lsb_1 = _RAND_91[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_92 = {2{`RANDOM}};
  ex_reg_rs_msb_0 = _RAND_92[61:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_93 = {2{`RANDOM}};
  ex_reg_rs_msb_1 = _RAND_93[61:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_94 = {1{`RANDOM}};
  _T_1544 = _RAND_94[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_95 = {1{`RANDOM}};
  _T_1657 = _RAND_95[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_96 = {1{`RANDOM}};
  blocked = _RAND_96[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_97 = {1{`RANDOM}};
  rocc_blocked = _RAND_97[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_98 = {1{`RANDOM}};
  _T_1414 = _RAND_98[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_99 = {2{`RANDOM}};
  _T_1826 = _RAND_99[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_100 = {2{`RANDOM}};
  coreMonitorBundle_rd0val = _RAND_100[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_101 = {2{`RANDOM}};
  _T_1831 = _RAND_101[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_102 = {2{`RANDOM}};
  coreMonitorBundle_rd1val = _RAND_102[63:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_752__T_1493_en & _T_752__T_1493_mask) begin
      _T_752[_T_752__T_1493_addr] <= _T_752__T_1493_data; // @[RocketCore.scala 910:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312709.4]
    end
    imem_might_request_reg <= _T_1744 | _T_1745;
    if (_T_1060) begin
      ex_ctrl_fp <= id_ctrl_fp;
    end
    if (_T_1060) begin
      ex_ctrl_rocc <= id_ctrl_rocc;
    end
    if (_T_1060) begin
      ex_ctrl_branch <= id_ctrl_branch;
    end
    if (_T_1060) begin
      ex_ctrl_jal <= id_ctrl_jal;
    end
    if (_T_1060) begin
      ex_ctrl_jalr <= id_ctrl_jalr;
    end
    if (_T_1060) begin
      ex_ctrl_rxs2 <= id_ctrl_rxs2;
    end
    if (_T_1060) begin
      if (id_xcpt) begin
        if (_T_1074) begin
          ex_ctrl_sel_alu2 <= 2'h0;
        end else begin
          if (_T_1071) begin
            ex_ctrl_sel_alu2 <= 2'h1;
          end else begin
            ex_ctrl_sel_alu2 <= 2'h0;
          end
        end
      end else begin
        ex_ctrl_sel_alu2 <= id_ctrl_sel_alu2;
      end
    end
    if (_T_1060) begin
      if (id_xcpt) begin
        if (_T_1074) begin
          ex_ctrl_sel_alu1 <= 2'h2;
        end else begin
          if (_T_1071) begin
            ex_ctrl_sel_alu1 <= 2'h2;
          end else begin
            ex_ctrl_sel_alu1 <= 2'h1;
          end
        end
      end else begin
        ex_ctrl_sel_alu1 <= id_ctrl_sel_alu1;
      end
    end
    if (_T_1060) begin
      ex_ctrl_sel_imm <= id_ctrl_sel_imm;
    end
    if (_T_1060) begin
      if (id_xcpt) begin
        ex_ctrl_alu_dw <= 1'h1;
      end else begin
        ex_ctrl_alu_dw <= id_ctrl_alu_dw;
      end
    end
    if (_T_1060) begin
      if (id_xcpt) begin
        ex_ctrl_alu_fn <= 4'h0;
      end else begin
        ex_ctrl_alu_fn <= id_ctrl_alu_fn;
      end
    end
    if (_T_1060) begin
      ex_ctrl_mem <= id_ctrl_mem;
    end
    if (_T_1060) begin
      ex_ctrl_mem_cmd <= id_ctrl_mem_cmd;
    end
    if (_T_1060) begin
      if (id_sfence) begin
        ex_ctrl_mem_type <= {{1'd0}, _T_1078};
      end else begin
        ex_ctrl_mem_type <= id_ctrl_mem_type;
      end
    end
    if (_T_1060) begin
      ex_ctrl_wfd <= id_ctrl_wfd;
    end
    if (_T_1060) begin
      ex_ctrl_div <= id_ctrl_div;
    end
    if (_T_1060) begin
      ex_ctrl_wxd <= id_ctrl_wxd;
    end
    if (_T_1060) begin
      if (id_csr_ren) begin
        ex_ctrl_csr <= 3'h2;
      end else begin
        ex_ctrl_csr <= id_ctrl_csr;
      end
    end
    if (_T_1060) begin
      ex_ctrl_fence_i <= id_ctrl_fence_i;
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_ctrl_fp <= ex_ctrl_fp;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_ctrl_rocc <= ex_ctrl_rocc;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_ctrl_branch <= ex_ctrl_branch;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_ctrl_jal <= ex_ctrl_jal;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_ctrl_jalr <= ex_ctrl_jalr;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_ctrl_mem <= ex_ctrl_mem;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_ctrl_mem_type <= ex_ctrl_mem_type;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_ctrl_wfd <= ex_ctrl_wfd;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_ctrl_mul <= 1'h0;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_ctrl_div <= ex_ctrl_div;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_ctrl_wxd <= ex_ctrl_wxd;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_ctrl_csr <= ex_ctrl_csr;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        if (_T_1384) begin
          mem_ctrl_fence_i <= 1'h1;
        end else begin
          mem_ctrl_fence_i <= ex_ctrl_fence_i;
        end
      end
    end
    if (mem_pc_valid) begin
      wb_ctrl_rocc <= mem_ctrl_rocc;
    end
    if (mem_pc_valid) begin
      wb_ctrl_mem <= mem_ctrl_mem;
    end
    if (mem_pc_valid) begin
      wb_ctrl_mem_type <= mem_ctrl_mem_type;
    end
    if (mem_pc_valid) begin
      wb_ctrl_wfd <= mem_ctrl_wfd;
    end
    if (mem_pc_valid) begin
      wb_ctrl_div <= mem_ctrl_div;
    end
    if (mem_pc_valid) begin
      wb_ctrl_wxd <= mem_ctrl_wxd;
    end
    if (mem_pc_valid) begin
      wb_ctrl_csr <= mem_ctrl_csr;
    end
    if (mem_pc_valid) begin
      wb_ctrl_fence_i <= mem_ctrl_fence_i;
    end
    ex_reg_xcpt_interrupt <= _T_1062 & csr_io_interrupt;
    ex_reg_valid <= ctrl_killd == 1'h0;
    if (_T_1060) begin
      if (id_xcpt) begin
        if (_T_1071) begin
          ex_reg_rvc <= 1'h1;
        end else begin
          ex_reg_rvc <= ibuf_io_inst_0_bits_rvc;
        end
      end else begin
        ex_reg_rvc <= ibuf_io_inst_0_bits_rvc;
      end
    end
    if (_T_1100) begin
      ex_reg_btb_resp_entry <= ibuf_io_btb_resp_entry;
    end
    if (_T_1100) begin
      ex_reg_btb_resp_bht_history <= ibuf_io_btb_resp_bht_history;
    end
    ex_reg_xcpt <= _T_1060 & id_xcpt;
    if (_T_1060) begin
      ex_reg_flush_pipe <= _T_1075;
    end
    if (_T_1060) begin
      ex_reg_load_use <= id_load_use;
    end
    if (_T_1100) begin
      if (csr_io_interrupt) begin
        ex_reg_cause <= csr_io_interrupt_cause;
      end else begin
        ex_reg_cause <= {{60'd0}, _T_915};
      end
    end
    ex_reg_replay <= _T_1062 & ibuf_io_inst_0_bits_replay;
    if (_T_1100) begin
      ex_reg_pc <= ibuf_io_pc;
    end
    if (_T_1100) begin
      ex_reg_inst <= ibuf_io_inst_0_bits_inst_bits;
    end
    if (_T_1100) begin
      ex_reg_raw_inst <= ibuf_io_inst_0_bits_raw;
    end
    mem_reg_xcpt_interrupt <= _T_1061 & ex_reg_xcpt_interrupt;
    mem_reg_valid <= ctrl_killx == 1'h0;
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_reg_rvc <= ex_reg_rvc;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_reg_btb_resp_entry <= ex_reg_btb_resp_entry;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_reg_btb_resp_bht_history <= ex_reg_btb_resp_bht_history;
      end
    end
    mem_reg_xcpt <= _T_1309 & ex_xcpt;
    mem_reg_replay <= _T_1061 & replay_ex;
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        if (_T_1384) begin
          mem_reg_flush_pipe <= 1'h1;
        end else begin
          mem_reg_flush_pipe <= ex_reg_flush_pipe;
        end
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_reg_cause <= ex_reg_cause;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_reg_slow_bypass <= ex_slow_bypass;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_reg_load <= _T_1340;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_reg_store <= _T_1364;
      end
    end
    if (_T_1316) begin
      mem_reg_sfence <= 1'h0;
    end else begin
      if (ex_pc_valid) begin
        mem_reg_sfence <= ex_sfence;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_reg_pc <= ex_reg_pc;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_reg_inst <= ex_reg_inst;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_reg_raw_inst <= ex_reg_raw_inst;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_reg_wdata <= alu_io_out;
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        if (_T_1367) begin
          if (_T_1369) begin
            mem_reg_rs2 <= _T_1373;
          end else begin
            if (_T_1374) begin
              mem_reg_rs2 <= _T_1377;
            end else begin
              if (_T_1378) begin
                mem_reg_rs2 <= _T_1380;
              end else begin
                if (ex_reg_rs_bypass_1) begin
                  if (_T_980) begin
                    mem_reg_rs2 <= io_dmem_resp_bits_data_word_bypass;
                  end else begin
                    if (_T_978) begin
                      mem_reg_rs2 <= wb_reg_wdata;
                    end else begin
                      if (_T_976) begin
                        mem_reg_rs2 <= mem_reg_wdata;
                      end else begin
                        mem_reg_rs2 <= 64'h0;
                      end
                    end
                  end
                end else begin
                  mem_reg_rs2 <= _T_982;
                end
              end
            end
          end
        end
      end
    end
    if (!(_T_1316)) begin
      if (ex_pc_valid) begin
        mem_br_taken <= alu_io_cmp_out;
      end
    end
    wb_reg_valid <= ctrl_killm == 1'h0;
    wb_reg_xcpt <= mem_xcpt & _T_1418;
    wb_reg_replay <= replay_mem & _T_1418;
    wb_reg_flush_pipe <= _T_1417 & mem_reg_flush_pipe;
    if (mem_pc_valid) begin
      if (_T_1389) begin
        wb_reg_cause <= mem_reg_cause;
      end else begin
        wb_reg_cause <= {{60'd0}, _T_1393};
      end
    end
    if (mem_pc_valid) begin
      wb_reg_sfence <= mem_reg_sfence;
    end
    if (mem_pc_valid) begin
      wb_reg_pc <= mem_reg_pc;
    end
    if (mem_pc_valid) begin
      wb_reg_inst <= mem_reg_inst;
    end
    if (mem_pc_valid) begin
      wb_reg_raw_inst <= mem_reg_raw_inst;
    end
    if (mem_pc_valid) begin
      if (_T_1426) begin
        wb_reg_wdata <= io_fpu_toint_data;
      end else begin
        wb_reg_wdata <= mem_int_wdata;
      end
    end
    if (mem_pc_valid) begin
      if (_T_1428) begin
        wb_reg_rs2 <= mem_reg_rs2;
      end
    end
    if (reset) begin
      id_reg_fence <= 1'h0;
    end else begin
      if (_T_1060) begin
        if (id_fence_next) begin
          id_reg_fence <= 1'h1;
        end else begin
          if (_T_888) begin
            id_reg_fence <= 1'h0;
          end
        end
      end else begin
        if (_T_888) begin
          id_reg_fence <= 1'h0;
        end
      end
    end
    if (_T_1060) begin
      if (id_illegal_insn) begin
        ex_reg_rs_bypass_0 <= 1'h0;
      end else begin
        ex_reg_rs_bypass_0 <= do_bypass;
      end
    end
    if (_T_1060) begin
      ex_reg_rs_bypass_1 <= do_bypass_1;
    end
    if (_T_1060) begin
      if (id_illegal_insn) begin
        ex_reg_rs_lsb_0 <= _T_1096;
      end else begin
        if (_T_1084) begin
          ex_reg_rs_lsb_0 <= _T_1085;
        end else begin
          if (_T_931) begin
            ex_reg_rs_lsb_0 <= 2'h0;
          end else begin
            if (_T_934) begin
              ex_reg_rs_lsb_0 <= 2'h1;
            end else begin
              if (_T_936) begin
                ex_reg_rs_lsb_0 <= 2'h2;
              end else begin
                ex_reg_rs_lsb_0 <= 2'h3;
              end
            end
          end
        end
      end
    end
    if (_T_1060) begin
      if (_T_1092) begin
        ex_reg_rs_lsb_1 <= _T_1093;
      end else begin
        if (_T_939) begin
          ex_reg_rs_lsb_1 <= 2'h0;
        end else begin
          if (_T_942) begin
            ex_reg_rs_lsb_1 <= 2'h1;
          end else begin
            if (_T_944) begin
              ex_reg_rs_lsb_1 <= 2'h2;
            end else begin
              ex_reg_rs_lsb_1 <= 2'h3;
            end
          end
        end
      end
    end
    if (_T_1060) begin
      if (id_illegal_insn) begin
        ex_reg_rs_msb_0 <= {{32'd0}, _T_1097};
      end else begin
        if (_T_1084) begin
          ex_reg_rs_msb_0 <= _T_1086;
        end
      end
    end
    if (_T_1060) begin
      if (_T_1092) begin
        ex_reg_rs_msb_1 <= _T_1094;
      end
    end
    if (reset) begin
      _T_1544 <= 32'h0;
    end else begin
      if (_T_1578) begin
        _T_1544 <= _T_1577;
      end else begin
        if (ll_wen) begin
          _T_1544 <= _T_1550;
        end
      end
    end
    if (reset) begin
      _T_1657 <= 32'h0;
    end else begin
      if (_T_1675) begin
        _T_1657 <= _T_1674;
      end else begin
        if (_T_1670) begin
          _T_1657 <= _T_1669;
        end else begin
          if (_T_1660) begin
            _T_1657 <= _T_1663;
          end
        end
      end
    end
    blocked <= _T_1694 & _T_1696;
    rocc_blocked <= _T_1702 & _T_1703;
    _T_1414 <= div_io_req_ready & div_io_req_valid;
    if (ex_reg_rs_bypass_0) begin
      if (_T_972) begin
        _T_1826 <= io_dmem_resp_bits_data_word_bypass;
      end else begin
        if (_T_970) begin
          _T_1826 <= wb_reg_wdata;
        end else begin
          if (_T_968) begin
            _T_1826 <= mem_reg_wdata;
          end else begin
            _T_1826 <= 64'h0;
          end
        end
      end
    end else begin
      _T_1826 <= _T_974;
    end
    coreMonitorBundle_rd0val <= _T_1826;
    if (ex_reg_rs_bypass_1) begin
      if (_T_980) begin
        _T_1831 <= io_dmem_resp_bits_data_word_bypass;
      end else begin
        if (_T_978) begin
          _T_1831 <= wb_reg_wdata;
        end else begin
          if (_T_976) begin
            _T_1831 <= mem_reg_wdata;
          end else begin
            _T_1831 <= 64'h0;
          end
        end
      end
    end else begin
      _T_1831 <= _T_982;
    end
    coreMonitorBundle_rd1val <= _T_1831;
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1835) begin
          $fwrite(32'h80000002,"C%d: %d [%d] pc=[%x] W[r%d=%x][%d] R[r%d=%x] R[r%d=%x] inst=[%x] DASM(%x)\n",io_hartid,coreMonitorBundle_time,coreMonitorBundle_valid,coreMonitorBundle_pc,coreMonitorBundle_wrdst,rf_wdata,rf_wen,_T_1809,coreMonitorBundle_rd0val,_T_1810,coreMonitorBundle_rd1val,coreMonitorBundle_inst,coreMonitorBundle_inst); // @[RocketCore.scala 852:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@314158.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule