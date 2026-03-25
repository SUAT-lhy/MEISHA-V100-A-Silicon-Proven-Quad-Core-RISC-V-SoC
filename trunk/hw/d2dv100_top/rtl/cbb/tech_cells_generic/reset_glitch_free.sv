
module reset_glitch_free #(
    parameter int unsigned DELAY_CYCLE = 16
) (
    input wire i_reset,
    output wire o_reset
);
    

reg  [DELAY_CYCLE-1:0] reset_delay_in;
reg  [DELAY_CYCLE-1:0] or_a1;
wire [DELAY_CYCLE-1:0] reset_delay_out;
wire [DELAY_CYCLE-1:0] or_out;


always @ (*) begin
    reset_delay_in[0] = i_reset;
    or_a1[0] = i_reset;
    for (integer j=1;j<DELAY_CYCLE;j=j+1) begin
        reset_delay_in[j] = reset_delay_out[j-1];
        or_a1[j] = or_out[j-1];
    end
end

assign o_reset = or_out[DELAY_CYCLE-1];

generate
    for (genvar i=0;i<DELAY_CYCLE;i=i+1) begin : GEN_DELAY_BUF

        dont_touch_tc_clk_delay rst_delay (
            .in_i(reset_delay_in[i]),
            .out_o(reset_delay_out[i])
        );

        dont_touch_tc_clk_or2 rst_or2 (
            .clk0_i(or_a1[i]),
            .clk1_i(reset_delay_out[i]),
            .clk_o(or_out[i])
        );

    end
endgenerate



endmodule
