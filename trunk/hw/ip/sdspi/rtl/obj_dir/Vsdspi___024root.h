// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vsdspi.h for the primary calling header

#ifndef VERILATED_VSDSPI___024ROOT_H_
#define VERILATED_VSDSPI___024ROOT_H_  // guard

#include "verilated.h"


class Vsdspi__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vsdspi___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        VL_IN8(i_clk,0,0);
        VL_IN8(i_sd_reset,0,0);
        VL_IN8(i_wb_cyc,0,0);
        VL_IN8(i_wb_stb,0,0);
        VL_IN8(i_wb_we,0,0);
        VL_IN8(i_wb_addr,1,0);
        VL_IN8(i_wb_sel,3,0);
        VL_OUT8(o_wb_stall,0,0);
        VL_OUT8(o_wb_ack,0,0);
        VL_OUT8(o_cs_n,0,0);
        VL_OUT8(o_sck,0,0);
        VL_OUT8(o_mosi,0,0);
        VL_IN8(i_miso,0,0);
        VL_IN8(i_card_detect,0,0);
        VL_OUT8(o_int,0,0);
        VL_IN8(i_bus_grant,0,0);
        CData/*0:0*/ sdspi__DOT__r_cmd_busy;
        CData/*0:0*/ sdspi__DOT__dbg_trigger;
        CData/*0:0*/ sdspi__DOT__wb_stb;
        CData/*0:0*/ sdspi__DOT__write_stb;
        CData/*0:0*/ sdspi__DOT__wb_cmd_stb;
        CData/*1:0*/ sdspi__DOT__pipe_addr;
        CData/*0:0*/ sdspi__DOT__dly_stb;
        CData/*6:0*/ sdspi__DOT__fifo_wb_addr;
        CData/*6:0*/ sdspi__DOT__write_fifo_a_addr;
        CData/*6:0*/ sdspi__DOT__write_fifo_b_addr;
        CData/*7:0*/ sdspi__DOT__spi_read_addr;
        CData/*7:0*/ sdspi__DOT__spi_write_addr;
        CData/*0:0*/ sdspi__DOT__write_fifo_a;
        CData/*0:0*/ sdspi__DOT__write_fifo_b;
        CData/*0:0*/ sdspi__DOT__r_cmd_err;
        CData/*7:0*/ sdspi__DOT__r_last_r_one;
        CData/*3:0*/ sdspi__DOT__r_lgblklen;
        CData/*0:0*/ sdspi__DOT__r_watchdog_err;
        CData/*0:0*/ sdspi__DOT__ll_advance;
        CData/*7:0*/ sdspi__DOT__r_sdspi_clk;
        CData/*0:0*/ sdspi__DOT__ll_cmd_stb;
        CData/*7:0*/ sdspi__DOT__ll_cmd_dat;
        CData/*0:0*/ sdspi__DOT__ll_out_stb;
        CData/*0:0*/ sdspi__DOT__ll_idle;
        CData/*7:0*/ sdspi__DOT__ll_out_dat;
        CData/*0:0*/ sdspi__DOT__r_fifo_id;
        CData/*0:0*/ sdspi__DOT__r_use_fifo;
        CData/*0:0*/ sdspi__DOT__write_to_card;
        CData/*0:0*/ sdspi__DOT__w_reset;
        CData/*0:0*/ sdspi__DOT__cmd_sent;
        CData/*0:0*/ sdspi__DOT__cmd_valid;
        CData/*0:0*/ sdspi__DOT__cmd_busy;
        CData/*0:0*/ sdspi__DOT__rx_start;
        CData/*0:0*/ sdspi__DOT__spi_write_to_fifo;
        CData/*0:0*/ sdspi__DOT__rx_valid;
        CData/*0:0*/ sdspi__DOT__rx_busy;
        CData/*7:0*/ sdspi__DOT__rx_response;
        CData/*0:0*/ sdspi__DOT__tx_start;
        CData/*0:0*/ sdspi__DOT__spi_read_from_fifo;
        CData/*0:0*/ sdspi__DOT__tx_stb;
        CData/*0:0*/ sdspi__DOT__tx_valid;
        CData/*0:0*/ sdspi__DOT__tx_busy;
        CData/*7:0*/ sdspi__DOT__tx_response;
        CData/*0:0*/ sdspi__DOT__last_busy;
        CData/*0:0*/ sdspi__DOT____Vcellinp__spicmdi____pinNumber3;
        CData/*0:0*/ sdspi__DOT____Vcellinp__spirxdatai____pinNumber7;
        CData/*0:0*/ sdspi__DOT____Vcellinp__spirxdatai____pinNumber2;
        CData/*0:0*/ sdspi__DOT____Vcellinp__spitxdatai____pinNumber10;
    };
    struct {
        CData/*2:0*/ sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present;
        CData/*0:0*/ sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_removed;
        CData/*0:0*/ sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_present;
        CData/*0:0*/ sdspi__DOT____VdfgTmp_h302b62a3__0;
        CData/*0:0*/ sdspi__DOT__lowlevel__DOT__r_z_counter;
        CData/*7:0*/ sdspi__DOT__lowlevel__DOT__r_clk_counter;
        CData/*0:0*/ sdspi__DOT__lowlevel__DOT__r_idle;
        CData/*3:0*/ sdspi__DOT__lowlevel__DOT__r_state;
        CData/*7:0*/ sdspi__DOT__lowlevel__DOT__r_byte;
        CData/*7:0*/ sdspi__DOT__lowlevel__DOT__r_ireg;
        CData/*0:0*/ sdspi__DOT__lowlevel__DOT__byte_accepted;
        CData/*0:0*/ sdspi__DOT__lowlevel__DOT__restart_counter;
        CData/*0:0*/ sdspi__DOT__lowlevel__DOT__startup_hold;
        CData/*0:0*/ sdspi__DOT__lowlevel__DOT__powerup_hold;
        CData/*0:0*/ sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__r_powerup_hold;
        CData/*6:0*/ sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter;
        CData/*0:0*/ sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold;
        CData/*0:0*/ sdspi__DOT__spicmdi__DOT__almost_sent;
        CData/*4:0*/ sdspi__DOT__spicmdi__DOT__crc_valid_sreg;
        CData/*0:0*/ sdspi__DOT__spicmdi__DOT__crc_busy;
        CData/*4:0*/ sdspi__DOT__spicmdi__DOT__crc_bit_counter;
        CData/*7:0*/ sdspi__DOT__spicmdi__DOT__crc_byte;
        CData/*0:0*/ sdspi__DOT__spicmdi__DOT__rx_r1_byte;
        CData/*0:0*/ sdspi__DOT__spicmdi__DOT__rx_check_busy;
        CData/*0:0*/ sdspi__DOT__spicmdi__DOT__rxvalid;
        CData/*2:0*/ sdspi__DOT__spicmdi__DOT__rx_counter;
        CData/*6:0*/ sdspi__DOT__spicmdi__DOT__next_crc_byte;
        CData/*0:0*/ sdspi__DOT__spirxdatai__DOT__error_token;
        CData/*0:0*/ sdspi__DOT__spirxdatai__DOT__start_token;
        CData/*0:0*/ sdspi__DOT__spirxdatai__DOT__received_token;
        CData/*0:0*/ sdspi__DOT__spirxdatai__DOT__done;
        CData/*0:0*/ sdspi__DOT__spirxdatai__DOT__lastaddr;
        CData/*0:0*/ sdspi__DOT__spirxdatai__DOT__all_mem_written;
        CData/*0:0*/ sdspi__DOT__spirxdatai__DOT__lastdata;
        CData/*1:0*/ sdspi__DOT__spirxdatai__DOT__crc_byte;
        CData/*2:0*/ sdspi__DOT__spirxdatai__DOT__r_lgblksz_m3;
        CData/*3:0*/ sdspi__DOT__spirxdatai__DOT__crc_fill;
        CData/*7:0*/ sdspi__DOT__spirxdatai__DOT__crc_gearbox;
        CData/*0:0*/ sdspi__DOT__spirxdatai__DOT__crc_err;
        CData/*0:0*/ sdspi__DOT__spirxdatai__DOT__crc_active;
        CData/*2:0*/ sdspi__DOT__spirxdatai__DOT__fill;
        CData/*1:0*/ sdspi__DOT__spitxdatai__DOT__rdvalid;
        CData/*4:0*/ sdspi__DOT__spitxdatai__DOT__fill;
        CData/*0:0*/ sdspi__DOT__spitxdatai__DOT__crc_flag;
        CData/*0:0*/ sdspi__DOT__spitxdatai__DOT__crc_stb;
        CData/*0:0*/ sdspi__DOT__spitxdatai__DOT__all_mem_read;
        CData/*0:0*/ sdspi__DOT__spitxdatai__DOT__lastaddr;
        CData/*0:0*/ sdspi__DOT__spitxdatai__DOT__data_sent;
        CData/*0:0*/ sdspi__DOT__spitxdatai__DOT__received_token;
        CData/*0:0*/ sdspi__DOT__spitxdatai__DOT__all_idle;
        CData/*0:0*/ sdspi__DOT__spitxdatai__DOT__crc_active;
        CData/*4:0*/ sdspi__DOT__spitxdatai__DOT__crc_fill;
        CData/*0:0*/ sdspi__DOT__spitxdatai__DOT__token;
        CData/*2:0*/ sdspi__DOT__spitxdatai__DOT__r_lgblksz_m3;
        CData/*0:0*/ __VstlFirstIteration;
        CData/*0:0*/ __VicoFirstIteration;
        CData/*0:0*/ __Vtrigprevexpr___TOP__i_clk__0;
        CData/*0:0*/ __VactContinue;
        SData/*9:0*/ sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter;
        SData/*9:0*/ sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter;
        SData/*15:0*/ sdspi__DOT__spirxdatai__DOT__next_crc_data;
        SData/*15:0*/ sdspi__DOT__spirxdatai__DOT__crc_data;
        SData/*15:0*/ sdspi__DOT__spirxdatai__DOT__first_crc_data;
        SData/*15:0*/ sdspi__DOT__spitxdatai__DOT__crc_data;
    };
    struct {
        SData/*15:0*/ sdspi__DOT__spitxdatai__DOT__next_crc_data;
        VL_IN(i_wb_data,31,0);
        VL_OUT(o_wb_data,31,0);
        VL_OUT(o_debug,31,0);
        IData/*31:0*/ sdspi__DOT__write_fifo_a_data;
        IData/*31:0*/ sdspi__DOT__write_fifo_b_data;
        IData/*31:0*/ sdspi__DOT__fifo_a_word;
        IData/*31:0*/ sdspi__DOT__fifo_b_word;
        IData/*31:0*/ sdspi__DOT__spi_read_data;
        IData/*31:0*/ sdspi__DOT__spi_write_data;
        IData/*31:0*/ sdspi__DOT__r_data_reg;
        IData/*25:0*/ sdspi__DOT__r_watchdog;
        IData/*23:0*/ sdspi__DOT__spirxdatai__DOT__gearbox;
        IData/*31:0*/ sdspi__DOT__spitxdatai__DOT__crc_gearbox;
        IData/*31:0*/ __VactIterCount;
        QData/*39:0*/ sdspi__DOT__cmd_response;
        QData/*39:0*/ sdspi__DOT__spicmdi__DOT__crc_shift_reg;
        QData/*39:0*/ sdspi__DOT__spicmdi__DOT__shift_data;
        QData/*39:0*/ sdspi__DOT__spitxdatai__DOT__gearbox;
        VlUnpacked<IData/*31:0*/, 128> sdspi__DOT__fifo_a;
        VlUnpacked<IData/*31:0*/, 128> sdspi__DOT__fifo_b;
        VlUnpacked<CData/*0:0*/, 2> __Vm_traceActivity;
    };
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VicoTriggered;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vsdspi__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vsdspi___024root(Vsdspi__Syms* symsp, const char* v__name);
    ~Vsdspi___024root();
    VL_UNCOPYABLE(Vsdspi___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
