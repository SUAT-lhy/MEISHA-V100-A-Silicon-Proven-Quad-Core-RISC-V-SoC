// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsdspi.h for the primary calling header

#include "Vsdspi__pch.h"
#include "Vsdspi___024root.h"

VL_INLINE_OPT void Vsdspi___024root___ico_sequent__TOP__0(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___ico_sequent__TOP__0\n"); );
    // Body
    vlSelf->sdspi__DOT__w_reset = ((IData)(vlSelf->i_sd_reset) 
                                   | (IData)(vlSelf->sdspi__DOT__r_watchdog_err));
    vlSelf->sdspi__DOT__wb_stb = ((~ (IData)(vlSelf->o_wb_stall)) 
                                  & (IData)(vlSelf->i_wb_stb));
    vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2 
        = ((IData)(vlSelf->sdspi__DOT__w_reset) | (IData)(vlSelf->sdspi__DOT__r_cmd_err));
    vlSelf->sdspi__DOT__write_stb = ((IData)(vlSelf->sdspi__DOT__wb_stb) 
                                     & ((IData)(vlSelf->i_wb_we) 
                                        & (0U != (IData)(vlSelf->i_wb_sel))));
    vlSelf->sdspi__DOT__wb_cmd_stb = ((~ (IData)(vlSelf->sdspi__DOT__r_cmd_busy)) 
                                      & ((IData)(vlSelf->sdspi__DOT__write_stb) 
                                         & ((0xfU == (IData)(vlSelf->i_wb_sel)) 
                                            & (0U == (IData)(vlSelf->i_wb_addr)))));
    vlSelf->sdspi__DOT____Vcellinp__spicmdi____pinNumber3 
        = ((IData)(vlSelf->sdspi__DOT__wb_cmd_stb) 
           & (0x40U == (0xc0U & vlSelf->i_wb_data)));
}

void Vsdspi___024root___eval_ico(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_ico\n"); );
    // Body
    if ((1ULL & vlSelf->__VicoTriggered.word(0U))) {
        Vsdspi___024root___ico_sequent__TOP__0(vlSelf);
    }
}

void Vsdspi___024root___eval_triggers__ico(Vsdspi___024root* vlSelf);

bool Vsdspi___024root___eval_phase__ico(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_phase__ico\n"); );
    // Init
    CData/*0:0*/ __VicoExecute;
    // Body
    Vsdspi___024root___eval_triggers__ico(vlSelf);
    __VicoExecute = vlSelf->__VicoTriggered.any();
    if (__VicoExecute) {
        Vsdspi___024root___eval_ico(vlSelf);
    }
    return (__VicoExecute);
}

void Vsdspi___024root___eval_act(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_act\n"); );
}

extern const VlUnpacked<CData/*1:0*/, 1024> Vsdspi__ConstPool__TABLE_he58a7cdb_0;
extern const VlUnpacked<CData/*4:0*/, 1024> Vsdspi__ConstPool__TABLE_h0f2ffc94_0;
extern const VlUnpacked<CData/*0:0*/, 1024> Vsdspi__ConstPool__TABLE_haf0b4f2c_0;
extern const VlUnpacked<CData/*1:0*/, 512> Vsdspi__ConstPool__TABLE_hb6264f9c_0;
extern const VlUnpacked<CData/*3:0*/, 512> Vsdspi__ConstPool__TABLE_heaaad552_0;
extern const VlUnpacked<CData/*0:0*/, 512> Vsdspi__ConstPool__TABLE_h0104347f_0;

