// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsdspi.h for the primary calling header

#include "Vsdspi__pch.h"
#include "Vsdspi___024root.h"

VL_ATTR_COLD void Vsdspi___024root___eval_static(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_static\n"); );
}

VL_ATTR_COLD void Vsdspi___024root___eval_initial__TOP(Vsdspi___024root* vlSelf);

VL_ATTR_COLD void Vsdspi___024root___eval_initial(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_initial\n"); );
    // Body
    Vsdspi___024root___eval_initial__TOP(vlSelf);
    vlSelf->__Vm_traceActivity[1U] = 1U;
    vlSelf->__Vm_traceActivity[0U] = 1U;
    vlSelf->__Vtrigprevexpr___TOP__i_clk__0 = vlSelf->i_clk;
}

VL_ATTR_COLD void Vsdspi___024root___eval_initial__TOP(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_initial__TOP\n"); );
    // Body
    vlSelf->sdspi__DOT__write_fifo_a = 0U;
    vlSelf->sdspi__DOT__write_fifo_b = 0U;
    vlSelf->sdspi__DOT__r_fifo_id = 0U;
    vlSelf->sdspi__DOT__r_cmd_busy = 0U;
    vlSelf->sdspi__DOT__tx_start = 0U;
    vlSelf->sdspi__DOT__rx_start = 0U;
    vlSelf->sdspi__DOT__r_cmd_err = 0U;
    vlSelf->sdspi__DOT__ll_cmd_stb = 0U;
    vlSelf->sdspi__DOT__r_sdspi_clk = 0x7cU;
    vlSelf->sdspi__DOT__r_lgblklen = 9U;
    vlSelf->sdspi__DOT__dly_stb = 0U;
    vlSelf->o_wb_ack = 0U;
    vlSelf->sdspi__DOT__last_busy = 0U;
    vlSelf->o_int = 0U;
    vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_removed = 1U;
    vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present = 0U;
    vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter = 0U;
    vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_present = 0U;
    vlSelf->sdspi__DOT__r_watchdog_err = 0U;
    vlSelf->sdspi__DOT__r_watchdog = 0x3ffffffU;
    vlSelf->sdspi__DOT__dbg_trigger = 0U;
    vlSelf->o_wb_stall = 0U;
    vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter = 0x3e8U;
    vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__r_powerup_hold = 1U;
    vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter = 0x4bU;
    vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold = 1U;
    vlSelf->sdspi__DOT__lowlevel__DOT__r_clk_counter = 0U;
    vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter = 1U;
    vlSelf->o_cs_n = 1U;
    vlSelf->sdspi__DOT__lowlevel__DOT__r_state = 0U;
    vlSelf->sdspi__DOT__lowlevel__DOT__r_idle = 0U;
    vlSelf->o_sck = 1U;
    vlSelf->sdspi__DOT__lowlevel__DOT__r_byte = 0xffU;
    vlSelf->o_mosi = 1U;
    vlSelf->sdspi__DOT__ll_out_stb = 0U;
    vlSelf->sdspi__DOT__cmd_busy = 0U;
    vlSelf->sdspi__DOT__spicmdi__DOT__shift_data = 0xffffffffffULL;
    vlSelf->sdspi__DOT__cmd_sent = 0U;
    vlSelf->sdspi__DOT__spicmdi__DOT__crc_valid_sreg = 0x10U;
    vlSelf->sdspi__DOT__spicmdi__DOT__crc_busy = 0U;
    vlSelf->sdspi__DOT__spicmdi__DOT__crc_bit_counter = 0x14U;
    vlSelf->sdspi__DOT__spicmdi__DOT__crc_byte = 0U;
    vlSelf->sdspi__DOT__spicmdi__DOT__rxvalid = 0U;
    vlSelf->sdspi__DOT__spicmdi__DOT__rx_counter = 1U;
    vlSelf->sdspi__DOT__cmd_valid = 0U;
    vlSelf->sdspi__DOT__cmd_response = 0xffffffffffULL;
    vlSelf->sdspi__DOT__spirxdatai__DOT__received_token = 0U;
    vlSelf->sdspi__DOT__rx_busy = 0U;
    vlSelf->sdspi__DOT__rx_valid = 0U;
    vlSelf->sdspi__DOT__rx_response = 0U;
    vlSelf->sdspi__DOT__spi_write_to_fifo = 0U;
    vlSelf->sdspi__DOT__spi_write_data = 0U;
    vlSelf->sdspi__DOT__spirxdatai__DOT__fill = 0U;
    vlSelf->sdspi__DOT__spirxdatai__DOT__all_mem_written = 0U;
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_byte = 0U;
    vlSelf->sdspi__DOT__spirxdatai__DOT__r_lgblksz_m3 = 0U;
    vlSelf->sdspi__DOT__spirxdatai__DOT__lastaddr = 0U;
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_fill = 0U;
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_active = 0U;
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_data = 0U;
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_err = 0U;
    vlSelf->sdspi__DOT__tx_busy = 0U;
    vlSelf->sdspi__DOT__tx_valid = 0U;
    vlSelf->sdspi__DOT__spitxdatai__DOT__received_token = 0U;
    vlSelf->sdspi__DOT__spitxdatai__DOT__all_idle = 0U;
    vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid = 0U;
    vlSelf->sdspi__DOT__tx_stb = 0U;
    vlSelf->sdspi__DOT__spitxdatai__DOT__fill = 0U;
    vlSelf->sdspi__DOT__spitxdatai__DOT__crc_stb = 0U;
    vlSelf->sdspi__DOT__spi_read_from_fifo = 0U;
    vlSelf->sdspi__DOT__spitxdatai__DOT__all_mem_read = 0U;
    vlSelf->sdspi__DOT__spitxdatai__DOT__crc_flag = 0U;
    vlSelf->sdspi__DOT__spitxdatai__DOT__data_sent = 0U;
    vlSelf->sdspi__DOT__spitxdatai__DOT__r_lgblksz_m3 = 0U;
    vlSelf->sdspi__DOT__spitxdatai__DOT__lastaddr = 0U;
    vlSelf->sdspi__DOT__spitxdatai__DOT__crc_fill = 0U;
}

