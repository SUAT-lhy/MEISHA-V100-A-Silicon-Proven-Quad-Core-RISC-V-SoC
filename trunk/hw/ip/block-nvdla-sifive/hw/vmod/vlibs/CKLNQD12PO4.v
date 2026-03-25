// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================

// File Name: CKLNQD12PO4.v

module  CKLNQD12PO4 (
	 TE
	,E
	,CP
	,Q
	);

input	 TE ;
input	 E ;
input	 CP ;
output	 Q ;


`ifdef MSTD_CELL_EN  
  `CK_GATE_STD_CELL_DONT_TOUCH u_dont_touch_tc_clk_gating(
    .Q      (Q),
    .E      (E),
    .TE     (TE),
    .CK     (CP)
  );

`else 
reg qd;

always @(negedge CP)
    qd <= TE | E;

assign Q = CP & qd;

`endif
endmodule
