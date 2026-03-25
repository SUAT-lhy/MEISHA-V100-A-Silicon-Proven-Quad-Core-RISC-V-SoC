// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: p_SSYNC3DO_C_PPP.v
module p_SSYNC3DO_C_PPP (
  clk
 ,d
 ,clr_
 ,q
 );
//---------------------------------------
//IO DECLARATIONS
input clk ;
input d ;
input clr_ ;
output q ;
reg q,d1,d0;

   `ifdef MSTD_CELL_EN
    localparam DELAY_CYCLE = 3;
    localparam RESET_VALUE = 0;

      wire q_delay[DELAY_CYCLE:0];
   
      assign q_delay[0] = d;
      generate
         for (genvar i = 0; i < DELAY_CYCLE; i = i+1) begin : DELAY_GEN
            begin
               // QBDFERBNLBRMX0P4   QBDFERBNLHHMX0P4
               `REG_ASYNC_RESET_ENABLE_DONT_TOUCH u_dont_touch_AsyncResetReg (
                  .Q      (q_delay[i+1]),
                  .D      (q_delay[i]),
                  .CK     (clk),
                  .RB     (clr_),
                  .EB     (1'b0)
               );
            end
         end
         
            always_comb begin : GEN_RST_VALUE_0
               q = q_delay[DELAY_CYCLE];
            end

      endgenerate

   `else

        always @(posedge clk or negedge clr_)
        begin
            if(~clr_)
                {q,d1,d0} <= 3'd0;
            else
                {q,d1,d0} <= {d1,d0,d};
        end
    `endif

endmodule