VL_ATTR_COLD void Vsdspi___024root___eval_final(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_final\n"); );
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdspi___024root___dump_triggers__stl(Vsdspi___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vsdspi___024root___eval_phase__stl(Vsdspi___024root* vlSelf);

VL_ATTR_COLD void Vsdspi___024root___eval_settle(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_settle\n"); );
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
            Vsdspi___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("sdspi.v", 44, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vsdspi___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelf->__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdspi___024root___dump_triggers__stl(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VstlTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vsdspi___024root___stl_sequent__TOP__0(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___stl_sequent__TOP__0\n"); );
    // Body
    vlSelf->sdspi__DOT__lowlevel__DOT__powerup_hold 
        = vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__r_powerup_hold;
    vlSelf->sdspi__DOT__lowlevel__DOT__startup_hold 
        = vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold;
    vlSelf->sdspi__DOT__spicmdi__DOT__next_crc_byte 
        = (0x7eU & (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__crc_byte));
    if ((IData)((((IData)(vlSelf->sdspi__DOT__spicmdi__DOT__crc_byte) 
                  >> 7U) ^ (vlSelf->sdspi__DOT__spicmdi__DOT__crc_shift_reg 
                            >> 0x27U)))) {
        vlSelf->sdspi__DOT__spicmdi__DOT__next_crc_byte 
            = (9U ^ (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__next_crc_byte));
    }
    vlSelf->sdspi__DOT__spicmdi__DOT__next_crc_byte 
        = (0x7fU & ((1U & (((IData)(vlSelf->sdspi__DOT__spicmdi__DOT__next_crc_byte) 
                            >> 6U) ^ (IData)((vlSelf->sdspi__DOT__spicmdi__DOT__crc_shift_reg 
                                              >> 0x26U))))
                     ? (9U ^ VL_SHIFTL_III(7,7,32, (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__next_crc_byte), 1U))
                     : VL_SHIFTL_III(7,7,32, (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__next_crc_byte), 1U)));
    vlSelf->sdspi__DOT__spitxdatai__DOT__next_crc_data 
        = (0xffffU & VL_SHIFTL_III(16,16,32, (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_data), 1U));
    if ((IData)((((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_data) 
                  >> 0xfU) ^ (vlSelf->sdspi__DOT__spitxdatai__DOT__crc_gearbox 
                              >> 0x1fU)))) {
        vlSelf->sdspi__DOT__spitxdatai__DOT__next_crc_data 
            = (0x1021U ^ (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__next_crc_data));
    }
    vlSelf->sdspi__DOT__spitxdatai__DOT__next_crc_data 
        = (0xffffU & ((1U & (((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__next_crc_data) 
                              >> 0xfU) ^ (vlSelf->sdspi__DOT__spitxdatai__DOT__crc_gearbox 
                                          >> 0x1eU)))
                       ? (0x1021U ^ VL_SHIFTL_III(16,16,32, (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__next_crc_data), 1U))
                       : VL_SHIFTL_III(16,16,32, (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__next_crc_data), 1U)));
    vlSelf->sdspi__DOT____VdfgTmp_h302b62a3__0 = ((IData)(vlSelf->sdspi__DOT__r_use_fifo) 
                                                  & (IData)(vlSelf->sdspi__DOT__tx_busy));
    vlSelf->sdspi__DOT__spirxdatai__DOT__first_crc_data 
        = (0xffffU & VL_SHIFTL_III(16,16,32, (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_data), 1U));
    if ((IData)((((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_data) 
                  >> 0xfU) ^ ((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_gearbox) 
                              >> 7U)))) {
        vlSelf->sdspi__DOT__spirxdatai__DOT__first_crc_data 
            = (0x1021U ^ (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__first_crc_data));
    }
    vlSelf->sdspi__DOT__spirxdatai__DOT__next_crc_data 
        = (0xffffU & ((1U & (((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__first_crc_data) 
                              >> 0xfU) ^ ((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_gearbox) 
                                          >> 6U))) ? 
                      (0x1021U ^ VL_SHIFTL_III(16,16,32, (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__first_crc_data), 1U))
                       : VL_SHIFTL_III(16,16,32, (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__first_crc_data), 1U)));
    vlSelf->sdspi__DOT__w_reset = ((IData)(vlSelf->i_sd_reset) 
                                   | (IData)(vlSelf->sdspi__DOT__r_watchdog_err));
    vlSelf->sdspi__DOT__wb_stb = ((~ (IData)(vlSelf->o_wb_stall)) 
                                  & (IData)(vlSelf->i_wb_stb));
    vlSelf->sdspi__DOT__ll_idle = ((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_idle) 
                                   & (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter));
    vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7 
        = ((~ (IData)(vlSelf->sdspi__DOT__cmd_busy)) 
           & (IData)(vlSelf->sdspi__DOT__ll_out_stb));
    vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2 
        = ((IData)(vlSelf->sdspi__DOT__w_reset) | (IData)(vlSelf->sdspi__DOT__r_cmd_err));
    vlSelf->sdspi__DOT__write_stb = ((IData)(vlSelf->sdspi__DOT__wb_stb) 
                                     & ((IData)(vlSelf->i_wb_we) 
                                        & (0U != (IData)(vlSelf->i_wb_sel))));
    vlSelf->sdspi__DOT__ll_advance = (1U & ((~ (IData)(vlSelf->sdspi__DOT__ll_cmd_stb)) 
                                            | (IData)(vlSelf->sdspi__DOT__ll_idle)));
    vlSelf->sdspi__DOT__lowlevel__DOT__byte_accepted 
        = ((IData)(vlSelf->sdspi__DOT__ll_cmd_stb) 
           & (IData)(vlSelf->sdspi__DOT__ll_idle));
    vlSelf->sdspi__DOT__spirxdatai__DOT__done = ((IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7) 
                                                 & (1U 
                                                    < (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_byte)));
    vlSelf->sdspi__DOT__spirxdatai__DOT__error_token = 0U;
    if ((0U == (0xfU & ((IData)(vlSelf->sdspi__DOT__ll_out_dat) 
                        >> 4U)))) {
        vlSelf->sdspi__DOT__spirxdatai__DOT__error_token = 1U;
    }
    vlSelf->sdspi__DOT__spirxdatai__DOT__start_token = 0U;
    if ((1U & (~ (IData)(vlSelf->sdspi__DOT__ll_out_dat)))) {
        vlSelf->sdspi__DOT__spirxdatai__DOT__start_token = 1U;
    }
    if ((1U & ((~ (IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7)) 
               | (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__received_token)))) {
        vlSelf->sdspi__DOT__spirxdatai__DOT__error_token = 0U;
        vlSelf->sdspi__DOT__spirxdatai__DOT__start_token = 0U;
    }
    vlSelf->sdspi__DOT__spitxdatai__DOT__token = ((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__data_sent) 
                                                  & ((IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7) 
                                                     & (IData)(
                                                               (1U 
                                                                == 
                                                                (0x11U 
                                                                 & (IData)(vlSelf->sdspi__DOT__ll_out_dat))))));
    vlSelf->sdspi__DOT__wb_cmd_stb = ((~ (IData)(vlSelf->sdspi__DOT__r_cmd_busy)) 
                                      & ((IData)(vlSelf->sdspi__DOT__write_stb) 
                                         & ((0xfU == (IData)(vlSelf->i_wb_sel)) 
                                            & (0U == (IData)(vlSelf->i_wb_addr)))));
    vlSelf->sdspi__DOT____Vcellinp__spitxdatai____pinNumber10 
        = (1U & ((~ (IData)(vlSelf->sdspi__DOT__ll_advance)) 
                 | (IData)(vlSelf->sdspi__DOT__cmd_busy)));
    vlSelf->sdspi__DOT__lowlevel__DOT__restart_counter 
        = (1U & ((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__r_powerup_hold)
                  ? (~ (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__r_powerup_hold))
                  : (((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold) 
                      | (~ (IData)(vlSelf->sdspi__DOT__r_cmd_busy))) 
                     | ((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__byte_accepted) 
                        | (~ (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_idle))))));
    vlSelf->sdspi__DOT____Vcellinp__spicmdi____pinNumber3 
        = ((IData)(vlSelf->sdspi__DOT__wb_cmd_stb) 
           & (0x40U == (0xc0U & vlSelf->i_wb_data)));
}

VL_ATTR_COLD void Vsdspi___024root___eval_stl(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_stl\n"); );
    // Body
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        Vsdspi___024root___stl_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
        vlSelf->__Vm_traceActivity[0U] = 1U;
    }
}

VL_ATTR_COLD void Vsdspi___024root___eval_triggers__stl(Vsdspi___024root* vlSelf);

VL_ATTR_COLD bool Vsdspi___024root___eval_phase__stl(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_phase__stl\n"); );
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vsdspi___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelf->__VstlTriggered.any();
    if (__VstlExecute) {
        Vsdspi___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdspi___024root___dump_triggers__ico(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___dump_triggers__ico\n"); );
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
VL_ATTR_COLD void Vsdspi___024root___dump_triggers__act(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___dump_triggers__act\n"); );
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
VL_ATTR_COLD void Vsdspi___024root___dump_triggers__nba(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VnbaTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge i_clk)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vsdspi___024root___ctor_var_reset(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->i_clk = VL_RAND_RESET_I(1);
    vlSelf->i_sd_reset = VL_RAND_RESET_I(1);
    vlSelf->i_wb_cyc = VL_RAND_RESET_I(1);
    vlSelf->i_wb_stb = VL_RAND_RESET_I(1);
    vlSelf->i_wb_we = VL_RAND_RESET_I(1);
    vlSelf->i_wb_addr = VL_RAND_RESET_I(2);
    vlSelf->i_wb_data = VL_RAND_RESET_I(32);
    vlSelf->i_wb_sel = VL_RAND_RESET_I(4);
    vlSelf->o_wb_stall = VL_RAND_RESET_I(1);
    vlSelf->o_wb_ack = VL_RAND_RESET_I(1);
    vlSelf->o_wb_data = VL_RAND_RESET_I(32);
    vlSelf->o_cs_n = VL_RAND_RESET_I(1);
    vlSelf->o_sck = VL_RAND_RESET_I(1);
    vlSelf->o_mosi = VL_RAND_RESET_I(1);
    vlSelf->i_miso = VL_RAND_RESET_I(1);
    vlSelf->i_card_detect = VL_RAND_RESET_I(1);
    vlSelf->o_int = VL_RAND_RESET_I(1);
    vlSelf->i_bus_grant = VL_RAND_RESET_I(1);
    vlSelf->o_debug = VL_RAND_RESET_I(32);
    vlSelf->sdspi__DOT__r_cmd_busy = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__dbg_trigger = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__wb_stb = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__write_stb = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__wb_cmd_stb = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__pipe_addr = VL_RAND_RESET_I(2);
    vlSelf->sdspi__DOT__dly_stb = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 128; ++__Vi0) {
        vlSelf->sdspi__DOT__fifo_a[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 128; ++__Vi0) {
        vlSelf->sdspi__DOT__fifo_b[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->sdspi__DOT__fifo_wb_addr = VL_RAND_RESET_I(7);
    vlSelf->sdspi__DOT__write_fifo_a_addr = VL_RAND_RESET_I(7);
    vlSelf->sdspi__DOT__write_fifo_b_addr = VL_RAND_RESET_I(7);
    vlSelf->sdspi__DOT__spi_read_addr = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__spi_write_addr = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__write_fifo_a_data = VL_RAND_RESET_I(32);
    vlSelf->sdspi__DOT__write_fifo_b_data = VL_RAND_RESET_I(32);
    vlSelf->sdspi__DOT__fifo_a_word = VL_RAND_RESET_I(32);
    vlSelf->sdspi__DOT__fifo_b_word = VL_RAND_RESET_I(32);
    vlSelf->sdspi__DOT__spi_read_data = VL_RAND_RESET_I(32);
    vlSelf->sdspi__DOT__spi_write_data = VL_RAND_RESET_I(32);
    vlSelf->sdspi__DOT__write_fifo_a = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__write_fifo_b = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__r_data_reg = VL_RAND_RESET_I(32);
    vlSelf->sdspi__DOT__r_cmd_err = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__r_last_r_one = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__r_lgblklen = VL_RAND_RESET_I(4);
    vlSelf->sdspi__DOT__r_watchdog = VL_RAND_RESET_I(26);
    vlSelf->sdspi__DOT__r_watchdog_err = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__ll_advance = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__r_sdspi_clk = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__ll_cmd_stb = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__ll_cmd_dat = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__ll_out_stb = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__ll_idle = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__ll_out_dat = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__r_fifo_id = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__r_use_fifo = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__write_to_card = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__w_reset = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__cmd_sent = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__cmd_valid = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__cmd_busy = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__cmd_response = VL_RAND_RESET_Q(40);
    vlSelf->sdspi__DOT__rx_start = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spi_write_to_fifo = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__rx_valid = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__rx_busy = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__rx_response = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__tx_start = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spi_read_from_fifo = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__tx_stb = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__tx_valid = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__tx_busy = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__tx_response = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__last_busy = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT____Vcellinp__spicmdi____pinNumber3 = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7 = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2 = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT____Vcellinp__spitxdatai____pinNumber10 = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present = VL_RAND_RESET_I(3);
    vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter = VL_RAND_RESET_I(10);
    vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_removed = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_present = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT____VdfgTmp_h302b62a3__0 = 0;
    vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__lowlevel__DOT__r_clk_counter = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__lowlevel__DOT__r_idle = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__lowlevel__DOT__r_state = VL_RAND_RESET_I(4);
    vlSelf->sdspi__DOT__lowlevel__DOT__r_byte = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__lowlevel__DOT__r_ireg = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__lowlevel__DOT__byte_accepted = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__lowlevel__DOT__restart_counter = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__lowlevel__DOT__startup_hold = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__lowlevel__DOT__powerup_hold = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter = VL_RAND_RESET_I(10);
    vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__r_powerup_hold = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter = VL_RAND_RESET_I(7);
    vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spicmdi__DOT__almost_sent = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spicmdi__DOT__crc_valid_sreg = VL_RAND_RESET_I(5);
    vlSelf->sdspi__DOT__spicmdi__DOT__crc_busy = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spicmdi__DOT__crc_bit_counter = VL_RAND_RESET_I(5);
    vlSelf->sdspi__DOT__spicmdi__DOT__crc_shift_reg = VL_RAND_RESET_Q(40);
    vlSelf->sdspi__DOT__spicmdi__DOT__shift_data = VL_RAND_RESET_Q(40);
    vlSelf->sdspi__DOT__spicmdi__DOT__crc_byte = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__spicmdi__DOT__rx_r1_byte = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spicmdi__DOT__rx_check_busy = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spicmdi__DOT__rxvalid = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spicmdi__DOT__rx_counter = VL_RAND_RESET_I(3);
    vlSelf->sdspi__DOT__spicmdi__DOT__next_crc_byte = VL_RAND_RESET_I(7);
    vlSelf->sdspi__DOT__spirxdatai__DOT__error_token = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spirxdatai__DOT__start_token = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spirxdatai__DOT__received_token = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spirxdatai__DOT__done = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spirxdatai__DOT__lastaddr = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spirxdatai__DOT__all_mem_written = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spirxdatai__DOT__lastdata = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_byte = VL_RAND_RESET_I(2);
    vlSelf->sdspi__DOT__spirxdatai__DOT__r_lgblksz_m3 = VL_RAND_RESET_I(3);
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_fill = VL_RAND_RESET_I(4);
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_gearbox = VL_RAND_RESET_I(8);
    vlSelf->sdspi__DOT__spirxdatai__DOT__next_crc_data = VL_RAND_RESET_I(16);
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_data = VL_RAND_RESET_I(16);
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_err = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_active = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spirxdatai__DOT__fill = VL_RAND_RESET_I(3);
    vlSelf->sdspi__DOT__spirxdatai__DOT__gearbox = VL_RAND_RESET_I(24);
    vlSelf->sdspi__DOT__spirxdatai__DOT__first_crc_data = VL_RAND_RESET_I(16);
    vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid = VL_RAND_RESET_I(2);
    vlSelf->sdspi__DOT__spitxdatai__DOT__gearbox = VL_RAND_RESET_Q(40);
    vlSelf->sdspi__DOT__spitxdatai__DOT__fill = VL_RAND_RESET_I(5);
    vlSelf->sdspi__DOT__spitxdatai__DOT__crc_flag = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spitxdatai__DOT__crc_stb = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spitxdatai__DOT__all_mem_read = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spitxdatai__DOT__lastaddr = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spitxdatai__DOT__data_sent = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spitxdatai__DOT__received_token = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spitxdatai__DOT__all_idle = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spitxdatai__DOT__crc_active = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spitxdatai__DOT__crc_fill = VL_RAND_RESET_I(5);
    vlSelf->sdspi__DOT__spitxdatai__DOT__crc_gearbox = VL_RAND_RESET_I(32);
    vlSelf->sdspi__DOT__spitxdatai__DOT__crc_data = VL_RAND_RESET_I(16);
    vlSelf->sdspi__DOT__spitxdatai__DOT__token = VL_RAND_RESET_I(1);
    vlSelf->sdspi__DOT__spitxdatai__DOT__r_lgblksz_m3 = VL_RAND_RESET_I(3);
    vlSelf->sdspi__DOT__spitxdatai__DOT__next_crc_data = VL_RAND_RESET_I(16);
    vlSelf->__Vtrigprevexpr___TOP__i_clk__0 = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
