module sdram_axi
      #(parameter 
                  WIDTH_ID    = 4 // ID width in bits
                , WIDTH_AD    = 32 // address width
                , WIDTH_DA    = 64 // data width
      )
(
    // Inputs
     input           clk_i
    ,input           rst_i
    
    ,input  [  31:0] sdram_start_delay
    ,input  [  31:0] sdram_refresh_cycles
    ,input  [  31:0] sdram_trcd_cycles
    ,input  [  31:0] sdram_trp_cycles
    ,input  [  31:0] sdram_trfc_cycles
    
    ,input           inport_awvalid_i
    ,input  [ WIDTH_AD-1:0]  inport_awaddr_i
    ,input  [  3:0]  inport_awid_i
    ,input  [  2:0]  inport_awsize_i
    ,input  [  7:0]  inport_awlen_i
    ,input  [  1:0]  inport_awburst_i
    ,input           inport_wvalid_i
    ,input  [ WIDTH_DA-1:0]  inport_wdata_i
    ,input  [ WIDTH_DA/8-1:0]  inport_wstrb_i
    ,input           inport_wlast_i
    ,input           inport_bready_i
    ,input           inport_arvalid_i
    ,input  [ WIDTH_AD-1:0]  inport_araddr_i
    ,input  [  3:0]  inport_arid_i
    ,input  [  2:0]  inport_arsize_i
    ,input  [  7:0]  inport_arlen_i
    ,input  [  1:0]  inport_arburst_i
    ,input           inport_rready_i
    ,input  [ 15:0]  sdram_data_input_i

    // Outputs
    ,output          inport_awready_o
    ,output          inport_wready_o
    ,output          inport_bvalid_o
    ,output [  1:0]  inport_bresp_o
    ,output [  3:0]  inport_bid_o
    ,output          inport_arready_o
    ,output          inport_rvalid_o
    ,output [ WIDTH_DA-1:0]  inport_rdata_o
    ,output [  1:0]  inport_rresp_o
    ,output [  3:0]  inport_rid_o
    ,output          inport_rlast_o
    ,output          sdram_clk_o
    ,output          sdram_cke_o
    ,output          sdram_cs_o
    ,output          sdram_ras_o
    ,output          sdram_cas_o
    ,output          sdram_we_o
    ,output [  1:0]  sdram_dqm_o
    ,output [ 12:0]  sdram_addr_o
    ,output [  1:0]  sdram_ba_o
    ,output [ 15:0]  sdram_data_output_o
    ,output          sdram_data_out_en_o
);



//-----------------------------------------------------------------
// Key Params
//-----------------------------------------------------------------
localparam SDRAM_MHZ             = 50;
localparam SDRAM_ADDR_W          = 24;
localparam SDRAM_COL_W           = 9;
localparam SDRAM_READ_LATENCY    = 2;

//-----------------------------------------------------------------
// AXI Interface
//-----------------------------------------------------------------
wire [ 31:0]  ram_addr_w;
wire [  3:0]  ram_wr_w;
wire          ram_rd_w;
wire          ram_accept_w;
wire [ WIDTH_DA-1:0]  ram_write_data_w;
wire [ WIDTH_DA-1:0]  ram_read_data_w;
//wire [  7:0]  ram_len_w;
wire          ram_ack_w;
wire          ram_error_w;

