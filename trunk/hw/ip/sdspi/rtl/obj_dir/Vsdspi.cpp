// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vsdspi__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

Vsdspi::Vsdspi(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vsdspi__Syms(contextp(), _vcname__, this)}
    , i_clk{vlSymsp->TOP.i_clk}
    , i_sd_reset{vlSymsp->TOP.i_sd_reset}
    , i_wb_cyc{vlSymsp->TOP.i_wb_cyc}
    , i_wb_stb{vlSymsp->TOP.i_wb_stb}
    , i_wb_we{vlSymsp->TOP.i_wb_we}
    , i_wb_addr{vlSymsp->TOP.i_wb_addr}
    , i_wb_sel{vlSymsp->TOP.i_wb_sel}
    , o_wb_stall{vlSymsp->TOP.o_wb_stall}
    , o_wb_ack{vlSymsp->TOP.o_wb_ack}
    , o_cs_n{vlSymsp->TOP.o_cs_n}
    , o_sck{vlSymsp->TOP.o_sck}
    , o_mosi{vlSymsp->TOP.o_mosi}
    , i_miso{vlSymsp->TOP.i_miso}
    , i_card_detect{vlSymsp->TOP.i_card_detect}
    , o_int{vlSymsp->TOP.o_int}
    , i_bus_grant{vlSymsp->TOP.i_bus_grant}
    , i_wb_data{vlSymsp->TOP.i_wb_data}
    , o_wb_data{vlSymsp->TOP.o_wb_data}
    , o_debug{vlSymsp->TOP.o_debug}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vsdspi::Vsdspi(const char* _vcname__)
    : Vsdspi(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vsdspi::~Vsdspi() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vsdspi___024root___eval_debug_assertions(Vsdspi___024root* vlSelf);
#endif  // VL_DEBUG
void Vsdspi___024root___eval_static(Vsdspi___024root* vlSelf);
void Vsdspi___024root___eval_initial(Vsdspi___024root* vlSelf);
void Vsdspi___024root___eval_settle(Vsdspi___024root* vlSelf);
void Vsdspi___024root___eval(Vsdspi___024root* vlSelf);

void Vsdspi::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vsdspi::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vsdspi___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vsdspi___024root___eval_static(&(vlSymsp->TOP));
        Vsdspi___024root___eval_initial(&(vlSymsp->TOP));
        Vsdspi___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vsdspi___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vsdspi::eventsPending() { return false; }

uint64_t Vsdspi::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vsdspi::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vsdspi___024root___eval_final(Vsdspi___024root* vlSelf);

VL_ATTR_COLD void Vsdspi::final() {
    Vsdspi___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vsdspi::hierName() const { return vlSymsp->name(); }
const char* Vsdspi::modelName() const { return "Vsdspi"; }
unsigned Vsdspi::threads() const { return 1; }
void Vsdspi::prepareClone() const { contextp()->prepareClone(); }
void Vsdspi::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> Vsdspi::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vsdspi___024root__trace_decl_types(VerilatedVcd* tracep);

void Vsdspi___024root__trace_init_top(Vsdspi___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vsdspi___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsdspi___024root*>(voidSelf);
    Vsdspi__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    Vsdspi___024root__trace_decl_types(tracep);
    Vsdspi___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vsdspi___024root__trace_register(Vsdspi___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vsdspi::trace(VerilatedVcdC* tfp, int levels, int options) {
    if (tfp->isOpen()) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vsdspi::trace()' shall not be called after 'VerilatedVcdC::open()'.");
    }
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addModel(this);
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vsdspi___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}
