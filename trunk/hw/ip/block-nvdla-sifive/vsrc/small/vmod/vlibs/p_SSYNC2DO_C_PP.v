// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: p_SSYNC2DO_C_PP.v
module p_SSYNC2DO_C_PP (
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


   `ifdef MSTD_CELL_EN
    localparam DELAY_CYCLE = 2;
    localparam RESET_VALUE = 0;

      wire q_delay[DELAY_CYCLE:0];
      reg q;
   
      assign q_delay[0] = d;
      generate
         for (genvar i = 0; i < DELAY_CYCLE; i = i+1) begin : DELAY_GEN
               // QBDFERBNLBRMX0P4   QBDFERBNLHHMX0P4
               `REG_ASYNC_RESET_ENABLE_DONT_TOUCH u_dont_touch_AsyncResetReg (
                  .Q      (q_delay[i+1]),
                  .D      (q_delay[i]),
                  .CK     (clk),
                  .RB     (clr_),
                  .EB     (1'b0)
               );
         end
         
      endgenerate

         
      always @(posedge clk or negedge clr_) begin
         if (~clr_) begin
            q <= RESET_VALUE;
         end
         else begin
            q <= q_delay[DELAY_CYCLE];
         end
      end


   `else

        reg q,d0;
        always @(posedge clk or negedge clr_)
        begin
            if(~clr_)
                {q,d0} <= 2'd0;
            else
                {q,d0} <= {d0,d};
        end


   `endif 



endmodule
