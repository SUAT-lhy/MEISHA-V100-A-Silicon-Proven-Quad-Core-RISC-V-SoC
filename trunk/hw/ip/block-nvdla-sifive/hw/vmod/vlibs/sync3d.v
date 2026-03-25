// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: sync3d.v
module sync3d ( d, clk, q);
input d, clk;
output q;
`ifdef MSTD_CELL_EN
 AsyncResetReg #(.RESET_VALUE(0)) u_dont_touch_sync3d ( 
    .rst(1'b1),
    .clk(clk),
    .en(1'b1),
    .q(q),
    .d(d)
  );
`else
    p_SSYNC3DO NV_GENERIC_CELL( .d(d), .clk(clk), .q(q) );
`endif
// synopsys dc_script_begin
// synopsys dc_script_end
//g2c if {[find / -null_ok -subdesign sync3d] != {} } { set_attr preserve 1 [find / -subdesign sync3d] }
endmodule
