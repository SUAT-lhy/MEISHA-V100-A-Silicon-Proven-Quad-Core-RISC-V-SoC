//-----------------------------------------------------------------------------
// Title         : Dynamic Integer Clock Divider
//-----------------------------------------------------------------------------
// File          : clk_int_div_dymanic.sv
// Author        : Manuel Eggimann  <meggimann@iis.ee.ethz.ch>
// Created       : 08.05.2023
//-----------------------------------------------------------------------------

module clk_int_div_dymanic #(
  parameter int unsigned DIV_VALUE = 1,
  parameter bit ENABLE_CLOCK_IN_RESET = 1'b1
) (
  input logic  clk_i,
  input logic  rst_ni,
  input logic  en_i,
  input logic  test_mode_en_i,
  output logic clk_o
);
`ifndef SYNTHESIS
  if (DIV_VALUE == 0) begin : gen_elab_error
    $error("DIV_VALUE must be strictly larger than 0.");
  end
`endif

  localparam int unsigned DivValueWidth = $clog2(DIV_VALUE+1);

  logic [DivValueWidth-1:0] div_value;
  assign div_value = DIV_VALUE;

  clk_int_div #(
    .DIV_VALUE_WIDTH       ( DivValueWidth         ),
    .DEFAULT_DIV_VALUE     ( DIV_VALUE             ),
    .ENABLE_CLOCK_IN_RESET ( ENABLE_CLOCK_IN_RESET )
  ) i_clk_int_div (
    .clk_i        (clk_i),
    .rst_ni       (rst_ni),
    .en_i         (en_i),
    .test_mode_en_i(test_mode_en_i),
    .div_i        ( div_value ),
    .div_valid_i  ( 1'b0      ),
    .div_ready_o  (           ),
    .clk_o        (clk_o      ),
    .cycl_count_o (           )
  );

endmodule
