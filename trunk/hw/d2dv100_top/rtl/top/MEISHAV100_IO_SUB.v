module MEISHAV100_TOP (
    input PWR_RESET_N,
    input HARD_RESET_N,
    inout AUTO_SPI_SOURCE_OUT_DQ_1_I,
    inout AUTO_UART_SOURCE_OUT_RXD, 
    input DEBUG_SYSTEMJTAG_JTAG_TCK,
    inout DEBUG_SYSTEMJTAG_JTAG_TMS, 
    inout DEBUG_SYSTEMJTAG_JTAG_TDI,
    inout AUTO_SPI_SOURCE_OUT_SCK, 
    inout AUTO_SPI_SOURCE_OUT_DQ_0_O, 
    inout AUTO_SPI_SOURCE_OUT_CS_0, 
    inout AUTO_UART_SOURCE_OUT_TXD,
    inout DEBUG_SYSTEMJTAG_JTAG_TDO, 
    
    inout  DEBUG_MODE_SEL,
    inout  DEBUG_MODE_CONFIG,

    //=============================================add=============================================//

    `ifndef IO_DEPRECIATE_UNSUPPORT
    inout [3:0] SPI_DATA,
    `else
    inout SPI_SDO0,
    inout SPI_SDO1,
    inout SPI_SDO2,
    inout SPI_SDO3,
    inout SPI_SDI0,
    inout SPI_SDI1,
    inout SPI_SDI2,
    inout SPI_SDI3,
    `endif
    inout SPI_CS,
    input SPI_SCLK,
    inout SPI_MASTER_CLK,
    inout  SPI_MASTER_CSN,
    //inout [3:0] SPI_MASTER_SDO,
    //inout [3:0] SPI_MASTER_SDI,
    inout [3:0] SPI_MASTER_DATA,
    inout SYS_CLOCK_P, 
    input SYS_CLOCK_P_unused, 
    //output SYS_CLOCK_P_OUT, 
    //inout SYS_CLOCK_N,
    //=============================================add===============================================//

    inout  DDR_IO_C2B_CLK,   // output
    inout  DDR_IO_C2B_RST,
    inout  DDR_IO_C2B_SEND,
    inout [7:0] DDR_IO_C2B_DATA,
    input  DDR_IO_B2C_CLK,
    inout  DDR_IO_B2C_RST,
    inout  DDR_IO_B2C_SEND,
    inout [7:0] DDR_IO_B2C_DATA,


    inout [12:0] DDR3_ADDR,
    inout [1:0]  DDR3_BA, 
    inout        DDR3_RAS_N, 
    inout        DDR3_CAS_N, 
    inout        DDR3_WE_N, 
    inout        DDR3_CK_P, 
    //inout        DDR3_CK_N, 
    inout        DDR3_CKE, 
    //inout        DDR3_CS_N, 
    inout [1:0]  DDR3_DM, 
    inout [15:0] DDR3_DQS


    );
  
  wire  ddr_io_c2b_clk;
  wire  ddr_io_c2b_rst;
  wire  ddr_io_c2b_send;
  wire [7:0] ddr_io_c2b_data;
  wire  ddr_io_b2c_clk;
  wire  ddr_io_b2c_rst;
  wire  ddr_io_b2c_send;
  wire [7:0] ddr_io_b2c_data;
  wire         clock;
  wire         reset;

  wire [12:0] auto_topMod_io_out_0_port_ddr3_addr; 
  wire [1:0]  auto_topMod_io_out_0_port_ddr3_ba; 
  wire        auto_topMod_io_out_0_port_ddr3_ras_n; 
  wire        auto_topMod_io_out_0_port_ddr3_cas_n; 
  wire        auto_topMod_io_out_0_port_ddr3_we_n; 
  wire        auto_topMod_io_out_0_port_ddr3_reset_n; 
  wire        auto_topMod_io_out_0_port_ddr3_ck_p; 
  wire        auto_topMod_io_out_0_port_ddr3_ck_n; 
  wire        auto_topMod_io_out_0_port_ddr3_cke; 
  wire        auto_topMod_io_out_0_port_ddr3_cs_n; 
  wire [1:0]  auto_topMod_io_out_0_port_ddr3_dm; 
  wire        auto_topMod_io_out_0_port_ddr3_odt; 
  wire [15:0] io_port_ddr3_dqs_i;
  wire [15:0] io_port_ddr3_dqs_o;
  wire        io_port_ddr3_dqs_o_en;


//   wire [7:0]  auto_led_source_out;
//   wire         auto_io_out_1_port_axi_aresetn;
//   wire        auto_io_out_1_port_axi_aclk_out;
//   wire        auto_io_out_1_port_mmcm_lock;
//   wire         auto_io_out_0_port_sys_clk_i;
//   wire        auto_io_out_0_port_ui_clk;
//   wire        auto_io_out_0_port_ui_clk_sync_rst;
//   wire        auto_io_out_0_port_mmcm_locked;
//   wire         auto_io_out_0_port_aresetn;
//   wire         auto_io_out_0_port_sys_rst;
//   wire        auto_spi_source_out_sck;
//   wire        auto_spi_source_out_dq_0_o;
//   wire         auto_spi_source_out_dq_1_i;
//   wire        auto_spi_source_out_cs_0;
//   wire        auto_uart_source_out_txd;
//   wire         auto_uart_source_out_rxd;
//   wire         debug_systemjtag_jtag_TCK;
//   wire         debug_systemjtag_jtag_TMS;
//   wire         debug_systemjtag_jtag_TDI;
//   wire        debug_systemjtag_jtag_TDO_data;
//   wire         debug_systemjtag_reset;
  wire        debug_ndreset;
  
  //=================================================add==================================================//
  
  wire    [3:0] spi_sdo_oen;
  wire    [3:0] spi_sdi_bus;
  wire    [3:0] spi_sdo_bus;
  wire          spi_sdi0;
  wire          spi_sdi1;
  wire          spi_sdi2;
  wire          spi_sdi3;
  wire          spi_sdo0;
  wire          spi_sdo1;
  wire          spi_sdo2;
  wire          spi_sdo3;

  assign {spi_sdi3, spi_sdi2, spi_sdi1, spi_sdi0} = spi_sdi_bus;
  assign spi_sdo_bus = {spi_sdo3, spi_sdo2, spi_sdo1, spi_sdo0};

  wire          spi_cs;
  wire    [1:0] spi_mode;
  wire          spi_sclk;
  wire          spi_master_clk;
  wire    [3:0] spi_master_csn;
  wire    [1:0] spi_master_mode;
  wire    [3:0] spi_master_sdo;
  wire    [3:0] spi_master_sdo_oen;
  wire    [3:0] spi_master_sdi;
  wire          sys_clock_p; 
  wire          sys_clock_n;
  wire          sdio_sdio_clk; 
  wire          sdio_sdio_cmd; 
  wire          sdio_sdio_dat_0;
  wire          sdio_sdio_dat_3; 

  wire [7:0] led; 
  wire debug_mode_sel_o;
  wire debug_mode_config_o;
  wire [7:0] topDesign_auto_topMod_led_source_out; 
  wire  topDesign_auto_topMod_io_out_0_port_sys_clk_i; 
  wire  topDesign_auto_topMod_io_out_0_port_ui_clk; 
  wire  topDesign_auto_topMod_io_out_0_port_ui_clk_sync_rst; 
  wire  topDesign_auto_topMod_io_out_0_port_mmcm_locked; 
  wire  topDesign_auto_topMod_io_out_0_port_aresetn; 
  wire  topDesign_auto_topMod_io_out_0_port_sys_rst; 
  wire  topDesign_auto_topMod_spi_source_out_sck; 
  wire  topDesign_auto_topMod_spi_source_out_dq_0_o; 
  wire  topDesign_auto_topMod_spi_source_out_dq_1_i; 
  wire  topDesign_auto_topMod_spi_source_out_cs_0; 
  wire  topDesign_auto_topMod_uart_source_out_txd; 
  wire  topDesign_auto_topMod_uart_source_out_rxd; 
  wire  topDesign_auto_wrangler_in_1_clock; 
  wire  topDesign_auto_wrangler_in_1_reset; 
  wire  topDesign_auto_wrangler_in_0_clock; 
  wire  topDesign_auto_wrangler_in_0_reset; 
  wire  topDesign_auto_wrangler_out_1_reset; 
  wire  topDesign_auto_wrangler_out_0_reset; 
  wire  topDesign_auto_coreGroup_in_member_0_clock; 
  wire  topDesign_auto_coreGroup_in_member_0_reset; 
  wire  topDesign_auto_jtag_debug_source_out_jtag_TCK; 
  wire  topDesign_auto_jtag_debug_source_out_jtag_TMS; 
  wire  topDesign_auto_jtag_debug_source_out_jtag_TDI; 
  wire  topDesign_auto_jtag_debug_source_out_jtag_TDO; 

  wire  sys_clock_ibufds_IB; 
  wire  sys_clock_ibufds_I; 
  wire  sys_clock_ibufds_O; 
  wire  reset_ibuf_I; 
  wire  reset_ibuf_O; 
  wire  power_on_reset; 
  wire  power_on_clock; 
  wire  _T_152; 
  wire  _T_254; 
  wire  _T_97_port_mmcm_locked; 
  wire  _T_230; 
  wire  _T_97_port_ui_clk_sync_rst; 
  wire  _T_4_clock; 
  wire  _T_120_reset; 
  wire  _T_133_port_mmcm_lock; 
  wire  _T_148_reset; 

  wire  in_hard_pwr_reset;
  wire  debug_mode_sel_pad_in;
  wire  debug_mode_config_pad_in;
  wire  power_on_reset_n_pad_in;
  wire  power_on_reset_pad_in;
  wire  hard_reset;
  wire  hard_reset_n;

  wire  tile_all_reset;
  wire  chiplink_reset;
  wire  corePLL_clk_out_cpu;
  wire  corePLL_clk_out_chiplink;
  wire  auto_out_alway_on_reset;
  wire  corePLL_locked;
 
    
  wire spi_master_clk_tile_clk_mux;
  wire spi_master_csn_chiplink_clk_mux;
  wire [3:0] spi_master_sdo_soc_state_mux;
  wire spi_gpio_mux_sel;

  //=================================================add========================================================//
    logic                    [1:0] spi_mode_unused;
    logic                    [1:0] spi_master_mode_unused;

    assign topDesign_auto_topMod_io_out_0_port_sys_rst = 1'b0;

  DevKitWrapper topDesign ( 
    `ifdef USE_C2C_FOR_PCIE
    .io_c2b_clk(io_c2b_clk),
    .io_c2b_rst(io_c2b_rst),
    .io_c2b_send(io_c2b_send),
    .io_c2b_data(io_c2b_data),
    .io_b2c_clk(io_b2c_clk),
    .io_b2c_rst(io_b2c_rst),
    .io_b2c_send(io_b2c_send),
    .io_b2c_data(io_b2c_data),
    `else
    .spi_sclk(spi_sclk),
    .spi_cs(spi_cs),
    .axi_spi_slave_test_mode(debug_mode_sel_o),
    .spi_gpio_mux_sel(spi_gpio_mux_sel),

    .spi_mode(spi_mode_unused),
    .spi_sdi0(spi_sdi0),
    .spi_sdi1(spi_sdi1),
    .spi_sdi2(spi_sdi2),
    .spi_sdi3(spi_sdi3),
    .spi_sdo0(spi_sdo0),
    .spi_sdo1(spi_sdo1),
    .spi_sdo2(spi_sdo2),
    .spi_sdo3(spi_sdo3),
    .spi_sdo_oen(spi_sdo_oen),
    `endif
    .ddr_io_c2b_clk(ddr_io_c2b_clk)
    ,.ddr_io_c2b_rst(ddr_io_c2b_rst)
    ,.ddr_io_c2b_send(ddr_io_c2b_send)
    ,.ddr_io_c2b_data(ddr_io_c2b_data)
    ,.ddr_io_b2c_clk(ddr_io_b2c_clk)
    ,.ddr_io_b2c_rst(ddr_io_b2c_rst)
    ,.ddr_io_b2c_send(ddr_io_b2c_send)
    ,.ddr_io_b2c_data(ddr_io_b2c_data),

    .tile_all_reset(tile_all_reset),
    .chiplink_reset(chiplink_reset),
    .corePLL_clk_out_cpu(corePLL_clk_out_cpu),
    .corePLL_clk_out_chiplink(corePLL_clk_out_chiplink),
    .auto_out_alway_on_reset(auto_out_alway_on_reset),
    .corePLL_locked(corePLL_locked),
    
    .spi_master_clk(spi_master_clk),
    .spi_master_csn(spi_master_csn),
    .spi_master_mode(spi_master_mode_unused),
    .spi_master_sdo(spi_master_sdo),
    .spi_master_sdo_oen(spi_master_sdo_oen),
    .spi_master_sdi(spi_master_sdi),
    .debug_mode_sel_pad_glitch_free(debug_mode_sel_o),
    .debug_mode_config(debug_mode_config_o),
    .in_ref_always_on_clk(sys_clock_ibufds_O),
    .in_hard_pwr_reset(in_hard_pwr_reset),

    .auto_topMod_led_source_out(topDesign_auto_topMod_led_source_out),
    .auto_topMod_io_out_1_port_REFCLK_rxp(1'b0),
    .auto_topMod_io_out_1_port_REFCLK_rxn(1'b0),
    .auto_topMod_io_out_1_port_pci_exp_txp(),
    .auto_topMod_io_out_1_port_pci_exp_txn(),
    .auto_topMod_io_out_1_port_pci_exp_rxp(1'b0),
    .auto_topMod_io_out_1_port_pci_exp_rxn(1'b0),
    //.auto_topMod_io_out_1_port_axi_aresetn(),
    //.auto_topMod_io_out_1_port_axi_aclk_out(),
    //.auto_topMod_io_out_1_port_mmcm_lock(),
    .auto_topMod_io_out_0_port_ddr3_addr(auto_topMod_io_out_0_port_ddr3_addr),
    .auto_topMod_io_out_0_port_ddr3_ba(auto_topMod_io_out_0_port_ddr3_ba),
    .auto_topMod_io_out_0_port_ddr3_ras_n(auto_topMod_io_out_0_port_ddr3_ras_n),
    .auto_topMod_io_out_0_port_ddr3_cas_n(auto_topMod_io_out_0_port_ddr3_cas_n),
    .auto_topMod_io_out_0_port_ddr3_we_n(auto_topMod_io_out_0_port_ddr3_we_n),
    .auto_topMod_io_out_0_port_ddr3_reset_n(auto_topMod_io_out_0_port_ddr3_reset_n),
    .auto_topMod_io_out_0_port_ddr3_ck_p(auto_topMod_io_out_0_port_ddr3_ck_p),
    .auto_topMod_io_out_0_port_ddr3_ck_n(auto_topMod_io_out_0_port_ddr3_ck_n),
    .auto_topMod_io_out_0_port_ddr3_cke(auto_topMod_io_out_0_port_ddr3_cke),
    .auto_topMod_io_out_0_port_ddr3_cs_n(auto_topMod_io_out_0_port_ddr3_cs_n),
    .auto_topMod_io_out_0_port_ddr3_dm(auto_topMod_io_out_0_port_ddr3_dm),
    .auto_topMod_io_out_0_port_ddr3_odt(auto_topMod_io_out_0_port_ddr3_odt),
    .io_port_ddr3_dqs_i(io_port_ddr3_dqs_i),
    .io_port_ddr3_dqs_o_en(io_port_ddr3_dqs_o_en),
    .io_port_ddr3_dqs_o(io_port_ddr3_dqs_o),
    .auto_topMod_io_out_0_port_ui_clk(topDesign_auto_topMod_io_out_0_port_ui_clk),
    .auto_topMod_io_out_0_port_ui_clk_sync_rst(topDesign_auto_topMod_io_out_0_port_ui_clk_sync_rst),
    .auto_topMod_io_out_0_port_mmcm_locked(topDesign_auto_topMod_io_out_0_port_mmcm_locked),
    //.auto_topMod_io_out_0_port_aresetn(topDesign_auto_topMod_io_out_0_port_aresetn),
    .auto_topMod_io_out_0_port_sys_rst(topDesign_auto_topMod_io_out_0_port_sys_rst),
    .auto_topMod_spi_source_out_sck(topDesign_auto_topMod_spi_source_out_sck),
    .auto_topMod_spi_source_out_dq_0_o(topDesign_auto_topMod_spi_source_out_dq_0_o),
    .auto_topMod_spi_source_out_dq_1_i(topDesign_auto_topMod_spi_source_out_dq_1_i),
    .auto_topMod_spi_source_out_cs_0(topDesign_auto_topMod_spi_source_out_cs_0),
    .auto_topMod_uart_source_out_txd(topDesign_auto_topMod_uart_source_out_txd),
    .auto_topMod_uart_source_out_rxd(topDesign_auto_topMod_uart_source_out_rxd),
    // .auto_wrangler_in_1_clock(topDesign_auto_wrangler_in_1_clock),
    // .auto_wrangler_in_1_reset(topDesign_auto_wrangler_in_1_reset),
    // .auto_wrangler_in_0_clock(topDesign_auto_wrangler_in_0_clock),
    // .auto_wrangler_in_0_reset(topDesign_auto_wrangler_in_0_reset),
    // .auto_wrangler_out_1_reset(topDesign_auto_wrangler_out_1_reset),
    // .auto_wrangler_out_0_reset(topDesign_auto_wrangler_out_0_reset),
    // .auto_coreGroup_in_member_0_clock(power_on_clock),
    // .auto_coreGroup_in_member_0_reset(in_hard_pwr_reset),
    .auto_jtag_debug_source_out_jtag_TCK(topDesign_auto_jtag_debug_source_out_jtag_TCK),
    .auto_jtag_debug_source_out_jtag_TMS(topDesign_auto_jtag_debug_source_out_jtag_TMS),
    .auto_jtag_debug_source_out_jtag_TDI(topDesign_auto_jtag_debug_source_out_jtag_TDI),
    .auto_jtag_debug_source_out_jtag_TDO(topDesign_auto_jtag_debug_source_out_jtag_TDO)

    //=================================add=========================================//
  );


ZTRNE4GSLA IO_ZTRNE4GSLA_DEBUG_MODE_SEL
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b1),
    .IO(DEBUG_MODE_SEL),
    .O(debug_mode_sel_pad_in)
    );

ZTRNE4GSLA IO_ZTRNE4GSLA_DEBUG_MODE_CONFIG
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b1),
    .IO(DEBUG_MODE_CONFIG),
    .O(debug_mode_config_pad_in)
    );

