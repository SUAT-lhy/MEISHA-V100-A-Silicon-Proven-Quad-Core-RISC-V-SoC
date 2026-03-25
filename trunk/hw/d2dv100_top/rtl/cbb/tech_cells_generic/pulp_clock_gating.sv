
// Description: Behavioral model of an integrated clock-gating cell (ICG)
module pulp_clock_gating (
   input  logic clk_i,
   input  logic en_i,
   input  logic test_en_i,
   output logic clk_o
);

  dont_touch_tc_clk_gating i_tc_clk_gating (
     .clk_i,
     .en_i,
     .test_en_i,
     .clk_o
  );

endmodule