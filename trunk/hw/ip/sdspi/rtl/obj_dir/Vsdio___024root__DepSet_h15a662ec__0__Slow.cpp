// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsdio.h for the primary calling header

#include "Vsdio__pch.h"
#include "Vsdio___024root.h"

VL_ATTR_COLD void Vsdio___024root___eval_static(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_static\n"); );
}

VL_ATTR_COLD void Vsdio___024root___eval_initial__TOP(Vsdio___024root* vlSelf);

VL_ATTR_COLD void Vsdio___024root___eval_initial(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_initial\n"); );
    // Body
    Vsdio___024root___eval_initial__TOP(vlSelf);
    vlSelf->__Vm_traceActivity[2U] = 1U;
    vlSelf->__Vm_traceActivity[1U] = 1U;
    vlSelf->__Vm_traceActivity[0U] = 1U;
    vlSelf->__Vtrigprevexpr___TOP__i_clk__0 = vlSelf->i_clk;
}

VL_ATTR_COLD void Vsdio___024root___eval_initial__TOP(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_initial__TOP\n"); );
    // Body
    vlSelf->sdio__DOT__soft_reset = 1U;
    vlSelf->sdio__DOT__cmd_request = 0U;
    vlSelf->sdio__DOT__u_control__DOT__GEN_SELFREPLY__DOT__r_cmd_selfreply = 0U;
    vlSelf->sdio__DOT__u_control__DOT__cmd_busy = 0U;
    vlSelf->sdio__DOT__u_control__DOT__r_cmd = 0U;
    vlSelf->sdio__DOT__cmd_type = 0U;
    vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_expect_busy = 0U;
    vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_card_busy = 0U;
    vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter = 0U;
    vlSelf->sdio__DOT__u_control__DOT__r_tx_request = 0U;
    vlSelf->sdio__DOT__u_control__DOT__r_tx_sent = 0U;
    vlSelf->sdio__DOT__tx_en = 0U;
    vlSelf->sdio__DOT__u_control__DOT__r_rx_request = 0U;
    vlSelf->sdio__DOT__rx_en = 0U;
    vlSelf->sdio__DOT__u_control__DOT__r_fifo = 0U;
    vlSelf->sdio__DOT__u_control__DOT__r_cmd_err = 0U;
    vlSelf->sdio__DOT__u_control__DOT__r_cmd_ecode = 0U;
    vlSelf->sdio__DOT__u_control__DOT__r_rx_err = 0U;
    vlSelf->sdio__DOT__u_control__DOT__r_rx_ecode = 0U;
    vlSelf->sdio__DOT__u_control__DOT__r_arg = 0U;
    vlSelf->sdio__DOT__u_control__DOT__lgblk = 9U;
    vlSelf->o_cfg_sample_shift = 0x18U;
    vlSelf->sdio__DOT__u_control__DOT__r_clk_shutdown = 0U;
    vlSelf->sdio__DOT__cfg_clk90 = 0U;
    vlSelf->o_pp_cmd = 0U;
    vlSelf->o_pp_data = 0U;
    vlSelf->o_cfg_ds = 0U;
    vlSelf->o_cfg_dscmd = 0U;
    vlSelf->o_cfg_ddr = 0U;
    vlSelf->sdio__DOT__u_control__DOT__r_width = 0U;
    vlSelf->sdio__DOT__u_control__DOT__r_ckspeed = 0xfcU;
    vlSelf->o_int = 0U;
    vlSelf->sdio__DOT__u_control__DOT__fif_wraddr = 0U;
    vlSelf->sdio__DOT__u_control__DOT__fif_rdaddr = 0U;
    vlSelf->sdio__DOT__tx_mem_valid = 0U;
    vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_a = 0U;
    vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_b = 0U;
    vlSelf->o_wb_ack = 0U;
    vlSelf->sdio__DOT__u_control__DOT__pre_ack = 0U;
    vlSelf->o_1p8v = 0U;
    vlSelf->o_wb_stall = 0U;
    vlSelf->sdio__DOT__clk_stb = 1U;
    vlSelf->sdio__DOT__clk_half = 1U;
    vlSelf->sdio__DOT__w_sdclk = 0U;
    vlSelf->sdio__DOT__u_sdcmd__DOT__active = 0U;
    vlSelf->sdio__DOT__u_sdcmd__DOT__srcount = 0U;
    vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response = 0U;
    vlSelf->sdio__DOT__rsp_stb = 0U;
    vlSelf->sdio__DOT__rsp_id = 0U;
    vlSelf->sdio__DOT__rsp_arg = 0U;
    vlSelf->sdio__DOT__cmd_mem_valid = 0U;
    vlSelf->sdio__DOT__u_sdcmd__DOT__mem_addr = 0U;
    vlSelf->sdio__DOT__u_sdcmd__DOT__r_frame_err = 0U;
    vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout = 0U;
    vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout_counter = 0x3ffffffU;
    vlSelf->sdio__DOT__cmd_err = 0U;
    vlSelf->sdio__DOT__cmd_ercode = 0U;
    vlSelf->sdio__DOT__u_sdcmd__DOT__r_done = 0U;
    vlSelf->sdio__DOT__cmd_done = 0U;
    vlSelf->sdio__DOT__u_sdcmd__DOT__r_busy = 0U;
    vlSelf->sdio__DOT__u_txframe__DOT__cfg_period = 0U;
    vlSelf->sdio__DOT__u_txframe__DOT__pstate = 0U;
    vlSelf->sdio__DOT__u_txframe__DOT__pre_valid = 0U;
    vlSelf->sdio__DOT__u_txframe__DOT__pre_data = 0xffffffffU;
    vlSelf->sdio__DOT__u_txframe__DOT__pre_count = 0U;
    vlSelf->sdio__DOT__u_txframe__DOT__ck_valid = 0U;
    vlSelf->sdio__DOT__u_txframe__DOT__ck_stop_bit = 0U;
    vlSelf->sdio__DOT__u_txframe__DOT__ck_counts = 0U;
    vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg = 0xffffffffU;
    vlSelf->sdio__DOT__u_txframe__DOT__ck_data = 0xffffffffU;
    vlSelf->sdio__DOT__u_txframe__DOT__fs_last = 0U;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc = 0U;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc = 0U;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc = 0U;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc = 0U;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc = 0U;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc = 0U;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc = 0U;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc = 0U;
    vlSelf->sdio__DOT__rx_done = 0U;
}

