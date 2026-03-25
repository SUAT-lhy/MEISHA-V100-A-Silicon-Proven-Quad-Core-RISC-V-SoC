// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vsdio__Syms.h"


void Vsdio___024root__trace_chg_0_sub_0(Vsdio___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void Vsdio___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root__trace_chg_0\n"); );
    // Init
    Vsdio___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsdio___024root*>(voidSelf);
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vsdio___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void Vsdio___024root__trace_chg_0_sub_0(Vsdio___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root__trace_chg_0_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    if (VL_UNLIKELY((vlSelf->__Vm_traceActivity[1U] 
                     | vlSelf->__Vm_traceActivity[2U]))) {
        bufp->chgBit(oldp+0,(vlSelf->sdio__DOT__u_control__DOT__new_cmd_request));
        bufp->chgBit(oldp+1,(vlSelf->sdio__DOT__u_control__DOT__new_data_request));
        bufp->chgBit(oldp+2,(vlSelf->sdio__DOT__u_control__DOT__new_tx_request));
        bufp->chgBit(oldp+3,(vlSelf->sdio__DOT__u_control__DOT__w_selfreply_request));
        bufp->chgBit(oldp+4,(vlSelf->sdio__DOT__u_control__DOT__wb_cmd_stb));
        bufp->chgBit(oldp+5,(vlSelf->sdio__DOT____Vcellinp__u_sdcmd__i_reset));
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[2U])) {
        bufp->chgBit(oldp+6,(vlSelf->sdio__DOT__soft_reset));
        bufp->chgBit(oldp+7,(vlSelf->sdio__DOT__cfg_clk90));
        bufp->chgBit(oldp+8,(vlSelf->sdio__DOT__cfg_clk_shutdown));
        bufp->chgCData(oldp+9,(vlSelf->sdio__DOT__u_control__DOT__r_ckspeed),8);
        bufp->chgCData(oldp+10,(vlSelf->sdio__DOT__u_control__DOT__r_width),2);
        bufp->chgBit(oldp+11,(vlSelf->sdio__DOT__clk_stb));
        bufp->chgBit(oldp+12,(vlSelf->sdio__DOT__clk_half));
        bufp->chgCData(oldp+13,(vlSelf->sdio__DOT__w_sdclk),8);
        bufp->chgCData(oldp+14,(vlSelf->sdio__DOT__clk_ckspd),8);
        bufp->chgBit(oldp+15,(vlSelf->sdio__DOT__cmd_request));
        bufp->chgBit(oldp+16,(vlSelf->sdio__DOT__cmd_err));
        bufp->chgBit(oldp+17,(vlSelf->sdio__DOT__cmd_busy));
        bufp->chgBit(oldp+18,(vlSelf->sdio__DOT__cmd_done));
        bufp->chgBit(oldp+19,(vlSelf->sdio__DOT__u_control__DOT__GEN_SELFREPLY__DOT__r_cmd_selfreply));
        bufp->chgCData(oldp+20,(vlSelf->sdio__DOT__cmd_type),2);
        bufp->chgCData(oldp+21,(vlSelf->sdio__DOT__cmd_ercode),2);
        bufp->chgBit(oldp+22,(vlSelf->sdio__DOT__rsp_stb));
        bufp->chgCData(oldp+23,(vlSelf->sdio__DOT__u_control__DOT__r_cmd),7);
        bufp->chgCData(oldp+24,(vlSelf->sdio__DOT__rsp_id),6);
        bufp->chgIData(oldp+25,(vlSelf->sdio__DOT__u_control__DOT__r_arg),32);
        bufp->chgIData(oldp+26,(vlSelf->sdio__DOT__rsp_arg),32);
        bufp->chgBit(oldp+27,(vlSelf->sdio__DOT__cmd_mem_valid));
        bufp->chgSData(oldp+28,(vlSelf->sdio__DOT__u_sdcmd__DOT__mem_addr),13);
        bufp->chgIData(oldp+29,(vlSelf->sdio__DOT__cmd_mem_data),32);
        bufp->chgBit(oldp+30,(vlSelf->sdio__DOT__tx_en));
        bufp->chgBit(oldp+31,(vlSelf->sdio__DOT__tx_mem_valid));
        bufp->chgBit(oldp+32,(vlSelf->sdio__DOT__tx_mem_ready));
        bufp->chgBit(oldp+33,(vlSelf->sdio__DOT__tx_mem_last));
        bufp->chgIData(oldp+34,(vlSelf->sdio__DOT__tx_mem_data),32);
        bufp->chgSData(oldp+35,((0xffffU & ((IData)(1U) 
                                            << (IData)(vlSelf->sdio__DOT__u_control__DOT__lgblk)))),16);
        bufp->chgBit(oldp+36,(vlSelf->sdio__DOT__u_rxframe__DOT__mem_valid));
        bufp->chgSData(oldp+37,(vlSelf->sdio__DOT__u_rxframe__DOT__mem_addr),13);
        bufp->chgCData(oldp+38,(vlSelf->sdio__DOT__u_rxframe__DOT__mem_strb),4);
        bufp->chgIData(oldp+39,(vlSelf->sdio__DOT__u_rxframe__DOT__mem_data),32);
        bufp->chgBit(oldp+40,(vlSelf->sdio__DOT__rx_done));
        bufp->chgBit(oldp+41,(vlSelf->sdio__DOT__rx_err));
        bufp->chgBit(oldp+42,(vlSelf->sdio__DOT__rx_ercode));
        bufp->chgBit(oldp+43,(vlSelf->sdio__DOT__rx_active));
        bufp->chgBit(oldp+44,(vlSelf->sdio__DOT__rx_en));
        bufp->chgBit(oldp+45,(vlSelf->sdio__DOT____Vcellinp__u_clkgen__i_cfg_shutdown));
        bufp->chgBit(oldp+46,(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_stb));
        bufp->chgBit(oldp+47,(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_clk));
        bufp->chgSData(oldp+48,(vlSelf->sdio__DOT__u_clkgen__DOT__nxt_counter),10);
        bufp->chgSData(oldp+49,(vlSelf->sdio__DOT__u_clkgen__DOT__counter),10);
        bufp->chgBit(oldp+50,(vlSelf->sdio__DOT__u_clkgen__DOT__clk90));
        bufp->chgCData(oldp+51,(vlSelf->sdio__DOT__u_clkgen__DOT__ckspd),8);
        bufp->chgBit(oldp+52,(vlSelf->sdio__DOT__u_clkgen__DOT__w_clk90));
        bufp->chgCData(oldp+53,(vlSelf->sdio__DOT__u_clkgen__DOT__w_ckspd),8);
        bufp->chgBit(oldp+54,(vlSelf->sdio__DOT____Vcellinp__u_control__i_tx_mem_ready));
        bufp->chgBit(oldp+55,(vlSelf->sdio__DOT__u_control__DOT__cmd_busy));
        bufp->chgBit(oldp+56,(vlSelf->sdio__DOT__u_control__DOT__r_clk_shutdown));
        bufp->chgBit(oldp+57,(vlSelf->sdio__DOT__u_control__DOT__r_tx_request));
        bufp->chgBit(oldp+58,(vlSelf->sdio__DOT__u_control__DOT__r_rx_request));
        bufp->chgBit(oldp+59,(vlSelf->sdio__DOT__u_control__DOT__r_tx_sent));
        bufp->chgBit(oldp+60,(vlSelf->sdio__DOT__u_control__DOT__r_fifo));
        bufp->chgBit(oldp+61,(vlSelf->sdio__DOT__u_control__DOT__r_cmd_err));
        bufp->chgBit(oldp+62,(vlSelf->sdio__DOT__u_control__DOT__r_rx_err));
        bufp->chgBit(oldp+63,(vlSelf->sdio__DOT__u_control__DOT__r_rx_ecode));
        bufp->chgCData(oldp+64,(vlSelf->sdio__DOT__u_control__DOT__r_cmd_ecode),2);
        bufp->chgCData(oldp+65,(vlSelf->sdio__DOT__u_control__DOT__lgblk),4);
        bufp->chgIData(oldp+66,(vlSelf->sdio__DOT__u_control__DOT__w_cmd_word),32);
        bufp->chgIData(oldp+67,(vlSelf->sdio__DOT__u_control__DOT__w_phy_ctrl),32);
        bufp->chgSData(oldp+68,((0xffffU & (VL_SHIFTL_III(16,16,32, (IData)(1U), 
                                                          ((IData)(vlSelf->sdio__DOT__u_control__DOT__lgblk) 
                                                           - (IData)(2U))) 
                                            - (IData)(1U)))),16);
        bufp->chgIData(oldp+69,(vlSelf->sdio__DOT__u_control__DOT__ika),32);
        bufp->chgIData(oldp+70,(vlSelf->sdio__DOT__u_control__DOT__ikb),32);
        bufp->chgIData(oldp+71,(vlSelf->sdio__DOT__u_control__DOT__tx_fifo_a),32);
        bufp->chgIData(oldp+72,(vlSelf->sdio__DOT__u_control__DOT__tx_fifo_b),32);
        bufp->chgSData(oldp+73,(vlSelf->sdio__DOT__u_control__DOT__fif_wraddr),13);
        bufp->chgSData(oldp+74,(vlSelf->sdio__DOT__u_control__DOT__fif_rdaddr),13);
        bufp->chgSData(oldp+75,((((~ (IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo)) 
                                  & (IData)(vlSelf->sdio__DOT__tx_en))
                                  ? (IData)(vlSelf->sdio__DOT__u_control__DOT__tx_mem_addr)
                                  : (IData)(vlSelf->sdio__DOT__u_control__DOT__fif_rdaddr))),13);
        bufp->chgSData(oldp+76,((((IData)(vlSelf->sdio__DOT__tx_en) 
                                  & (IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo))
                                  ? (IData)(vlSelf->sdio__DOT__u_control__DOT__tx_mem_addr)
                                  : (IData)(vlSelf->sdio__DOT__u_control__DOT__fif_rdaddr))),13);
        bufp->chgSData(oldp+77,(vlSelf->sdio__DOT__u_control__DOT__tx_mem_addr),13);
        bufp->chgIData(oldp+78,(((IData)(vlSelf->sdio__DOT__u_control__DOT__r_fifo)
                                  ? vlSelf->sdio__DOT__u_control__DOT__tx_fifo_b
                                  : vlSelf->sdio__DOT__u_control__DOT__tx_fifo_a)),32);
        bufp->chgBit(oldp+79,(vlSelf->sdio__DOT__u_control__DOT__tx_fifo_last));
        bufp->chgBit(oldp+80,(((IData)(vlSelf->sdio__DOT__tx_en) 
                               & ((IData)(vlSelf->sdio__DOT__u_control__DOT__tx_mem_addr) 
                                  >= (0xffffU & (VL_SHIFTL_III(16,16,32, (IData)(1U), 
                                                               ((IData)(vlSelf->sdio__DOT__u_control__DOT__lgblk) 
                                                                - (IData)(2U))) 
                                                 - (IData)(1U)))))));
        bufp->chgBit(oldp+81,(vlSelf->sdio__DOT__u_control__DOT__tx_pipe_valid));
        bufp->chgBit(oldp+82,(vlSelf->sdio__DOT__u_control__DOT__pre_ack));
        bufp->chgCData(oldp+83,(vlSelf->sdio__DOT__u_control__DOT__pre_sel),2);
        bufp->chgIData(oldp+84,(vlSelf->sdio__DOT__u_control__DOT__pre_data),32);
        bufp->chgSData(oldp+85,(vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_a),13);
        bufp->chgSData(oldp+86,(vlSelf->sdio__DOT__u_control__DOT__mem_wr_addr_b),13);
        bufp->chgCData(oldp+87,(vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_a),4);
        bufp->chgCData(oldp+88,(vlSelf->sdio__DOT__u_control__DOT__mem_wr_strb_b),4);
        bufp->chgIData(oldp+89,(vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_a),32);
        bufp->chgIData(oldp+90,(vlSelf->sdio__DOT__u_control__DOT__mem_wr_data_b),32);
        bufp->chgBit(oldp+91,(vlSelf->sdio__DOT__u_control__DOT__mem_busy));
        bufp->chgBit(oldp+92,(vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_card_busy));
        bufp->chgSData(oldp+93,(vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_busy_counter),12);
        bufp->chgBit(oldp+94,(vlSelf->sdio__DOT__u_control__DOT__GEN_R1B__DOT__r_expect_busy));
        bufp->chgCData(oldp+95,(vlSelf->sdio__DOT__u_rxframe__DOT__sync_fill),5);
        bufp->chgIData(oldp+96,(vlSelf->sdio__DOT__u_rxframe__DOT__sync_sreg),20);
        bufp->chgBit(oldp+97,(vlSelf->sdio__DOT__u_rxframe__DOT__s2_valid));
        bufp->chgCData(oldp+98,(vlSelf->sdio__DOT__u_rxframe__DOT__s2_fill),2);
        bufp->chgSData(oldp+99,(vlSelf->sdio__DOT__u_rxframe__DOT__s2_data),16);
        bufp->chgBit(oldp+100,(vlSelf->sdio__DOT__u_rxframe__DOT__mem_full));
        bufp->chgBit(oldp+101,(vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_strb));
        bufp->chgCData(oldp+102,(vlSelf->sdio__DOT__u_rxframe__DOT__subaddr),2);
        bufp->chgCData(oldp+103,(vlSelf->sdio__DOT__u_rxframe__DOT__next_subaddr),2);
        bufp->chgCData(oldp+104,(vlSelf->sdio__DOT__u_rxframe__DOT__rnxt_data),8);
        bufp->chgBit(oldp+105,(vlSelf->sdio__DOT__u_rxframe__DOT__busy));
        bufp->chgBit(oldp+106,(vlSelf->sdio__DOT__u_rxframe__DOT__data_phase));
        bufp->chgBit(oldp+107,(vlSelf->sdio__DOT__u_rxframe__DOT__load_crc));
        bufp->chgBit(oldp+108,(vlSelf->sdio__DOT__u_rxframe__DOT__pending_crc));
        bufp->chgIData(oldp+109,(vlSelf->sdio__DOT__u_rxframe__DOT__rail_count),19);
        bufp->chgCData(oldp+110,(((0x80U & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__lcl_err) 
                                            << 6U)) 
                                  | ((0x40U & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__lcl_err) 
                                               << 5U)) 
                                     | ((0x20U & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__lcl_err) 
                                                  << 4U)) 
                                        | ((0x10U & 
                                            ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__lcl_err) 
                                             << 3U)) 
                                           | ((8U & 
                                               ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__lcl_err) 
                                                << 3U)) 
                                              | ((4U 
                                                  & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__lcl_err) 
                                                     << 2U)) 
                                                 | ((2U 
                                                     & ((IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__lcl_err) 
                                                        << 1U)) 
                                                    | (1U 
                                                       & (IData)(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__lcl_err)))))))))),8);
        bufp->chgIData(oldp+111,(vlSelf->sdio__DOT__u_rxframe__DOT__r_timeout),23);
        bufp->chgBit(oldp+112,(vlSelf->sdio__DOT__u_rxframe__DOT__r_watchdog));
        bufp->chgBit(oldp+113,(vlSelf->sdio__DOT__u_rxframe__DOT__last_strb));
        bufp->chgBit(oldp+114,(vlSelf->sdio__DOT__u_rxframe__DOT__w_done));
        bufp->chgSData(oldp+115,(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__pedge_crc),16);
        bufp->chgSData(oldp+116,(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__nedge_crc),16);
        bufp->chgCData(oldp+117,(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__0__KET____DOT__lcl_err),2);
        bufp->chgSData(oldp+118,(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__pedge_crc),16);
        bufp->chgSData(oldp+119,(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__nedge_crc),16);
        bufp->chgCData(oldp+120,(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__1__KET____DOT__lcl_err),2);
        bufp->chgSData(oldp+121,(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__pedge_crc),16);
        bufp->chgSData(oldp+122,(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__nedge_crc),16);
        bufp->chgCData(oldp+123,(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__2__KET____DOT__lcl_err),2);
        bufp->chgSData(oldp+124,(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__pedge_crc),16);
        bufp->chgSData(oldp+125,(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__nedge_crc),16);
        bufp->chgCData(oldp+126,(vlSelf->sdio__DOT__u_rxframe__DOT__GEN_RAIL_CRC__BRA__3__KET____DOT__lcl_err),2);
        bufp->chgBit(oldp+127,((0U == (IData)(vlSelf->sdio__DOT__u_control__DOT__r_ckspeed))));
        bufp->chgBit(oldp+128,(vlSelf->sdio__DOT__u_sdcmd__DOT__active));
        bufp->chgCData(oldp+129,(vlSelf->sdio__DOT__u_sdcmd__DOT__srcount),6);
        bufp->chgQData(oldp+130,(vlSelf->sdio__DOT__u_sdcmd__DOT__tx_sreg),48);
        bufp->chgBit(oldp+132,(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response));
        bufp->chgBit(oldp+133,(vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_ds));
        bufp->chgBit(oldp+134,(vlSelf->sdio__DOT__u_sdcmd__DOT__cfg_dbl));
        bufp->chgBit(oldp+135,(vlSelf->sdio__DOT__u_sdcmd__DOT__r_frame_err));
        bufp->chgBit(oldp+136,(vlSelf->sdio__DOT__u_sdcmd__DOT__response_active));
        bufp->chgBit(oldp+137,(vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_self_request));
        bufp->chgBit(oldp+138,(vlSelf->sdio__DOT__u_sdcmd__DOT__lcl_accept));
        bufp->chgCData(oldp+139,(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type),2);
        bufp->chgCData(oldp+140,(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count),8);
        bufp->chgBit(oldp+141,(((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__r_frame_err) 
                                | ((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__waiting_on_response) 
                                   & ((((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type) 
                                        >> 1U) & ((~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg)) 
                                                  & (0x30U 
                                                     == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)))) 
                                      | ((2U == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__cmd_type)) 
                                         & ((~ (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg)) 
                                            & (0x88U 
                                               == (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__resp_count)))))))));
        bufp->chgBit(oldp+142,(vlSelf->sdio__DOT__u_sdcmd__DOT__w_done));
        bufp->chgBit(oldp+143,(((IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__w_done) 
                                & (9U != (IData)(vlSelf->sdio__DOT__u_sdcmd__DOT__crc_fill)))));
        bufp->chgBit(oldp+144,(vlSelf->sdio__DOT__u_sdcmd__DOT__w_no_response));
        bufp->chgQData(oldp+145,(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_sreg),40);
        bufp->chgBit(oldp+147,(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout));
        bufp->chgBit(oldp+148,(vlSelf->sdio__DOT__u_sdcmd__DOT__GEN_IRQ_SUPPORT__DOT__r_no_timeout));
        bufp->chgIData(oldp+149,(vlSelf->sdio__DOT__u_sdcmd__DOT__rx_timeout_counter),26);
        bufp->chgCData(oldp+150,(vlSelf->sdio__DOT__u_sdcmd__DOT__crc_fill),7);
        bufp->chgBit(oldp+151,(vlSelf->sdio__DOT__u_sdcmd__DOT__r_busy));
        bufp->chgBit(oldp+152,(vlSelf->sdio__DOT__u_sdcmd__DOT__new_data));
        bufp->chgBit(oldp+153,(vlSelf->sdio__DOT__u_sdcmd__DOT__r_done));
        bufp->chgBit(oldp+154,(vlSelf->sdio__DOT____Vcellinp__u_txframe__S_VALID));
        bufp->chgBit(oldp+155,(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr));
        bufp->chgCData(oldp+156,(vlSelf->sdio__DOT__u_txframe__DOT__cfg_width),2);
        bufp->chgCData(oldp+157,(vlSelf->sdio__DOT__u_txframe__DOT__cfg_period),2);
        bufp->chgBit(oldp+158,(vlSelf->sdio__DOT__u_txframe__DOT__start_packet));
        bufp->chgBit(oldp+159,(vlSelf->sdio__DOT__u_txframe__DOT__pre_valid));
        bufp->chgCData(oldp+160,(vlSelf->sdio__DOT__u_txframe__DOT__pstate),2);
        bufp->chgBit(oldp+161,(vlSelf->sdio__DOT__u_txframe__DOT__pre_ready));
        bufp->chgIData(oldp+162,(vlSelf->sdio__DOT__u_txframe__DOT__pre_data),32);
        bufp->chgCData(oldp+163,(vlSelf->sdio__DOT__u_txframe__DOT__pre_count),4);
        bufp->chgSData(oldp+164,(vlSelf->sdio__DOT__u_txframe__DOT__crc_1w_reg),16);
        bufp->chgIData(oldp+165,(vlSelf->sdio__DOT__u_txframe__DOT__di_crc_2w),32);
        bufp->chgIData(oldp+166,(vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_2w),32);
        bufp->chgIData(oldp+167,(vlSelf->sdio__DOT__u_txframe__DOT__new_crc_2w),32);
        bufp->chgIData(oldp+168,(vlSelf->sdio__DOT__u_txframe__DOT__crc_2w_reg),32);
        bufp->chgQData(oldp+169,(vlSelf->sdio__DOT__u_txframe__DOT__di_crc_4w),64);
        bufp->chgQData(oldp+171,(vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_4w),64);
        bufp->chgQData(oldp+173,(vlSelf->sdio__DOT__u_txframe__DOT__new_crc_4w),64);
        bufp->chgQData(oldp+175,(vlSelf->sdio__DOT__u_txframe__DOT__crc_4w_reg),64);
        bufp->chgWData(oldp+177,(vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8w),128);
        bufp->chgWData(oldp+181,(vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8w),128);
        bufp->chgWData(oldp+185,(vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8w),128);
        bufp->chgWData(oldp+189,(vlSelf->sdio__DOT__u_txframe__DOT__crc_8w_reg),128);
        bufp->chgWData(oldp+193,(vlSelf->sdio__DOT__u_txframe__DOT__di_crc_8d),256);
        bufp->chgWData(oldp+201,(vlSelf->sdio__DOT__u_txframe__DOT__nxt_crc_8d),256);
        bufp->chgWData(oldp+209,(vlSelf->sdio__DOT__u_txframe__DOT__new_crc_8d),256);
        bufp->chgWData(oldp+217,(vlSelf->sdio__DOT__u_txframe__DOT__crc_8d_reg),256);
        bufp->chgBit(oldp+225,(vlSelf->sdio__DOT__u_txframe__DOT__ck_valid));
        bufp->chgCData(oldp+226,(vlSelf->sdio__DOT__u_txframe__DOT__ck_counts),5);
        bufp->chgIData(oldp+227,(vlSelf->sdio__DOT__u_txframe__DOT__ck_data),32);
        bufp->chgIData(oldp+228,(vlSelf->sdio__DOT__u_txframe__DOT__ck_sreg),32);
        bufp->chgBit(oldp+229,(vlSelf->sdio__DOT__u_txframe__DOT__ck_stop_bit));
        bufp->chgBit(oldp+230,(vlSelf->sdio__DOT__u_txframe__DOT__f_ckstb));
        bufp->chgBit(oldp+231,(vlSelf->sdio__DOT__u_txframe__DOT__f_hlfck));
        bufp->chgSData(oldp+232,(vlSelf->sdio__DOT__u_txframe__DOT__fb_count),15);
        bufp->chgSData(oldp+233,(vlSelf->sdio__DOT__u_txframe__DOT__fd_offset),15);
        bufp->chgSData(oldp+234,(vlSelf->sdio__DOT__u_txframe__DOT__fd_count),15);
        bufp->chgSData(oldp+235,(vlSelf->sdio__DOT__u_txframe__DOT__f_loaded_count),15);
        bufp->chgSData(oldp+236,(vlSelf->sdio__DOT__u_txframe__DOT__fs_count),10);
        bufp->chgSData(oldp+237,(vlSelf->sdio__DOT__u_txframe__DOT__fcrc_count),11);
        bufp->chgBit(oldp+238,(vlSelf->sdio__DOT__u_txframe__DOT__fs_last));
        bufp->chgBit(oldp+239,(((IData)(vlSelf->sdio__DOT__u_txframe__DOT__f_ckstb) 
                                | ((IData)(vlSelf->sdio__DOT__u_txframe__DOT__cfg_ddr) 
                                   & (IData)(vlSelf->sdio__DOT__u_txframe__DOT__f_hlfck)))));
        bufp->chgBit(oldp+240,(vlSelf->sdio__DOT__u_txframe__DOT__fload_xtra));
    }
    bufp->chgBit(oldp+241,(vlSelf->i_clk));
    bufp->chgBit(oldp+242,(vlSelf->i_reset));
    bufp->chgBit(oldp+243,(vlSelf->i_wb_cyc));
    bufp->chgBit(oldp+244,(vlSelf->i_wb_stb));
    bufp->chgBit(oldp+245,(vlSelf->i_wb_we));
    bufp->chgCData(oldp+246,(vlSelf->i_wb_addr),3);
    bufp->chgIData(oldp+247,(vlSelf->i_wb_data),32);
    bufp->chgCData(oldp+248,(vlSelf->i_wb_sel),4);
    bufp->chgBit(oldp+249,(vlSelf->o_wb_stall));
    bufp->chgBit(oldp+250,(vlSelf->o_wb_ack));
    bufp->chgIData(oldp+251,(vlSelf->o_wb_data),32);
    bufp->chgBit(oldp+252,(vlSelf->i_card_detect));
    bufp->chgBit(oldp+253,(vlSelf->o_1p8v));
    bufp->chgBit(oldp+254,(vlSelf->o_int));
    bufp->chgBit(oldp+255,(vlSelf->o_cfg_ddr));
    bufp->chgBit(oldp+256,(vlSelf->o_cfg_ds));
    bufp->chgBit(oldp+257,(vlSelf->o_cfg_dscmd));
    bufp->chgCData(oldp+258,(vlSelf->o_cfg_sample_shift),5);
    bufp->chgCData(oldp+259,(vlSelf->o_sdclk),8);
    bufp->chgBit(oldp+260,(vlSelf->o_cmd_en));
    bufp->chgBit(oldp+261,(vlSelf->o_pp_cmd));
    bufp->chgCData(oldp+262,(vlSelf->o_cmd_data),2);
    bufp->chgBit(oldp+263,(vlSelf->o_data_en));
    bufp->chgBit(oldp+264,(vlSelf->o_pp_data));
    bufp->chgBit(oldp+265,(vlSelf->o_rx_en));
    bufp->chgIData(oldp+266,(vlSelf->o_tx_data),32);
    bufp->chgCData(oldp+267,(vlSelf->i_cmd_strb),2);
    bufp->chgCData(oldp+268,(vlSelf->i_cmd_data),2);
    bufp->chgBit(oldp+269,(vlSelf->i_card_busy));
    bufp->chgCData(oldp+270,(vlSelf->i_rx_strb),2);
    bufp->chgSData(oldp+271,(vlSelf->i_rx_data),16);
    bufp->chgBit(oldp+272,(vlSelf->S_AC_VALID));
    bufp->chgCData(oldp+273,(vlSelf->S_AC_DATA),2);
    bufp->chgBit(oldp+274,(vlSelf->S_AD_VALID));
    bufp->chgIData(oldp+275,(vlSelf->S_AD_DATA),32);
    bufp->chgBit(oldp+276,(vlSelf->sdio__DOT__u_control__DOT__wb_phy_stb));
}

void Vsdio___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsdio___024root__trace_cleanup\n"); );
    // Init
    Vsdio___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsdio___024root*>(voidSelf);
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
}
