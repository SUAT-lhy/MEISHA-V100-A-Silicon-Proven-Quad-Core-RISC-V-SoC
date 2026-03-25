// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsdspi.h for the primary calling header

#include "Vsdspi__pch.h"
#include "Vsdspi__Syms.h"
#include "Vsdspi___024root.h"

void Vsdspi___024root___ctor_var_reset(Vsdspi___024root* vlSelf);

Vsdspi___024root::Vsdspi___024root(Vsdspi__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vsdspi___024root___ctor_var_reset(this);
}

void Vsdspi___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vsdspi___024root::~Vsdspi___024root() {
}
