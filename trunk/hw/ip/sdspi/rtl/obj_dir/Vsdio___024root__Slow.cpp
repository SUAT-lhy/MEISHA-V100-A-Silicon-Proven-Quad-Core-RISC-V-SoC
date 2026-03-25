// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsdio.h for the primary calling header

#include "Vsdio__pch.h"
#include "Vsdio__Syms.h"
#include "Vsdio___024root.h"

void Vsdio___024root___ctor_var_reset(Vsdio___024root* vlSelf);

Vsdio___024root::Vsdio___024root(Vsdio__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vsdio___024root___ctor_var_reset(this);
}

void Vsdio___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vsdio___024root::~Vsdio___024root() {
}