`ifdef USE_DDR2_IO_WSSTLECLK

WOSSTLECLK IO_WOSSTLECLK_DDR_IO_C2B_CLK
(
    .O()
    ,.I(ddr_io_c2b_clk)
    ,.IO(DDR_IO_C2B_CLK)
    ,.E(1'b1)
    ,.NLEG5(1'b0)
    ,.NLEG4(1'b1)
    ,.NLEG3(1'b0)
    ,.NLEG2(1'b1)
    ,.NLEG1(1'b0)
    ,.NLEG0(1'b0)
    ,.PLEG5(1'b0)
    ,.PLEG4(1'b1)
    ,.PLEG3(1'b0)
    ,.PLEG2(1'b1)
    ,.PLEG1(1'b0)
    ,.PLEG0(1'b0)
    ,.REF(1'b1)
    ,.IE(1'b1)
    ,.ODTEN(1'b1)
    ,.ODTMD2(1'b1)
    ,.ODTMD1(1'b0)
    ,.ODTMD0(1'b0)
    ,.RONMD2(1'b1)
    ,.RONMD1(1'b0)
    ,.RONMD0(1'b0)
    ,.D15V(1'b0)
    ,.MDDR1(1'b0)
    ,.E3V(1'b1)
    );

`else

WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR_IO_C2B_CLK
(
    .I(ddr_io_c2b_clk),
    .E(1'b1),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b0),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(DDR_IO_C2B_CLK),
    .O()
    );

`endif

WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR_IO_C2B_RST(
    .I(ddr_io_c2b_rst),
    .E(1'b1),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b0),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(DDR_IO_C2B_RST),
    .O()
    );

WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR_IO_C2B_SEND(
    .I(ddr_io_c2b_send),
    .E(1'b1),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b0),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(DDR_IO_C2B_SEND),
    .O()
    );

genvar i;
generate

for(i = 0; i < 8; i = i + 1) begin : assign_to_c2b_data_bus

  WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR_IO_C2B_DATA(
      .I(ddr_io_c2b_data[i]),
      .E(1'b1),
      .E4(1'b0),
      .E8(1'b0),
      .SR(1'b0),
      .IE(1'b0),
      .PU(1'b0),
      .PD(1'b0),
      .SMT(1'b0),
      .IO(DDR_IO_C2B_DATA[i]),
      .O()
      );
end
endgenerate


generate

for(i = 0; i < 8; i = i + 1) begin : assign_to_b2c_data_bus
  WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR_IO_B2C_DATA(
      .I(1'b0),
      .E(1'b0),
      .E4(1'b0),
      .E8(1'b0),
      .SR(1'b0),
      .IE(1'b1),
      .PU(1'b0),
      .PD(1'b0),
      .SMT(1'b0),
      .IO(DDR_IO_B2C_DATA[i]),
      .O(ddr_io_b2c_data[i])
    );
end

endgenerate



generate

for(i = 0; i < 13; i = i + 1) begin : assign_to_ddr3_addr
  WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR3_ADDR(
      .I(auto_topMod_io_out_0_port_ddr3_addr[i]),
      .E(1'b1), // output enable
      .E4(1'b0),
      .E8(1'b0),
      .SR(1'b0),
      .IE(1'b0), // input gate or enable
      .PU(1'b0),
      .PD(1'b0),
      .SMT(1'b0),
      .IO(DDR3_ADDR[i]),
      .O()
      );
end


for(i = 0; i < 16; i = i + 1) begin : assign_to_ddr3_dqs
  WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR3_DQS(
      .I(io_port_ddr3_dqs_o[i]),
      .E(io_port_ddr3_dqs_o_en),
      .E4(1'b0),
      .E8(1'b0),
      .SR(1'b0),
      .IE(~io_port_ddr3_dqs_o_en),
      .PU(1'b0),
      .PD(1'b0),
      .SMT(1'b0),
      .IO(DDR3_DQS[i]),
      .O(io_port_ddr3_dqs_i[i])
      );
end

    
for(i = 0; i < 2; i = i + 1) begin : assign_to_ddr3_ba
  WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR3_BA(
      .I(auto_topMod_io_out_0_port_ddr3_ba[i]),
      .E(1'b1),
      .E4(1'b0),
      .E8(1'b0),
      .SR(1'b0),
      .IE(1'b0),
      .PU(1'b0),
      .PD(1'b0),
      .SMT(1'b0),
      .IO(DDR3_BA[i]),
      .O()
      );
end

  
for(i = 0; i < 2; i = i + 1) begin : assign_to_ddr3_dm
  WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR3_DM(
      .I(auto_topMod_io_out_0_port_ddr3_dm[i]),
      .E(1'b1),
      .E4(1'b0),
      .E8(1'b0),
      .SR(1'b0),
      .IE(1'b0),
      .PU(1'b0),
      .PD(1'b0),
      .SMT(1'b0),
      .IO(DDR3_DM[i]),
      .O()
      );
end


endgenerate

WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR3_RAS_N(
      .I(auto_topMod_io_out_0_port_ddr3_ras_n),
      .E(1'b1),
      .E4(1'b0),
      .E8(1'b0),
      .SR(1'b0),
      .IE(1'b0),
      .PU(1'b0),
      .PD(1'b0),
      .SMT(1'b0),
      .IO(DDR3_RAS_N),
      .O()
      );


WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR3_CAS_N(
      .I(auto_topMod_io_out_0_port_ddr3_cas_n),
      .E(1'b1),
      .E4(1'b0),
      .E8(1'b0),
      .SR(1'b0),
      .IE(1'b0),
      .PU(1'b0),
      .PD(1'b0),
      .SMT(1'b0),
      .IO(DDR3_CAS_N),
      .O()
      );

WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR3_WE_N(
      .I(auto_topMod_io_out_0_port_ddr3_we_n),
      .E(1'b1),
      .E4(1'b0),
      .E8(1'b0),
      .SR(1'b0),
      .IE(1'b0),
      .PU(1'b0),
      .PD(1'b0),
      .SMT(1'b0),
      .IO(DDR3_WE_N),
      .O()
      );

WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR3_CK(
      .I(auto_topMod_io_out_0_port_ddr3_ck_p),
      .E(1'b1),
      .E4(1'b0),
      .E8(1'b0),
      .SR(1'b0),
      .IE(1'b0),
      .PU(1'b0),
      .PD(1'b0),
      .SMT(1'b0),
      .IO(DDR3_CK_P),
      .O()
      );

WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR3_CKE(
      .I(auto_topMod_io_out_0_port_ddr3_cke),
      .E(1'b1),
      .E4(1'b0),
      .E8(1'b0),
      .SR(1'b0),
      .IE(1'b0),
      .PU(1'b0),
      .PD(1'b0),
      .SMT(1'b0),
      .IO(DDR3_CKE),
      .O()
      );


// WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR3_CS_N(
//       .I(auto_topMod_io_out_0_port_ddr3_cs_n),
//       .E(1'b1),
//       .E4(1'b0),
//       .E8(1'b0),
//       .SR(1'b0),
//       .IE(1'b0),
//       .PU(1'b0),
//       .PD(1'b0),
//       .SMT(1'b0),
//       .IO(DDR3_CS_N),
//       .O()
//       );

`ifdef USE_DDR2_IO_WSSTLECLK
WOSSTLECLK IO_WOSSTLECLK_DDR_IO_B2C_CLK
(
     .O(ddr_io_b2c_clk)
    ,.I(1'b0)
    ,.IO(DDR_IO_B2C_CLK)
    ,.E(1'b0)
    ,.NLEG5(1'b0)
    ,.NLEG4(1'b1)
    ,.NLEG3(1'b0)
    ,.NLEG2(1'b1)
    ,.NLEG1(1'b0)
    ,.NLEG0(1'b0)
    ,.PLEG5(1'b0)
    ,.PLEG4(1'b1)
    ,.PLEG3(1'b0)
    ,.PLEG2(1'b1)
    ,.PLEG1(1'b0)
    ,.PLEG0(1'b0)
    ,.REF(1'b1)
    ,.IE(1'b1)
    ,.ODTEN(1'b1)
    ,.ODTMD2(1'b1)
    ,.ODTMD1(1'b0)
    ,.ODTMD0(1'b0)
    ,.RONMD2(1'b1)
    ,.RONMD1(1'b0)
    ,.RONMD0(1'b0)
    ,.D15V(1'b0)
    ,.MDDR1(1'b0)
    ,.E3V(1'b1)
    );
`else

WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR_IO_B2C_CLK
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(DDR_IO_B2C_CLK),
    .O(ddr_io_b2c_clk)
    );

`endif

WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR_IO_B2C_RST
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b1),
    .IO(DDR_IO_B2C_RST),
    .O(ddr_io_b2c_rst)
    );

WRNE4GSLAX250 IO_WRNE4GSLAX250_DDR_IO_B2C_SEND
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(DDR_IO_B2C_SEND),
    .O(ddr_io_b2c_send)
    );

ZTRNE4GSLA IO_ZTRNE4GSLA_PWR_RESET
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b1),
    .IO(PWR_RESET_N),
    .O(power_on_reset_n_pad_in)
    );


ZTRNE4GSLA IO_ZTRNE4GSLA_HARD_RESET
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b1),
    .IO(HARD_RESET_N),
    .O(hard_reset_n)
    );

ZTRNE4GSLA IO_ZTRNE4GSLA_auto_SPI_SOURCE_OUT_DQ_1_I
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(AUTO_SPI_SOURCE_OUT_DQ_1_I),
    .O(topDesign_auto_topMod_spi_source_out_dq_1_i)
    );

ZTRNE4GSLA IO_ZTRNE4GSLA_auto_UART_SOURCE_OUT_RXD
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(AUTO_UART_SOURCE_OUT_RXD),
    .O(topDesign_auto_topMod_uart_source_out_rxd)
    );

ZTRNE4GSLA IO_ZTRNE4GSLA_DEBUG_SYSTEMJTAG_JTAG_TCK
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(DEBUG_SYSTEMJTAG_JTAG_TCK),
    .O(topDesign_auto_jtag_debug_source_out_jtag_TCK)
    );


ZTRNE4GSLA IO_ZTRNE4GSLA_DEBUG_SYSTEMJTAG_JTAG_TMS
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(DEBUG_SYSTEMJTAG_JTAG_TMS),
    .O(topDesign_auto_jtag_debug_source_out_jtag_TMS)
    );

ZTRNE4GSLA IO_ZTRNE4GSLA_DEBUG_SYSTEMJTAG_JTAG_TDI
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(DEBUG_SYSTEMJTAG_JTAG_TDI),
    .O(topDesign_auto_jtag_debug_source_out_jtag_TDI)
    );

// ZTRNE4GSLA IO_ZTRNE4GSLA_DEBUG_SYSTEMJTAG_RESET
// (
//     .I(1'b0),
//     .E(1'b0),
//     .E4(1'b0),
//     .E8(1'b0),
//     .SR(1'b0),
//     .IE(1'b1),
//     .PU(1'b0),
//     .PD(1'b0),
//     .SMT(1'b0),
//     .IO(DEBUG_SYSTEMJTAG_RESET),
//     .O(debug_systemjtag_reset)
//     );



WRNE4GSLAX250 IO_WRNE4GSLAX250_auto_SPI_SOURCE_OUT_SCK
(
    .I(topDesign_auto_topMod_spi_source_out_sck),
    .E(1'b1),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b0),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(AUTO_SPI_SOURCE_OUT_SCK),
    .O()
    );

ZTRNE4GSLA IO_ZTRNE4GSLA_auto_SPI_SOURCE_OUT_DQ_0_0
(
    .I(topDesign_auto_topMod_spi_source_out_dq_0_o),
    .E(1'b1),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b0),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(AUTO_SPI_SOURCE_OUT_DQ_0_O),
    .O()
    );

ZTRNE4GSLA IO_ZTRNE4GSLA_auto_SPI_SOURCE_OUT_CS_0
(
    .I(topDesign_auto_topMod_spi_source_out_cs_0),
    .E(1'b1),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b0),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(AUTO_SPI_SOURCE_OUT_CS_0),
    .O()
    );

ZTRNE4GSLA IO_ZTRNE4GSLA_auto_UART_SOURCE_OUT_TXD
(
    .I(topDesign_auto_topMod_uart_source_out_txd),
    .E(1'b1),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b0),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(AUTO_UART_SOURCE_OUT_TXD),
    .O()
    );

ZTRNE4GSLA IO_ZTRNE4GSLA_DEBUG_SYSTEMJTAG_JTAG_TDO
(
    .I(topDesign_auto_jtag_debug_source_out_jtag_TDO),
    .E(1'b1),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b0),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(DEBUG_SYSTEMJTAG_JTAG_TDO),
    .O()
    );
/*
ZTRNE4GSLA IO_ZTRNE4GSLA_DEBUG_NDRESET
(
    .I(debug_ndreset),
    .E(1'b1),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(DEBUG_NDRESET),
    .O()
    );
*/



//add
`ifndef IO_DEPRECIATE_UNSUPPORT

generate

    for(i = 0; i < 4; i = i + 1) begin : assign_to_spi_data
    WRNE4GSLAX250 IO_WRNE4GSLAX250_SPI_DATA(
        .I(spi_sdo_bus[i]),
        .E(~spi_sdo_oen[i]),
        .E4(1'b0),
        .E8(1'b0),
        .SR(1'b0),
        .IE(spi_sdo_oen[i]),
        .PU(1'b0),
        .PD(1'b0),
        .SMT(1'b0),
        .IO(SPI_DATA[i]),
        .O(spi_sdi_bus[i])
        );
    end

endgenerate


`else

WRNE4GSLAX250 IO_WRNE4GSLAX250_SPI_SDO0(
        .I(spi_sdo0),
        .E(1'b1),
        .E4(1'b0),
        .E8(1'b0),
        .SR(1'b0),
        .IE(1'b0),
        .PU(1'b0),
        .PD(1'b0),
        .SMT(1'b0),
        .IO(SPI_SDO0),
        .O()
        );


WRNE4GSLAX250 IO_WRNE4GSLAX250_SPI_SDO1(
        .I(spi_sdo1),
        .E(1'b1),
        .E4(1'b0),
        .E8(1'b0),
        .SR(1'b0),
        .IE(1'b0),
        .PU(1'b0),
        .PD(1'b0),
        .SMT(1'b0),
        .IO(SPI_SDO1),
        .O()
        );
WRNE4GSLAX250 IO_WRNE4GSLAX250_SPI_SDO2(
        .I(spi_sdo2),
        .E(1'b1),
        .E4(1'b0),
        .E8(1'b0),
        .SR(1'b0),
        .IE(1'b0),
        .PU(1'b0),
        .PD(1'b0),
        .SMT(1'b0),
        .IO(SPI_SDO2),
        .O()
        );
WRNE4GSLAX250 IO_WRNE4GSLAX250_SPI_SDO3(
        .I(spi_sdo3),
        .E(1'b1),
        .E4(1'b0),
        .E8(1'b0),
        .SR(1'b0),
        .IE(1'b0),
        .PU(1'b0),
        .PD(1'b0),
        .SMT(1'b0),
        .IO(SPI_SDO3),
        .O()
        );
        
WRNE4GSLAX250 IO_WRNE4GSLAX250_SPI_SDI3(
        .I(1'b0),
        .E(1'b0),
        .E4(1'b0),
        .E8(1'b0),
        .SR(1'b0),
        .IE(1'b1),
        .PU(1'b0),
        .PD(1'b0),
        .SMT(1'b0),
        .IO(SPI_SDI3),
        .O(spi_sdi3)
        );
    
WRNE4GSLAX250 IO_WRNE4GSLAX250_SPI_SDI2(
        .I(1'b0),
        .E(1'b0),
        .E4(1'b0),
        .E8(1'b0),
        .SR(1'b0),
        .IE(1'b1),
        .PU(1'b0),
        .PD(1'b0),
        .SMT(1'b0),
        .IO(SPI_SDI2),
        .O(spi_sdi2)
        );    
WRNE4GSLAX250 IO_WRNE4GSLAX250_SPI_SDI1(
        .I(1'b0),
        .E(1'b0),
        .E4(1'b0),
        .E8(1'b0),
        .SR(1'b0),
        .IE(1'b1),
        .PU(1'b0),
        .PD(1'b0),
        .SMT(1'b0),
        .IO(SPI_SDI1),
        .O(spi_sdi1)
        );    
WRNE4GSLAX250 IO_WRNE4GSLAX250_SPI_SDI0(
        .I(1'b0),
        .E(1'b0),
        .E4(1'b0),
        .E8(1'b0),
        .SR(1'b0),
        .IE(1'b1),
        .PU(1'b0),
        .PD(1'b0),
        .SMT(1'b0),
        .IO(SPI_SDI0),
        .O(spi_sdi0)
        );
`endif
ZTRNE4GSLA IO_ZTRNE4GSLA_SPI_CS
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(SPI_CS),
    .O(spi_cs)
    );



WRNE4GSLAX250 IO_WRNE4GSLAX250_SPI_SCLK
(
    .I(1'b0),
    .E(1'b0),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b1),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(SPI_SCLK),
    .O(spi_sclk)
    );

   assign spi_master_clk_tile_clk_mux = debug_mode_sel_o ? corePLL_clk_out_cpu: (spi_master_clk);
   assign spi_master_csn_chiplink_clk_mux = debug_mode_sel_o ? corePLL_clk_out_chiplink: spi_master_csn[0];
   assign spi_master_sdo_soc_state_mux[0] = debug_mode_sel_o ? tile_all_reset: (spi_gpio_mux_sel ? led[0] : spi_master_sdo[0]);
   assign spi_master_sdo_soc_state_mux[1] = debug_mode_sel_o ? chiplink_reset:  (spi_gpio_mux_sel ? led[1] : spi_master_sdo[1]);
   assign spi_master_sdo_soc_state_mux[2] = debug_mode_sel_o ? auto_out_alway_on_reset:  (spi_gpio_mux_sel ? led[2] : spi_master_sdo[2]);
   assign spi_master_sdo_soc_state_mux[3] = debug_mode_sel_o ? corePLL_locked:  (spi_gpio_mux_sel ? led[3] : spi_master_sdo[3]);




WRNE4GSLAX250 IO_WRNE4GSLAX250_SPI_MASTER_CLK
(
    .I(spi_master_clk_tile_clk_mux),
    .E(1'b1),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b0),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(SPI_MASTER_CLK),
    .O()
    );

generate

for(i = 0; i < 1; i = i + 1) begin : gen_spi_master_cs
    ZTRNE4GSLA IO_ZTRNE4GSLA_SPI_MASTER_CSN(
    .I(spi_master_csn_chiplink_clk_mux),
    .E(1'b1),
    .E4(1'b0),
    .E8(1'b0),
    .SR(1'b0),
    .IE(1'b0),
    .PU(1'b0),
    .PD(1'b0),
    .SMT(1'b0),
    .IO(SPI_MASTER_CSN),
    .O()
    );
end
endgenerate


generate

for(i = 0; i < 4; i = i + 1) begin : assign_to_spi_master_data
  WRNE4GSLAX250 IO_WRNE4GSLAX250_SPI_MASTER_DATA(
      .I(spi_master_sdo_soc_state_mux[i]),
      .E(~spi_master_sdo_oen[i]),
      .E4(1'b0),
      .E8(1'b0),
      .SR(1'b0),
      .IE(spi_master_sdo_oen[i]),
      .PU(1'b0),
      .PD(1'b0),
      .SMT(1'b0),
      .IO(SPI_MASTER_DATA[i]),
      .O(spi_master_sdi[i])
      );
end
/*
    for(i = 0; i < 4; i = i + 1) begin : gen_spi_master_sdo
        ZTRNE4GSLA IO_ZTRNE4GSLA_SPI_MASTER_SDO(
            .I(spi_master_sdo_soc_state_mux[i]),
            .E(1'b1),
            .E4(1'b0),
            .E8(1'b0),
            .SR(1'b0),
            .IE(1'b0),
            .PU(1'b0),
            .PD(1'b0),
            .SMT(1'b0),
            .IO(SPI_MASTER_SDO[i]),
            .O()
            );
    end
        
    for(i = 0; i < 4; i = i + 1) begin : gen_spi_master_sdi
    ZTRNE4GSLA IO_ZTRNE4GSLA_SPI_MASTER_SDI(
        .I(1'b0),
        .E(1'b0),
        .E4(1'b0),
        .E8(1'b0),
        .SR(1'b0),
        .IE(1'b1),
        .PU(1'b0),
        .PD(1'b0),
        .SMT(1'b0),
        .IO(SPI_MASTER_SDI[i]),
        .O(spi_master_sdi[i])
        );
    end

    */
endgenerate


// WRNE4GSLAX250 IO_WRNE4GSLAX250_SYS_CLOCK_P
// (
//     .I(1'b0),
//     .E(1'b0),
//     .E4(1'b0),
//     .E8(1'b0),
//     .SR(1'b0),
//     .IE(1'b1),
//     .PU(1'b0),
//     .PD(1'b0),
//     .SMT(1'b0),
//     .IO(SYS_CLOCK_P),
//     .O(sys_clock_p)
//     );
// XOSCAHINTLAX2 (O, I, IO, E, EB, S0, S1, FEB, E3V);
XOSCAHINTLAX1 IO_XOSCAHINTLA_SYS_CLOCK_P
(
    .O(sys_clock_p), 
    .I(SYS_CLOCK_P_unused),
    .E3VB(1'b0),
    .IO(SYS_CLOCK_P), 
    .E(1'b1),
    .EB(1'b1),   // used for tri-state, use externel clk
    .S0(1'b1), 
    .S1(1'b1), 
    .FEB(1'b1)
    );

// WRNE4GSLAX250 IO_WRNE4GSLAX250_SYS_CLOCK_N
// (
//     .I(1'b0),
//     .E(1'b0),
//     .E4(1'b0),
//     .E8(1'b0),
//     .SR(1'b0),
//     .IE(1'b1),
//     .PU(1'b0),
//     .PD(1'b0),
//     .SMT(1'b0),
//     .IO(SYS_CLOCK_N),
//     .O(sys_clock_n)
//     );

//差分时钟信号
// WOSSTLECDLK IO_WOSSTLECDLK_SYS_CLOCK
// (
//     .O(sys_clock)
//     .I(1'b0)
//     .IO(SYS_CLOCK_P)
//     .IOB(SYS_CLOCK_N)
//     .E(1'b0)
//     .NLEG5(1'b0)
//     .NLEG4(1'b1)
//     .NLEG3(1'b0)
//     .NLEG2(1'b1)
//     .NLEG1(1'b0)
//     .NLEG0(1'b0)
//     .PLEG5,(1'b0)
//     .PLEG4(1'b1)
//     .PLEG3(1'b0)
//     .PLEG2(1'b1)
//     .PLEG1(1'b0)
//     .PLEG0(1'b0)
//     .SIO(1'b0)
//     .REF(1'b1)
//     .IE(1'b1)
//     .ODTEN(1'b1)
//     .ODTMD2(1'b1)
//     .ODTMD1(1'b0)
//     .ODTMD0,(1'b0)
//     .RONMD2(1'b1)
//     .RONMD1(1'b0)
//     .RONMD0(1'b0)
//     .D15V(1'b0)
//     .MDDR1(1'b0)
//     .E3V(1'b1)
//     );
  
  IBUFDS #(.DIFF_TERM("FALSE"), .IOSTANDARD("DEFAULT"), .CAPACITANCE("DONT_CARE"), .IFD_DELAY_VALUE("AUTO"), .IBUF_LOW_PWR("TRUE"), .IBUF_DELAY_VALUE("0")) sys_clock_ibufds ( 
    .IB(sys_clock_ibufds_IB),
    .I(sys_clock_ibufds_I),
    .O(sys_clock_ibufds_O)
  );

  reset_glitch_free #(.DELAY_CYCLE(128)) debug_mode_sel_ibuf( 
    .i_reset(debug_mode_sel_pad_in),
    .o_reset(debug_mode_sel_o)
  );

  reset_glitch_free #(.DELAY_CYCLE(64)) debug_mode_config_ibuf( 
    .i_reset(debug_mode_config_pad_in),
    .o_reset(debug_mode_config_o)
  );
  
  `CK_INV_STD_CELL_DONT_TOUCH u_dont_touch_pwr_reset_inverter (
       .I      (power_on_reset_n_pad_in)
      ,.O      (power_on_reset_pad_in)
  );

  `CK_INV_STD_CELL_DONT_TOUCH u_dont_touch_hard_reset_inverter (
       .I      (hard_reset_n)
      ,.O      (hard_reset)
  );
  
  reset_glitch_free #(.DELAY_CYCLE(256)) pwr_reset_ibuf( 
    .i_reset(power_on_reset_pad_in),
    .o_reset(power_on_reset)
  );

  reset_glitch_free #(.DELAY_CYCLE(128))  hard_reset_ibuf ( 
    .i_reset(hard_reset),
    .o_reset(reset_ibuf_O)
  );

//   IBUF_STD_CELL hard_reset_ibuf ( 
//     .I(hard_reset),
//     .O(reset_ibuf_O)
//   );

//   IBUF_STD_CELL pwr_reset_ibuf ( 
//     .I(power_on_reset_pad_in),
//     .O(power_on_reset)
//   );
// `ifndef VENDOR_RAM_EN1
//   PowerOnResetFPGAOnly fpga_power_on ( 
//     .power_on_reset(power_on_reset),
//     .clock(power_on_clock)
//   );
// `endif
  assign sys_clock_n = 1'b0;
  assign led = topDesign_auto_topMod_led_source_out; 

  assign in_hard_pwr_reset = reset_ibuf_O | power_on_reset; 
  assign sys_clock_ibufds_IB = sys_clock_n; 
  assign sys_clock_ibufds_I = sys_clock_p; 
  assign power_on_clock = sys_clock_ibufds_O; 
endmodule
