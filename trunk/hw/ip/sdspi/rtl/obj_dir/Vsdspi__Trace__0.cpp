// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vsdspi__Syms.h"


void Vsdspi___024root__trace_chg_0_sub_0(Vsdspi___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void Vsdspi___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root__trace_chg_0\n"); );
    // Init
    Vsdspi___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsdspi___024root*>(voidSelf);
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vsdspi___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void Vsdspi___024root__trace_chg_0_sub_0(Vsdspi___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root__trace_chg_0_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
        bufp->chgBit(oldp+0,(vlSelf->sdspi__DOT__r_cmd_busy));
        bufp->chgBit(oldp+1,(vlSelf->sdspi__DOT__dbg_trigger));
        bufp->chgCData(oldp+2,(vlSelf->sdspi__DOT__pipe_addr),2);
        bufp->chgBit(oldp+3,(vlSelf->sdspi__DOT__dly_stb));
        bufp->chgCData(oldp+4,(vlSelf->sdspi__DOT__fifo_wb_addr),7);
        bufp->chgCData(oldp+5,(vlSelf->sdspi__DOT__write_fifo_a_addr),7);
        bufp->chgCData(oldp+6,(vlSelf->sdspi__DOT__write_fifo_b_addr),7);
        bufp->chgCData(oldp+7,((0x7fU & (((~ ((IData)(vlSelf->sdspi__DOT__spi_read_addr) 
                                              >> 7U)) 
                                          & (IData)(vlSelf->sdspi__DOT____VdfgTmp_h302b62a3__0))
                                          ? (IData)(vlSelf->sdspi__DOT__spi_read_addr)
                                          : (IData)(vlSelf->sdspi__DOT__fifo_wb_addr)))),7);
        bufp->chgCData(oldp+8,((0x7fU & (((IData)(vlSelf->sdspi__DOT____VdfgTmp_h302b62a3__0) 
                                          & ((IData)(vlSelf->sdspi__DOT__spi_read_addr) 
                                             >> 7U))
                                          ? (IData)(vlSelf->sdspi__DOT__spi_read_addr)
                                          : (IData)(vlSelf->sdspi__DOT__fifo_wb_addr)))),7);
        bufp->chgCData(oldp+9,(vlSelf->sdspi__DOT__spi_read_addr),8);
        bufp->chgCData(oldp+10,(vlSelf->sdspi__DOT__spi_write_addr),8);
        bufp->chgIData(oldp+11,(vlSelf->sdspi__DOT__write_fifo_a_data),32);
        bufp->chgIData(oldp+12,(vlSelf->sdspi__DOT__write_fifo_b_data),32);
        bufp->chgIData(oldp+13,(vlSelf->sdspi__DOT__fifo_a_word),32);
        bufp->chgIData(oldp+14,(vlSelf->sdspi__DOT__fifo_b_word),32);
        bufp->chgIData(oldp+15,(vlSelf->sdspi__DOT__spi_read_data),32);
        bufp->chgIData(oldp+16,(vlSelf->sdspi__DOT__spi_write_data),32);
        bufp->chgBit(oldp+17,(vlSelf->sdspi__DOT__write_fifo_a));
        bufp->chgBit(oldp+18,(vlSelf->sdspi__DOT__write_fifo_b));
        bufp->chgIData(oldp+19,(vlSelf->sdspi__DOT__r_data_reg),32);
        bufp->chgBit(oldp+20,(vlSelf->sdspi__DOT__r_cmd_err));
        bufp->chgCData(oldp+21,(vlSelf->sdspi__DOT__r_last_r_one),8);
        bufp->chgBit(oldp+22,(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_removed));
        bufp->chgBit(oldp+23,(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__r_card_present));
        bufp->chgCData(oldp+24,(vlSelf->sdspi__DOT__r_lgblklen),4);
        bufp->chgIData(oldp+25,(vlSelf->sdspi__DOT__r_watchdog),26);
        bufp->chgBit(oldp+26,(vlSelf->sdspi__DOT__r_watchdog_err));
        bufp->chgBit(oldp+27,(vlSelf->sdspi__DOT__ll_advance));
        bufp->chgCData(oldp+28,(vlSelf->sdspi__DOT__r_sdspi_clk),8);
        bufp->chgBit(oldp+29,(vlSelf->sdspi__DOT__ll_cmd_stb));
        bufp->chgCData(oldp+30,(vlSelf->sdspi__DOT__ll_cmd_dat),8);
        bufp->chgBit(oldp+31,(vlSelf->sdspi__DOT__ll_out_stb));
        bufp->chgBit(oldp+32,(vlSelf->sdspi__DOT__ll_idle));
        bufp->chgCData(oldp+33,(vlSelf->sdspi__DOT__ll_out_dat),8);
        bufp->chgBit(oldp+34,(vlSelf->sdspi__DOT__r_fifo_id));
        bufp->chgBit(oldp+35,(vlSelf->sdspi__DOT__r_use_fifo));
        bufp->chgBit(oldp+36,(vlSelf->sdspi__DOT__write_to_card));
        bufp->chgBit(oldp+37,(vlSelf->sdspi__DOT__cmd_busy));
        bufp->chgCData(oldp+38,((0xffU & (IData)((vlSelf->sdspi__DOT__spicmdi__DOT__shift_data 
                                                  >> 0x20U)))),8);
        bufp->chgBit(oldp+39,(vlSelf->sdspi__DOT__cmd_sent));
        bufp->chgBit(oldp+40,(vlSelf->sdspi__DOT__cmd_valid));
        bufp->chgQData(oldp+41,(vlSelf->sdspi__DOT__cmd_response),40);
        bufp->chgBit(oldp+43,(vlSelf->sdspi__DOT__rx_start));
        bufp->chgBit(oldp+44,(vlSelf->sdspi__DOT__spi_write_to_fifo));
        bufp->chgBit(oldp+45,(vlSelf->sdspi__DOT__rx_valid));
        bufp->chgBit(oldp+46,(vlSelf->sdspi__DOT__rx_busy));
        bufp->chgCData(oldp+47,(vlSelf->sdspi__DOT__rx_response),8);
        bufp->chgBit(oldp+48,(vlSelf->sdspi__DOT__tx_start));
        bufp->chgBit(oldp+49,(vlSelf->sdspi__DOT__spi_read_from_fifo));
        bufp->chgBit(oldp+50,(vlSelf->sdspi__DOT__tx_stb));
        bufp->chgCData(oldp+51,((0xffU & (IData)((vlSelf->sdspi__DOT__spitxdatai__DOT__gearbox 
                                                  >> 0x20U)))),8);
        bufp->chgBit(oldp+52,(vlSelf->sdspi__DOT__tx_valid));
        bufp->chgBit(oldp+53,(vlSelf->sdspi__DOT__tx_busy));
        bufp->chgCData(oldp+54,(vlSelf->sdspi__DOT__tx_response),8);
        bufp->chgBit(oldp+55,(vlSelf->sdspi__DOT__last_busy));
        bufp->chgCData(oldp+56,(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__raw_card_present),3);
        bufp->chgSData(oldp+57,(vlSelf->sdspi__DOT__GEN_CARD_DETECT__DOT__card_detect_counter),10);
        bufp->chgBit(oldp+58,(vlSelf->sdspi__DOT__lowlevel__DOT__r_z_counter));
        bufp->chgCData(oldp+59,(vlSelf->sdspi__DOT__lowlevel__DOT__r_clk_counter),8);
        bufp->chgBit(oldp+60,(vlSelf->sdspi__DOT__lowlevel__DOT__r_idle));
        bufp->chgCData(oldp+61,(vlSelf->sdspi__DOT__lowlevel__DOT__r_state),4);
        bufp->chgCData(oldp+62,(vlSelf->sdspi__DOT__lowlevel__DOT__r_byte),8);
        bufp->chgCData(oldp+63,(vlSelf->sdspi__DOT__lowlevel__DOT__r_ireg),8);
        bufp->chgBit(oldp+64,(vlSelf->sdspi__DOT__lowlevel__DOT__byte_accepted));
        bufp->chgBit(oldp+65,(vlSelf->sdspi__DOT__lowlevel__DOT__restart_counter));
        bufp->chgBit(oldp+66,(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__r_startup_hold));
        bufp->chgBit(oldp+67,(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__r_powerup_hold));
        bufp->chgSData(oldp+68,(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_POWERUP__DOT__powerup_counter),10);
        bufp->chgCData(oldp+69,(vlSelf->sdspi__DOT__lowlevel__DOT__WAIT_FOR_STARTUP__DOT__startup_counter),7);
        bufp->chgBit(oldp+70,((1U & (~ (IData)(vlSelf->sdspi__DOT__ll_advance)))));
        bufp->chgBit(oldp+71,(vlSelf->sdspi__DOT__spicmdi__DOT__almost_sent));
        bufp->chgCData(oldp+72,(vlSelf->sdspi__DOT__spicmdi__DOT__crc_valid_sreg),5);
        bufp->chgBit(oldp+73,(vlSelf->sdspi__DOT__spicmdi__DOT__crc_busy));
        bufp->chgCData(oldp+74,(vlSelf->sdspi__DOT__spicmdi__DOT__crc_bit_counter),5);
        bufp->chgQData(oldp+75,(vlSelf->sdspi__DOT__spicmdi__DOT__crc_shift_reg),40);
        bufp->chgQData(oldp+77,(vlSelf->sdspi__DOT__spicmdi__DOT__shift_data),40);
        bufp->chgCData(oldp+79,(vlSelf->sdspi__DOT__spicmdi__DOT__crc_byte),8);
        bufp->chgBit(oldp+80,(vlSelf->sdspi__DOT__spicmdi__DOT__rx_r1_byte));
        bufp->chgBit(oldp+81,(vlSelf->sdspi__DOT__spicmdi__DOT__rx_check_busy));
        bufp->chgBit(oldp+82,(vlSelf->sdspi__DOT__spicmdi__DOT__rxvalid));
        bufp->chgCData(oldp+83,(vlSelf->sdspi__DOT__spicmdi__DOT__rx_counter),3);
        bufp->chgCData(oldp+84,(vlSelf->sdspi__DOT__spicmdi__DOT__next_crc_byte),7);
        bufp->chgBit(oldp+85,(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7));
        bufp->chgBit(oldp+86,(vlSelf->sdspi__DOT__spirxdatai__DOT__error_token));
        bufp->chgBit(oldp+87,(vlSelf->sdspi__DOT__spirxdatai__DOT__start_token));
        bufp->chgBit(oldp+88,(((IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__error_token) 
                               | (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__start_token))));
        bufp->chgBit(oldp+89,(vlSelf->sdspi__DOT__spirxdatai__DOT__received_token));
        bufp->chgBit(oldp+90,(vlSelf->sdspi__DOT__spirxdatai__DOT__done));
        bufp->chgBit(oldp+91,(vlSelf->sdspi__DOT__spirxdatai__DOT__lastaddr));
        bufp->chgBit(oldp+92,(vlSelf->sdspi__DOT__spirxdatai__DOT__all_mem_written));
        bufp->chgBit(oldp+93,(vlSelf->sdspi__DOT__spirxdatai__DOT__lastdata));
        bufp->chgCData(oldp+94,(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_byte),2);
        bufp->chgCData(oldp+95,(vlSelf->sdspi__DOT__spirxdatai__DOT__r_lgblksz_m3),3);
        bufp->chgBit(oldp+96,(((~ (IData)(vlSelf->sdspi__DOT__spirxdatai__DOT__all_mem_written)) 
                               & (IData)(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber7))));
        bufp->chgCData(oldp+97,(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_fill),4);
        bufp->chgCData(oldp+98,(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_gearbox),8);
        bufp->chgSData(oldp+99,(vlSelf->sdspi__DOT__spirxdatai__DOT__next_crc_data),16);
        bufp->chgSData(oldp+100,(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_data),16);
        bufp->chgBit(oldp+101,(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_err));
        bufp->chgBit(oldp+102,(vlSelf->sdspi__DOT__spirxdatai__DOT__crc_active));
        bufp->chgCData(oldp+103,(vlSelf->sdspi__DOT__spirxdatai__DOT__fill),3);
        bufp->chgIData(oldp+104,(vlSelf->sdspi__DOT__spirxdatai__DOT__gearbox),24);
        bufp->chgSData(oldp+105,(vlSelf->sdspi__DOT__spirxdatai__DOT__first_crc_data),16);
        bufp->chgBit(oldp+106,(vlSelf->sdspi__DOT____Vcellinp__spitxdatai____pinNumber10));
        bufp->chgCData(oldp+107,(vlSelf->sdspi__DOT__spitxdatai__DOT__rdvalid),2);
        bufp->chgQData(oldp+108,(vlSelf->sdspi__DOT__spitxdatai__DOT__gearbox),40);
        bufp->chgCData(oldp+110,(vlSelf->sdspi__DOT__spitxdatai__DOT__fill),5);
        bufp->chgBit(oldp+111,(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_flag));
        bufp->chgBit(oldp+112,(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_stb));
        bufp->chgBit(oldp+113,(vlSelf->sdspi__DOT__spitxdatai__DOT__all_mem_read));
        bufp->chgBit(oldp+114,(vlSelf->sdspi__DOT__spitxdatai__DOT__lastaddr));
        bufp->chgBit(oldp+115,(vlSelf->sdspi__DOT__spitxdatai__DOT__data_sent));
        bufp->chgBit(oldp+116,(vlSelf->sdspi__DOT__spitxdatai__DOT__received_token));
        bufp->chgBit(oldp+117,(vlSelf->sdspi__DOT__spitxdatai__DOT__all_idle));
        bufp->chgBit(oldp+118,(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_active));
        bufp->chgCData(oldp+119,(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_fill),5);
        bufp->chgIData(oldp+120,(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_gearbox),32);
        bufp->chgSData(oldp+121,(vlSelf->sdspi__DOT__spitxdatai__DOT__crc_data),16);
        bufp->chgBit(oldp+122,(vlSelf->sdspi__DOT__spitxdatai__DOT__token));
        bufp->chgCData(oldp+123,(vlSelf->sdspi__DOT__spitxdatai__DOT__r_lgblksz_m3),3);
        bufp->chgSData(oldp+124,(vlSelf->sdspi__DOT__spitxdatai__DOT__next_crc_data),16);
    }
    bufp->chgBit(oldp+125,(vlSelf->i_clk));
    bufp->chgBit(oldp+126,(vlSelf->i_sd_reset));
    bufp->chgBit(oldp+127,(vlSelf->i_wb_cyc));
    bufp->chgBit(oldp+128,(vlSelf->i_wb_stb));
    bufp->chgBit(oldp+129,(vlSelf->i_wb_we));
    bufp->chgCData(oldp+130,(vlSelf->i_wb_addr),2);
    bufp->chgIData(oldp+131,(vlSelf->i_wb_data),32);
    bufp->chgCData(oldp+132,(vlSelf->i_wb_sel),4);
    bufp->chgBit(oldp+133,(vlSelf->o_wb_stall));
    bufp->chgBit(oldp+134,(vlSelf->o_wb_ack));
    bufp->chgIData(oldp+135,(vlSelf->o_wb_data),32);
    bufp->chgBit(oldp+136,(vlSelf->o_cs_n));
    bufp->chgBit(oldp+137,(vlSelf->o_sck));
    bufp->chgBit(oldp+138,(vlSelf->o_mosi));
    bufp->chgBit(oldp+139,(vlSelf->i_miso));
    bufp->chgBit(oldp+140,(vlSelf->i_card_detect));
    bufp->chgBit(oldp+141,(vlSelf->o_int));
    bufp->chgBit(oldp+142,(vlSelf->i_bus_grant));
    bufp->chgIData(oldp+143,(vlSelf->o_debug),32);
    bufp->chgBit(oldp+144,(vlSelf->sdspi__DOT__wb_stb));
    bufp->chgBit(oldp+145,(vlSelf->sdspi__DOT__write_stb));
    bufp->chgBit(oldp+146,(vlSelf->sdspi__DOT__wb_cmd_stb));
    bufp->chgBit(oldp+147,(((IData)(vlSelf->sdspi__DOT__wb_stb) 
                            & ((IData)(vlSelf->i_wb_we) 
                               & ((0U != (IData)(vlSelf->i_wb_sel)) 
                                  & (1U == (IData)(vlSelf->i_wb_addr)))))));
    bufp->chgIData(oldp+148,((((IData)(vlSelf->sdspi__DOT__r_watchdog_err) 
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
                                                                 | (IData)(vlSelf->sdspi__DOT__r_last_r_one))))))))))),32);
    bufp->chgBit(oldp+149,(vlSelf->sdspi__DOT__w_reset));
    bufp->chgBit(oldp+150,(vlSelf->sdspi__DOT____Vcellinp__spicmdi____pinNumber3));
    bufp->chgCData(oldp+151,((3U & (vlSelf->i_wb_data 
                                    >> 8U))),2);
    bufp->chgCData(oldp+152,((0x3fU & vlSelf->i_wb_data)),6);
    bufp->chgBit(oldp+153,(vlSelf->sdspi__DOT____Vcellinp__spirxdatai____pinNumber2));
}

void Vsdspi___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdspi___024root__trace_cleanup\n"); );
    // Init
    Vsdspi___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsdspi___024root*>(voidSelf);
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
}
