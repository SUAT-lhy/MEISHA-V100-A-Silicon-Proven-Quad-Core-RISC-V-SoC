// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsdio.h for the primary calling header

#include "Vsdio__pch.h"
#include "Vsdio___024root.h"

extern const VlUnpacked<SData/*14:0*/, 32> Vsdio__ConstPool__TABLE_h44593cd3_0;

VL_INLINE_OPT void Vsdio___024root___nba_sequent__TOP__1(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___nba_sequent__TOP__1\n"); );
    // Init
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
    CData/*4:0*/ __Vtableidx2;
    __Vtableidx2 = 0;
    // Body
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
    if ((1U & (((~ (IData)(vlSelf->sdio__DOT__tx_mem_valid)) 
                | (IData)(vlSelf->sdio__DOT____Vcellinp__u_control__i_tx_mem_ready)) 
               | (~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo))))) {
        vlSelf->sdio__DOT__u_control__DOT__tx_fifo_b 
            = vlSelf->sdio__DOT__u_control__DOT__fifo_b
            [(((IData)(vlSelf->sdio__DOT__tx_en) & (IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo))
               ? (IData)(vlSelf->sdio__DOT__u_control__DOT__tx_mem_addr)
               : (IData)(vlSelf->sdio__DOT__u_control__DOT__fif_rdaddr))];
    }
    if ((1U & (((~ (IData)(vlSelf->sdio__DOT__tx_mem_valid)) 
                | (IData)(vlSelf->sdio__DOT____Vcellinp__u_control__i_tx_mem_ready)) 
               | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo)))) {
        vlSelf->sdio__DOT__u_control__DOT__tx_fifo_a 
            = vlSelf->sdio__DOT__u_control__DOT__fifo_a
            [(((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo)) 
               & (IData)(vlSelf->sdio__DOT__tx_en))
               ? (IData)(vlSelf->sdio__DOT__u_control__DOT__tx_mem_addr)
               : (IData)(vlSelf->sdio__DOT__u_control__DOT__fif_rdaddr))];
    }
    if ((1U & (((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
                | (IData)(vlSelf->sdio__DOT__rx_done)) 
               | (~ (IData)(vlSelf->sdio__DOT__rx_en))))) {
        vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__rail_count = 0U;
        vlSelf->sdio__DOT__u_rxframe__DOT__load_crc = 0U;
        vlSelf->sdio__DOT__u_rxframe__DOT__data_phase = 0U;
        vlSelf->sdio__DOT__u_rxframe__DOT__last_strb = 0U;
    } else if (((~ (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__busy)) 
                & (IData)(vlSelf->sdio__DOT__rx_en))) {
        vlSelf->sdio__DOT__u_rxframe__DOT__last_strb = 0U;
        vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__rail_count 
            = (0x7ffffU & ((IData)(vlSelf->o_cfg_ds)
                            ? ((IData)(0x10U) + ((0xffffU 
                                                  & ((IData)(1U) 
                                                     << (IData)(vlSelf->sdio__DOT__u_control__DOT__lgblk))) 
                                                 + 
                                                 ((IData)(vlSelf->o_cfg_ddr)
                                                   ? 0x10U
                                                   : 0U)))
                            : ((0U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_width))
                                ? ((IData)(0x10U) + 
                                   (VL_SHIFTL_III(19,32,32, 
                                                  (0xffffU 
                                                   & ((IData)(1U) 
                                                      << (IData)(vlSelf->sdio__DOT__u_control__DOT__lgblk))), 3U) 
                                    + ((IData)(vlSelf->o_cfg_ddr)
                                        ? 0x10U : 0U)))
                                : ((1U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_width))
                                    ? ((IData)(0x10U) 
                                       + (VL_SHIFTL_III(19,32,32, 
                                                        (0xffffU 
                                                         & ((IData)(1U) 
                                                            << (IData)(vlSelf->sdio__DOT__u_control__DOT__lgblk))), 1U) 
                                          + ((IData)(vlSelf->o_cfg_ddr)
                                              ? 0x10U
                                              : 0U)))
                                    : ((IData)(0x10U) 
                                       + ((0xffffU 
                                           & ((IData)(1U) 
                                              << (IData)(vlSelf->sdio__DOT__u_control__DOT__lgblk))) 
                                          + ((IData)(vlSelf->o_cfg_ddr)
                                              ? 0x10U
                                              : 0U)))))));
        vlSelf->sdio__DOT__u_rxframe__DOT__data_phase = 1U;
        vlSelf->sdio__DOT__u_rxframe__DOT__load_crc = 0U;
    } else if ((3U == (IData)(vlSelf->i_rx_strb))) {
        vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__rail_count 
            = (0x7ffffU & (vlSelf->sdio__DOT__u_rxframe__DOT__rail_count 
                           - (IData)(2U)));
        vlSelf->sdio__DOT__u_rxframe__DOT__last_strb 
            = (3U == vlSelf->sdio__DOT__u_rxframe__DOT__rail_count);
        if (vlSelf->o_cfg_ddr) {
            vlSelf->sdio__DOT__u_rxframe__DOT__data_phase 
                = (0x22U < vlSelf->sdio__DOT__u_rxframe__DOT__rail_count);
            vlSelf->sdio__DOT__u_rxframe__DOT__load_crc 
                = ((0x22U >= vlSelf->sdio__DOT__u_rxframe__DOT__rail_count) 
                   & (2U < vlSelf->sdio__DOT__u_rxframe__DOT__rail_count));
        } else {
            vlSelf->sdio__DOT__u_rxframe__DOT__data_phase 
                = (0x12U < vlSelf->sdio__DOT__u_rxframe__DOT__rail_count);
            vlSelf->sdio__DOT__u_rxframe__DOT__load_crc 
                = ((0x12U >= vlSelf->sdio__DOT__u_rxframe__DOT__rail_count) 
                   & (2U < vlSelf->sdio__DOT__u_rxframe__DOT__rail_count));
        }
        if ((2U > vlSelf->sdio__DOT__u_rxframe__DOT__rail_count)) {
            vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__rail_count = 0U;
        }
    } else if ((2U & (IData)(vlSelf->i_rx_strb))) {
        vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__rail_count 
            = (0x7ffffU & (vlSelf->sdio__DOT__u_rxframe__DOT__rail_count 
                           - (IData)(1U)));
        vlSelf->sdio__DOT__u_rxframe__DOT__last_strb 
            = (2U == vlSelf->sdio__DOT__u_rxframe__DOT__rail_count);
        if (vlSelf->o_cfg_ddr) {
            vlSelf->sdio__DOT__u_rxframe__DOT__data_phase 
                = (0x21U < vlSelf->sdio__DOT__u_rxframe__DOT__rail_count);
            vlSelf->sdio__DOT__u_rxframe__DOT__load_crc 
                = ((0x21U >= vlSelf->sdio__DOT__u_rxframe__DOT__rail_count) 
                   & (1U < vlSelf->sdio__DOT__u_rxframe__DOT__rail_count));
        } else {
            vlSelf->sdio__DOT__u_rxframe__DOT__data_phase 
                = (0x11U < vlSelf->sdio__DOT__u_rxframe__DOT__rail_count);
            vlSelf->sdio__DOT__u_rxframe__DOT__load_crc 
                = ((0x11U >= vlSelf->sdio__DOT__u_rxframe__DOT__rail_count) 
                   & (1U < vlSelf->sdio__DOT__u_rxframe__DOT__rail_count));
        }
        if ((1U > vlSelf->sdio__DOT__u_rxframe__DOT__rail_count)) {
            vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__rail_count = 0U;
        }
    }
    vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg = vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__sync_sreg;
    vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill = vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__sync_fill;
    vlSelf->sdio__DOT__u_rxframe__DOT__mem_addr = vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_addr;
    vlSelf->sdio__DOT__u_rxframe__DOT__mem_strb = vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_strb;
    vlSelf->sdio__DOT__u_rxframe__DOT__mem_valid = vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__mem_valid;
    vlSelf->sdio__DOT__u_txframe__DOT__pstate = vlSelf->__Vdly__sdio__DOT__u_txframe__DOT__pstate;
    if (vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v0) {
        vlSelf->sdio__DOT__u_control__DOT__fifo_b[vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v0] 
            = (((~ ((IData)(0xffU) << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v0))) 
                & vlSelf->sdio__DOT__u_control__DOT__fifo_b
                [vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v0]) 
               | (0xffffffffULL & ((IData)(vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_b__v0) 
                                   << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v0))));
    }
    if (vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v1) {
        vlSelf->sdio__DOT__u_control__DOT__fifo_b[vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v1] 
            = (((~ ((IData)(0xffU) << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v1))) 
                & vlSelf->sdio__DOT__u_control__DOT__fifo_b
                [vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v1]) 
               | (0xffffffffULL & ((IData)(vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_b__v1) 
                                   << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v1))));
    }
    if (vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v2) {
        vlSelf->sdio__DOT__u_control__DOT__fifo_b[vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v2] 
            = (((~ ((IData)(0xffU) << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v2))) 
                & vlSelf->sdio__DOT__u_control__DOT__fifo_b
                [vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v2]) 
               | (0xffffffffULL & ((IData)(vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_b__v2) 
                                   << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v2))));
    }
    if (vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_b__v3) {
        vlSelf->sdio__DOT__u_control__DOT__fifo_b[vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v3] 
            = (((~ ((IData)(0xffU) << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v3))) 
                & vlSelf->sdio__DOT__u_control__DOT__fifo_b
                [vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_b__v3]) 
               | (0xffffffffULL & ((IData)(vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_b__v3) 
                                   << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_b__v3))));
    }
    vlSelf->sdio__DOT__u_control__DOT__fif_rdaddr = vlSelf->__Vdly__sdio__DOT__u_control__DOT__fif_rdaddr;
    vlSelf->sdio__DOT__u_control__DOT__tx_mem_addr 
        = vlSelf->__Vdly__sdio__DOT__u_control__DOT__tx_mem_addr;
    if (vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v0) {
        vlSelf->sdio__DOT__u_control__DOT__fifo_a[vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v0] 
            = (((~ ((IData)(0xffU) << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v0))) 
                & vlSelf->sdio__DOT__u_control__DOT__fifo_a
                [vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v0]) 
               | (0xffffffffULL & ((IData)(vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_a__v0) 
                                   << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v0))));
    }
    if (vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v1) {
        vlSelf->sdio__DOT__u_control__DOT__fifo_a[vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v1] 
            = (((~ ((IData)(0xffU) << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v1))) 
                & vlSelf->sdio__DOT__u_control__DOT__fifo_a
                [vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v1]) 
               | (0xffffffffULL & ((IData)(vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_a__v1) 
                                   << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v1))));
    }
    if (vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v2) {
        vlSelf->sdio__DOT__u_control__DOT__fifo_a[vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v2] 
            = (((~ ((IData)(0xffU) << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v2))) 
                & vlSelf->sdio__DOT__u_control__DOT__fifo_a
                [vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v2]) 
               | (0xffffffffULL & ((IData)(vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_a__v2) 
                                   << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v2))));
    }
    if (vlSelf->__Vdlyvset__sdio__DOT__u_control__DOT__fifo_a__v3) {
        vlSelf->sdio__DOT__u_control__DOT__fifo_a[vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v3] 
            = (((~ ((IData)(0xffU) << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v3))) 
                & vlSelf->sdio__DOT__u_control__DOT__fifo_a
                [vlSelf->__Vdlyvdim0__sdio__DOT__u_control__DOT__fifo_a__v3]) 
               | (0xffffffffULL & ((IData)(vlSelf->__Vdlyvval__sdio__DOT__u_control__DOT__fifo_a__v3) 
                                   << (IData)(vlSelf->__Vdlyvlsb__sdio__DOT__u_control__DOT__fifo_a__v3))));
    }
    vlSelf->sdio__DOT__tx_mem_valid = vlSelf->__Vdly__sdio__DOT__tx_mem_valid;
    vlSelf->sdio__DOT__rx_done = vlSelf->__Vdly__sdio__DOT__rx_done;
    vlSelf->sdio__DOT__u_rxframe__DOT__rail_count = vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__rail_count;
    vlSelf->sdio__DOT__u_rxframe__DOT__busy = vlSelf->__Vdly__sdio__DOT__u_rxframe__DOT__busy;
    vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra = 
        ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_valid) 
         & ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__f_ckstb) 
            | ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr) 
               & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__f_hlfck))));
    __Vtableidx2 = (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr) 
                     << 4U) | (((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period) 
                                << 2U) | (IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width)));
    vlSelf->sdio__DOT__u_txframe__DOT__fd_offset = 
        Vsdio__ConstPool__TABLE_h44593cd3_0[__Vtableidx2];
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
    vlSelf->o_cfg_ds = 0U;
    vlSelf->sdio__DOT__u_txframe__DOT__fd_count = (
                                                   ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count) 
                                                    > (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_offset))
                                                    ? 
                                                   (0x7fffU 
                                                    & ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__fb_count) 
                                                       - (IData)(vlSelf->sdio__DOT__u_txframe__DOT__fd_offset)))
                                                    : 0U);
    if (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset))) {
        vlSelf->sdio__DOT__u_control__DOT__r_fifo = 0U;
        vlSelf->sdio__DOT__u_control__DOT__r_width = 0U;
        vlSelf->o_cfg_ddr = 0U;
        vlSelf->sdio__DOT__u_control__DOT__lgblk = 9U;
    } else {
        if ((((((((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy)) 
                  & (~ (IData)(vlSelf->sdio__DOT__tx_en))) 
                 & (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
                & (~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_request))) 
               & (~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_request))) 
              & (IData)(vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb)) 
             & ((IData)(vlSelf->i_wb_sel) >> 1U))) {
            vlSelf->sdio__DOT__u_control__DOT__r_fifo 
                = (1U & (vlSelf->i_wb_data >> 0xcU));
        }
        if (((IData)(vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb) 
             & ((IData)(vlSelf->i_wb_sel) >> 1U))) {
            if ((0x800U & vlSelf->i_wb_data)) {
                if ((0x400U & vlSelf->i_wb_data)) {
                    vlSelf->sdio__DOT__u_control__DOT__r_width = 1U;
                }
            } else {
                vlSelf->sdio__DOT__u_control__DOT__r_width 
                    = ((0x400U & vlSelf->i_wb_data)
                        ? 1U : 0U);
            }
            vlSelf->o_cfg_ddr = (1U & (vlSelf->i_wb_data 
                                       >> 8U));
        }
        if (((((((~ (IData)(vlSelf->sdio__DOT__tx_en)) 
                 & (~ (IData)(vlSelf->sdio__DOT__rx_en))) 
                & (~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_request))) 
               & (~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_request))) 
              & (IData)(vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb)) 
             & ((IData)(vlSelf->i_wb_sel) >> 3U))) {
            vlSelf->sdio__DOT__u_control__DOT__lgblk 
                = (0xfU & (vlSelf->i_wb_data >> 0x18U));
            if ((0xfU <= (0xfU & (vlSelf->i_wb_data 
                                  >> 0x18U)))) {
                vlSelf->sdio__DOT__u_control__DOT__lgblk = 0xfU;
            } else if ((2U >= (0xfU & (vlSelf->i_wb_data 
                                       >> 0x18U)))) {
                vlSelf->sdio__DOT__u_control__DOT__lgblk = 2U;
            }
        }
    }
    vlSelf->sdio__DOT__rx_en = vlSelf->__Vdly__sdio__DOT__rx_en;
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
    vlSelf->o_rx_en = ((IData)(vlSelf->sdio__DOT__rx_active) 
                       & (IData)(vlSelf->sdio__DOT__rx_en));
    if ((((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset)) 
         | (IData)(vlSelf->sdio__DOT__cmd_err))) {
        vlSelf->sdio__DOT__u_control__DOT__r_rx_request = 0U;
        vlSelf->sdio__DOT__u_control__DOT__r_tx_request = 0U;
    } else {
        if ((((IData)(vlSelf->sdio__DOT__u_control__DOT__new_data_request) 
              & (~ (vlSelf->i_wb_data >> 0xaU))) & (IData)(
                                                           ((0x200U 
                                                             != 
                                                             (0x300U 
                                                              & vlSelf->i_wb_data)) 
                                                            | (0U 
                                                               == 
                                                               (3U 
                                                                & (vlSelf->i_wb_data 
                                                                   >> 6U))))))) {
            vlSelf->sdio__DOT__u_control__DOT__r_rx_request = 1U;
        } else if ((1U & (~ (IData)(vlSelf->sdio__DOT__cmd_request)))) {
            vlSelf->sdio__DOT__u_control__DOT__r_rx_request = 0U;
        }
        if (vlSelf->sdio__DOT__u_control__DOT__new_tx_request) {
            vlSelf->sdio__DOT__u_control__DOT__r_tx_request = 1U;
        } else if ((1U & ((((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy)) 
                            & (~ (IData)(vlSelf->sdio__DOT__cmd_request))) 
                           & (~ (IData)(vlSelf->sdio__DOT__tx_en))) 
                          & (~ (IData)(vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_card_busy))))) {
            vlSelf->sdio__DOT__u_control__DOT__r_tx_request = 0U;
        }
    }
    if (((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
           | (IData)(vlSelf->sdio__DOT__cmd_done)) 
          | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__w_no_response)) 
         | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept))) {
        vlSelf->sdio__DOT__cmd_err = 0U;
    } else if (((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout) 
                & (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__r_done)))) {
        vlSelf->sdio__DOT__cmd_err = 1U;
    } else if (((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__r_done) 
                & (IData)(vlSelf->sdio__DOT__clk_stb))) {
        vlSelf->sdio__DOT__cmd_err = (1U != (IData)(vlSelf->sdio__DOT__cmd_ercode));
    }
    if ((((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
            | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__active)) 
           | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept)) 
          | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__w_no_response)) 
         | (IData)(vlSelf->sdio__DOT__cmd_done))) {
        vlSelf->sdio__DOT__cmd_ercode = 0U;
    } else if ((1U & (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__r_done)))) {
        if (vlSelf->sdio__DOT__u_sdcmd__DOT__w_done) {
            vlSelf->sdio__DOT__cmd_ercode = 1U;
            if (((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__r_frame_err) 
                 | ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response) 
                    & ((((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type) 
                         >> 1U) & ((~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg)) 
                                   & (0x30U == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)))) 
                       | ((2U == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type)) 
                          & ((~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg)) 
                             & (0x88U == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)))))))) {
                vlSelf->sdio__DOT__cmd_ercode = 3U;
            }
            if (((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__w_done) 
                 & (9U != (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__crc_fill)))) {
                vlSelf->sdio__DOT__cmd_ercode = 2U;
            }
        } else if (vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout) {
            vlSelf->sdio__DOT__cmd_ercode = 0U;
        }
    }
    if (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset))) {
        vlSelf->sdio__DOT__cmd_request = 0U;
        vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_card_busy = 0U;
        vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_expect_busy = 0U;
    } else {
        if (vlSelf->sdio__DOT__u_control__DOT__new_cmd_request) {
            vlSelf->sdio__DOT__cmd_request = 1U;
        } else if ((1U & (~ (IData)(vlSelf->sdio__DOT__cmd_busy)))) {
            vlSelf->sdio__DOT__cmd_request = 0U;
        }
        if (vlSelf->sdio__DOT__tx_en) {
            vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_card_busy = 1U;
            vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_expect_busy = 1U;
        } else if (vlSelf->sdio__DOT__u_control__DOT__new_cmd_request) {
            vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_card_busy 
                = (3U == (3U & (vlSelf->i_wb_data >> 8U)));
            vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_expect_busy 
                = (3U == (3U & (vlSelf->i_wb_data >> 8U)));
        } else {
            if ((1U & (((~ (IData)(vlSelf->i_card_busy)) 
                        & (~ (IData)(vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_expect_busy))) 
                       & (~ (IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy))))) {
                vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_card_busy = 0U;
            }
            if (((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy)) 
                 & ((IData)(vlSelf->i_card_busy) | 
                    (0U == (IData)(vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter))))) {
                vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_expect_busy = 0U;
            }
        }
    }
    vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter 
        = vlSelf->__Vdly__sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter;
    vlSelf->sdio__DOT__tx_en = vlSelf->__Vdly__sdio__DOT__tx_en;
    vlSelf->sdio__DOT__u_sdcmd__DOT__crc_fill = vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__crc_fill;
    vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID 
        = ((IData)(vlSelf->sdio__DOT__tx_en) & (IData)(vlSelf->sdio__DOT__tx_mem_valid));
    if (((((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
           | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__w_no_response)) 
          | (IData)(vlSelf->sdio__DOT__cmd_done)) | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept))) {
        vlSelf->sdio__DOT__u_sdcmd__DOT__r_done = 0U;
    } else if (((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__w_done) 
                | (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout))) {
        vlSelf->sdio__DOT__u_sdcmd__DOT__r_done = 1U;
    }
    if ((1U & ((IData)(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) 
               | (~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response))))) {
        vlSelf->sdio__DOT__u_sdcmd__DOT__r_frame_err = 0U;
    } else if (vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept) {
        vlSelf->sdio__DOT__u_sdcmd__DOT__r_frame_err = 0U;
    } else if (((2U == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)) 
                & (0U != (3U & (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg))))) {
        vlSelf->sdio__DOT__u_sdcmd__DOT__r_frame_err = 1U;
    }
    if (vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset) {
        vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type = 0U;
        vlSelf->sdio__DOT__u_sdcmd__DOT__active = 0U;
        vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__srcount = 0U;
        vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response = 0U;
        vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_dbl = 0U;
    } else if (vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept) {
        vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type = vlSelf->sdio__DOT__cmd_type;
        vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__srcount = 0x30U;
        vlSelf->sdio__DOT__u_sdcmd__DOT__active = 1U;
        vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response 
            = (0U != (IData)(vlSelf->sdio__DOT__cmd_type));
        vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_dbl = 
            (0U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_ckspeed));
    } else {
        if (((IData)(vlSelf->sdio__DOT__clk_stb) & 
             (0U != (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__srcount)))) {
            if (vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_dbl) {
                vlSelf->sdio__DOT__u_sdcmd__DOT__active 
                    = (2U < (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__srcount));
                vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__srcount 
                    = (0x3fU & ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__srcount) 
                                - (IData)(2U)));
            } else {
                vlSelf->sdio__DOT__u_sdcmd__DOT__active 
                    = (1U < (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__srcount));
                vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__srcount 
                    = (0x3fU & ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__srcount) 
                                - (IData)(1U)));
            }
        }
        if (vlSelf->sdio__DOT__cmd_done) {
            vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response = 0U;
        }
    }
    vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout = vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_timeout;
    vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg = vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__rx_sreg;
    vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count = vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__resp_count;
    vlSelf->sdio__DOT__u_sdcmd__DOT__srcount = vlSelf->__Vdly__sdio__DOT__u_sdcmd__DOT__srcount;
    vlSelf->o_cmd_en = vlSelf->sdio__DOT__u_sdcmd__DOT__active;
    vlSelf->sdio__DOT__clk_stb = ((IData)(vlSelf->i_reset) 
                                  || ((((IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_clk) 
                                        & (IData)(vlSelf->sdio__DOT____Vcellinp__u_clkgen__i_cfg_shutdown)) 
                                       | (0U == (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd))) 
                                      || ((1U == (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd)) 
                                          || (1U & 
                                              ((2U 
                                                == (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd))
                                                ? (
                                                   ((0x200U 
                                                     & (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter))
                                                     ? 1U
                                                     : 2U) 
                                                   >> 1U)
                                                : (IData)(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_clk))))));
    if (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset))) {
        vlSelf->sdio__DOT__u_control__DOT__cmd_busy = 0U;
    } else if (vlSelf->sdio__DOT__u_control__DOT__new_cmd_request) {
        vlSelf->sdio__DOT__u_control__DOT__cmd_busy = 1U;
    } else if (vlSelf->sdio__DOT__cmd_done) {
        vlSelf->sdio__DOT__u_control__DOT__cmd_busy = 0U;
    }
    vlSelf->sdio__DOT__cmd_done = vlSelf->__Vdly__sdio__DOT__cmd_done;
    vlSelf->sdio__DOT____Vcellinp__u_clkgen__i_cfg_shutdown 
        = ((~ (IData)(vlSelf->sdio__DOT__rx_active)) 
           & (IData)(vlSelf->sdio__DOT__cfg_clk_shutdown));
    vlSelf->sdio__DOT__u_sdcmd__DOT__w_done = ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response) 
                                               & (((2U 
                                                    == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type)) 
                                                   & ((IData)(vlSelf->sdio__DOT__cmd_mem_valid) 
                                                      & (3U 
                                                         <= (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__mem_addr)))) 
                                                  | ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type) 
                                                     & (0x30U 
                                                        == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)))));
    vlSelf->sdio__DOT__u_txframe__DOT__start_packet 
        = ((IData)(vlSelf->sdio__DOT__tx_en) & ((IData)(vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID) 
                                                & ((IData)(vlSelf->sdio__DOT__clk_stb) 
                                                   & (~ (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_valid)))));
    vlSelf->sdio__DOT__u_txframe__DOT__pre_ready = 
        ((0U == (IData)(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts)) 
         & (IData)(vlSelf->sdio__DOT__clk_stb));
    vlSelf->sdio__DOT__cmd_busy = (1U & ((~ (IData)(vlSelf->sdio__DOT__clk_stb)) 
                                         | ((~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_self_request)) 
                                            & (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__r_busy))));
    vlSelf->o_cmd_data = (3U & ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_dbl)
                                 ? (IData)((vlSelf->sdio__DOT__u_sdcmd__DOT__tx_sreg 
                                            >> 0x2eU))
                                 : (- (IData)((1U & (IData)(
                                                            (vlSelf->sdio__DOT__u_sdcmd__DOT__tx_sreg 
                                                             >> 0x2fU)))))));
    vlSelf->sdio__DOT__u_sdcmd__DOT__w_no_response 
        = ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__active) 
           & ((0U == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type)) 
              & ((IData)(vlSelf->sdio__DOT__clk_stb) 
                 & ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__srcount) 
                    == ((IData)(1U) + (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_dbl))))));
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
    if (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset))) {
        vlSelf->sdio__DOT__cmd_type = 0U;
    } else if (vlSelf->sdio__DOT__u_control__DOT__new_cmd_request) {
        vlSelf->sdio__DOT__cmd_type = (3U & (vlSelf->i_wb_data 
                                             >> 8U));
    }
    vlSelf->sdio__DOT__u_control__DOT__mem_busy = ((IData)(vlSelf->sdio__DOT__tx_en) 
                                                   | ((IData)(vlSelf->sdio__DOT__u_control__DOT__r_tx_request) 
                                                      | ((IData)(vlSelf->sdio__DOT__rx_en) 
                                                         | ((IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_request) 
                                                            | ((IData)(vlSelf->sdio__DOT__u_control__DOT__cmd_busy) 
                                                               & (2U 
                                                                  == (IData)(vlSelf->sdio__DOT__cmd_type)))))));
    vlSelf->sdio__DOT____Vcellinp__u_control__i_tx_mem_ready 
        = ((IData)(vlSelf->sdio__DOT__tx_en) & (IData)(vlSelf->sdio__DOT__tx_mem_ready));
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
    if (((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset))) {
        vlSelf->sdio__DOT__u_control__DOT__r_ckspeed = 0xfcU;
    } else if (((IData)(vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb) 
                & (IData)(vlSelf->i_wb_sel))) {
        vlSelf->sdio__DOT__u_control__DOT__r_ckspeed 
            = (0xffU & vlSelf->i_wb_data);
        if ((2U > (0xffU & vlSelf->i_wb_data))) {
            vlSelf->sdio__DOT__u_control__DOT__r_ckspeed = 2U;
        } else if ((0U == (0xffU & vlSelf->i_wb_data))) {
            vlSelf->sdio__DOT__u_control__DOT__r_ckspeed = 1U;
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
    vlSelf->sdio__DOT__soft_reset = ((IData)(vlSelf->i_reset) 
                                     | (((IData)(vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb) 
                                         & (0xfU == (IData)(vlSelf->i_wb_sel))) 
                                        & (0x52000000U 
                                           == vlSelf->i_wb_data)));
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
    vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb = 
        ((IData)(vlSelf->i_wb_stb) & ((0U == (IData)(vlSelf->i_wb_addr)) 
                                      & ((IData)(vlSelf->i_wb_we) 
                                         & ((~ ((IData)(vlSelf->sdio__DOT__u_control__DOT__r_cmd_err) 
                                                | (IData)(vlSelf->sdio__DOT__u_control__DOT__r_rx_err))) 
                                            | (((IData)(vlSelf->i_wb_sel) 
                                                >> 1U) 
                                               & (vlSelf->i_wb_data 
                                                  >> 0xfU))))));
    vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset 
        = ((IData)(vlSelf->i_reset) | (IData)(vlSelf->sdio__DOT__soft_reset));
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

void Vsdio___024root___nba_sequent__TOP__0(Vsdio___024root* vlSelf);

void Vsdio___024root___eval_nba(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_nba\n"); );
    // Body
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsdio___024root___nba_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[2U] = 1U;
        Vsdio___024root___nba_sequent__TOP__1(vlSelf);
    }
}

void Vsdio___024root___eval_triggers__act(Vsdio___024root* vlSelf);
void Vsdio___024root___eval_act(Vsdio___024root* vlSelf);

bool Vsdio___024root___eval_phase__act(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_phase__act\n"); );
    // Init
    VlTriggerVec<1> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vsdio___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelf->__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
        vlSelf->__VnbaTriggered.thisOr(vlSelf->__VactTriggered);
        Vsdio___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vsdio___024root___eval_phase__nba(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_phase__nba\n"); );
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelf->__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vsdio___024root___eval_nba(vlSelf);
        vlSelf->__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdio___024root___dump_triggers__ico(Vsdio___024root* vlSelf);
#endif  // VL_DEBUG
bool Vsdio___024root___eval_phase__ico(Vsdio___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdio___024root___dump_triggers__nba(Vsdio___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdio___024root___dump_triggers__act(Vsdio___024root* vlSelf);
#endif  // VL_DEBUG

void Vsdio___024root___eval(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval\n"); );
    // Init
    IData/*31:0*/ __VicoIterCount;
    CData/*0:0*/ __VicoContinue;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VicoIterCount = 0U;
    vlSelf->__VicoFirstIteration = 1U;
    __VicoContinue = 1U;
    while (__VicoContinue) {
        if (VL_UNLIKELY((0x64U < __VicoIterCount))) {
#ifdef VL_DEBUG
            Vsdio___024root___dump_triggers__ico(vlSelf);
#endif
            VL_FATAL_MT("sdio.v", 48, "", "Input combinational region did not converge.");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        __VicoContinue = 0U;
        if (Vsdio___024root___eval_phase__ico(vlSelf)) {
            __VicoContinue = 1U;
        }
        vlSelf->__VicoFirstIteration = 0U;
    }
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vsdio___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("sdio.v", 48, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                Vsdio___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("sdio.v", 48, "", "Active region did not converge.");
            }
            vlSelf->__VactIterCount = ((IData)(1U) 
                                       + vlSelf->__VactIterCount);
            vlSelf->__VactContinue = 0U;
            if (Vsdio___024root___eval_phase__act(vlSelf)) {
                vlSelf->__VactContinue = 1U;
            }
        }
        if (Vsdio___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vsdio___024root___eval_debug_assertions(Vsdio___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->i_clk & 0xfeU))) {
        Verilated::overWidthError("i_clk");}
    if (VL_UNLIKELY((vlSelf->i_reset & 0xfeU))) {
        Verilated::overWidthError("i_reset");}
    if (VL_UNLIKELY((vlSelf->i_wb_cyc & 0xfeU))) {
        Verilated::overWidthError("i_wb_cyc");}
    if (VL_UNLIKELY((vlSelf->i_wb_stb & 0xfeU))) {
        Verilated::overWidthError("i_wb_stb");}
    if (VL_UNLIKELY((vlSelf->i_wb_we & 0xfeU))) {
        Verilated::overWidthError("i_wb_we");}
    if (VL_UNLIKELY((vlSelf->i_wb_addr & 0xf8U))) {
        Verilated::overWidthError("i_wb_addr");}
    if (VL_UNLIKELY((vlSelf->i_wb_sel & 0xf0U))) {
        Verilated::overWidthError("i_wb_sel");}
    if (VL_UNLIKELY((vlSelf->i_card_detect & 0xfeU))) {
        Verilated::overWidthError("i_card_detect");}
    if (VL_UNLIKELY((vlSelf->i_cmd_strb & 0xfcU))) {
        Verilated::overWidthError("i_cmd_strb");}
    if (VL_UNLIKELY((vlSelf->i_cmd_data & 0xfcU))) {
        Verilated::overWidthError("i_cmd_data");}
    if (VL_UNLIKELY((vlSelf->i_card_busy & 0xfeU))) {
        Verilated::overWidthError("i_card_busy");}
    if (VL_UNLIKELY((vlSelf->i_rx_strb & 0xfcU))) {
        Verilated::overWidthError("i_rx_strb");}
    if (VL_UNLIKELY((vlSelf->S_AC_VALID & 0xfeU))) {
        Verilated::overWidthError("S_AC_VALID");}
    if (VL_UNLIKELY((vlSelf->S_AC_DATA & 0xfcU))) {
        Verilated::overWidthError("S_AC_DATA");}
    if (VL_UNLIKELY((vlSelf->S_AD_VALID & 0xfeU))) {
        Verilated::overWidthError("S_AD_VALID");}
}
#endif  // VL_DEBUG
