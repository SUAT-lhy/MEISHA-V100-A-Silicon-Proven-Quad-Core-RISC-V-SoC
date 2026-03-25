module ResetCatchAndSync_d3( 
  input   clock, 
  input   reset, 
  output  io_sync_reset 
);
  wire  AsyncResetSynchronizerShiftReg_w1_d3_i0_clock; 
  wire  AsyncResetSynchronizerShiftReg_w1_d3_i0_reset; 
  wire  AsyncResetSynchronizerShiftReg_w1_d3_i0_io_d; 
  wire  AsyncResetSynchronizerShiftReg_w1_d3_i0_io_q; 
  wire  _T_7; 
  AsyncResetSynchronizerShiftReg_w1_d3_i0 AsyncResetSynchronizerShiftReg_w1_d3_i0 ( 
    .clock(AsyncResetSynchronizerShiftReg_w1_d3_i0_clock),
    .reset(AsyncResetSynchronizerShiftReg_w1_d3_i0_reset),
    .io_d(AsyncResetSynchronizerShiftReg_w1_d3_i0_io_d),
    .io_q(AsyncResetSynchronizerShiftReg_w1_d3_i0_io_q)
  );
  assign _T_7 = AsyncResetSynchronizerShiftReg_w1_d3_i0_io_q; 
  assign io_sync_reset = ~ _T_7; 
  assign AsyncResetSynchronizerShiftReg_w1_d3_i0_clock = clock; 
  assign AsyncResetSynchronizerShiftReg_w1_d3_i0_reset = reset; 
  assign AsyncResetSynchronizerShiftReg_w1_d3_i0_io_d = 1'h1; 
endmodule
