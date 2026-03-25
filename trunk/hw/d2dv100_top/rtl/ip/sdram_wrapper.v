module sdram_wrapper ( 

  input wire mig_input_takeover_en,

  input         ddr_clock,
  input         ddr_reset,
  

  `ifdef SDRAM_CONNECT_DIRECT_TL
    output  mem_xbar_auto_in_a_ready,
    input  mem_xbar_auto_in_a_valid,
    input [2:0] mem_xbar_auto_in_a_bits_opcode,
    input [2:0] mem_xbar_auto_in_a_bits_size,
    input [2:0] mem_xbar_auto_in_a_bits_param,
    input [6:0] mem_xbar_auto_in_a_bits_source,
    input [31:0] mem_xbar_auto_in_a_bits_address,
    input [7:0] mem_xbar_auto_in_a_bits_mask,
    input [63:0] mem_xbar_auto_in_a_bits_data,
    input  mem_xbar_auto_in_a_bits_corrupt,
    input  mem_xbar_auto_in_d_ready,
    output  mem_xbar_auto_in_d_valid,
    output [2:0] mem_xbar_auto_in_d_bits_opcode,
    output [2:0] mem_xbar_auto_in_d_bits_param,
    output [2:0] mem_xbar_auto_in_d_bits_size,
    output [6:0] mem_xbar_auto_in_d_bits_source,
    output  mem_xbar_auto_in_d_bits_sink,
    output  mem_xbar_auto_in_d_bits_denied,
    output [63:0] mem_xbar_auto_in_d_bits_data,
    output  mem_xbar_auto_in_d_bits_corrupt,
  `else
    output  ddr_axi_slave_0_rvalid, 
    output  ddr_axi_slave_0_rlast, 
    output [1:0] ddr_axi_slave_0_rresp, 
    output [63:0] ddr_axi_slave_0_rdata, 
    output [3:0] ddr_axi_slave_0_rid, 
    input  ddr_axi_slave_0_rready, 
    output  ddr_axi_slave_0_arready, 
    input  ddr_axi_slave_0_arvalid, 
    input [3:0] ddr_axi_slave_0_arqos, 
    input [2:0] ddr_axi_slave_0_arprot, 
    input [3:0] ddr_axi_slave_0_arcache, 
    input  ddr_axi_slave_0_arlock, 
    input [1:0] ddr_axi_slave_0_arburst, 
    input [2:0] ddr_axi_slave_0_arsize, 
    input [7:0] ddr_axi_slave_0_arlen, 
    input [31:0] ddr_axi_slave_0_araddr, 
    input [3:0] ddr_axi_slave_0_arid, 
    output  ddr_axi_slave_0_bvalid, 
    output [1:0] ddr_axi_slave_0_bresp, 
    output [3:0] ddr_axi_slave_0_bid, 
    input  ddr_axi_slave_0_bready, 
    output  ddr_axi_slave_0_wready, 
    input  ddr_axi_slave_0_wvalid, 
    input  ddr_axi_slave_0_wlast, 
    input [7:0] ddr_axi_slave_0_wstrb, 
    input [63:0] ddr_axi_slave_0_wdata, 
    output  ddr_axi_slave_0_awready, 
    input  ddr_axi_slave_0_awvalid, 
    input [3:0] ddr_axi_slave_0_awqos, 
    input [2:0] ddr_axi_slave_0_awprot, 
    input [3:0] ddr_axi_slave_0_awcache, 
    input  ddr_axi_slave_0_awlock, 
    input [1:0] ddr_axi_slave_0_awburst, 
    input [2:0] ddr_axi_slave_0_awsize, 
    input [7:0] ddr_axi_slave_0_awlen, 
    input [31:0] ddr_axi_slave_0_awaddr, 
    input [3:0] ddr_axi_slave_0_awid,

  `endif

   input  [  31:0] sdram_start_delay
  ,input  [  31:0] sdram_refresh_cycles
  ,input  [  31:0] sdram_trcd_cycles
  ,input  [  31:0] sdram_trp_cycles
  ,input  [  31:0] sdram_trfc_cycles,

  input  [15:0] ddr3_dqs_i,
  output [15:0] ddr3_dqs_o,
  output        ddr3_dqs_o_en,

  //output  ddr3_odt, 
  output [1:0] ddr3_dm, 
  output  ddr3_cs_n, 
  output  ddr3_cke, 
  //output  ddr3_ck_n, 
  output  ddr3_ck_p, 
  //output  ddr3_reset_n, 
  output  ddr3_we_n, 
  output  ddr3_cas_n, 
  output  ddr3_ras_n, 
  output [1:0] ddr3_ba, 
  output [12:0] ddr3_addr

);

  wire  axi4index_auto_out_awready;
  wire  axi4index_auto_out_awvalid;
  wire  axi4index_auto_out_awid;
  wire [31:0] axi4index_auto_out_awaddr;
  wire [3:0] axi4index_auto_out_awcache_unused;
  wire [2:0] axi4index_auto_out_awprot_unused;
  wire [7:0] axi4index_auto_out_awlen;
  wire [2:0] axi4index_auto_out_awsize;
  wire [1:0] axi4index_auto_out_awburst;
  wire [2:0] axi4index_auto_out_awecho_extra_id;
  wire  axi4index_auto_out_wready;
  wire  axi4index_auto_out_wvalid;
  wire [63:0] axi4index_auto_out_wdata;
  wire [7:0] axi4index_auto_out_wstrb;
  wire  axi4index_auto_out_wlast;
  wire  axi4index_auto_out_bready;
  wire  axi4index_auto_out_bvalid;
  wire  axi4index_auto_out_bid;
  wire [1:0] axi4index_auto_out_bresp;
  wire [2:0] axi4index_auto_out_becho_extra_id;
  wire  axi4index_auto_out_arready;
  wire  axi4index_auto_out_arvalid;
  wire  axi4index_auto_out_arid;
  wire [31:0] axi4index_auto_out_araddr;
  wire [7:0] axi4index_auto_out_arlen;
  wire [2:0] axi4index_auto_out_arsize;
  wire [3:0] axi4index_auto_out_arcache_unused;
  wire [2:0] axi4index_auto_out_arprot_unused;
  wire [1:0] axi4index_auto_out_arburst;
  wire [2:0] axi4index_auto_out_arecho_extra_id;
  wire  axi4index_auto_out_rready;
  wire  axi4index_auto_out_rvalid;
  wire  axi4index_auto_out_rid;
  wire [63:0] axi4index_auto_out_rdata;
  wire [1:0] axi4index_auto_out_rresp;
  wire [2:0] axi4index_auto_out_recho_extra_id;
  wire  axi4index_auto_out_rlast;

  AXI4IdIndexer_Param #(
    .AXI4_ADDRESS_WIDTH(32),
    .AXI4_RDATA_WIDTH(64),
    .AXI4_WDATA_WIDTH(64),
    .AXI4_USER_WIDTH(1),
    .AXI4_ID_WIDTH(4)
  ) u_axi4index (
    .auto_in_awready(ddr_axi_slave_0_awready),
    .auto_in_awvalid(ddr_axi_slave_0_awvalid),
    .auto_in_awid(ddr_axi_slave_0_awid[3:0]),
    .auto_in_awaddr({ddr_axi_slave_0_awaddr}),
    .auto_in_awcache(4'b0),
    .auto_in_awprot(3'b0),    
    .auto_in_awlen(ddr_axi_slave_0_awlen),
    .auto_in_awsize(ddr_axi_slave_0_awsize),
    .auto_in_awburst(ddr_axi_slave_0_awburst),
    .auto_in_wready(ddr_axi_slave_0_wready),
    .auto_in_wvalid(ddr_axi_slave_0_wvalid),
    .auto_in_wdata(ddr_axi_slave_0_wdata),
    .auto_in_wstrb(ddr_axi_slave_0_wstrb),
    .auto_in_wlast(ddr_axi_slave_0_wlast),
    .auto_in_bready(ddr_axi_slave_0_bready),
    .auto_in_bvalid(ddr_axi_slave_0_bvalid),
    .auto_in_bid(ddr_axi_slave_0_bid[3:0]),
    .auto_in_bresp(ddr_axi_slave_0_bresp),
    .auto_in_arready(ddr_axi_slave_0_arready),
    .auto_in_arvalid(ddr_axi_slave_0_arvalid),
    .auto_in_arcache(4'b0),
    .auto_in_arprot(3'b0),
    .auto_in_arid(ddr_axi_slave_0_arid[3:0]),
    .auto_in_araddr({ddr_axi_slave_0_araddr}),
    .auto_in_arlen(ddr_axi_slave_0_arlen),
    .auto_in_arsize(ddr_axi_slave_0_arsize),
    .auto_in_arburst(ddr_axi_slave_0_arburst),
    .auto_in_rready(ddr_axi_slave_0_rready),
    .auto_in_rvalid(ddr_axi_slave_0_rvalid),
    .auto_in_rid(ddr_axi_slave_0_rid[3:0]),
    .auto_in_rdata(ddr_axi_slave_0_rdata),
    .auto_in_rresp(ddr_axi_slave_0_rresp),
    .auto_in_rlast(ddr_axi_slave_0_rlast),

    .auto_out_awready(axi4index_auto_out_awready),
    .auto_out_awvalid(axi4index_auto_out_awvalid),
    .auto_out_awid(axi4index_auto_out_awid),
    .auto_out_awaddr(axi4index_auto_out_awaddr),
    
    .auto_out_awcache(axi4index_auto_out_awcache_unused),
    .auto_out_awprot(axi4index_auto_out_awprot_unused), 

    .auto_out_awlen(axi4index_auto_out_awlen),
    .auto_out_awsize(axi4index_auto_out_awsize),
    .auto_out_awburst(axi4index_auto_out_awburst),
    .auto_out_awecho_extra_id(axi4index_auto_out_awecho_extra_id),
    .auto_out_wready(axi4index_auto_out_wready),
    .auto_out_wvalid(axi4index_auto_out_wvalid),
    .auto_out_wdata(axi4index_auto_out_wdata),
    .auto_out_wstrb(axi4index_auto_out_wstrb),
    .auto_out_wlast(axi4index_auto_out_wlast),
    .auto_out_bready(axi4index_auto_out_bready),
    .auto_out_bvalid(axi4index_auto_out_bvalid),
    .auto_out_bid(axi4index_auto_out_bid),
    .auto_out_bresp(axi4index_auto_out_bresp),
    .auto_out_becho_extra_id(axi4index_auto_out_becho_extra_id),
    .auto_out_arready(axi4index_auto_out_arready),
    .auto_out_arvalid(axi4index_auto_out_arvalid),
    .auto_out_arcache(axi4index_auto_out_arcache_unused),
    .auto_out_arprot(axi4index_auto_out_arprot_unused), 
    .auto_out_arid(axi4index_auto_out_arid),
    .auto_out_araddr(axi4index_auto_out_araddr),
    .auto_out_arlen(axi4index_auto_out_arlen),
    .auto_out_arsize(axi4index_auto_out_arsize),
    .auto_out_arburst(axi4index_auto_out_arburst),
    .auto_out_arecho_extra_id(axi4index_auto_out_arecho_extra_id),
    .auto_out_rready(axi4index_auto_out_rready),
    .auto_out_rvalid(axi4index_auto_out_rvalid),
    .auto_out_rid(axi4index_auto_out_rid),
    .auto_out_rdata(axi4index_auto_out_rdata),
    .auto_out_rresp(axi4index_auto_out_rresp),
    .auto_out_recho_extra_id(axi4index_auto_out_recho_extra_id),
    .auto_out_rlast(axi4index_auto_out_rlast)
  );


  wire  axi4frag_auto_out_awready;
  wire  axi4frag_auto_out_awvalid;
  wire  axi4frag_auto_out_awid;
  wire [31:0] axi4frag_auto_out_awaddr;
  wire [7:0] axi4frag_auto_out_awlen;
  wire [2:0] axi4frag_auto_out_awsize;
  wire [2:0] axi4frag_auto_out_awecho_extra_id;
  wire  axi4frag_auto_out_awecho_real_last;
  wire  axi4frag_auto_out_wready;
  wire  axi4frag_auto_out_wvalid;
  wire [63:0] axi4frag_auto_out_wdata;
  wire [7:0] axi4frag_auto_out_wstrb;
  wire  axi4frag_auto_out_wlast;
  wire  axi4frag_auto_out_bready;
  wire  axi4frag_auto_out_bvalid;
  wire  axi4frag_auto_out_bid;
  wire [1:0] axi4frag_auto_out_bresp;
  wire [2:0] axi4frag_auto_out_becho_extra_id;
  wire  axi4frag_auto_out_becho_real_last;
  wire  axi4frag_auto_out_arready;
  wire  axi4frag_auto_out_arvalid;
  wire  axi4frag_auto_out_arid;
  wire [31:0] axi4frag_auto_out_araddr;
  wire [7:0] axi4frag_auto_out_arlen;
  wire [2:0] axi4frag_auto_out_arsize;
  wire [2:0] axi4frag_auto_out_arecho_extra_id;
  wire  axi4frag_auto_out_arecho_real_last;
  wire  axi4frag_auto_out_rready;
  wire  axi4frag_auto_out_rvalid;
  wire  axi4frag_auto_out_rid;
  wire [63:0] axi4frag_auto_out_rdata;
  wire [1:0] axi4frag_auto_out_rresp;
  wire [2:0] axi4frag_auto_out_recho_extra_id;
  wire  axi4frag_auto_out_recho_real_last;
  wire  axi4frag_auto_out_rlast;

  CHIPLINK_PREFIX_AXI4Fragmenter axi4frag (
    .clock(ddr_clock),
    .reset(ddr_reset),
    .auto_in_awready(axi4index_auto_out_awready),
    .auto_in_awvalid(axi4index_auto_out_awvalid),
    .auto_in_awid(axi4index_auto_out_awid),
    .auto_in_awaddr(axi4index_auto_out_awaddr),
    .auto_in_awlen(axi4index_auto_out_awlen),
    .auto_in_awsize(axi4index_auto_out_awsize),
    .auto_in_awburst(axi4index_auto_out_awburst),
    .auto_in_awecho_extra_id(axi4index_auto_out_awecho_extra_id),
    .auto_in_wready(axi4index_auto_out_wready),
    .auto_in_wvalid(axi4index_auto_out_wvalid),
    .auto_in_wdata(axi4index_auto_out_wdata),
    .auto_in_wstrb(axi4index_auto_out_wstrb),
    .auto_in_wlast(axi4index_auto_out_wlast),
    .auto_in_bready(axi4index_auto_out_bready),
    .auto_in_bvalid(axi4index_auto_out_bvalid),
    .auto_in_bid(axi4index_auto_out_bid),
    .auto_in_bresp(axi4index_auto_out_bresp),
    .auto_in_becho_extra_id(axi4index_auto_out_becho_extra_id),
    .auto_in_arready(axi4index_auto_out_arready),
    .auto_in_arvalid(axi4index_auto_out_arvalid),
    .auto_in_arid(axi4index_auto_out_arid),
    .auto_in_araddr(axi4index_auto_out_araddr),
    .auto_in_arlen(axi4index_auto_out_arlen),
    .auto_in_arsize(axi4index_auto_out_arsize),
    .auto_in_arburst(axi4index_auto_out_arburst),
    .auto_in_arecho_extra_id(axi4index_auto_out_arecho_extra_id),
    .auto_in_rready(axi4index_auto_out_rready),
    .auto_in_rvalid(axi4index_auto_out_rvalid),
    .auto_in_rid(axi4index_auto_out_rid),
    .auto_in_rdata(axi4index_auto_out_rdata),
    .auto_in_rresp(axi4index_auto_out_rresp),
    .auto_in_recho_extra_id(axi4index_auto_out_recho_extra_id),
    .auto_in_rlast(axi4index_auto_out_rlast),
    .auto_out_awready(axi4frag_auto_out_awready),
    .auto_out_awvalid(axi4frag_auto_out_awvalid),
    .auto_out_awid(axi4frag_auto_out_awid),
    .auto_out_awaddr(axi4frag_auto_out_awaddr),
    .auto_out_awlen(axi4frag_auto_out_awlen),
    .auto_out_awsize(axi4frag_auto_out_awsize),
    .auto_out_awecho_extra_id(axi4frag_auto_out_awecho_extra_id),
    .auto_out_awecho_real_last(axi4frag_auto_out_awecho_real_last),
    .auto_out_wready(axi4frag_auto_out_wready),
    .auto_out_wvalid(axi4frag_auto_out_wvalid),
    .auto_out_wdata(axi4frag_auto_out_wdata),
    .auto_out_wstrb(axi4frag_auto_out_wstrb),
    .auto_out_wlast(axi4frag_auto_out_wlast),
    .auto_out_bready(axi4frag_auto_out_bready),
    .auto_out_bvalid(axi4frag_auto_out_bvalid),
    .auto_out_bid(axi4frag_auto_out_bid),
    .auto_out_bresp(axi4frag_auto_out_bresp),
    .auto_out_becho_extra_id(axi4frag_auto_out_becho_extra_id),
    .auto_out_becho_real_last(axi4frag_auto_out_becho_real_last),
    .auto_out_arready(axi4frag_auto_out_arready),
    .auto_out_arvalid(axi4frag_auto_out_arvalid),
    .auto_out_arid(axi4frag_auto_out_arid),
    .auto_out_araddr(axi4frag_auto_out_araddr),
    .auto_out_arlen(axi4frag_auto_out_arlen),
    .auto_out_arsize(axi4frag_auto_out_arsize),
    .auto_out_arecho_extra_id(axi4frag_auto_out_arecho_extra_id),
    .auto_out_arecho_real_last(axi4frag_auto_out_arecho_real_last),
    .auto_out_rready(axi4frag_auto_out_rready),
    .auto_out_rvalid(axi4frag_auto_out_rvalid),
    .auto_out_rid(axi4frag_auto_out_rid),
    .auto_out_rdata(axi4frag_auto_out_rdata),
    .auto_out_rresp(axi4frag_auto_out_rresp),
    .auto_out_recho_extra_id(axi4frag_auto_out_recho_extra_id),
    .auto_out_recho_real_last(axi4frag_auto_out_recho_real_last),
    .auto_out_rlast(axi4frag_auto_out_rlast)
  );

  wire [31:0] axi4yank_auto_in_araddr;
  wire [7:0] axi4yank_auto_in_arlen;
  wire [2:0] axi4yank_auto_in_arsize;
  wire [2:0] axi4yank_auto_in_arecho_extra_id;
  wire  axi4yank_auto_in_arecho_real_last;
  wire  axi4yank_auto_in_rready;
  wire  axi4yank_auto_in_rvalid;
  wire  axi4yank_auto_in_rid;
  wire [63:0] axi4yank_auto_in_rdata;
  wire [1:0] axi4yank_auto_in_rresp;
  wire [2:0] axi4yank_auto_in_recho_extra_id;
  wire  axi4yank_auto_in_recho_real_last;
  wire  axi4yank_auto_in_rlast;
  wire  axi4yank_auto_out_awready;
  wire  axi4yank_auto_out_awvalid;
  wire  axi4yank_auto_out_awid;
  wire [31:0] axi4yank_auto_out_awaddr;
  wire [7:0] axi4yank_auto_out_awlen;
  wire [2:0] axi4yank_auto_out_awsize;
  wire  axi4yank_auto_out_wready;
  wire  axi4yank_auto_out_wvalid;
  wire [63:0] axi4yank_auto_out_wdata;
  wire [7:0] axi4yank_auto_out_wstrb;
  wire  axi4yank_auto_out_wlast;
  wire  axi4yank_auto_out_bready;
  wire  axi4yank_auto_out_bvalid;
  wire  axi4yank_auto_out_bid;
  wire [1:0] axi4yank_auto_out_bresp;
  wire  axi4yank_auto_out_arready;
  wire  axi4yank_auto_out_arvalid;
  wire  axi4yank_auto_out_arid;
  wire [31:0] axi4yank_auto_out_araddr;
  wire [7:0] axi4yank_auto_out_arlen;
  wire [2:0] axi4yank_auto_out_arsize;
  wire  axi4yank_auto_out_rready;
  wire  axi4yank_auto_out_rvalid;
  wire  axi4yank_auto_out_rid;
  wire [63:0] axi4yank_auto_out_rdata;
  wire [1:0] axi4yank_auto_out_rresp;
  wire  axi4yank_auto_out_rlast;


  CHIPLINK_PREFIX_AXI4UserYanker axi4yank (
    .clock(ddr_clock),
    .reset(ddr_reset),
    .auto_in_awready(axi4frag_auto_out_awready),
    .auto_in_awvalid(axi4frag_auto_out_awvalid),
    .auto_in_awid(axi4frag_auto_out_awid),
    .auto_in_awaddr(axi4frag_auto_out_awaddr),
    .auto_in_awlen(axi4frag_auto_out_awlen),
    .auto_in_awsize(axi4frag_auto_out_awsize),
    .auto_in_awecho_extra_id(axi4frag_auto_out_awecho_extra_id),
    .auto_in_awecho_real_last(axi4frag_auto_out_awecho_real_last),
    .auto_in_wready(axi4frag_auto_out_wready),
    .auto_in_wvalid(axi4frag_auto_out_wvalid),
    .auto_in_wdata(axi4frag_auto_out_wdata),
    .auto_in_wstrb(axi4frag_auto_out_wstrb),
    .auto_in_wlast(axi4frag_auto_out_wlast),
    .auto_in_bready(axi4frag_auto_out_bready),
    .auto_in_bvalid(axi4frag_auto_out_bvalid),
    .auto_in_bid(axi4frag_auto_out_bid),
    .auto_in_bresp(axi4frag_auto_out_bresp),
    .auto_in_becho_extra_id(axi4frag_auto_out_becho_extra_id),
    .auto_in_becho_real_last(axi4frag_auto_out_becho_real_last),
    .auto_in_arready(axi4frag_auto_out_arready),
    .auto_in_arvalid(axi4frag_auto_out_arvalid),
    .auto_in_arid(axi4frag_auto_out_arid),
    .auto_in_araddr(axi4frag_auto_out_araddr),
    .auto_in_arlen(axi4frag_auto_out_arlen),
    .auto_in_arsize(axi4frag_auto_out_arsize),
    .auto_in_arecho_extra_id(axi4frag_auto_out_arecho_extra_id),
    .auto_in_arecho_real_last(axi4frag_auto_out_arecho_real_last),
    .auto_in_rready(axi4frag_auto_out_rready),
    .auto_in_rvalid(axi4frag_auto_out_rvalid),
    .auto_in_rid(axi4frag_auto_out_rid),
    .auto_in_rdata(axi4frag_auto_out_rdata),
    .auto_in_rresp(axi4frag_auto_out_rresp),
    .auto_in_recho_extra_id(axi4frag_auto_out_recho_extra_id),
    .auto_in_recho_real_last(axi4frag_auto_out_recho_real_last),
    .auto_in_rlast(axi4frag_auto_out_rlast),
    .auto_out_awready(axi4yank_auto_out_awready),
    .auto_out_awvalid(axi4yank_auto_out_awvalid),
    .auto_out_awid(axi4yank_auto_out_awid),
    .auto_out_awaddr(axi4yank_auto_out_awaddr),
    .auto_out_awlen(axi4yank_auto_out_awlen),
    .auto_out_awsize(axi4yank_auto_out_awsize),
    .auto_out_wready(axi4yank_auto_out_wready),
    .auto_out_wvalid(axi4yank_auto_out_wvalid),
    .auto_out_wdata(axi4yank_auto_out_wdata),
    .auto_out_wstrb(axi4yank_auto_out_wstrb),
    .auto_out_wlast(axi4yank_auto_out_wlast),
    .auto_out_bready(axi4yank_auto_out_bready),
    .auto_out_bvalid(axi4yank_auto_out_bvalid),
    .auto_out_bid(axi4yank_auto_out_bid),
    .auto_out_bresp(axi4yank_auto_out_bresp),
    .auto_out_arready(axi4yank_auto_out_arready),
    .auto_out_arvalid(axi4yank_auto_out_arvalid),
    .auto_out_arid(axi4yank_auto_out_arid),
    .auto_out_araddr(axi4yank_auto_out_araddr),
    .auto_out_arlen(axi4yank_auto_out_arlen),
    .auto_out_arsize(axi4yank_auto_out_arsize),
    .auto_out_rready(axi4yank_auto_out_rready),
    .auto_out_rvalid(axi4yank_auto_out_rvalid),
    .auto_out_rid(axi4yank_auto_out_rid),
    .auto_out_rdata(axi4yank_auto_out_rdata),
    .auto_out_rresp(axi4yank_auto_out_rresp),
    .auto_out_rlast(axi4yank_auto_out_rlast)
  );

  wire  axi42tl_auto_out_a_ready;
  wire  axi42tl_auto_out_a_valid;
  wire [2:0] axi42tl_auto_out_a_bits_opcode;
  wire [2:0] axi42tl_auto_out_a_bits_size;
  wire [3:0] axi42tl_auto_out_a_bits_source;
  wire [31:0] axi42tl_auto_out_a_bits_address;
  wire [7:0] axi42tl_auto_out_a_bits_mask;
  wire [63:0] axi42tl_auto_out_a_bits_data;
  wire  axi42tl_auto_out_d_ready;
  wire  axi42tl_auto_out_d_valid;
  wire [2:0] axi42tl_auto_out_d_bits_opcode;
  wire [2:0] axi42tl_auto_out_d_bits_size;
  wire [3:0] axi42tl_auto_out_d_bits_source;
  wire  axi42tl_auto_out_d_bits_denied;
  wire [63:0] axi42tl_auto_out_d_bits_data;
  wire  axi42tl_auto_out_d_bits_corrupt;

  CHIPLINK_PREFIX_AXI4ToTL axi42tl (
    .clock(ddr_clock),
    .reset(ddr_reset),
    .auto_in_awready(axi4yank_auto_out_awready),
    .auto_in_awvalid(axi4yank_auto_out_awvalid),
    .auto_in_awid(axi4yank_auto_out_awid),
    .auto_in_awaddr(axi4yank_auto_out_awaddr),
    .auto_in_awlen(axi4yank_auto_out_awlen),
    .auto_in_awsize(axi4yank_auto_out_awsize),
    .auto_in_wready(axi4yank_auto_out_wready),
    .auto_in_wvalid(axi4yank_auto_out_wvalid),
    .auto_in_wdata(axi4yank_auto_out_wdata),
    .auto_in_wstrb(axi4yank_auto_out_wstrb),
    .auto_in_wlast(axi4yank_auto_out_wlast),
    .auto_in_bready(axi4yank_auto_out_bready),
    .auto_in_bvalid(axi4yank_auto_out_bvalid),
    .auto_in_bid(axi4yank_auto_out_bid),
    .auto_in_bresp(axi4yank_auto_out_bresp),
    .auto_in_arready(axi4yank_auto_out_arready),
    .auto_in_arvalid(axi4yank_auto_out_arvalid),
    .auto_in_arid(axi4yank_auto_out_arid),
    .auto_in_araddr(axi4yank_auto_out_araddr),
    .auto_in_arlen(axi4yank_auto_out_arlen),
    .auto_in_arsize(axi4yank_auto_out_arsize),
    .auto_in_rready(axi4yank_auto_out_rready),
    .auto_in_rvalid(axi4yank_auto_out_rvalid),
    .auto_in_rid(axi4yank_auto_out_rid),
    .auto_in_rdata(axi4yank_auto_out_rdata),
    .auto_in_rresp(axi4yank_auto_out_rresp),
    .auto_in_rlast(axi4yank_auto_out_rlast),
    .auto_out_a_ready(axi42tl_auto_out_a_ready),
    .auto_out_a_valid(axi42tl_auto_out_a_valid),
    .auto_out_a_bits_opcode(axi42tl_auto_out_a_bits_opcode),
    .auto_out_a_bits_size(axi42tl_auto_out_a_bits_size),
    .auto_out_a_bits_source(axi42tl_auto_out_a_bits_source),
    .auto_out_a_bits_address(axi42tl_auto_out_a_bits_address),
    .auto_out_a_bits_mask(axi42tl_auto_out_a_bits_mask),
    .auto_out_a_bits_data(axi42tl_auto_out_a_bits_data),
    .auto_out_d_ready(axi42tl_auto_out_d_ready),
    .auto_out_d_valid(axi42tl_auto_out_d_valid),
    .auto_out_d_bits_opcode(axi42tl_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(axi42tl_auto_out_d_bits_size),
    .auto_out_d_bits_source(axi42tl_auto_out_d_bits_source),
    .auto_out_d_bits_denied(axi42tl_auto_out_d_bits_denied),
    .auto_out_d_bits_data(axi42tl_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(axi42tl_auto_out_d_bits_corrupt)
  );

  wire  widget_auto_out_a_ready;
  wire  widget_auto_out_a_valid;
  wire [2:0] widget_auto_out_a_bits_opcode;
  wire [2:0] widget_auto_out_a_bits_size;
  wire [3:0] widget_auto_out_a_bits_source;
  wire [31:0] widget_auto_out_a_bits_address;
  wire [3:0] widget_auto_out_a_bits_mask;
  wire [31:0] widget_auto_out_a_bits_data;


  wire  widget_auto_out_d_ready;
  wire  widget_auto_out_d_valid;
  wire [2:0] widget_auto_out_d_bits_opcode;
  wire [1:0] widget_auto_out_d_bits_param;
  wire [2:0] widget_auto_out_d_bits_size;
  wire [3:0] widget_auto_out_d_bits_source;
  wire       widget_auto_out_d_bits_source_unused;
  wire [5:0] widget_auto_out_d_bits_sink;
  wire  widget_auto_out_d_bits_denied;
  wire [31:0] widget_auto_out_d_bits_data;
  wire  widget_auto_out_d_bits_corrupt;

  assign widget_auto_out_d_bits_param = 2'b0;
  assign widget_auto_out_d_bits_sink = 5'b0;

  CHIPLINK_PREFIX_TLWidthWidget widget (
    .clock(ddr_clock),
    .reset(ddr_reset),
    .auto_in_a_ready(axi42tl_auto_out_a_ready),
    .auto_in_a_valid(axi42tl_auto_out_a_valid),
    .auto_in_a_bits_opcode(axi42tl_auto_out_a_bits_opcode),
    .auto_in_a_bits_size(axi42tl_auto_out_a_bits_size),
    .auto_in_a_bits_source(axi42tl_auto_out_a_bits_source),
    .auto_in_a_bits_address(axi42tl_auto_out_a_bits_address),
    .auto_in_a_bits_mask(axi42tl_auto_out_a_bits_mask),
    .auto_in_a_bits_data(axi42tl_auto_out_a_bits_data),
    .auto_in_d_ready(axi42tl_auto_out_d_ready),
    .auto_in_d_valid(axi42tl_auto_out_d_valid),
    .auto_in_d_bits_opcode(axi42tl_auto_out_d_bits_opcode),
    .auto_in_d_bits_size(axi42tl_auto_out_d_bits_size),
    .auto_in_d_bits_source(axi42tl_auto_out_d_bits_source),
    .auto_in_d_bits_denied(axi42tl_auto_out_d_bits_denied),
    .auto_in_d_bits_data(axi42tl_auto_out_d_bits_data),
    .auto_in_d_bits_corrupt(axi42tl_auto_out_d_bits_corrupt),
    .auto_out_a_ready(widget_auto_out_a_ready),
    .auto_out_a_valid(widget_auto_out_a_valid),
    .auto_out_a_bits_opcode(widget_auto_out_a_bits_opcode),
    .auto_out_a_bits_size(widget_auto_out_a_bits_size),
    .auto_out_a_bits_source(widget_auto_out_a_bits_source),
    .auto_out_a_bits_address(widget_auto_out_a_bits_address),
    .auto_out_a_bits_mask(widget_auto_out_a_bits_mask),
    .auto_out_a_bits_data(widget_auto_out_a_bits_data),
    .auto_out_d_ready(widget_auto_out_d_ready),
    .auto_out_d_valid(widget_auto_out_d_valid),
    .auto_out_d_bits_opcode(widget_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(widget_auto_out_d_bits_param),
    .auto_out_d_bits_size(widget_auto_out_d_bits_size),
    .auto_out_d_bits_source(widget_auto_out_d_bits_source),
    .auto_out_d_bits_sink(widget_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(widget_auto_out_d_bits_denied),
    .auto_out_d_bits_data(widget_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(widget_auto_out_d_bits_corrupt)
  );


  wire  tl2axi4_1_clock; 
  wire  tl2axi4_1_reset; 
  
  wire  tl2axi4_1_auto_out_aw_ready; 
  wire  tl2axi4_1_auto_out_aw_valid; 
  wire [37:0] tl2axi4_1_auto_out_aw_bits_addr; 
  wire [13:0] tl2axi4_1_auto_out_aw_bits_user; 
  wire  tl2axi4_1_auto_out_w_ready; 
  wire  tl2axi4_1_auto_out_w_valid; 
  wire [31:0] tl2axi4_1_auto_out_w_bits_data; 
  wire [3:0] tl2axi4_1_auto_out_w_bits_strb; 
  wire  tl2axi4_1_auto_out_b_ready; 
  wire  tl2axi4_1_auto_out_b_valid; 
  wire [1:0] tl2axi4_1_auto_out_b_bits_resp; 
  wire [13:0] tl2axi4_1_auto_out_b_bits_user; 
  wire  tl2axi4_1_auto_out_ar_ready; 
  wire  tl2axi4_1_auto_out_ar_valid; 
  wire [37:0] tl2axi4_1_auto_out_ar_bits_addr; 
  wire [13:0] tl2axi4_1_auto_out_ar_bits_user; 
  wire  tl2axi4_1_auto_out_r_ready; 
  wire  tl2axi4_1_auto_out_r_valid; 
  wire [31:0] tl2axi4_1_auto_out_r_bits_data; 
  wire [1:0] tl2axi4_1_auto_out_r_bits_resp; 
  wire [13:0] tl2axi4_1_auto_out_r_bits_user; 
  wire  tl2axi4_1_auto_out_r_bits_last; 

  wire  fragmenter_auto_out_a_ready; 
  wire  fragmenter_auto_out_a_valid; 
  wire [2:0] fragmenter_auto_out_a_bits_opcode; 
  wire [2:0] fragmenter_auto_out_a_bits_param; 
  wire [1:0] fragmenter_auto_out_a_bits_size; 
  wire [9:0] fragmenter_auto_out_a_bits_source; 
  wire [37:0] fragmenter_auto_out_a_bits_address; 
  wire [3:0] fragmenter_auto_out_a_bits_mask; 
  wire [31:0] fragmenter_auto_out_a_bits_data; 
  wire  fragmenter_auto_out_a_bits_corrupt; 
  wire  fragmenter_auto_out_d_ready; 
  wire  fragmenter_auto_out_d_valid; 
  wire [2:0] fragmenter_auto_out_d_bits_opcode; 
  wire [1:0] fragmenter_auto_out_d_bits_size; 
  wire [9:0] fragmenter_auto_out_d_bits_source; 
  wire  fragmenter_auto_out_d_bits_denied; 
  wire [31:0] fragmenter_auto_out_d_bits_data; 
  wire  fragmenter_auto_out_d_bits_corrupt; 


  TLFragmenter_11 fragmenter ( 
    .clock(ddr_clock),
    .reset(ddr_reset),
    .auto_in_a_ready(widget_auto_out_a_ready),
    .auto_in_a_valid(widget_auto_out_a_valid),
    .auto_in_a_bits_opcode(widget_auto_out_a_bits_opcode),
    .auto_in_a_bits_param(3'b0),
    .auto_in_a_bits_size(widget_auto_out_a_bits_size),
    .auto_in_a_bits_source({1'b0, widget_auto_out_a_bits_source}),
    .auto_in_a_bits_address({6'b0, widget_auto_out_a_bits_address}),
    .auto_in_a_bits_mask(widget_auto_out_a_bits_mask),
    .auto_in_a_bits_data(widget_auto_out_a_bits_data),
    .auto_in_a_bits_corrupt(1'b0),
    .auto_in_d_ready(widget_auto_out_d_ready),
    .auto_in_d_valid(widget_auto_out_d_valid),
    .auto_in_d_bits_opcode(widget_auto_out_d_bits_opcode),
    .auto_in_d_bits_size(widget_auto_out_d_bits_size),
    .auto_in_d_bits_source({widget_auto_out_d_bits_source_unused, widget_auto_out_d_bits_source}),
    .auto_in_d_bits_denied(widget_auto_out_d_bits_denied),
    .auto_in_d_bits_data(widget_auto_out_d_bits_data),
    .auto_in_d_bits_corrupt(widget_auto_out_d_bits_corrupt),
    .auto_out_a_ready(fragmenter_auto_out_a_ready),
    .auto_out_a_valid(fragmenter_auto_out_a_valid),
    .auto_out_a_bits_opcode(fragmenter_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(fragmenter_auto_out_a_bits_param),
    .auto_out_a_bits_size(fragmenter_auto_out_a_bits_size),
    .auto_out_a_bits_source(fragmenter_auto_out_a_bits_source),
    .auto_out_a_bits_address(fragmenter_auto_out_a_bits_address),
    .auto_out_a_bits_mask(fragmenter_auto_out_a_bits_mask),
    .auto_out_a_bits_data(fragmenter_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(fragmenter_auto_out_a_bits_corrupt),
    .auto_out_d_ready(fragmenter_auto_out_d_ready),
    .auto_out_d_valid(fragmenter_auto_out_d_valid),
    .auto_out_d_bits_opcode(fragmenter_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(fragmenter_auto_out_d_bits_size),
    .auto_out_d_bits_source(fragmenter_auto_out_d_bits_source),
    .auto_out_d_bits_denied(fragmenter_auto_out_d_bits_denied),
    .auto_out_d_bits_data(fragmenter_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(fragmenter_auto_out_d_bits_corrupt)
  );


  TLToAXI4_2 tl2axi4_1 ( 
    .clock(ddr_clock),
    .reset(ddr_reset),
    .auto_in_a_ready(fragmenter_auto_out_a_ready),
    .auto_in_a_valid(fragmenter_auto_out_a_valid),
    .auto_in_a_bits_opcode(fragmenter_auto_out_a_bits_opcode),
    .auto_in_a_bits_param(fragmenter_auto_out_a_bits_param),
    .auto_in_a_bits_size(fragmenter_auto_out_a_bits_size),
    .auto_in_a_bits_source(fragmenter_auto_out_a_bits_source),
    .auto_in_a_bits_address(fragmenter_auto_out_a_bits_address),
    .auto_in_a_bits_mask(fragmenter_auto_out_a_bits_mask),
    .auto_in_a_bits_data(fragmenter_auto_out_a_bits_data),
    .auto_in_a_bits_corrupt(fragmenter_auto_out_a_bits_corrupt),
    .auto_in_d_ready(fragmenter_auto_out_d_ready),
    .auto_in_d_valid(fragmenter_auto_out_d_valid),
    .auto_in_d_bits_opcode(fragmenter_auto_out_d_bits_opcode),
    .auto_in_d_bits_size(fragmenter_auto_out_d_bits_size),
    .auto_in_d_bits_source(fragmenter_auto_out_d_bits_source),
    .auto_in_d_bits_denied(fragmenter_auto_out_d_bits_denied),
    .auto_in_d_bits_data(fragmenter_auto_out_d_bits_data),
    .auto_in_d_bits_corrupt(fragmenter_auto_out_d_bits_corrupt),
    .auto_out_aw_ready(tl2axi4_1_auto_out_aw_ready),
    .auto_out_aw_valid(tl2axi4_1_auto_out_aw_valid),
    .auto_out_aw_bits_addr(tl2axi4_1_auto_out_aw_bits_addr),
    .auto_out_aw_bits_user(tl2axi4_1_auto_out_aw_bits_user),
    .auto_out_w_ready(tl2axi4_1_auto_out_w_ready),
    .auto_out_w_valid(tl2axi4_1_auto_out_w_valid),
    .auto_out_w_bits_data(tl2axi4_1_auto_out_w_bits_data),
    .auto_out_w_bits_strb(tl2axi4_1_auto_out_w_bits_strb),
    .auto_out_b_ready(tl2axi4_1_auto_out_b_ready),
    .auto_out_b_valid(tl2axi4_1_auto_out_b_valid),
    .auto_out_b_bits_resp(tl2axi4_1_auto_out_b_bits_resp),
    .auto_out_b_bits_user(tl2axi4_1_auto_out_b_bits_user),
    .auto_out_ar_ready(tl2axi4_1_auto_out_ar_ready),
    .auto_out_ar_valid(tl2axi4_1_auto_out_ar_valid),
    .auto_out_ar_bits_addr(tl2axi4_1_auto_out_ar_bits_addr),
    .auto_out_ar_bits_user(tl2axi4_1_auto_out_ar_bits_user),
    .auto_out_r_ready(tl2axi4_1_auto_out_r_ready),
    .auto_out_r_valid(tl2axi4_1_auto_out_r_valid),
    .auto_out_r_bits_data(tl2axi4_1_auto_out_r_bits_data),
    .auto_out_r_bits_resp(tl2axi4_1_auto_out_r_bits_resp),
    .auto_out_r_bits_user(tl2axi4_1_auto_out_r_bits_user),
    .auto_out_r_bits_last(tl2axi4_1_auto_out_r_bits_last)
  );


  wire  axi4yank_1_auto_out_aw_ready; 
  wire  axi4yank_1_auto_out_aw_valid; 
  wire [37:0] axi4yank_1_auto_out_awaddr; 
  wire  axi4yank_1_auto_out_wready; 
  wire  axi4yank_1_auto_out_wvalid; 
  wire [31:0] axi4yank_1_auto_out_wdata; 
  wire [3:0] axi4yank_1_auto_out_wstrb; 
  wire  axi4yank_1_auto_out_bready; 
  wire  axi4yank_1_auto_out_bvalid; 
  wire [1:0] axi4yank_1_auto_out_bresp; 
  wire  axi4yank_1_auto_out_arready; 
  wire  axi4yank_1_auto_out_arvalid; 
  wire [37:0] axi4yank_1_auto_out_araddr; 
  wire  axi4yank_1_auto_out_rready; 
  wire  axi4yank_1_auto_out_rvalid; 
  wire [31:0] axi4yank_1_auto_out_rdata; 
  wire [1:0] axi4yank_1_auto_out_rresp; 
  wire  axi4yank_1_auto_out_rlast; 
  wire [3:0] axi4yank_1_auto_out_rid;
  wire [3:0] axi4yank_1_auto_out_bid;
  
  AXI4UserYanker_2 axi4yank_1 ( 
    .clock(ddr_clock),
    .reset(ddr_reset),
    .auto_in_aw_ready(tl2axi4_1_auto_out_aw_ready),
    .auto_in_aw_valid(tl2axi4_1_auto_out_aw_valid),
    .auto_in_aw_bits_addr(tl2axi4_1_auto_out_aw_bits_addr),
    .auto_in_aw_bits_user(tl2axi4_1_auto_out_aw_bits_user),
    .auto_in_w_ready(tl2axi4_1_auto_out_w_ready),
    .auto_in_w_valid(tl2axi4_1_auto_out_w_valid),
    .auto_in_w_bits_data(tl2axi4_1_auto_out_w_bits_data),
    .auto_in_w_bits_strb(tl2axi4_1_auto_out_w_bits_strb),
    .auto_in_b_ready(tl2axi4_1_auto_out_b_ready),
    .auto_in_b_valid(tl2axi4_1_auto_out_b_valid),
    .auto_in_b_bits_resp(tl2axi4_1_auto_out_b_bits_resp),
    .auto_in_b_bits_user(tl2axi4_1_auto_out_b_bits_user),
    .auto_in_ar_ready(tl2axi4_1_auto_out_ar_ready),
    .auto_in_ar_valid(tl2axi4_1_auto_out_ar_valid),
    .auto_in_ar_bits_addr(tl2axi4_1_auto_out_ar_bits_addr),
    .auto_in_ar_bits_user(tl2axi4_1_auto_out_ar_bits_user),
    .auto_in_r_ready(tl2axi4_1_auto_out_r_ready),
    .auto_in_r_valid(tl2axi4_1_auto_out_r_valid),
    .auto_in_r_bits_data(tl2axi4_1_auto_out_r_bits_data),
    .auto_in_r_bits_resp(tl2axi4_1_auto_out_r_bits_resp),
    .auto_in_r_bits_user(tl2axi4_1_auto_out_r_bits_user),
    .auto_in_r_bits_last(tl2axi4_1_auto_out_r_bits_last),
    .auto_out_aw_ready(axi4yank_1_auto_out_awready),
    .auto_out_aw_valid(axi4yank_1_auto_out_awvalid),
    .auto_out_aw_bits_addr(axi4yank_1_auto_out_awaddr),
    .auto_out_w_ready(axi4yank_1_auto_out_wready),
    .auto_out_w_valid(axi4yank_1_auto_out_wvalid),
    .auto_out_w_bits_data(axi4yank_1_auto_out_wdata),
    .auto_out_w_bits_strb(axi4yank_1_auto_out_wstrb),
    .auto_out_b_ready(axi4yank_1_auto_out_bready),
    .auto_out_b_valid(axi4yank_1_auto_out_bvalid),
    .auto_out_b_bits_resp(axi4yank_1_auto_out_bresp),
    .auto_out_ar_ready(axi4yank_1_auto_out_arready),
    .auto_out_ar_valid(axi4yank_1_auto_out_arvalid),
    .auto_out_ar_bits_addr(axi4yank_1_auto_out_araddr),
    .auto_out_r_ready(axi4yank_1_auto_out_rready),
    .auto_out_r_valid(axi4yank_1_auto_out_rvalid),
    .auto_out_r_bits_data(axi4yank_1_auto_out_rdata),
    .auto_out_r_bits_resp(axi4yank_1_auto_out_rresp),
    .auto_out_r_bits_last(axi4yank_1_auto_out_rlast)
  );


`ifndef SDRAM_CONNECT_DIRECT_TL

  sdram_axi 
#( 
    .WIDTH_AD(32),
    .WIDTH_DA(32),
    .WIDTH_ID(4) 
) ddr_slave_0_sdram_axi(
    // Inputs
     .clk_i(ddr_clock)
    ,.rst_i(ddr_reset)
    
    ,.sdram_start_delay(sdram_start_delay)    
    ,.sdram_refresh_cycles(sdram_refresh_cycles)
    ,.sdram_trcd_cycles(sdram_trcd_cycles)
    ,.sdram_trp_cycles(sdram_trp_cycles)
    ,.sdram_trfc_cycles(sdram_trfc_cycles)

    ,.inport_awvalid_i(axi4yank_1_auto_out_awvalid)
    ,.inport_awaddr_i({4'h0, axi4yank_1_auto_out_awaddr[27:0]})  // for max 512M, maybe wrap
    ,.inport_awid_i(4'b0)
    ,.inport_awlen_i(8'h0)
    ,.inport_awsize_i(3'b10)    
    ,.inport_awburst_i(2'b01)
    ,.inport_wvalid_i(axi4yank_1_auto_out_wvalid)
    ,.inport_wdata_i(axi4yank_1_auto_out_wdata)
    ,.inport_wstrb_i(axi4yank_1_auto_out_wstrb)
    ,.inport_wlast_i(1'b1)
    ,.inport_bready_i(axi4yank_1_auto_out_bready)
    ,.inport_arvalid_i(axi4yank_1_auto_out_arvalid)
    ,.inport_araddr_i({4'h0, axi4yank_1_auto_out_araddr[27:0]})
    ,.inport_arid_i(4'b0)
    ,.inport_arlen_i(8'h0)
    ,.inport_arsize_i(3'b10)    
    ,.inport_arburst_i(2'b01)
    ,.inport_rready_i(axi4yank_1_auto_out_rready)

    ,.inport_awready_o(axi4yank_1_auto_out_awready)
    ,.inport_wready_o(axi4yank_1_auto_out_wready)
    ,.inport_bvalid_o(axi4yank_1_auto_out_bvalid)
    ,.inport_bresp_o(axi4yank_1_auto_out_bresp)
    ,.inport_bid_o(axi4yank_1_auto_out_bid)
    ,.inport_arready_o(axi4yank_1_auto_out_arready)
    ,.inport_rvalid_o(axi4yank_1_auto_out_rvalid)
    ,.inport_rdata_o(axi4yank_1_auto_out_rdata)
    ,.inport_rresp_o(axi4yank_1_auto_out_rresp)
    ,.inport_rid_o(axi4yank_1_auto_out_rid)
    ,.inport_rlast_o(axi4yank_1_auto_out_rlast)

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


`else
  wire  mem_xbar_auto_in_x2x_a_ready;
  wire  mem_xbar_auto_in_x2x_a_valid;
  wire [2:0] mem_xbar_auto_in_x2x_a_bits_opcode;
  wire [2:0] mem_xbar_auto_in_x2x_a_bits_size;
  wire [3:0] mem_xbar_auto_in_x2x_a_bits_source;
  wire [31:0] mem_xbar_auto_in_x2x_a_bits_address;
  wire [7:0] mem_xbar_auto_in_x2x_a_bits_mask;
  wire [63:0] mem_xbar_auto_in_x2x_a_bits_data;
  wire  mem_xbar_auto_in_x2x_d_ready;
  wire  mem_xbar_auto_in_x2x_d_valid;
  wire [2:0] mem_xbar_auto_in_x2x_d_bits_opcode;
  wire [2:0] mem_xbar_auto_in_x2x_d_bits_size;
  wire [3:0] mem_xbar_auto_in_x2x_d_bits_source;
  wire  mem_xbar_auto_in_x2x_d_bits_denied;
  wire [63:0] mem_xbar_auto_in_x2x_d_bits_data;
  wire  mem_xbar_auto_in_x2x_d_bits_corrupt;

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

        ,.s_a_ready(mem_xbar_auto_in_a_ready)
        ,.s_a_valid(mem_xbar_auto_in_a_valid)
        ,.s_a_bits_opcode(mem_xbar_auto_in_a_bits_opcode)
        ,.s_a_bits_param(3'b0)
        ,.s_a_bits_size(mem_xbar_auto_in_a_bits_size)
        ,.s_a_bits_source(mem_xbar_auto_in_a_bits_source)
        ,.s_a_bits_address(mem_xbar_auto_in_a_bits_address)
        ,.s_a_bits_mask(mem_xbar_auto_in_a_bits_mask)
        ,.s_a_bits_data(mem_xbar_auto_in_a_bits_data)
        ,.s_a_bits_corrupt(1'b0)
        ,.s_d_ready(mem_xbar_auto_in_d_ready)
        ,.s_d_valid(mem_xbar_auto_in_d_valid)
        ,.s_d_bits_opcode(mem_xbar_auto_in_d_bits_opcode)
        ,.s_d_bits_param()
        ,.s_d_bits_size(mem_xbar_auto_in_d_bits_size)
        ,.s_d_bits_source(mem_xbar_auto_in_d_bits_source)
        ,.s_d_bits_sink()
        ,.s_d_bits_denied(mem_xbar_auto_in_d_bits_denied)
        ,.s_d_bits_data(mem_xbar_auto_in_d_bits_data)
        ,.s_d_bits_corrupt(mem_xbar_auto_in_d_bits_corrupt)

        ,.m_a_ready(mem_xbar_auto_in_x2x_a_ready)
        ,.m_a_valid(mem_xbar_auto_in_x2x_a_valid)
        ,.m_a_bits_opcode(mem_xbar_auto_in_x2x_a_bits_opcode)
        ,.m_a_bits_param()
        ,.m_a_bits_size(mem_xbar_auto_in_x2x_a_bits_size)
        ,.m_a_bits_source(mem_xbar_auto_in_x2x_a_bits_source)
        ,.m_a_bits_address(mem_xbar_auto_in_x2x_a_bits_address)
        ,.m_a_bits_mask(mem_xbar_auto_in_x2x_a_bits_mask)
        ,.m_a_bits_data(mem_xbar_auto_in_x2x_a_bits_data)
        ,.m_a_bits_corrupt()
        ,.m_d_ready(mem_xbar_auto_in_x2x_d_ready)
        ,.m_d_valid(mem_xbar_auto_in_x2x_d_valid)
        ,.m_d_bits_opcode(mem_xbar_auto_in_x2x_d_bits_opcode)
        ,.m_d_bits_param(2'b0)
        ,.m_d_bits_size(mem_xbar_auto_in_x2x_d_bits_size)
        ,.m_d_bits_source(mem_xbar_auto_in_x2x_d_bits_source)
        ,.m_d_bits_sink(3'b0)
        ,.m_d_bits_denied(mem_xbar_auto_in_x2x_d_bits_denied)
        ,.m_d_bits_data(mem_xbar_auto_in_x2x_d_bits_data)
        ,.m_d_bits_corrupt(mem_xbar_auto_in_x2x_d_bits_corrupt)
    
	);

`endif


endmodule
