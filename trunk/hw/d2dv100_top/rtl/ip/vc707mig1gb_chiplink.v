module vc707mig1gb_chiplink ( 
  // inout  [63:0] ddr3_dq, 
  // inout  [7:0]  ddr3_dqs_n, 
  // inout  [7:0]  ddr3_dqs_p, 

  // tx dfx 
  output wire [31:0] transferDataReg,
  output wire        send_1p_valid,
  // rx dfx
  output wire [31:0] b2c_data_concat,
  output wire        b2c_data_valid,

  output [11:0]      device_temp, 

  input wire mig_input_takeover_en,

  input         chiplink_clock,
  input         chiplink_reset,
  input         ddr_clock,
  input         ddr_reset,
  

`ifdef CHIPLINK_CONNECT_DIRECT_TL
  output  widget_auto_in_a_ready,
  input  widget_auto_in_a_valid,
  input [2:0] widget_auto_in_a_bits_opcode,
  input [2:0] widget_auto_in_a_bits_size,
  input [3:0] widget_auto_in_a_bits_source,
  input [31:0] widget_auto_in_a_bits_address,
  input [7:0] widget_auto_in_a_bits_mask,
  input [63:0] widget_auto_in_a_bits_data,
  input  widget_auto_in_d_ready,
  output  widget_auto_in_d_valid,
  output [2:0] widget_auto_in_d_bits_opcode,
  output [2:0] widget_auto_in_d_bits_size,
  output [3:0] widget_auto_in_d_bits_source,
  output  widget_auto_in_d_bits_denied,
  output [63:0] widget_auto_in_d_bits_data,
  output  widget_auto_in_d_bits_corrupt,
`else
  output  s_axi_rvalid, 
  output  s_axi_rlast, 
  output [1:0] s_axi_rresp, 
  output [63:0] s_axi_rdata, 
  output [3:0] s_axi_rid, 
  input  s_axi_rready, 
  output  s_axi_arready, 
  input  s_axi_arvalid, 
  input [3:0] s_axi_arqos, 
  input [2:0] s_axi_arprot, 
  input [3:0] s_axi_arcache, 
  input  s_axi_arlock, 
  input [1:0] s_axi_arburst, 
  input [2:0] s_axi_arsize, 
  input [7:0] s_axi_arlen, 
  input [29:0] s_axi_araddr, 
  input [3:0] s_axi_arid, 
  output  s_axi_bvalid, 
  output [1:0] s_axi_bresp, 
  output [3:0] s_axi_bid, 
  input  s_axi_bready, 
  output  s_axi_wready, 
  input  s_axi_wvalid, 
  input  s_axi_wlast, 
  input [7:0] s_axi_wstrb, 
  input [63:0] s_axi_wdata, 
  output  s_axi_awready, 
  input  s_axi_awvalid, 
  input [3:0] s_axi_awqos, 
  input [2:0] s_axi_awprot, 
  input [3:0] s_axi_awcache, 
  input  s_axi_awlock, 
  input [1:0] s_axi_awburst, 
  input [2:0] s_axi_awsize, 
  input [7:0] s_axi_awlen, 
  input [29:0] s_axi_awaddr, 
  input [3:0] s_axi_awid, 
`endif
  output  app_zq_ack, 
  output  app_ref_ack, 
  output  app_sr_active, 
  // input  app_zq_req, 
  // input  app_ref_req, 
  // input  app_sr_req, 
  input  sys_rst, 
  output  init_calib_complete, 
  input  aresetn, 
  output  mmcm_locked, 
  output ui_clk_sync_rst, 
  output ui_clk, 
  input  sys_clk_i, 


  // output  wire          sdram_clk_o,
  // output  wire          sdram_cke_o,
  // output  wire          sdram_cs_o,
  // output  wire          sdram_ras_o,
  // output  wire          sdram_cas_o,
  // output  wire          sdram_we_o,
  // output  wire [  1:0]  sdram_dqm_o,
  // output [ 12:0]  sdram_addr_o,
  // output [  1:0]  sdram_ba_o,

  // input  [ 15:0] sdram_data_input_i,
  // output [ 15:0]  sdram_data_output_o,
  // output         sdram_data_out_en_o,
  
   input  [  31:0] sdram_start_delay
  ,input  [  31:0] sdram_refresh_cycles
  ,input  [  31:0] sdram_trcd_cycles
  ,input  [  31:0] sdram_trp_cycles
  ,input  [  31:0] sdram_trfc_cycles,


  input  [15:0] ddr3_dqs_i,
  output [15:0] ddr3_dqs_o,
  output        ddr3_dqs_o_en,


  output  ddr3_odt, 
  output [1:0] ddr3_dm, 
  output  ddr3_cs_n, 
  output  ddr3_cke, 
  output  ddr3_ck_n, 
  output  ddr3_ck_p, 
  output  ddr3_reset_n, 
  output  ddr3_we_n, 
  output  ddr3_cas_n, 
  output  ddr3_ras_n, 
  output [1:0] ddr3_ba, 
  output [12:0] ddr3_addr 
  ,output  ddr_io_c2b_clk
  ,output  ddr_io_c2b_rst
  ,output  ddr_io_c2b_send
  ,output [7:0] ddr_io_c2b_data
  ,input  ddr_io_b2c_clk
  ,input  ddr_io_b2c_rst
  ,input  ddr_io_b2c_send
  ,input [7:0] ddr_io_b2c_data

  ,input  ddr_master_0_awready
  ,output  ddr_master_0_awvalid
  ,output [3:0] ddr_master_0_awid
  ,output [31:0] ddr_master_0_awaddr
  ,output [7:0] ddr_master_0_awlen
  ,output [2:0] ddr_master_0_awsize
  ,output [1:0] ddr_master_0_awburst
  ,input  ddr_master_0_wready
  ,output  ddr_master_0_wvalid
  ,output [63:0] ddr_master_0_wdata
  ,output [7:0] ddr_master_0_wstrb
  ,output  ddr_master_0_wlast
  ,output  ddr_master_0_bready
  ,input  ddr_master_0_bvalid
  ,input [3:0] ddr_master_0_bid
  ,input [1:0] ddr_master_0_bresp
  ,input  ddr_master_0_arready
  ,output  ddr_master_0_arvalid
  ,output [3:0] ddr_master_0_arid
  ,output [31:0] ddr_master_0_araddr
  ,output [7:0] ddr_master_0_arlen
  ,output [2:0] ddr_master_0_arsize
  ,output [1:0] ddr_master_0_arburst
  ,output  ddr_master_0_rready
  ,input  ddr_master_0_rvalid
  ,input [3:0] ddr_master_0_rid
  ,input [63:0] ddr_master_0_rdata
  ,input [1:0] ddr_master_0_rresp
  ,input  ddr_master_0_rlast 
  );


  wire  x2x_s_axi_rvalid; 
  wire  x2x_s_axi_rlast; 
  wire [1:0] x2x_s_axi_rresp; 
  wire [63:0] x2x_s_axi_rdata; 
  wire [3:0] x2x_s_axi_rid; 
  wire  x2x_s_axi_rready; 
  wire  x2x_s_axi_arready; 
  wire  x2x_s_axi_arvalid; 
  wire [3:0] x2x_s_axi_arqos; 
  wire [2:0] x2x_s_axi_arprot; 
  wire [3:0] x2x_s_axi_arcache; 
  wire  x2x_s_axi_arlock; 
  wire [1:0] x2x_s_axi_arburst; 
  wire [2:0] x2x_s_axi_arsize; 
  wire [7:0] x2x_s_axi_arlen; 
  wire [29:0] x2x_s_axi_araddr; 
  wire [29:0] x2x_s_axi_araddr_minus_10000000; 
  wire [3:0] x2x_s_axi_arid; 
  wire  x2x_s_axi_bvalid; 
  wire [1:0] x2x_s_axi_bresp; 
  wire [3:0] x2x_s_axi_bid; 
  wire  x2x_s_axi_bready; 
  wire  x2x_s_axi_wready; 
  wire  x2x_s_axi_wvalid; 
  wire  x2x_s_axi_wlast; 
  wire [7:0] x2x_s_axi_wstrb; 
  wire [63:0] x2x_s_axi_wdata; 
  wire  x2x_s_axi_awready; 
  wire  x2x_s_axi_awvalid; 
  wire [3:0] x2x_s_axi_awqos; 
  wire [2:0] x2x_s_axi_awprot; 
  wire [3:0] x2x_s_axi_awcache; 
  wire  x2x_s_axi_awlock; 
  wire [1:0] x2x_s_axi_awburst; 
  wire [2:0] x2x_s_axi_awsize; 
  wire [7:0] x2x_s_axi_awlen; 
  wire [29:0] x2x_s_axi_awaddr; 
  wire [29:0] x2x_s_axi_awaddr_minus_10000000; 
  wire [3:0] x2x_s_axi_awid;


  wire  x2x_m_axi_awready;
  wire  x2x_m_axi_awvalid;
  wire  [3:0] x2x_m_axi_awid;
  wire  [31:0] x2x_m_axi_awaddr;
  wire  [7:0] x2x_m_axi_awlen;
  wire  [2:0] x2x_m_axi_awsize;
  wire  [1:0] x2x_m_axi_awburst;
  wire  x2x_m_axi_wready;
  wire  x2x_m_axi_wvalid;
  wire  [63:0] x2x_m_axi_wdata;
  wire  [7:0] x2x_m_axi_wstrb;
  wire  x2x_m_axi_wlast;
  wire  x2x_m_axi_bready;
  wire  x2x_m_axi_bvalid;
  wire [3:0] x2x_m_axi_bid;
  wire [1:0] x2x_m_axi_bresp;
  wire  x2x_m_axi_arready;
  wire  x2x_m_axi_arvalid;
  wire  [3:0] x2x_m_axi_arid;
  wire  [31:0] x2x_m_axi_araddr;
  wire  [7:0] x2x_m_axi_arlen;
  wire  [2:0] x2x_m_axi_arsize;
  wire  [1:0] x2x_m_axi_arburst;
  wire  x2x_m_axi_rready;
  wire  x2x_m_axi_rvalid;
  wire [3:0] x2x_m_axi_rid;
  wire [63:0] x2x_m_axi_rdata;
  wire [1:0] x2x_m_axi_rresp;
  wire  x2x_m_axi_rlast;


  assign ui_clk = sys_clk_i;
  assign ui_clk_sync_rst = sys_rst;


  assign device_temp = 0; 
 
  assign app_zq_ack = 0; 
  assign app_ref_ack = 0; 
  assign app_sr_active = 0; 
  assign init_calib_complete = 0; 
  assign mmcm_locked = 1;   // control soc rst , need be 1

    
  assign  ddr3_ck_n = 1'b0; 
  assign  ddr3_reset_n = 1'b0;
  assign  ddr3_odt = 1'b0;
  


  wire  ddr_axi_slave_0_rvalid; 
  wire  ddr_axi_slave_0_rlast; 
  wire [1:0] ddr_axi_slave_0_rresp; 
  wire [63:0] ddr_axi_slave_0_rdata; 
  wire [4:0] ddr_axi_slave_0_rid; 
  wire  ddr_axi_slave_0_rready; 
  wire  ddr_axi_slave_0_arready; 
  wire  ddr_axi_slave_0_arvalid; 
  wire [3:0] ddr_axi_slave_0_arqos; 
  wire [2:0] ddr_axi_slave_0_arprot; 
  wire [3:0] ddr_axi_slave_0_arcache; 
  wire  ddr_axi_slave_0_arlock; 
  wire [1:0] ddr_axi_slave_0_arburst; 
  wire [2:0] ddr_axi_slave_0_arsize; 
  wire [7:0] ddr_axi_slave_0_arlen; 
  wire [31:0] ddr_axi_slave_0_araddr; 
  wire [4:0] ddr_axi_slave_0_arid; 
  wire  ddr_axi_slave_0_bvalid; 
  wire [1:0] ddr_axi_slave_0_bresp; 
  wire [4:0] ddr_axi_slave_0_bid; 
  wire  ddr_axi_slave_0_bready; 
  wire  ddr_axi_slave_0_wready; 
  wire  ddr_axi_slave_0_wvalid; 
  wire  ddr_axi_slave_0_wlast; 
  wire [7:0] ddr_axi_slave_0_wstrb; 
  wire [63:0] ddr_axi_slave_0_wdata; 
  wire  ddr_axi_slave_0_awready; 
  wire  ddr_axi_slave_0_awvalid; 
  wire [3:0] ddr_axi_slave_0_awqos; 
  wire [2:0] ddr_axi_slave_0_awprot; 
  wire [3:0] ddr_axi_slave_0_awcache; 
  wire  ddr_axi_slave_0_awlock; 
  wire [1:0] ddr_axi_slave_0_awburst; 
  wire [2:0] ddr_axi_slave_0_awsize; 
  wire [7:0] ddr_axi_slave_0_awlen; 
  wire [31:0] ddr_axi_slave_0_awaddr; 
  wire [4:0] ddr_axi_slave_0_awid;


  wire  ddr_axi_x2x_slave_0_rvalid; 
  wire  ddr_axi_x2x_slave_0_rlast; 
  wire [1:0] ddr_axi_x2x_slave_0_rresp; 
  wire [63:0] ddr_axi_x2x_slave_0_rdata; 
  wire [4:0] ddr_axi_x2x_slave_0_rid; 
  wire  ddr_axi_x2x_slave_0_rready; 
  wire  ddr_axi_x2x_slave_0_arready; 
  wire  ddr_axi_x2x_slave_0_arvalid; 
  wire [3:0] ddr_axi_x2x_slave_0_arqos; 
  wire [2:0] ddr_axi_x2x_slave_0_arprot; 
  wire [3:0] ddr_axi_x2x_slave_0_arcache; 
  wire  ddr_axi_x2x_slave_0_arlock; 
  wire [1:0] ddr_axi_x2x_slave_0_arburst; 
  wire [2:0] ddr_axi_x2x_slave_0_arsize; 
  wire [7:0] ddr_axi_x2x_slave_0_arlen; 
  wire [31:0] ddr_axi_x2x_slave_0_araddr; 
  wire [4:0] ddr_axi_x2x_slave_0_arid; 
  wire  ddr_axi_x2x_slave_0_bvalid; 
  wire [1:0] ddr_axi_x2x_slave_0_bresp; 
  wire [4:0] ddr_axi_x2x_slave_0_bid; 
  wire  ddr_axi_x2x_slave_0_bready; 
  wire  ddr_axi_x2x_slave_0_wready; 
  wire  ddr_axi_x2x_slave_0_wvalid; 
  wire  ddr_axi_x2x_slave_0_wlast; 
  wire [7:0] ddr_axi_x2x_slave_0_wstrb; 
  wire [63:0] ddr_axi_x2x_slave_0_wdata; 
  wire  ddr_axi_x2x_slave_0_awready; 
  wire  ddr_axi_x2x_slave_0_awvalid; 
  wire [3:0] ddr_axi_x2x_slave_0_awqos; 
  wire [2:0] ddr_axi_x2x_slave_0_awprot; 
  wire [3:0] ddr_axi_x2x_slave_0_awcache; 
  wire  ddr_axi_x2x_slave_0_awlock; 
  wire [1:0] ddr_axi_x2x_slave_0_awburst; 
  wire [2:0] ddr_axi_x2x_slave_0_awsize; 
  wire [7:0] ddr_axi_x2x_slave_0_awlen; 
  wire [31:0] ddr_axi_x2x_slave_0_awaddr; 
  wire [4:0] ddr_axi_x2x_slave_0_awid;



  wire  chiplink_axi_slave_ddr_clock_rvalid; 
  wire  chiplink_axi_slave_ddr_clock_rlast; 
  wire [1:0] chiplink_axi_slave_ddr_clock_rresp; 
  wire [63:0] chiplink_axi_slave_ddr_clock_rdata; 
  wire [4:0] chiplink_axi_slave_ddr_clock_rid; 
  wire  chiplink_axi_slave_ddr_clock_rready; 
  wire  chiplink_axi_slave_ddr_clock_arready; 
  wire  chiplink_axi_slave_ddr_clock_arvalid; 
  wire [3:0] chiplink_axi_slave_ddr_clock_arqos; 
  wire [2:0] chiplink_axi_slave_ddr_clock_arprot; 
  wire [3:0] chiplink_axi_slave_ddr_clock_arcache; 
  wire  chiplink_axi_slave_ddr_clock_arlock; 
  wire [1:0] chiplink_axi_slave_ddr_clock_arburst; 
  wire [2:0] chiplink_axi_slave_ddr_clock_arsize; 
  wire [7:0] chiplink_axi_slave_ddr_clock_arlen; 
  wire [31:0] chiplink_axi_slave_ddr_clock_araddr; 
  wire [31:0] chiplink_axi_slave_ddr_clock_araddr_plus_10000000; 
  wire [4:0] chiplink_axi_slave_ddr_clock_arid; 
  wire  chiplink_axi_slave_ddr_clock_bvalid; 
  wire [1:0] chiplink_axi_slave_ddr_clock_bresp; 
  wire [4:0] chiplink_axi_slave_ddr_clock_bid; 
  wire  chiplink_axi_slave_ddr_clock_bready; 
  wire  chiplink_axi_slave_ddr_clock_wready; 
  wire  chiplink_axi_slave_ddr_clock_wvalid; 
  wire  chiplink_axi_slave_ddr_clock_wlast; 
  wire [7:0] chiplink_axi_slave_ddr_clock_wstrb; 
  wire [63:0] chiplink_axi_slave_ddr_clock_wdata; 
  wire  chiplink_axi_slave_ddr_clock_awready; 
  wire  chiplink_axi_slave_ddr_clock_awvalid; 
  wire [3:0] chiplink_axi_slave_ddr_clock_awqos; 
  wire [2:0] chiplink_axi_slave_ddr_clock_awprot; 
  wire [3:0] chiplink_axi_slave_ddr_clock_awcache; 
  wire  chiplink_axi_slave_ddr_clock_awlock; 
  wire [1:0] chiplink_axi_slave_ddr_clock_awburst; 
  wire [2:0] chiplink_axi_slave_ddr_clock_awsize; 
  wire [7:0] chiplink_axi_slave_ddr_clock_awlen; 
  wire [31:0] chiplink_axi_slave_ddr_clock_awaddr; 
  wire [31:0] chiplink_axi_slave_ddr_clock_awaddr_plus_10000000; 
  wire [4:0] chiplink_axi_slave_ddr_clock_awid;

  wire  chiplink_axi_slave_rvalid; 
  wire  chiplink_axi_slave_rlast; 
  wire [1:0] chiplink_axi_slave_rresp; 
  wire [63:0] chiplink_axi_slave_rdata; 
  wire [4:0] chiplink_axi_slave_rid; 
  wire  chiplink_axi_slave_rready; 
  wire  chiplink_axi_slave_arready; 
  wire  chiplink_axi_slave_arvalid; 
  wire [3:0] chiplink_axi_slave_arqos; 
  wire [2:0] chiplink_axi_slave_arprot; 
  wire [3:0] chiplink_axi_slave_arcache; 
  wire  chiplink_axi_slave_arlock; 
  wire [1:0] chiplink_axi_slave_arburst; 
  wire [2:0] chiplink_axi_slave_arsize; 
  wire [7:0] chiplink_axi_slave_arlen; 
  wire [31:0] chiplink_axi_slave_araddr; 
  wire [4:0] chiplink_axi_slave_arid; 
  wire  chiplink_axi_slave_bvalid; 
  wire [1:0] chiplink_axi_slave_bresp; 
  wire [4:0] chiplink_axi_slave_bid; 
  wire  chiplink_axi_slave_bready; 
  wire  chiplink_axi_slave_wready; 
  wire  chiplink_axi_slave_wvalid; 
  wire  chiplink_axi_slave_wlast; 
  wire [7:0] chiplink_axi_slave_wstrb; 
  wire [63:0] chiplink_axi_slave_wdata; 
  wire  chiplink_axi_slave_awready; 
  wire  chiplink_axi_slave_awvalid; 
  wire [3:0] chiplink_axi_slave_awqos; 
  wire [2:0] chiplink_axi_slave_awprot; 
  wire [3:0] chiplink_axi_slave_awcache; 
  wire  chiplink_axi_slave_awlock; 
  wire [1:0] chiplink_axi_slave_awburst; 
  wire [2:0] chiplink_axi_slave_awsize; 
  wire [7:0] chiplink_axi_slave_awlen; 
  wire [31:0] chiplink_axi_slave_awaddr; 
  wire [4:0] chiplink_axi_slave_awid;

    // //   assign ui_clk_sync_rst = 0; 
    // //   assign ui_clk = 0; 
    // always #1ns ui_clk <= ~ui_clk;

    // initial begin
    //     ui_clk_sync_rst = 1;
    //     ui_clk = 0;
    //     #1000ns;
    //     ui_clk_sync_rst = 0;
    // end



  wire  chipLinkConverter_fpga_io_b2c_clk;
  wire  chipLinkConverter_fpga_io_b2c_rst;
  wire  chipLinkConverter_fpga_io_b2c_send;
  wire [7:0] chipLinkConverter_fpga_io_b2c_data;

`ifndef CHIPLINK_CONNECT_DIRECT_TL
  axi4_async_bridge #(
		// {{{
		 .AW_LGFIFO(4)	
		,.W_LGFIFO(4)
		,.AR_LGFIFO(4)
		,.B_LGFIFO(2)
		,.R_LGFIFO(2)

		,.WIDTH_SIZE(3)
		,.WIDTH_BURST_LEN(8)
		,.WIDTH_BURST(2)

		,.WIDTH_ID(4)
		,.WIDTH_RESP(2)
		
		,.WIDTH_ADDRESS(30)
		,.WIDTH_DATA(64)
  ) u_slave_axi4_async_bridge (

		.s_clk(sys_clk_i),
        .s_reset_n(~sys_rst),
		.m_clk(ddr_clock),
        .m_reset_n(~ddr_reset),
		//
		.s_awready(s_axi_awready),
		.s_awvalid(s_axi_awvalid),
		`ifdef AXI_HAVE_USER
		.s_awuser(s_axi_awuser),
        `endif
		.s_awsize(s_axi_awsize),
		.s_awlen(s_axi_awlen),
		.s_awburst(s_axi_awburst),
		.s_awaddr(s_axi_awaddr),
		.s_awid(s_axi_awid),

		.s_wdata(s_axi_wdata),
		.s_wstrb(s_axi_wstrb),
		.s_wlast(s_axi_wlast),
		.s_wready(s_axi_wready),
		.s_wvalid(s_axi_wvalid),
		`ifdef AXI_HAVE_USER
		.s_wuser(s_axi_wuser),
    `endif

		.s_arready(s_axi_arready),
		.s_arvalid(s_axi_arvalid),
		`ifdef AXI_HAVE_USER
		.s_aruser(s_axi_aruser),
    `endif
		.s_arsize(s_axi_arsize),
		.s_arlen(s_axi_arlen),
		.s_arburst(s_axi_arburst),
		.s_araddr(s_axi_araddr),
		.s_arid(s_axi_arid),

		.s_rdata(s_axi_rdata),
		.s_rresp(s_axi_rresp),
		.s_rid(s_axi_rid),
		.s_rlast(s_axi_rlast),
		.s_rready(s_axi_rready),
		.s_rvalid(s_axi_rvalid),

		.s_bid(s_axi_bid),
		.s_bresp(s_axi_bresp),
		.s_bready(s_axi_bready),
		.s_bvalid(s_axi_bvalid),
		
		// MASTER 
		.m_awready(x2x_s_axi_awready),
		.m_awvalid(x2x_s_axi_awvalid),
		`ifdef AXI_HAVE_USER
		.m_awuser(x2x_s_axi_awuser),
    `endif
		.m_awsize(x2x_s_axi_awsize),
		.m_awlen(x2x_s_axi_awlen),
		.m_awburst(x2x_s_axi_awburst),
		.m_awaddr(x2x_s_axi_awaddr),
		.m_awid(x2x_s_axi_awid),

		.m_wdata(x2x_s_axi_wdata),
		.m_wstrb(x2x_s_axi_wstrb),
		.m_wlast(x2x_s_axi_wlast),
		.m_wready(x2x_s_axi_wready),
		.m_wvalid(x2x_s_axi_wvalid),
		`ifdef AXI_HAVE_USER
		.m_wuser(x2x_s_axi_wuser),
    `endif

		.m_arready(x2x_s_axi_arready),
		.m_arvalid(x2x_s_axi_arvalid),
		`ifdef AXI_HAVE_USER
		.m_aruser(x2x_s_axi_aruser),
    `endif
		.m_arsize(x2x_s_axi_arsize),
		.m_arlen(x2x_s_axi_arlen),
		.m_arburst(x2x_s_axi_arburst),
		.m_araddr(x2x_s_axi_araddr),
		.m_arid(x2x_s_axi_arid),

		.m_rdata(x2x_s_axi_rdata),
		.m_rresp(x2x_s_axi_rresp),
		.m_rid(x2x_s_axi_rid),
		.m_rlast(x2x_s_axi_rlast),
		.m_rready(x2x_s_axi_rready),
		.m_rvalid(x2x_s_axi_rvalid),

		.m_bid(x2x_s_axi_bid),
		.m_bresp(x2x_s_axi_bresp),
		.m_bready(x2x_s_axi_bready),
		.m_bvalid(x2x_s_axi_bvalid)
	);

  // instanitate 1x2 bus for ddr and chiplink, ddr is 8000_0000 addr, chiplink is c000_0000 addr