VL_ATTR_COLD void Vsdio___024root___eval_final(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_final\n"); );
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdio___024root___dump_triggers__stl(Vsdio___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vsdio___024root___eval_phase__stl(Vsdio___024root* vlSelf);

VL_ATTR_COLD void Vsdio___024root___eval_settle(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_settle\n"); );
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelf->__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY((0x64U < __VstlIterCount))) {
#ifdef VL_DEBUG
            Vsdio___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("sdio.v", 48, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vsdio___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelf->__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdio___024root___dump_triggers__stl(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VstlTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

extern const VlUnpacked<SData/*14:0*/, 32> Vsdio__ConstPool__TABLE_h44593cd3_0;

VL_ATTR_COLD void Vsdio___024root___stl_sequent__TOP__0(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___stl_sequent__TOP__0\n"); );
    // Init
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__prior = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__prior = 0;
    CData/*7:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior = 0;
    CData/*3:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior = 0;
    CData/*1:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit = 0;
    CData/*4:0*/ __Vtableidx2;
    __Vtableidx2 = 0;
    // Body
    vlSelf->o_cmd_en = vlSelf->sdio__DOT__u_sdcmd__DOT__active;
    vlSelf->o_tx_data = vlSelf->sdio__DOT__u_txframe__DOT__ck_data;
    vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset 
        = ((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset));
    vlSelf->o_cmd_data = (3U & ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_dbl)
                                 ? (IData)((vlSelf->sdio__DOT__u_sdcmd__DOT__tx_sreg 
                                            >> 0x2eU))
                                 : (- (IData)((1U & (IData)(
                                                            (vlSelf->sdio__DOT__u_sdcmd__DOT__tx_sreg 
                                                             >> 0x2fU)))))));
    vlSelf->o_rx_en = ((IData)(vlSelf->sdio__DOT__rx_active) 
                       & (IData)(vlSelf->sdio__DOT__rx_en));
    vlSelf->sdio__DOT____Vcellinp__u_clkgen__i_cfg_shutdown 
        = ((~ (IData)(vlSelf->sdio__DOT__rx_active)) 
           & (IData)(vlSelf->sdio__DOT__cfg_clk_shutdown));
    vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb = 
        ((IData)(vlSelf->i_wb_stb) & ((~ (IData)(vlSelf->o_wb_stall)) 
                                      & ((4U == (IData)(vlSelf->i_wb_addr)) 
                                         & (IData)(vlSelf->i_wb_we))));
    vlSelf->sdio__DOT__u_sdcmd__DOT__w_no_response 
        = ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__active) 
           & ((0U == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type)) 
              & ((IData)(vlSelf->sdio__DOT__clk_stb) 
                 & ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__srcount) 
                    == ((IData)(1U) + (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_dbl))))));
    vlSelf->sdio__DOT__u_sdcmd__DOT__w_done = ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response) 
                                               & (((2U 
                                                    == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type)) 
                                                   & ((IData)(vlSelf->sdio__DOT__cmd_mem_valid) 
                                                      & (3U 
                                                         <= (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__mem_addr)))) 
                                                  | ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type) 
                                                     & (0x30U 
                                                        == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)))));
    vlSelf->sdio__DOT__u_rxframe__DOT__w_done = (1U 
                                                 & (~ 
                                                    (((((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__data_phase) 
                                                        | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__pending_crc)) 
                                                       | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_valid)) 
                                                      | (0U 
                                                         != 
                                                         (0x18U 
                                                          & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill)))) 
                                                     | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_valid))));
    if (vlSelf->sdio__DOT__u_rxframe__DOT__r_watchdog) {
        vlSelf->sdio__DOT__u_rxframe__DOT__w_done = 1U;
    }
    if ((1U & (~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__busy)))) {
        vlSelf->sdio__DOT__u_rxframe__DOT__w_done = 0U;
    }
    vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID 
        = ((IData)(vlSelf->sdio__DOT__tx_en) & (IData)(vlSelf->sdio__DOT__tx_mem_valid));
    vlSelf->sdio__DOT__u_txframe__DOT__pre_ready = 
        ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts)) 
         & (IData)(vlSelf->sdio__DOT__clk_stb));
    vlSelf->sdio__DOT__u_control__DOT__w_phy_ctrl = 0U;
    vlSelf->sdio__DOT__u_control__DOT__w_phy_ctrl = 
        (0xf0000000U | ((0x3fffffU & vlSelf->sdio__DOT__u_control__DOT__w_phy_ctrl) 
                        | ((IData)(vlSelf->sdio__DOT__u_control__DOT__lgblk) 
                           << 0x18U)));
    vlSelf->sdio__DOT__u_control__DOT__w_phy_ctrl = 
        ((0xffc03fffU & vlSelf->sdio__DOT__u_control__DOT__w_phy_ctrl) 
         | (((IData)(vlSelf->o_cfg_dscmd) << 0x15U) 
            | (((IData)(vlSelf->o_cfg_sample_shift) 
                << 0x10U) | (((IData)(vlSelf->sdio__DOT__u_control__DOT__r_clk_shutdown) 
                              << 0xfU) | ((IData)(vlSelf->sdio__DOT__cfg_clk90) 
                                          << 0xeU)))));
    vlSelf->sdio__DOT__u_control__DOT__w_phy_ctrl = 
        ((0xffffc0ffU & vlSelf->sdio__DOT__u_control__DOT__w_phy_ctrl) 
         | ((((IData)(vlSelf->o_pp_cmd) << 0xdU) | 
             (((IData)(vlSelf->o_pp_data) << 0xcU) 
              | ((IData)(vlSelf->sdio__DOT__u_control__DOT__r_width) 
                 << 0xaU))) | (((IData)(vlSelf->o_cfg_ds) 
                                << 9U) | ((IData)(vlSelf->o_cfg_ddr) 
                                          << 8U))));
    vlSelf->sdio__DOT__u_control__DOT__w_phy_ctrl = 
        ((0xffffff00U & vlSelf->sdio__DOT__u_control__DOT__w_phy_ctrl) 
         | (IData)(vlSelf->sdio__DOT__clk_ckspd));
    vlSelf->o_data_en = vlSelf->sdio__DOT__u_txframe__DOT__ck_valid;
    vlSelf->sdio__DOT__cmd_busy = (1U & ((~ (IData)(vlSelf->sdio__DOT__clk_stb)) 
                                         | ((~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_self_request)) 
                                            & (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__r_busy))));
    vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra = 
        ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_valid) 
         & ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__f_ckstb) 
            | ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr) 
               & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__f_hlfck))));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffffffffeULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | (IData)((IData)((1U & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg)))));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffffeffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 1U))))) 
            << 0x10U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffeffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 2U))))) 
            << 0x20U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffeffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 3U))))) 
            << 0x30U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffffffffdULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 4U))))) 
            << 1U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffffdffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 5U))))) 
            << 0x11U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffdffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 6U))))) 
            << 0x21U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffdffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 7U))))) 
            << 0x31U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffffffffbULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 8U))))) 
            << 2U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffffbffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 9U))))) 
            << 0x12U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffbffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0xaU))))) 
            << 0x22U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffbffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0xbU))))) 
            << 0x32U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffffffff7ULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0xcU))))) 
            << 3U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffff7ffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0xdU))))) 
            << 0x13U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffff7ffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0xeU))))) 
            << 0x23U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfff7ffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0xfU))))) 
            << 0x33U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffffffffefULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x10U))))) 
            << 4U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffffefffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x11U))))) 
            << 0x14U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffefffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x12U))))) 
            << 0x24U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffefffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x13U))))) 
            << 0x34U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffffffffdfULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x14U))))) 
            << 5U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffffdfffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x15U))))) 
            << 0x15U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffdfffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x16U))))) 
            << 0x25U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffdfffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x17U))))) 
            << 0x35U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffffffffbfULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x18U))))) 
            << 6U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffffbfffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x19U))))) 
            << 0x16U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffbfffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x1aU))))) 
            << 0x26U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffbfffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x1bU))))) 
            << 0x36U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffffffff7fULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x1cU))))) 
            << 7U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffff7fffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x1dU))))) 
            << 0x17U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffff7fffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x1eU))))) 
            << 0x27U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xff7fffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x1fU))))) 
            << 0x37U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffffffeffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x20U))))) 
            << 8U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffeffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x21U))))) 
            << 0x18U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffeffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x22U))))) 
            << 0x28U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfeffffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x23U))))) 
            << 0x38U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffffffdffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x24U))))) 
            << 9U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffdffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x25U))))) 
            << 0x19U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffdffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x26U))))) 
            << 0x29U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfdffffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x27U))))) 
            << 0x39U));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffffffbffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x28U))))) 
            << 0xaU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffbffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x29U))))) 
            << 0x1aU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffbffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x2aU))))) 
            << 0x2aU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfbffffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x2bU))))) 
            << 0x3aU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffffffff7ffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x2cU))))) 
            << 0xbU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffffffff7ffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x2dU))))) 
            << 0x1bU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xfffff7ffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x2eU))))) 
            << 0x2bU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xf7ffffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x2fU))))) 
            << 0x3bU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffffffefffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x30U))))) 
            << 0xcU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffefffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x31U))))) 
            << 0x1cU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffefffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x32U))))) 
            << 0x2cU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xefffffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x33U))))) 
            << 0x3cU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffffffdfffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x34U))))) 
            << 0xdU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffdfffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x35U))))) 
            << 0x1dU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffdfffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x36U))))) 
            << 0x2dU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xdfffffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x37U))))) 
            << 0x3dU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffffffbfffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x38U))))) 
            << 0xeU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffbfffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x39U))))) 
            << 0x1eU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffbfffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x3aU))))) 
            << 0x2eU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xbfffffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x3bU))))) 
            << 0x3eU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffffffff7fffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x3cU))))) 
            << 0xfU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffffffff7fffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x3dU))))) 
            << 0x1fU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0xffff7fffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x3eU))))) 
            << 0x2fU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w = 
        ((0x7fffffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x3fU))))) 
            << 0x3fU));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data 
        = ((0x80U & (vlSelf->sdio__DOT__tx_mem_data 
                     >> 0x15U)) | ((0x40U & (vlSelf->sdio__DOT__tx_mem_data 
                                             >> 0x12U)) 
                                   | ((0x20U & (vlSelf->sdio__DOT__tx_mem_data 
                                                >> 0xfU)) 
                                      | ((0x10U & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 0xcU)) 
                                         | ((8U & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 9U)) 
                                            | ((4U 
                                                & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 6U)) 
                                               | ((2U 
                                                   & (vlSelf->sdio__DOT__tx_mem_data 
                                                      >> 3U)) 
                                                  | (1U 
                                                     & vlSelf->sdio__DOT__tx_mem_data))))))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__prior 
        = (0xffffU & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 7U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 6U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 5U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 4U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w = 
        ((0xffffffffffff0000ULL & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w) 
         | (IData)((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__Vfuncout)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data 
        = ((0x80U & (vlSelf->sdio__DOT__tx_mem_data 
                     >> 0x16U)) | ((0x40U & (vlSelf->sdio__DOT__tx_mem_data 
                                             >> 0x13U)) 
                                   | ((0x20U & (vlSelf->sdio__DOT__tx_mem_data 
                                                >> 0x10U)) 
                                      | ((0x10U & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 0xdU)) 
                                         | ((8U & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 0xaU)) 
                                            | ((4U 
                                                & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 7U)) 
                                               | ((2U 
                                                   & (vlSelf->sdio__DOT__tx_mem_data 
                                                      >> 4U)) 
                                                  | (1U 
                                                     & (vlSelf->sdio__DOT__tx_mem_data 
                                                        >> 1U)))))))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__prior 
        = (0xffffU & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w 
                              >> 0x10U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 7U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 6U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 5U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 4U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w = 
        ((0xffffffff0000ffffULL & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w) 
         | ((QData)((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__Vfuncout)) 
            << 0x10U));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data 
        = ((0x80U & (vlSelf->sdio__DOT__tx_mem_data 
                     >> 0x17U)) | ((0x40U & (vlSelf->sdio__DOT__tx_mem_data 
                                             >> 0x14U)) 
                                   | ((0x20U & (vlSelf->sdio__DOT__tx_mem_data 
                                                >> 0x11U)) 
                                      | ((0x10U & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 0xeU)) 
                                         | ((8U & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 0xbU)) 
                                            | ((4U 
                                                & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 8U)) 
                                               | ((2U 
                                                   & (vlSelf->sdio__DOT__tx_mem_data 
                                                      >> 5U)) 
                                                  | (1U 
                                                     & (vlSelf->sdio__DOT__tx_mem_data 
                                                        >> 2U)))))))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__prior 
        = (0xffffU & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w 
                              >> 0x20U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 7U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 6U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 5U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 4U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w = 
        ((0xffff0000ffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w) 
         | ((QData)((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__Vfuncout)) 
            << 0x20U));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data 
        = ((0x80U & (vlSelf->sdio__DOT__tx_mem_data 
                     >> 0x18U)) | ((0x40U & (vlSelf->sdio__DOT__tx_mem_data 
                                             >> 0x15U)) 
                                   | ((0x20U & (vlSelf->sdio__DOT__tx_mem_data 
                                                >> 0x12U)) 
                                      | ((0x10U & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 0xfU)) 
                                         | ((8U & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 0xcU)) 
                                            | ((4U 
                                                & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 9U)) 
                                               | ((2U 
                                                   & (vlSelf->sdio__DOT__tx_mem_data 
                                                      >> 6U)) 
                                                  | (1U 
                                                     & (vlSelf->sdio__DOT__tx_mem_data 
                                                        >> 3U)))))))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__prior 
        = (0xffffU & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w 
                              >> 0x30U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 7U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 6U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 5U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 4U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__9__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w = 
        ((0xffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w) 
         | ((QData)((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC8__8__Vfuncout)) 
            << 0x30U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfffffffffffffff8ULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | (IData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                            >> 0x20U)) 
                                   << 2U)) | ((2U & 
                                               ((IData)(
                                                        (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                         >> 0x10U)) 
                                                << 1U)) 
                                              | (1U 
                                                 & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w)))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfffffffffffffff7ULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x30U))))) 
            << 3U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xffffffffffffff8fULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x21U)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x11U)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 1U))))))) 
            << 4U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xffffffffffffff7fULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x31U))))) 
            << 7U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfffffffffffff8ffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x22U)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x12U)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 2U))))))) 
            << 8U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfffffffffffff7ffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x32U))))) 
            << 0xbU));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xffffffffffff8fffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x23U)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x13U)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 3U))))))) 
            << 0xcU));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xffffffffffff7fffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x33U))))) 
            << 0xfU));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfffffffffff8ffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x24U)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x14U)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 4U))))))) 
            << 0x10U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfffffffffff7ffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x34U))))) 
            << 0x13U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xffffffffff8fffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x25U)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x15U)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 5U))))))) 
            << 0x14U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xffffffffff7fffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x35U))))) 
            << 0x17U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfffffffff8ffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x26U)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x16U)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 6U))))))) 
            << 0x18U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfffffffff7ffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x36U))))) 
            << 0x1bU));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xffffffff8fffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x27U)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x17U)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 7U))))))) 
            << 0x1cU));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xffffffff7fffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x37U))))) 
            << 0x1fU));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfffffff8ffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x28U)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x18U)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 8U))))))) 
            << 0x20U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfffffff7ffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x38U))))) 
            << 0x23U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xffffff8fffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x29U)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x19U)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 9U))))))) 
            << 0x24U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xffffff7fffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x39U))))) 
            << 0x27U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfffff8ffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x2aU)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x1aU)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 0xaU))))))) 
            << 0x28U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfffff7ffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x3aU))))) 
            << 0x2bU));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xffff8fffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x2bU)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x1bU)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 0xbU))))))) 
            << 0x2cU));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xffff7fffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x3bU))))) 
            << 0x2fU));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfff8ffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x2cU)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x1cU)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 0xcU))))))) 
            << 0x30U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xfff7ffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x3cU))))) 
            << 0x33U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xff8fffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x2dU)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x1dU)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 0xdU))))))) 
            << 0x34U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xff7fffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x3dU))))) 
            << 0x37U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xf8ffffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x2eU)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x1eU)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 0xeU))))))) 
            << 0x38U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0xf7ffffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x3eU))))) 
            << 0x3bU));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0x8fffffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)(((4U & ((IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                             >> 0x2fU)) 
                                    << 2U)) | ((2U 
                                                & ((IData)(
                                                           (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                            >> 0x1fU)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (IData)(
                                                            (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                                             >> 0xfU))))))) 
            << 0x3cU));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w = 
        ((0x7fffffffffffffffULL & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w) 
         | ((QData)((IData)((1U & (IData)((vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w 
                                           >> 0x3fU))))) 
            << 0x3fU));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (1U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          << 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          << 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          << 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          << 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          << 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          << 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          << 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 0xeU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          << 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x20000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 0x17U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 0x19U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          >> 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 0x1bU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          >> 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                    >> 0x1dU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                          >> 0xeU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          << 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (4U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          << 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          << 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          << 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          << 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          << 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          << 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          << 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x80000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 0x17U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 0x19U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          >> 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                    >> 0x1bU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                          >> 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           << 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           << 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x10U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           << 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           << 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           << 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           << 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           << 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           << 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x200000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 0x17U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                       >> 0x19U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                           >> 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           << 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           << 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           << 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x40U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           << 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           << 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           << 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           << 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           << 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       >> 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       >> 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       >> 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       >> 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x800000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       >> 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       >> 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       >> 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                       >> 0x17U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                           >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            << 0x17U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            << 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            << 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            << 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x100U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            << 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            << 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            << 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            << 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        >> 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        >> 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        >> 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        >> 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        >> 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x2000000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        >> 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        >> 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                        >> 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        << 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 0x19U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 0x17U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x400U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        >> 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        >> 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        >> 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        >> 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        >> 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        >> 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x8000000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        >> 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                        >> 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         << 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 0x1bU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         << 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 0x19U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 0x17U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x1000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         >> 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         >> 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         >> 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         >> 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         >> 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         >> 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         >> 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x20000000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                         >> 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                             >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         << 0xeU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 0x1dU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         << 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 0x1bU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         << 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 0x19U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 0x17U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x4000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         >> 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 0xeU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         >> 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         >> 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         >> 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         >> 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         >> 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         >> 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                             << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                         >> 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]) 
           | (0x80000000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U]));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0xfU)) 
           | (1U & vlSelf->sdio__DOT__tx_mem_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U]);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
        = ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U]) 
           | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x10U)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[0U] 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
        = ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U]) 
           | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout) 
              << 0x10U));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x11U)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 2U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U]);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
        = ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U]) 
           | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x12U)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 3U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[1U] 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
        = ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U]) 
           | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout) 
              << 0x10U));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x13U)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 4U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U]);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
        = ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U]) 
           | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x14U)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 5U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[2U] 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
        = ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U]) 
           | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout) 
              << 0x10U));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x15U)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 6U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U]);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
        = ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U]) 
           | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x16U)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 7U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[3U] 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
        = ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U]) 
           | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout) 
              << 0x10U));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x17U)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 8U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U]);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
        = ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U]) 
           | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x18U)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 9U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[4U] 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
        = ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U]) 
           | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout) 
              << 0x10U));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x19U)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 0xaU)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U]);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
        = ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U]) 
           | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x1aU)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 0xbU)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[5U] 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
        = ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U]) 
           | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout) 
              << 0x10U));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x1bU)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 0xcU)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U]);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
        = ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U]) 
           | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x1cU)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 0xdU)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[6U] 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
        = ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U]) 
           | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout) 
              << 0x10U));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x1dU)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 0xeU)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U]);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
        = ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U]) 
           | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data 
        = ((2U & (vlSelf->sdio__DOT__tx_mem_data >> 0x1eU)) 
           | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                    >> 0xfU)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d[7U] 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__13__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
        = ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U]) 
           | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC2__12__Vfuncout) 
              << 0x10U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U] 
        = ((0xfffffff8U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U]) 
           | ((4U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                     << 2U)) | ((2U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                       >> 0xfU)) | 
                                (1U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U]))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U] 
        = ((0xffffffc7U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U]) 
           | (0xfffffff8U & ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                       >> 0xbU)) | 
                             ((0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                        << 4U)) | (8U 
                                                   & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                                      >> 0xdU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U] 
        = ((0xfffffe3fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U]) 
           | (0xffffffc0U & ((0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                        << 8U)) | (
                                                   (0x80U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                       >> 9U)) 
                                                   | (0x40U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                         << 6U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U] 
        = ((0xfffff1ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U]) 
           | (0xfffffe00U & ((0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                        >> 5U)) | (
                                                   (0x400U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                                       << 0xaU)) 
                                                   | (0x200U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                                         >> 7U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U] 
        = ((0xffff8fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U]) 
           | (0xfffff000U & ((0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                         << 0xeU)) 
                             | ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                            >> 3U)) 
                                | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                              << 0xcU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                         >> 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U] 
        = ((0xfff8ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U]) 
           | (0xffff0000U & ((0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                          << 0x11U)) 
                             | ((0x20000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U]) 
                                | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                               << 0xfU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U] 
        = ((0xffc7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U]) 
           | (0xfff80000U & ((0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                           << 4U)) 
                             | ((0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                              << 0x13U)) 
                                | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                               << 2U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U] 
        = ((0xfe3fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U]) 
           | (0xffc00000U & ((0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                            << 0x17U)) 
                             | ((0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                              << 6U)) 
                                | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                << 0x15U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U] 
        = ((0xf1ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U]) 
           | (0xfe000000U & ((0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                            << 0xaU)) 
                             | ((0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                               << 0x19U)) 
                                | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                                 << 8U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U] 
        = ((0x8fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U]) 
           | (0xf0000000U & ((0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                             << 0x1dU)) 
                             | ((0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                << 0xcU)) 
                                | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                  << 0x1bU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                             << 0xeU)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U] 
        = ((0xfffffff8U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U]) 
           | ((4U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U]) 
              | ((2U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                        >> 0x11U)) | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                            >> 2U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U] 
        = ((0xffffffc7U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U]) 
           | (0xfffffff8U & ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                       >> 0xdU)) | 
                             ((0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                        << 2U)) | (8U 
                                                   & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                                      >> 0xfU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U] 
        = ((0xfffffe3fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U]) 
           | (0xffffffc0U & ((0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                        << 6U)) | (
                                                   (0x80U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                       >> 0xbU)) 
                                                   | (0x40U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                         << 4U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U] 
        = ((0xfffff1ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U]) 
           | (0xfffffe00U & ((0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                        >> 7U)) | (
                                                   (0x400U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                                       << 8U)) 
                                                   | (0x200U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                                         >> 9U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U] 
        = ((0xffff8fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U]) 
           | (0xfffff000U & ((0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                         << 0xcU)) 
                             | ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                            >> 5U)) 
                                | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                              << 0xaU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                         >> 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U] 
        = ((0xfff8ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U]) 
           | (0xffff0000U & ((0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                          << 0xfU)) 
                             | ((0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                             >> 2U)) 
                                | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                               << 0xdU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U] 
        = ((0xffc7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U]) 
           | (0xfff80000U & ((0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                           << 2U)) 
                             | ((0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                              << 0x11U)) 
                                | (0x80000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U])))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U] 
        = ((0xfe3fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U]) 
           | (0xffc00000U & ((0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                            << 0x15U)) 
                             | ((0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                              << 4U)) 
                                | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                << 0x13U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U] 
        = ((0xf1ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U]) 
           | (0xfe000000U & ((0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                            << 8U)) 
                             | ((0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                               << 0x17U)) 
                                | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                                 << 6U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U] 
        = ((0x8fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U]) 
           | (0xf0000000U & ((0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                             << 0x1bU)) 
                             | ((0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                << 0xaU)) 
                                | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                  << 0x19U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                             << 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U] 
        = ((0xfffffff8U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U]) 
           | ((4U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                     >> 2U)) | ((2U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                       >> 0x13U)) | 
                                (1U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                       >> 4U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U] 
        = ((0xffffffc7U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U]) 
           | (0xfffffff8U & ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                       >> 0xfU)) | 
                             ((0x10U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U]) 
                              | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                       >> 0x11U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U] 
        = ((0xfffffe3fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U]) 
           | (0xffffffc0U & ((0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                        << 4U)) | (
                                                   (0x80U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                       >> 0xdU)) 
                                                   | (0x40U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                         << 2U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U] 
        = ((0xfffff1ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U]) 
           | (0xfffffe00U & ((0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                        >> 9U)) | (
                                                   (0x400U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                                       << 6U)) 
                                                   | (0x200U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                                         >> 0xbU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U] 
        = ((0xffff8fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U]) 
           | (0xfffff000U & ((0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                         << 0xaU)) 
                             | ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                            >> 7U)) 
                                | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                              << 8U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                         >> 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U] 
        = ((0xfff8ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U]) 
           | (0xffff0000U & ((0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                          << 0xdU)) 
                             | ((0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                             >> 4U)) 
                                | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                               << 0xbU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U] 
        = ((0xffc7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U]) 
           | (0xfff80000U & ((0x200000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U]) 
                             | ((0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                              << 0xfU)) 
                                | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                               >> 2U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U] 
        = ((0xfe3fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U]) 
           | (0xffc00000U & ((0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                            << 0x13U)) 
                             | ((0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                              << 2U)) 
                                | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                << 0x11U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U] 
        = ((0xf1ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U]) 
           | (0xfe000000U & ((0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                            << 6U)) 
                             | ((0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                               << 0x15U)) 
                                | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                                 << 4U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U] 
        = ((0x8fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U]) 
           | (0xf0000000U & ((0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                             << 0x19U)) 
                             | ((0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                << 8U)) 
                                | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                  << 0x17U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                             << 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U] 
        = ((0xfffffff8U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U]) 
           | ((4U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                     >> 4U)) | ((2U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                       >> 0x15U)) | 
                                (1U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                       >> 6U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U] 
        = ((0xffffffc7U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U]) 
           | (0xfffffff8U & ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                       >> 0x11U)) | 
                             ((0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                        >> 2U)) | (8U 
                                                   & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                                      >> 0x13U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U] 
        = ((0xfffffe3fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U]) 
           | (0xffffffc0U & ((0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                        << 2U)) | (
                                                   (0x80U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                       >> 0xfU)) 
                                                   | (0x40U 
                                                      & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U])))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U] 
        = ((0xfffff1ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U]) 
           | (0xfffffe00U & ((0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                        >> 0xbU)) | 
                             ((0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                         << 4U)) | 
                              (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                         >> 0xdU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U] 
        = ((0xffff8fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U]) 
           | (0xfffff000U & ((0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                         << 8U)) | 
                             ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                          >> 9U)) | 
                              (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                          << 6U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                         >> 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U] 
        = ((0xfff8ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U]) 
           | (0xffff0000U & ((0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                          << 0xbU)) 
                             | ((0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                             >> 6U)) 
                                | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                               << 9U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U] 
        = ((0xffc7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U]) 
           | (0xfff80000U & ((0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                           >> 2U)) 
                             | ((0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                              << 0xdU)) 
                                | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                               >> 4U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U] 
        = ((0xfe3fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U]) 
           | (0xffc00000U & ((0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                            << 0x11U)) 
                             | ((0x800000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U]) 
                                | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                << 0xfU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U] 
        = ((0xf1ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U]) 
           | (0xfe000000U & ((0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                            << 4U)) 
                             | ((0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                               << 0x13U)) 
                                | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                                 << 2U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U] 
        = ((0x8fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U]) 
           | (0xf0000000U & ((0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                             << 0x17U)) 
                             | ((0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                << 6U)) 
                                | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                  << 0x15U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                             << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U] 
        = ((0xfffffff8U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U]) 
           | ((4U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                     >> 6U)) | ((2U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                       >> 0x17U)) | 
                                (1U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                       >> 8U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U] 
        = ((0xffffffc7U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U]) 
           | (0xfffffff8U & ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                       >> 0x13U)) | 
                             ((0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                        >> 4U)) | (8U 
                                                   & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                                      >> 0x15U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U] 
        = ((0xfffffe3fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U]) 
           | (0xffffffc0U & ((0x100U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U]) 
                             | ((0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                          >> 0x11U)) 
                                | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                            >> 2U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U] 
        = ((0xfffff1ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U]) 
           | (0xfffffe00U & ((0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                        >> 0xdU)) | 
                             ((0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                         << 2U)) | 
                              (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                         >> 0xfU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U] 
        = ((0xffff8fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U]) 
           | (0xfffff000U & ((0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                         << 6U)) | 
                             ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                          >> 0xbU)) 
                              | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                            << 4U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                         >> 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U] 
        = ((0xfff8ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U]) 
           | (0xffff0000U & ((0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                          << 9U)) | 
                             ((0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                           >> 8U)) 
                              | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                             << 7U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U] 
        = ((0xffc7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U]) 
           | (0xfff80000U & ((0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                           >> 4U)) 
                             | ((0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                              << 0xbU)) 
                                | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                               >> 6U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U] 
        = ((0xfe3fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U]) 
           | (0xffc00000U & ((0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                            << 0xfU)) 
                             | ((0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                              >> 2U)) 
                                | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                << 0xdU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U] 
        = ((0xf1ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U]) 
           | (0xfe000000U & ((0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                            << 2U)) 
                             | ((0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                               << 0x11U)) 
                                | (0x2000000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U])))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U] 
        = ((0x8fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U]) 
           | (0xf0000000U & ((0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                             << 0x15U)) 
                             | ((0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                << 4U)) 
                                | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                  << 0x13U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                             << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U] 
        = ((0xfffffff8U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U]) 
           | ((4U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                     >> 8U)) | ((2U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                       >> 0x19U)) | 
                                (1U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                       >> 0xaU)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U] 
        = ((0xffffffc7U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U]) 
           | (0xfffffff8U & ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                       >> 0x15U)) | 
                             ((0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                        >> 6U)) | (8U 
                                                   & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                                      >> 0x17U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U] 
        = ((0xfffffe3fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U]) 
           | (0xffffffc0U & ((0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                        >> 2U)) | (
                                                   (0x80U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                       >> 0x13U)) 
                                                   | (0x40U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                         >> 4U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U] 
        = ((0xfffff1ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U]) 
           | (0xfffffe00U & ((0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                        >> 0xfU)) | 
                             ((0x400U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U]) 
                              | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                           >> 0x11U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U] 
        = ((0xffff8fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U]) 
           | (0xfffff000U & ((0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                         << 4U)) | 
                             ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                          >> 0xdU)) 
                              | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                            << 2U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                         >> 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U] 
        = ((0xfff8ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U]) 
           | (0xffff0000U & ((0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                          << 7U)) | 
                             ((0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                           >> 0xaU)) 
                              | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                             << 5U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U] 
        = ((0xffc7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U]) 
           | (0xfff80000U & ((0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                           >> 6U)) 
                             | ((0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                              << 9U)) 
                                | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                               >> 8U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U] 
        = ((0xfe3fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U]) 
           | (0xffc00000U & ((0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                            << 0xdU)) 
                             | ((0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                              >> 4U)) 
                                | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                << 0xbU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U] 
        = ((0xf1ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U]) 
           | (0xfe000000U & ((0x8000000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U]) 
                             | ((0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                               << 0xfU)) 
                                | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                                 >> 2U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U] 
        = ((0x8fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U]) 
           | (0xf0000000U & ((0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                             << 0x13U)) 
                             | ((0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                << 2U)) 
                                | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                  << 0x11U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                             << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U] 
        = ((0xfffffff8U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U]) 
           | ((4U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                     >> 0xaU)) | ((2U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                         >> 0x1bU)) 
                                  | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                           >> 0xcU)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U] 
        = ((0xffffffc7U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U]) 
           | (0xfffffff8U & ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                       >> 0x17U)) | 
                             ((0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                        >> 8U)) | (8U 
                                                   & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                                      >> 0x19U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U] 
        = ((0xfffffe3fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U]) 
           | (0xffffffc0U & ((0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                        >> 4U)) | (
                                                   (0x80U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                       >> 0x15U)) 
                                                   | (0x40U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                         >> 6U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U] 
        = ((0xfffff1ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U]) 
           | (0xfffffe00U & ((0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                        >> 0x11U)) 
                             | ((0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                           >> 2U)) 
                                | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                             >> 0x13U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U] 
        = ((0xffff8fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U]) 
           | (0xfffff000U & ((0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                         << 2U)) | 
                             ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                          >> 0xfU)) 
                              | (0x1000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U])))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                         >> 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U] 
        = ((0xfff8ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U]) 
           | (0xffff0000U & ((0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                          << 5U)) | 
                             ((0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                           >> 0xcU)) 
                              | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                             << 3U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U] 
        = ((0xffc7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U]) 
           | (0xfff80000U & ((0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                           >> 8U)) 
                             | ((0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                              << 7U)) 
                                | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                               >> 0xaU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U] 
        = ((0xfe3fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U]) 
           | (0xffc00000U & ((0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                            << 0xbU)) 
                             | ((0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                              >> 6U)) 
                                | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                << 9U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U] 
        = ((0xf1ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U]) 
           | (0xfe000000U & ((0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                            >> 2U)) 
                             | ((0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                               << 0xdU)) 
                                | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                                 >> 4U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U] 
        = ((0x8fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U]) 
           | (0xf0000000U & ((0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                             << 0x11U)) 
                             | ((0x20000000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U]) 
                                | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                  << 0xfU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                             << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U] 
        = ((0xfffffff8U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U]) 
           | ((4U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                     >> 0xcU)) | ((2U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                         >> 0x1dU)) 
                                  | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                           >> 0xeU)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U] 
        = ((0xffffffc7U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U]) 
           | (0xfffffff8U & ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                       >> 0x19U)) | 
                             ((0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                        >> 0xaU)) | 
                              (8U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                     >> 0x1bU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U] 
        = ((0xfffffe3fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U]) 
           | (0xffffffc0U & ((0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                        >> 6U)) | (
                                                   (0x80U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                       >> 0x17U)) 
                                                   | (0x40U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                         >> 8U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U] 
        = ((0xfffff1ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U]) 
           | (0xfffffe00U & ((0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                        >> 0x13U)) 
                             | ((0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                           >> 4U)) 
                                | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                             >> 0x15U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U] 
        = ((0xffff8fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U]) 
           | (0xfffff000U & ((0x4000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U]) 
                             | ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                            >> 0x11U)) 
                                | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                              >> 2U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                         >> 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U] 
        = ((0xfff8ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U]) 
           | (0xffff0000U & ((0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                          << 3U)) | 
                             ((0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                           >> 0xeU)) 
                              | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[0U] 
                                             << 1U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U] 
        = ((0xffc7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U]) 
           | (0xfff80000U & ((0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                           >> 0xaU)) 
                             | ((0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[2U] 
                                              << 5U)) 
                                | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[1U] 
                                               >> 0xcU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U] 
        = ((0xfe3fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U]) 
           | (0xffc00000U & ((0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                            << 9U)) 
                             | ((0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                              >> 8U)) 
                                | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[3U] 
                                                << 7U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U] 
        = ((0xf1ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U]) 
           | (0xfe000000U & ((0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                            >> 4U)) 
                             | ((0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[5U] 
                                               << 0xbU)) 
                                | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[4U] 
                                                 >> 6U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U] 
        = ((0x8fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U]) 
           | (0xf0000000U & ((0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U] 
                                             << 0xfU)) 
                             | ((0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                >> 2U)) 
                                | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[6U] 
                                                  << 0xdU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U]) 
           | (0x80000000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d[7U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (1U & vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                        << 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                  >> 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                        << 0xeU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                  >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                        << 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                  >> 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                        << 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                     >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                         << 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                     >> 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                         << 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                     >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                         << 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                     >> 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                         << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                      >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                          << 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                      >> 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                          << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                      >> 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                          << 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                      >> 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                          << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                       >> 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                           << 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                       >> 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                           << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                       >> 0xeU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                           << 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                       >> 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w = 
        ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w) 
         | (0x80000000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data 
        = ((0x8000U & (vlSelf->sdio__DOT__tx_mem_data 
                       >> 0xfU)) | ((0x4000U & (vlSelf->sdio__DOT__tx_mem_data 
                                                >> 0xeU)) 
                                    | ((0x2000U & (vlSelf->sdio__DOT__tx_mem_data 
                                                   >> 0xdU)) 
                                       | ((0x1000U 
                                           & (vlSelf->sdio__DOT__tx_mem_data 
                                              >> 0xcU)) 
                                          | ((0x800U 
                                              & (vlSelf->sdio__DOT__tx_mem_data 
                                                 >> 0xbU)) 
                                             | ((0x400U 
                                                 & (vlSelf->sdio__DOT__tx_mem_data 
                                                    >> 0xaU)) 
                                                | ((0x200U 
                                                    & (vlSelf->sdio__DOT__tx_mem_data 
                                                       >> 9U)) 
                                                   | ((0x100U 
                                                       & (vlSelf->sdio__DOT__tx_mem_data 
                                                          >> 8U)) 
                                                      | ((0x80U 
                                                          & (vlSelf->sdio__DOT__tx_mem_data 
                                                             >> 7U)) 
                                                         | ((0x40U 
                                                             & (vlSelf->sdio__DOT__tx_mem_data 
                                                                >> 6U)) 
                                                            | ((0x20U 
                                                                & (vlSelf->sdio__DOT__tx_mem_data 
                                                                   >> 5U)) 
                                                               | ((0x10U 
                                                                   & (vlSelf->sdio__DOT__tx_mem_data 
                                                                      >> 4U)) 
                                                                  | ((8U 
                                                                      & (vlSelf->sdio__DOT__tx_mem_data 
                                                                         >> 3U)) 
                                                                     | ((4U 
                                                                         & (vlSelf->sdio__DOT__tx_mem_data 
                                                                            >> 2U)) 
                                                                        | ((2U 
                                                                            & (vlSelf->sdio__DOT__tx_mem_data 
                                                                               >> 1U)) 
                                                                           | (1U 
                                                                              & vlSelf->sdio__DOT__tx_mem_data))))))))))))))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 0xfU));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 0xeU));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 0xdU));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 0xcU));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 0xbU));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 0xaU));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 9U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 8U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 7U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 6U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 5U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 4U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w = 
        ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w) 
         | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data 
        = ((0x8000U & (vlSelf->sdio__DOT__tx_mem_data 
                       >> 0x10U)) | ((0x4000U & (vlSelf->sdio__DOT__tx_mem_data 
                                                 >> 0xfU)) 
                                     | ((0x2000U & 
                                         (vlSelf->sdio__DOT__tx_mem_data 
                                          >> 0xeU)) 
                                        | ((0x1000U 
                                            & (vlSelf->sdio__DOT__tx_mem_data 
                                               >> 0xdU)) 
                                           | ((0x800U 
                                               & (vlSelf->sdio__DOT__tx_mem_data 
                                                  >> 0xcU)) 
                                              | ((0x400U 
                                                  & (vlSelf->sdio__DOT__tx_mem_data 
                                                     >> 0xbU)) 
                                                 | ((0x200U 
                                                     & (vlSelf->sdio__DOT__tx_mem_data 
                                                        >> 0xaU)) 
                                                    | ((0x100U 
                                                        & (vlSelf->sdio__DOT__tx_mem_data 
                                                           >> 9U)) 
                                                       | ((0x80U 
                                                           & (vlSelf->sdio__DOT__tx_mem_data 
                                                              >> 8U)) 
                                                          | ((0x40U 
                                                              & (vlSelf->sdio__DOT__tx_mem_data 
                                                                 >> 7U)) 
                                                             | ((0x20U 
                                                                 & (vlSelf->sdio__DOT__tx_mem_data 
                                                                    >> 6U)) 
                                                                | ((0x10U 
                                                                    & (vlSelf->sdio__DOT__tx_mem_data 
                                                                       >> 5U)) 
                                                                   | ((8U 
                                                                       & (vlSelf->sdio__DOT__tx_mem_data 
                                                                          >> 4U)) 
                                                                      | ((4U 
                                                                          & (vlSelf->sdio__DOT__tx_mem_data 
                                                                             >> 3U)) 
                                                                         | ((2U 
                                                                             & (vlSelf->sdio__DOT__tx_mem_data 
                                                                                >> 2U)) 
                                                                            | (1U 
                                                                               & (vlSelf->sdio__DOT__tx_mem_data 
                                                                                >> 1U)))))))))))))))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 0xfU));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 0xeU));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 0xdU));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 0xcU));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 0xbU));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 0xaU));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 9U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 8U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 7U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 6U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 5U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 4U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__7__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w = 
        ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w) 
         | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC16__6__Vfuncout) 
            << 0x10U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w = 
        ((0xfffffff0U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w) 
         | (((8U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                    >> 0xeU)) | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                       << 1U))) | (
                                                   (2U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                                       >> 0xfU)) 
                                                   | (1U 
                                                      & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w = 
        ((0xffffff0fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w) 
         | (((0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                       >> 0xcU)) | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                             << 3U))) 
            | ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                         >> 0xdU)) | (0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                               << 2U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w = 
        ((0xfffff0ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w) 
         | (((0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                        >> 0xaU)) | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                               << 5U))) 
            | ((0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                          >> 0xbU)) | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                                 << 4U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w = 
        ((0xffff0fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w) 
         | (((0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                         >> 8U)) | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                               << 7U))) 
            | ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                           >> 9U)) | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                                 << 6U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w = 
        ((0xfff0ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w) 
         | (((0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                          >> 6U)) | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                                 << 9U))) 
            | ((0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                            >> 7U)) | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                                   << 8U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w = 
        ((0xff0fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w) 
         | (((0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                           >> 4U)) | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                                   << 0xbU))) 
            | ((0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                             >> 5U)) | (0x100000U & 
                                        (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                         << 0xaU)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w = 
        ((0xf0ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w) 
         | (((0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                            >> 2U)) | (0x4000000U & 
                                       (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                        << 0xdU))) 
            | ((0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                              >> 3U)) | (0x1000000U 
                                         & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                            << 0xcU)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w = 
        ((0xfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w) 
         | (((0x80000000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w) 
             | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                               << 0xfU))) | ((0x20000000U 
                                              & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                                 >> 1U)) 
                                             | (0x10000000U 
                                                & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w 
                                                   << 0xeU)))));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (1U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          << 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          << 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          << 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfffffffeU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfffeffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          << 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfffffffdU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (2U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfffdffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 0xeU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          << 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 0x10U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          >> 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 0x12U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          >> 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfffffffbU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (4U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 0x14U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfffbffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          >> 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 0x17U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 0x19U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          >> 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfffffff7U & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                    >> 0x1bU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfff7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                          >> 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           << 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           << 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x10U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           << 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xffffffefU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xffefffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           << 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           << 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           << 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xffffffdfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xffdfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           << 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           << 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 0xeU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           << 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xffffffbfU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 0x10U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xffbfffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           >> 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xffffff7fU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                       >> 0x17U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xff7fffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                           >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 0x17U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfffffeffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x100U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfeffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        << 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 0x10U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        >> 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 0xeU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        >> 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfffffdffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x200U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        >> 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfdffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        >> 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfffffbffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        >> 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfbffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        >> 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        >> 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x8000000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U]));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        >> 0x11U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xfffff7ffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        >> 0x13U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xf7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                            >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         << 0xcU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 0x1bU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         << 0xaU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 0x19U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         << 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 0x17U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xffffefffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xefffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 0x15U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         << 5U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 0x14U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         << 3U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 0x12U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         << 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 0x10U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xffffdfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         >> 1U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xdfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 0xeU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         >> 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         >> 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         >> 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xffffbfffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         >> 8U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xbfffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 7U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         >> 9U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 6U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         >> 0xbU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 4U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         >> 0xdU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]) 
           | (0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                             << 2U)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0xffff7fffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                         >> 0xfU)));
    vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
        = ((0x7fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]) 
           | (0x80000000U & vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U]));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data 
        = ((8U & (vlSelf->sdio__DOT__tx_mem_data >> 0x15U)) 
           | ((4U & (vlSelf->sdio__DOT__tx_mem_data 
                     >> 0xeU)) | ((2U & (vlSelf->sdio__DOT__tx_mem_data 
                                         >> 7U)) | 
                                  (1U & vlSelf->sdio__DOT__tx_mem_data))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U]);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
        = ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U]) 
           | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data 
        = ((8U & (vlSelf->sdio__DOT__tx_mem_data >> 0x16U)) 
           | ((4U & (vlSelf->sdio__DOT__tx_mem_data 
                     >> 0xfU)) | ((2U & (vlSelf->sdio__DOT__tx_mem_data 
                                         >> 8U)) | 
                                  (1U & (vlSelf->sdio__DOT__tx_mem_data 
                                         >> 1U)))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[0U] 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
        = ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U]) 
           | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout) 
              << 0x10U));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data 
        = ((8U & (vlSelf->sdio__DOT__tx_mem_data >> 0x17U)) 
           | ((4U & (vlSelf->sdio__DOT__tx_mem_data 
                     >> 0x10U)) | ((2U & (vlSelf->sdio__DOT__tx_mem_data 
                                          >> 9U)) | 
                                   (1U & (vlSelf->sdio__DOT__tx_mem_data 
                                          >> 2U)))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U]);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
        = ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U]) 
           | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data 
        = ((8U & (vlSelf->sdio__DOT__tx_mem_data >> 0x18U)) 
           | ((4U & (vlSelf->sdio__DOT__tx_mem_data 
                     >> 0x11U)) | ((2U & (vlSelf->sdio__DOT__tx_mem_data 
                                          >> 0xaU)) 
                                   | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                                            >> 3U)))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[1U] 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
        = ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U]) 
           | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout) 
              << 0x10U));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data 
        = ((8U & (vlSelf->sdio__DOT__tx_mem_data >> 0x19U)) 
           | ((4U & (vlSelf->sdio__DOT__tx_mem_data 
                     >> 0x12U)) | ((2U & (vlSelf->sdio__DOT__tx_mem_data 
                                          >> 0xbU)) 
                                   | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                                            >> 4U)))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U]);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
        = ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U]) 
           | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data 
        = ((8U & (vlSelf->sdio__DOT__tx_mem_data >> 0x1aU)) 
           | ((4U & (vlSelf->sdio__DOT__tx_mem_data 
                     >> 0x13U)) | ((2U & (vlSelf->sdio__DOT__tx_mem_data 
                                          >> 0xcU)) 
                                   | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                                            >> 5U)))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[2U] 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
        = ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U]) 
           | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout) 
              << 0x10U));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data 
        = ((8U & (vlSelf->sdio__DOT__tx_mem_data >> 0x1bU)) 
           | ((4U & (vlSelf->sdio__DOT__tx_mem_data 
                     >> 0x14U)) | ((2U & (vlSelf->sdio__DOT__tx_mem_data 
                                          >> 0xdU)) 
                                   | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                                            >> 6U)))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior 
        = (0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U]);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
        = ((0xffff0000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U]) 
           | (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data 
        = ((8U & (vlSelf->sdio__DOT__tx_mem_data >> 0x1cU)) 
           | ((4U & (vlSelf->sdio__DOT__tx_mem_data 
                     >> 0x15U)) | ((2U & (vlSelf->sdio__DOT__tx_mem_data 
                                          >> 0xeU)) 
                                   | (1U & (vlSelf->sdio__DOT__tx_mem_data 
                                            >> 7U)))));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior 
        = (vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w[3U] 
           >> 0x10U);
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 3U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 2U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data) 
                 >> 1U));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit 
        = (1U & (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__i_crc_data));
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout 
        = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                     >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__i_bit)))
            ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                     << 1U))) : (0xfffeU 
                                                 & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__prior) 
                                                    << 1U)));
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill 
        = vlSelf->__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__11__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout 
        = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__fill;
    vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
        = ((0xffffU & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U]) 
           | ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC4__10__Vfuncout) 
              << 0x10U));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U] 
        = ((0xfffffff8U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U]) 
           | ((4U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                     << 2U)) | ((2U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                       >> 0xfU)) | 
                                (1U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U]))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U] 
        = ((0xffffffc7U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U]) 
           | (0xfffffff8U & ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                       >> 0xbU)) | 
                             ((0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                        << 4U)) | (8U 
                                                   & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                                      >> 0xdU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U] 
        = ((0xffffff3fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U]) 
           | (0xffffffc0U & ((0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                       >> 9U)) | (0x40U 
                                                  & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                                     << 6U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U] 
        = ((0xfffff8ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U]) 
           | (0xffffff00U & ((0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                        << 9U)) | (
                                                   (0x200U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                                       >> 8U)) 
                                                   | (0x100U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                                         << 7U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U] 
        = ((0xffffc7ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U]) 
           | (0xfffff800U & ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                         >> 4U)) | 
                             ((0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                          << 0xbU)) 
                              | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                           >> 6U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U] 
        = ((0xffff3fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U]) 
           | (0xffffc000U & ((0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                         >> 2U)) | 
                             (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                         << 0xdU)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U] 
        = ((0xfff8ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U]) 
           | (0xffff0000U & ((0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                          << 0x10U)) 
                             | ((0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                             >> 1U)) 
                                | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                               << 0xeU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U] 
        = ((0xffc7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U]) 
           | (0xfff80000U & ((0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                           << 3U)) 
                             | ((0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                              << 0x12U)) 
                                | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                               << 1U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U] 
        = ((0xff3fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U]) 
           | (0xffc00000U & ((0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                           << 5U)) 
                             | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                             << 0x14U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U] 
        = ((0xf8ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U]) 
           | (0xff000000U & ((0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                            << 0x17U)) 
                             | ((0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                               << 6U)) 
                                | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                                 << 0x15U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U] 
        = ((0xc7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U]) 
           | (0xf8000000U & ((0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                             << 0xaU)) 
                             | ((0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                                << 0x19U)) 
                                | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                                 << 8U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U] 
        = ((0x3fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U]) 
           | (0xc0000000U & ((0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                             << 0xcU)) 
                             | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                               << 0x1bU)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U] 
        = ((0xfffffff8U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U]) 
           | ((4U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                     >> 2U)) | ((2U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                       >> 0x13U)) | 
                                (1U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                       >> 4U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U] 
        = ((0xffffffc7U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U]) 
           | (0xfffffff8U & ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                       >> 0xfU)) | 
                             ((0x10U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U]) 
                              | (8U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                       >> 0x11U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U] 
        = ((0xffffff3fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U]) 
           | (0xffffffc0U & ((0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                       >> 0xdU)) | 
                             (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                       << 2U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U] 
        = ((0xfffff8ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U]) 
           | (0xffffff00U & ((0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                        << 5U)) | (
                                                   (0x200U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                                       >> 0xcU)) 
                                                   | (0x100U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                                         << 3U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U] 
        = ((0xffffc7ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U]) 
           | (0xfffff800U & ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                         >> 8U)) | 
                             ((0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                          << 7U)) | 
                              (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                         >> 0xaU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U] 
        = ((0xffff3fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U]) 
           | (0xffffc000U & ((0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                         >> 6U)) | 
                             (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                         << 9U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U] 
        = ((0xfff8ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U]) 
           | (0xffff0000U & ((0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                          << 0xcU)) 
                             | ((0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                             >> 5U)) 
                                | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                               << 0xaU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U] 
        = ((0xffc7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U]) 
           | (0xfff80000U & ((0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                           >> 1U)) 
                             | ((0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                              << 0xeU)) 
                                | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                               >> 3U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U] 
        = ((0xff3fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U]) 
           | (0xffc00000U & ((0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                           << 1U)) 
                             | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                             << 0x10U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U] 
        = ((0xf8ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U]) 
           | (0xff000000U & ((0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                            << 0x13U)) 
                             | ((0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                               << 2U)) 
                                | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                                 << 0x11U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U] 
        = ((0xc7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U]) 
           | (0xf8000000U & ((0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                             << 6U)) 
                             | ((0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                                << 0x15U)) 
                                | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                                 << 4U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U] 
        = ((0x3fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U]) 
           | (0xc0000000U & ((0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                             << 8U)) 
                             | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                               << 0x17U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U] 
        = ((0xfffffff8U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U]) 
           | ((4U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                     >> 6U)) | ((2U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                       >> 0x17U)) | 
                                (1U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                       >> 8U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U] 
        = ((0xffffffc7U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U]) 
           | (0xfffffff8U & ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                       >> 0x13U)) | 
                             ((0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                        >> 4U)) | (8U 
                                                   & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                                      >> 0x15U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U] 
        = ((0xffffff3fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U]) 
           | (0xffffffc0U & ((0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                       >> 0x11U)) | 
                             (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                       >> 2U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U] 
        = ((0xfffff8ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U]) 
           | (0xffffff00U & ((0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                        << 1U)) | (
                                                   (0x200U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                                       >> 0x10U)) 
                                                   | (0x100U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                                         >> 1U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U] 
        = ((0xffffc7ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U]) 
           | (0xfffff800U & ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                         >> 0xcU)) 
                             | ((0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                            << 3U)) 
                                | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                             >> 0xeU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U] 
        = ((0xffff3fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U]) 
           | (0xffffc000U & ((0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                         >> 0xaU)) 
                             | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                           << 5U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U] 
        = ((0xfff8ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U]) 
           | (0xffff0000U & ((0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                          << 8U)) | 
                             ((0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                           >> 9U)) 
                              | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                             << 6U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U] 
        = ((0xffc7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U]) 
           | (0xfff80000U & ((0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                           >> 5U)) 
                             | ((0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                              << 0xaU)) 
                                | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                               >> 7U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U] 
        = ((0xff3fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U]) 
           | (0xffc00000U & ((0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                           >> 3U)) 
                             | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                             << 0xcU)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U] 
        = ((0xf8ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U]) 
           | (0xff000000U & ((0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                            << 0xfU)) 
                             | ((0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                               >> 2U)) 
                                | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                                 << 0xdU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U] 
        = ((0xc7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U]) 
           | (0xf8000000U & ((0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                             << 2U)) 
                             | ((0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                                << 0x11U)) 
                                | (0x8000000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U])))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U] 
        = ((0x3fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U]) 
           | (0xc0000000U & ((0x80000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                             << 4U)) 
                             | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                               << 0x13U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U] 
        = ((0xfffffff8U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U]) 
           | ((4U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                     >> 0xaU)) | ((2U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                         >> 0x1bU)) 
                                  | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                           >> 0xcU)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U] 
        = ((0xffffffc7U & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U]) 
           | (0xfffffff8U & ((0x20U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                       >> 0x17U)) | 
                             ((0x10U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                        >> 8U)) | (8U 
                                                   & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                                      >> 0x19U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U] 
        = ((0xffffff3fU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U]) 
           | (0xffffffc0U & ((0x80U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                       >> 0x15U)) | 
                             (0x40U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                       >> 6U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U] 
        = ((0xfffff8ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U]) 
           | (0xffffff00U & ((0x400U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                        >> 3U)) | (
                                                   (0x200U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                                       >> 0x14U)) 
                                                   | (0x100U 
                                                      & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                                         >> 5U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U] 
        = ((0xffffc7ffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U]) 
           | (0xfffff800U & ((0x2000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                         >> 0x10U)) 
                             | ((0x1000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                            >> 1U)) 
                                | (0x800U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                             >> 0x12U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U] 
        = ((0xffff3fffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U]) 
           | (0xffffc000U & ((0x8000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                         >> 0xeU)) 
                             | (0x4000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                           << 1U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U] 
        = ((0xfff8ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U]) 
           | (0xffff0000U & ((0x40000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                          << 4U)) | 
                             ((0x20000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                           >> 0xdU)) 
                              | (0x10000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                             << 2U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U] 
        = ((0xffc7ffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U]) 
           | (0xfff80000U & ((0x200000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                           >> 9U)) 
                             | ((0x100000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                              << 6U)) 
                                | (0x80000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                               >> 0xbU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U] 
        = ((0xff3fffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U]) 
           | (0xffc00000U & ((0x800000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                           >> 7U)) 
                             | (0x400000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                             << 8U)))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U] 
        = ((0xf8ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U]) 
           | (0xff000000U & ((0x4000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                            << 0xbU)) 
                             | ((0x2000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                               >> 6U)) 
                                | (0x1000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[0U] 
                                                 << 9U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U] 
        = ((0xc7ffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U]) 
           | (0xf8000000U & ((0x20000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                             >> 2U)) 
                             | ((0x10000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[2U] 
                                                << 0xdU)) 
                                | (0x8000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[1U] 
                                                 >> 4U))))));
    vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U] 
        = ((0x3fffffffU & vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U]) 
           | (0xc0000000U & ((0x80000000U & vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U]) 
                             | (0x40000000U & (vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w[3U] 
                                               << 0xfU)))));
    vlSelf->sdio__DOT__u_clkgen__DOT__nxt_clk = 0U;
    vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter = vlSelf->sdio__DOT__u_clkgen__DOT__counter;
    vlSelf->sdio__DOT__u_clkgen__DOT__nxt_stb = (1U 
                                                 & (((0xffU 
                                                      & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__counter)) 
                                                     - (IData)(1U)) 
                                                    >> 8U));
    vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter = 
        ((0x300U & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter)) 
         | (0xffU & ((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__counter) 
                     - (IData)(1U))));
    if (vlSelf->sdio__DOT__u_clkgen__DOT__nxt_stb) {
        vlSelf->sdio__DOT__u_clkgen__DOT____Vconcswap_1_h246111ff__0 
            = (1U & (((IData)(1U) + (3U & ((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter) 
                                           >> 8U))) 
                     >> 2U));
        vlSelf->sdio__DOT__u_clkgen__DOT____Vconcswap_1_h25627e99__0 
            = (3U & ((IData)(1U) + ((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter) 
                                    >> 8U)));
        vlSelf->sdio__DOT__u_clkgen__DOT__nxt_clk = vlSelf->sdio__DOT__u_clkgen__DOT____Vconcswap_1_h246111ff__0;
        vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter 
            = ((0xffU & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter)) 
               | ((IData)(vlSelf->sdio__DOT__u_clkgen__DOT____Vconcswap_1_h25627e99__0) 
                  << 8U));
        if ((1U >= (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__ckspd))) {
            vlSelf->sdio__DOT__u_clkgen__DOT__nxt_clk = 1U;
            vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter 
                = (0x300U & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter));
        } else if ((2U == (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__ckspd))) {
            vlSelf->sdio__DOT__u_clkgen__DOT__nxt_clk 
                = (1U & ((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__counter) 
                         >> 9U));
            vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter 
                = (0x300U & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter));
        } else {
            vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter 
                = ((0x300U & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter)) 
                   | (0xffU & ((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__ckspd) 
                               - (IData)(3U))));
        }
    }
    if (vlSelf->sdio__DOT__u_clkgen__DOT__nxt_clk) {
        vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter 
            = ((1U >= (IData)(vlSelf->sdio__DOT__u_control__DOT__r_ckspeed))
                ? 0x300U : ((2U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_ckspeed))
                             ? 0x100U : ((0x300U & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter)) 
                                         | (0xffU & 
                                            ((IData)(vlSelf->sdio__DOT__u_control__DOT__r_ckspeed) 
                                             - (IData)(3U))))));
        vlSelf->sdio__DOT__u_clkgen__DOT__w_clk90 = vlSelf->sdio__DOT__cfg_clk90;
        vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd = vlSelf->sdio__DOT__u_control__DOT__r_ckspeed;
    } else {
        vlSelf->sdio__DOT__u_clkgen__DOT__w_clk90 = vlSelf->sdio__DOT__u_clkgen__DOT__clk90;
        vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd = vlSelf->sdio__DOT__u_clkgen__DOT__ckspd;
    }
    __Vtableidx2 = (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr) 
                     << 4U) | (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period) 
                                << 2U) | (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width)));
    vlSelf->sdio__DOT__u_txframe__DOT__fd_offset = 
        Vsdio__ConstPool__TABLE_h44593cd3_0[__Vtableidx2];
    vlSelf->sdio__DOT__u_control__DOT__mem_busy = ((IData)(vlSelf->sdio__DOT__tx_en) 
                                                   | ((IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_request) 
                                                      | ((IData)(vlSelf->sdio__DOT__rx_en) 
                                                         | ((IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_request) 
                                                            | ((IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy) 
                                                               & (2U 
                                                                  == (IData)(vlSelf->sdio__DOT__cmd_type)))))));
    vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb = 
        ((IData)(vlSelf->i_wb_stb) & ((0U == (IData)(vlSelf->i_wb_addr)) 
                                      & ((IData)(vlSelf->i_wb_we) 
                                         & ((~ ((IData)(vlSelf->sdio__DOT__u_control__DOT__r_cmd_err) 
                                                | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_err))) 
                                            | (((IData)(vlSelf->i_wb_sel) 
                                                >> 1U) 
                                               & (vlSelf->i_wb_data 
                                                  >> 0xfU))))));
    vlSelf->sdio__DOT__u_txframe__DOT__start_packet 
        = ((IData)(vlSelf->sdio__DOT__tx_en) & ((IData)(vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID) 
                                                & ((IData)(vlSelf->sdio__DOT__clk_stb) 
                                                   & (~ (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_valid)))));
    vlSelf->sdio__DOT__tx_mem_ready = ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__pre_ready) 
                                       & ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate)) 
                                          | (0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate))));
    vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept = ((IData)(vlSelf->sdio__DOT__cmd_request) 
                                                   & ((~ (IData)(vlSelf->sdio__DOT__cmd_busy)) 
                                                      & ((IData)(vlSelf->sdio__DOT__cmd_done) 
                                                         | ((~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__r_busy)) 
                                                            | ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_self_request) 
                                                               & ((~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__response_active)) 
                                                                  | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout)))))));
    vlSelf->sdio__DOT__u_txframe__DOT__fd_count = (
                                                   ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count) 
                                                    > (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_offset))
                                                    ? 
                                                   (0x7fffU 
                                                    & ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count) 
                                                       - (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_offset)))
                                                    : 0U);
    vlSelf->sdio__DOT__u_control__DOT__w_cmd_word = 0U;
    vlSelf->sdio__DOT__u_control__DOT__w_cmd_word = 
        ((0xff0fffffU & vlSelf->sdio__DOT__u_control__DOT__w_cmd_word) 
         | (((IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_ecode) 
             << 0x17U) | (((IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_err) 
                           << 0x16U) | (((IData)(vlSelf->sdio__DOT__u_control__DOT__r_cmd_err) 
                                         << 0x15U) 
                                        | ((IData)(vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_card_busy) 
                                           << 0x14U)))));
    vlSelf->sdio__DOT__u_control__DOT__w_cmd_word = 
        ((0xfff07fffU & vlSelf->sdio__DOT__u_control__DOT__w_cmd_word) 
         | (((IData)(vlSelf->sdio__DOT__u_control__DOT__r_cmd_ecode) 
             << 0x10U) | (((IData)(vlSelf->sdio__DOT__u_control__DOT__r_cmd_err) 
                           | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_err)) 
                          << 0xfU)));
    vlSelf->sdio__DOT__u_control__DOT__w_cmd_word = 
        ((0xffff87ffU & vlSelf->sdio__DOT__u_control__DOT__w_cmd_word) 
         | (((IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy) 
             << 0xeU) | (((IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo) 
                          << 0xcU) | ((IData)(vlSelf->sdio__DOT__u_control__DOT__mem_busy) 
                                      << 0xbU))));
    vlSelf->sdio__DOT__u_control__DOT__w_cmd_word = 
        ((0xfffff8ffU & vlSelf->sdio__DOT__u_control__DOT__w_cmd_word) 
         | ((((IData)(vlSelf->sdio__DOT__tx_en) | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_request)) 
             << 0xaU) | ((IData)(vlSelf->sdio__DOT__cmd_type) 
                         << 8U)));
    vlSelf->sdio__DOT__u_control__DOT__w_cmd_word = 
        ((0xffffff80U & vlSelf->sdio__DOT__u_control__DOT__w_cmd_word) 
         | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_cmd));
    vlSelf->sdio__DOT__u_control__DOT__new_data_request 
        = ((((IData)(vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb) 
             & (3U == (3U & (IData)(vlSelf->i_wb_sel)))) 
            & (((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy)) 
                & (0x40U == (0xc0U & vlSelf->i_wb_data))) 
               | (0U == (3U & (vlSelf->i_wb_data >> 6U))))) 
           & ((vlSelf->i_wb_data >> 0xbU) | ((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy)) 
                                             & (0x240U 
                                                == 
                                                (0x3c0U 
                                                 & vlSelf->i_wb_data)))));
    if (vlSelf->sdio__DOT__cmd_err) {
        vlSelf->sdio__DOT__u_control__DOT__new_data_request = 0U;
    }
    if (vlSelf->sdio__DOT__u_control__DOT__mem_busy) {
        vlSelf->sdio__DOT__u_control__DOT__new_data_request = 0U;
    }
    vlSelf->sdio__DOT__u_control__DOT__w_selfreply_request 
        = (((((~ (IData)(vlSelf->sdio__DOT__cmd_request)) 
              & (IData)(vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb)) 
             & (3U == (3U & (IData)(vlSelf->i_wb_sel)))) 
            & (0U == (0xb00U & vlSelf->i_wb_data))) 
           & ((IData)(((0U == (0xc0U & vlSelf->i_wb_data)) 
                       & (0U != (0x3fU & vlSelf->i_wb_data)))) 
              | (IData)((0x40U == (0xffU & vlSelf->i_wb_data)))));
    vlSelf->sdio__DOT____Vcellinp__u_control__i_tx_mem_ready 
        = ((IData)(vlSelf->sdio__DOT__tx_en) & (IData)(vlSelf->sdio__DOT__tx_mem_ready));
    if (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count) 
         < (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_offset))) {
        vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count = 0U;
    } else if (vlSelf->o_data_en) {
        if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))) {
            if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count 
                    = (0x7fffU & (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_count) 
                                   + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts)) 
                                  + ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra)
                                      ? 1U : 0U)));
            } else if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count 
                    = (0x7fffU & (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_count) 
                                   + VL_SHIFTL_III(15,32,32, (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts), 2U)) 
                                  + ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra)
                                      ? 4U : 0U)));
            } else if ((2U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count 
                    = (0x7fffU & (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_count) 
                                   + VL_SHIFTL_III(15,32,32, (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts), 3U)) 
                                  + ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra)
                                      ? 8U : 0U)));
            }
        } else if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))) {
            if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count 
                    = (0x7fffU & (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_count) 
                                   + VL_SHIFTL_III(15,32,32, (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts), 1U)) 
                                  + ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra)
                                      ? 2U : 0U)));
            } else if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count 
                    = (0x7fffU & (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_count) 
                                   + VL_SHIFTL_III(15,32,32, (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts), 3U)) 
                                  + ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra)
                                      ? 8U : 0U)));
            } else if ((2U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count 
                    = (0x7fffU & (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_count) 
                                   + VL_SHIFTL_III(15,32,32, (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts), 4U)) 
                                  + ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra)
                                      ? 0x10U : 0U)));
            }
        } else if ((2U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))) {
            if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count 
                    = (0x7fffU & (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_count) 
                                   + VL_SHIFTL_III(15,32,32, (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts), 2U)) 
                                  + ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra)
                                      ? 4U : 0U)));
            } else if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count 
                    = (0x7fffU & (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_count) 
                                   + VL_SHIFTL_III(15,32,32, (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts), 4U)) 
                                  + ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra)
                                      ? 0x10U : 0U)));
            } else if ((2U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count 
                    = (0x7fffU & (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_count) 
                                   + VL_SHIFTL_III(15,32,32, (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts), 5U)) 
                                  + ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra)
                                      ? 0x20U : 0U)));
            }
        }
    } else {
        vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count 
            = (0x7fffU & ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count) 
                          - (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_offset)));
    }
    if (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset))) {
        vlSelf->sdio__DOT__u_control__DOT__new_data_request = 0U;
    }
    vlSelf->sdio__DOT__u_control__DOT__new_tx_request 
        = ((IData)(vlSelf->sdio__DOT__u_control__DOT__new_data_request) 
           & (vlSelf->i_wb_data >> 0xaU));
    if ((IData)((0x240U == (0x3c0U & vlSelf->i_wb_data)))) {
        vlSelf->sdio__DOT__u_control__DOT__new_tx_request = 0U;
    }
    if (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset))) {
        vlSelf->sdio__DOT__u_control__DOT__w_selfreply_request = 0U;
    }
    vlSelf->sdio__DOT__u_control__DOT__new_cmd_request 
        = (((IData)(vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb) 
            & (3U == (3U & (IData)(vlSelf->i_wb_sel)))) 
           & (((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy)) 
               & (0x40U == (0xc0U & vlSelf->i_wb_data))) 
              | (IData)(vlSelf->sdio__DOT__u_control__DOT__w_selfreply_request)));
    if (((IData)(vlSelf->sdio__DOT__u_control__DOT__mem_busy) 
         & ((2U == (3U & (vlSelf->i_wb_data >> 8U))) 
            | (vlSelf->i_wb_data >> 0xbU)))) {
        vlSelf->sdio__DOT__u_control__DOT__new_cmd_request = 0U;
    }
    if (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset))) {
        vlSelf->sdio__DOT__u_control__DOT__new_tx_request = 0U;
        vlSelf->sdio__DOT__u_control__DOT__new_cmd_request = 0U;
    }
}