VL_INLINE_OPT void Vsdspi___024root___nba_sequent__TOP__0(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___nba_sequent__TOP__0\n"); );
    // Init
    SData/*8:0*/ __Vtableidx1;
    __Vtableidx1 = 0;
    SData/*9:0*/ __Vtableidx2;
    __Vtableidx2 = 0;
    CData/*6:0*/ __Vdly__sdspi__DOT__fifo_wb_addr;
    __Vdly__sdspi__DOT__fifo_wb_addr = 0;
    CData/*6:0*/ __Vdlyvdim0__sdspi__DOT__fifo_a__v0;
    __Vdlyvdim0__sdspi__DOT__fifo_a__v0 = 0;
    IData/*31:0*/ __Vdlyvval__sdspi__DOT__fifo_a__v0;
    __Vdlyvval__sdspi__DOT__fifo_a__v0 = 0;
    CData/*0:0*/ __Vdlyvset__sdspi__DOT__fifo_a__v0;
    __Vdlyvset__sdspi__DOT__fifo_a__v0 = 0;
    CData/*6:0*/ __Vdlyvdim0__sdspi__DOT__fifo_b__v0;
    __Vdlyvdim0__sdspi__DOT__fifo_b__v0 = 0;
    IData/*31:0*/ __Vdlyvval__sdspi__DOT__fifo_b__v0;
    __Vdlyvval__sdspi__DOT__fifo_b__v0 = 0;
    CData/*0:0*/ __Vdlyvset__sdspi__DOT__fifo_b__v0;
    __Vdlyvset__sdspi__DOT__fifo_b__v0 = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__r_cmd_busy;
    __Vdly__sdspi__DOT__r_cmd_busy = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__r_cmd_err;
    __Vdly__sdspi__DOT__r_cmd_err = 0;
    IData/*31:0*/ __Vdly__sdspi__DOT__r_data_reg;
    __Vdly__sdspi__DOT__r_data_reg = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__ll_cmd_stb;
    __Vdly__sdspi__DOT__ll_cmd_stb = 0;
    CData/*2:0*/ __Vdly__sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present;
    __Vdly__sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present = 0;
    SData/*9:0*/ __Vdly__sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter;
    __Vdly__sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter = 0;
    IData/*25:0*/ __Vdly__sdspi__DOT__r_watchdog;
    __Vdly__sdspi__DOT__r_watchdog = 0;
    SData/*9:0*/ __Vdly__sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter;
    __Vdly__sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter = 0;
    CData/*6:0*/ __Vdly__sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter;
    __Vdly__sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter = 0;
    CData/*7:0*/ __Vdly__sdspi__DOT__lowlevel__DOT__r_clk_counter;
    __Vdly__sdspi__DOT__lowlevel__DOT__r_clk_counter = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__lowlevel__DOT__r_z_counter;
    __Vdly__sdspi__DOT__lowlevel__DOT__r_z_counter = 0;
    CData/*3:0*/ __Vdly__sdspi__DOT__lowlevel__DOT__r_state;
    __Vdly__sdspi__DOT__lowlevel__DOT__r_state = 0;
    CData/*7:0*/ __Vdly__sdspi__DOT__lowlevel__DOT__r_ireg;
    __Vdly__sdspi__DOT__lowlevel__DOT__r_ireg = 0;
    CData/*0:0*/ __Vdly__o_sck;
    __Vdly__o_sck = 0;
    CData/*7:0*/ __Vdly__sdspi__DOT__lowlevel__DOT__r_byte;
    __Vdly__sdspi__DOT__lowlevel__DOT__r_byte = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__cmd_busy;
    __Vdly__sdspi__DOT__cmd_busy = 0;
    QData/*39:0*/ __Vdly__sdspi__DOT__spicmdi__DOT__shift_data;
    __Vdly__sdspi__DOT__spicmdi__DOT__shift_data = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__cmd_sent;
    __Vdly__sdspi__DOT__cmd_sent = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__spicmdi__DOT__almost_sent;
    __Vdly__sdspi__DOT__spicmdi__DOT__almost_sent = 0;
    CData/*4:0*/ __Vdly__sdspi__DOT__spicmdi__DOT__crc_valid_sreg;
    __Vdly__sdspi__DOT__spicmdi__DOT__crc_valid_sreg = 0;
    CData/*4:0*/ __Vdly__sdspi__DOT__spicmdi__DOT__crc_bit_counter;
    __Vdly__sdspi__DOT__spicmdi__DOT__crc_bit_counter = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__spicmdi__DOT__crc_busy;
    __Vdly__sdspi__DOT__spicmdi__DOT__crc_busy = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__spicmdi__DOT__rx_r1_byte;
    __Vdly__sdspi__DOT__spicmdi__DOT__rx_r1_byte = 0;
    CData/*2:0*/ __Vdly__sdspi__DOT__spicmdi__DOT__rx_counter;
    __Vdly__sdspi__DOT__spicmdi__DOT__rx_counter = 0;
    QData/*39:0*/ __Vdly__sdspi__DOT__cmd_response;
    __Vdly__sdspi__DOT__cmd_response = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__rx_busy;
    __Vdly__sdspi__DOT__rx_busy = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__spi_write_to_fifo;
    __Vdly__sdspi__DOT__spi_write_to_fifo = 0;
    CData/*7:0*/ __Vdly__sdspi__DOT__spi_write_addr;
    __Vdly__sdspi__DOT__spi_write_addr = 0;
    IData/*23:0*/ __Vdly__sdspi__DOT__spirxdatai__DOT__gearbox;
    __Vdly__sdspi__DOT__spirxdatai__DOT__gearbox = 0;
    CData/*2:0*/ __Vdly__sdspi__DOT__spirxdatai__DOT__fill;
    __Vdly__sdspi__DOT__spirxdatai__DOT__fill = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__spirxdatai__DOT__lastdata;
    __Vdly__sdspi__DOT__spirxdatai__DOT__lastdata = 0;
    CData/*1:0*/ __Vdly__sdspi__DOT__spirxdatai__DOT__crc_byte;
    __Vdly__sdspi__DOT__spirxdatai__DOT__crc_byte = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__spirxdatai__DOT__lastaddr;
    __Vdly__sdspi__DOT__spirxdatai__DOT__lastaddr = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__spirxdatai__DOT__crc_active;
    __Vdly__sdspi__DOT__spirxdatai__DOT__crc_active = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__tx_busy;
    __Vdly__sdspi__DOT__tx_busy = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__spitxdatai__DOT__received_token;
    __Vdly__sdspi__DOT__spitxdatai__DOT__received_token = 0;
    CData/*1:0*/ __Vdly__sdspi__DOT__spitxdatai__DOT__rdvalid;
    __Vdly__sdspi__DOT__spitxdatai__DOT__rdvalid = 0;
    CData/*4:0*/ __Vdly__sdspi__DOT__spitxdatai__DOT__fill;
    __Vdly__sdspi__DOT__spitxdatai__DOT__fill = 0;
    QData/*39:0*/ __Vdly__sdspi__DOT__spitxdatai__DOT__gearbox;
    __Vdly__sdspi__DOT__spitxdatai__DOT__gearbox = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__spitxdatai__DOT__crc_stb;
    __Vdly__sdspi__DOT__spitxdatai__DOT__crc_stb = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__spi_read_from_fifo;
    __Vdly__sdspi__DOT__spi_read_from_fifo = 0;
    CData/*7:0*/ __Vdly__sdspi__DOT__spi_read_addr;
    __Vdly__sdspi__DOT__spi_read_addr = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__spitxdatai__DOT__lastaddr;
    __Vdly__sdspi__DOT__spitxdatai__DOT__lastaddr = 0;
    CData/*0:0*/ __Vdly__sdspi__DOT__spitxdatai__DOT__crc_active;
    __Vdly__sdspi__DOT__spitxdatai__DOT__crc_active = 0;
    // Body
    __Vdly__sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present 
        = vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present;
    __Vdly__sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter 
        = vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter;
    __Vdly__sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter 
        = vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter;
    __Vdly__sdspi__DOT__r_watchdog = vlSelf->sdspi__DOT__r_watchdog;
    __Vdly__sdspi__DOT__lowlevel__DOT__r_ireg = vlSelf->sdspi__DOT__lowlevel__DOT__r_ireg;
    __Vdly__sdspi__DOT__fifo_wb_addr = vlSelf->sdspi__DOT__fifo_wb_addr;
    __Vdly__sdspi__DOT__spirxdatai__DOT__lastdata = vlSelf->sdspi__DOT__spirxdatai__DOT__lastdata;
    __Vdly__sdspi__DOT__spicmdi__DOT__crc_valid_sreg 
        = vlSelf->sdspi__DOT__spicmdi__DOT__crc_valid_sreg;
    __Vdly__sdspi__DOT__spicmdi__DOT__crc_busy = vlSelf->sdspi__DOT__spicmdi__DOT__crc_busy;
    __Vdly__sdspi__DOT__spicmdi__DOT__crc_bit_counter 
        = vlSelf->sdspi__DOT__spicmdi__DOT__crc_bit_counter;
    __Vdly__sdspi__DOT__spitxdatai__DOT__received_token 
        = vlSelf->sdspi__DOT__spitxdatai__DOT__received_token;
    __Vdly__sdspi__DOT__spitxdatai__DOT__rdvalid = vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid;
    __Vdly__sdspi__DOT__spicmdi__DOT__almost_sent = vlSelf->sdspi__DOT__spicmdi__DOT__almost_sent;
    __Vdly__sdspi__DOT__cmd_sent = vlSelf->sdspi__DOT__cmd_sent;
    __Vdly__sdspi__DOT__spitxdatai__DOT__crc_active 
        = vlSelf->sdspi__DOT__spitxdatai__DOT__crc_active;
    __Vdly__sdspi__DOT__spirxdatai__DOT__crc_byte = vlSelf->sdspi__DOT__spirxdatai__DOT__crc_byte;
    __Vdly__sdspi__DOT__spi_read_addr = vlSelf->sdspi__DOT__spi_read_addr;
    __Vdly__sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter 
        = vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter;
    __Vdly__sdspi__DOT__spirxdatai__DOT__gearbox = vlSelf->sdspi__DOT__spirxdatai__DOT__gearbox;
    __Vdly__sdspi__DOT__spi_write_addr = vlSelf->sdspi__DOT__spi_write_addr;
    __Vdly__sdspi__DOT__spicmdi__DOT__shift_data = vlSelf->sdspi__DOT__spicmdi__DOT__shift_data;
    __Vdly__sdspi__DOT__lowlevel__DOT__r_clk_counter 
        = vlSelf->sdspi__DOT__lowlevel__DOT__r_clk_counter;
    __Vdly__sdspi__DOT__lowlevel__DOT__r_z_counter 
        = vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter;
    __Vdly__sdspi__DOT__spirxdatai__DOT__fill = vlSelf->sdspi__DOT__spirxdatai__DOT__fill;
    __Vdly__sdspi__DOT__spitxdatai__DOT__lastaddr = vlSelf->sdspi__DOT__spitxdatai__DOT__lastaddr;
    __Vdly__sdspi__DOT__spirxdatai__DOT__lastaddr = vlSelf->sdspi__DOT__spirxdatai__DOT__lastaddr;
    __Vdly__sdspi__DOT__lowlevel__DOT__r_state = vlSelf->sdspi__DOT__lowlevel__DOT__r_state;
    __Vdly__sdspi__DOT__spi_write_to_fifo = vlSelf->sdspi__DOT__spi_write_to_fifo;
    __Vdly__sdspi__DOT__spirxdatai__DOT__crc_active 
        = vlSelf->sdspi__DOT__spirxdatai__DOT__crc_active;
    __Vdly__sdspi__DOT__r_cmd_busy = vlSelf->sdspi__DOT__r_cmd_busy;
    __Vdly__sdspi__DOT__spitxdatai__DOT__gearbox = vlSelf->sdspi__DOT__spitxdatai__DOT__gearbox;
    __Vdly__sdspi__DOT__ll_cmd_stb = vlSelf->sdspi__DOT__ll_cmd_stb;
    __Vdly__sdspi__DOT__rx_busy = vlSelf->sdspi__DOT__rx_busy;
    __Vdly__sdspi__DOT__spi_read_from_fifo = vlSelf->sdspi__DOT__spi_read_from_fifo;
    __Vdly__sdspi__DOT__spitxdatai__DOT__crc_stb = vlSelf->sdspi__DOT__spitxdatai__DOT__crc_stb;
    __Vdly__sdspi__DOT__cmd_response = vlSelf->sdspi__DOT__cmd_response;
    __Vdly__sdspi__DOT__spicmdi__DOT__rx_counter = vlSelf->sdspi__DOT__spicmdi__DOT__rx_counter;
    __Vdly__sdspi__DOT__spicmdi__DOT__rx_r1_byte = vlSelf->sdspi__DOT__spicmdi__DOT__rx_r1_byte;
    __Vdly__o_sck = vlSelf->o_sck;
    __Vdly__sdspi__DOT__spitxdatai__DOT__fill = vlSelf->sdspi__DOT__spitxdatai__DOT__fill;
    __Vdly__sdspi__DOT__cmd_busy = vlSelf->sdspi__DOT__cmd_busy;
    __Vdly__sdspi__DOT__lowlevel__DOT__r_byte = vlSelf->sdspi__DOT__lowlevel__DOT__r_byte;
    __Vdly__sdspi__DOT__tx_busy = vlSelf->sdspi__DOT__tx_busy;
    __Vdly__sdspi__DOT__r_cmd_err = vlSelf->sdspi__DOT__r_cmd_err;
    __Vdlyvset__sdspi__DOT__fifo_b__v0 = 0U;
    __Vdlyvset__sdspi__DOT__fifo_a__v0 = 0U;
    __Vdly__sdspi__DOT__r_data_reg = vlSelf->sdspi__DOT__r_data_reg;
    __Vdly__sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present 
        = ((6U & ((IData)(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present) 
                  << 1U)) | (IData)(vlSelf->i_card_detect));
    if (((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter) 
         & (~ (IData)(vlSelf->o_sck)))) {
        __Vdly__sdspi__DOT__lowlevel__DOT__r_ireg = 
            ((0xfeU & ((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_ireg) 
                       << 1U)) | (IData)(vlSelf->i_miso));
    }
    if (((IData)(vlSelf->sdspi__DOT__write_stb) & (0U 
                                                   == (IData)(vlSelf->i_wb_addr)))) {
        __Vdly__sdspi__DOT__fifo_wb_addr = 0U;
    } else if (((IData)(vlSelf->sdspi__DOT__wb_stb) 
                & (((IData)(vlSelf->i_wb_addr) >> 1U) 
                   & (0U != (IData)(vlSelf->i_wb_sel))))) {
        __Vdly__sdspi__DOT__fifo_wb_addr = (0x7fU & 
                                            ((IData)(1U) 
                                             + (IData)(vlSelf->sdspi__DOT__fifo_wb_addr)));
    }
    __Vtableidx2 = (((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_fill) 
                     << 5U) | (((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid) 
                                << 3U) | (((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_active) 
                                           << 2U) | 
                                          (((IData)(vlSelf->sdspi__DOT__tx_busy) 
                                            << 1U) 
                                           | (IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2)))));
    if ((1U & Vsdspi__ConstPool__TABLE_he58a7cdb_0[__Vtableidx2])) {
        vlSelf->sdspi__DOT__spitxdatai__DOT__crc_fill 
            = Vsdspi__ConstPool__TABLE_h0f2ffc94_0[__Vtableidx2];
    }
    if ((2U & Vsdspi__ConstPool__TABLE_he58a7cdb_0[__Vtableidx2])) {
        __Vdly__sdspi__DOT__spitxdatai__DOT__crc_active 
            = Vsdspi__ConstPool__TABLE_haf0b4f2c_0[__Vtableidx2];
    }
    vlSelf->sdspi__DOT__spitxdatai__DOT__crc_gearbox 
        = ((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_active)
            ? (vlSelf->sdspi__DOT__spitxdatai__DOT__crc_gearbox 
               << 2U) : vlSelf->sdspi__DOT__spi_read_data);
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_gearbox 
        = ((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_active)
            ? (0xfcU & ((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_gearbox) 
                        << 2U)) : (IData)(vlSelf->sdspi__DOT__ll_out_dat));
    if (vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7) {
        __Vdly__sdspi__DOT__spirxdatai__DOT__gearbox 
            = ((0xffff00U & (vlSelf->sdspi__DOT__spirxdatai__DOT__gearbox 
                             << 8U)) | (IData)(vlSelf->sdspi__DOT__ll_out_dat));
    }
    if (((~ (IData)(vlSelf->sdspi__DOT__cmd_busy)) 
         & (IData)(vlSelf->sdspi__DOT____Vcellinp__spicmdi____pinNumber3))) {
        __Vdly__sdspi__DOT__spicmdi__DOT__shift_data 
            = (0x4000000000ULL | (((QData)((IData)(
                                                   (0x3fU 
                                                    & vlSelf->i_wb_data))) 
                                   << 0x20U) | (QData)((IData)(vlSelf->sdspi__DOT__r_data_reg))));
    } else if (vlSelf->sdspi__DOT__ll_advance) {
        __Vdly__sdspi__DOT__spicmdi__DOT__shift_data 
            = (0xffULL | ((QData)((IData)(vlSelf->sdspi__DOT__spicmdi__DOT__shift_data)) 
                          << 8U));
        if ((1U & (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__crc_valid_sreg))) {
            __Vdly__sdspi__DOT__spicmdi__DOT__shift_data 
                = ((0xffffffffULL & __Vdly__sdspi__DOT__spicmdi__DOT__shift_data) 
                   | ((QData)((IData)(vlSelf->sdspi__DOT__spicmdi__DOT__crc_byte)) 
                      << 0x20U));
        }
    }
    if (vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter) {
        if (vlSelf->sdspi__DOT__lowlevel__DOT__restart_counter) {
            __Vdly__sdspi__DOT__lowlevel__DOT__r_clk_counter 
                = vlSelf->sdspi__DOT__r_sdspi_clk;
            __Vdly__sdspi__DOT__lowlevel__DOT__r_z_counter 
                = (0U == (IData)(vlSelf->sdspi__DOT__r_sdspi_clk));
        }
    } else {
        __Vdly__sdspi__DOT__lowlevel__DOT__r_clk_counter 
            = (0xffU & ((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_clk_counter) 
                        - (IData)(1U)));
        __Vdly__sdspi__DOT__lowlevel__DOT__r_z_counter 
            = (1U == (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_clk_counter));
    }
    if ((1U & ((~ (IData)(vlSelf->sdspi__DOT__rx_busy)) 
               | (~ (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__received_token))))) {
        __Vdly__sdspi__DOT__spirxdatai__DOT__fill = 0U;
    } else if (((7U == (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__fill)) 
                & (IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7))) {
        __Vdly__sdspi__DOT__spirxdatai__DOT__fill = 0U;
    } else if (vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7) {
        __Vdly__sdspi__DOT__spirxdatai__DOT__fill = 
            (1U | (6U & ((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__fill) 
                         << 1U)));
    }
    __Vdly__sdspi__DOT__spi_write_to_fifo = ((~ ((IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2) 
                                                 | (~ (IData)(vlSelf->sdspi__DOT__rx_busy)))) 
                                             & (((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__received_token) 
                                                 & (~ (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__all_mem_written))) 
                                                & ((7U 
                                                    == (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__fill)) 
                                                   & (IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7))));
    __Vtableidx1 = (((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_fill) 
                     << 5U) | ((((~ (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__all_mem_written)) 
                                 & (IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7)) 
                                << 4U) | (((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_active) 
                                           << 3U) | 
                                          (((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__received_token) 
                                            << 2U) 
                                           | (((IData)(vlSelf->sdspi__DOT__rx_busy) 
                                               << 1U) 
                                              | (IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2))))));
    if ((1U & Vsdspi__ConstPool__TABLE_hb6264f9c_0[__Vtableidx1])) {
        vlSelf->sdspi__DOT__spirxdatai__DOT__crc_fill 
            = Vsdspi__ConstPool__TABLE_heaaad552_0[__Vtableidx1];
    }
    if ((2U & Vsdspi__ConstPool__TABLE_hb6264f9c_0[__Vtableidx1])) {
        __Vdly__sdspi__DOT__spirxdatai__DOT__crc_active 
            = Vsdspi__ConstPool__TABLE_h0104347f_0[__Vtableidx1];
    }
    if (((~ (IData)(vlSelf->sdspi__DOT__tx_stb)) & 
         ((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid) 
          >> 1U))) {
        __Vdly__sdspi__DOT__spitxdatai__DOT__gearbox 
            = (0xfe00000000ULL | (QData)((IData)(vlSelf->sdspi__DOT__spi_read_data)));
    } else if ((2U & (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid))) {
        __Vdly__sdspi__DOT__spitxdatai__DOT__gearbox 
            = (((QData)((IData)((0xffU & (IData)((vlSelf->sdspi__DOT__spitxdatai__DOT__gearbox 
                                                  >> 0x20U))))) 
                << 0x20U) | (QData)((IData)(vlSelf->sdspi__DOT__spi_read_data)));
    } else if (vlSelf->sdspi__DOT__spitxdatai__DOT__crc_stb) {
        __Vdly__sdspi__DOT__spitxdatai__DOT__gearbox 
            = (((QData)((IData)((0xffU & (IData)((vlSelf->sdspi__DOT__spitxdatai__DOT__gearbox 
                                                  >> 0x20U))))) 
                << 0x20U) | (QData)((IData)((0xffU 
                                             | ((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_data) 
                                                << 0x10U)))));
    } else if (((IData)(vlSelf->sdspi__DOT__tx_stb) 
                & (~ (IData)(vlSelf->sdspi__DOT____Vcellinp__spitxdatai____pinNumber10)))) {
        __Vdly__sdspi__DOT__spitxdatai__DOT__gearbox 
            = (0xffULL | ((QData)((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__gearbox)) 
                          << 8U));
    }
    if (vlSelf->sdspi__DOT__tx_busy) {
        if (((IData)(vlSelf->sdspi__DOT__spi_read_from_fifo) 
             & (~ (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__lastaddr)))) {
            __Vdly__sdspi__DOT__spi_read_addr = ((0x80U 
                                                  & (IData)(__Vdly__sdspi__DOT__spi_read_addr)) 
                                                 | (0x7fU 
                                                    & ((IData)(1U) 
                                                       + (IData)(vlSelf->sdspi__DOT__spi_read_addr))));
            if ((0U != (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__r_lgblksz_m3))) {
                __Vdly__sdspi__DOT__spitxdatai__DOT__lastaddr 
                    = (1U & ((1U == (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__r_lgblksz_m3))
                              ? ((IData)(vlSelf->sdspi__DOT__spi_read_addr) 
                                 >> 1U) : ((2U == (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__r_lgblksz_m3))
                                            ? (3U == 
                                               (3U 
                                                & ((IData)(vlSelf->sdspi__DOT__spi_read_addr) 
                                                   >> 1U)))
                                            : ((3U 
                                                == (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__r_lgblksz_m3))
                                                ? (7U 
                                                   == 
                                                   (7U 
                                                    & ((IData)(vlSelf->sdspi__DOT__spi_read_addr) 
                                                       >> 1U)))
                                                : (
                                                   (4U 
                                                    == (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__r_lgblksz_m3))
                                                    ? 
                                                   (0xfU 
                                                    == 
                                                    (0xfU 
                                                     & ((IData)(vlSelf->sdspi__DOT__spi_read_addr) 
                                                        >> 1U)))
                                                    : 
                                                   ((5U 
                                                     == (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__r_lgblksz_m3))
                                                     ? 
                                                    (0x1fU 
                                                     == 
                                                     (0x1fU 
                                                      & ((IData)(vlSelf->sdspi__DOT__spi_read_addr) 
                                                         >> 1U)))
                                                     : 
                                                    (0x3fU 
                                                     == 
                                                     (0x3fU 
                                                      & ((IData)(vlSelf->sdspi__DOT__spi_read_addr) 
                                                         >> 1U)))))))));
            }
        }
        if (vlSelf->sdspi__DOT__spitxdatai__DOT__crc_active) {
            vlSelf->sdspi__DOT__spitxdatai__DOT__crc_data 
                = vlSelf->sdspi__DOT__spitxdatai__DOT__next_crc_data;
        }
    } else {
        __Vdly__sdspi__DOT__spi_read_addr = ((IData)(vlSelf->sdspi__DOT__r_fifo_id) 
                                             << 7U);
        __Vdly__sdspi__DOT__spitxdatai__DOT__lastaddr 
            = (4U > (IData)(vlSelf->sdspi__DOT__r_lgblklen));
        vlSelf->sdspi__DOT__spitxdatai__DOT__crc_data = 0U;
    }
    if (((~ (IData)(vlSelf->sdspi__DOT__tx_stb)) & 
         ((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid) 
          >> 1U))) {
        __Vdly__sdspi__DOT__spitxdatai__DOT__fill = 0x1fU;
    } else if ((2U & (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid))) {
        __Vdly__sdspi__DOT__spitxdatai__DOT__fill = 0x1fU;
    } else if (vlSelf->sdspi__DOT__spitxdatai__DOT__crc_stb) {
        __Vdly__sdspi__DOT__spitxdatai__DOT__fill = 
            (0xcU | (0x10U & (IData)(__Vdly__sdspi__DOT__spitxdatai__DOT__fill)));
    } else if (((IData)(vlSelf->sdspi__DOT__tx_stb) 
                & (~ (IData)(vlSelf->sdspi__DOT____Vcellinp__spitxdatai____pinNumber10)))) {
        __Vdly__sdspi__DOT__spitxdatai__DOT__fill = 
            (0x1fU & VL_SHIFTL_III(5,5,32, (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__fill), 1U));
    }
    if ((1U & (~ (IData)(vlSelf->sdspi__DOT__tx_busy)))) {
        __Vdly__sdspi__DOT__spitxdatai__DOT__gearbox 
            = (0xfe00000000ULL | (0xffffffffULL & __Vdly__sdspi__DOT__spitxdatai__DOT__gearbox));
        vlSelf->sdspi__DOT__spitxdatai__DOT__r_lgblksz_m3 
            = (7U & ((IData)(vlSelf->sdspi__DOT__r_lgblklen) 
                     - (IData)(3U)));
    }
    if (vlSelf->sdspi__DOT__ll_advance) {
        __Vdly__sdspi__DOT__ll_cmd_stb = ((IData)(vlSelf->sdspi__DOT__cmd_busy)
                                           ? ((IData)(vlSelf->sdspi__DOT__ll_cmd_stb) 
                                              | (IData)(vlSelf->sdspi__DOT__cmd_busy))
                                           : ((IData)(vlSelf->sdspi__DOT__ll_cmd_stb) 
                                              | (IData)(vlSelf->sdspi__DOT__tx_stb)));
    }
    if (((((IData)(vlSelf->sdspi__DOT__ll_idle) & (~ (IData)(vlSelf->sdspi__DOT__cmd_busy))) 
          & (~ (IData)(vlSelf->sdspi__DOT__rx_busy))) 
         & (~ (IData)(vlSelf->sdspi__DOT__tx_busy)))) {
        __Vdly__sdspi__DOT__ll_cmd_stb = 0U;
    }
    if ((1U & ((~ (IData)(vlSelf->sdspi__DOT__r_cmd_busy)) 
               | (IData)(vlSelf->i_sd_reset)))) {
        __Vdly__sdspi__DOT__ll_cmd_stb = 0U;
    }
    if (vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2) {
        __Vdly__sdspi__DOT__rx_busy = 0U;
        __Vdly__sdspi__DOT__spitxdatai__DOT__fill = 0U;
        __Vdly__sdspi__DOT__tx_busy = 0U;
    } else {
        if (vlSelf->sdspi__DOT__rx_busy) {
            if (((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__error_token) 
                 | (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__done))) {
                __Vdly__sdspi__DOT__rx_busy = 0U;
            }
        } else {
            __Vdly__sdspi__DOT__rx_busy = vlSelf->sdspi__DOT__rx_start;
        }
        if ((1U & (~ (IData)(vlSelf->sdspi__DOT__tx_busy)))) {
            __Vdly__sdspi__DOT__spitxdatai__DOT__fill 
                = ((IData)(vlSelf->sdspi__DOT__tx_start)
                    ? 0x10U : 0U);
        }
        if (vlSelf->sdspi__DOT__tx_busy) {
            if ((((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__all_idle) 
                  & (IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7)) 
                 & (0xffU == (IData)(vlSelf->sdspi__DOT__ll_out_dat)))) {
                __Vdly__sdspi__DOT__tx_busy = 0U;
            }
        } else {
            __Vdly__sdspi__DOT__tx_busy = vlSelf->sdspi__DOT__tx_start;
        }
    }
    if (vlSelf->sdspi__DOT__r_cmd_busy) {
        if ((0U != vlSelf->sdspi__DOT__r_watchdog)) {
            __Vdly__sdspi__DOT__r_watchdog = (0x3ffffffU 
                                              & (vlSelf->sdspi__DOT__r_watchdog 
                                                 - (IData)(1U)));
        }
        if (vlSelf->sdspi__DOT__cmd_valid) {
            __Vdly__sdspi__DOT__r_data_reg = (IData)(vlSelf->sdspi__DOT__cmd_response);
        } else if (vlSelf->sdspi__DOT__tx_valid) {
            __Vdly__sdspi__DOT__r_data_reg = vlSelf->sdspi__DOT__tx_response;
        } else if (vlSelf->sdspi__DOT__rx_valid) {
            __Vdly__sdspi__DOT__r_data_reg = vlSelf->sdspi__DOT__rx_response;
        }
    } else {
        __Vdly__sdspi__DOT__r_watchdog = 0x3fffffU;
        if (((IData)(vlSelf->sdspi__DOT__wb_stb) & 
             ((IData)(vlSelf->i_wb_we) & ((0U != (IData)(vlSelf->i_wb_sel)) 
                                          & (1U == (IData)(vlSelf->i_wb_addr)))))) {
            __Vdly__sdspi__DOT__r_data_reg = vlSelf->i_wb_data;
        } else if (((IData)(vlSelf->sdspi__DOT__wb_cmd_stb) 
                    & (vlSelf->i_wb_data >> 7U))) {
            __Vdly__sdspi__DOT__r_data_reg = (0x9000000U 
                                              | (((IData)(vlSelf->sdspi__DOT__r_lgblklen) 
                                                  << 0x10U) 
                                                 | (IData)(vlSelf->sdspi__DOT__r_sdspi_clk)));
        }
    }
    if (vlSelf->sdspi__DOT__w_reset) {
        __Vdly__sdspi__DOT__cmd_busy = 0U;
    } else if (((~ (IData)(vlSelf->sdspi__DOT__cmd_busy)) 
                & (IData)(vlSelf->sdspi__DOT____Vcellinp__spicmdi____pinNumber3))) {
        __Vdly__sdspi__DOT__cmd_busy = 1U;
    } else if (((IData)(vlSelf->sdspi__DOT__spicmdi__DOT__rxvalid) 
                & (~ (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__rx_check_busy)))) {
        __Vdly__sdspi__DOT__cmd_busy = 0U;
    }
    if (vlSelf->sdspi__DOT__r_watchdog_err) {
        __Vdly__sdspi__DOT__r_cmd_err = 1U;
    } else if (vlSelf->sdspi__DOT__r_cmd_busy) {
        if (vlSelf->sdspi__DOT__cmd_valid) {
            __Vdly__sdspi__DOT__r_cmd_err = ((IData)(vlSelf->sdspi__DOT__r_cmd_err) 
                                             | (0ULL 
                                                != 
                                                (0x7e00000000ULL 
                                                 & vlSelf->sdspi__DOT__cmd_response)));
        }
        if (vlSelf->sdspi__DOT__rx_valid) {
            __Vdly__sdspi__DOT__r_cmd_err = (1U & ((IData)(vlSelf->sdspi__DOT__r_cmd_err) 
                                                   | ((IData)(vlSelf->sdspi__DOT__rx_response) 
                                                      >> 3U)));
        }
    } else if (vlSelf->sdspi__DOT__wb_cmd_stb) {
        __Vdly__sdspi__DOT__r_cmd_err = ((IData)(vlSelf->sdspi__DOT__r_cmd_err) 
                                         & (~ (vlSelf->i_wb_data 
                                               >> 0xfU)));
    }
    if (vlSelf->sdspi__DOT__write_fifo_b) {
        __Vdlyvval__sdspi__DOT__fifo_b__v0 = vlSelf->sdspi__DOT__write_fifo_b_data;
        __Vdlyvset__sdspi__DOT__fifo_b__v0 = 1U;
        __Vdlyvdim0__sdspi__DOT__fifo_b__v0 = vlSelf->sdspi__DOT__write_fifo_b_addr;
    }
    if (vlSelf->sdspi__DOT__write_fifo_a) {
        __Vdlyvval__sdspi__DOT__fifo_a__v0 = vlSelf->sdspi__DOT__write_fifo_a_data;
        __Vdlyvset__sdspi__DOT__fifo_a__v0 = 1U;
        __Vdlyvdim0__sdspi__DOT__fifo_a__v0 = vlSelf->sdspi__DOT__write_fifo_a_addr;
    }
    vlSelf->o_wb_ack = ((IData)(vlSelf->i_wb_cyc) & (IData)(vlSelf->sdspi__DOT__dly_stb));
    vlSelf->o_int = (1U & (((~ (IData)(vlSelf->sdspi__DOT__r_cmd_busy)) 
                            & (IData)(vlSelf->sdspi__DOT__last_busy)) 
                           | ((~ (IData)(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_removed)) 
                              & (~ (IData)(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_present)))));
    if (((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold) 
         | (IData)(vlSelf->i_sd_reset))) {
        vlSelf->sdspi__DOT__lowlevel__DOT__r_idle = 0U;
    } else if (vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter) {
        vlSelf->sdspi__DOT__lowlevel__DOT__r_idle = 
            ((~ (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__byte_accepted)) 
             & (((0xbU == (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state)) 
                 | (1U == (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state))) 
                | (0U == (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state))));
    }
    vlSelf->o_wb_data = ((2U & (IData)(vlSelf->sdspi__DOT__pipe_addr))
                          ? ((1U & (IData)(vlSelf->sdspi__DOT__pipe_addr))
                              ? vlSelf->sdspi__DOT__fifo_b_word
                              : vlSelf->sdspi__DOT__fifo_a_word)
                          : ((1U & (IData)(vlSelf->sdspi__DOT__pipe_addr))
                              ? vlSelf->sdspi__DOT__r_data_reg
                              : (((IData)(vlSelf->sdspi__DOT__r_watchdog_err) 
                                  << 0x15U) | (((IData)(vlSelf->i_sd_reset) 
                                                << 0x14U) 
                                               | ((0x80000U 
                                                   & ((~ (IData)(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_present)) 
                                                      << 0x13U)) 
                                                  | (((IData)(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_removed) 
                                                      << 0x12U) 
                                                     | (((IData)(vlSelf->sdspi__DOT__r_cmd_err) 
                                                         << 0xfU) 
                                                        | (((IData)(vlSelf->sdspi__DOT__r_cmd_busy) 
                                                            << 0xeU) 
                                                           | (((IData)(vlSelf->sdspi__DOT__r_fifo_id) 
                                                               << 0xcU) 
                                                              | (((IData)(vlSelf->sdspi__DOT__r_use_fifo) 
                                                                  << 0xbU) 
                                                                 | (((IData)(vlSelf->sdspi__DOT__write_to_card) 
                                                                     << 0xaU) 
                                                                    | (IData)(vlSelf->sdspi__DOT__r_last_r_one))))))))))));
    vlSelf->o_debug = (((IData)(vlSelf->sdspi__DOT__dbg_trigger) 
                        << 0x1fU) | (((IData)(vlSelf->sdspi__DOT__ll_cmd_stb) 
                                      << 0x1eU) | (
                                                   (((IData)(vlSelf->sdspi__DOT__ll_cmd_stb) 
                                                     & (IData)(vlSelf->sdspi__DOT__ll_idle)) 
                                                    << 0x1dU) 
                                                   | (((IData)(vlSelf->sdspi__DOT__ll_out_stb) 
                                                       << 0x1cU) 
                                                      | (((IData)(vlSelf->o_cs_n) 
                                                          << 0x1bU) 
                                                         | (((IData)(vlSelf->o_sck) 
                                                             << 0x1aU) 
                                                            | (((IData)(vlSelf->o_mosi) 
                                                                << 0x19U) 
                                                               | (((IData)(vlSelf->i_miso) 
                                                                   << 0x18U) 
                                                                  | (((IData)(vlSelf->i_sd_reset) 
                                                                      << 0x14U) 
                                                                     | (((IData)(vlSelf->sdspi__DOT__r_cmd_busy) 
                                                                         << 0x10U) 
                                                                        | (((IData)(vlSelf->sdspi__DOT__ll_cmd_dat) 
                                                                            << 8U) 
                                                                           | (IData)(vlSelf->sdspi__DOT__ll_out_dat))))))))))));
    if (vlSelf->sdspi__DOT__cmd_busy) {
        if (vlSelf->sdspi__DOT__ll_advance) {
            __Vdly__sdspi__DOT__spicmdi__DOT__crc_valid_sreg 
                = (0x1fU & VL_SHIFTR_III(5,5,32, (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__crc_valid_sreg), 1U));
        }
        if (vlSelf->sdspi__DOT__spicmdi__DOT__crc_busy) {
            __Vdly__sdspi__DOT__spicmdi__DOT__crc_bit_counter 
                = (0x1fU & ((IData)(vlSelf->sdspi__DOT__spicmdi__DOT__crc_bit_counter) 
                            - (IData)(1U)));
            __Vdly__sdspi__DOT__spicmdi__DOT__crc_busy 
                = (1U < (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__crc_bit_counter));
        }
    } else {
        __Vdly__sdspi__DOT__spicmdi__DOT__crc_valid_sreg = 0x10U;
        __Vdly__sdspi__DOT__spicmdi__DOT__crc_bit_counter = 0x14U;
        __Vdly__sdspi__DOT__spicmdi__DOT__crc_busy 
            = vlSelf->sdspi__DOT____Vcellinp__spicmdi____pinNumber3;
    }
    vlSelf->sdspi__DOT__spicmdi__DOT__crc_bit_counter 
        = __Vdly__sdspi__DOT__spicmdi__DOT__crc_bit_counter;
    if ((1U & ((IData)(vlSelf->sdspi__DOT__w_reset) 
               | (~ (IData)(vlSelf->sdspi__DOT__cmd_busy))))) {
        __Vdly__sdspi__DOT__cmd_sent = 0U;
        __Vdly__sdspi__DOT__spicmdi__DOT__almost_sent = 0U;
    } else if (((~ (IData)(vlSelf->sdspi__DOT__cmd_sent)) 
                & (IData)(vlSelf->sdspi__DOT__ll_advance))) {
        __Vdly__sdspi__DOT__cmd_sent = vlSelf->sdspi__DOT__spicmdi__DOT__almost_sent;
        __Vdly__sdspi__DOT__spicmdi__DOT__almost_sent 
            = (1U & (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__crc_valid_sreg));
    }
    vlSelf->sdspi__DOT__spicmdi__DOT__almost_sent = __Vdly__sdspi__DOT__spicmdi__DOT__almost_sent;
    if ((1U & ((IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2) 
               | (~ (IData)(vlSelf->sdspi__DOT__rx_busy))))) {
        __Vdly__sdspi__DOT__spirxdatai__DOT__crc_byte = 0U;
    } else if ((((IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7) 
                 & (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__lastaddr)) 
                & (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__lastdata))) {
        __Vdly__sdspi__DOT__spirxdatai__DOT__crc_byte 
            = (3U & ((IData)(1U) + (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_byte)));
    }
    if (vlSelf->sdspi__DOT__rx_busy) {
        if ((1U & (~ (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__lastdata)))) {
            __Vdly__sdspi__DOT__spirxdatai__DOT__lastdata 
                = ((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__lastaddr) 
                   & (7U == (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__fill)));
        }
        vlSelf->sdspi__DOT__spirxdatai__DOT__lastdata 
            = __Vdly__sdspi__DOT__spirxdatai__DOT__lastdata;
        vlSelf->sdspi__DOT__spicmdi__DOT__crc_valid_sreg 
            = __Vdly__sdspi__DOT__spicmdi__DOT__crc_valid_sreg;
        vlSelf->sdspi__DOT__lowlevel__DOT__r_clk_counter 
            = __Vdly__sdspi__DOT__lowlevel__DOT__r_clk_counter;
        vlSelf->sdspi__DOT__spirxdatai__DOT__fill = __Vdly__sdspi__DOT__spirxdatai__DOT__fill;
        if (((IData)(vlSelf->sdspi__DOT__spi_write_to_fifo) 
             & (~ (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__lastaddr)))) {
            __Vdly__sdspi__DOT__spi_write_addr = (0xffU 
                                                  & ((IData)(1U) 
                                                     + (IData)(vlSelf->sdspi__DOT__spi_write_addr)));
            __Vdly__sdspi__DOT__spirxdatai__DOT__lastaddr 
                = ((0U == (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__r_lgblksz_m3)) 
                   || (1U & ((1U == (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__r_lgblksz_m3))
                              ? ((IData)(vlSelf->sdspi__DOT__spi_write_addr) 
                                 >> 1U) : ((2U == (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__r_lgblksz_m3))
                                            ? (3U == 
                                               (3U 
                                                & ((IData)(vlSelf->sdspi__DOT__spi_write_addr) 
                                                   >> 1U)))
                                            : ((3U 
                                                == (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__r_lgblksz_m3))
                                                ? (7U 
                                                   == 
                                                   (7U 
                                                    & ((IData)(vlSelf->sdspi__DOT__spi_write_addr) 
                                                       >> 1U)))
                                                : (
                                                   (4U 
                                                    == (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__r_lgblksz_m3))
                                                    ? 
                                                   (0xfU 
                                                    == 
                                                    (0xfU 
                                                     & ((IData)(vlSelf->sdspi__DOT__spi_write_addr) 
                                                        >> 1U)))
                                                    : 
                                                   ((5U 
                                                     == (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__r_lgblksz_m3))
                                                     ? 
                                                    (0x1fU 
                                                     == 
                                                     (0x1fU 
                                                      & ((IData)(vlSelf->sdspi__DOT__spi_write_addr) 
                                                         >> 1U)))
                                                     : 
                                                    (0x3fU 
                                                     == 
                                                     (0x3fU 
                                                      & ((IData)(vlSelf->sdspi__DOT__spi_write_addr) 
                                                         >> 1U))))))))));
        }
    } else {
        __Vdly__sdspi__DOT__spirxdatai__DOT__lastdata = 0U;
        vlSelf->sdspi__DOT__spirxdatai__DOT__lastdata 
            = __Vdly__sdspi__DOT__spirxdatai__DOT__lastdata;
        vlSelf->sdspi__DOT__spicmdi__DOT__crc_valid_sreg 
            = __Vdly__sdspi__DOT__spicmdi__DOT__crc_valid_sreg;
        vlSelf->sdspi__DOT__lowlevel__DOT__r_clk_counter 
            = __Vdly__sdspi__DOT__lowlevel__DOT__r_clk_counter;
        vlSelf->sdspi__DOT__spirxdatai__DOT__fill = __Vdly__sdspi__DOT__spirxdatai__DOT__fill;
        __Vdly__sdspi__DOT__spi_write_addr = ((IData)(vlSelf->sdspi__DOT__r_fifo_id) 
                                              << 7U);
        __Vdly__sdspi__DOT__spirxdatai__DOT__lastaddr 
            = (4U > (IData)(vlSelf->sdspi__DOT__r_lgblklen));
    }
    if ((1U & (~ (IData)(vlSelf->sdspi__DOT__rx_busy)))) {
        vlSelf->sdspi__DOT__spirxdatai__DOT__r_lgblksz_m3 
            = (7U & ((IData)(vlSelf->sdspi__DOT__r_lgblklen) 
                     - (IData)(3U)));
    }
    vlSelf->sdspi__DOT__spi_read_data = ((0x80U & (IData)(vlSelf->sdspi__DOT__spi_read_addr))
                                          ? vlSelf->sdspi__DOT__fifo_b_word
                                          : vlSelf->sdspi__DOT__fifo_a_word);
    if ((((IData)(vlSelf->sdspi__DOT__r_use_fifo) & (IData)(vlSelf->sdspi__DOT__rx_busy)) 
         & ((IData)(vlSelf->sdspi__DOT__spi_write_addr) 
            >> 7U))) {
        vlSelf->sdspi__DOT__write_fifo_b_addr = (0x7fU 
                                                 & (IData)(vlSelf->sdspi__DOT__spi_write_addr));
        vlSelf->sdspi__DOT__write_fifo_b = vlSelf->sdspi__DOT__spi_write_to_fifo;
        vlSelf->sdspi__DOT__write_fifo_b_data = vlSelf->sdspi__DOT__spi_write_data;
    } else {
        vlSelf->sdspi__DOT__write_fifo_b_addr = (0x7fU 
                                                 & (IData)(vlSelf->sdspi__DOT__fifo_wb_addr));
        vlSelf->sdspi__DOT__write_fifo_b = (((IData)(vlSelf->sdspi__DOT__write_stb) 
                                             & (3U 
                                                == (IData)(vlSelf->i_wb_addr))) 
                                            & (0xfU 
                                               == (IData)(vlSelf->i_wb_sel)));
        vlSelf->sdspi__DOT__write_fifo_b_data = vlSelf->i_wb_data;
    }
    if ((((IData)(vlSelf->sdspi__DOT__r_use_fifo) & (IData)(vlSelf->sdspi__DOT__rx_busy)) 
         & (~ ((IData)(vlSelf->sdspi__DOT__spi_write_addr) 
               >> 7U)))) {
        vlSelf->sdspi__DOT__write_fifo_a_addr = (0x7fU 
                                                 & (IData)(vlSelf->sdspi__DOT__spi_write_addr));
        vlSelf->sdspi__DOT__write_fifo_a = vlSelf->sdspi__DOT__spi_write_to_fifo;
        vlSelf->sdspi__DOT__write_fifo_a_data = vlSelf->sdspi__DOT__spi_write_data;
    } else {
        vlSelf->sdspi__DOT__write_fifo_a_addr = (0x7fU 
                                                 & (IData)(vlSelf->sdspi__DOT__fifo_wb_addr));
        vlSelf->sdspi__DOT__write_fifo_a = (((IData)(vlSelf->sdspi__DOT__write_stb) 
                                             & (2U 
                                                == (IData)(vlSelf->i_wb_addr))) 
                                            & (0xfU 
                                               == (IData)(vlSelf->i_wb_sel)));
        vlSelf->sdspi__DOT__write_fifo_a_data = vlSelf->i_wb_data;
    }
    if (vlSelf->i_sd_reset) {
        __Vdly__o_sck = 1U;
        vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_removed = 1U;
        __Vdly__sdspi__DOT__lowlevel__DOT__r_byte = 0xffU;
        vlSelf->o_mosi = 1U;
    } else {
        if (vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter) {
            if (((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__restart_counter) 
                 & (((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold) 
                     | ((IData)(vlSelf->sdspi__DOT__r_cmd_busy) 
                        & (~ (IData)(vlSelf->o_cs_n)))) 
                    | (~ (IData)(vlSelf->o_sck))))) {
                __Vdly__o_sck = (1U & ((2U == (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state)) 
                                       | (~ (IData)(vlSelf->o_sck))));
            }
            if (vlSelf->sdspi__DOT__lowlevel__DOT__byte_accepted) {
                vlSelf->o_mosi = 1U;
                if (vlSelf->o_cs_n) {
                    __Vdly__sdspi__DOT__lowlevel__DOT__r_byte 
                        = vlSelf->sdspi__DOT__ll_cmd_dat;
                } else {
                    __Vdly__sdspi__DOT__lowlevel__DOT__r_byte 
                        = (1U | (0xfeU & ((IData)(vlSelf->sdspi__DOT__ll_cmd_dat) 
                                          << 1U)));
                    vlSelf->o_mosi = (1U & ((IData)(vlSelf->sdspi__DOT__ll_cmd_dat) 
                                            >> 7U));
                }
            } else if (vlSelf->o_sck) {
                __Vdly__sdspi__DOT__lowlevel__DOT__r_byte 
                    = (1U | (0xfeU & ((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_byte) 
                                      << 1U)));
                if (((3U <= (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state)) 
                     & (0xbU > (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state)))) {
                    vlSelf->o_mosi = (1U & ((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_byte) 
                                            >> 7U));
                } else if ((1U & (~ (IData)(vlSelf->sdspi__DOT__r_cmd_busy)))) {
                    vlSelf->o_mosi = 1U;
                }
            }
        }
        if (vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_present) {
            if (((IData)(vlSelf->sdspi__DOT__wb_cmd_stb) 
                 & (vlSelf->i_wb_data >> 0x12U))) {
                vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_removed = 0U;
            }
        } else {
            vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_removed = 1U;
        }
    }
    if (vlSelf->sdspi__DOT__ll_advance) {
        vlSelf->sdspi__DOT__ll_cmd_dat = (0xffU & ((IData)(vlSelf->sdspi__DOT__cmd_busy)
                                                    ? 
                                                   ((IData)(vlSelf->sdspi__DOT__cmd_busy)
                                                     ? (IData)(
                                                               (vlSelf->sdspi__DOT__spicmdi__DOT__shift_data 
                                                                >> 0x20U))
                                                     : 0xffU)
                                                    : 
                                                   ((IData)(vlSelf->sdspi__DOT__tx_stb)
                                                     ? (IData)(
                                                               (vlSelf->sdspi__DOT__spitxdatai__DOT__gearbox 
                                                                >> 0x20U))
                                                     : 0xffU)));
    }
    if ((1U & ((IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2) 
               | (~ (IData)(vlSelf->sdspi__DOT__tx_busy))))) {
        __Vdly__sdspi__DOT__spitxdatai__DOT__rdvalid = 0U;
        __Vdly__sdspi__DOT__spitxdatai__DOT__crc_stb = 0U;
        __Vdly__sdspi__DOT__spi_read_from_fifo = 0U;
        vlSelf->sdspi__DOT__spitxdatai__DOT__data_sent = 0U;
        vlSelf->sdspi__DOT__spitxdatai__DOT__all_mem_read = 0U;
        vlSelf->sdspi__DOT__spitxdatai__DOT__all_idle = 0U;
        __Vdly__sdspi__DOT__spitxdatai__DOT__received_token = 0U;
        vlSelf->sdspi__DOT__tx_valid = 0U;
        vlSelf->sdspi__DOT__tx_stb = 0U;
        vlSelf->sdspi__DOT__spitxdatai__DOT__crc_flag = 0U;
    } else {
        __Vdly__sdspi__DOT__spitxdatai__DOT__rdvalid 
            = ((2U & ((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid) 
                      << 1U)) | (IData)(vlSelf->sdspi__DOT__spi_read_from_fifo));
        if ((1U & ((~ ((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__fill) 
                       >> 3U)) | ((~ ((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__fill) 
                                      >> 2U)) & ((~ (IData)(vlSelf->sdspi__DOT__tx_stb)) 
                                                 | (~ (IData)(vlSelf->sdspi__DOT____Vcellinp__spitxdatai____pinNumber10))))))) {
            __Vdly__sdspi__DOT__spitxdatai__DOT__crc_stb = 0U;
            __Vdly__sdspi__DOT__spi_read_from_fifo = 0U;
            if ((((~ (IData)(vlSelf->sdspi__DOT__spi_read_from_fifo)) 
                  & (0U == (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid))) 
                 & (~ (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_flag)))) {
                if (vlSelf->sdspi__DOT__spitxdatai__DOT__all_mem_read) {
                    __Vdly__sdspi__DOT__spitxdatai__DOT__crc_stb 
                        = (1U & ((~ (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_flag)) 
                                 & (~ (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_stb))));
                } else {
                    __Vdly__sdspi__DOT__spi_read_from_fifo = 1U;
                }
            }
        } else {
            __Vdly__sdspi__DOT__spitxdatai__DOT__crc_stb = 0U;
            __Vdly__sdspi__DOT__spi_read_from_fifo = 0U;
        }
        if (((((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_flag) 
               & (~ ((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__fill) 
                     >> 3U))) & (IData)(vlSelf->sdspi__DOT__tx_stb)) 
             & (~ (IData)(vlSelf->sdspi__DOT____Vcellinp__spitxdatai____pinNumber10)))) {
            vlSelf->sdspi__DOT__spitxdatai__DOT__data_sent = 1U;
        }
        if (((IData)(vlSelf->sdspi__DOT__spi_read_from_fifo) 
             & (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__lastaddr))) {
            vlSelf->sdspi__DOT__spitxdatai__DOT__all_mem_read = 1U;
        }
        if ((((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__received_token) 
              & (IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7)) 
             & (0xffU == (IData)(vlSelf->sdspi__DOT__ll_out_dat)))) {
            vlSelf->sdspi__DOT__spitxdatai__DOT__all_idle = 1U;
        }
        if (((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__token) 
             & (~ (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__received_token)))) {
            __Vdly__sdspi__DOT__spitxdatai__DOT__received_token = 1U;
            vlSelf->sdspi__DOT__tx_valid = 1U;
        } else {
            vlSelf->sdspi__DOT__tx_valid = 0U;
        }
        if ((2U & (IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid))) {
            vlSelf->sdspi__DOT__tx_stb = 1U;
        } else if (((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_flag) 
                    & (~ ((IData)(vlSelf->sdspi__DOT__spitxdatai__DOT__fill) 
                          >> 4U)))) {
            vlSelf->sdspi__DOT__tx_stb = 0U;
        }
        if (vlSelf->sdspi__DOT__spitxdatai__DOT__crc_stb) {
            vlSelf->sdspi__DOT__spitxdatai__DOT__crc_flag = 1U;
        }
    }
    if (vlSelf->sdspi__DOT__r_cmd_busy) {
        if (vlSelf->sdspi__DOT__cmd_valid) {
            vlSelf->sdspi__DOT__r_last_r_one = (0xffU 
                                                & (IData)(
                                                          (vlSelf->sdspi__DOT__cmd_response 
                                                           >> 0x20U)));
        }
    }
    if (vlSelf->i_sd_reset) {
        __Vdly__sdspi__DOT__r_cmd_busy = 0U;
        vlSelf->sdspi__DOT__r_use_fifo = 0U;
        vlSelf->sdspi__DOT__tx_start = 0U;
        vlSelf->sdspi__DOT__rx_start = 0U;
    } else if (vlSelf->sdspi__DOT__r_cmd_busy) {
        if ((((((IData)(vlSelf->sdspi__DOT__ll_idle) 
                & (~ (IData)(vlSelf->sdspi__DOT__ll_cmd_stb))) 
               & (~ (IData)(vlSelf->sdspi__DOT__cmd_busy))) 
              & (~ (IData)(vlSelf->sdspi__DOT__rx_busy))) 
             & (~ (IData)(vlSelf->sdspi__DOT__tx_busy)))) {
            __Vdly__sdspi__DOT__r_cmd_busy = 0U;
            vlSelf->sdspi__DOT__r_use_fifo = 0U;
        }
        if ((((IData)(vlSelf->sdspi__DOT__r_cmd_err) 
              | (IData)(vlSelf->sdspi__DOT__tx_busy)) 
             | (IData)(vlSelf->sdspi__DOT__rx_busy))) {
            vlSelf->sdspi__DOT__tx_start = 0U;
            vlSelf->sdspi__DOT__rx_start = 0U;
        }
        if (vlSelf->sdspi__DOT__r_watchdog_err) {
            vlSelf->sdspi__DOT__r_use_fifo = 0U;
            vlSelf->sdspi__DOT__tx_start = 0U;
            vlSelf->sdspi__DOT__rx_start = 0U;
        }
    } else {
        if (((IData)(vlSelf->sdspi__DOT__wb_cmd_stb) 
             & (0x40U == (0xc0U & vlSelf->i_wb_data)))) {
            __Vdly__sdspi__DOT__r_cmd_busy = 1U;
            vlSelf->sdspi__DOT__tx_start = 0U;
            vlSelf->sdspi__DOT__rx_start = 0U;
            vlSelf->sdspi__DOT__write_to_card = (1U 
                                                 & (vlSelf->i_wb_data 
                                                    >> 0xaU));
            vlSelf->sdspi__DOT__r_use_fifo = (1U & 
                                              (vlSelf->i_wb_data 
                                               >> 0xbU));
            if ((0x800U & vlSelf->i_wb_data)) {
                vlSelf->sdspi__DOT__tx_start = (1U 
                                                & (vlSelf->i_wb_data 
                                                   >> 0xaU));
                vlSelf->sdspi__DOT__rx_start = (1U 
                                                & (~ 
                                                   (vlSelf->i_wb_data 
                                                    >> 0xaU)));
            }
        } else {
            __Vdly__sdspi__DOT__r_cmd_busy = 0U;
            vlSelf->sdspi__DOT__tx_start = 0U;
            vlSelf->sdspi__DOT__rx_start = 0U;
        }
        if (vlSelf->sdspi__DOT__r_watchdog_err) {
            vlSelf->sdspi__DOT__r_use_fifo = 0U;
            vlSelf->sdspi__DOT__tx_start = 0U;
            vlSelf->sdspi__DOT__rx_start = 0U;
        }
    }
    if (vlSelf->sdspi__DOT__r_cmd_busy) {
        if ((0U == vlSelf->sdspi__DOT__r_watchdog)) {
            vlSelf->sdspi__DOT__r_watchdog_err = 1U;
        }
    } else {
        vlSelf->sdspi__DOT__r_watchdog_err = 0U;
    }
    if (((IData)(vlSelf->sdspi__DOT__wb_cmd_stb) & 
         (0xc0U == (0xc0U & vlSelf->i_wb_data)))) {
        if ((0U != (0xffU & vlSelf->sdspi__DOT__r_data_reg))) {
            vlSelf->sdspi__DOT__r_sdspi_clk = (0xffU 
                                               & vlSelf->sdspi__DOT__r_data_reg);
        }
        if (((3U <= (0xfU & (vlSelf->sdspi__DOT__r_data_reg 
                             >> 0x10U))) & (9U >= (0xfU 
                                                   & (vlSelf->sdspi__DOT__r_data_reg 
                                                      >> 0x10U))))) {
            vlSelf->sdspi__DOT__r_lgblklen = (0xfU 
                                              & (vlSelf->sdspi__DOT__r_data_reg 
                                                 >> 0x10U));
        }
    }
    if ((1U & (~ (IData)(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_present)))) {
        vlSelf->sdspi__DOT__r_sdspi_clk = 0x7cU;
    }
    if ((1U & ((IData)(vlSelf->i_sd_reset) | (~ ((IData)(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present) 
                                                 >> 2U))))) {
        __Vdly__sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter = 0U;
        vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_present = 0U;
    } else {
        if ((1U & (~ (IData)((0x3ffU == (IData)(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter)))))) {
            __Vdly__sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter 
                = (0x3ffU & ((IData)(1U) + (IData)(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter)));
        }
        if ((0x3ffU == (IData)(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter))) {
            vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_present = 1U;
        }
    }
    if (vlSelf->sdspi__DOT__spitxdatai__DOT__token) {
        vlSelf->sdspi__DOT__tx_response = vlSelf->sdspi__DOT__ll_out_dat;
    }
    vlSelf->sdspi__DOT__dly_stb = ((IData)(vlSelf->i_wb_cyc) 
                                   & (IData)(vlSelf->sdspi__DOT__wb_stb));
    vlSelf->sdspi__DOT__last_busy = vlSelf->sdspi__DOT__r_cmd_busy;
    vlSelf->sdspi__DOT__pipe_addr = vlSelf->i_wb_addr;
    if (((~ (IData)(vlSelf->sdspi__DOT__r_cmd_busy)) 
         & (IData)(vlSelf->sdspi__DOT__wb_cmd_stb))) {
        vlSelf->sdspi__DOT__r_fifo_id = (1U & (vlSelf->i_wb_data 
                                               >> 0xcU));
    }
    vlSelf->sdspi__DOT__dbg_trigger = ((IData)(vlSelf->sdspi__DOT__cmd_valid) 
                                       & (0U != (0x3fU 
                                                 & (IData)(
                                                           (vlSelf->sdspi__DOT__cmd_response 
                                                            >> 0x21U)))));
    if ((1U & ((IData)(vlSelf->sdspi__DOT__w_reset) 
               | (~ (IData)(vlSelf->sdspi__DOT__cmd_busy))))) {
        vlSelf->sdspi__DOT__cmd_valid = 0U;
    } else if (((IData)(vlSelf->sdspi__DOT__spicmdi__DOT__rxvalid) 
                & (~ (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__rx_check_busy)))) {
        vlSelf->sdspi__DOT__cmd_valid = 1U;
    }
    if (vlSelf->sdspi__DOT__cmd_busy) {
        if (vlSelf->sdspi__DOT__spicmdi__DOT__crc_busy) {
            vlSelf->sdspi__DOT__spicmdi__DOT__crc_shift_reg 
                = (0xffffffffffULL & VL_SHIFTL_QQI(40,40,32, vlSelf->sdspi__DOT__spicmdi__DOT__crc_shift_reg, 2U));
            vlSelf->sdspi__DOT__spicmdi__DOT__crc_byte 
                = (1U | ((IData)(vlSelf->sdspi__DOT__spicmdi__DOT__next_crc_byte) 
                         << 1U));
        }
        if (vlSelf->sdspi__DOT__ll_out_stb) {
            __Vdly__sdspi__DOT__cmd_response = ((IData)(vlSelf->sdspi__DOT__spicmdi__DOT__rx_r1_byte)
                                                 ? 
                                                ((0xff00000000ULL 
                                                  & __Vdly__sdspi__DOT__cmd_response) 
                                                 | (IData)((IData)(
                                                                   (((IData)(vlSelf->sdspi__DOT__cmd_response) 
                                                                     << 8U) 
                                                                    | (IData)(vlSelf->sdspi__DOT__ll_out_dat)))))
                                                 : 
                                                ((0xffffffffULL 
                                                  & __Vdly__sdspi__DOT__cmd_response) 
                                                 | ((QData)((IData)(vlSelf->sdspi__DOT__ll_out_dat)) 
                                                    << 0x20U)));
        }
        if (((IData)(vlSelf->sdspi__DOT__cmd_sent) 
             & (IData)(vlSelf->sdspi__DOT__ll_out_stb))) {
            if ((1U & (~ (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__rx_r1_byte)))) {
                __Vdly__sdspi__DOT__spicmdi__DOT__rx_r1_byte 
                    = (1U & (~ ((IData)(vlSelf->sdspi__DOT__ll_out_dat) 
                                >> 7U)));
            }
            if ((1U & (((IData)(vlSelf->sdspi__DOT__spicmdi__DOT__rx_r1_byte) 
                        | (~ ((IData)(vlSelf->sdspi__DOT__ll_out_dat) 
                              >> 7U))) & (~ (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__rxvalid))))) {
                __Vdly__sdspi__DOT__spicmdi__DOT__rx_counter 
                    = (7U & ((IData)(vlSelf->sdspi__DOT__spicmdi__DOT__rx_counter) 
                             - (IData)(1U)));
                vlSelf->sdspi__DOT__spicmdi__DOT__rxvalid 
                    = (1U >= (IData)(vlSelf->sdspi__DOT__spicmdi__DOT__rx_counter));
            }
            if (((IData)(vlSelf->sdspi__DOT__spicmdi__DOT__rx_r1_byte) 
                 & (0U != (IData)(vlSelf->sdspi__DOT__ll_out_dat)))) {
                vlSelf->sdspi__DOT__spicmdi__DOT__rx_check_busy = 0U;
            }
        }
    } else {
        vlSelf->sdspi__DOT__spicmdi__DOT__crc_shift_reg 
            = (0x4000000000ULL | (((QData)((IData)(
                                                   (0x3fU 
                                                    & vlSelf->i_wb_data))) 
                                   << 0x20U) | (QData)((IData)(vlSelf->sdspi__DOT__r_data_reg))));
        __Vdly__sdspi__DOT__cmd_response = 0xffffffffffULL;
        vlSelf->sdspi__DOT__spicmdi__DOT__crc_byte = 1U;
        __Vdly__sdspi__DOT__spicmdi__DOT__rx_r1_byte = 0U;
        __Vdly__sdspi__DOT__spicmdi__DOT__rx_counter 
            = ((0x200U & vlSelf->i_wb_data) ? 5U : 1U);
        vlSelf->sdspi__DOT__spicmdi__DOT__rx_check_busy 
            = (1U == (3U & (vlSelf->i_wb_data >> 8U)));
        vlSelf->sdspi__DOT__spicmdi__DOT__rxvalid = 0U;
    }
    vlSelf->sdspi__DOT__spicmdi__DOT__crc_busy = __Vdly__sdspi__DOT__spicmdi__DOT__crc_busy;
    vlSelf->sdspi__DOT__spitxdatai__DOT__crc_active 
        = __Vdly__sdspi__DOT__spitxdatai__DOT__crc_active;
    vlSelf->sdspi__DOT__spitxdatai__DOT__lastaddr = __Vdly__sdspi__DOT__spitxdatai__DOT__lastaddr;
    vlSelf->sdspi__DOT__spi_read_from_fifo = __Vdly__sdspi__DOT__spi_read_from_fifo;
    vlSelf->sdspi__DOT__spi_write_addr = __Vdly__sdspi__DOT__spi_write_addr;
    vlSelf->sdspi__DOT__spitxdatai__DOT__received_token 
        = __Vdly__sdspi__DOT__spitxdatai__DOT__received_token;
    vlSelf->sdspi__DOT__cmd_response = __Vdly__sdspi__DOT__cmd_response;
    vlSelf->sdspi__DOT__lowlevel__DOT__r_byte = __Vdly__sdspi__DOT__lowlevel__DOT__r_byte;
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
    vlSelf->sdspi__DOT__fifo_b_word = vlSelf->sdspi__DOT__fifo_b
        [(0x7fU & (((IData)(vlSelf->sdspi__DOT____VdfgTmp_h302b62a3__0) 
                    & ((IData)(vlSelf->sdspi__DOT__spi_read_addr) 
                       >> 7U)) ? (IData)(vlSelf->sdspi__DOT__spi_read_addr)
                    : (IData)(vlSelf->sdspi__DOT__fifo_wb_addr)))];
    vlSelf->sdspi__DOT__fifo_a_word = vlSelf->sdspi__DOT__fifo_a
        [(0x7fU & (((~ ((IData)(vlSelf->sdspi__DOT__spi_read_addr) 
                        >> 7U)) & (IData)(vlSelf->sdspi__DOT____VdfgTmp_h302b62a3__0))
                    ? (IData)(vlSelf->sdspi__DOT__spi_read_addr)
                    : (IData)(vlSelf->sdspi__DOT__fifo_wb_addr)))];
    if (((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__received_token) 
         & (~ (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__all_mem_written)))) {
        vlSelf->sdspi__DOT__spi_write_data = ((vlSelf->sdspi__DOT__spirxdatai__DOT__gearbox 
                                               << 8U) 
                                              | (IData)(vlSelf->sdspi__DOT__ll_out_dat));
    }
    if ((1U & ((IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2) 
               | (~ (IData)(vlSelf->sdspi__DOT__rx_busy))))) {
        vlSelf->sdspi__DOT__rx_valid = 0U;
        vlSelf->sdspi__DOT__rx_response = 0U;
        vlSelf->sdspi__DOT__spirxdatai__DOT__crc_err = 0U;
    } else {
        if (((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__error_token) 
             | (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__done))) {
            vlSelf->sdspi__DOT__rx_valid = 1U;
        }
        if (vlSelf->sdspi__DOT__spirxdatai__DOT__error_token) {
            vlSelf->sdspi__DOT__rx_response = vlSelf->sdspi__DOT__ll_out_dat;
        } else if (vlSelf->sdspi__DOT__spirxdatai__DOT__done) {
            vlSelf->sdspi__DOT__rx_response = (((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_err) 
                                                | ((0xffU 
                                                    & (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_data)) 
                                                   != (IData)(vlSelf->sdspi__DOT__ll_out_dat)))
                                                ? 0x10U
                                                : 0U);
        }
        if (((IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7) 
             & (1U == (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_byte)))) {
            vlSelf->sdspi__DOT__spirxdatai__DOT__crc_err 
                = ((0xffU & ((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_data) 
                             >> 8U)) != (IData)(vlSelf->sdspi__DOT__ll_out_dat));
        }
    }
    if (vlSelf->sdspi__DOT__rx_busy) {
        if (vlSelf->sdspi__DOT__spirxdatai__DOT__crc_active) {
            vlSelf->sdspi__DOT__spirxdatai__DOT__crc_data 
                = vlSelf->sdspi__DOT__spirxdatai__DOT__next_crc_data;
        }
    } else {
        vlSelf->sdspi__DOT__spirxdatai__DOT__crc_data = 0U;
    }
    if ((1U & ((IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2) 
               | (~ (IData)(vlSelf->sdspi__DOT__rx_busy))))) {
        vlSelf->sdspi__DOT__spirxdatai__DOT__all_mem_written = 0U;
        vlSelf->sdspi__DOT__spirxdatai__DOT__received_token = 0U;
    } else {
        if (((IData)(vlSelf->sdspi__DOT__spi_write_to_fifo) 
             & (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__lastaddr))) {
            vlSelf->sdspi__DOT__spirxdatai__DOT__all_mem_written = 1U;
        }
        if (((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__error_token) 
             | (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__start_token))) {
            vlSelf->sdspi__DOT__spirxdatai__DOT__received_token = 1U;
        }
    }
    vlSelf->sdspi__DOT__r_data_reg = __Vdly__sdspi__DOT__r_data_reg;
    if (__Vdlyvset__sdspi__DOT__fifo_b__v0) {
        vlSelf->sdspi__DOT__fifo_b[__Vdlyvdim0__sdspi__DOT__fifo_b__v0] 
            = __Vdlyvval__sdspi__DOT__fifo_b__v0;
    }
    if (__Vdlyvset__sdspi__DOT__fifo_a__v0) {
        vlSelf->sdspi__DOT__fifo_a[__Vdlyvdim0__sdspi__DOT__fifo_a__v0] 
            = __Vdlyvval__sdspi__DOT__fifo_a__v0;
    }
    vlSelf->sdspi__DOT__spi_read_addr = __Vdly__sdspi__DOT__spi_read_addr;
    vlSelf->sdspi__DOT__fifo_wb_addr = __Vdly__sdspi__DOT__fifo_wb_addr;
    vlSelf->sdspi__DOT__spirxdatai__DOT__gearbox = __Vdly__sdspi__DOT__spirxdatai__DOT__gearbox;
    vlSelf->sdspi__DOT__r_cmd_err = __Vdly__sdspi__DOT__r_cmd_err;
    vlSelf->sdspi__DOT__ll_cmd_stb = __Vdly__sdspi__DOT__ll_cmd_stb;
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_byte = __Vdly__sdspi__DOT__spirxdatai__DOT__crc_byte;
    vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter 
        = __Vdly__sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter;
    vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present 
        = __Vdly__sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present;
    vlSelf->sdspi__DOT__spicmdi__DOT__shift_data = __Vdly__sdspi__DOT__spicmdi__DOT__shift_data;
    vlSelf->sdspi__DOT__spitxdatai__DOT__gearbox = __Vdly__sdspi__DOT__spitxdatai__DOT__gearbox;
    vlSelf->sdspi__DOT__spi_write_to_fifo = __Vdly__sdspi__DOT__spi_write_to_fifo;
    vlSelf->sdspi__DOT__spirxdatai__DOT__lastaddr = __Vdly__sdspi__DOT__spirxdatai__DOT__lastaddr;
    vlSelf->sdspi__DOT__r_watchdog = __Vdly__sdspi__DOT__r_watchdog;
    vlSelf->sdspi__DOT__spirxdatai__DOT__crc_active 
        = __Vdly__sdspi__DOT__spirxdatai__DOT__crc_active;
    vlSelf->sdspi__DOT__rx_busy = __Vdly__sdspi__DOT__rx_busy;
    vlSelf->sdspi__DOT__cmd_sent = __Vdly__sdspi__DOT__cmd_sent;
    vlSelf->sdspi__DOT__spicmdi__DOT__rx_r1_byte = __Vdly__sdspi__DOT__spicmdi__DOT__rx_r1_byte;
    vlSelf->sdspi__DOT__spicmdi__DOT__rx_counter = __Vdly__sdspi__DOT__spicmdi__DOT__rx_counter;
    vlSelf->sdspi__DOT__cmd_busy = __Vdly__sdspi__DOT__cmd_busy;
    vlSelf->sdspi__DOT__spitxdatai__DOT__fill = __Vdly__sdspi__DOT__spitxdatai__DOT__fill;
    vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid = __Vdly__sdspi__DOT__spitxdatai__DOT__rdvalid;
    vlSelf->sdspi__DOT__w_reset = ((IData)(vlSelf->i_sd_reset) 
                                   | (IData)(vlSelf->sdspi__DOT__r_watchdog_err));
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
    if ((((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter) 
          & (IData)(vlSelf->o_sck)) & (0xbU == (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state)))) {
        vlSelf->sdspi__DOT__ll_out_dat = vlSelf->sdspi__DOT__lowlevel__DOT__r_ireg;
    }
    vlSelf->sdspi__DOT__ll_out_stb = ((~ (((((IData)(vlSelf->i_sd_reset) 
                                             | (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold)) 
                                            | (~ (IData)(vlSelf->sdspi__DOT__r_cmd_busy))) 
                                           | (~ (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter))) 
                                          | (~ (IData)(vlSelf->o_sck)))) 
                                      & (0xbU <= (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state)));
    vlSelf->sdspi__DOT__lowlevel__DOT__r_ireg = __Vdly__sdspi__DOT__lowlevel__DOT__r_ireg;
    if (vlSelf->i_sd_reset) {
        vlSelf->o_cs_n = 1U;
        __Vdly__sdspi__DOT__lowlevel__DOT__r_state = 0U;
    } else if (vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter) {
        if (vlSelf->sdspi__DOT__r_cmd_busy) {
            if ((0U == (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state))) {
                if (vlSelf->sdspi__DOT__lowlevel__DOT__byte_accepted) {
                    vlSelf->o_cs_n = 0U;
                    __Vdly__sdspi__DOT__lowlevel__DOT__r_state = 3U;
                }
            } else if ((2U == (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state))) {
                __Vdly__sdspi__DOT__lowlevel__DOT__r_state = 3U;
            } else if (vlSelf->sdspi__DOT__lowlevel__DOT__byte_accepted) {
                __Vdly__sdspi__DOT__lowlevel__DOT__r_state = 4U;
            } else if (((IData)(vlSelf->o_sck) & (3U 
                                                  <= (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state)))) {
                __Vdly__sdspi__DOT__lowlevel__DOT__r_state 
                    = (0xfU & ((IData)(1U) + (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state)));
                if ((0xbU <= (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_state))) {
                    __Vdly__sdspi__DOT__lowlevel__DOT__r_state = 1U;
                }
            }
        } else {
            __Vdly__sdspi__DOT__lowlevel__DOT__r_state = 0U;
            vlSelf->o_cs_n = 1U;
        }
        if (vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold) {
            vlSelf->o_cs_n = 1U;
        }
    }
    vlSelf->sdspi__DOT__lowlevel__DOT__r_state = __Vdly__sdspi__DOT__lowlevel__DOT__r_state;
    vlSelf->sdspi__DOT__r_cmd_busy = __Vdly__sdspi__DOT__r_cmd_busy;
    vlSelf->sdspi__DOT__spitxdatai__DOT__crc_stb = __Vdly__sdspi__DOT__spitxdatai__DOT__crc_stb;
    vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2 
        = ((IData)(vlSelf->sdspi__DOT__w_reset) | (IData)(vlSelf->sdspi__DOT__r_cmd_err));
    vlSelf->sdspi__DOT__tx_busy = __Vdly__sdspi__DOT__tx_busy;
    vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7 
        = ((~ (IData)(vlSelf->sdspi__DOT__cmd_busy)) 
           & (IData)(vlSelf->sdspi__DOT__ll_out_stb));
    if (((IData)(vlSelf->i_sd_reset) | (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__r_powerup_hold))) {
        __Vdly__sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter = 0x4bU;
        vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold = 1U;
    } else if ((((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__startup_hold) 
                 & (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter)) 
                & (~ (IData)(vlSelf->o_sck)))) {
        if ((0U != (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter))) {
            __Vdly__sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter 
                = (0x7fU & ((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter) 
                            - (IData)(1U)));
        }
        vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold 
            = (0U < (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter));
    }
    if (vlSelf->i_sd_reset) {
        __Vdly__sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter = 0x3e8U;
        vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__r_powerup_hold = 1U;
    } else if (vlSelf->sdspi__DOT__lowlevel__DOT__powerup_hold) {
        if ((0U != (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter))) {
            __Vdly__sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter 
                = (0x3ffU & ((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter) 
                             - (IData)(1U)));
        }
        vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__r_powerup_hold 
            = (0U < (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter));
    }
    vlSelf->sdspi__DOT____VdfgTmp_h302b62a3__0 = ((IData)(vlSelf->sdspi__DOT__r_use_fifo) 
                                                  & (IData)(vlSelf->sdspi__DOT__tx_busy));
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
    vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter 
        = __Vdly__sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter;
    vlSelf->o_sck = __Vdly__o_sck;
    vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter 
        = __Vdly__sdspi__DOT__lowlevel__DOT__r_z_counter;
    vlSelf->sdspi__DOT__lowlevel__DOT__startup_hold 
        = vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold;
    vlSelf->sdspi__DOT__ll_idle = ((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_idle) 
                                   & (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter));
    vlSelf->sdspi__DOT__ll_advance = (1U & ((~ (IData)(vlSelf->sdspi__DOT__ll_cmd_stb)) 
                                            | (IData)(vlSelf->sdspi__DOT__ll_idle)));
    vlSelf->sdspi__DOT__lowlevel__DOT__byte_accepted 
        = ((IData)(vlSelf->sdspi__DOT__ll_cmd_stb) 
           & (IData)(vlSelf->sdspi__DOT__ll_idle));
    vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter 
        = __Vdly__sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter;
    vlSelf->sdspi__DOT____Vcellinp__spitxdatai____pinNumber10 
        = (1U & ((~ (IData)(vlSelf->sdspi__DOT__ll_advance)) 
                 | (IData)(vlSelf->sdspi__DOT__cmd_busy)));
    if (vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__r_powerup_hold) {
        vlSelf->sdspi__DOT__lowlevel__DOT__powerup_hold = 1U;
        vlSelf->sdspi__DOT__lowlevel__DOT__restart_counter 
            = (1U & (~ (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__r_powerup_hold)));
    } else {
        vlSelf->sdspi__DOT__lowlevel__DOT__powerup_hold = 0U;
        vlSelf->sdspi__DOT__lowlevel__DOT__restart_counter 
            = (1U & (((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold) 
                      | (~ (IData)(vlSelf->sdspi__DOT__r_cmd_busy))) 
                     | ((IData)(vlSelf->sdspi__DOT__lowlevel__DOT__byte_accepted) 
                        | (~ (IData)(vlSelf->sdspi__DOT__lowlevel__DOT__r_idle)))));
    }
}