//--------------------------------------------------------------
  wire  [4-1:0]     SLAVE_BUS_M1_UNUSED_AWID;
  wire  [32-1:0]      SLAVE_BUS_M1_UNUSED_AWADDR;
  wire  [ 7:0]              SLAVE_BUS_M1_UNUSED_AWLEN;
  wire                      SLAVE_BUS_M1_UNUSED_AWLOCK;
  wire  [ 2:0]              SLAVE_BUS_M1_UNUSED_AWSIZE;
  wire  [ 1:0]              SLAVE_BUS_M1_UNUSED_AWBURST;
     `ifdef  AMBA_AXI_CACHE
  wire  [ 3:0]              SLAVE_BUS_M1_UNUSED_AWCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
  wire  [ 2:0]              SLAVE_BUS_M1_UNUSED_AWPROT;
     `endif
  wire                      SLAVE_BUS_M1_UNUSED_AWVALID;
  wire                      SLAVE_BUS_M1_UNUSED_AWREADY;
     `ifdef AMBA_QOS
  wire  [ 3:0]              SLAVE_BUS_M1_UNUSED_AWQOS;
  wire  [ 3:0]              SLAVE_BUS_M1_UNUSED_AWREGION;
     `endif
     `ifdef AMBA_AXI_AWUSER
  wire  [1-1:0]  SLAVE_BUS_M1_UNUSED_AWUSER;
     `endif
  wire   [64-1:0]     SLAVE_BUS_M1_UNUSED_WDATA;
  wire   [8-1:0]     SLAVE_BUS_M1_UNUSED_WSTRB;
  wire                      SLAVE_BUS_M1_UNUSED_WLAST;
  wire                      SLAVE_BUS_M1_UNUSED_WVALID;
  wire                      SLAVE_BUS_M1_UNUSED_WREADY;
     `ifdef AMBA_AXI_WUSER
  wire   [1-1:0]  SLAVE_BUS_M1_UNUSED_WUSER;
     `endif
  wire   [4-1:0]    SLAVE_BUS_M1_UNUSED_BID;
  wire   [ 1:0]             SLAVE_BUS_M1_UNUSED_BRESP;
  wire                      SLAVE_BUS_M1_UNUSED_BVALID;
  wire                      SLAVE_BUS_M1_UNUSED_BREADY;
     `ifdef AMBA_AXI_BUSER
  wire   [1-1:0]  SLAVE_BUS_M1_UNUSED_BUSER;
     `endif
  wire   [4-1:0]    SLAVE_BUS_M1_UNUSED_ARID;
  wire   [32-1:0]     SLAVE_BUS_M1_UNUSED_ARADDR;
  wire   [ 7:0]             SLAVE_BUS_M1_UNUSED_ARLEN;
  wire                      SLAVE_BUS_M1_UNUSED_ARLOCK;
  wire   [ 2:0]             SLAVE_BUS_M1_UNUSED_ARSIZE;
  wire   [ 1:0]             SLAVE_BUS_M1_UNUSED_ARBURST;
     `ifdef  AMBA_AXI_CACHE
  wire   [ 3:0]             SLAVE_BUS_M1_UNUSED_ARCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
  wire   [ 2:0]             SLAVE_BUS_M1_UNUSED_ARPROT;
     `endif
  wire                      SLAVE_BUS_M1_UNUSED_ARVALID;
  wire                      SLAVE_BUS_M1_UNUSED_ARREADY;
     `ifdef AMBA_QOS
  wire   [ 3:0]             SLAVE_BUS_M1_UNUSED_ARQOS;
  wire   [ 3:0]             SLAVE_BUS_M1_UNUSED_ARREGION;
     `endif
     `ifdef AMBA_AXI_ARUSER
  wire   [1-1:0] SLAVE_BUS_M1_UNUSED_ARUSER;
     `endif
  wire   [4-1:0]    SLAVE_BUS_M1_UNUSED_RID;
  wire   [64-1:0]     SLAVE_BUS_M1_UNUSED_RDATA;
  wire   [ 1:0]             SLAVE_BUS_M1_UNUSED_RRESP;
  wire                      SLAVE_BUS_M1_UNUSED_RLAST;
  wire                      SLAVE_BUS_M1_UNUSED_RVALID;
  wire                      SLAVE_BUS_M1_UNUSED_RREADY;
     `ifdef AMBA_AXI_RUSER
  wire   [1-1:0]  SLAVE_BUS_M1_UNUSED_RUSER;
     `endif

  assign SLAVE_BUS_M1_UNUSED_AWID = 4'h0;
  assign SLAVE_BUS_M1_UNUSED_AWADDR = 28'h0;
  assign SLAVE_BUS_M1_UNUSED_AWLEN = 8'h0;
  assign SLAVE_BUS_M1_UNUSED_AWLOCK = 1'h0;
  assign SLAVE_BUS_M1_UNUSED_AWSIZE = 3'h0;
  assign SLAVE_BUS_M1_UNUSED_AWBURST = 2'h0;
     `ifdef  AMBA_AXI_CACHE
  assign SLAVE_BUS_M1_UNUSED_AWCACHE = 4'h0;
     `endif
     `ifdef AMBA_AXI_PROT
  assign SLAVE_BUS_M1_UNUSED_AWPROT = 3'h0;
     `endif
  assign SLAVE_BUS_M1_UNUSED_AWVALID = 1'h0;
     `ifdef AMBA_QOS
  assign SLAVE_BUS_M1_UNUSED_AWQOS = 4'h0;
  assign SLAVE_BUS_M1_UNUSED_AWREGION = 4'h0;
     `endif
     `ifdef AMBA_AXI_AWUSER
  assign SLAVE_BUS_M1_UNUSED_AWUSER = 1'h0;
     `endif
  assign SLAVE_BUS_M1_UNUSED_WDATA = 64'h0;
  assign SLAVE_BUS_M1_UNUSED_WSTRB = 8'h0;
  assign SLAVE_BUS_M1_UNUSED_WLAST = 1'h0;
  assign SLAVE_BUS_M1_UNUSED_WVALID = 1'h0;
     `ifdef AMBA_AXI_WUSER
  assign SLAVE_BUS_M1_UNUSED_WUSER = 1'h0;
     `endif
  assign SLAVE_BUS_M1_UNUSED_BREADY = 1'h0;

  assign SLAVE_BUS_M1_UNUSED_ARID = 4'h0;
  assign SLAVE_BUS_M1_UNUSED_ARADDR = 28'h0;
  assign SLAVE_BUS_M1_UNUSED_ARLEN = 8'h0;
  assign SLAVE_BUS_M1_UNUSED_ARLOCK = 1'h0;
  assign SLAVE_BUS_M1_UNUSED_ARSIZE = 3'h0;
  assign SLAVE_BUS_M1_UNUSED_ARBURST = 2'h0;
     `ifdef  AMBA_AXI_CACHE
  assign SLAVE_BUS_M1_UNUSED_ARCACHE = 4'h0;
     `endif
     `ifdef AMBA_AXI_PROT
  assign SLAVE_BUS_M1_UNUSED_ARPROT = 3'h0;
     `endif
  assign SLAVE_BUS_M1_UNUSED_ARVALID = 1'h0;
     `ifdef AMBA_QOS
  assign SLAVE_BUS_M1_UNUSED_ARQOS = 4'h0;
  assign SLAVE_BUS_M1_UNUSED_ARREGION = 4'h0;
     `endif
     `ifdef AMBA_AXI_ARUSER
  assign SLAVE_BUS_M1_UNUSED_ARUSER = `'h0;
     `endif
  assign SLAVE_BUS_M1_UNUSED_RREADY = 1'h0;


  assign x2x_s_axi_awaddr_minus_10000000 = x2x_s_axi_awaddr - 30'h0000_0000;
  assign x2x_s_axi_araddr_minus_10000000 = x2x_s_axi_araddr - 30'h0000_0000;
  
  assign chiplink_axi_slave_ddr_clock_awaddr_plus_10000000 = chiplink_axi_slave_ddr_clock_awaddr + 32'h1000_0000;
  assign chiplink_axi_slave_ddr_clock_araddr_plus_10000000 = chiplink_axi_slave_ddr_clock_araddr + 32'h1000_0000;

  AMBA_XBAR_M2S2
        #(.NUM_MASTER(2)  // should not be changed
          ,.NUM_SLAVE(2)  // should not be changed
          ,.WIDTH_ID(4) // ID width in bits
          ,.WIDTH_AD(32) // address width
          ,.WIDTH_DA(64) // data width
                  `ifdef AMBA_AXI_AWUSER
          ,.WIDTH_AWUSER(1) // Write-address user path
                  `endif
                  `ifdef AMBA_AXI_WUSER
          ,.WIDTH_WUSER(1) // Write-data user path
                  `endif
                  `ifdef AMBA_AXI_BUSER
          ,.WIDTH_BUSER(1) // Write-response user path
                  `endif
                  `ifdef AMBA_AXI_ARUSER
          ,.WIDTH_ARUSER(1) // read-address user path
                  `endif
                  `ifdef AMBA_AXI_RUSER
          ,.WIDTH_RUSER(1) // read-data user path
                  `endif
          ,.SLAVE_EN0(1) 
          ,.ADDR_LENGTH0(29) // effective address bits-widgh  1G
          ,.SLAVE_EN1(1) 
          ,.ADDR_LENGTH1(29) // effective address bits-widgh  1G
          ,.ADDR_BASE1(32'h0000_0000)
          ,.ADDR_BASE0(32'h2000_0000)
        )
    U_MIG_DDR_CHIPLINK_BUS(
       .ARESETn(~ddr_reset)
      ,.ACLK(ddr_clock)
      //--------------------------------------------------------------
      ,.S0_AWID(ddr_axi_x2x_slave_0_awid)
      ,.S0_AWADDR({ddr_axi_x2x_slave_0_awaddr})
      ,.S0_AWLEN(ddr_axi_x2x_slave_0_awlen)
      ,.S0_AWLOCK()
      ,.S0_AWSIZE(ddr_axi_x2x_slave_0_awsize)
      ,.S0_AWBURST(ddr_axi_x2x_slave_0_awburst)
        `ifdef  AMBA_AXI_CACHE
      ,.S0_AWCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S0_AWPROT(3'b0)
        `endif
      ,.S0_AWVALID(ddr_axi_x2x_slave_0_awvalid)
      ,.S0_AWREADY(ddr_axi_x2x_slave_0_awready)
        `ifdef AMBA_QOS
      ,.S0_AWQOS(4'b0)
      ,.S0_AWREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.S0_AWUSER(1'b0)
        `endif
      ,.S0_WDATA(ddr_axi_x2x_slave_0_wdata)
      ,.S0_WSTRB(ddr_axi_x2x_slave_0_wstrb)
      ,.S0_WLAST(ddr_axi_x2x_slave_0_wlast)
      ,.S0_WVALID(ddr_axi_x2x_slave_0_wvalid)
      ,.S0_WREADY(ddr_axi_x2x_slave_0_wready)
        `ifdef AMBA_AXI_WUSER
      ,.S0_WUSER(1'b0)
        `endif
      ,.S0_BID(ddr_axi_x2x_slave_0_bid)
      ,.S0_BRESP(ddr_axi_x2x_slave_0_bresp)
      ,.S0_BVALID(ddr_axi_x2x_slave_0_bvalid)
      ,.S0_BREADY(ddr_axi_x2x_slave_0_bready)
        `ifdef AMBA_AXI_BUSER
      ,.S0_BUSER(1'b0)
        `endif
      ,.S0_ARID(ddr_axi_x2x_slave_0_arid)
      ,.S0_ARADDR({ddr_axi_x2x_slave_0_araddr})
      ,.S0_ARLEN(ddr_axi_x2x_slave_0_arlen)
      ,.S0_ARLOCK()
      ,.S0_ARSIZE(ddr_axi_x2x_slave_0_arsize)
      ,.S0_ARBURST(ddr_axi_x2x_slave_0_arburst)
        `ifdef  AMBA_AXI_CACHE
      ,.S0_ARCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S0_ARPROT(3'b0)
        `endif
      ,.S0_ARVALID(ddr_axi_x2x_slave_0_arvalid)
      ,.S0_ARREADY(ddr_axi_x2x_slave_0_arready)
        `ifdef AMBA_QOS
      ,.S0_ARQOS(4'b0)
      ,.S0_ARREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.S0_ARUSER(1'b0)
        `endif
      ,.S0_RID(ddr_axi_x2x_slave_0_rid)
      ,.S0_RDATA(ddr_axi_x2x_slave_0_rdata)
      ,.S0_RRESP(ddr_axi_x2x_slave_0_rresp)
      ,.S0_RLAST(ddr_axi_x2x_slave_0_rlast)
      ,.S0_RVALID(ddr_axi_x2x_slave_0_rvalid)
      ,.S0_RREADY(ddr_axi_x2x_slave_0_rready)
        `ifdef AMBA_AXI_RUSER
      ,.S0_RUSER()
        `endif
        //--------------------------------------------------------------
      ,.S1_AWID(chiplink_axi_slave_ddr_clock_awid)
      ,.S1_AWADDR({chiplink_axi_slave_ddr_clock_awaddr})
      ,.S1_AWLEN(chiplink_axi_slave_ddr_clock_awlen)
      ,.S1_AWLOCK()
      ,.S1_AWSIZE(chiplink_axi_slave_ddr_clock_awsize)
      ,.S1_AWBURST(chiplink_axi_slave_ddr_clock_awburst)
        `ifdef  AMBA_AXI_CACHE
      ,.S1_AWCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S1_AWPROT(3'b0)
        `endif
      ,.S1_AWVALID(chiplink_axi_slave_ddr_clock_awvalid)
      ,.S1_AWREADY(chiplink_axi_slave_ddr_clock_awready)
        `ifdef AMBA_QOS
      ,.S1_AWQOS(4'b0)
      ,.S1_AWREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.S1_AWUSER(1'b0)
        `endif
      ,.S1_WDATA(chiplink_axi_slave_ddr_clock_wdata)
      ,.S1_WSTRB(chiplink_axi_slave_ddr_clock_wstrb)
      ,.S1_WLAST(chiplink_axi_slave_ddr_clock_wlast)
      ,.S1_WVALID(chiplink_axi_slave_ddr_clock_wvalid)
      ,.S1_WREADY(chiplink_axi_slave_ddr_clock_wready)
        `ifdef AMBA_AXI_WUSER
      ,.S1_WUSER(1'b0)
        `endif
      ,.S1_BID(chiplink_axi_slave_ddr_clock_bid)
      ,.S1_BRESP(chiplink_axi_slave_ddr_clock_bresp)
      ,.S1_BVALID(chiplink_axi_slave_ddr_clock_bvalid)
      ,.S1_BREADY(chiplink_axi_slave_ddr_clock_bready)
        `ifdef AMBA_AXI_BUSER
      ,.S1_BUSER(1'b0)
        `endif
      ,.S1_ARID(chiplink_axi_slave_ddr_clock_arid)
      ,.S1_ARADDR({chiplink_axi_slave_ddr_clock_araddr})
      ,.S1_ARLEN(chiplink_axi_slave_ddr_clock_arlen)
      ,.S1_ARLOCK()
      ,.S1_ARSIZE(chiplink_axi_slave_ddr_clock_arsize)
      ,.S1_ARBURST(chiplink_axi_slave_ddr_clock_arburst)
        `ifdef  AMBA_AXI_CACHE
      ,.S1_ARCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S1_ARPROT(3'b0)
        `endif
      ,.S1_ARVALID(chiplink_axi_slave_ddr_clock_arvalid)
      ,.S1_ARREADY(chiplink_axi_slave_ddr_clock_arready)
        `ifdef AMBA_QOS
      ,.S1_ARQOS(4'b0)
      ,.S1_ARREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.S1_ARUSER(1'b0)
        `endif
      ,.S1_RID(chiplink_axi_slave_ddr_clock_rid)
      ,.S1_RDATA(chiplink_axi_slave_ddr_clock_rdata)
      ,.S1_RRESP(chiplink_axi_slave_ddr_clock_rresp)
      ,.S1_RLAST(chiplink_axi_slave_ddr_clock_rlast)
      ,.S1_RVALID(chiplink_axi_slave_ddr_clock_rvalid)
      ,.S1_RREADY(chiplink_axi_slave_ddr_clock_rready)
        `ifdef AMBA_AXI_RUSER
      ,.S1_RUSER()
        `endif
        //--------------------------------------------------------------

      ,.M0_AWID(x2x_s_axi_awid)
      ,.M0_AWADDR({2'b0, x2x_s_axi_awaddr_minus_10000000[29:0]})
      ,.M0_AWLEN(x2x_s_axi_awlen)
      ,.M0_AWLOCK(1'b0)
      ,.M0_AWSIZE(x2x_s_axi_awsize)
      ,.M0_AWBURST(x2x_s_axi_awburst)
        `ifdef  AMBA_AXI_CACHE
      ,.M0_AWCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.M0_AWPROT(3'b0)
        `endif 
      ,.M0_AWVALID(x2x_s_axi_awvalid)
      ,.M0_AWREADY(x2x_s_axi_awready)
        `ifdef AMBA_QOS
      ,.M0_AWQOS(4'b0)
      ,.M0_AWREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.M0_AWUSER(1'b0)
        `endif
      ,.M0_WDATA(x2x_s_axi_wdata)
      ,.M0_WSTRB(x2x_s_axi_wstrb)
      ,.M0_WLAST(x2x_s_axi_wlast)
      ,.M0_WVALID(x2x_s_axi_wvalid)
      ,.M0_WREADY(x2x_s_axi_wready)
        `ifdef AMBA_AXI_WUSER
      ,.M0_WUSER(1'b0)
        `endif
      ,.M0_BID(x2x_s_axi_bid)
      ,.M0_BRESP(x2x_s_axi_bresp)
      ,.M0_BVALID(x2x_s_axi_bvalid)
      ,.M0_BREADY(x2x_s_axi_bready)
        `ifdef AMBA_AXI_BUSER
      ,.M0_BUSER(1'b0)
        `endif
      ,.M0_ARID(x2x_s_axi_arid)
      ,.M0_ARADDR({2'b0, x2x_s_axi_araddr_minus_10000000[29:0]})
      ,.M0_ARLEN(x2x_s_axi_arlen)
      ,.M0_ARLOCK(1'b0)
      ,.M0_ARSIZE(x2x_s_axi_arsize)
      ,.M0_ARBURST(x2x_s_axi_arburst)
        `ifdef  AMBA_AXI_CACHE
      ,.M0_ARCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.M0_ARPROT(3'b0)
        `endif
      ,.M0_ARVALID(x2x_s_axi_arvalid)
      ,.M0_ARREADY(x2x_s_axi_arready)
        `ifdef AMBA_QOS
      ,.M0_ARQOS(4'b0)
      ,.M0_ARREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.M0_ARUSER(1'b0)
        `endif
      ,.M0_RID(x2x_s_axi_rid)
      ,.M0_RDATA(x2x_s_axi_rdata)
      ,.M0_RRESP(x2x_s_axi_rresp)
      ,.M0_RLAST(x2x_s_axi_rlast)
      ,.M0_RVALID(x2x_s_axi_rvalid)
      ,.M0_RREADY(x2x_s_axi_rready)
        `ifdef AMBA_AXI_RUSER
      ,.M0_RUSER()
        `endif
        //--------------------------------------------------------------
      ,.M1_AWID(SLAVE_BUS_M1_UNUSED_AWID)
      ,.M1_AWADDR(SLAVE_BUS_M1_UNUSED_AWADDR)
      ,.M1_AWLEN(SLAVE_BUS_M1_UNUSED_AWLEN)
      ,.M1_AWLOCK(SLAVE_BUS_M1_UNUSED_AWLOCK)
      ,.M1_AWSIZE(SLAVE_BUS_M1_UNUSED_AWSIZE)
      ,.M1_AWBURST(SLAVE_BUS_M1_UNUSED_AWBURST)
        `ifdef  AMBA_AXI_CACHE
      ,.M1_AWCACHE(SLAVE_BUS_M1_UNUSED_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.M1_AWPROT(SLAVE_BUS_M1_UNUSED_AWPROT)
        `endif
      ,.M1_AWVALID(SLAVE_BUS_M1_UNUSED_AWVALID)
      ,.M1_AWREADY(SLAVE_BUS_M1_UNUSED_AWREADY)
        `ifdef AMBA_QOS
      ,.M1_AWQOS(SLAVE_BUS_M1_UNUSED_AWQOS)
      ,.M1_AWREGION(SLAVE_BUS_M1_UNUSED_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.M1_AWUSER(SLAVE_BUS_M1_UNUSED_AWUSER)
        `endif
      ,.M1_WDATA(SLAVE_BUS_M1_UNUSED_WDATA)
      ,.M1_WSTRB(SLAVE_BUS_M1_UNUSED_WSTRB)
      ,.M1_WLAST(SLAVE_BUS_M1_UNUSED_WLAST)
      ,.M1_WVALID(SLAVE_BUS_M1_UNUSED_WVALID)
      ,.M1_WREADY(SLAVE_BUS_M1_UNUSED_WREADY)
        `ifdef AMBA_AXI_WUSER
      ,.M1_WUSER(SLAVE_BUS_M1_UNUSED_WUSER)
        `endif
      ,.M1_BID(SLAVE_BUS_M1_UNUSED_BID)
      ,.M1_BRESP(SLAVE_BUS_M1_UNUSED_BRESP)
      ,.M1_BVALID(SLAVE_BUS_M1_UNUSED_BVALID)
      ,.M1_BREADY(SLAVE_BUS_M1_UNUSED_BREADY)
        `ifdef AMBA_AXI_BUSER
      ,.M1_BUSER(SLAVE_BUS_M1_UNUSED_BUSER)
        `endif
      ,.M1_ARID(SLAVE_BUS_M1_UNUSED_ARID)
      ,.M1_ARADDR(SLAVE_BUS_M1_UNUSED_ARADDR)
      ,.M1_ARLEN(SLAVE_BUS_M1_UNUSED_ARLEN)
      ,.M1_ARLOCK(SLAVE_BUS_M1_UNUSED_ARLOCK)
      ,.M1_ARSIZE(SLAVE_BUS_M1_UNUSED_ARSIZE)
      ,.M1_ARBURST(SLAVE_BUS_M1_UNUSED_ARBURST)
        `ifdef  AMBA_AXI_CACHE
      ,.M1_ARCACHE(SLAVE_BUS_M1_UNUSED_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.M1_ARPROT(SLAVE_BUS_M1_UNUSED_ARPROT)
        `endif
      ,.M1_ARVALID(SLAVE_BUS_M1_UNUSED_ARVALID)
      ,.M1_ARREADY(SLAVE_BUS_M1_UNUSED_ARREADY)
        `ifdef AMBA_QOS
      ,.M1_ARQOS(SLAVE_BUS_M1_UNUSED_ARQOS)
      ,.M1_ARREGION(SLAVE_BUS_M1_UNUSED_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.M1_ARUSER(SLAVE_BUS_M1_UNUSED_ARUSER)
        `endif
      ,.M1_RID(SLAVE_BUS_M1_UNUSED_RID)
      ,.M1_RDATA(SLAVE_BUS_M1_UNUSED_RDATA)
      ,.M1_RRESP(SLAVE_BUS_M1_UNUSED_RRESP)
      ,.M1_RLAST(SLAVE_BUS_M1_UNUSED_RLAST)
      ,.M1_RVALID(SLAVE_BUS_M1_UNUSED_RVALID)
      ,.M1_RREADY(SLAVE_BUS_M1_UNUSED_RREADY)
        `ifdef AMBA_AXI_RUSER
      ,.M1_RUSER(SLAVE_BUS_M1_UNUSED_RUSER)
      `endif
  );


  axi4_async_bridge #(
		// {{{
		 .AW_LGFIFO(4)	
		,.W_LGFIFO(4)
		,.AR_LGFIFO(4)
		,.B_LGFIFO(2)
		,.R_LGFIFO(2)

		,.WIDTH_SIZE(3)
		,.WIDTH_BURST_LEN(8)
		,.WIDTH_BURST(2)

		,.WIDTH_ID(5)
		,.WIDTH_RESP(2)
		
		,.WIDTH_ADDRESS(32)
		,.WIDTH_DATA(64)
  ) u_ddr_slave_axi4_async_bridge_for_deadlock (

		.s_clk(ddr_clock),
        .s_reset_n(~ddr_reset),
		.m_clk(ddr_clock),
        .m_reset_n(~ddr_reset),
		//
		.s_awready(ddr_axi_x2x_slave_0_awready),
		.s_awvalid(ddr_axi_x2x_slave_0_awvalid),
		`ifdef AXI_HAVE_USER
		.s_awuser(ddr_axi_x2x_slave_0_awuser),
        `endif
		.s_awsize(ddr_axi_x2x_slave_0_awsize),
		.s_awlen(ddr_axi_x2x_slave_0_awlen),
		.s_awburst(ddr_axi_x2x_slave_0_awburst),
		.s_awaddr(ddr_axi_x2x_slave_0_awaddr),
		.s_awid(ddr_axi_x2x_slave_0_awid),

		.s_wdata(ddr_axi_x2x_slave_0_wdata),
		.s_wstrb(ddr_axi_x2x_slave_0_wstrb),
		.s_wlast(ddr_axi_x2x_slave_0_wlast),
		.s_wready(ddr_axi_x2x_slave_0_wready),
		.s_wvalid(ddr_axi_x2x_slave_0_wvalid),
		`ifdef AXI_HAVE_USER
		.s_wuser(ddr_axi_x2x_slave_0_wuser),
    `endif

		.s_arready(ddr_axi_x2x_slave_0_arready),
		.s_arvalid(ddr_axi_x2x_slave_0_arvalid),
		`ifdef AXI_HAVE_USER
		.s_aruser(ddr_axi_x2x_slave_0_aruser),
    `endif
		.s_arsize(ddr_axi_x2x_slave_0_arsize),
		.s_arlen(ddr_axi_x2x_slave_0_arlen),
		.s_arburst(ddr_axi_x2x_slave_0_arburst),
		.s_araddr(ddr_axi_x2x_slave_0_araddr),
		.s_arid(ddr_axi_x2x_slave_0_arid),

		.s_rdata(ddr_axi_x2x_slave_0_rdata),
		.s_rresp(ddr_axi_x2x_slave_0_rresp),
		.s_rid(ddr_axi_x2x_slave_0_rid),
		.s_rlast(ddr_axi_x2x_slave_0_rlast),
		.s_rready(ddr_axi_x2x_slave_0_rready),
		.s_rvalid(ddr_axi_x2x_slave_0_rvalid),

		.s_bid(ddr_axi_x2x_slave_0_bid),
		.s_bresp(ddr_axi_x2x_slave_0_bresp),
		.s_bready(ddr_axi_x2x_slave_0_bready),
		.s_bvalid(ddr_axi_x2x_slave_0_bvalid),
		
		// MASTER 
		.m_awready(ddr_axi_slave_0_awready),
		.m_awvalid(ddr_axi_slave_0_awvalid),
		`ifdef AXI_HAVE_USER
		.m_awuser(ddr_axi_slave_0_awuser),
    `endif
		.m_awsize(ddr_axi_slave_0_awsize),
		.m_awlen(ddr_axi_slave_0_awlen),
		.m_awburst(ddr_axi_slave_0_awburst),
		.m_awaddr(ddr_axi_slave_0_awaddr),
		.m_awid(ddr_axi_slave_0_awid),

		.m_wdata(ddr_axi_slave_0_wdata),
		.m_wstrb(ddr_axi_slave_0_wstrb),
		.m_wlast(ddr_axi_slave_0_wlast),
		.m_wready(ddr_axi_slave_0_wready),
		.m_wvalid(ddr_axi_slave_0_wvalid),
		`ifdef AXI_HAVE_USER
		.m_wuser(ddr_axi_slave_0_wuser),
    `endif

		.m_arready(ddr_axi_slave_0_arready),
		.m_arvalid(ddr_axi_slave_0_arvalid),
		`ifdef AXI_HAVE_USER
		.m_aruser(ddr_axi_slave_0_aruser),
    `endif
		.m_arsize(ddr_axi_slave_0_arsize),
		.m_arlen(ddr_axi_slave_0_arlen),
		.m_arburst(ddr_axi_slave_0_arburst),
		.m_araddr(ddr_axi_slave_0_araddr),
		.m_arid(ddr_axi_slave_0_arid),

		.m_rdata(ddr_axi_slave_0_rdata),
		.m_rresp(ddr_axi_slave_0_rresp),
		.m_rid(ddr_axi_slave_0_rid),
		.m_rlast(ddr_axi_slave_0_rlast),
		.m_rready(ddr_axi_slave_0_rready),
		.m_rvalid(ddr_axi_slave_0_rvalid),

		.m_bid(ddr_axi_slave_0_bid),
		.m_bresp(ddr_axi_slave_0_bresp),
		.m_bready(ddr_axi_slave_0_bready),
		.m_bvalid(ddr_axi_slave_0_bvalid)
	);

assign ddr_axi_slave_0_rid[4] = 1'b0;
assign ddr_axi_slave_0_bid[4] = 1'b0;


`ifndef DONOT_ADD_X2X_BRIDGE

      
  assign ddr_axi_slave_0_awcache = 4'b0;
  assign ddr_axi_slave_0_arcache = 4'b0;
  assign ddr_axi_slave_0_awqos = 4'b0;
  assign ddr_axi_slave_0_arqos = 4'b0;
  assign ddr_axi_slave_0_awprot = 3'b0;
  assign ddr_axi_slave_0_arprot = 3'b0;
  assign ddr_axi_slave_0_awlock = 1'b0;
  assign ddr_axi_slave_0_arlock = 1'b0;
  

  sdram_wrapper u_sdram_wrapper( 

     .mig_input_takeover_en(mig_input_takeover_en) // input

    ,.ddr_clock(ddr_clock) // input
    ,.ddr_reset(ddr_reset) // input
  
    ,.ddr_axi_slave_0_rvalid(ddr_axi_slave_0_rvalid) // output 
    ,.ddr_axi_slave_0_rlast(ddr_axi_slave_0_rlast) // output 
    ,.ddr_axi_slave_0_rresp(ddr_axi_slave_0_rresp) // output 
    ,.ddr_axi_slave_0_rdata(ddr_axi_slave_0_rdata) // output 
    ,.ddr_axi_slave_0_rid(ddr_axi_slave_0_rid[3:0]) // output 
    ,.ddr_axi_slave_0_rready(ddr_axi_slave_0_rready) // input 
    ,.ddr_axi_slave_0_arready(ddr_axi_slave_0_arready) // output 
    ,.ddr_axi_slave_0_arvalid(ddr_axi_slave_0_arvalid) // input 
    ,.ddr_axi_slave_0_arqos(ddr_axi_slave_0_arqos) // input 
    ,.ddr_axi_slave_0_arprot(ddr_axi_slave_0_arprot) // input 
    ,.ddr_axi_slave_0_arcache(ddr_axi_slave_0_arcache) // input 
    ,.ddr_axi_slave_0_arlock(ddr_axi_slave_0_arlock) // input 
    ,.ddr_axi_slave_0_arburst(ddr_axi_slave_0_arburst) // input 
    ,.ddr_axi_slave_0_arsize(ddr_axi_slave_0_arsize) // input 
    ,.ddr_axi_slave_0_arlen(ddr_axi_slave_0_arlen) // input 
    ,.ddr_axi_slave_0_araddr({3'b0, 1'b1, ddr_axi_slave_0_araddr[27:0]}) // input 
    ,.ddr_axi_slave_0_arid(ddr_axi_slave_0_arid[3:0]) // input 
    ,.ddr_axi_slave_0_bvalid(ddr_axi_slave_0_bvalid) // output 
    ,.ddr_axi_slave_0_bresp(ddr_axi_slave_0_bresp) // output 
    ,.ddr_axi_slave_0_bid(ddr_axi_slave_0_bid[3:0]) // output 
    ,.ddr_axi_slave_0_bready(ddr_axi_slave_0_bready) // input 
    ,.ddr_axi_slave_0_wready(ddr_axi_slave_0_wready) // output 
    ,.ddr_axi_slave_0_wvalid(ddr_axi_slave_0_wvalid) // input 
    ,.ddr_axi_slave_0_wlast(ddr_axi_slave_0_wlast) // input 
    ,.ddr_axi_slave_0_wstrb(ddr_axi_slave_0_wstrb) // input 
    ,.ddr_axi_slave_0_wdata(ddr_axi_slave_0_wdata) // input 
    ,.ddr_axi_slave_0_awready(ddr_axi_slave_0_awready) // output 
    ,.ddr_axi_slave_0_awvalid(ddr_axi_slave_0_awvalid) // input 
    ,.ddr_axi_slave_0_awqos(ddr_axi_slave_0_awqos) // input 
    ,.ddr_axi_slave_0_awprot(ddr_axi_slave_0_awprot) // input 
    ,.ddr_axi_slave_0_awcache(ddr_axi_slave_0_awcache) // input 
    ,.ddr_axi_slave_0_awlock(ddr_axi_slave_0_awlock) // input 
    ,.ddr_axi_slave_0_awburst(ddr_axi_slave_0_awburst) // input 
    ,.ddr_axi_slave_0_awsize(ddr_axi_slave_0_awsize) // input 
    ,.ddr_axi_slave_0_awlen(ddr_axi_slave_0_awlen) // input 
    ,.ddr_axi_slave_0_awaddr({3'b0, 1'b1, ddr_axi_slave_0_awaddr[27:0]}) // input for axi4tl bridge
    ,.ddr_axi_slave_0_awid(ddr_axi_slave_0_awid[3:0]) // input

    ,.sdram_start_delay(sdram_start_delay) // input
    ,.sdram_refresh_cycles(sdram_refresh_cycles) // input
    ,.sdram_trcd_cycles(sdram_trcd_cycles) // input
    ,.sdram_trp_cycles(sdram_trp_cycles) // input
    ,.sdram_trfc_cycles(sdram_trfc_cycles) // input

    ,.ddr3_dqs_i(ddr3_dqs_i) // input
    ,.ddr3_dqs_o(ddr3_dqs_o) // output
    ,.ddr3_dqs_o_en(ddr3_dqs_o_en) // output

    //,.ddr3_odt(ddr3_odt) // output 
    ,.ddr3_dm(ddr3_dm) // output 
    ,.ddr3_cs_n(ddr3_cs_n) // output 
    ,.ddr3_cke(ddr3_cke) // output 
    //,.ddr3_ck_n(ddr3_ck_n) // output 
    ,.ddr3_ck_p(ddr3_ck_p) // output 
    //,.ddr3_reset_n(ddr3_reset_n) // output 
    ,.ddr3_we_n(ddr3_we_n) // output 
    ,.ddr3_cas_n(ddr3_cas_n) // output 
    ,.ddr3_ras_n(ddr3_ras_n) // output 
    ,.ddr3_ba(ddr3_ba) // output 
    ,.ddr3_addr(ddr3_addr) // output

);
`else

sdram_axi ddr_slave_0_sdram_axi(
    // Inputs
     .clk_i(ddr_clock)
    ,.rst_i(ddr_reset)
    
    ,.sdram_start_delay(sdram_start_delay)    
    ,.sdram_refresh_cycles(sdram_refresh_cycles)
    ,.sdram_trcd_cycles(sdram_trcd_cycles)
    ,.sdram_trp_cycles(sdram_trp_cycles)
    ,.sdram_trfc_cycles(sdram_trfc_cycles)

    ,.inport_awvalid_i(ddr_axi_slave_0_awvalid)
    ,.inport_awaddr_i({3'b0, ddr_axi_slave_0_awaddr[28:0]})
    ,.inport_awid_i({ddr_axi_slave_0_awid[3:0]})
    ,.inport_awlen_i(ddr_axi_slave_0_awlen)
    ,.inport_awsize_i(ddr_axi_slave_0_awsize)    
    ,.inport_awburst_i(ddr_axi_slave_0_awburst)
    ,.inport_wvalid_i(ddr_axi_slave_0_wvalid)
    ,.inport_wdata_i(ddr_axi_slave_0_wdata)
    ,.inport_wstrb_i(ddr_axi_slave_0_wstrb)
    ,.inport_wlast_i(ddr_axi_slave_0_wlast)
    ,.inport_bready_i(ddr_axi_slave_0_bready)
    ,.inport_arvalid_i(ddr_axi_slave_0_arvalid)
    ,.inport_araddr_i({3'b0, ddr_axi_slave_0_araddr[28:0]})
    ,.inport_arid_i({ddr_axi_slave_0_arid[3:0]})
    ,.inport_arsize_i(ddr_axi_slave_0_arsize)
    ,.inport_arlen_i(ddr_axi_slave_0_arlen)
    ,.inport_arburst_i(ddr_axi_slave_0_arburst)
    ,.inport_rready_i(ddr_axi_slave_0_rready)

    ,.inport_awready_o(ddr_axi_slave_0_awready)
    ,.inport_wready_o(ddr_axi_slave_0_wready)
    ,.inport_bvalid_o(ddr_axi_slave_0_bvalid)
    ,.inport_bresp_o(ddr_axi_slave_0_bresp)
    ,.inport_bid_o(ddr_axi_slave_0_bid[3:0])
    ,.inport_arready_o(ddr_axi_slave_0_arready)
    ,.inport_rvalid_o(ddr_axi_slave_0_rvalid)
    ,.inport_rdata_o(ddr_axi_slave_0_rdata)
    ,.inport_rresp_o(ddr_axi_slave_0_rresp)
    ,.inport_rid_o(ddr_axi_slave_0_rid[3:0])
    ,.inport_rlast_o(ddr_axi_slave_0_rlast)

    ,.sdram_data_input_i(ddr3_dqs_i)
    ,.sdram_clk_o(ddr3_ck_p)
    ,.sdram_cke_o(ddr3_cke)
    ,.sdram_cs_o(ddr3_cs_n)
    ,.sdram_ras_o(ddr3_ras_n)
    ,.sdram_cas_o(ddr3_cas_n)
    ,.sdram_we_o(ddr3_we_n)
    ,.sdram_dqm_o(ddr3_dm[1:0])
    ,.sdram_addr_o(ddr3_addr[12:0])
    ,.sdram_ba_o(ddr3_ba)
    ,.sdram_data_output_o(ddr3_dqs_o)
    ,.sdram_data_out_en_o(ddr3_dqs_o_en)
);
`endif



`else
  wire  widget_auto_in_x2x_a_ready;
  wire  widget_auto_in_x2x_a_valid;
  wire [2:0] widget_auto_in_x2x_a_bits_opcode;
  wire [2:0] widget_auto_in_x2x_a_bits_size;
  wire [3:0] widget_auto_in_x2x_a_bits_source;
  wire [31:0] widget_auto_in_x2x_a_bits_address;
  wire [7:0] widget_auto_in_x2x_a_bits_mask;
  wire [63:0] widget_auto_in_x2x_a_bits_data;
  wire  widget_auto_in_x2x_d_ready;
  wire  widget_auto_in_x2x_d_valid;
  wire [2:0] widget_auto_in_x2x_d_bits_opcode;
  wire [2:0] widget_auto_in_x2x_d_bits_size;
  wire [3:0] widget_auto_in_x2x_d_bits_source;
  wire  widget_auto_in_x2x_d_bits_denied;
  wire [63:0] widget_auto_in_x2x_d_bits_data;
  wire  widget_auto_in_x2x_d_bits_corrupt;

  tl_uh_async_bridge #(
       .A_LGFIFO(3)
      ,.D_LGFIFO(2)
      ,.WIDTH_SOURCE(4)
      ,.WIDTH_ADDRESS(32)
	) u_tl_uh_async_bridge (
         .s_clk(sys_clk_i) 
        ,.s_reset_n(~sys_rst)
        ,.m_clk(chiplink_clock) 
        ,.m_reset_n(~chiplink_reset)

        ,.s_a_ready(widget_auto_in_a_ready)
        ,.s_a_valid(widget_auto_in_a_valid)
        ,.s_a_bits_opcode(widget_auto_in_a_bits_opcode)
        ,.s_a_bits_param(3'b0)
        ,.s_a_bits_size(widget_auto_in_a_bits_size)
        ,.s_a_bits_source(widget_auto_in_a_bits_source)
        ,.s_a_bits_address(widget_auto_in_a_bits_address)
        ,.s_a_bits_mask(widget_auto_in_a_bits_mask)
        ,.s_a_bits_data(widget_auto_in_a_bits_data)
        ,.s_a_bits_corrupt(1'b0)
        ,.s_d_ready(widget_auto_in_d_ready)
        ,.s_d_valid(widget_auto_in_d_valid)
        ,.s_d_bits_opcode(widget_auto_in_d_bits_opcode)
        ,.s_d_bits_param()
        ,.s_d_bits_size(widget_auto_in_d_bits_size)
        ,.s_d_bits_source(widget_auto_in_d_bits_source)
        ,.s_d_bits_sink()
        ,.s_d_bits_denied(widget_auto_in_d_bits_denied)
        ,.s_d_bits_data(widget_auto_in_d_bits_data)
        ,.s_d_bits_corrupt(widget_auto_in_d_bits_corrupt)

        ,.m_a_ready(widget_auto_in_x2x_a_ready)
        ,.m_a_valid(widget_auto_in_x2x_a_valid)
        ,.m_a_bits_opcode(widget_auto_in_x2x_a_bits_opcode)
        ,.m_a_bits_param()
        ,.m_a_bits_size(widget_auto_in_x2x_a_bits_size)
        ,.m_a_bits_source(widget_auto_in_x2x_a_bits_source)
        ,.m_a_bits_address(widget_auto_in_x2x_a_bits_address)
        ,.m_a_bits_mask(widget_auto_in_x2x_a_bits_mask)
        ,.m_a_bits_data(widget_auto_in_x2x_a_bits_data)
        ,.m_a_bits_corrupt()
        ,.m_d_ready(widget_auto_in_x2x_d_ready)
        ,.m_d_valid(widget_auto_in_x2x_d_valid)
        ,.m_d_bits_opcode(widget_auto_in_x2x_d_bits_opcode)
        ,.m_d_bits_param(2'b0)
        ,.m_d_bits_size(widget_auto_in_x2x_d_bits_size)
        ,.m_d_bits_source(widget_auto_in_x2x_d_bits_source)
        ,.m_d_bits_sink(3'b0)
        ,.m_d_bits_denied(widget_auto_in_x2x_d_bits_denied)
        ,.m_d_bits_data(widget_auto_in_x2x_d_bits_data)
        ,.m_d_bits_corrupt(widget_auto_in_x2x_d_bits_corrupt)
    
	);

`endif

  axi4_async_bridge #(
		// {{{
		 .AW_LGFIFO(2)	
		,.W_LGFIFO(2)
		,.AR_LGFIFO(2)
		,.B_LGFIFO(4)
		,.R_LGFIFO(4)

		,.WIDTH_SIZE(3)
		,.WIDTH_BURST_LEN(8)
		,.WIDTH_BURST(2)

		,.WIDTH_ID(4)
		,.WIDTH_RESP(2)
		
		,.WIDTH_ADDRESS(32)
		,.WIDTH_DATA(64)
  ) u_master_axi4_async_bridge (

		.s_clk(chiplink_clock),
        .s_reset_n(~chiplink_reset),
		.m_clk(sys_clk_i),
        .m_reset_n(~sys_rst),
		//
		.s_awready(x2x_m_axi_awready),
		.s_awvalid(x2x_m_axi_awvalid),
		`ifdef AXI_HAVE_USER
		.s_awuser(x2x_m_axi_awuser),
        `endif
		.s_awsize(x2x_m_axi_awsize),
		.s_awlen(x2x_m_axi_awlen),
		.s_awburst(x2x_m_axi_awburst),
		.s_awaddr(x2x_m_axi_awaddr),
		.s_awid(x2x_m_axi_awid),

		.s_wdata(x2x_m_axi_wdata),
		.s_wstrb(x2x_m_axi_wstrb),
		.s_wlast(x2x_m_axi_wlast),
		.s_wready(x2x_m_axi_wready),
		.s_wvalid(x2x_m_axi_wvalid),
		`ifdef AXI_HAVE_USER
		.s_wuser(x2x_m_axi_wuser),
    `endif

		.s_arready(x2x_m_axi_arready),
		.s_arvalid(x2x_m_axi_arvalid),
		`ifdef AXI_HAVE_USER
		.s_aruser(x2x_m_axi_aruser),
    `endif
		.s_arsize(x2x_m_axi_arsize),
		.s_arlen(x2x_m_axi_arlen),
		.s_arburst(x2x_m_axi_arburst),
		.s_araddr(x2x_m_axi_araddr),
		.s_arid(x2x_m_axi_arid),

		.s_rdata(x2x_m_axi_rdata),
		.s_rresp(x2x_m_axi_rresp),
		.s_rid(x2x_m_axi_rid),
		.s_rlast(x2x_m_axi_rlast),
		.s_rready(x2x_m_axi_rready),
		.s_rvalid(x2x_m_axi_rvalid),

		.s_bid(x2x_m_axi_bid),
		.s_bresp(x2x_m_axi_bresp),
		.s_bready(x2x_m_axi_bready),
		.s_bvalid(x2x_m_axi_bvalid),
		
		// MASTER 
		.m_awready(ddr_master_0_awready),
		.m_awvalid(ddr_master_0_awvalid),
		`ifdef AXI_HAVE_USER
		.m_awuser(ddr_master_0_awuser),
    `endif
		.m_awsize(ddr_master_0_awsize),
		.m_awlen(ddr_master_0_awlen),
		.m_awburst(ddr_master_0_awburst),
		.m_awaddr(ddr_master_0_awaddr),
		.m_awid(ddr_master_0_awid),

		.m_wdata(ddr_master_0_wdata),
		.m_wstrb(ddr_master_0_wstrb),
		.m_wlast(ddr_master_0_wlast),
		.m_wready(ddr_master_0_wready),
		.m_wvalid(ddr_master_0_wvalid),
		`ifdef AXI_HAVE_USER
		.m_wuser(ddr_master_0_wuser),
    `endif

		.m_arready(ddr_master_0_arready),
		.m_arvalid(ddr_master_0_arvalid),
		`ifdef AXI_HAVE_USER
		.m_aruser(ddr_master_0_aruser),
    `endif
		.m_arsize(ddr_master_0_arsize),
		.m_arlen(ddr_master_0_arlen),
		.m_arburst(ddr_master_0_arburst),
		.m_araddr(ddr_master_0_araddr),
		.m_arid(ddr_master_0_arid),

		.m_rdata(ddr_master_0_rdata),
		.m_rresp(ddr_master_0_rresp),
		.m_rid(ddr_master_0_rid),
		.m_rlast(ddr_master_0_rlast),
		.m_rready(ddr_master_0_rready),
		.m_rvalid(ddr_master_0_rvalid),

		.m_bid(ddr_master_0_bid),
		.m_bresp(ddr_master_0_bresp),
		.m_bready(ddr_master_0_bready),
		.m_bvalid(ddr_master_0_bvalid)
	);

`ifndef CHIPLINK_CONNECT_DIRECT_TL
  axi4_async_bridge #(
		// {{{
		 .AW_LGFIFO(4)	
		,.W_LGFIFO(4)
		,.AR_LGFIFO(4)
		,.B_LGFIFO(2)
		,.R_LGFIFO(2)

		,.WIDTH_SIZE(3)
		,.WIDTH_BURST_LEN(8)
		,.WIDTH_BURST(2)

		,.WIDTH_ID(5)
		,.WIDTH_RESP(2)
		
		,.WIDTH_ADDRESS(32)
		,.WIDTH_DATA(64)
  ) u_chiplink_slave_axi4_async_bridge (

		.s_clk(ddr_clock),
    	.s_reset_n(~ddr_reset),
		.m_clk(chiplink_clock),
        .m_reset_n(~chiplink_reset),
		//
		.s_awready(chiplink_axi_slave_ddr_clock_awready),
		.s_awvalid(chiplink_axi_slave_ddr_clock_awvalid),
		`ifdef AXI_HAVE_USER
		.s_awuser(chiplink_axi_slave_ddr_clock_awuser),
    		`endif
		.s_awsize(chiplink_axi_slave_ddr_clock_awsize),
		.s_awlen(chiplink_axi_slave_ddr_clock_awlen),
		.s_awburst(chiplink_axi_slave_ddr_clock_awburst),
		.s_awaddr(chiplink_axi_slave_ddr_clock_awaddr_plus_10000000),
		.s_awid(chiplink_axi_slave_ddr_clock_awid),

		.s_wdata(chiplink_axi_slave_ddr_clock_wdata),
		.s_wstrb(chiplink_axi_slave_ddr_clock_wstrb),
		.s_wlast(chiplink_axi_slave_ddr_clock_wlast),
		.s_wready(chiplink_axi_slave_ddr_clock_wready),
		.s_wvalid(chiplink_axi_slave_ddr_clock_wvalid),
		`ifdef AXI_HAVE_USER
		.s_wuser(chiplink_axi_slave_ddr_clock_wuser),
    `endif

		.s_arready(chiplink_axi_slave_ddr_clock_arready),
		.s_arvalid(chiplink_axi_slave_ddr_clock_arvalid),
		`ifdef AXI_HAVE_USER
		.s_aruser(chiplink_axi_slave_ddr_clock_aruser),
    `endif
		.s_arsize(chiplink_axi_slave_ddr_clock_arsize),
		.s_arlen(chiplink_axi_slave_ddr_clock_arlen),
		.s_arburst(chiplink_axi_slave_ddr_clock_arburst),
		.s_araddr(chiplink_axi_slave_ddr_clock_araddr_plus_10000000),
		.s_arid(chiplink_axi_slave_ddr_clock_arid),

		.s_rdata(chiplink_axi_slave_ddr_clock_rdata),
		.s_rresp(chiplink_axi_slave_ddr_clock_rresp),
		.s_rid(chiplink_axi_slave_ddr_clock_rid),
		.s_rlast(chiplink_axi_slave_ddr_clock_rlast),
		.s_rready(chiplink_axi_slave_ddr_clock_rready),
		.s_rvalid(chiplink_axi_slave_ddr_clock_rvalid),

		.s_bid(chiplink_axi_slave_ddr_clock_bid),
		.s_bresp(chiplink_axi_slave_ddr_clock_bresp),
		.s_bready(chiplink_axi_slave_ddr_clock_bready),
		.s_bvalid(chiplink_axi_slave_ddr_clock_bvalid),
		
		// MASTER 
		.m_awready(chiplink_axi_slave_awready),
		.m_awvalid(chiplink_axi_slave_awvalid),
		`ifdef AXI_HAVE_USER
		.m_awuser(chiplink_axi_slave_awuser),
    `endif
		.m_awsize(chiplink_axi_slave_awsize),
		.m_awlen(chiplink_axi_slave_awlen),
		.m_awburst(chiplink_axi_slave_awburst),
		.m_awaddr(chiplink_axi_slave_awaddr),
		.m_awid(chiplink_axi_slave_awid),

		.m_wdata(chiplink_axi_slave_wdata),
		.m_wstrb(chiplink_axi_slave_wstrb),
		.m_wlast(chiplink_axi_slave_wlast),
		.m_wready(chiplink_axi_slave_wready),
		.m_wvalid(chiplink_axi_slave_wvalid),
		`ifdef AXI_HAVE_USER
		.m_wuser(chiplink_axi_slave_wuser),
    `endif

		.m_arready(chiplink_axi_slave_arready),
		.m_arvalid(chiplink_axi_slave_arvalid),
		`ifdef AXI_HAVE_USER
		.m_aruser(chiplink_axi_slave_aruser),
    `endif
		.m_arsize(chiplink_axi_slave_arsize),
		.m_arlen(chiplink_axi_slave_arlen),
		.m_arburst(chiplink_axi_slave_arburst),
		.m_araddr(chiplink_axi_slave_araddr),
		.m_arid(chiplink_axi_slave_arid),

		.m_rdata(chiplink_axi_slave_rdata),
		.m_rresp(chiplink_axi_slave_rresp),
		.m_rid(chiplink_axi_slave_rid),
		.m_rlast(chiplink_axi_slave_rlast),
		.m_rready(chiplink_axi_slave_rready),
		.m_rvalid(chiplink_axi_slave_rvalid),

		.m_bid(chiplink_axi_slave_bid),
		.m_bresp(chiplink_axi_slave_bresp),
		.m_bready(chiplink_axi_slave_bready),
		.m_bvalid(chiplink_axi_slave_bvalid)
	);
`endif

 CHIPLINK_PREFIX_ChipLinkMaster chipLinkConverter (
    .clock(chiplink_clock),
    .reset(chiplink_reset),
    .transferDataReg(transferDataReg),
    .send_1p_valid(send_1p_valid),
    .b2c_data_concat(b2c_data_concat),
    .b2c_data_valid(b2c_data_valid),
    .mig_input_takeover_en(mig_input_takeover_en),

  `ifdef CHIPLINK_CONNECT_DIRECT_TL
    .widget_auto_in_a_ready(widget_auto_in_x2x_a_ready),
    .widget_auto_in_a_valid(widget_auto_in_x2x_a_valid),
    .widget_auto_in_a_bits_opcode(widget_auto_in_x2x_a_bits_opcode),
    //.widget_auto_in_a_bits_param(widget_auto_in_x2x_a_bits_param),
    .widget_auto_in_a_bits_size(widget_auto_in_x2x_a_bits_size),
    .widget_auto_in_a_bits_source(widget_auto_in_x2x_a_bits_source),
    .widget_auto_in_a_bits_address(widget_auto_in_x2x_a_bits_address),
    .widget_auto_in_a_bits_mask(widget_auto_in_x2x_a_bits_mask),
    .widget_auto_in_a_bits_data(widget_auto_in_x2x_a_bits_data),
    //.widget_auto_in_a_bits_corrupt(widget_auto_in_x2x_a_bits_corrupt),
    .widget_auto_in_d_ready(widget_auto_in_x2x_d_ready),
    .widget_auto_in_d_valid(widget_auto_in_x2x_d_valid),
    .widget_auto_in_d_bits_opcode(widget_auto_in_x2x_d_bits_opcode),
    .widget_auto_in_d_bits_size(widget_auto_in_x2x_d_bits_size),
    .widget_auto_in_d_bits_source(widget_auto_in_x2x_d_bits_source),
    .widget_auto_in_d_bits_denied(widget_auto_in_x2x_d_bits_denied),
    .widget_auto_in_d_bits_data(widget_auto_in_x2x_d_bits_data),
    .widget_auto_in_d_bits_corrupt(widget_auto_in_x2x_d_bits_corrupt),
  `else
    .slave_0_awready(chiplink_axi_slave_awready),
    .slave_0_awvalid(chiplink_axi_slave_awvalid),
    .slave_0_awid(chiplink_axi_slave_awid),
    .slave_0_awaddr({2'b0, chiplink_axi_slave_awaddr[29:0]}),
    .slave_0_awlen(chiplink_axi_slave_awlen),
    .slave_0_awsize(chiplink_axi_slave_awsize),
    .slave_0_awburst(chiplink_axi_slave_awburst),
    .slave_0_wready(chiplink_axi_slave_wready),
    .slave_0_wvalid(chiplink_axi_slave_wvalid),
    .slave_0_wdata(chiplink_axi_slave_wdata),
    .slave_0_wstrb(chiplink_axi_slave_wstrb),
    .slave_0_wlast(chiplink_axi_slave_wlast),
    .slave_0_bready(chiplink_axi_slave_bready),
    .slave_0_bvalid(chiplink_axi_slave_bvalid),
    .slave_0_bid(chiplink_axi_slave_bid),
    .slave_0_bresp(chiplink_axi_slave_bresp),
    .slave_0_arready(chiplink_axi_slave_arready),
    .slave_0_arvalid(chiplink_axi_slave_arvalid),
    .slave_0_arid(chiplink_axi_slave_arid),
    .slave_0_araddr({2'b0, chiplink_axi_slave_araddr[29:0]}),
    .slave_0_arlen(chiplink_axi_slave_arlen),
    .slave_0_arsize(chiplink_axi_slave_arsize),
    .slave_0_arburst(chiplink_axi_slave_arburst),
    .slave_0_rready(chiplink_axi_slave_rready),
    .slave_0_rvalid(chiplink_axi_slave_rvalid),
    .slave_0_rid(chiplink_axi_slave_rid),
    .slave_0_rdata(chiplink_axi_slave_rdata),
    .slave_0_rresp(chiplink_axi_slave_rresp),
    .slave_0_rlast(chiplink_axi_slave_rlast),
  `endif
    .master_mem_0_awready(x2x_m_axi_awready),
    .master_mem_0_awvalid(x2x_m_axi_awvalid),
    .master_mem_0_awid(x2x_m_axi_awid),
    .master_mem_0_awaddr(x2x_m_axi_awaddr),
    .master_mem_0_awlen(x2x_m_axi_awlen),
    .master_mem_0_awsize(x2x_m_axi_awsize),
    .master_mem_0_awburst(x2x_m_axi_awburst),
    .master_mem_0_wready(x2x_m_axi_wready),
    .master_mem_0_wvalid(x2x_m_axi_wvalid),
    .master_mem_0_wdata(x2x_m_axi_wdata),
    .master_mem_0_wstrb(x2x_m_axi_wstrb),
    .master_mem_0_wlast(x2x_m_axi_wlast),
    .master_mem_0_bready(x2x_m_axi_bready),
    .master_mem_0_bvalid(x2x_m_axi_bvalid),
    .master_mem_0_bid(x2x_m_axi_bid),
    .master_mem_0_bresp(x2x_m_axi_bresp),
    .master_mem_0_arready(x2x_m_axi_arready),
    .master_mem_0_arvalid(x2x_m_axi_arvalid),
    .master_mem_0_arid(x2x_m_axi_arid),
    .master_mem_0_araddr(x2x_m_axi_araddr),
    .master_mem_0_arlen(x2x_m_axi_arlen),
    .master_mem_0_arsize(x2x_m_axi_arsize),
    .master_mem_0_arburst(x2x_m_axi_arburst),
    .master_mem_0_rready(x2x_m_axi_rready),
    .master_mem_0_rvalid(x2x_m_axi_rvalid),
    .master_mem_0_rid(x2x_m_axi_rid),
    .master_mem_0_rdata(x2x_m_axi_rdata),
    .master_mem_0_rresp(x2x_m_axi_rresp),
    .master_mem_0_rlast(x2x_m_axi_rlast),
    .fpga_io_c2b_clk(ddr_io_c2b_clk),
    .fpga_io_c2b_rst(ddr_io_c2b_rst),
    .fpga_io_c2b_send(ddr_io_c2b_send),
    .fpga_io_c2b_data(ddr_io_c2b_data),
    .fpga_io_b2c_clk(ddr_io_b2c_clk),   // b2c dependancy clk
    .fpga_io_b2c_rst(ddr_io_b2c_rst),
    .fpga_io_b2c_send(ddr_io_b2c_send),
    .fpga_io_b2c_data(ddr_io_b2c_data)
  );

endmodule
