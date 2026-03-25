// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: p_SSYNC3DO_S_PPP.v
module p_SSYNC3DO_S_PPP (
  clk
 ,d
 ,set_
 ,q
 );
//---------------------------------------
//IO DECLARATIONS
input clk ;
input d ;
input set_ ;
output q ;


   `ifdef MSTD_CELL_EN

        reg q,d1,d0;
        always @(posedge clk or negedge set_)
        begin
            if(~set_)
                {q,d1,d0} <= 3'b111;
            else
                {q,d1,d0} <= {d1,d0,d};
        end
        
   `elsif USE_MACRO_MSTD_CELL
    localparam DELAY_CYCLE = 3;
    localparam RESET_VALUE = 1;

      wire q_delay[DELAY_CYCLE:0];
      reg q;
   
      assign q_delay[0] = d;
      generate
         for (genvar i = 0; i < DELAY_CYCLE; i = i+1) begin : DELAY_GEN
               // QBDFERBNLBRMX0P4
               `REG_ASYNC_RESET_ENABLE_DONT_TOUCH u_dont_touch_AsyncResetReg (
                  .Q      (q_delay[i+1]),
                  .D      (q_delay[i]),
                  .CK     (clk),
                  .RB     (set_),
                  .EB     (1'b0)
               );
         end
      endgenerate

         
      always @(posedge clk or negedge set_) begin
         if (~set_) begin
            q <= RESET_VALUE;
         end
         else begin
            q <= q_delay[DELAY_CYCLE];
         end
      end


   `else

        reg q,d1,d0;
        always @(posedge clk or negedge set_)
        begin
            if(~set_)
                {q,d1,d0} <= 3'b111;
            else
                {q,d1,d0} <= {d1,d0,d};
        end
    `endif
endmodule
