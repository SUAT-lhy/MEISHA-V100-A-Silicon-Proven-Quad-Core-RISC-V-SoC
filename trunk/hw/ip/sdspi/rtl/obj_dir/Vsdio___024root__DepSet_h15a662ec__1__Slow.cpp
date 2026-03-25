// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsdio.h for the primary calling header

#include "Vsdio__pch.h"
#include "Vsdio___024root.h"

VL_ATTR_COLD void Vsdio___024root___stl_sequent__TOP__0(Vsdio___024root* vlSelf);

VL_ATTR_COLD void Vsdio___024root___eval_stl(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_stl\n"); );
    // Body
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        Vsdio___024root___stl_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[2U] = 1U;
        vlSelf->__Vm_traceActivity[1U] = 1U;
        vlSelf->__Vm_traceActivity[0U] = 1U;
    }
}

VL_ATTR_COLD void Vsdio___024root___eval_triggers__stl(Vsdio___024root* vlSelf);

VL_ATTR_COLD bool Vsdio___024root___eval_phase__stl(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_phase__stl\n"); );
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vsdio___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelf->__VstlTriggered.any();
    if (__VstlExecute) {
        Vsdio___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdio___024root___dump_triggers__ico(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___dump_triggers__ico\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VicoTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VicoTriggered.word(0U))) {
        VL_DBG_MSGF("         'ico' region trigger index 0 is active: Internal 'ico' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdio___024root___dump_triggers__act(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge i_clk)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdio___024root___dump_triggers__nba(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VnbaTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge i_clk)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vsdio___024root___ctor_var_reset(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->i_clk = VL_RAND_RESET_I(1);
    vlSelf->i_reset = VL_RAND_RESET_I(1);
    vlSelf->i_wb_cyc = VL_RAND_RESET_I(1);
    vlSelf->i_wb_stb = VL_RAND_RESET_I(1);
    vlSelf->i_wb_we = VL_RAND_RESET_I(1);
    vlSelf->i_wb_addr = VL_RAND_RESET_I(3);
    vlSelf->i_wb_data = VL_RAND_RESET_I(32);
    vlSelf->i_wb_sel = VL_RAND_RESET_I(4);
    vlSelf->o_wb_stall = VL_RAND_RESET_I(1);
    vlSelf->o_wb_ack = VL_RAND_RESET_I(1);
    vlSelf->o_wb_data = VL_RAND_RESET_I(32);
    vlSelf->i_card_detect = VL_RAND_RESET_I(1);
    vlSelf->o_1p8v = VL_RAND_RESET_I(1);
    vlSelf->o_int = VL_RAND_RESET_I(1);
    vlSelf->o_cfg_ddr = VL_RAND_RESET_I(1);
    vlSelf->o_cfg_ds = VL_RAND_RESET_I(1);
    vlSelf->o_cfg_dscmd = VL_RAND_RESET_I(1);
    vlSelf->o_cfg_sample_shift = VL_RAND_RESET_I(5);
    vlSelf->o_sdclk = VL_RAND_RESET_I(8);
    vlSelf->o_cmd_en = VL_RAND_RESET_I(1);
    vlSelf->o_pp_cmd = VL_RAND_RESET_I(1);
    vlSelf->o_cmd_data = VL_RAND_RESET_I(2);
    vlSelf->o_data_en = VL_RAND_RESET_I(1);
    vlSelf->o_pp_data = VL_RAND_RESET_I(1);
    vlSelf->o_rx_en = VL_RAND_RESET_I(1);
    vlSelf->o_tx_data = VL_RAND_RESET_I(32);
    vlSelf->i_cmd_strb = VL_RAND_RESET_I(2);
    vlSelf->i_cmd_data = VL_RAND_RESET_I(2);
    vlSelf->i_card_busy = VL_RAND_RESET_I(1);
    vlSelf->i_rx_strb = VL_RAND_RESET_I(2);
    vlSelf->i_rx_data = VL_RAND_RESET_I(16);
    vlSelf->S_AC_VALID = VL_RAND_RESET_I(1);
    vlSelf->S_AC_DATA = VL_RAND_RESET_I(2);
    vlSelf->S_AD_VALID = VL_RAND_RESET_I(1);
    vlSelf->S_AD_DATA = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__soft_reset = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__cfg_clk90 = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__cfg_clk_shutdown = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__clk_stb = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__clk_half = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__w_sdclk = VL_RAND_RESET_I(8);
    vlSelf->sdio__DOT__clk_ckspd = VL_RAND_RESET_I(8);
    vlSelf->sdio__DOT__cmd_request = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__cmd_err = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__cmd_busy = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__cmd_done = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__cmd_type = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__cmd_ercode = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__rsp_stb = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__rsp_id = VL_RAND_RESET_I(6);
    vlSelf->sdio__DOT__rsp_arg = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__cmd_mem_valid = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__cmd_mem_data = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__tx_en = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__tx_mem_valid = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__tx_mem_ready = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__tx_mem_last = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__tx_mem_data = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__rx_done = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__rx_err = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__rx_ercode = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__rx_active = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__rx_en = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT____Vcellinp__u_control__i_tx_mem_ready = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT____Vcellinp__u_clkgen__i_cfg_shutdown = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__cmd_busy = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__new_cmd_request = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__new_data_request = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__new_tx_request = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__w_selfreply_request = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__r_clk_shutdown = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__r_cmd = VL_RAND_RESET_I(7);
    vlSelf->sdio__DOT__u_control__DOT__r_tx_request = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__r_rx_request = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__r_tx_sent = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__r_fifo = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__r_cmd_err = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__r_rx_err = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__r_rx_ecode = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__r_cmd_ecode = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_control__DOT__r_arg = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_control__DOT__lgblk = VL_RAND_RESET_I(4);
    vlSelf->sdio__DOT__u_control__DOT__r_width = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_control__DOT__r_ckspeed = VL_RAND_RESET_I(8);
    vlSelf->sdio__DOT__u_control__DOT__w_cmd_word = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_control__DOT__w_phy_ctrl = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_control__DOT__ika = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_control__DOT__ikb = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 8192; ++__Vi0) {
        vlSelf->sdio__DOT__u_control__DOT__fifo_a[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 8192; ++__Vi0) {
        vlSelf->sdio__DOT__u_control__DOT__fifo_b[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->sdio__DOT__u_control__DOT__tx_fifo_a = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_control__DOT__tx_fifo_b = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_control__DOT__fif_wraddr = VL_RAND_RESET_I(13);
    vlSelf->sdio__DOT__u_control__DOT__fif_rdaddr = VL_RAND_RESET_I(13);
    vlSelf->sdio__DOT__u_control__DOT__tx_mem_addr = VL_RAND_RESET_I(13);
    vlSelf->sdio__DOT__u_control__DOT__tx_fifo_last = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__tx_pipe_valid = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__pre_ack = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__pre_sel = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_control__DOT__pre_data = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_a = VL_RAND_RESET_I(13);
    vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_b = VL_RAND_RESET_I(13);
    vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_a = VL_RAND_RESET_I(4);
    vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_b = VL_RAND_RESET_I(4);
    vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_a = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_b = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_control__DOT__mem_busy = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__GEN_SELFREPLY__DOT__r_cmd_selfreply = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter = VL_RAND_RESET_I(12);
    vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_expect_busy = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_card_busy = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_clkgen__DOT__nxt_stb = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_clkgen__DOT__nxt_clk = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter = VL_RAND_RESET_I(10);
    vlSelf->sdio__DOT__u_clkgen__DOT__counter = VL_RAND_RESET_I(10);
    vlSelf->sdio__DOT__u_clkgen__DOT__clk90 = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_clkgen__DOT__ckspd = VL_RAND_RESET_I(8);
    vlSelf->sdio__DOT__u_clkgen__DOT__w_clk90 = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd = VL_RAND_RESET_I(8);
    vlSelf->sdio__DOT__u_clkgen__DOT____Vconcswap_1_h246111ff__0 = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_clkgen__DOT____Vconcswap_1_h25627e99__0 = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_sdcmd__DOT__active = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__srcount = VL_RAND_RESET_I(6);
    vlSelf->sdio__DOT__u_sdcmd__DOT__tx_sreg = VL_RAND_RESET_Q(48);
    vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_ds = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_dbl = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__r_frame_err = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__response_active = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count = VL_RAND_RESET_I(8);
    vlSelf->sdio__DOT__u_sdcmd__DOT__w_done = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__w_no_response = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__mem_addr = VL_RAND_RESET_I(13);
    vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg = VL_RAND_RESET_Q(40);
    vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout_counter = VL_RAND_RESET_I(26);
    vlSelf->sdio__DOT__u_sdcmd__DOT__crc_fill = VL_RAND_RESET_I(7);
    vlSelf->sdio__DOT__u_sdcmd__DOT__r_busy = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__new_data = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__r_done = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_self_request = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_no_timeout = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_txframe__DOT__cfg_width = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_txframe__DOT__cfg_period = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_txframe__DOT__start_packet = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_txframe__DOT__pre_valid = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_txframe__DOT__pstate = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_txframe__DOT__pre_ready = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_txframe__DOT__pre_data = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_txframe__DOT__pre_count = VL_RAND_RESET_I(4);
    vlSelf->sdio__DOT__u_txframe__DOT__crc_1w_reg = VL_RAND_RESET_I(16);
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = VL_RAND_RESET_Q(64);
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = VL_RAND_RESET_Q(64);
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w = VL_RAND_RESET_Q(64);
    vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg = VL_RAND_RESET_Q(64);
    VL_RAND_RESET_W(128, vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w);
    VL_RAND_RESET_W(128, vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w);
    VL_RAND_RESET_W(128, vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w);
    VL_RAND_RESET_W(128, vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg);
    VL_RAND_RESET_W(256, vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d);
    VL_RAND_RESET_W(256, vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d);
    VL_RAND_RESET_W(256, vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d);
    VL_RAND_RESET_W(256, vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg);
    vlSelf->sdio__DOT__u_txframe__DOT__ck_valid = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_txframe__DOT__ck_counts = VL_RAND_RESET_I(5);
    vlSelf->sdio__DOT__u_txframe__DOT__ck_data = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_txframe__DOT__ck_stop_bit = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_txframe__DOT__f_ckstb = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_txframe__DOT__f_hlfck = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_txframe__DOT__fb_count = VL_RAND_RESET_I(15);
    vlSelf->sdio__DOT__u_txframe__DOT__fd_offset = VL_RAND_RESET_I(15);
    vlSelf->sdio__DOT__u_txframe__DOT__fd_count = VL_RAND_RESET_I(15);
    vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count = VL_RAND_RESET_I(15);
    vlSelf->sdio__DOT__u_txframe__DOT__fs_count = VL_RAND_RESET_I(10);
    vlSelf->sdio__DOT__u_txframe__DOT__fcrc_count = VL_RAND_RESET_I(11);
    vlSelf->sdio__DOT__u_txframe__DOT__fs_last = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill = VL_RAND_RESET_I(5);
    vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg = VL_RAND_RESET_I(20);
    vlSelf->sdio__DOT__u_rxframe__DOT__s2_valid = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_rxframe__DOT__s2_data = VL_RAND_RESET_I(16);
    vlSelf->sdio__DOT__u_rxframe__DOT__mem_valid = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_rxframe__DOT__mem_full = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_strb = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_rxframe__DOT__mem_strb = VL_RAND_RESET_I(4);
    vlSelf->sdio__DOT__u_rxframe__DOT__mem_data = VL_RAND_RESET_I(32);
    vlSelf->sdio__DOT__u_rxframe__DOT__mem_addr = VL_RAND_RESET_I(13);
    vlSelf->sdio__DOT__u_rxframe__DOT__subaddr = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_data = VL_RAND_RESET_I(8);
    vlSelf->sdio__DOT__u_rxframe__DOT__busy = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_rxframe__DOT__data_phase = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_rxframe__DOT__load_crc = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_rxframe__DOT__pending_crc = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_rxframe__DOT__rail_count = VL_RAND_RESET_I(19);
    vlSelf->sdio__DOT__u_rxframe__DOT__r_timeout = VL_RAND_RESET_I(23);
    vlSelf->sdio__DOT__u_rxframe__DOT__r_watchdog = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_rxframe__DOT__last_strb = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_rxframe__DOT__w_done = VL_RAND_RESET_I(1);
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc = VL_RAND_RESET_I(16);
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc = VL_RAND_RESET_I(16);
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__lcl_err = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc = VL_RAND_RESET_I(16);
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc = VL_RAND_RESET_I(16);
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__lcl_err = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc = VL_RAND_RESET_I(16);
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc = VL_RAND_RESET_I(16);
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__lcl_err = VL_RAND_RESET_I(2);
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc = VL_RAND_RESET_I(16);
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc = VL_RAND_RESET_I(16);
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__lcl_err = VL_RAND_RESET_I(2);
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout = VL_RAND_RESET_I(16);
    vlSelf->__Vdly__sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter = VL_RAND_RESET_I(12);
    vlSelf->__Vdly__sdio__DOT__tx_en = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__sdio__DOT__rx_en = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__sdio__DOT__u_control__DOT__fif_rdaddr = VL_RAND_RESET_I(13);
    vlSelf->__Vdly__sdio__DOT__tx_mem_valid = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__sdio__DOT__u_control__DOT__tx_mem_addr = VL_RAND_RESET_I(13);
    vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v0 = 0;
    vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v0 = 0;
    vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_a__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v0 = 0;
    vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v1 = 0;
    vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v1 = 0;
    vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_a__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v1 = 0;
    vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v2 = 0;
    vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v2 = 0;
    vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_a__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v2 = 0;
    vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v3 = 0;
    vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v3 = 0;
    vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_a__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v3 = 0;
    vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v0 = 0;
    vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v0 = 0;
    vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_b__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v0 = 0;
    vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v1 = 0;
    vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v1 = 0;
    vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_b__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v1 = 0;
    vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v2 = 0;
    vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v2 = 0;
    vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_b__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v2 = 0;
    vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v3 = 0;
    vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v3 = 0;
    vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_b__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v3 = 0;
    vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__srcount = VL_RAND_RESET_I(6);
    vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__resp_count = VL_RAND_RESET_I(8);
    vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_sreg = VL_RAND_RESET_Q(40);
    vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__crc_fill = VL_RAND_RESET_I(7);
    vlSelf->__Vdly__sdio__DOT__cmd_done = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__sdio__DOT__u_txframe__DOT__pstate = VL_RAND_RESET_I(2);
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__sync_fill = VL_RAND_RESET_I(5);
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__sync_sreg = VL_RAND_RESET_I(20);
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_valid = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_addr = VL_RAND_RESET_I(13);
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_strb = VL_RAND_RESET_I(4);
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__rail_count = VL_RAND_RESET_I(19);
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__busy = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__sdio__DOT__rx_done = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__i_clk__0 = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 3; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
