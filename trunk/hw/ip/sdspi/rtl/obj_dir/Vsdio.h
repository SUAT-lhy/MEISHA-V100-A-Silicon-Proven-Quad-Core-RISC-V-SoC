// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary model header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef VERILATED_VSDIO_H_
#define VERILATED_VSDIO_H_  // guard

#include "verilated.h"

class Vsdio__Syms;
class Vsdio___024root;
class VerilatedVcdC;

// This class is the main interface to the Verilated model
class alignas(VL_CACHE_LINE_BYTES) Vsdio VL_NOT_FINAL : public VerilatedModel {
  private:
    // Symbol table holding complete model state (owned by this class)
    Vsdio__Syms* const vlSymsp;

  public:

    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(&i_clk,0,0);
    VL_IN8(&i_reset,0,0);
    VL_IN8(&i_wb_cyc,0,0);
    VL_IN8(&i_wb_stb,0,0);
    VL_IN8(&i_wb_we,0,0);
    VL_IN8(&i_wb_addr,2,0);
    VL_IN8(&i_wb_sel,3,0);
    VL_OUT8(&o_wb_stall,0,0);
    VL_OUT8(&o_wb_ack,0,0);
    VL_IN8(&i_card_detect,0,0);
    VL_OUT8(&o_1p8v,0,0);
    VL_OUT8(&o_int,0,0);
    VL_OUT8(&o_cfg_ddr,0,0);
    VL_OUT8(&o_cfg_ds,0,0);
    VL_OUT8(&o_cfg_dscmd,0,0);
    VL_OUT8(&o_cfg_sample_shift,4,0);
    VL_OUT8(&o_sdclk,7,0);
    VL_OUT8(&o_cmd_en,0,0);
    VL_OUT8(&o_pp_cmd,0,0);
    VL_OUT8(&o_cmd_data,1,0);
    VL_OUT8(&o_data_en,0,0);
    VL_OUT8(&o_pp_data,0,0);
    VL_OUT8(&o_rx_en,0,0);
    VL_IN8(&i_cmd_strb,1,0);
    VL_IN8(&i_cmd_data,1,0);
    VL_IN8(&i_card_busy,0,0);
    VL_IN8(&i_rx_strb,1,0);
    VL_IN8(&S_AC_VALID,0,0);
    VL_IN8(&S_AC_DATA,1,0);
    VL_IN8(&S_AD_VALID,0,0);
    VL_IN16(&i_rx_data,15,0);
    VL_IN(&i_wb_data,31,0);
    VL_OUT(&o_wb_data,31,0);
    VL_OUT(&o_tx_data,31,0);
    VL_IN(&S_AD_DATA,31,0);

    // CELLS
    // Public to allow access to /* verilator public */ items.
    // Otherwise the application code can consider these internals.

    // Root instance pointer to allow access to model internals,
    // including inlined /* verilator public_flat_* */ items.
    Vsdio___024root* const rootp;

    // CONSTRUCTORS
    /// Construct the model; called by application code
    /// If contextp is null, then the model will use the default global context
    /// If name is "", then makes a wrapper with a
    /// single model invisible with respect to DPI scope names.
    explicit Vsdio(VerilatedContext* contextp, const char* name = "TOP");
    explicit Vsdio(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    virtual ~Vsdio();
  private:
    VL_UNCOPYABLE(Vsdio);  ///< Copying not allowed

  public:
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval() { eval_step(); }
    /// Evaluate when calling multiple units/models per time step.
    void eval_step();
    /// Evaluate at end of a timestep for tracing, when using eval_step().
    /// Application must call after all eval() and before time changes.
    void eval_end_step() {}
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    /// Are there scheduled events to handle?
    bool eventsPending();
    /// Returns time at next time slot. Aborts if !eventsPending()
    uint64_t nextTimeSlot();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    /// Retrieve name of this model instance (as passed to constructor).
    const char* name() const;

    // Abstract methods from VerilatedModel
    const char* hierName() const override final;
    const char* modelName() const override final;
    unsigned threads() const override final;
    /// Prepare for cloning the model at the process level (e.g. fork in Linux)
    /// Release necessary resources. Called before cloning.
    void prepareClone() const;
    /// Re-init after cloning the model at the process level (e.g. fork in Linux)
    /// Re-allocate necessary resources. Called after cloning.
    void atClone() const;
    std::unique_ptr<VerilatedTraceConfig> traceConfig() const override final;
};

#endif  // guard
