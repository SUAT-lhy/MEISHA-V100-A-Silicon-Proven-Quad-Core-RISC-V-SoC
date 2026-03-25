module ResetWrangler( 
  input   auto_in_2_clock,  // from d2d_sub d2d_clock clk_main_clk
  input   auto_in_2_reset,  // pcie lock state
  input   auto_in_1_clock,  // from mig blackbox ui_clk, source is sys clk / clk_main_clk
  input   auto_in_1_reset,  // hard reset | pwr reset
  input   auto_in_0_clock,  // clk_main_clk
  input   auto_in_0_reset, 
  input   auto_in_tile_reset,
  // auto_in_0_reset | auto_in_1_reset | auto_in_2_reset
  // from auto_in_2_clock: d2d_sub d2d_clock clk_main_clk
  output  auto_out_2_reset, 
  // auto_in_0_reset | auto_in_1_reset | auto_in_2_reset
  // from auto_in_1_clock: mig blackbox ui_clk, source is sys clk / clk_main_clk
  output  auto_out_1_reset, 
  output  auto_out_0_clock, // clk_main_clk
  output  auto_out_0_reset,
  output  auto_out_tile_reset
);
  wire  debounce_clock; 
  wire  debounce_reset; 
  wire [12:0] debounce_io_d; 
  wire [12:0] debounce_io_q; 
  wire  debounce_io_en; 
  wire  deglitch_rst; 
  wire  deglitch_clk; 
  wire  deglitch_en; 
  wire  deglitch_q; 
  wire  deglitch_d; 
  wire  ResetCatchAndSync_d3_clock; 
  wire  ResetCatchAndSync_d3_reset; 
  wire  ResetCatchAndSync_d3_io_sync_reset; 
  wire  ResetCatchAndSync_d3_1_clock; 
  wire  ResetCatchAndSync_d3_1_reset; 
  wire  ResetCatchAndSync_d3_1_io_sync_reset; 
  wire  ResetCatchAndSync_d3_2_clock; 
  wire  ResetCatchAndSync_d3_2_reset; 
  wire  ResetCatchAndSync_d3_2_io_sync_reset; 
  wire  _T_21; 
  wire  temp_auto_topMod_reset;

// module moduleName #(
//   parameters
// ) (
//   ports
// );
  
// endmodule

  AsyncResetRegVec_para # (
    .BIT_WIDTH(13)
  ) debounce ( 
    .clock(debounce_clock),
    .reset(debounce_reset),
    .io_d_i(debounce_io_d),
    .io_q_o(debounce_io_q),
    .io_en(debounce_io_en)
  );
AsyncResetReg#(.RESET_VALUE(1)) deglitch ( 
    .rst(deglitch_rst),
    .clk(deglitch_clk),
    .en(deglitch_en),
    .q(deglitch_q),
    .d(deglitch_d)
  );
  ResetCatchAndSync_d3 ResetCatchAndSync_d3 ( 
    .clock(ResetCatchAndSync_d3_clock),
    .reset(ResetCatchAndSync_d3_reset),
    .io_sync_reset(ResetCatchAndSync_d3_io_sync_reset)
  );
  ResetCatchAndSync_d3 ResetCatchAndSync_d3_1 ( 
    .clock(ResetCatchAndSync_d3_1_clock),
    .reset(ResetCatchAndSync_d3_1_reset),
    .io_sync_reset(ResetCatchAndSync_d3_1_io_sync_reset)
  );
  ResetCatchAndSync_d3 ResetCatchAndSync_d3_2 ( 
    .clock(ResetCatchAndSync_d3_2_clock),
    .reset(ResetCatchAndSync_d3_2_reset),
    .io_sync_reset(ResetCatchAndSync_d3_2_io_sync_reset)
  );


  wire        temp_auto_topMod_clock;
  wire        cnt_100;
  wire [12:0] cnt_100_io_q;
  wire [12:0] cnt_100_io_d;
  wire        cnt_100_io_en;
  wire ResetCatchAndSync_d3_topMod_clock;
  wire ResetCatchAndSync_d3_topMod_reset;
  wire auto_out_tile_reset_sync_reset;

  AsyncResetRegVec_para # (
    .BIT_WIDTH(13)
  ) debounce_1 ( 
    .clock(temp_auto_topMod_clock),
    .reset(temp_auto_topMod_reset),
    .io_d_i(cnt_100_io_d),
    .io_q_o(cnt_100_io_q),
    .io_en(cnt_100_io_en)
  );
  wire  deglitch_1_q;
  wire  deglitch_1_d;

AsyncResetReg#(.RESET_VALUE(1)) deglitch_1 ( 
    .rst(temp_auto_topMod_reset),
    .clk(temp_auto_topMod_clock),
    .en(1'b1),
    .q(deglitch_1_q),
    .d(deglitch_1_d)
  );
  
  ResetCatchAndSync_d3 ResetCatchAndSync_d3_5 ( 
    .clock(ResetCatchAndSync_d3_topMod_clock),
    .reset(ResetCatchAndSync_d3_topMod_reset),
    .io_sync_reset(auto_out_tile_reset_sync_reset)
  );

  assign _T_21 = auto_in_0_reset | auto_in_1_reset; 
  assign auto_out_2_reset = ResetCatchAndSync_d3_2_io_sync_reset; 
  assign auto_out_1_reset = ResetCatchAndSync_d3_1_io_sync_reset; 
  assign auto_out_0_clock = auto_in_0_clock; 
  assign auto_out_0_reset = ResetCatchAndSync_d3_io_sync_reset; 
  assign debounce_clock = auto_in_0_clock; 
  assign debounce_reset = _T_21 | auto_in_2_reset; 
  assign debounce_io_d = debounce_io_q + 13'h1; 
  assign debounce_io_en = debounce_io_q != 13'h1388; 
  assign deglitch_rst = _T_21 | auto_in_2_reset; 
  assign deglitch_clk = auto_in_0_clock; 
  assign deglitch_en = 1'h1; 
  assign deglitch_d = debounce_io_q != 13'h1388; 
  assign ResetCatchAndSync_d3_clock = auto_in_0_clock; 
  assign ResetCatchAndSync_d3_reset = deglitch_q; 
  assign ResetCatchAndSync_d3_1_clock = auto_in_1_clock; 
  assign ResetCatchAndSync_d3_1_reset = deglitch_q; 
  assign ResetCatchAndSync_d3_2_clock = auto_in_2_clock; 
  assign ResetCatchAndSync_d3_2_reset = deglitch_q; 
  
/*-------------------------------------------------------*/
  assign temp_auto_topMod_reset = auto_in_tile_reset;

  assign temp_auto_topMod_clock = auto_in_0_clock;
  assign cnt_100_io_d = cnt_100_io_q + 13'd1; 
  assign cnt_100_io_en = cnt_100_io_q != 13'd100; 
  assign auto_out_tile_reset = auto_out_tile_reset_sync_reset;
  assign deglitch_1_d = cnt_100_io_q != 13'd100;
  
  assign ResetCatchAndSync_d3_topMod_clock = auto_in_0_clock;
  assign deglitch_1_d = cnt_100_io_q != 13'd100; 
  assign ResetCatchAndSync_d3_topMod_reset = deglitch_1_q;



endmodule
