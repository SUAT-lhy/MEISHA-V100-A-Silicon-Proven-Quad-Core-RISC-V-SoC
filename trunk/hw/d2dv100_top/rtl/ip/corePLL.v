
module corePLL #
(
    // Width of pll cfg parameter width
    parameter PLL_CFG_DATA_WIDTH = 96
)
(
    output  wire  locked,
    output  wire  [31:0] pll_state,
    input   wire  [31:0] use_which_clk,
    input   wire  [PLL_CFG_DATA_WIDTH-1:0] pll_cfg,
    input   wire    reset_n, // input hardreset and pwr reset
    output  wire    clk_out_cpu,
    output  wire    clk_out_main,
    output  wire    clk_out_chiplink,
    output  wire    clk_out_ddr,
    input   wire    clk_in1   // input ref clk
);

    localparam MAX_DIV_VALUE = 30;  // 1G/20 = 50M
    
    localparam MAX_DIV_CNT = MAX_DIV_VALUE/2;
    localparam int unsigned DIV_SelWidth = $clog2(MAX_DIV_CNT+MAX_DIV_CNT+2);

    wire pll_output_clk_cpu, pll_output_clk_main, pll_output_clk_chiplink, pll_output_clk_ddr;
    wire testout;
    
    wire [MAX_DIV_CNT-1:0] clk_out_cpu_temp;
    wire [MAX_DIV_CNT-1:0] clk_out_main_temp;
    wire [MAX_DIV_CNT-1:0] clk_out_chiplink_temp;
    wire [MAX_DIV_CNT-1:0] clk_out_ddr_temp;
    wire [MAX_DIV_CNT-1:0] clk_out_ref_temp;

    wire clk_out_cpu_div_sel;
    wire clk_out_main_div_sel;
    wire clk_out_chiplink_div_sel;
    wire clk_out_ddr_div_sel;

    wire [DIV_SelWidth-1:0] pll_cpu_cfg;
    wire [DIV_SelWidth-1:0] pll_main_cfg;
    wire [DIV_SelWidth-1:0] pll_chiplink_cfg;
    wire [DIV_SelWidth-1:0] pll_ddr_cfg;

    reg [31:0]  use_which_clk_reg;
    reg  [31:0] pll_cfg_reg_frac;
    reg  [31:0] pll_cfg_reg_postdiv;
    reg  [31:0] pll_cfg_reg_mix;

    wire use_ref_clk = (use_which_clk_reg[4:0] == 5'b0) ? 1'b0 : 1'b1;

    // for first start , avoid pll is not lock
    dont_touch_tc_clk_mux2 i_cpu_ref_clk_mux(
      .clk0_i(clk_in1),
      .clk1_i(clk_out_cpu_div_sel),
      .clk_sel_i(use_ref_clk),
      .clk_o(clk_out_cpu)
    );

    dont_touch_tc_clk_mux2 i_cmn_ref_clk_mux(
      .clk0_i(clk_in1),
      .clk1_i(clk_out_main_div_sel),
      .clk_sel_i(use_ref_clk),
      .clk_o(clk_out_main)
    );

    dont_touch_tc_clk_mux2 i_chiplink_ref_clk_mux(
      .clk0_i(clk_in1),
      .clk1_i(clk_out_chiplink_div_sel),
      .clk_sel_i(use_ref_clk),
      .clk_o(clk_out_chiplink)
    );

    dont_touch_tc_clk_mux2 i_ddr_ref_clk_mux(
      .clk0_i(clk_in1),
      .clk1_i(clk_out_ddr_div_sel),
      .clk_sel_i(use_ref_clk),
      .clk_o(clk_out_ddr)
    );
    

    always @(posedge clk_in1 or negedge reset_n) begin
        if(!reset_n) begin
            use_which_clk_reg[31:0] <= `PLL_DEFAULT_VALUE_USE_WHICH_PLL_CLK;
        end
        else begin
            use_which_clk_reg[31:0] <= use_which_clk;
        end
    end
/*

STARTING THE PLL
The PLL is designed to be self-healing and should return to normal operation from any state.
However, in order to assure consistent and deterministic power up operation it is recommended
that the following initiation sequence be followed:
1. Power on PLL;
2. Enable reference clock;
3. Assert pd=1;
4. Set divider control bits;
5. Release pd, pd=0 after no less than 1μs.

Integer Mode
If you want PLL to work in integer mode, set register values as shown in Table 4.
The frequency of outputs can be figured out as below.
Fvco = Fref×NI÷M
NI is integer frequency dividing ratio of feedback divider, set by fbdiv[11:0] , NI = 20….4095
M is frequency dividing ratio of pre-divider, set by prediv[4:0],M = 1, 2 … 31.
Fclko0 = Fvco÷Q0_0÷Q1_0
Q0_0 is frequency dividing ratio of postdiv0_0, set by postdiv0_0[2:0], Q0_0= 1, 2 …, 8;
Q1_0 is frequency dividing ratio of postdiv1_0, set by postdiv1_0[2:0], Q1_0= 1, 2 …, 8;
Calculation method of Fclko1 and Fclko2 is same as Fclko0.


5.2 Fraction Mode
If you want PLL to work in fraction mode, set register values as shown in Table 5.
dacpd 1’b0
dsmpd 1’b0
The frequency of outputs can be figured out as below.
Fvco = Fref×(NI+NF)÷M
NI is integer frequency dividing ratio of feedback divider, set by fbdiv[11:0], NI = 20 … 4095.
NF is fractional frequency dividing ratio, set by frac[23:0]. NF =frac[23:0]/2^24= 0~0.99999994.
M is frequency dividing ratio of pre-divider, set by prediv[4:0], M = 1, 2 … 31.
Fclko0 = Fvco÷Q0_0÷Q1_0
Q0_0 is frequency dividing ratio of postdiv0_0, set by postdiv0_0[2:0], Q0_0= 1, 2 …,8;
Q1_0 is frequency dividing ratio of postdiv1_0, set by postdiv1_0[2:0], Q1_0= 1, 2 …,8;
Calculation method of Fclko1 and Fclko2 is same as Fclko0.
*/
    
    always @(posedge clk_in1 or negedge reset_n) begin
        if(!reset_n) begin
            
            pll_cfg_reg_frac[31:29] <= 3'b0; 

            pll_cfg_reg_frac[4:0]   <= `PLL_DEFAULT_VALUE_prediv; // prediv
            pll_cfg_reg_frac[28:5]  <= `PLL_DEFAULT_VALUE_frac; // frac

            pll_cfg_reg_postdiv[31:30] <= 2'b0; 
            
            pll_cfg_reg_postdiv[29:18] <= `PLL_DEFAULT_VALUE_fbdiv; //  .fbdiv          
            pll_cfg_reg_postdiv[17:15] <= `PLL_DEFAULT_VALUE_postdiv0_0; //  .postdiv0_0      
            pll_cfg_reg_postdiv[14:12] <= `PLL_DEFAULT_VALUE_postdiv1_0; //  .postdiv1_0            
            pll_cfg_reg_postdiv[11:9] <= `PLL_DEFAULT_VALUE_postdiv0_1; //  .postdiv0_1            
            pll_cfg_reg_postdiv[8:6]  <= `PLL_DEFAULT_VALUE_postdiv1_1; // .postdiv1_1       
            pll_cfg_reg_postdiv[5:3]  <= `PLL_DEFAULT_VALUE_postdiv0_2; // .postdiv0_2            
            pll_cfg_reg_postdiv[2:0]  <= `PLL_DEFAULT_VALUE_postdiv1_2; //  .postdiv1_2 

            pll_cfg_reg_mix[17:0] <= 20'b0; 
            
            pll_cfg_reg_mix[31] <= `PLL_DEFAULT_VALUE_pd; //  pd  default powerdown
            pll_cfg_reg_mix[30] <= `PLL_DEFAULT_VALUE_dacpd; // dacpd  default integer mode
            pll_cfg_reg_mix[29] <=  `PLL_DEFAULT_VALUE_dsmpd; // dsmpd
            pll_cfg_reg_mix[28] <= 1'b0; // testen
            pll_cfg_reg_mix[27:26] <= 2'b0; // testsel
            pll_cfg_reg_mix[25:23] <= `PLL_DEFAULT_VALUE_cpi_bias; // cpi_bias
            pll_cfg_reg_mix[22:20] <= `PLL_DEFAULT_VALUE_cpp_bias; // cpp_bias
            pll_cfg_reg_mix[19:18] <= `PLL_DEFAULT_VALUE_gvco_bias;  // gvco_bias

        end
        else begin
            pll_cfg_reg_frac[31:0] <= pll_cfg[31:0];
            pll_cfg_reg_postdiv[31:0] <= pll_cfg[63:32];
            pll_cfg_reg_mix[31:0] <= pll_cfg[95:64];
        end
    end


    assign pll_cpu_cfg[DIV_SelWidth-1:0] = use_which_clk_reg[0+:DIV_SelWidth];
    assign pll_main_cfg[DIV_SelWidth-1:0] = use_which_clk_reg[5+:DIV_SelWidth];
    assign pll_chiplink_cfg[DIV_SelWidth-1:0] = use_which_clk_reg[10+:DIV_SelWidth];
    assign pll_ddr_cfg[DIV_SelWidth-1:0] = use_which_clk_reg[15+:DIV_SelWidth];


  `ifdef DONNOT_USE_PLL
    // pll wrapper
    
    reg pll_output_clk;

    initial begin
      pll_output_clk = 1'b0;
      forever begin
        #2ns pll_output_clk <= ~pll_output_clk;  // 250MHz
      end
    end
    
    // wire pll_output_clk_cpu, pll_output_clk_main, pll_output_clk_chiplink, pll_output_clk_ddr;
    assign pll_output_clk_cpu = pll_output_clk;
    assign pll_output_clk_main = pll_output_clk;
    assign pll_output_clk_chiplink = pll_output_clk;
    assign pll_output_clk_ddr = pll_output_clk;
    
    assign locked = 1'h0;
    assign testout = 1'h0;

  `else
    INNO_FNPLL_TOP #(
      // .REFCLK_FREQ                        (REFCLK_FREQ)
      ) u0 (
      //// Inputs
      .refclk                             (clk_in1),

      .prediv                             (pll_cfg_reg_frac[4:0]),
      .frac                               (pll_cfg_reg_frac[28:5]),

      .fbdiv                              (pll_cfg_reg_postdiv[29:18]),
      .postdiv0_0                         (pll_cfg_reg_postdiv[17:15]),
      .postdiv1_0                         (pll_cfg_reg_postdiv[14:12]),
      .postdiv0_1                         (pll_cfg_reg_postdiv[11:9]),
      .postdiv1_1                         (pll_cfg_reg_postdiv[8:6]),
      .postdiv0_2                         (pll_cfg_reg_postdiv[5:3]),
      .postdiv1_2                         (pll_cfg_reg_postdiv[2:0]),

      .pd                                 (pll_cfg_reg_mix[31]),
      .dacpd                              (pll_cfg_reg_mix[30]),
      .dsmpd                              (pll_cfg_reg_mix[29]),
      .testen                             (pll_cfg_reg_mix[28]),
      .testsel                            (pll_cfg_reg_mix[27:26]),
      .cpi_bias                           (pll_cfg_reg_mix[25:23]),
      .cpp_bias                           (pll_cfg_reg_mix[24:22]),
      .gvco_bias                          (pll_cfg_reg_mix[21:20]),
      
      .clko0                              (pll_output_clk_cpu),
      .clko1                              (pll_output_clk_main),
      .clko2                              (pll_output_clk_chiplink),
      .testout                            (testout),
      .lock                               (locked)
      );
  `endif
    assign pll_output_clk_ddr = pll_output_clk_chiplink;
  // TBD 
    assign pll_state[0] = locked;
    assign pll_state[1] = testout;
    assign pll_state[31:2] = 30'h0;



  clk_mux_glitch_free #(
    .NUM_INPUTS(MAX_DIV_CNT+2+MAX_DIV_CNT)
  ) i_clk_out_cpu_mux (
    .clks_i       ( {clk_out_ref_temp[MAX_DIV_CNT-1:0], clk_out_cpu_temp[MAX_DIV_CNT-1:0], pll_output_clk_cpu, clk_in1}       ),
    .test_clk_i   ( 1'b0           ),
    .test_en_i    ( 1'b0           ),
    .async_rstn_i ( reset_n         ),
    .async_sel_i  ( pll_cpu_cfg),
    .clk_o        ( clk_out_cpu_div_sel )
  ); 

  clk_mux_glitch_free #(
    .NUM_INPUTS(MAX_DIV_CNT+2+MAX_DIV_CNT)
  ) i_clk_out_cmn_mux (
    .clks_i       ( {clk_out_ref_temp[MAX_DIV_CNT-1:0], clk_out_main_temp[MAX_DIV_CNT-1:0], pll_output_clk_main, clk_in1}       ),
    .test_clk_i   ( 1'b0           ),
    .test_en_i    ( 1'b0           ),
    .async_rstn_i ( reset_n         ),
    .async_sel_i  ( pll_main_cfg),
    .clk_o        ( clk_out_main_div_sel )
  );

  clk_mux_glitch_free #(
    .NUM_INPUTS(MAX_DIV_CNT+2+MAX_DIV_CNT)
  ) i_clk_out_chiplink_mux (
    .clks_i       ( {clk_out_ref_temp[MAX_DIV_CNT-1:0], clk_out_chiplink_temp[MAX_DIV_CNT-1:0], pll_output_clk_chiplink, clk_in1}      ),
    .test_clk_i   ( 1'b0           ),
    .test_en_i    ( 1'b0           ),
    .async_rstn_i ( reset_n         ),
    .async_sel_i  ( pll_chiplink_cfg),
    .clk_o        ( clk_out_chiplink_div_sel )
  );

  clk_mux_glitch_free #(
    .NUM_INPUTS(MAX_DIV_CNT+2+MAX_DIV_CNT)
  ) i_clk_out_ddr_mux (
    .clks_i       ( {clk_out_ref_temp[MAX_DIV_CNT-1:0], clk_out_ddr_temp[MAX_DIV_CNT-1:0], pll_output_clk_ddr, clk_in1}      ),
    .test_clk_i   ( 1'b0           ),
    .test_en_i    ( 1'b0           ),
    .async_rstn_i ( reset_n         ),
    .async_sel_i  ( pll_ddr_cfg),
    .clk_o        ( clk_out_ddr_div_sel )
  );

  // 0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30
generate
  for(genvar i = 0; i < MAX_DIV_VALUE; i = i + 2) begin : gen_div_static

    clk_int_div_static #(
        .DIV_VALUE(i+2),
        .ENABLE_CLOCK_IN_RESET(1'b0)
    ) u_clk_div_cpu(
        .clk_i          ( pll_output_clk_cpu          ),
        .rst_ni         ( reset_n         ),
        .en_i           ( 1'b1       ),
        .test_mode_en_i ( 1'b0 ),
        .clk_o          ( clk_out_cpu_temp[i/2]  )
        );

    clk_int_div_static #(
        .DIV_VALUE(i+2),
        .ENABLE_CLOCK_IN_RESET(1'b0)
    ) u_clk_div_main(
        .clk_i          ( pll_output_clk_main          ),
        .rst_ni         ( reset_n         ),
        .en_i           ( 1'b1          ),
        .test_mode_en_i ( 1'b0 ),
        .clk_o          ( clk_out_main_temp[i/2]  )
        );

    clk_int_div_static #(
        .DIV_VALUE(i+2),
        .ENABLE_CLOCK_IN_RESET(1'b0)
    ) u_clk_div_chiplink(
        .clk_i          ( pll_output_clk_chiplink          ),
        .rst_ni         ( reset_n         ),
        .en_i           ( 1'b1       ),
        .test_mode_en_i ( 1'b0 ),
        .clk_o          ( clk_out_chiplink_temp[i/2]   )
        );

    clk_int_div_static #(
        .DIV_VALUE(i+2),
        .ENABLE_CLOCK_IN_RESET(1'b0)
    ) u_clk_div_ddr(
        .clk_i          ( pll_output_clk_ddr          ),
        .rst_ni         ( reset_n         ),
        .en_i           ( 1'b1       ),
        .test_mode_en_i ( 1'b0 ),
        .clk_o          ( clk_out_ddr_temp[i/2]   )
        );

    clk_int_div_static #(
        .DIV_VALUE(i+2),
        .ENABLE_CLOCK_IN_RESET(1'b0)
    ) u_clk_div_ref_clk(
        .clk_i          ( clk_in1          ),
        .rst_ni         ( reset_n         ),
        .en_i           ( 1'b1       ),
        .test_mode_en_i ( 1'b0 ),
        .clk_o          ( clk_out_ref_temp[i/2]   )
        );

  end

endgenerate
    
        
    // clk_div #(
    //     .DIV(2),
    //     .IDLE_HIGH(1),
    //     .COVER(0)
    // ) u_clk_div_main (
    //     .clk_i(clk_in1),
    //     .enable_i(reset_n),
    //     .idle_o(),
    //     .clk_o(clk_out_main)
    // );


endmodule