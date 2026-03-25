// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsdspi.h for the primary calling header

#include "Vsdspi__pch.h"
#include "Vsdspi__Syms.h"
#include "Vsdspi___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdspi___024root___dump_triggers__ico(Vsdspi___024root* vlSelf);
#endif  // VL_DEBUG

void Vsdspi___024root___eval_triggers__ico(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_triggers__ico\n"); );
    // Body
    vlSelf->__VicoTriggered.set(0U, (IData)(vlSelf->__VicoFirstIteration));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vsdspi___024root___dump_triggers__ico(vlSelf);
    }
#endif
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdspi___024root___dump_triggers__act(Vsdspi___024root* vlSelf);
#endif  // VL_DEBUG

void Vsdspi___024root___eval_triggers__act(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_triggers__act\n"); );
    // Body
    vlSelf->__VactTriggered.set(0U, ((IData)(vlSelf->i_clk) 
                                     & (~ (IData)(vlSelf->__Vtrigprevexpr___TOP__i_clk__0))));
    vlSelf->__Vtrigprevexpr___TOP__i_clk__0 = vlSelf->i_clk;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vsdspi___024root___dump_triggers__act(vlSelf);
    }
#endif
}