sdram_axi_pmem 
#( 
    .WIDTH_AD(WIDTH_AD),
    .WIDTH_DA(WIDTH_DA),
    .WIDTH_ID(WIDTH_ID) 
) u_axi (
    .clk_i(clk_i),
    .rst_i(rst_i),

    // AXI port
    .axi_awvalid(inport_awvalid_i),
    .axi_awaddr(inport_awaddr_i),
    .axi_awid(inport_awid_i),
    .axi_awsize(inport_awsize_i),
    .axi_awlen(inport_awlen_i),
    .axi_awburst(inport_awburst_i),
    .axi_wvalid(inport_wvalid_i),
    .axi_wdata(inport_wdata_i),
    .axi_wstrb(inport_wstrb_i),
    .axi_wlast(inport_wlast_i),
    .axi_bready(inport_bready_i),
    .axi_arvalid(inport_arvalid_i),
    .axi_araddr(inport_araddr_i),
    .axi_arid(inport_arid_i),
    .axi_arsize(inport_arsize_i),
    .axi_arlen(inport_arlen_i),
    .axi_arburst(inport_arburst_i),
    .axi_rready(inport_rready_i),
    .axi_awready(inport_awready_o),
    .axi_wready(inport_wready_o),
    .axi_bvalid(inport_bvalid_o),
    .axi_bresp(inport_bresp_o),
    .axi_bid(inport_bid_o),
    .axi_arready(inport_arready_o),
    .axi_rvalid(inport_rvalid_o),
    .axi_rdata(inport_rdata_o),
    .axi_rresp(inport_rresp_o),
    .axi_rid(inport_rid_o),
    .axi_rlast(inport_rlast_o),
    
    // RAM interface
    .ram_addr_o(ram_addr_w),
    .ram_accept_i(ram_accept_w),
    .ram_wr_o(ram_wr_w),
    .ram_rd_o(ram_rd_w),
    //.ram_len_o(ram_len_w),
    .ram_write_data_o(ram_write_data_w),
    .ram_ack_i(ram_ack_w),
    .ram_error_i(ram_error_w),
    .ram_read_data_i(ram_read_data_w)
);

//-----------------------------------------------------------------
// SDRAM Controller
//-----------------------------------------------------------------
sdram_axi_core
#(
    //  .SDRAM_MHZ(SDRAM_MHZ)
    // ,.SDRAM_ADDR_W(SDRAM_ADDR_W)
    // ,.SDRAM_COL_W(SDRAM_COL_W)
    // ,.SDRAM_READ_LATENCY(SDRAM_READ_LATENCY)
     .WIDTH_AD(WIDTH_AD)
    ,.WIDTH_DA(WIDTH_DA)
    ,.WIDTH_ID(WIDTH_ID) 
)
u_core
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    // SDRAM timing
    //localparam SDRAM_START_DELAY     = 100000 / (1000 / SDRAM_MHZ); // 100uS
    //localparam SDRAM_REFRESH_CYCLES  = (64000*SDRAM_MHZ) / SDRAM_REFRESH_CNT-1;  SDRAM_REFRESH_CNT = 2048
    //localparam SDRAM_TRCD_CYCLES = (20 + (CYCLE_TIME_NS-1)) / CYCLE_TIME_NS;
    //localparam SDRAM_TRP_CYCLES  = (20 + (CYCLE_TIME_NS-1)) / CYCLE_TIME_NS;
    //localparam SDRAM_TRFC_CYCLES = (60 + (CYCLE_TIME_NS-1)) / CYCLE_TIME_NS;
    // default 50MHz
    ,.sdram_start_delay(sdram_start_delay)    
    ,.sdram_refresh_cycles(sdram_refresh_cycles)
    ,.sdram_trcd_cycles(sdram_trcd_cycles)
    ,.sdram_trp_cycles(sdram_trp_cycles)
    ,.sdram_trfc_cycles(sdram_trfc_cycles)

    ,.inport_wr_i(ram_wr_w)
    ,.inport_rd_i(ram_rd_w)
    //,.inport_len_i(ram_len_w)
    ,.inport_addr_i(ram_addr_w)
    ,.inport_write_data_i(ram_write_data_w)
    ,.inport_accept_o(ram_accept_w)
    ,.inport_ack_o(ram_ack_w)
    ,.inport_error_o(ram_error_w)
    ,.inport_read_data_o(ram_read_data_w)

    ,.sdram_clk_o(sdram_clk_o)
    ,.sdram_cke_o(sdram_cke_o)
    ,.sdram_cs_o(sdram_cs_o)
    ,.sdram_ras_o(sdram_ras_o)
    ,.sdram_cas_o(sdram_cas_o)
    ,.sdram_we_o(sdram_we_o)
    ,.sdram_dqm_o(sdram_dqm_o)
    ,.sdram_addr_o(sdram_addr_o)
    ,.sdram_ba_o(sdram_ba_o)
    ,.sdram_data_output_o(sdram_data_output_o)
    ,.sdram_data_out_en_o(sdram_data_out_en_o)
    ,.sdram_data_input_i(sdram_data_input_i)
);



endmodule
