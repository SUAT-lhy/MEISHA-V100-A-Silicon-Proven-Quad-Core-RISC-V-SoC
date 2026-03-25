// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsdio.h for the primary calling header

#include "Vsdio__pch.h"
#include "Vsdio___024root.h"

VL_INLINE_OPT void Vsdio___024root___ico_sequent__TOP__0(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___ico_sequent__TOP__0\n"); );
    // Body
    vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset 
        = ((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset));
    vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb = 
        ((IData)(vlSelf->i_wb_stb) & ((~ (IData)(vlSelf->o_wb_stall)) 
                                      & ((4U == (IData)(vlSelf->i_wb_addr)) 
                                         & (IData)(vlSelf->i_wb_we))));
    vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb = 
        ((IData)(vlSelf->i_wb_stb) & ((0U == (IData)(vlSelf->i_wb_addr)) 
                                      & ((IData)(vlSelf->i_wb_we) 
                                         & ((~ ((IData)(vlSelf->sdio__DOT__u_control__DOT__r_cmd_err) 
                                                | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_err))) 
                                            | (((IData)(vlSelf->i_wb_sel) 
                                                >> 1U) 
                                               & (vlSelf->i_wb_data 
                                                  >> 0xfU))))));
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

void Vsdio___024root___eval_ico(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_ico\n"); );
    // Body
    if ((1ULL & vlSelf->__VicoTriggered.word(0U))) {
        Vsdio___024root___ico_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
}

void Vsdio___024root___eval_triggers__ico(Vsdio___024root* vlSelf);

bool Vsdio___024root___eval_phase__ico(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_phase__ico\n"); );
    // Init
    CData/*0:0*/ __VicoExecute;
    // Body
    Vsdio___024root___eval_triggers__ico(vlSelf);
    __VicoExecute = vlSelf->__VicoTriggered.any();
    if (__VicoExecute) {
        Vsdio___024root___eval_ico(vlSelf);
    }
    return (__VicoExecute);
}

void Vsdio___024root___eval_act(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_act\n"); );
}

extern const VlUnpacked<CData/*0:0*/, 2048> Vsdio__ConstPool__TABLE_ha291a4f1_0;
extern const VlUnpacked<CData/*3:0*/, 2048> Vsdio__ConstPool__TABLE_hb5f53b31_0;
extern const VlWide<8>/*255:0*/ Vsdio__ConstPool__CONST_h9e67c271_0;
extern const VlWide<8>/*255:0*/ Vsdio__ConstPool__CONST_h5b979007_0;

VL_INLINE_OPT void Vsdio___024root___nba_sequent__TOP__0(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___nba_sequent__TOP__0\n"); );
    // Init
    CData/*6:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__Vfuncout;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__Vfuncout = 0;
    QData/*39:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd = 0;
    CData/*6:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill = 0;
    CData/*6:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout = 0;
    CData/*6:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit = 0;
    CData/*6:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__Vfuncout;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__Vfuncout = 0;
    CData/*6:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__fill;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__fill = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__i_bit;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__i_bit = 0;
    CData/*6:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__Vfuncout;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__Vfuncout = 0;
    CData/*6:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__fill;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__fill = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__i_bit;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__i_bit = 0;
    CData/*6:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__Vfuncout;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__Vfuncout = 0;
    CData/*6:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__fill;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__fill = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__i_bit;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__i_bit = 0;
    CData/*6:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__Vfuncout;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__Vfuncout = 0;
    CData/*6:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__fill;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__fill = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__i_bit;
    __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__i_bit = 0;
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
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__prior = 0;
    IData/*31:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
    __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit;
    __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit = 0;
    CData/*2:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__Vfuncout = 0;
    CData/*3:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__set;
    __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__set = 0;
    CData/*2:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__Vfuncout = 0;
    CData/*3:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__set;
    __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__set = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__i_crc_data = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__Vfuncout;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__Vfuncout = 0;
    SData/*15:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__prior;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__prior = 0;
    CData/*0:0*/ __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__i_crc_data;
    __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__i_crc_data = 0;
    SData/*10:0*/ __Vtableidx1;
    __Vtableidx1 = 0;
    SData/*12:0*/ __Vdly__sdio__DOT__u_control__DOT__fif_wraddr;
    __Vdly__sdio__DOT__u_control__DOT__fif_wraddr = 0;
    CData/*0:0*/ __Vdly__sdio__DOT__u_control__DOT__tx_pipe_valid;
    __Vdly__sdio__DOT__u_control__DOT__tx_pipe_valid = 0;
    QData/*47:0*/ __Vdly__sdio__DOT__u_sdcmd__DOT__tx_sreg;
    __Vdly__sdio__DOT__u_sdcmd__DOT__tx_sreg = 0;
    CData/*0:0*/ __Vdly__sdio__DOT__rsp_stb;
    __Vdly__sdio__DOT__rsp_stb = 0;
    CData/*0:0*/ __Vdly__sdio__DOT__cmd_mem_valid;
    __Vdly__sdio__DOT__cmd_mem_valid = 0;
    SData/*12:0*/ __Vdly__sdio__DOT__u_sdcmd__DOT__mem_addr;
    __Vdly__sdio__DOT__u_sdcmd__DOT__mem_addr = 0;
    IData/*25:0*/ __Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout_counter;
    __Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout_counter = 0;
    CData/*3:0*/ __Vdly__sdio__DOT__u_txframe__DOT__pre_count;
    __Vdly__sdio__DOT__u_txframe__DOT__pre_count = 0;
    QData/*63:0*/ __Vdly__sdio__DOT__u_txframe__DOT__crc_4w_reg;
    __Vdly__sdio__DOT__u_txframe__DOT__crc_4w_reg = 0;
    VlWide<8>/*255:0*/ __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg;
    VL_ZERO_W(256, __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg);
    VlWide<4>/*127:0*/ __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg;
    VL_ZERO_W(128, __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg);
    SData/*15:0*/ __Vdly__sdio__DOT__u_txframe__DOT__crc_1w_reg;
    __Vdly__sdio__DOT__u_txframe__DOT__crc_1w_reg = 0;
    IData/*31:0*/ __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg;
    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg = 0;
    CData/*4:0*/ __Vdly__sdio__DOT__u_txframe__DOT__ck_counts;
    __Vdly__sdio__DOT__u_txframe__DOT__ck_counts = 0;
    SData/*14:0*/ __Vdly__sdio__DOT__u_txframe__DOT__fb_count;
    __Vdly__sdio__DOT__u_txframe__DOT__fb_count = 0;
    SData/*9:0*/ __Vdly__sdio__DOT__u_txframe__DOT__fs_count;
    __Vdly__sdio__DOT__u_txframe__DOT__fs_count = 0;
    SData/*10:0*/ __Vdly__sdio__DOT__u_txframe__DOT__fcrc_count;
    __Vdly__sdio__DOT__u_txframe__DOT__fcrc_count = 0;
    CData/*1:0*/ __Vdly__sdio__DOT__u_rxframe__DOT__next_subaddr;
    __Vdly__sdio__DOT__u_rxframe__DOT__next_subaddr = 0;
    CData/*1:0*/ __Vdly__sdio__DOT__u_rxframe__DOT__subaddr;
    __Vdly__sdio__DOT__u_rxframe__DOT__subaddr = 0;
    SData/*15:0*/ __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc = 0;
    SData/*15:0*/ __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc = 0;
    SData/*15:0*/ __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc = 0;
    SData/*15:0*/ __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc = 0;
    SData/*15:0*/ __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc = 0;
    SData/*15:0*/ __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc = 0;
    SData/*15:0*/ __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc = 0;
    SData/*15:0*/ __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc = 0;
    CData/*0:0*/ __Vdly__sdio__DOT__u_rxframe__DOT__r_watchdog;
    __Vdly__sdio__DOT__u_rxframe__DOT__r_watchdog = 0;
    IData/*22:0*/ __Vdly__sdio__DOT__u_rxframe__DOT__r_timeout;
    __Vdly__sdio__DOT__u_rxframe__DOT__r_timeout = 0;
    // Body
    __Vdly__sdio__DOT__u_rxframe__DOT__r_timeout = vlSelf->sdio__DOT__u_rxframe__DOT__r_timeout;
    __Vdly__sdio__DOT__u_rxframe__DOT__r_watchdog = vlSelf->sdio__DOT__u_rxframe__DOT__r_watchdog;
    __Vdly__sdio__DOT__u_rxframe__DOT__subaddr = vlSelf->sdio__DOT__u_rxframe__DOT__subaddr;
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_addr 
        = vlSelf->sdio__DOT__u_rxframe__DOT__mem_addr;
    vlSelf->__Vdly__sdio__DOT__u_control__DOT__tx_mem_addr 
        = vlSelf->sdio__DOT__u_control__DOT__tx_mem_addr;
    vlSelf->__Vdly__sdio__DOT__cmd_done = vlSelf->sdio__DOT__cmd_done;
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__sync_sreg 
        = vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg;
    __Vdly__sdio__DOT__u_rxframe__DOT__next_subaddr 
        = vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr;
    vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__srcount 
        = vlSelf->sdio__DOT__u_sdcmd__DOT__srcount;
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_strb 
        = vlSelf->sdio__DOT__u_rxframe__DOT__mem_strb;
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_valid 
        = vlSelf->sdio__DOT__u_rxframe__DOT__mem_valid;
    __Vdly__sdio__DOT__u_txframe__DOT__pre_count = vlSelf->sdio__DOT__u_txframe__DOT__pre_count;
    __Vdly__sdio__DOT__u_sdcmd__DOT__mem_addr = vlSelf->sdio__DOT__u_sdcmd__DOT__mem_addr;
    vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__crc_fill 
        = vlSelf->sdio__DOT__u_sdcmd__DOT__crc_fill;
    __Vdly__sdio__DOT__rsp_stb = vlSelf->sdio__DOT__rsp_stb;
    __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
        = vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U];
    __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
        = vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U];
    __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
        = vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U];
    __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
        = vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U];
    __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
        = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U];
    __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
        = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U];
    __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
        = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U];
    __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
        = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U];
    __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
        = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U];
    __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
        = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U];
    __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
        = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U];
    __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
        = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U];
    __Vdly__sdio__DOT__u_txframe__DOT__crc_4w_reg = vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg;
    __Vdly__sdio__DOT__u_txframe__DOT__fb_count = vlSelf->sdio__DOT__u_txframe__DOT__fb_count;
    vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_sreg 
        = vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg;
    vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__resp_count 
        = vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count;
    vlSelf->__Vdly__sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter 
        = vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter;
    __Vdly__sdio__DOT__cmd_mem_valid = vlSelf->sdio__DOT__cmd_mem_valid;
    __Vdly__sdio__DOT__u_sdcmd__DOT__tx_sreg = vlSelf->sdio__DOT__u_sdcmd__DOT__tx_sreg;
    __Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout_counter 
        = vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout_counter;
    vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout 
        = vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout;
    vlSelf->__Vdly__sdio__DOT__rx_en = vlSelf->sdio__DOT__rx_en;
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__busy 
        = vlSelf->sdio__DOT__u_rxframe__DOT__busy;
    vlSelf->__Vdly__sdio__DOT__u_control__DOT__fif_rdaddr 
        = vlSelf->sdio__DOT__u_control__DOT__fif_rdaddr;
    __Vdly__sdio__DOT__u_control__DOT__fif_wraddr = vlSelf->sdio__DOT__u_control__DOT__fif_wraddr;
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__rail_count 
        = vlSelf->sdio__DOT__u_rxframe__DOT__rail_count;
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__sync_fill 
        = vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill;
    __Vdly__sdio__DOT__u_control__DOT__tx_pipe_valid 
        = vlSelf->sdio__DOT__u_control__DOT__tx_pipe_valid;
    vlSelf->__Vdly__sdio__DOT__tx_mem_valid = vlSelf->sdio__DOT__tx_mem_valid;
    vlSelf->__Vdly__sdio__DOT__tx_en = vlSelf->sdio__DOT__tx_en;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc 
        = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc 
        = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc 
        = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc 
        = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc;
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v0 = 0U;
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v1 = 0U;
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v2 = 0U;
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v3 = 0U;
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v0 = 0U;
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v1 = 0U;
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v2 = 0U;
    vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v3 = 0U;
    __Vdly__sdio__DOT__u_txframe__DOT__crc_1w_reg = vlSelf->sdio__DOT__u_txframe__DOT__crc_1w_reg;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc 
        = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc 
        = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc 
        = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc;
    __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc 
        = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc;
    vlSelf->__Vdly__sdio__DOT__u_txframe__DOT__pstate 
        = vlSelf->sdio__DOT__u_txframe__DOT__pstate;
    __Vdly__sdio__DOT__u_txframe__DOT__fcrc_count = vlSelf->sdio__DOT__u_txframe__DOT__fcrc_count;
    __Vdly__sdio__DOT__u_txframe__DOT__fs_count = vlSelf->sdio__DOT__u_txframe__DOT__fs_count;
    vlSelf->__Vdly__sdio__DOT__rx_done = vlSelf->sdio__DOT__rx_done;
    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg = vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg;
    __Vdly__sdio__DOT__u_txframe__DOT__ck_counts = vlSelf->sdio__DOT__u_txframe__DOT__ck_counts;
    vlSelf->sdio__DOT__u_control__DOT__ika = 4U;
    vlSelf->sdio__DOT__u_control__DOT__ikb = 4U;
    if ((1U & (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                | (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
               | ((~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__r_watchdog)) 
                  & (0U != (IData)(vlSelf->i_rx_strb)))))) {
        __Vdly__sdio__DOT__u_rxframe__DOT__r_watchdog = 0U;
        __Vdly__sdio__DOT__u_rxframe__DOT__r_timeout = 0x7fffffU;
    } else if ((0U != vlSelf->sdio__DOT__u_rxframe__DOT__r_timeout)) {
        __Vdly__sdio__DOT__u_rxframe__DOT__r_watchdog 
            = (1U >= vlSelf->sdio__DOT__u_rxframe__DOT__r_timeout);
        __Vdly__sdio__DOT__u_rxframe__DOT__r_timeout 
            = (0x7fffffU & (vlSelf->sdio__DOT__u_rxframe__DOT__r_timeout 
                            - (IData)(1U)));
    }
    if ((1U & ((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
               | (~ (IData)(vlSelf->sdio__DOT__rx_en))))) {
        vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_addr = 0U;
        __Vdly__sdio__DOT__u_rxframe__DOT__subaddr = 0U;
    } else if (vlSelf->sdio__DOT__u_rxframe__DOT__mem_valid) {
        vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_addr 
            = (0x1fffU & (((((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_addr) 
                             << 2U) | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__subaddr)) 
                           + VL_EXTEND_II(15,3, ([&]() {
                                __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__set 
                                    = vlSelf->sdio__DOT__u_rxframe__DOT__mem_strb;
                                __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__Vfuncout = 0U;
                                if ((1U & (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__set))) {
                                    __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__Vfuncout 
                                        = (7U & ((IData)(1U) 
                                                 + (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__Vfuncout)));
                                }
                                if ((2U & (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__set))) {
                                    __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__Vfuncout 
                                        = (7U & ((IData)(1U) 
                                                 + (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__Vfuncout)));
                                }
                                if ((4U & (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__set))) {
                                    __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__Vfuncout 
                                        = (7U & ((IData)(1U) 
                                                 + (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__Vfuncout)));
                                }
                                if ((8U & (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__set))) {
                                    __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__Vfuncout 
                                        = (7U & ((IData)(1U) 
                                                 + (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__Vfuncout)));
                                }
                            }(), (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__16__Vfuncout)))) 
                          >> 2U));
        __Vdly__sdio__DOT__u_rxframe__DOT__subaddr 
            = (3U & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__subaddr) 
                     + VL_EXTEND_II(2,3, ([&]() {
                            __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__set 
                                = vlSelf->sdio__DOT__u_rxframe__DOT__mem_strb;
                            __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__Vfuncout = 0U;
                            if ((1U & (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__set))) {
                                __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__Vfuncout 
                                    = (7U & ((IData)(1U) 
                                             + (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__Vfuncout)));
                            }
                            if ((2U & (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__set))) {
                                __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__Vfuncout 
                                    = (7U & ((IData)(1U) 
                                             + (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__Vfuncout)));
                            }
                            if ((4U & (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__set))) {
                                __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__Vfuncout 
                                    = (7U & ((IData)(1U) 
                                             + (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__Vfuncout)));
                            }
                            if ((8U & (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__set))) {
                                __Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__Vfuncout 
                                    = (7U & ((IData)(1U) 
                                             + (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__Vfuncout)));
                            }
                        }(), (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__COUNTONES__17__Vfuncout)))));
    }
    if ((1U & (((IData)(vlSelf->i_reset) | (~ (IData)(vlSelf->sdio__DOT__tx_en))) 
               | (IData)(vlSelf->sdio__DOT__soft_reset)))) {
        vlSelf->__Vdly__sdio__DOT__u_control__DOT__tx_mem_addr = 0U;
    } else if ((1U & (((~ (IData)(vlSelf->sdio__DOT__tx_mem_valid)) 
                       | (IData)(vlSelf->sdio__DOT____Vcellinp__u_control__i_tx_mem_ready)) 
                      | (~ (IData)(vlSelf->sdio__DOT__u_control__DOT__tx_pipe_valid))))) {
        vlSelf->__Vdly__sdio__DOT__u_control__DOT__tx_mem_addr 
            = (0x1fffU & ((IData)(1U) + (IData)(vlSelf->sdio__DOT__u_control__DOT__tx_mem_addr)));
    }
    vlSelf->__Vdly__sdio__DOT__cmd_done = ((~ (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                                                | (IData)(vlSelf->sdio__DOT__cmd_done)) 
                                               | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept))) 
                                           & (((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout) 
                                               | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__w_no_response)) 
                                              | ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__r_done) 
                                                 & (IData)(vlSelf->sdio__DOT__clk_stb))));
    if (vlSelf->sdio__DOT__rx_en) {
        if ((0U != (IData)(vlSelf->i_rx_strb))) {
            vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__sync_sreg 
                = ((0U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_width))
                    ? ((3U == (IData)(vlSelf->i_rx_strb))
                        ? ((0xffffcU & (vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg 
                                        << 2U)) | (
                                                   (2U 
                                                    & ((IData)(vlSelf->i_rx_data) 
                                                       >> 7U)) 
                                                   | (1U 
                                                      & (IData)(vlSelf->i_rx_data))))
                        : ((2U & (IData)(vlSelf->i_rx_strb))
                            ? ((0xffffeU & (vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg 
                                            << 1U)) 
                               | (1U & ((IData)(vlSelf->i_rx_data) 
                                        >> 8U))) : 
                           ((0xffffeU & (vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg 
                                         << 1U)) | 
                            (1U & (IData)(vlSelf->i_rx_data)))))
                    : ((1U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_width))
                        ? ((3U == (IData)(vlSelf->i_rx_strb))
                            ? ((0xfff00U & (vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg 
                                            << 8U)) 
                               | ((0xf0U & ((IData)(vlSelf->i_rx_data) 
                                            >> 4U)) 
                                  | (0xfU & (IData)(vlSelf->i_rx_data))))
                            : ((2U & (IData)(vlSelf->i_rx_strb))
                                ? ((0xffff0U & (vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg 
                                                << 4U)) 
                                   | (0xfU & ((IData)(vlSelf->i_rx_data) 
                                              >> 8U)))
                                : ((0xffff0U & (vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg 
                                                << 4U)) 
                                   | (0xfU & (IData)(vlSelf->i_rx_data)))))
                        : ((3U == (IData)(vlSelf->i_rx_strb))
                            ? ((0xf0000U & (vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg 
                                            << 0x10U)) 
                               | (IData)(vlSelf->i_rx_data))
                            : ((2U & (IData)(vlSelf->i_rx_strb))
                                ? ((0xfff00U & (vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg 
                                                << 8U)) 
                                   | (0xffU & ((IData)(vlSelf->i_rx_data) 
                                               >> 8U)))
                                : ((0xfff00U & (vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg 
                                                << 8U)) 
                                   | (0xffU & (IData)(vlSelf->i_rx_data)))))));
        }
    } else {
        vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__sync_sreg = 0U;
    }
    __Vdly__sdio__DOT__u_rxframe__DOT__next_subaddr 
        = ((1U & ((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                    | (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
                   | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_full)) 
                  | (((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_valid) 
                      & (0x1fffU == (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_addr))) 
                     & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_strb))))
            ? 0U : (3U & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr) 
                          + (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill))));
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_valid 
        = ((1U & (~ (((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                        | (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
                       | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_full)) 
                      | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__r_watchdog)) 
                     | (((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_valid) 
                         & (0x1fffU == (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_addr))) 
                        & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_strb))))) 
           && ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_valid) 
               | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_strb)));
    __Vtableidx1 = (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__pre_count) 
                     << 7U) | (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__pre_ready) 
                                << 6U) | (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr) 
                                           << 5U) | 
                                          (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width) 
                                            << 3U) 
                                           | (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate) 
                                               << 1U) 
                                              | (IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset))))));
    if (Vsdio__ConstPool__TABLE_ha291a4f1_0[__Vtableidx1]) {
        __Vdly__sdio__DOT__u_txframe__DOT__pre_count 
            = Vsdio__ConstPool__TABLE_hb5f53b31_0[__Vtableidx1];
    }
    if ((1U & ((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                 | (2U != (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type))) 
                | (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response))) 
               | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept)))) {
        __Vdly__sdio__DOT__u_sdcmd__DOT__mem_addr = 0U;
    } else if (vlSelf->sdio__DOT__cmd_mem_valid) {
        __Vdly__sdio__DOT__u_sdcmd__DOT__mem_addr = 
            (0x1fffU & ((IData)(1U) + (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__mem_addr)));
    }
    if ((1U & (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                | (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response))) 
               | (IData)(vlSelf->o_cmd_en)))) {
        vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__crc_fill = 0U;
    } else if ((1U & ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type) 
                      | (7U < (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count))))) {
        if (((3U == (IData)(vlSelf->i_cmd_strb)) & 
             ((0x2fU > (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)) 
              | ((~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type)) 
                 & (0x87U > (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)))))) {
            __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__i_bit 
                = (1U & (IData)(vlSelf->i_cmd_data));
            __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__i_bit 
                = (1U & ((IData)(vlSelf->i_cmd_data) 
                         >> 1U));
            __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__fill 
                = vlSelf->sdio__DOT__u_sdcmd__DOT__crc_fill;
            __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__fill) 
                             >> 6U) ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__i_bit)))
                    ? (9U ^ (0x7eU & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__fill) 
                                      << 1U))) : (0x7eU 
                                                  & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__fill) 
                                                     << 1U)));
            __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__fill 
                = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__3__Vfuncout;
            __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__fill) 
                             >> 6U) ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__i_bit)))
                    ? (9U ^ (0x7eU & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__fill) 
                                      << 1U))) : (0x7eU 
                                                  & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__fill) 
                                                     << 1U)));
            vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__crc_fill 
                = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__2__Vfuncout;
        } else if ((((IData)(vlSelf->i_cmd_strb) >> 1U) 
                    & ((0x30U > (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)) 
                       | ((~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type)) 
                          & (0x88U > (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)))))) {
            __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__i_bit 
                = (1U & ((IData)(vlSelf->i_cmd_data) 
                         >> 1U));
            __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__fill 
                = vlSelf->sdio__DOT__u_sdcmd__DOT__crc_fill;
            __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__fill) 
                             >> 6U) ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__i_bit)))
                    ? (9U ^ (0x7eU & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__fill) 
                                      << 1U))) : (0x7eU 
                                                  & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__fill) 
                                                     << 1U)));
            vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__crc_fill 
                = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__4__Vfuncout;
        }
    } else if (((6U < (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)) 
                & (3U == (IData)(vlSelf->i_cmd_strb)))) {
        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__i_bit 
            = (1U & (IData)(vlSelf->i_cmd_data));
        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__fill 
            = vlSelf->sdio__DOT__u_sdcmd__DOT__crc_fill;
        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__Vfuncout 
            = ((IData)((((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__fill) 
                         >> 6U) ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__i_bit)))
                ? (9U ^ (0x7eU & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__fill) 
                                  << 1U))) : (0x7eU 
                                              & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__fill) 
                                                 << 1U)));
        vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__crc_fill 
            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__5__Vfuncout;
    }
    __Vdly__sdio__DOT__rsp_stb = ((~ ((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                                        | (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response))) 
                                       | (0U == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type))) 
                                      | (IData)(vlSelf->sdio__DOT__rsp_stb))) 
                                  & ((2U & (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type))
                                      ? ((0x88U == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)) 
                                         & (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__r_done)))
                                      : ((0x30U == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)) 
                                         & (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__r_done)))));
    if ((1U & ((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
               | (~ (IData)(vlSelf->o_data_en))))) {
        __Vdly__sdio__DOT__u_txframe__DOT__fb_count = 0U;
    } else if (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__f_ckstb) 
                | ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr) 
                   & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__f_hlfck)))) {
        __Vdly__sdio__DOT__u_txframe__DOT__fb_count 
            = (0x7fffU & ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                           ? ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))
                               ? ((IData)(1U) + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count))
                               : ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))
                                   ? ((IData)(2U) + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count))
                                   : ((IData)(4U) + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count))))
                           : ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                               ? ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))
                                   ? ((IData)(4U) + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count))
                                   : ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))
                                       ? ((IData)(8U) 
                                          + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count))
                                       : ((IData)(0x10U) 
                                          + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count))))
                               : ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))
                                   ? ((IData)(8U) + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count))
                                   : ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))
                                       ? ((IData)(0x10U) 
                                          + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count))
                                       : ((IData)(0x20U) 
                                          + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count)))))));
    }
    if ((1U & (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                | (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response))) 
               | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__active)))) {
        vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_sreg = 0ULL;
    } else if ((1U & (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type))) {
        if (((0x2fU > (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)) 
             & ((IData)(vlSelf->i_cmd_strb) >> 1U))) {
            vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_sreg 
                = ((1U & (IData)(vlSelf->i_cmd_strb))
                    ? ((0xfffffffffcULL & (vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg 
                                           << 2U)) 
                       | (QData)((IData)(vlSelf->i_cmd_data)))
                    : ((0xfffffffffeULL & (vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg 
                                           << 1U)) 
                       | (QData)((IData)((1U & ((IData)(vlSelf->i_cmd_data) 
                                                >> 1U))))));
        } else if (((0x30U > (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)) 
                    & ((IData)(vlSelf->i_cmd_strb) 
                       >> 1U))) {
            vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_sreg 
                = ((0xfffffffffeULL & (vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg 
                                       << 1U)) | (QData)((IData)(
                                                                 (1U 
                                                                  & ((IData)(vlSelf->i_cmd_data) 
                                                                     >> 1U)))));
        }
    } else if (((0x87U > (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)) 
                & ((IData)(vlSelf->i_cmd_strb) >> 1U))) {
        vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_sreg 
            = ((1U & (IData)(vlSelf->i_cmd_strb)) ? 
               ((0xfffffffffcULL & (vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg 
                                    << 2U)) | (QData)((IData)(vlSelf->i_cmd_data)))
                : ((0xfffffffffeULL & (vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg 
                                       << 1U)) | (QData)((IData)(
                                                                 (1U 
                                                                  & ((IData)(vlSelf->i_cmd_data) 
                                                                     >> 1U))))));
    } else if (((0x88U > (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)) 
                & ((IData)(vlSelf->i_cmd_strb) >> 1U))) {
        vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_sreg 
            = ((0xfffffffffeULL & (vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg 
                                   << 1U)) | (QData)((IData)(
                                                             (1U 
                                                              & ((IData)(vlSelf->i_cmd_data) 
                                                                 >> 1U)))));
    }
    __Vdly__sdio__DOT__cmd_mem_valid = ((~ (((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                                               | (2U 
                                                  != (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type))) 
                                              | (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response))) 
                                             | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout)) 
                                            | (4U <= (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__mem_addr)))) 
                                        & (((~ (IData)(vlSelf->sdio__DOT__cmd_mem_valid)) 
                                            & (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__new_data)) 
                                           & ((8U == 
                                               (0x1fU 
                                                & (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count))) 
                                              & (0U 
                                                 != 
                                                 (7U 
                                                  & ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count) 
                                                     >> 5U))))));
    if ((1U & ((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                 | (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response))) 
                | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__active)) 
               | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept)))) {
        vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__resp_count = 0U;
    } else if ((0xc0U > (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count))) {
        vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__resp_count 
            = (0xffU & ((1U & (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type))
                         ? ((0x30U <= (((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count) 
                                        + ((2U & (IData)(vlSelf->i_cmd_strb))
                                            ? 1U : 0U)) 
                                       + ((1U & (IData)(vlSelf->i_cmd_strb))
                                           ? 1U : 0U)))
                             ? 0x30U : (((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count) 
                                         + ((2U & (IData)(vlSelf->i_cmd_strb))
                                             ? 1U : 0U)) 
                                        + ((1U & (IData)(vlSelf->i_cmd_strb))
                                            ? 1U : 0U)))
                         : ((0x88U <= (((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count) 
                                        + ((2U & (IData)(vlSelf->i_cmd_strb))
                                            ? 1U : 0U)) 
                                       + ((1U & (IData)(vlSelf->i_cmd_strb))
                                           ? 1U : 0U)))
                             ? 0x88U : (((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count) 
                                         + ((2U & (IData)(vlSelf->i_cmd_strb))
                                             ? 1U : 0U)) 
                                        + ((1U & (IData)(vlSelf->i_cmd_strb))
                                            ? 1U : 0U)))));
    }
    vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_strb 
        = ((1U & (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                   | (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
                  | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_full)))
            ? 0U : (0xfU & ((2U & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill))
                             ? (((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_strb) 
                                 << 3U) | (0xfU & (
                                                   (0x18U 
                                                    >> (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr)) 
                                                   >> 1U)))
                             : ((1U & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill))
                                 ? (((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_strb) 
                                     << 3U) | (0xfU 
                                               & (((0x10U 
                                                    & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill) 
                                                       << 4U)) 
                                                   >> (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr)) 
                                                  >> 1U)))
                                 : ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_strb) 
                                    << 3U)))));
    if (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset))) {
        vlSelf->__Vdly__sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter = 0U;
    } else if ((((IData)(vlSelf->sdio__DOT__rx_en) 
                 | (IData)(vlSelf->i_card_busy)) | 
                (((IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy) 
                  & (~ (IData)(vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_expect_busy))) 
                 & (~ (IData)(vlSelf->sdio__DOT__tx_en))))) {
        vlSelf->__Vdly__sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter = 0U;
    } else if ((((IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy) 
                 & (IData)(vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_expect_busy)) 
                | (IData)(vlSelf->sdio__DOT__tx_en))) {
        vlSelf->__Vdly__sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter = 0xfffU;
        if ((4U > (IData)(vlSelf->sdio__DOT__u_control__DOT__r_ckspeed))) {
            vlSelf->__Vdly__sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter = 0x10U;
        } else if ((8U > (IData)(vlSelf->sdio__DOT__u_control__DOT__r_ckspeed))) {
            vlSelf->__Vdly__sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter = 0x48U;
        } else if ((0x10U > (IData)(vlSelf->sdio__DOT__u_control__DOT__r_ckspeed))) {
            vlSelf->__Vdly__sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter = 0xc0U;
        } else if ((0x20U > (IData)(vlSelf->sdio__DOT__u_control__DOT__r_ckspeed))) {
            vlSelf->__Vdly__sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter = 0x180U;
        }
    } else if ((0U != (IData)(vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter))) {
        vlSelf->__Vdly__sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter 
            = (0xfffU & ((IData)(vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter) 
                         - (IData)(1U)));
    }
    if ((1U & ((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
               | ((~ (IData)(vlSelf->sdio__DOT__tx_en)) 
                  & (~ (IData)(vlSelf->o_data_en)))))) {
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] = 0U;
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] = 0U;
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] = 0U;
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] = 0U;
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
            = Vsdio__ConstPool__CONST_h9e67c271_0[0U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
            = Vsdio__ConstPool__CONST_h9e67c271_0[1U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
            = Vsdio__ConstPool__CONST_h9e67c271_0[2U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
            = Vsdio__ConstPool__CONST_h9e67c271_0[3U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
            = Vsdio__ConstPool__CONST_h9e67c271_0[4U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
            = Vsdio__ConstPool__CONST_h9e67c271_0[5U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
            = Vsdio__ConstPool__CONST_h9e67c271_0[6U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
            = Vsdio__ConstPool__CONST_h9e67c271_0[7U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_4w_reg = 0ULL;
    } else if (((IData)(vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID) 
                & (IData)(vlSelf->sdio__DOT__tx_mem_ready))) {
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] = 0xffffffffU;
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] = 0xffffffffU;
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] = 0xffffffffU;
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] = 0xffffffffU;
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
            = Vsdio__ConstPool__CONST_h5b979007_0[0U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
            = Vsdio__ConstPool__CONST_h5b979007_0[1U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
            = Vsdio__ConstPool__CONST_h5b979007_0[2U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
            = Vsdio__ConstPool__CONST_h5b979007_0[3U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
            = Vsdio__ConstPool__CONST_h5b979007_0[4U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
            = Vsdio__ConstPool__CONST_h5b979007_0[5U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
            = Vsdio__ConstPool__CONST_h5b979007_0[6U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
            = Vsdio__ConstPool__CONST_h5b979007_0[7U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_4w_reg = 0xffffffffffffffffULL;
        if ((0U != (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
            if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                if (vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr) {
                    __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                        = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U];
                    __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                        = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U];
                    __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U];
                    __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                        = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U];
                }
                if ((1U & (~ (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr)))) {
                    __Vdly__sdio__DOT__u_txframe__DOT__crc_4w_reg 
                        = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w;
                }
            } else if ((2U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                if ((1U & (~ (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr)))) {
                    __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
                        = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[0U];
                    __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
                        = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[1U];
                    __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
                        = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[2U];
                    __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
                        = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w[3U];
                }
            }
            if ((1U != (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                if ((2U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                    if (vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr) {
                        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
                            = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[0U];
                        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
                            = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[1U];
                        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
                            = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[2U];
                        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
                            = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[3U];
                        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
                            = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[4U];
                        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
                            = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[5U];
                        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
                            = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[6U];
                        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
                            = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d[7U];
                    }
                }
            }
        }
    } else if (((((IData)(vlSelf->sdio__DOT__clk_stb) 
                  & (0U != (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate))) 
                 & (1U != (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate))) 
                & (0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts)))) {
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] = 0xffffffffU;
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
            = vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
            = vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
            = vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] = 0xffffffffU;
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
            = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
            = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
            = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
            = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
            = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
            = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
            = vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U];
        __Vdly__sdio__DOT__u_txframe__DOT__crc_4w_reg 
            = (0xffffffffULL | ((QData)((IData)(vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg)) 
                                << 0x20U));
    }
    if (vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) {
        __Vdly__sdio__DOT__u_sdcmd__DOT__tx_sreg = 0xffffffffffffULL;
    } else if (vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept) {
        __Vdly__sdio__DOT__u_sdcmd__DOT__tx_sreg = 
            (((QData)((IData)(vlSelf->sdio__DOT__u_control__DOT__r_cmd)) 
              << 0x28U) | (((QData)((IData)(vlSelf->sdio__DOT__u_control__DOT__r_arg)) 
                            << 8U) | (QData)((IData)(
                                                     (1U 
                                                      | (([&]() {
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                            = (((QData)((IData)(vlSelf->sdio__DOT__u_control__DOT__r_cmd)) 
                                                << 0x20U) 
                                               | (QData)((IData)(vlSelf->sdio__DOT__u_control__DOT__r_arg)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x27U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)
                                                ? 9U
                                                : 0U);
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x26U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x25U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x24U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x23U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x22U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x21U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x20U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x1fU)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x1eU)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x1dU)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x1cU)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x1bU)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x1aU)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x19U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x18U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x17U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x16U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x15U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x14U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x13U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x12U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x11U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0x10U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0xfU)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0xeU)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0xdU)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0xcU)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0xbU)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 0xaU)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 9U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 8U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 7U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 6U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 5U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 4U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 3U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 2U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(
                                                            (__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd 
                                                             >> 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit 
                                            = (1U & (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__cmd));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout 
                                            = ((IData)(
                                                       (((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                         >> 6U) 
                                                        ^ (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__i_bit)))
                                                ? (9U 
                                                   ^ 
                                                   (0x7eU 
                                                    & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                       << 1U)))
                                                : (0x7eU 
                                                   & ((IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__fill) 
                                                      << 1U)));
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__STEPCRC__1__Vfuncout;
                                        __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__Vfuncout 
                                            = __Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__fill;
                                    }(), (IData)(__Vfunc_sdio__DOT__u_sdcmd__DOT__CMDCRC__0__Vfuncout)) 
                                                         << 1U))))));
    } else if (vlSelf->sdio__DOT__clk_stb) {
        __Vdly__sdio__DOT__u_sdcmd__DOT__tx_sreg = 
            ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_dbl)
              ? (3ULL | (0xfffffffffffcULL & (vlSelf->sdio__DOT__u_sdcmd__DOT__tx_sreg 
                                              << 2U)))
              : (1ULL | (0xfffffffffffeULL & (vlSelf->sdio__DOT__u_sdcmd__DOT__tx_sreg 
                                              << 1U))));
    }
    if ((1U & ((((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                   | (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response))) 
                  | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__active)) 
                 | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__r_done)) 
                | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_no_timeout)) 
               | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept)))) {
        vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout = 0U;
        __Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout_counter = 0x3ffffffU;
    } else if (((~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout)) 
                & (0U != (IData)(vlSelf->i_cmd_strb)))) {
        vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout = 0U;
        __Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout_counter = 0x3ffffffU;
    } else {
        if ((0U != vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout_counter)) {
            __Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout_counter 
                = (0x3ffffffU & (vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout_counter 
                                 - (IData)(1U)));
        }
        if ((1U >= vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout_counter)) {
            vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout = 1U;
        }
    }
    if (vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) {
        vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__busy = 0U;
        vlSelf->sdio__DOT__u_sdcmd__DOT__r_busy = 0U;
        vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_ds = 0U;
        vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_self_request = 0U;
        vlSelf->sdio__DOT__u_txframe__DOT__ck_valid = 0U;
        __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg = 0xffffffffU;
        vlSelf->sdio__DOT__u_txframe__DOT__ck_data = 0xffffffffU;
        __Vdly__sdio__DOT__u_txframe__DOT__ck_counts = 0U;
        vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_no_timeout = 0U;
    } else {
        if (vlSelf->sdio__DOT__u_rxframe__DOT__busy) {
            if (vlSelf->sdio__DOT__u_rxframe__DOT__w_done) {
                vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__busy = 0U;
            }
        } else {
            vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__busy 
                = (((IData)(vlSelf->sdio__DOT__rx_en) 
                    & (0U < (0xffffU & ((IData)(1U) 
                                        << (IData)(vlSelf->sdio__DOT__u_control__DOT__lgblk))))) 
                   & (~ (IData)(vlSelf->sdio__DOT__rx_done)));
        }
        if (vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept) {
            vlSelf->sdio__DOT__u_sdcmd__DOT__r_busy = 1U;
            vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_ds 
                = (1U & ((0U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_ckspeed)) 
                         >> 1U));
            vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_no_timeout 
                = (0x68U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_cmd));
        } else {
            if (vlSelf->sdio__DOT__cmd_done) {
                vlSelf->sdio__DOT__u_sdcmd__DOT__r_busy = 0U;
            }
            if (vlSelf->sdio__DOT__u_sdcmd__DOT__response_active) {
                vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_no_timeout = 0U;
            }
        }
        if ((1U & ((~ (IData)(vlSelf->sdio__DOT__cmd_busy)) 
                   | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__active)))) {
            vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_self_request = 0U;
        } else if (vlSelf->sdio__DOT__u_control__DOT__GEN_SELFREPLY__DOT__r_cmd_selfreply) {
            vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_self_request = 1U;
        }
        if (vlSelf->sdio__DOT__u_txframe__DOT__start_packet) {
            vlSelf->sdio__DOT__u_txframe__DOT__ck_valid = 1U;
        } else if (((IData)(vlSelf->sdio__DOT__clk_stb) 
                    & (0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts)))) {
            vlSelf->sdio__DOT__u_txframe__DOT__ck_valid 
                = ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__pre_valid) 
                   | (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_stop_bit));
        }
        if ((((IData)(vlSelf->sdio__DOT__clk_stb) & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pre_valid)) 
             & (0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts)))) {
            if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))) {
                if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                        = (1U | (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                 << 1U));
                    vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                        = (0xfefefefeU | ((0x1000000U 
                                           & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                              >> 7U)) 
                                          | ((0x10000U 
                                              & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                 >> 0xfU)) 
                                             | ((0x100U 
                                                 & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                    >> 0x17U)) 
                                                | (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                   >> 0x1fU)))));
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_counts 
                        = (((~ (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr)) 
                            & (3U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate)))
                            ? 0xfU : 0x1fU);
                } else if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                        = (0xfU | (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                   << 4U));
                    vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                        = (0xf0f0f0f0U | ((0xf000000U 
                                           & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                              >> 4U)) 
                                          | ((0xf0000U 
                                              & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                 >> 0xcU)) 
                                             | ((0xf00U 
                                                 & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                    >> 0x14U)) 
                                                | (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                   >> 0x1cU)))));
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_counts = 7U;
                } else {
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                        = (0xffU | (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                    << 8U));
                    vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                        = ((0xff000000U & vlSelf->sdio__DOT__u_txframe__DOT__pre_data) 
                           | ((0xff0000U & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                            >> 8U)) 
                              | ((0xff00U & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                             >> 0x10U)) 
                                 | (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                    >> 0x18U))));
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_counts = 3U;
                }
            } else if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))) {
                if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                        = (3U | (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                 << 2U));
                    vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                        = ((0xffff0000U & (0xfefe0000U 
                                           | ((0x1000000U 
                                               & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                  >> 7U)) 
                                              | (0x10000U 
                                                 & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                    >> 0xfU))))) 
                           | (0xffffU & (0xfefeU | 
                                         ((0x100U & 
                                           (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                            >> 0x16U)) 
                                          | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                   >> 0x1eU))))));
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_counts = 0xfU;
                } else if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                        = (0xffU | (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                    << 8U));
                    vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                        = ((0xffff0000U & (0xf0f00000U 
                                           | ((0xf000000U 
                                               & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                  >> 4U)) 
                                              | (0xf0000U 
                                                 & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                    >> 0xcU))))) 
                           | (0xffffU & (0xf0f0U | 
                                         ((0xf00U & 
                                           (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                            >> 0x10U)) 
                                          | (0xfU & 
                                             (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                              >> 0x18U))))));
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_counts = 3U;
                } else {
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                        = (0xffffU | (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                      << 0x10U));
                    vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                        = ((0xffff0000U & ((0xff000000U 
                                            & vlSelf->sdio__DOT__u_txframe__DOT__pre_data) 
                                           | (0xff0000U 
                                              & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                 >> 8U)))) 
                           | (0xffffU & ((0xff00U & 
                                          (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                           >> 8U)) 
                                         | (0xffU & 
                                            (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                             >> 0x10U)))));
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_counts = 1U;
                }
            } else if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                    = (0xfU | (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                               << 4U));
                vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                    = (0xfefefefeU | ((0x1000000U & 
                                       (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                        >> 7U)) | (
                                                   (0x10000U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                       >> 0xeU)) 
                                                   | ((0x100U 
                                                       & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                          >> 0x15U)) 
                                                      | (1U 
                                                         & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                            >> 0x1cU))))));
                __Vdly__sdio__DOT__u_txframe__DOT__ck_counts = 7U;
            } else if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                    = (0xffffU | (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                  << 0x10U));
                vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                    = (0xf0f0f0f0U | ((0xf000000U & 
                                       (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                        >> 4U)) | (
                                                   (0xf0000U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                       >> 8U)) 
                                                   | ((0xf00U 
                                                       & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                          >> 0xcU)) 
                                                      | (0xfU 
                                                         & (vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                                                            >> 0x10U))))));
                __Vdly__sdio__DOT__u_txframe__DOT__ck_counts = 1U;
            } else {
                __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg = 0xffffffffU;
                vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                    = vlSelf->sdio__DOT__u_txframe__DOT__pre_data;
                __Vdly__sdio__DOT__u_txframe__DOT__ck_counts = 0U;
            }
        } else if ((((IData)(vlSelf->sdio__DOT__clk_stb) 
                     | ((IData)(vlSelf->sdio__DOT__clk_half) 
                        & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr))) 
                    & (0U < (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts)))) {
            __Vdly__sdio__DOT__u_txframe__DOT__ck_counts 
                = (0x1fU & ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts) 
                            - (IData)(1U)));
            if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))) {
                if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                        = (1U | (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                 << 1U));
                    vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                        = (0xfefefefeU | ((0x1000000U 
                                           & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                              >> 7U)) 
                                          | ((0x10000U 
                                              & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                 >> 0xfU)) 
                                             | ((0x100U 
                                                 & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                    >> 0x17U)) 
                                                | (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                   >> 0x1fU)))));
                } else if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                        = (0xfU | (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                   << 4U));
                    vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                        = (0xf0f0f0f0U | ((0xf000000U 
                                           & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                              >> 4U)) 
                                          | ((0xf0000U 
                                              & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                 >> 0xcU)) 
                                             | ((0xf00U 
                                                 & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                    >> 0x14U)) 
                                                | (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                   >> 0x1cU)))));
                } else {
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                        = (0xffU | (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                    << 8U));
                    vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                        = ((0xff000000U & vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg) 
                           | ((0xff0000U & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                            >> 8U)) 
                              | ((0xff00U & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                             >> 0x10U)) 
                                 | (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                    >> 0x18U))));
                }
            } else if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))) {
                if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                        = (3U | (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                 << 2U));
                    vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                        = ((0xffff0000U & (0xfefe0000U 
                                           | ((0x1000000U 
                                               & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                  >> 7U)) 
                                              | (0x10000U 
                                                 & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                    >> 0xfU))))) 
                           | (0xffffU & (0xfefeU | 
                                         ((0x100U & 
                                           (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                            >> 0x16U)) 
                                          | (1U & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                   >> 0x1eU))))));
                } else if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                        = (0xffU | (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                    << 8U));
                    vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                        = ((0xffff0000U & (0xf0f00000U 
                                           | ((0xf000000U 
                                               & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                  >> 4U)) 
                                              | (0xf0000U 
                                                 & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                    >> 0xcU))))) 
                           | (0xffffU & (0xf0f0U | 
                                         ((0xf00U & 
                                           (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                            >> 0x10U)) 
                                          | (0xfU & 
                                             (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                              >> 0x18U))))));
                } else {
                    __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                        = (0xffffU | (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                      << 0x10U));
                    vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                        = ((0xffff0000U & ((0xff000000U 
                                            & vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg) 
                                           | (0xff0000U 
                                              & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                 >> 8U)))) 
                           | (0xffffU & ((0xff00U & 
                                          (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                           >> 8U)) 
                                         | (0xffU & 
                                            (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                             >> 0x10U)))));
                }
            } else if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                    = (0xfU | (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                               << 4U));
                vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                    = (0xfefefefeU | ((0x1000000U & 
                                       (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                        >> 7U)) | (
                                                   (0x10000U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                       >> 0xeU)) 
                                                   | ((0x100U 
                                                       & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                          >> 0x15U)) 
                                                      | (1U 
                                                         & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                            >> 0x1cU))))));
            } else if ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
                __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg 
                    = (0xffffU | (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                  << 0x10U));
                vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                    = (0xf0f0f0f0U | ((0xf000000U & 
                                       (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                        >> 4U)) | (
                                                   (0xf0000U 
                                                    & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                       >> 8U)) 
                                                   | ((0xf00U 
                                                       & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                          >> 0xcU)) 
                                                      | (0xfU 
                                                         & (vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg 
                                                            >> 0x10U))))));
            } else {
                vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                    = vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg;
                __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg = 0xffffffffU;
            }
        } else if (((IData)(vlSelf->sdio__DOT__clk_stb) 
                    & (0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts)))) {
            vlSelf->sdio__DOT__u_txframe__DOT__ck_data = 0xffffffffU;
            __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg = 0xffffffffU;
            __Vdly__sdio__DOT__u_txframe__DOT__ck_counts 
                = ((((IData)(vlSelf->sdio__DOT__u_txframe__DOT__start_packet) 
                     & (IData)(vlSelf->o_cfg_ddr)) 
                    & (~ (IData)(vlSelf->sdio__DOT__clk_half)))
                    ? 1U : 0U);
            if (vlSelf->sdio__DOT__u_txframe__DOT__start_packet) {
                vlSelf->sdio__DOT__u_txframe__DOT__ck_data 
                    = ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))
                        ? ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                            ? 0xfefefefeU : ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                                              ? 0xf0f0f0f0U
                                              : 0U))
                        : ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period))
                            ? ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr)
                                ? ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                                    ? 0xfefefefeU : 
                                   ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                                     ? 0xf0f0f0f0U : 0U))
                                : ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                                    ? 0xfffffefeU : 
                                   ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                                     ? 0xfffff0f0U : 0xffff0000U)))
                            : ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                                ? 0xfffffefeU : ((1U 
                                                  == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                                                  ? 0xfffff0f0U
                                                  : 0xffff0000U))));
            }
        }
    }
    if ((1U & ((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                 | (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response))) 
                | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__active)) 
               | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept)))) {
        vlSelf->sdio__DOT__u_sdcmd__DOT__response_active = 0U;
    } else if ((2U & (IData)(vlSelf->i_cmd_strb))) {
        vlSelf->sdio__DOT__u_sdcmd__DOT__response_active = 1U;
    }
    if ((((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset)) 
         | ((IData)(vlSelf->sdio__DOT__cmd_err) & (~ (IData)(vlSelf->sdio__DOT__rx_en))))) {
        vlSelf->__Vdly__sdio__DOT__rx_en = 0U;
    } else if (((IData)(vlSelf->sdio__DOT__rx_en) & (IData)(vlSelf->sdio__DOT__rx_done))) {
        vlSelf->__Vdly__sdio__DOT__rx_en = 0U;
    } else if (((~ (IData)(vlSelf->sdio__DOT__cmd_request)) 
                & (IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_request))) {
        vlSelf->__Vdly__sdio__DOT__rx_en = 1U;
    }
    if ((1U & (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                | (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
               | (~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__data_phase))))) {
        vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__sync_fill = 0U;
    } else if ((0U == (IData)(vlSelf->i_rx_strb))) {
        vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__sync_fill 
            = (7U & (IData)(vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__sync_fill));
    } else {
        vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__sync_fill 
            = (0x1fU & ((0U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_width))
                         ? (((7U & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill)) 
                             + ((2U & (IData)(vlSelf->i_rx_strb))
                                 ? 1U : 0U)) + ((1U 
                                                 & (IData)(vlSelf->i_rx_strb))
                                                 ? 1U
                                                 : 0U))
                         : ((1U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_width))
                             ? (((7U & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill)) 
                                 + ((2U & (IData)(vlSelf->i_rx_strb))
                                     ? 4U : 0U)) + 
                                ((1U & (IData)(vlSelf->i_rx_strb))
                                  ? 4U : 0U)) : (((7U 
                                                   & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill)) 
                                                  + 
                                                  ((2U 
                                                    & (IData)(vlSelf->i_rx_strb))
                                                    ? 8U
                                                    : 0U)) 
                                                 + 
                                                 ((1U 
                                                   & (IData)(vlSelf->i_rx_strb))
                                                   ? 8U
                                                   : 0U)))));
    }
    if ((((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset)) 
         | ((IData)(vlSelf->sdio__DOT__cmd_err) & (~ (IData)(vlSelf->sdio__DOT__tx_en))))) {
        vlSelf->__Vdly__sdio__DOT__tx_en = 0U;
    } else if ((((IData)(vlSelf->sdio__DOT__tx_en) 
                 & (IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_sent)) 
                & (~ (IData)(vlSelf->o_data_en)))) {
        vlSelf->__Vdly__sdio__DOT__tx_en = 0U;
    } else if ((((((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy)) 
                   & (~ (IData)(vlSelf->sdio__DOT__cmd_request))) 
                  & (~ (IData)(vlSelf->sdio__DOT__tx_en))) 
                 & (~ (IData)(vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_card_busy))) 
                & (IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_request))) {
        vlSelf->__Vdly__sdio__DOT__tx_en = vlSelf->sdio__DOT__u_control__DOT__r_tx_request;
    }
    if ((1U & ((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                 | (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
                | ((~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__data_phase)) 
                   & (~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__load_crc)))) 
               | (~ (IData)(vlSelf->o_cfg_ddr))))) {
        __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc = 0U;
        __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc = 0U;
        __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc = 0U;
        __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc = 0U;
    } else {
        if ((IData)((((IData)(vlSelf->i_rx_strb) >> 1U) 
                     & vlSelf->sdio__DOT__u_rxframe__DOT__rail_count))) {
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 8U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__22__Vfuncout;
        } else if ((1U & ((IData)(vlSelf->i_rx_strb) 
                          & (~ vlSelf->sdio__DOT__u_rxframe__DOT__rail_count)))) {
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__i_crc_data 
                = (1U & (IData)(vlSelf->i_rx_data));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__23__Vfuncout;
        }
        if ((0U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_width))) {
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc = 0U;
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc = 0U;
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc = 0U;
        } else if ((IData)((((IData)(vlSelf->i_rx_strb) 
                             >> 1U) & vlSelf->sdio__DOT__u_rxframe__DOT__rail_count))) {
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 0xbU));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__40__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 0xaU));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__34__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 9U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__28__Vfuncout;
        } else if ((1U & ((IData)(vlSelf->i_rx_strb) 
                          & (~ vlSelf->sdio__DOT__u_rxframe__DOT__rail_count)))) {
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 3U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__41__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 2U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__35__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 1U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__29__Vfuncout;
        }
    }
    if ((1U & (IData)(vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_b))) {
        vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_b__v0 
            = (0xffU & vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_b);
        vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v0 = 1U;
        vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v0 = 0U;
        vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v0 
            = vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_b;
    }
    if ((2U & (IData)(vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_b))) {
        vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_b__v1 
            = (0xffU & (vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_b 
                        >> 8U));
        vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v1 = 1U;
        vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v1 = 8U;
        vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v1 
            = vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_b;
    }
    if ((4U & (IData)(vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_b))) {
        vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_b__v2 
            = (0xffU & (vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_b 
                        >> 0x10U));
        vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v2 = 1U;
        vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v2 = 0x10U;
        vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v2 
            = vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_b;
    }
    if ((8U & (IData)(vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_b))) {
        vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_b__v3 
            = (vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_b 
               >> 0x18U);
        vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v3 = 1U;
        vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v3 = 0x18U;
        vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v3 
            = vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_b;
    }
    if ((1U & (IData)(vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_a))) {
        vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_a__v0 
            = (0xffU & vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_a);
        vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v0 = 1U;
        vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v0 = 0U;
        vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v0 
            = vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_a;
    }
    if ((2U & (IData)(vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_a))) {
        vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_a__v1 
            = (0xffU & (vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_a 
                        >> 8U));
        vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v1 = 1U;
        vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v1 = 8U;
        vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v1 
            = vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_a;
    }
    if ((4U & (IData)(vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_a))) {
        vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_a__v2 
            = (0xffU & (vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_a 
                        >> 0x10U));
        vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v2 = 1U;
        vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v2 = 0x10U;
        vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v2 
            = vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_a;
    }
    if ((8U & (IData)(vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_a))) {
        vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_a__v3 
            = (vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_a 
               >> 0x18U);
        vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v3 = 1U;
        vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v3 = 0x18U;
        vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v3 
            = vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_a;
    }
    if ((1U & (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                | (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
               | ((~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__data_phase)) 
                  & (~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__load_crc)))))) {
        __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc = 0U;
        __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc = 0U;
        __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc = 0U;
        __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc = 0U;
    } else {
        if ((((3U == (IData)(vlSelf->i_rx_strb)) & 
              (~ (IData)(vlSelf->o_cfg_ddr))) & (~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__last_strb)))) {
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__i_crc_data 
                = (1U & (IData)(vlSelf->i_rx_data));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 8U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__prior) 
                                  << 1U)));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__prior 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__19__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__18__Vfuncout;
        } else if ((IData)((((IData)(vlSelf->i_rx_strb) 
                             >> 1U) & ((~ (IData)(vlSelf->o_cfg_ddr)) 
                                       | (~ vlSelf->sdio__DOT__u_rxframe__DOT__rail_count))))) {
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 8U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__20__Vfuncout;
        } else if ((((IData)(vlSelf->i_rx_strb) & vlSelf->sdio__DOT__u_rxframe__DOT__rail_count) 
                    & (IData)(vlSelf->o_cfg_ddr))) {
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__i_crc_data 
                = (1U & (IData)(vlSelf->i_rx_data));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__21__Vfuncout;
        }
        if ((0U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_width))) {
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc = 0U;
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc = 0U;
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc = 0U;
        } else if ((((3U == (IData)(vlSelf->i_rx_strb)) 
                     & (~ (IData)(vlSelf->o_cfg_ddr))) 
                    & (~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__last_strb)))) {
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 3U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 0xbU));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__prior) 
                                  << 1U)));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__prior 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__37__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__36__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 2U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 0xaU));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__prior) 
                                  << 1U)));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__prior 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__31__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__30__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 1U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 9U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__prior) 
                                  << 1U)));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__prior 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__25__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__24__Vfuncout;
        } else if ((IData)((((IData)(vlSelf->i_rx_strb) 
                             >> 1U) & ((~ (IData)(vlSelf->o_cfg_ddr)) 
                                       | (~ vlSelf->sdio__DOT__u_rxframe__DOT__rail_count))))) {
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 0xbU));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__38__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 0xaU));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__32__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 9U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__26__Vfuncout;
        } else if ((((IData)(vlSelf->i_rx_strb) & vlSelf->sdio__DOT__u_rxframe__DOT__rail_count) 
                    & (IData)(vlSelf->o_cfg_ddr))) {
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 3U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__39__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 2U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__33__Vfuncout;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__i_crc_data 
                = (1U & ((IData)(vlSelf->i_rx_data) 
                         >> 1U));
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__prior 
                = vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc;
            __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__Vfuncout 
                = ((IData)((((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__prior) 
                             >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__i_crc_data)))
                    ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__prior) 
                                             << 1U)))
                    : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__prior) 
                                  << 1U)));
            __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc 
                = __Vfunc_sdio__DOT__u_rxframe__DOT__STEPCRC__27__Vfuncout;
        }
    }
    if ((1U & (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                | (~ (IData)(vlSelf->sdio__DOT__tx_en))) 
               | ((3U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate)) 
                  & (~ (IData)(vlSelf->o_data_en)))))) {
        __Vdly__sdio__DOT__u_txframe__DOT__fs_count = 0U;
        __Vdly__sdio__DOT__u_txframe__DOT__fcrc_count = 0U;
    } else if (((IData)(vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID) 
                & (IData)(vlSelf->sdio__DOT__tx_mem_ready))) {
        __Vdly__sdio__DOT__u_txframe__DOT__fs_count 
            = (0x3ffU & ((IData)(1U) + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fs_count)));
        __Vdly__sdio__DOT__u_txframe__DOT__fcrc_count 
            = (0x7ffU & ((IData)(1U) + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fs_count)));
    } else if (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__pre_valid) 
                & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pre_ready))) {
        __Vdly__sdio__DOT__u_txframe__DOT__fcrc_count 
            = (0x7ffU & ((IData)(1U) + (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fcrc_count)));
    }
    if ((1U & ((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
               | ((~ (IData)(vlSelf->sdio__DOT__tx_en)) 
                  & (~ (IData)(vlSelf->o_data_en)))))) {
        __Vdly__sdio__DOT__u_txframe__DOT__crc_1w_reg = 0U;
    } else if (((IData)(vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID) 
                & (IData)(vlSelf->sdio__DOT__tx_mem_ready))) {
        __Vdly__sdio__DOT__u_txframe__DOT__crc_1w_reg = 0xffffU;
        if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
            if ((1U & (~ (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr)))) {
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                    = vlSelf->sdio__DOT__tx_mem_data;
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__prior 
                    = vlSelf->sdio__DOT__u_txframe__DOT__crc_1w_reg;
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__prior;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                       >> 0x1fU);
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x1eU));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x1dU));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x1cU));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x1bU));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x1aU));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x19U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x18U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x17U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x16U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x15U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x14U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x13U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x12U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x11U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0x10U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0xfU));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0xeU));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0xdU));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0xcU));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0xbU));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 0xaU));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 9U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 8U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 7U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 6U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 5U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 4U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 3U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 2U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & (__Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data 
                             >> 1U));
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit 
                    = (1U & __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__i_crc_data);
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout 
                    = ((IData)((((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                 >> 0xfU) ^ (IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__i_bit)))
                        ? (0x1021U ^ (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                                 << 1U)))
                        : (0xfffeU & ((IData)(__Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__prior) 
                                      << 1U)));
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__STEPCRC__15__Vfuncout;
                __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__Vfuncout 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__fill;
                __Vdly__sdio__DOT__u_txframe__DOT__crc_1w_reg 
                    = __Vfunc_sdio__DOT__u_txframe__DOT__APPLYCRC32__14__Vfuncout;
            }
        }
    } else if (((((IData)(vlSelf->sdio__DOT__clk_stb) 
                  & (0U != (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate))) 
                 & (1U != (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate))) 
                & (0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts)))) {
        __Vdly__sdio__DOT__u_txframe__DOT__crc_1w_reg = 0xffffU;
    }
    if (vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) {
        vlSelf->sdio__DOT__u_txframe__DOT__ck_stop_bit = 0U;
        vlSelf->__Vdly__sdio__DOT__u_txframe__DOT__pstate = 0U;
        vlSelf->sdio__DOT__u_txframe__DOT__pre_valid = 0U;
        vlSelf->sdio__DOT__u_txframe__DOT__pre_data = 0xffffffffU;
    } else {
        if (vlSelf->sdio__DOT__u_txframe__DOT__start_packet) {
            vlSelf->sdio__DOT__u_txframe__DOT__ck_stop_bit = 1U;
        } else if (((IData)(vlSelf->sdio__DOT__clk_stb) 
                    & (0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts)))) {
            vlSelf->sdio__DOT__u_txframe__DOT__ck_stop_bit 
                = vlSelf->sdio__DOT__u_txframe__DOT__pre_valid;
        }
        if ((2U & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate))) {
            if ((1U & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate))) {
                if (vlSelf->sdio__DOT__u_txframe__DOT__pre_ready) {
                    vlSelf->sdio__DOT__u_txframe__DOT__pre_valid = 0U;
                    vlSelf->sdio__DOT__u_txframe__DOT__pre_data = 0xffffffffU;
                }
                if ((1U & (~ (IData)(vlSelf->o_data_en)))) {
                    vlSelf->__Vdly__sdio__DOT__u_txframe__DOT__pstate = 0U;
                }
            } else if (vlSelf->sdio__DOT__u_txframe__DOT__pre_ready) {
                vlSelf->sdio__DOT__u_txframe__DOT__pre_valid = 1U;
                if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pre_count))) {
                    vlSelf->__Vdly__sdio__DOT__u_txframe__DOT__pstate = 3U;
                }
                vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                    = ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                        ? ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr)
                            ? vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg
                            : (0xffffU | ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__crc_1w_reg) 
                                          << 0x10U)))
                        : ((1U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                            ? ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr)
                                ? vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U]
                                : (IData)((vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg 
                                           >> 0x20U)))
                            : ((2U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))
                                ? ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr)
                                    ? vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U]
                                    : vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U])
                                : vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U])));
            }
        } else if ((1U & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate))) {
            if (((IData)(vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID) 
                 & (IData)(vlSelf->sdio__DOT__tx_mem_ready))) {
                vlSelf->__Vdly__sdio__DOT__u_txframe__DOT__pstate = 1U;
                vlSelf->sdio__DOT__u_txframe__DOT__pre_valid = 1U;
                vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                    = vlSelf->sdio__DOT__tx_mem_data;
                if (vlSelf->sdio__DOT__tx_mem_last) {
                    vlSelf->__Vdly__sdio__DOT__u_txframe__DOT__pstate = 2U;
                }
            }
        } else {
            vlSelf->__Vdly__sdio__DOT__u_txframe__DOT__pstate = 0U;
            vlSelf->sdio__DOT__u_txframe__DOT__pre_data 
                = ((IData)(vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID)
                    ? vlSelf->sdio__DOT__tx_mem_data
                    : 0xffffffffU);
            vlSelf->sdio__DOT__u_txframe__DOT__pre_valid = 0U;
            if (vlSelf->sdio__DOT__u_txframe__DOT__start_packet) {
                vlSelf->__Vdly__sdio__DOT__u_txframe__DOT__pstate 
                    = ((IData)(vlSelf->sdio__DOT__tx_mem_last)
                        ? 2U : 1U);
                vlSelf->sdio__DOT__u_txframe__DOT__pre_valid = 1U;
            }
        }
    }
    if ((1U & ((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
               | ((~ (IData)(vlSelf->sdio__DOT__tx_en)) 
                  & (~ (IData)(vlSelf->o_data_en)))))) {
        vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg = 0U;
    } else if (((IData)(vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID) 
                & (IData)(vlSelf->sdio__DOT__tx_mem_ready))) {
        vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg = 0xffffffffU;
        if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width))) {
            if (vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr) {
                vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg 
                    = vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w;
            }
        }
    } else if (((((IData)(vlSelf->sdio__DOT__clk_stb) 
                  & (0U != (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate))) 
                 & (1U != (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate))) 
                & (0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts)))) {
        vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg = 0xffffffffU;
    }
    if (vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) {
        vlSelf->sdio__DOT__u_txframe__DOT__cfg_width = 0U;
        vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr = 0U;
    } else if ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate))) {
        vlSelf->sdio__DOT__u_txframe__DOT__cfg_width 
            = vlSelf->sdio__DOT__u_control__DOT__r_width;
        vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr 
            = vlSelf->o_cfg_ddr;
    }
    if ((1U & (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                | (~ (IData)(vlSelf->sdio__DOT__tx_en))) 
               | ((3U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__pstate)) 
                  & (~ (IData)(vlSelf->o_data_en)))))) {
        vlSelf->sdio__DOT__u_txframe__DOT__fs_last = 0U;
    } else if (((IData)(vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID) 
                & (IData)(vlSelf->sdio__DOT__tx_mem_ready))) {
        vlSelf->sdio__DOT__u_txframe__DOT__fs_last 
            = vlSelf->sdio__DOT__tx_mem_last;
    }
    vlSelf->o_cfg_dscmd = 0U;
    vlSelf->sdio__DOT__clk_ckspd = vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd;
    vlSelf->sdio__DOT__u_clkgen__DOT__clk90 = ((~ (IData)(vlSelf->i_reset)) 
                                               & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_clk90));
    vlSelf->o_wb_ack = ((1U & (~ ((IData)(vlSelf->i_reset) 
                                  | (~ (IData)(vlSelf->i_wb_cyc))))) 
                        && (IData)(vlSelf->sdio__DOT__u_control__DOT__pre_ack));
    if (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset))) {
        vlSelf->__Vdly__sdio__DOT__u_control__DOT__fif_rdaddr = 0U;
        __Vdly__sdio__DOT__u_control__DOT__fif_wraddr = 0U;
        vlSelf->__Vdly__sdio__DOT__tx_mem_valid = 0U;
        vlSelf->o_pp_data = 0U;
        vlSelf->o_pp_cmd = 0U;
        vlSelf->o_cfg_sample_shift = 0x18U;
    } else {
        if (((IData)(vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb) 
             & ((((IData)(vlSelf->i_wb_sel) >> 1U) 
                 & (((vlSelf->i_wb_data >> 0xbU) | 
                     (2U == (3U & (vlSelf->i_wb_data 
                                   >> 8U)))) | ((IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo) 
                                                != 
                                                (1U 
                                                 & (vlSelf->i_wb_data 
                                                    >> 0xcU))))) 
                | ((IData)(vlSelf->i_wb_sel) & (vlSelf->i_wb_data 
                                                >> 7U))))) {
            vlSelf->__Vdly__sdio__DOT__u_control__DOT__fif_rdaddr = 0U;
            __Vdly__sdio__DOT__u_control__DOT__fif_wraddr = 0U;
        } else {
            if (((((IData)(vlSelf->i_wb_stb) & (~ (IData)(vlSelf->i_wb_we))) 
                  & (IData)(vlSelf->i_wb_sel)) & ((2U 
                                                   == (IData)(vlSelf->i_wb_addr)) 
                                                  | (3U 
                                                     == (IData)(vlSelf->i_wb_addr))))) {
                vlSelf->__Vdly__sdio__DOT__u_control__DOT__fif_rdaddr 
                    = (0x1fffU & ((IData)(1U) + (IData)(vlSelf->sdio__DOT__u_control__DOT__fif_rdaddr)));
            }
            if ((((((IData)(vlSelf->i_wb_stb) & (~ (IData)(vlSelf->o_wb_stall))) 
                   & (IData)(vlSelf->i_wb_we)) & (IData)(vlSelf->i_wb_sel)) 
                 & ((2U == (IData)(vlSelf->i_wb_addr)) 
                    | (3U == (IData)(vlSelf->i_wb_addr))))) {
                __Vdly__sdio__DOT__u_control__DOT__fif_wraddr 
                    = (0x1fffU & ((IData)(1U) + (IData)(vlSelf->sdio__DOT__u_control__DOT__fif_wraddr)));
            }
        }
        if ((1U & (((~ (IData)(vlSelf->sdio__DOT__tx_en)) 
                    | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_sent)) 
                   | (((IData)(vlSelf->sdio__DOT__tx_mem_valid) 
                       & (IData)(vlSelf->sdio__DOT____Vcellinp__u_control__i_tx_mem_ready)) 
                      & (IData)(vlSelf->sdio__DOT__tx_mem_last))))) {
            vlSelf->__Vdly__sdio__DOT__tx_mem_valid = 0U;
            __Vdly__sdio__DOT__u_control__DOT__tx_pipe_valid = 0U;
        } else if ((1U & (((~ (IData)(vlSelf->sdio__DOT__tx_mem_valid)) 
                           | (IData)(vlSelf->sdio__DOT____Vcellinp__u_control__i_tx_mem_ready)) 
                          | (~ (IData)(vlSelf->sdio__DOT__u_control__DOT__tx_pipe_valid))))) {
            vlSelf->__Vdly__sdio__DOT__tx_mem_valid 
                = vlSelf->sdio__DOT__u_control__DOT__tx_pipe_valid;
            __Vdly__sdio__DOT__u_control__DOT__tx_pipe_valid = 1U;
        }
        if (((IData)(vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb) 
             & ((IData)(vlSelf->i_wb_sel) >> 1U))) {
            vlSelf->o_pp_data = (1U & (vlSelf->i_wb_data 
                                       >> 0xcU));
            vlSelf->o_pp_cmd = (1U & (vlSelf->i_wb_data 
                                      >> 0xdU));
        }
        if (((IData)(vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb) 
             & ((IData)(vlSelf->i_wb_sel) >> 2U))) {
            vlSelf->o_cfg_sample_shift = (0x1fU & (vlSelf->i_wb_data 
                                                   >> 0x10U));
        }
    }
    vlSelf->o_cfg_sample_shift = (0x18U & (IData)(vlSelf->o_cfg_sample_shift));
    vlSelf->o_sdclk = vlSelf->sdio__DOT__w_sdclk;
    vlSelf->sdio__DOT__rx_active = ((~ (IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset)) 
                                    & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__busy)
                                        ? (vlSelf->sdio__DOT__u_rxframe__DOT__rail_count 
                                           > (((1U 
                                                & (IData)(vlSelf->i_rx_strb))
                                                ? 1U
                                                : 0U) 
                                              + ((2U 
                                                  & (IData)(vlSelf->i_rx_strb))
                                                  ? 1U
                                                  : 0U)))
                                        : (((IData)(vlSelf->sdio__DOT__rx_en) 
                                            & (0U < 
                                               (0xffffU 
                                                & ((IData)(1U) 
                                                   << (IData)(vlSelf->sdio__DOT__u_control__DOT__lgblk))))) 
                                           & (~ (IData)(vlSelf->sdio__DOT__rx_done)))));
    if ((1U & (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                | (IData)(vlSelf->sdio__DOT__rx_done)) 
               | (~ (IData)(vlSelf->sdio__DOT__rx_en))))) {
        vlSelf->sdio__DOT__u_rxframe__DOT__pending_crc = 0U;
    } else if (((((IData)(vlSelf->sdio__DOT__rx_en) 
                  & (~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__busy))) 
                 | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__load_crc)) 
                | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__data_phase))) {
        vlSelf->sdio__DOT__u_rxframe__DOT__pending_crc = 1U;
    } else if ((1U & (~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__load_crc)))) {
        vlSelf->sdio__DOT__u_rxframe__DOT__pending_crc = 0U;
    }
    vlSelf->o_wb_data = 0U;
    if ((0U == (IData)(vlSelf->sdio__DOT__u_control__DOT__pre_sel))) {
        vlSelf->o_wb_data = vlSelf->sdio__DOT__u_control__DOT__pre_data;
    } else if ((1U == (IData)(vlSelf->sdio__DOT__u_control__DOT__pre_sel))) {
        vlSelf->o_wb_data = vlSelf->sdio__DOT__u_control__DOT__tx_fifo_a;
    } else if ((2U == (IData)(vlSelf->sdio__DOT__u_control__DOT__pre_sel))) {
        vlSelf->o_wb_data = vlSelf->sdio__DOT__u_control__DOT__tx_fifo_b;
    }
    vlSelf->sdio__DOT__u_rxframe__DOT__r_timeout = __Vdly__sdio__DOT__u_rxframe__DOT__r_timeout;
    vlSelf->sdio__DOT__u_rxframe__DOT__subaddr = __Vdly__sdio__DOT__u_rxframe__DOT__subaddr;
    vlSelf->sdio__DOT__u_txframe__DOT__fb_count = __Vdly__sdio__DOT__u_txframe__DOT__fb_count;
    vlSelf->sdio__DOT__u_sdcmd__DOT__tx_sreg = __Vdly__sdio__DOT__u_sdcmd__DOT__tx_sreg;
    vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout_counter 
        = __Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout_counter;
    vlSelf->sdio__DOT__u_control__DOT__tx_pipe_valid 
        = __Vdly__sdio__DOT__u_control__DOT__tx_pipe_valid;
    vlSelf->sdio__DOT__u_txframe__DOT__fs_count = __Vdly__sdio__DOT__u_txframe__DOT__fs_count;
    vlSelf->sdio__DOT__u_txframe__DOT__fcrc_count = __Vdly__sdio__DOT__u_txframe__DOT__fcrc_count;
    vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg = __Vdly__sdio__DOT__u_txframe__DOT__ck_sreg;
    vlSelf->sdio__DOT__u_rxframe__DOT__s2_valid = (
                                                   (~ 
                                                    ((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                                                     | (~ (IData)(vlSelf->sdio__DOT__rx_en)))) 
                                                   & (8U 
                                                      <= (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill)));
    vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_strb = 
        ((1U & (~ (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                    | (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
                   | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_full)))) 
         && (1U & ((2U & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill))
                    ? (0x1fU & (0x18U >> (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr)))
                    : ((1U & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill)) 
                       && (1U & ((0x10U & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill) 
                                           << 4U)) 
                                 >> (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr)))))));
    vlSelf->sdio__DOT__u_txframe__DOT__f_ckstb = ((1U 
                                                   & (~ (IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset))) 
                                                  && (IData)(vlSelf->sdio__DOT__clk_stb));
    vlSelf->sdio__DOT__u_txframe__DOT__f_hlfck = ((1U 
                                                   & (~ (IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset))) 
                                                  && (IData)(vlSelf->sdio__DOT__clk_half));
    vlSelf->sdio__DOT__u_sdcmd__DOT__new_data = ((~ 
                                                  (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                                                    | (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response))) 
                                                   | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__active))) 
                                                 & (0U 
                                                    != (IData)(vlSelf->i_cmd_strb)));
    if (((((IData)(vlSelf->i_wb_stb) & (IData)(vlSelf->i_wb_we)) 
          & (3U == (IData)(vlSelf->i_wb_addr))) & (0U 
                                                   != (IData)(vlSelf->i_wb_sel)))) {
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_b 
            = vlSelf->sdio__DOT__u_control__DOT__fif_wraddr;
    }
    if (((IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo) 
         & (IData)(vlSelf->sdio__DOT__cmd_mem_valid))) {
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_b 
            = vlSelf->sdio__DOT__u_sdcmd__DOT__mem_addr;
    }
    vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_b = 0U;
    if (((((IData)(vlSelf->i_wb_stb) & (IData)(vlSelf->i_wb_we)) 
          & (3U == (IData)(vlSelf->i_wb_addr))) & (0U 
                                                   != (IData)(vlSelf->i_wb_sel)))) {
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_b 
            = vlSelf->i_wb_sel;
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_b 
            = vlSelf->i_wb_data;
    }
    if (((IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo) 
         & (IData)(vlSelf->sdio__DOT__cmd_mem_valid))) {
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_b = 0xfU;
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_b 
            = vlSelf->sdio__DOT__cmd_mem_data;
    }
    if (((IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo) 
         & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_valid))) {
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_b 
            = vlSelf->sdio__DOT__u_rxframe__DOT__mem_addr;
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_b 
            = vlSelf->sdio__DOT__u_rxframe__DOT__mem_strb;
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_b 
            = vlSelf->sdio__DOT__u_rxframe__DOT__mem_data;
    }
    if (((((IData)(vlSelf->i_wb_stb) & (IData)(vlSelf->i_wb_we)) 
          & (2U == (IData)(vlSelf->i_wb_addr))) & (0U 
                                                   != (IData)(vlSelf->i_wb_sel)))) {
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_a 
            = vlSelf->sdio__DOT__u_control__DOT__fif_wraddr;
    }
    if (((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo)) 
         & (IData)(vlSelf->sdio__DOT__cmd_mem_valid))) {
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_a 
            = vlSelf->sdio__DOT__u_sdcmd__DOT__mem_addr;
    }
    vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_a = 0U;
    if (((((IData)(vlSelf->i_wb_stb) & (IData)(vlSelf->i_wb_we)) 
          & (2U == (IData)(vlSelf->i_wb_addr))) & (0U 
                                                   != (IData)(vlSelf->i_wb_sel)))) {
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_a 
            = vlSelf->i_wb_sel;
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_a 
            = vlSelf->i_wb_data;
    }
    if (((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo)) 
         & (IData)(vlSelf->sdio__DOT__cmd_mem_valid))) {
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_a = 0xfU;
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_a 
            = vlSelf->sdio__DOT__cmd_mem_data;
    }
    if (((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo)) 
         & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_valid))) {
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_a 
            = vlSelf->sdio__DOT__u_rxframe__DOT__mem_addr;
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_a 
            = vlSelf->sdio__DOT__u_rxframe__DOT__mem_strb;
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_a 
            = vlSelf->sdio__DOT__u_rxframe__DOT__mem_data;
    }
    if ((1U & (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                | (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
               | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_full)))) {
        vlSelf->sdio__DOT__u_rxframe__DOT__mem_data = 0U;
        vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_data = 0U;
    } else if ((2U & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill))) {
        vlSelf->sdio__DOT__u_rxframe__DOT__mem_data 
            = (((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_data) 
                << 0x18U) | (IData)((0xffffffffULL 
                                     & (VL_SHIFTR_QQI(40,40,32, 
                                                      ((QData)((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_data)) 
                                                       << 0x18U), 
                                                      VL_SHIFTL_III(32,32,32, (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr), 3U)) 
                                        >> 8U))));
        vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_data 
            = (0xffU & (IData)((0xffffffffffULL & VL_SHIFTR_QQI(40,40,32, 
                                                                ((QData)((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_data)) 
                                                                 << 0x18U), 
                                                                VL_SHIFTL_III(32,32,32, (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr), 3U)))));
    } else if ((1U & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill))) {
        vlSelf->sdio__DOT__u_rxframe__DOT__mem_data 
            = (((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_data) 
                << 0x18U) | (IData)((0xffffffffULL 
                                     & (VL_SHIFTR_QQI(40,40,32, 
                                                      ((QData)((IData)(
                                                                       (0xffU 
                                                                        & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_data) 
                                                                           >> 8U)))) 
                                                       << 0x20U), 
                                                      VL_SHIFTL_III(32,32,32, (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr), 3U)) 
                                        >> 8U))));
        vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_data 
            = (0xffU & (IData)((0xffffffffffULL & VL_SHIFTR_QQI(40,40,32, 
                                                                ((QData)((IData)(
                                                                                (0xffU 
                                                                                & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__s2_data) 
                                                                                >> 8U)))) 
                                                                 << 0x20U), 
                                                                VL_SHIFTL_III(32,32,32, (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr), 3U)))));
    } else {
        vlSelf->sdio__DOT__u_rxframe__DOT__mem_data 
            = ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_data) 
               << 0x18U);
        vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_data 
            = (0xffU & 0U);
    }
    if ((1U & ((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
               | (~ (IData)(vlSelf->sdio__DOT__rx_en))))) {
        vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill = 0U;
        vlSelf->sdio__DOT__u_rxframe__DOT__mem_full = 0U;
    } else {
        vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill 
            = (3U & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill) 
                     >> 3U));
        if ((((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_valid) 
              & (0x1fffU == (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_addr))) 
             & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__mem_strb))) {
            vlSelf->sdio__DOT__u_rxframe__DOT__mem_full = 1U;
        }
    }
    vlSelf->sdio__DOT__u_control__DOT__pre_ack = ((1U 
                                                   & (~ 
                                                      ((IData)(vlSelf->i_reset) 
                                                       | (~ (IData)(vlSelf->i_wb_cyc))))) 
                                                  && (IData)(vlSelf->i_wb_stb));
    vlSelf->sdio__DOT__u_control__DOT__pre_sel = 0U;
    if (((IData)(vlSelf->i_wb_stb) & (~ (IData)(vlSelf->i_wb_we)))) {
        if ((2U == (IData)(vlSelf->i_wb_addr))) {
            vlSelf->sdio__DOT__u_control__DOT__pre_sel = 1U;
        } else if ((3U == (IData)(vlSelf->i_wb_addr))) {
            vlSelf->sdio__DOT__u_control__DOT__pre_sel = 2U;
        }
    }
    vlSelf->sdio__DOT__u_control__DOT__pre_data = 0U;
    if ((0U == (IData)(vlSelf->i_wb_addr))) {
        vlSelf->sdio__DOT__u_control__DOT__pre_data 
            = vlSelf->sdio__DOT__u_control__DOT__w_cmd_word;
    } else if ((1U == (IData)(vlSelf->i_wb_addr))) {
        vlSelf->sdio__DOT__u_control__DOT__pre_data 
            = vlSelf->sdio__DOT__u_control__DOT__r_arg;
    } else if ((4U == (IData)(vlSelf->i_wb_addr))) {
        vlSelf->sdio__DOT__u_control__DOT__pre_data 
            = vlSelf->sdio__DOT__u_control__DOT__w_phy_ctrl;
    }
    if (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset))) {
        vlSelf->sdio__DOT__u_control__DOT__r_cmd_ecode = 0U;
        vlSelf->sdio__DOT__cfg_clk_shutdown = 0U;
        vlSelf->o_int = 0U;
        vlSelf->sdio__DOT__u_control__DOT__r_rx_ecode = 0U;
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_b = 0U;
        vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_a = 0U;
        vlSelf->sdio__DOT__u_control__DOT__GEN_SELFREPLY__DOT__r_cmd_selfreply = 0U;
        vlSelf->sdio__DOT__u_control__DOT__r_cmd_err = 0U;
        vlSelf->sdio__DOT__u_control__DOT__r_clk_shutdown = 0U;
        vlSelf->sdio__DOT__u_control__DOT__r_rx_err = 0U;
        vlSelf->sdio__DOT__u_control__DOT__r_cmd = 0U;
    } else {
        if (vlSelf->sdio__DOT__u_control__DOT__new_cmd_request) {
            vlSelf->sdio__DOT__u_control__DOT__r_cmd_ecode = 0U;
            vlSelf->sdio__DOT__u_control__DOT__r_rx_ecode = 0U;
            vlSelf->sdio__DOT__u_control__DOT__r_cmd 
                = (0x7fU & vlSelf->i_wb_data);
        } else {
            if (((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_cmd_err)) 
                 & (IData)(vlSelf->sdio__DOT__cmd_done))) {
                vlSelf->sdio__DOT__u_control__DOT__r_cmd_ecode 
                    = vlSelf->sdio__DOT__cmd_ercode;
            }
            if (((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_err)) 
                 & (IData)(vlSelf->sdio__DOT__rx_err))) {
                vlSelf->sdio__DOT__u_control__DOT__r_rx_ecode 
                    = vlSelf->sdio__DOT__rx_ercode;
            }
            if (vlSelf->sdio__DOT__rsp_stb) {
                vlSelf->sdio__DOT__u_control__DOT__r_cmd 
                    = vlSelf->sdio__DOT__rsp_id;
            }
        }
        if ((((IData)(vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb) 
              & ((IData)(vlSelf->i_wb_sel) >> 1U)) 
             & (~ (vlSelf->i_wb_data >> 0xfU)))) {
            vlSelf->sdio__DOT__cfg_clk_shutdown = 0U;
        } else if (((IData)(vlSelf->sdio__DOT__u_control__DOT__r_clk_shutdown) 
                    | (((IData)(vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb) 
                        & ((IData)(vlSelf->i_wb_sel) 
                           >> 1U)) & (vlSelf->i_wb_data 
                                      >> 0xfU)))) {
            vlSelf->sdio__DOT__cfg_clk_shutdown = 1U;
            if (vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_card_busy) {
                vlSelf->sdio__DOT__cfg_clk_shutdown = 0U;
            }
            if (((IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_request) 
                 | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_request))) {
                vlSelf->sdio__DOT__cfg_clk_shutdown = 0U;
            }
            if (((IData)(vlSelf->sdio__DOT__tx_en) 
                 & ((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_sent)) 
                    | (IData)(vlSelf->o_data_en)))) {
                vlSelf->sdio__DOT__cfg_clk_shutdown = 0U;
            }
            if (((IData)(vlSelf->sdio__DOT__cmd_request) 
                 | ((IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy) 
                    & (~ (IData)(vlSelf->sdio__DOT__cmd_done))))) {
                vlSelf->sdio__DOT__cfg_clk_shutdown = 0U;
            }
        }
        vlSelf->o_int = 0U;
        if ((0U == ((((IData)(vlSelf->sdio__DOT__tx_en) 
                      | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_request)) 
                     << 1U) | ((IData)(vlSelf->sdio__DOT__rx_en) 
                               | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_request))))) {
            if (((IData)(vlSelf->sdio__DOT__cmd_done) 
                 & (IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy))) {
                vlSelf->o_int = 1U;
            }
        } else if ((2U == ((((IData)(vlSelf->sdio__DOT__tx_en) 
                             | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_request)) 
                            << 1U) | ((IData)(vlSelf->sdio__DOT__rx_en) 
                                      | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_request))))) {
            if ((((IData)(vlSelf->sdio__DOT__tx_en) 
                  & (IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_sent)) 
                 & (~ (IData)(vlSelf->o_data_en)))) {
                vlSelf->o_int = 1U;
            }
        } else if ((1U == ((((IData)(vlSelf->sdio__DOT__tx_en) 
                             | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_request)) 
                            << 1U) | ((IData)(vlSelf->sdio__DOT__rx_en) 
                                      | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_request))))) {
            if (((IData)(vlSelf->sdio__DOT__rx_en) 
                 & (IData)(vlSelf->sdio__DOT__rx_done))) {
                vlSelf->o_int = 1U;
            }
        }
        if (((IData)(vlSelf->sdio__DOT__cmd_done) & (IData)(vlSelf->sdio__DOT__cmd_err))) {
            vlSelf->o_int = 1U;
        }
        if (vlSelf->sdio__DOT__u_control__DOT__w_selfreply_request) {
            vlSelf->sdio__DOT__u_control__DOT__GEN_SELFREPLY__DOT__r_cmd_selfreply = 1U;
        } else if ((1U & (~ (IData)(vlSelf->sdio__DOT__cmd_busy)))) {
            vlSelf->sdio__DOT__u_control__DOT__GEN_SELFREPLY__DOT__r_cmd_selfreply = 0U;
        }
        if (vlSelf->sdio__DOT__cmd_err) {
            vlSelf->sdio__DOT__u_control__DOT__r_cmd_err = 1U;
        } else if (vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb) {
            vlSelf->sdio__DOT__u_control__DOT__r_cmd_err = 0U;
        }
        if (((IData)(vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb) 
             & ((IData)(vlSelf->i_wb_sel) >> 1U))) {
            vlSelf->sdio__DOT__u_control__DOT__r_clk_shutdown 
                = (1U & (vlSelf->i_wb_data >> 0xfU));
        }
        if (((IData)(vlSelf->sdio__DOT__rx_en) & (IData)(vlSelf->sdio__DOT__rx_err))) {
            vlSelf->sdio__DOT__u_control__DOT__r_rx_err = 1U;
        } else if (vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb) {
            vlSelf->sdio__DOT__u_control__DOT__r_rx_err = 0U;
        }
    }
    if (vlSelf->i_reset) {
        vlSelf->sdio__DOT__u_clkgen__DOT__ckspd = 0U;
        vlSelf->sdio__DOT__w_sdclk = 0U;
    } else {
        vlSelf->sdio__DOT__u_clkgen__DOT__ckspd = vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd;
        vlSelf->sdio__DOT__w_sdclk = (0xffU & ((((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_clk) 
                                                 & (IData)(vlSelf->sdio__DOT____Vcellinp__u_clkgen__i_cfg_shutdown)) 
                                                | (0U 
                                                   == (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd)))
                                                ? ((IData)(vlSelf->sdio__DOT____Vcellinp__u_clkgen__i_cfg_shutdown)
                                                    ? 0U
                                                    : 
                                                   ((IData)(vlSelf->sdio__DOT__cfg_clk90)
                                                     ? 0x66U
                                                     : 0x33U))
                                                : (
                                                   (1U 
                                                    == (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd))
                                                    ? 
                                                   ((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_clk90)
                                                     ? 0x3cU
                                                     : 0xfU)
                                                    : 
                                                   ((2U 
                                                     == (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd))
                                                     ? 
                                                    ((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_clk90)
                                                      ? 
                                                     ((0x200U 
                                                       & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter))
                                                       ? 0xf0U
                                                       : 0xfU)
                                                      : 
                                                     ((0x200U 
                                                       & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter))
                                                       ? 0xffU
                                                       : 0U))
                                                     : 
                                                    ((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_clk90)
                                                      ? 
                                                     (- (IData)(
                                                                (1U 
                                                                 & VL_REDXOR_16(
                                                                                (0x300U 
                                                                                & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter))))))
                                                      : 
                                                     (- (IData)(
                                                                (1U 
                                                                 & ((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter) 
                                                                    >> 9U)))))))));
    }
    if (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset))) {
        vlSelf->sdio__DOT__cfg_clk90 = 0U;
        vlSelf->sdio__DOT__u_control__DOT__r_arg = 0U;
    } else {
        if (((IData)(vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb) 
             & ((IData)(vlSelf->i_wb_sel) >> 1U))) {
            vlSelf->sdio__DOT__cfg_clk90 = (1U & (vlSelf->i_wb_data 
                                                  >> 0xeU));
            if ((0x100U & vlSelf->i_wb_data)) {
                vlSelf->sdio__DOT__cfg_clk90 = 1U;
            }
        }
        if (vlSelf->sdio__DOT__rsp_stb) {
            vlSelf->sdio__DOT__u_control__DOT__r_arg 
                = vlSelf->sdio__DOT__rsp_arg;
        } else if ((((((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy)) 
                       & (IData)(vlSelf->i_wb_stb)) 
                      & (~ (IData)(vlSelf->o_wb_stall))) 
                     & (IData)(vlSelf->i_wb_we)) & 
                    (1U == (IData)(vlSelf->i_wb_addr)))) {
            if ((1U & (IData)(vlSelf->i_wb_sel))) {
                vlSelf->sdio__DOT__u_control__DOT__r_arg 
                    = ((0xffffff00U & vlSelf->sdio__DOT__u_control__DOT__r_arg) 
                       | (0xffU & vlSelf->i_wb_data));
            }
            if ((2U & (IData)(vlSelf->i_wb_sel))) {
                vlSelf->sdio__DOT__u_control__DOT__r_arg 
                    = ((0xffff00ffU & vlSelf->sdio__DOT__u_control__DOT__r_arg) 
                       | (0xff00U & vlSelf->i_wb_data));
            }
            if ((4U & (IData)(vlSelf->i_wb_sel))) {
                vlSelf->sdio__DOT__u_control__DOT__r_arg 
                    = ((0xff00ffffU & vlSelf->sdio__DOT__u_control__DOT__r_arg) 
                       | (0xff0000U & vlSelf->i_wb_data));
            }
            if ((8U & (IData)(vlSelf->i_wb_sel))) {
                vlSelf->sdio__DOT__u_control__DOT__r_arg 
                    = ((0xffffffU & vlSelf->sdio__DOT__u_control__DOT__r_arg) 
                       | (0xff000000U & vlSelf->i_wb_data));
            }
        }
    }
    if ((1U & ((~ (IData)(vlSelf->i_wb_stb)) | (IData)(vlSelf->i_wb_we)))) {
        vlSelf->sdio__DOT__u_control__DOT__pre_data = 0U;
    }
    if ((1U & (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset)) 
               | (~ (IData)(vlSelf->sdio__DOT__tx_en))))) {
        vlSelf->sdio__DOT__u_control__DOT__r_tx_sent = 0U;
    } else if ((((IData)(vlSelf->sdio__DOT__tx_mem_valid) 
                 & (IData)(vlSelf->sdio__DOT____Vcellinp__u_control__i_tx_mem_ready)) 
                & (IData)(vlSelf->sdio__DOT__tx_mem_last))) {
        vlSelf->sdio__DOT__u_control__DOT__r_tx_sent = 1U;
    }
    vlSelf->o_tx_data = vlSelf->sdio__DOT__u_txframe__DOT__ck_data;
    vlSelf->sdio__DOT__u_txframe__DOT__cfg_period = 0U;
    vlSelf->sdio__DOT__u_control__DOT__fif_wraddr = __Vdly__sdio__DOT__u_control__DOT__fif_wraddr;
    vlSelf->sdio__DOT__u_sdcmd__DOT__mem_addr = __Vdly__sdio__DOT__u_sdcmd__DOT__mem_addr;
    vlSelf->sdio__DOT__cmd_mem_valid = __Vdly__sdio__DOT__cmd_mem_valid;
    vlSelf->sdio__DOT__clk_half = ((IData)(vlSelf->i_reset) 
                                   || ((((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_clk) 
                                         & (IData)(vlSelf->sdio__DOT____Vcellinp__u_clkgen__i_cfg_shutdown)) 
                                        | (0U == (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd))) 
                                       || ((1U == (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd)) 
                                           || (1U & 
                                               ((2U 
                                                 == (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd))
                                                 ? 
                                                ((0x200U 
                                                  & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter))
                                                  ? 1U
                                                  : 2U)
                                                 : 
                                                (0x100U 
                                                 == (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__counter)))))));
    vlSelf->sdio__DOT__u_clkgen__DOT__counter = ((IData)(vlSelf->i_reset)
                                                  ? 0U
                                                  : 
                                                 (((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_clk) 
                                                   & (IData)(vlSelf->sdio__DOT____Vcellinp__u_clkgen__i_cfg_shutdown))
                                                   ? 0x300U
                                                   : (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter)));
    if (((8U == (0x1fU & (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count))) 
         & (0U != (7U & ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count) 
                         >> 5U))))) {
        vlSelf->sdio__DOT__cmd_mem_data = (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg);
    }
    if ((1U & ((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                 | (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
                | (IData)(vlSelf->sdio__DOT__rx_done)) 
               | (~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__busy))))) {
        vlSelf->sdio__DOT__rx_ercode = 0U;
        vlSelf->__Vdly__sdio__DOT__rx_done = 0U;
        vlSelf->sdio__DOT__rx_err = 0U;
    } else if (vlSelf->sdio__DOT__u_rxframe__DOT__w_done) {
        vlSelf->__Vdly__sdio__DOT__rx_done = 1U;
        vlSelf->sdio__DOT__rx_err = (IData)((((((0U 
                                                 != (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__lcl_err)) 
                                                | (0U 
                                                   != (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__lcl_err))) 
                                               | (0U 
                                                  != (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__lcl_err))) 
                                              | (0U 
                                                 != (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__lcl_err))) 
                                             | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__r_watchdog)));
        vlSelf->sdio__DOT__rx_ercode = (1U & (~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__r_watchdog)));
    }
    vlSelf->sdio__DOT__rsp_stb = __Vdly__sdio__DOT__rsp_stb;
    vlSelf->sdio__DOT__u_txframe__DOT__pre_count = __Vdly__sdio__DOT__u_txframe__DOT__pre_count;
    vlSelf->sdio__DOT__u_txframe__DOT__crc_1w_reg = __Vdly__sdio__DOT__u_txframe__DOT__crc_1w_reg;
    vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[0U] 
        = __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[0U];
    vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[1U] 
        = __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[1U];
    vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[2U] 
        = __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[2U];
    vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg[3U] 
        = __Vdly__sdio__DOT__u_txframe__DOT__crc_8w_reg[3U];
    vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg = __Vdly__sdio__DOT__u_txframe__DOT__crc_4w_reg;
    vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[0U] 
        = __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[0U];
    vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[1U] 
        = __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[1U];
    vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[2U] 
        = __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[2U];
    vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[3U] 
        = __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[3U];
    vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[4U] 
        = __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[4U];
    vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[5U] 
        = __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[5U];
    vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[6U] 
        = __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[6U];
    vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg[7U] 
        = __Vdly__sdio__DOT__u_txframe__DOT__crc_8d_reg[7U];
    vlSelf->sdio__DOT__u_rxframe__DOT__r_watchdog = __Vdly__sdio__DOT__u_rxframe__DOT__r_watchdog;
    if ((1U & ((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
               | (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response))))) {
        vlSelf->sdio__DOT__rsp_id = 0U;
        vlSelf->sdio__DOT__rsp_arg = 0U;
    } else {
        if ((8U == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count))) {
            vlSelf->sdio__DOT__rsp_id = (0x3fU & (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg));
        }
        if ((2U == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type))) {
            vlSelf->sdio__DOT__rsp_arg = 0U;
        } else if ((0x2fU == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count))) {
            vlSelf->sdio__DOT__rsp_arg = (IData)((vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg 
                                                  >> 7U));
        } else if ((0x2eU == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count))) {
            vlSelf->sdio__DOT__rsp_arg = (IData)((vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg 
                                                  >> 6U));
        }
    }
    if ((1U & ((~ (IData)(vlSelf->sdio__DOT__tx_mem_valid)) 
               | (IData)(vlSelf->sdio__DOT____Vcellinp__u_control__i_tx_mem_ready)))) {
        vlSelf->sdio__DOT__tx_mem_last = vlSelf->sdio__DOT__u_control__DOT__tx_fifo_last;
        vlSelf->sdio__DOT__tx_mem_data = ((IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo)
                                           ? vlSelf->sdio__DOT__u_control__DOT__tx_fifo_b
                                           : vlSelf->sdio__DOT__u_control__DOT__tx_fifo_a);
        vlSelf->sdio__DOT__u_control__DOT__tx_fifo_last 
            = ((IData)(vlSelf->sdio__DOT__tx_en) & 
               ((IData)(vlSelf->sdio__DOT__u_control__DOT__tx_mem_addr) 
                >= (0xffffU & (VL_SHIFTL_III(16,16,32, (IData)(1U), 
                                             ((IData)(vlSelf->sdio__DOT__u_control__DOT__lgblk) 
                                              - (IData)(2U))) 
                               - (IData)(1U)))));
    }
    if ((1U & ((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                 | (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
                | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__data_phase)) 
               | (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__load_crc)))) {
        vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__lcl_err = 0U;
        vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__lcl_err = 0U;
        vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__lcl_err = 0U;
        vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__lcl_err = 0U;
    } else {
        vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__lcl_err 
            = ((((0U != (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc)) 
                 & (IData)(vlSelf->o_cfg_ddr)) << 1U) 
               | (0U != (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc)));
        vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__lcl_err 
            = ((((0U != (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc)) 
                 & (IData)(vlSelf->o_cfg_ddr)) << 1U) 
               | (0U != (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc)));
        vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__lcl_err 
            = ((((0U != (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc)) 
                 & (IData)(vlSelf->o_cfg_ddr)) << 1U) 
               | (0U != (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc)));
        vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__lcl_err 
            = ((((0U != (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc)) 
                 & (IData)(vlSelf->o_cfg_ddr)) << 1U) 
               | (0U != (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc)));
    }
    vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr 
        = __Vdly__sdio__DOT__u_rxframe__DOT__next_subaddr;
    vlSelf->o_data_en = vlSelf->sdio__DOT__u_txframe__DOT__ck_valid;
    vlSelf->sdio__DOT__u_txframe__DOT__ck_counts = __Vdly__sdio__DOT__u_txframe__DOT__ck_counts;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc 
        = __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc 
        = __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc 
        = __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc 
        = __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc 
        = __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc 
        = __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc 
        = __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc;
    vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc 
        = __Vdly__sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc;
    if ((0x10U & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill))) {
        vlSelf->sdio__DOT__u_rxframe__DOT__s2_data 
            = (0xffffU & (vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg 
                          >> (7U & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill))));
    } else if ((8U & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill))) {
        vlSelf->sdio__DOT__u_rxframe__DOT__s2_data 
            = (0xffffU & ((vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg 
                           << 8U) >> (7U & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill))));
    }
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
}