VL_INLINE_OPT void Vsdspi___024root___nba_sequent__TOP__1(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___nba_sequent__TOP__1\n"); );
    // Body
    vlSelf->sdspi__DOT__wb_cmd_stb = ((~ (IData)(vlSelf->sdspi__DOT__r_cmd_busy)) 
                                      & ((IData)(vlSelf->sdspi__DOT__write_stb) 
                                         & ((0xfU == (IData)(vlSelf->i_wb_sel)) 
                                            & (0U == (IData)(vlSelf->i_wb_addr)))));
    vlSelf->sdspi__DOT____Vcellinp__spicmdi____pinNumber3 
        = ((IData)(vlSelf->sdspi__DOT__wb_cmd_stb) 
           & (0x40U == (0xc0U & vlSelf->i_wb_data)));
}

void Vsdspi___024root___eval_nba(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_nba\n"); );
    // Body
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsdspi___024root___nba_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
        Vsdspi___024root___nba_sequent__TOP__1(vlSelf);
    }
}

void Vsdspi___024root___eval_triggers__act(Vsdspi___024root* vlSelf);

bool Vsdspi___024root___eval_phase__act(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_phase__act\n"); );
    // Init
    VlTriggerVec<1> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vsdspi___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelf->__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
        vlSelf->__VnbaTriggered.thisOr(vlSelf->__VactTriggered);
        Vsdspi___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vsdspi___024root___eval_phase__nba(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_phase__nba\n"); );
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelf->__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vsdspi___024root___eval_nba(vlSelf);
        vlSelf->__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdspi___024root___dump_triggers__ico(Vsdspi___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdspi___024root___dump_triggers__nba(Vsdspi___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vsdspi___024root___dump_triggers__act(Vsdspi___024root* vlSelf);
#endif  // VL_DEBUG

void Vsdspi___024root___eval(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval\n"); );
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
            Vsdspi___024root___dump_triggers__ico(vlSelf);
#endif
            VL_FATAL_MT("sdspi.v", 44, "", "Input combinational region did not converge.");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        __VicoContinue = 0U;
        if (Vsdspi___024root___eval_phase__ico(vlSelf)) {
            __VicoContinue = 1U;
        }
        vlSelf->__VicoFirstIteration = 0U;
    }
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vsdspi___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("sdspi.v", 44, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                Vsdspi___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("sdspi.v", 44, "", "Active region did not converge.");
            }
            vlSelf->__VactIterCount = ((IData)(1U) 
                                       + vlSelf->__VactIterCount);
            vlSelf->__VactContinue = 0U;
            if (Vsdspi___024root___eval_phase__act(vlSelf)) {
                vlSelf->__VactContinue = 1U;
            }
        }
        if (Vsdspi___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vsdspi___024root___eval_debug_assertions(Vsdspi___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->i_clk & 0xfeU))) {
        Verilated::overWidthError("i_clk");}
    if (VL_UNLIKELY((vlSelf->i_sd_reset & 0xfeU))) {
        Verilated::overWidthError("i_sd_reset");}
    if (VL_UNLIKELY((vlSelf->i_wb_cyc & 0xfeU))) {
        Verilated::overWidthError("i_wb_cyc");}
    if (VL_UNLIKELY((vlSelf->i_wb_stb & 0xfeU))) {
        Verilated::overWidthError("i_wb_stb");}
    if (VL_UNLIKELY((vlSelf->i_wb_we & 0xfeU))) {
        Verilated::overWidthError("i_wb_we");}
    if (VL_UNLIKELY((vlSelf->i_wb_addr & 0xfcU))) {
        Verilated::overWidthError("i_wb_addr");}
    if (VL_UNLIKELY((vlSelf->i_wb_sel & 0xf0U))) {
        Verilated::overWidthError("i_wb_sel");}
    if (VL_UNLIKELY((vlSelf->i_miso & 0xfeU))) {
        Verilated::overWidthError("i_miso");}
    if (VL_UNLIKELY((vlSelf->i_card_detect & 0xfeU))) {
        Verilated::overWidthError("i_card_detect");}
    if (VL_UNLIKELY((vlSelf->i_bus_grant & 0xfeU))) {
        Verilated::overWidthError("i_bus_grant");}
}
#endif  // VL_DEBUG
