     bit                      ARESETn;
     bit                      ACLK;
     //--------------------------------------------------------------
     wire  [top_pkg::WIDTH_CID-1:0]     M0_MID;   // if not sure use 'h0;
     wire  [8-1:0]      M0_AWID;
     wire  [top_pkg::AXI_ADDR_WIDTH-1:0]      M0_AWADDR;
     `ifdef AMBA_AXI4
     wire  [ 7:0]              M0_AWLEN;
     wire                      M0_AWLOCK;
     `else
     wire  [ 3:0]              M0_AWLEN;
     wire  [ 1:0]              M0_AWLOCK;
     `endif
     wire  [ 2:0]              M0_AWSIZE;
     wire  [ 1:0]              M0_AWBURST;
     `ifdef  AMBA_AXI_CACHE
     wire  [ 3:0]              M0_AWCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
     wire  [ 2:0]              M0_AWPROT;
     `endif
     wire                      M0_AWVALID;
     wire                      M0_AWREADY;
     `ifdef AMBA_AXI4
     wire  [ 3:0]              M0_AWQOS;
     wire  [ 3:0]              M0_AWREGION;
     `endif
     `ifdef AMBA_AXI_AWUSER
     wire  [top_pkg::WIDTH_AWUSER-1:0]  M0_AWUSER;
     `endif
     wire  [8-1:0]      M0_WID;
     wire  [top_pkg::AXI_DATA_WIDTH-1:0]      M0_WDATA;
     wire  [top_pkg::AXI_WSTRB_WIDTH-1:0]      M0_WSTRB;
     wire                      M0_WLAST;
     wire                      M0_WVALID;
     wire                      M0_WREADY;
     `ifdef AMBA_AXI_WUSER
     wire  [top_pkg::WIDTH_WUSER-1:0]   M0_WUSER;
     `endif
     wire  [8-1:0]      M0_BID;
     wire  [ 1:0]              M0_BRESP;
     wire                      M0_BVALID;
     wire                      M0_BREADY;
     `ifdef AMBA_AXI_BUSER
     wire  [top_pkg::WIDTH_BUSER-1:0]   M0_BUSER;
     `endif
     wire  [8-1:0]      M0_ARID;
     wire  [top_pkg::AXI_ADDR_WIDTH-1:0]      M0_ARADDR;
     `ifdef AMBA_AXI4
     wire  [ 7:0]              M0_ARLEN;
     wire                      M0_ARLOCK;
     `else
     wire  [ 3:0]              M0_ARLEN;
     wire  [ 1:0]              M0_ARLOCK;
     `endif
     wire  [ 2:0]              M0_ARSIZE;
     wire  [ 1:0]              M0_ARBURST;
     `ifdef  AMBA_AXI_CACHE
     wire  [ 3:0]              M0_ARCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
     wire  [ 2:0]              M0_ARPROT;
     `endif
     wire                      M0_ARVALID;
     wire                      M0_ARREADY;
     `ifdef AMBA_AXI4
     wire  [ 3:0]              M0_ARQOS;
     wire  [ 3:0]              M0_ARREGION;
     `endif
     `ifdef AMBA_AXI_ARUSER
     wire  [top_pkg::WIDTH_ARUSER-1:0]  M0_ARUSER;
     `endif
     wire  [8-1:0]      M0_RID;
     wire  [top_pkg::AXI_DATA_WIDTH-1:0]      M0_RDATA;
     wire  [ 1:0]              M0_RRESP;
     wire                      M0_RLAST;
     wire                      M0_RVALID;
     wire                      M0_RREADY;
     `ifdef AMBA_AXI_RUSER
     wire  [top_pkg::WIDTH_RUSER-1:0]   M0_RUSER;
     `endif
     //--------------------------------------------------------------
     wire  [top_pkg::WIDTH_CID-1:0]     M1_MID;   // if not sure use 'h1;
     wire  [8-1:0]      M1_AWID;
     wire  [top_pkg::AXI_ADDR_WIDTH-1:0]      M1_AWADDR;
     `ifdef AMBA_AXI4
     wire  [ 7:0]              M1_AWLEN;
     wire                      M1_AWLOCK;
     `else
     wire  [ 3:0]              M1_AWLEN;
     wire  [ 1:0]              M1_AWLOCK;
     `endif
     wire  [ 2:0]              M1_AWSIZE;
     wire  [ 1:0]              M1_AWBURST;
     `ifdef  AMBA_AXI_CACHE
     wire  [ 3:0]              M1_AWCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
     wire  [ 2:0]              M1_AWPROT;
     `endif
     wire                      M1_AWVALID;
     wire                      M1_AWREADY;
     `ifdef AMBA_AXI4
     wire  [ 3:0]              M1_AWQOS;
     wire  [ 3:0]              M1_AWREGION;
     `endif
     `ifdef AMBA_AXI_AWUSER
     wire  [top_pkg::WIDTH_AWUSER-1:0]  M1_AWUSER;
     `endif
     wire  [8-1:0]      M1_WID;
     wire  [top_pkg::AXI_DATA_WIDTH-1:0]      M1_WDATA;
     wire  [top_pkg::AXI_WSTRB_WIDTH-1:0]      M1_WSTRB;
     wire                      M1_WLAST;
     wire                      M1_WVALID;
     wire                      M1_WREADY;
     `ifdef AMBA_AXI_WUSER
     wire  [top_pkg::WIDTH_WUSER-1:0]   M1_WUSER;
     `endif
     wire  [8-1:0]      M1_BID;
     wire  [ 1:0]              M1_BRESP;
     wire                      M1_BVALID;
     wire                      M1_BREADY;
     `ifdef AMBA_AXI_BUSER
     wire  [top_pkg::WIDTH_BUSER-1:0]   M1_BUSER;
     `endif
     wire  [8-1:0]      M1_ARID;
     wire  [top_pkg::AXI_ADDR_WIDTH-1:0]      M1_ARADDR;
     `ifdef AMBA_AXI4
     wire  [ 7:0]              M1_ARLEN;
     wire                      M1_ARLOCK;
     `else
     wire  [ 3:0]              M1_ARLEN;
     wire  [ 1:0]              M1_ARLOCK;
     `endif
     wire  [ 2:0]              M1_ARSIZE;
     wire  [ 1:0]              M1_ARBURST;
     `ifdef  AMBA_AXI_CACHE
     wire  [ 3:0]              M1_ARCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
     wire  [ 2:0]              M1_ARPROT;
     `endif
     wire                      M1_ARVALID;
     wire                      M1_ARREADY;
     `ifdef AMBA_AXI4
     wire  [ 3:0]              M1_ARQOS;
     wire  [ 3:0]              M1_ARREGION;
     `endif
     `ifdef AMBA_AXI_ARUSER
     wire  [top_pkg::WIDTH_ARUSER-1:0]  M1_ARUSER;
     `endif
     wire  [8-1:0]      M1_RID;
     wire  [top_pkg::AXI_DATA_WIDTH-1:0]      M1_RDATA;
     wire  [ 1:0]              M1_RRESP;
     wire                      M1_RLAST;
     wire                      M1_RVALID;
     wire                      M1_RREADY;
     `ifdef AMBA_AXI_RUSER
     wire  [top_pkg::WIDTH_RUSER-1:0]   M1_RUSER;
     `endif
     //--------------------------------------------------------------
     wire   [top_pkg::WIDTH_SID-1:0]    S0_AWID;
     wire   [top_pkg::AXI_ADDR_WIDTH-1:0]     S0_AWADDR;
     `ifdef AMBA_AXI4
     wire   [ 7:0]             S0_AWLEN;
     wire                      S0_AWLOCK;
     `else
     wire   [ 3:0]             S0_AWLEN;
     wire   [ 1:0]             S0_AWLOCK;
     `endif
     wire   [ 2:0]             S0_AWSIZE;
     wire   [ 1:0]             S0_AWBURST;
     `ifdef  AMBA_AXI_CACHE
     wire   [ 3:0]             S0_AWCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
     wire   [ 2:0]             S0_AWPROT;
     `endif
     wire                      S0_AWVALID;
     wire                      S0_AWREADY;
     `ifdef AMBA_AXI4
     wire   [ 3:0]             S0_AWQOS;
     wire   [ 3:0]             S0_AWREGION;
     `endif
     `ifdef AMBA_AXI_AWUSER
     wire   [top_pkg::WIDTH_AWUSER-1:0] S0_AWUSER;
     `endif
     wire   [top_pkg::WIDTH_SID-1:0]    S0_WID;
     wire   [top_pkg::AXI_DATA_WIDTH-1:0]     S0_WDATA;
     wire   [top_pkg::AXI_WSTRB_WIDTH-1:0]     S0_WSTRB;
     wire                      S0_WLAST;
     wire                      S0_WVALID;
     wire                      S0_WREADY;
     `ifdef AMBA_AXI_WUSER
     wire   [top_pkg::WIDTH_WUSER-1:0]  S0_WUSER;
     `endif
     wire   [top_pkg::WIDTH_SID-1:0]    S0_BID;
     wire   [ 1:0]             S0_BRESP;
     wire                      S0_BVALID;
     wire                      S0_BREADY;
     `ifdef AMBA_AXI_BUSER
     wire   [top_pkg::WIDTH_BUSER-1:0]  S0_BUSER;
     `endif
     wire   [top_pkg::WIDTH_SID-1:0]    S0_ARID;
     wire   [top_pkg::AXI_ADDR_WIDTH-1:0]     S0_ARADDR;
     `ifdef AMBA_AXI4
     wire   [ 7:0]             S0_ARLEN;
     wire                      S0_ARLOCK;
     `else
     wire   [ 3:0]             S0_ARLEN;
     wire   [ 1:0]             S0_ARLOCK;
     `endif
     wire   [ 2:0]             S0_ARSIZE;
     wire   [ 1:0]             S0_ARBURST;
     `ifdef  AMBA_AXI_CACHE
     wire   [ 3:0]             S0_ARCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
     wire   [ 2:0]             S0_ARPROT;
     `endif
     wire                      S0_ARVALID;
     wire                      S0_ARREADY;
     `ifdef AMBA_AXI4
     wire   [ 3:0]             S0_ARQOS;
     wire   [ 3:0]             S0_ARREGION;
     `endif
     `ifdef AMBA_AXI_ARUSER
     wire   [top_pkg::WIDTH_ARUSER-1:0] S0_ARUSER;
     `endif
     wire   [top_pkg::WIDTH_SID-1:0]    S0_RID;
     wire   [top_pkg::AXI_DATA_WIDTH-1:0]     S0_RDATA;
     wire   [ 1:0]             S0_RRESP;
     wire                      S0_RLAST;
     wire                      S0_RVALID;
     wire                      S0_RREADY;
     `ifdef AMBA_AXI_RUSER
     wire   [top_pkg::WIDTH_RUSER-1:0]  S0_RUSER;
     `endif
     //--------------------------------------------------------------
     wire   [top_pkg::WIDTH_SID-1:0]    S1_AWID;
     wire   [top_pkg::AXI_ADDR_WIDTH-1:0]     S1_AWADDR;
     `ifdef AMBA_AXI4
     wire   [ 7:0]             S1_AWLEN;
     wire                      S1_AWLOCK;
     `else
     wire   [ 3:0]             S1_AWLEN;
     wire   [ 1:0]             S1_AWLOCK;
     `endif
     wire   [ 2:0]             S1_AWSIZE;
     wire   [ 1:0]             S1_AWBURST;
     `ifdef  AMBA_AXI_CACHE
     wire   [ 3:0]             S1_AWCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
     wire   [ 2:0]             S1_AWPROT;
     `endif
     wire                      S1_AWVALID;
     wire                      S1_AWREADY;
     `ifdef AMBA_AXI4
     wire   [ 3:0]             S1_AWQOS;
     wire   [ 3:0]             S1_AWREGION;
     `endif
     `ifdef AMBA_AXI_AWUSER
     wire   [top_pkg::WIDTH_AWUSER-1:0] S1_AWUSER;
     `endif
     wire   [top_pkg::WIDTH_SID-1:0]    S1_WID;
     wire   [top_pkg::AXI_DATA_WIDTH-1:0]     S1_WDATA;
     wire   [top_pkg::AXI_WSTRB_WIDTH-1:0]     S1_WSTRB;
     wire                      S1_WLAST;
     wire                      S1_WVALID;
     wire                      S1_WREADY;
     `ifdef AMBA_AXI_WUSER
     wire   [top_pkg::WIDTH_WUSER-1:0]  S1_WUSER;
     `endif
     wire   [top_pkg::WIDTH_SID-1:0]    S1_BID;
     wire   [ 1:0]             S1_BRESP;
     wire                      S1_BVALID;
     wire                      S1_BREADY;
     `ifdef AMBA_AXI_BUSER
     wire   [top_pkg::WIDTH_BUSER-1:0]  S1_BUSER;
     `endif
     wire   [top_pkg::WIDTH_SID-1:0]    S1_ARID;
     wire   [top_pkg::AXI_ADDR_WIDTH-1:0]     S1_ARADDR;
     `ifdef AMBA_AXI4
     wire   [ 7:0]             S1_ARLEN;
     wire                      S1_ARLOCK;
     `else
     wire   [ 3:0]             S1_ARLEN;
     wire   [ 1:0]             S1_ARLOCK;
     `endif
     wire   [ 2:0]             S1_ARSIZE;
     wire   [ 1:0]             S1_ARBURST;
     `ifdef  AMBA_AXI_CACHE
     wire   [ 3:0]             S1_ARCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
     wire   [ 2:0]             S1_ARPROT;
     `endif
     wire                      S1_ARVALID;
     wire                      S1_ARREADY;
     `ifdef AMBA_AXI4
     wire   [ 3:0]             S1_ARQOS;
     wire   [ 3:0]             S1_ARREGION;
     `endif
     `ifdef AMBA_AXI_ARUSER
     wire   [top_pkg::WIDTH_ARUSER-1:0] S1_ARUSER;
     `endif
     wire   [top_pkg::WIDTH_SID-1:0]    S1_RID;
     wire   [top_pkg::AXI_DATA_WIDTH-1:0]     S1_RDATA;
     wire   [ 1:0]             S1_RRESP;
     wire                      S1_RLAST;
     wire                      S1_RVALID;
     wire                      S1_RREADY;
     `ifdef AMBA_AXI_RUSER
     wire   [top_pkg::WIDTH_RUSER-1:0]  S1_RUSER;
     `endif
     //--------------------------------------------------------------
     wire   [top_pkg::WIDTH_SID-1:0]    S2_AWID;
     wire   [top_pkg::AXI_ADDR_WIDTH-1:0]     S2_AWADDR;
     `ifdef AMBA_AXI4
     wire   [ 7:0]             S2_AWLEN;
     wire                      S2_AWLOCK;
     `else
     wire   [ 3:0]             S2_AWLEN;
     wire   [ 1:0]             S2_AWLOCK;
     `endif
     wire   [ 2:0]             S2_AWSIZE;
     wire   [ 1:0]             S2_AWBURST;
     `ifdef  AMBA_AXI_CACHE
     wire   [ 3:0]             S2_AWCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
     wire   [ 2:0]             S2_AWPROT;
     `endif
     wire                      S2_AWVALID;
     wire                      S2_AWREADY;
     `ifdef AMBA_AXI4
     wire   [ 3:0]             S2_AWQOS;
     wire   [ 3:0]             S2_AWREGION;
     `endif
     `ifdef AMBA_AXI_AWUSER
     wire   [top_pkg::WIDTH_AWUSER-1:0] S2_AWUSER;
     `endif
     wire   [top_pkg::WIDTH_SID-1:0]    S2_WID;
     wire   [top_pkg::AXI_DATA_WIDTH-1:0]     S2_WDATA;
     wire   [top_pkg::AXI_WSTRB_WIDTH-1:0]     S2_WSTRB;
     wire                      S2_WLAST;
     wire                      S2_WVALID;
     wire                      S2_WREADY;
     `ifdef AMBA_AXI_WUSER
     wire   [top_pkg::WIDTH_WUSER-1:0]  S2_WUSER;
     `endif
     wire   [top_pkg::WIDTH_SID-1:0]    S2_BID;
     wire   [ 1:0]             S2_BRESP;
     wire                      S2_BVALID;
     wire                      S2_BREADY;
     `ifdef AMBA_AXI_BUSER
     wire   [top_pkg::WIDTH_BUSER-1:0]  S2_BUSER;
     `endif
     wire   [top_pkg::WIDTH_SID-1:0]    S2_ARID;
     wire   [top_pkg::AXI_ADDR_WIDTH-1:0]     S2_ARADDR;
     `ifdef AMBA_AXI4
     wire   [ 7:0]             S2_ARLEN;
     wire                      S2_ARLOCK;
     `else
     wire   [ 3:0]             S2_ARLEN;
     wire   [ 1:0]             S2_ARLOCK;
     `endif
     wire   [ 2:0]             S2_ARSIZE;
     wire   [ 1:0]             S2_ARBURST;
     `ifdef  AMBA_AXI_CACHE
     wire   [ 3:0]             S2_ARCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
     wire   [ 2:0]             S2_ARPROT;
     `endif
     wire                      S2_ARVALID;
     wire                      S2_ARREADY;
     `ifdef AMBA_AXI4
     wire   [ 3:0]             S2_ARQOS;
     wire   [ 3:0]             S2_ARREGION;
     `endif
     `ifdef AMBA_AXI_ARUSER
     wire   [top_pkg::WIDTH_ARUSER-1:0] S2_ARUSER;
     `endif
     wire   [top_pkg::WIDTH_SID-1:0]    S2_RID;
     wire   [top_pkg::AXI_DATA_WIDTH-1:0]     S2_RDATA;
     wire   [ 1:0]             S2_RRESP;
     wire                      S2_RLAST;
     wire                      S2_RVALID;
     wire                      S2_RREADY;
     `ifdef AMBA_AXI_RUSER
     wire   [top_pkg::WIDTH_RUSER-1:0]  S2_RUSER;
     `endif
   
   initial begin
      force M0_MID = 0;
      force M1_MID = 1;
   end
    
    // dut
    amba_axi_m2s3 #(
        .WIDTH_AD(top_pkg::AXI_ADDR_WIDTH)
      , .WIDTH_DA(top_pkg::AXI_DATA_WIDTH)
      , .WIDTH_ID(8)
    ) dut_inst 
    (
          .ARESETn(ARESETn)
        , .ACLK(ACLK)
     //--------------------------------------------------------------
        , .M0_MID(M0_MID)
        , .M0_AWID(M0_AWID)
        , .M0_AWADDR(M0_AWADDR)
     `ifdef AMBA_AXI4
        , .M0_AWLEN(M0_AWLEN)
        , .M0_AWLOCK(M0_AWLOCK)
     `else
        , .M0_AWLEN(M0_AWLEN)
        , .M0_AWLOCK(M0_AWLOCK)
     `endif
        , .M0_AWSIZE(M0_AWSIZE)
        , .M0_AWBURST(M0_AWBURST)
     `ifdef  AMBA_AXI_CACHE
        , .M0_AWCACHE(M0_AWCACHE)
     `endif
     `ifdef AMBA_AXI_PROT
        , .M0_AWPROT(M0_AWPROT)
     `endif
        , .M0_AWVALID(M0_AWVALID)
        , .M0_AWREADY(M0_AWREADY)
     `ifdef AMBA_AXI4
        , .M0_AWQOS(M0_AWQOS)
        , .M0_AWREGION(M0_AWREGION)
     `endif
     `ifdef AMBA_AXI_AWUSER
        , .M0_AWUSER(M0_AWUSER)
     `endif
        , .M0_WID(M0_WID)
        , .M0_WDATA(M0_WDATA)
        , .M0_WSTRB(M0_WSTRB)
        , .M0_WLAST(M0_WLAST)
        , .M0_WVALID(M0_WVALID)
        , .M0_WREADY(M0_WREADY)
     `ifdef AMBA_AXI_WUSER
        , .M0_WUSER(M0_WUSER)
     `endif
        , .M0_BID(M0_BID)
        , .M0_BRESP(M0_BRESP)
        , .M0_BVALID(M0_BVALID)
        , .M0_BREADY(M0_BREADY)
     `ifdef AMBA_AXI_BUSER
        , .M0_BUSER(M0_BUSER)
     `endif
        , .M0_ARID(M0_ARID)
        , .M0_ARADDR(M0_ARADDR)
     `ifdef AMBA_AXI4
        , .M0_ARLEN(M0_ARLEN)
        , .M0_ARLOCK(M0_ARLOCK)
     `else
        , .M0_ARLEN(M0_ARLEN)
        , .M0_ARLOCK(M0_ARLOCK)
     `endif
        , .M0_ARSIZE(M0_ARSIZE)
        , .M0_ARBURST(M0_ARBURST)
     `ifdef  AMBA_AXI_CACHE
        , .M0_ARCACHE(M0_ARCACHE)
     `endif
     `ifdef AMBA_AXI_PROT
        , .M0_ARPROT(M0_ARPROT)
     `endif
        , .M0_ARVALID(M0_ARVALID)
        , .M0_ARREADY(M0_ARREADY)
     `ifdef AMBA_AXI4
        , .M0_ARQOS(M0_ARQOS)
        , .M0_ARREGION(M0_ARREGION)
     `endif
     `ifdef AMBA_AXI_ARUSER
        , .M0_ARUSER(M0_ARUSER)
     `endif
        , .M0_RID(M0_RID)
        , .M0_RDATA(M0_RDATA)
        , .M0_RRESP(M0_RRESP)
        , .M0_RLAST(M0_RLAST)
        , .M0_RVALID(M0_RVALID)
        , .M0_RREADY(M0_RREADY)
     `ifdef AMBA_AXI_RUSER
        , .M0_RUSER(M0_RUSER)
     `endif
     //--------------------------------------------------------------
        , .M1_MID(M1_MID)
        , .M1_AWID(M1_AWID)
        , .M1_AWADDR(M1_AWADDR)
     `ifdef AMBA_AXI4
        , .M1_AWLEN(M1_AWLEN)
        , .M1_AWLOCK(M1_AWLOCK)
     `else
        , .M1_AWLEN(M1_AWLEN)
        , .M1_AWLOCK(M1_AWLOCK)
     `endif
        , .M1_AWSIZE(M1_AWSIZE)
        , .M1_AWBURST(M1_AWBURST)
     `ifdef  AMBA_AXI_CACHE
        , .M1_AWCACHE(M1_AWCACHE)
     `endif
     `ifdef AMBA_AXI_PROT
        , .M1_AWPROT(M1_AWPROT)
     `endif
        , .M1_AWVALID(M1_AWVALID)
        , .M1_AWREADY(M1_AWREADY)
     `ifdef AMBA_AXI4
        , .M1_AWQOS(M1_AWQOS)
        , .M1_AWREGION(M1_AWREGION)
     `endif
     `ifdef AMBA_AXI_AWUSER
        , .M1_AWUSER(M1_AWUSER)
     `endif
        , .M1_WID(M1_WID)
        , .M1_WDATA(M1_WDATA)
        , .M1_WSTRB(M1_WSTRB)
        , .M1_WLAST(M1_WLAST)
        , .M1_WVALID(M1_WVALID)
        , .M1_WREADY(M1_WREADY)
     `ifdef AMBA_AXI_WUSER
        , .M1_WUSER(M1_WUSER)
     `endif
        , .M1_BID(M1_BID)
        , .M1_BRESP(M1_BRESP)
        , .M1_BVALID(M1_BVALID)
        , .M1_BREADY(M1_BREADY)
     `ifdef AMBA_AXI_BUSER
        , .M1_BUSER(M1_BUSER)
     `endif
        , .M1_ARID(M1_ARID)
        , .M1_ARADDR(M1_ARADDR)
     `ifdef AMBA_AXI4
        , .M1_ARLEN(M1_ARLEN)
        , .M1_ARLOCK(M1_ARLOCK)
     `else
        , .M1_ARLEN(M1_ARLEN)
        , .M1_ARLOCK(M1_ARLOCK)
     `endif
        , .M1_ARSIZE(M1_ARSIZE)
        , .M1_ARBURST(M1_ARBURST)
     `ifdef  AMBA_AXI_CACHE
        , .M1_ARCACHE(M1_ARCACHE)
     `endif
     `ifdef AMBA_AXI_PROT
        , .M1_ARPROT(M1_ARPROT)
     `endif
        , .M1_ARVALID(M1_ARVALID)
        , .M1_ARREADY(M1_ARREADY)
     `ifdef AMBA_AXI4
        , .M1_ARQOS(M1_ARQOS)
        , .M1_ARREGION(M1_ARREGION)
     `endif
     `ifdef AMBA_AXI_ARUSER
        , .M1_ARUSER(M1_ARUSER)
     `endif
        , .M1_RID(M1_RID)
        , .M1_RDATA(M1_RDATA)
        , .M1_RRESP(M1_RRESP)
        , .M1_RLAST(M1_RLAST)
        , .M1_RVALID(M1_RVALID)
        , .M1_RREADY(M1_RREADY)
     `ifdef AMBA_AXI_RUSER
        , .M1_RUSER(M1_RUSER)
     `endif
     //--------------------------------------------------------------
        , .S0_AWID(S0_AWID)
        , .S0_AWADDR(S0_AWADDR)
     `ifdef AMBA_AXI4
        , .S0_AWLEN(S0_AWLEN)
        , .S0_AWLOCK(S0_AWLOCK)
     `else
        , .S0_AWLEN(S0_AWLEN)
        , .S0_AWLOCK(S0_AWLOCK)
     `endif
        , .S0_AWSIZE(S0_AWSIZE)
        , .S0_AWBURST(S0_AWBURST)
     `ifdef  AMBA_AXI_CACHE
        , .S0_AWCACHE(S0_AWCACHE)
     `endif
     `ifdef AMBA_AXI_PROT
        , .S0_AWPROT(S0_AWPROT)
     `endif
        , .S0_AWVALID(S0_AWVALID)
        , .S0_AWREADY(S0_AWREADY)
     `ifdef AMBA_AXI4
        , .S0_AWQOS(S0_AWQOS)
        , .S0_AWREGION(S0_AWREGION)
     `endif
     `ifdef AMBA_AXI_AWUSER
        , .S0_AWUSER(S0_AWUSER)
     `endif
        , .S0_WID(S0_WID)
        , .S0_WDATA(S0_WDATA)
        , .S0_WSTRB(S0_WSTRB)
        , .S0_WLAST(S0_WLAST)
        , .S0_WVALID(S0_WVALID)
        , .S0_WREADY(S0_WREADY)
     `ifdef AMBA_AXI_WUSER
        , .S0_WUSER(S0_WUSER)
     `endif
        , .S0_BID(S0_BID)
        , .S0_BRESP(S0_BRESP)
        , .S0_BVALID(S0_BVALID)
        , .S0_BREADY(S0_BREADY)
     `ifdef AMBA_AXI_BUSER
        , .S0_BUSER(S0_BUSER)
     `endif
        , .S0_ARID(S0_ARID)
        , .S0_ARADDR(S0_ARADDR)
     `ifdef AMBA_AXI4
        , .S0_ARLEN(S0_ARLEN)
        , .S0_ARLOCK(S0_ARLOCK)
     `else
        , .S0_ARLEN(S0_ARLEN)
        , .S0_ARLOCK(S0_ARLOCK)
     `endif
        , .S0_ARSIZE(S0_ARSIZE)
        , .S0_ARBURST(S0_ARBURST)
     `ifdef  AMBA_AXI_CACHE
        , .S0_ARCACHE(S0_ARCACHE)
     `endif
     `ifdef AMBA_AXI_PROT
        , .S0_ARPROT(S0_ARPROT)
     `endif
        , .S0_ARVALID(S0_ARVALID)
        , .S0_ARREADY(S0_ARREADY)
     `ifdef AMBA_AXI4
        , .S0_ARQOS(S0_ARQOS)
        , .S0_ARREGION(S0_ARREGION)
     `endif
     `ifdef AMBA_AXI_ARUSER
        , .S0_ARUSER(S0_ARUSER)
     `endif
        , .S0_RID(S0_RID)
        , .S0_RDATA(S0_RDATA)
        , .S0_RRESP(S0_RRESP)
        , .S0_RLAST(S0_RLAST)
        , .S0_RVALID(S0_RVALID)
        , .S0_RREADY(S0_RREADY)
     `ifdef AMBA_AXI_RUSER
        , .S0_RUSER(S0_RUSER)
     `endif
     //--------------------------------------------------------------
        , .S1_AWID(S1_AWID)
        , .S1_AWADDR(S1_AWADDR)
     `ifdef AMBA_AXI4
        , .S1_AWLEN(S1_AWLEN)
        , .S1_AWLOCK(S1_AWLOCK)
     `else
        , .S1_AWLEN(S1_AWLEN)
        , .S1_AWLOCK(S1_AWLOCK)
     `endif
        , .S1_AWSIZE(S1_AWSIZE)
        , .S1_AWBURST(S1_AWBURST)
     `ifdef  AMBA_AXI_CACHE
        , .S1_AWCACHE(S1_AWCACHE)
     `endif
     `ifdef AMBA_AXI_PROT
        , .S1_AWPROT(S1_AWPROT)
     `endif
        , .S1_AWVALID(S1_AWVALID)
        , .S1_AWREADY(S1_AWREADY)
     `ifdef AMBA_AXI4
        , .S1_AWQOS(S1_AWQOS)
        , .S1_AWREGION(S1_AWREGION)
     `endif
     `ifdef AMBA_AXI_AWUSER
        , .S1_AWUSER(S1_AWUSER)
     `endif
        , .S1_WID(S1_WID)
        , .S1_WDATA(S1_WDATA)
        , .S1_WSTRB(S1_WSTRB)
        , .S1_WLAST(S1_WLAST)
        , .S1_WVALID(S1_WVALID)
        , .S1_WREADY(S1_WREADY)
     `ifdef AMBA_AXI_WUSER
        , .S1_WUSER(S1_WUSER)
     `endif
        , .S1_BID(S1_BID)
        , .S1_BRESP(S1_BRESP)
        , .S1_BVALID(S1_BVALID)
        , .S1_BREADY(S1_BREADY)
     `ifdef AMBA_AXI_BUSER
        , .S1_BUSER(S1_BUSER)
     `endif
        , .S1_ARID(S1_ARID)
        , .S1_ARADDR(S1_ARADDR)
     `ifdef AMBA_AXI4
        , .S1_ARLEN(S1_ARLEN)
        , .S1_ARLOCK(S1_ARLOCK)
     `else
        , .S1_ARLEN(S1_ARLEN)
        , .S1_ARLOCK(S1_ARLOCK)
     `endif
        , .S1_ARSIZE(S1_ARSIZE)
        , .S1_ARBURST(S1_ARBURST)
     `ifdef  AMBA_AXI_CACHE
        , .S1_ARCACHE(S1_ARCACHE)
     `endif
     `ifdef AMBA_AXI_PROT
        , .S1_ARPROT(S1_ARPROT)
     `endif
        , .S1_ARVALID(S1_ARVALID)
        , .S1_ARREADY(S1_ARREADY)
     `ifdef AMBA_AXI4
        , .S1_ARQOS(S1_ARQOS)
        , .S1_ARREGION(S1_ARREGION)
     `endif
     `ifdef AMBA_AXI_ARUSER
        , .S1_ARUSER(S1_ARUSER)
     `endif
        , .S1_RID(S1_RID)
        , .S1_RDATA(S1_RDATA)
        , .S1_RRESP(S1_RRESP)
        , .S1_RLAST(S1_RLAST)
        , .S1_RVALID(S1_RVALID)
        , .S1_RREADY(S1_RREADY)
     `ifdef AMBA_AXI_RUSER
        , .S1_RUSER(S1_RUSER)
     `endif
     //--------------------------------------------------------------
        , .S2_AWID(S2_AWID)
        , .S2_AWADDR(S2_AWADDR)
     `ifdef AMBA_AXI4
        , .S2_AWLEN(S2_AWLEN)
        , .S2_AWLOCK(S2_AWLOCK)
     `else
        , .S2_AWLEN(S2_AWLEN)
        , .S2_AWLOCK(S2_AWLOCK)
     `endif
        , .S2_AWSIZE(S2_AWSIZE)
        , .S2_AWBURST(S2_AWBURST)
     `ifdef  AMBA_AXI_CACHE
        , .S2_AWCACHE(S2_AWCACHE)
     `endif
     `ifdef AMBA_AXI_PROT
        , .S2_AWPROT(S2_AWPROT)
     `endif
        , .S2_AWVALID(S2_AWVALID)
        , .S2_AWREADY(S2_AWREADY)
     `ifdef AMBA_AXI4
        , .S2_AWQOS(S2_AWQOS)
        , .S2_AWREGION(S2_AWREGION)
     `endif
     `ifdef AMBA_AXI_AWUSER
        , .S2_AWUSER(S2_AWUSER)
     `endif
        , .S2_WID(S2_WID)
        , .S2_WDATA(S2_WDATA)
        , .S2_WSTRB(S2_WSTRB)
        , .S2_WLAST(S2_WLAST)
        , .S2_WVALID(S2_WVALID)
        , .S2_WREADY(S2_WREADY)
     `ifdef AMBA_AXI_WUSER
        , .S2_WUSER(S2_WUSER)
     `endif
        , .S2_BID(S2_BID)
        , .S2_BRESP(S2_BRESP)
        , .S2_BVALID(S2_BVALID)
        , .S2_BREADY(S2_BREADY)
     `ifdef AMBA_AXI_BUSER
        , .S2_BUSER(S2_BUSER)
     `endif
        , .S2_ARID(S2_ARID)
        , .S2_ARADDR(S2_ARADDR)
     `ifdef AMBA_AXI4
        , .S2_ARLEN(S2_ARLEN)
        , .S2_ARLOCK(S2_ARLOCK)
     `else
        , .S2_ARLEN(S2_ARLEN)
        , .S2_ARLOCK(S2_ARLOCK)
     `endif
        , .S2_ARSIZE(S2_ARSIZE)
        , .S2_ARBURST(S2_ARBURST)
     `ifdef  AMBA_AXI_CACHE
        , .S2_ARCACHE(S2_ARCACHE)
     `endif
     `ifdef AMBA_AXI_PROT
        , .S2_ARPROT(S2_ARPROT)
     `endif
        , .S2_ARVALID(S2_ARVALID)
        , .S2_ARREADY(S2_ARREADY)
     `ifdef AMBA_AXI4
        , .S2_ARQOS(S2_ARQOS)
        , .S2_ARREGION(S2_ARREGION)
     `endif
     `ifdef AMBA_AXI_ARUSER
        , .S2_ARUSER(S2_ARUSER)
     `endif
        , .S2_RID(S2_RID)
        , .S2_RDATA(S2_RDATA)
        , .S2_RRESP(S2_RRESP)
        , .S2_RLAST(S2_RLAST)
        , .S2_RVALID(S2_RVALID)
        , .S2_RREADY(S2_RREADY)
     `ifdef AMBA_AXI_RUSER
        , .S2_RUSER(S2_RUSER)
     `endif
    );