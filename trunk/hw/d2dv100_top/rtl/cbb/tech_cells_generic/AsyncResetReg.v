`ifndef AsyncResetReg__SV
`define AsyncResetReg__SV

module p_SSYNC3DO_S_P#(parameter RESET_VALUE = 1, parameter DELAY_CYCLE = 1) (
  clk
 ,d
 ,en
 ,rst
 ,q
 );
//---------------------------------------
//IO DECLARATIONS
input clk ;
input d ;
input  wire en;
input rst ;
output q ;

        reg q;

   `ifndef SYNTHESIS
      initial begin
         // for check not in 0ns, maybe value is other value
         #10ns;
         if (RESET_VALUE == 0) begin
            $fatal("Warning: RESET_VALUE is illegal (instance %m)");
            //$finish;
         end
      end
   `endif
        always @(posedge clk or posedge rst)
        begin
            if(rst)
                {q} <= 1'b1;
            else if (en) 
                {q} <= {d};
        end
endmodule


module AsyncResetReg#(parameter RESET_VALUE = 0, parameter DELAY_CYCLE = 1)(d, q, en, clk, rst);

   input  wire d;
   output reg  q;
   input  wire en;
   input  wire clk;
   input  wire rst;


   `ifdef MSTD_CELL_EN

      wire q_delay[DELAY_CYCLE:0];
      reg q_delay_for_reset_value_1;
   `ifndef SYNTHESIS
      initial begin
         // for check not in 0ns, maybe value is other value
         #10ns;
         if (RESET_VALUE == 1) begin
            $fatal("Warning: RESET_VALUE is illegal (instance %m)");
            //$finish;
         end
      end
   `endif
      assign q_delay[0] = d;
      generate
         for (genvar i = 0; i < DELAY_CYCLE; i = i+1) begin : DELAY_GEN
            if(RESET_VALUE == 1) begin : RESET_VALUE_1
               // QBDFERBNLBRMX0P4
               `REG_ASYNC_RESET_ENABLE_DONT_TOUCH u_dont_touch_AsyncResetReg (
                  .Q      (q_delay[i+1]),
                  .D      (q_delay[i]),
                  .CK     (clk),
                  .RB     (~rst),
                  .EB     (~en)
               );
            end
            else begin : RESET_VALUE_0
               // QBDFERBNLBRMX0P4   QBDFERBNLHHMX0P4
               `REG_ASYNC_RESET_ENABLE_DONT_TOUCH u_dont_touch_AsyncResetReg (
                  .Q      (q_delay[i+1]),
                  .D      (q_delay[i]),
                  .CK     (clk),
                  .RB     (~rst),
                  .EB     (~en)
               );
            end
         end
         
         if(RESET_VALUE == 1) begin  : RESET_VALUE_1
            always @(*) begin : GEN_RST_VALUE_1
               q = q_delay_for_reset_value_1;
            end
         end
         else begin  : RESET_VALUE_0
            always_comb begin : GEN_RST_VALUE_0
               q = q_delay[DELAY_CYCLE];
            end
         end

      endgenerate

         
      always @(posedge clk or posedge rst) begin
         if (rst) begin
            q_delay_for_reset_value_1 <= RESET_VALUE;
         end
         else if (en) begin
            q_delay_for_reset_value_1 <= q_delay[DELAY_CYCLE];
         end
      end


   `else
      always @(posedge clk or posedge rst) begin

         if (rst) begin
            q <= RESET_VALUE;
         end else if (en) begin
            q <= d;
         end
      end
   `endif 

endmodule // AsyncResetReg

`endif
