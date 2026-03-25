// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vsdio__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

Vsdio::Vsdio(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vsdio__Syms(contextp(), _vcname__, this)}
    , i_clk{vlSymsp->TOP.i_clk}
    , i_reset{vlSymsp->TOP.i_reset}
    , i_wb_cyc{vlSymsp->TOP.i_wb_cyc}
    , i_wb_stb{vlSymsp->TOP.i_wb_stb}
    , i_wb_we{vlSymsp->TOP.i_wb_we}
    , i_wb_addr{vlSymsp->TOP.i_wb_addr}
    , i_wb_sel{vlSymsp->TOP.i_wb_sel}
    , o_wb_stall{vlSymsp->TOP.o_wb_stall}
    , o_wb_ack{vlSymsp->TOP.o_wb_ack}
    , i_card_detect{vlSymsp->TOP.i_card_detect}
    , o_1p8v{vlSymsp->TOP.o_1p8v}
    , o_int{vlSymsp->TOP.o_int}
    , o_cfg_ddr{vlSymsp->TOP.o_cfg_ddr}
    , o_cfg_ds{vlSymsp->TOP.o_cfg_ds}
    , o_cfg_dscmd{vlSymsp->TOP.o_cfg_dscmd}
    , o_cfg_sample_shift{vlSymsp->TOP.o_cfg_sample_shift}
    , o_sdclk{vlSymsp->TOP.o_sdclk}
    , o_cmd_en{vlSymsp->TOP.o_cmd_en}
    , o_pp_cmd{vlSymsp->TOP.o_pp_cmd}
    , o_cmd_data{vlSymsp->TOP.o_cmd_data}
    , o_data_en{vlSymsp->TOP.o_data_en}
    , o_pp_data{vlSymsp->TOP.o_pp_data}
    , o_rx_en{vlSymsp->TOP.o_rx_en}
    , i_cmd_strb{vlSymsp->TOP.i_cmd_strb}
    , i_cmd_data{vlSymsp->TOP.i_cmd_data}
    , i_card_busy{vlSymsp->TOP.i_card_busy}
    , i_rx_strb{vlSymsp->TOP.i_rx_strb}
    , S_AC_VALID{vlSymsp->TOP.S_AC_VALID}
    , S_AC_DATA{vlSymsp->TOP.S_AC_DATA}
    , S_AD_VALID{vlSymsp->TOP.S_AD_VALID}
    , i_rx_data{vlSymsp->TOP.i_rx_data}
    , i_wb_data{vlSymsp->TOP.i_wb_data}
    , o_wb_data{vlSymsp->TOP.o_wb_data}
    , o_tx_data{vlSymsp->TOP.o_tx_data}
    , S_AD_DATA{vlSymsp->TOP.S_AD_DATA}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vsdio::Vsdio(const char* _vcname__)
    : Vsdio(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vsdio::~Vsdio() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vsdio___024root___eval_debug_assertions(Vsdio___024root* vlSelf);
#endif  // VL_DEBUG
void Vsdio___024root___eval_static(Vsdio___024root* vlSelf);
void Vsdio___024root___eval_initial(Vsdio___024root* vlSelf);
void Vsdio___024root___eval_settle(Vsdio___024root* vlSelf);
void Vsdio___024root___eval(Vsdio___024root* vlSelf);

void Vsdio::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vsdio::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vsdio___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vsdio___024root___eval_static(&(vlSymsp->TOP));
        Vsdio___024root___eval_initial(&(vlSymsp->TOP));
        Vsdio___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vsdio___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vsdio::eventsPending() { return false; }

uint64_t Vsdio::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vsdio::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vsdio___024root___eval_final(Vsdio___024root* vlSelf);

VL_ATTR_COLD void Vsdio::final() {
    Vsdio___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vsdio::hierName() const { return vlSymsp->name(); }
const char* Vsdio::modelName() const { return "Vsdio"; }
unsigned Vsdio::threads() const { return 1; }
void Vsdio::prepareClone() const { contextp()->prepareClone(); }
void Vsdio::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> Vsdio::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vsdio___024root__trace_decl_types(VerilatedVcd* tracep);

void Vsdio___024root__trace_init_top(Vsdio___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vsdio___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsdio___024root*>(voidSelf);
    Vsdio__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    Vsdio___024root__trace_decl_types(tracep);
    Vsdio___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vsdio___024root__trace_register(Vsdio___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vsdio::trace(VerilatedVcdC* tfp, int levels, int options) {
    if (tfp->isOpen()) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vsdio::trace()' shall not be called after 'VerilatedVcdC::open()'.");
    }
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addModel(this);
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vsdio___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}
