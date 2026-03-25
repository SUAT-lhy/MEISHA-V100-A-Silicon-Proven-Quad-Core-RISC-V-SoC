module AXI4IdIndexer_Param #(
    parameter AXI4_ADDRESS_WIDTH = 32,
    parameter AXI4_RDATA_WIDTH   = 64,
    parameter AXI4_WDATA_WIDTH   = 64,
    parameter AXI4_USER_WIDTH    = 1,
    parameter AXI4_ID_WIDTH      = 8
) ( 
  output        auto_in_awready,
  input         auto_in_awvalid,
  input  [AXI4_ID_WIDTH-1:0]  auto_in_awid,
  input  [31:0] auto_in_awaddr,
  input  [7:0]  auto_in_awlen,
  input  [2:0]  auto_in_awsize,
  input  [1:0]  auto_in_awburst,
  input  [3:0]  auto_in_awcache,
  input  [2:0]  auto_in_awprot,
  output        auto_in_wready,
  input         auto_in_wvalid,
  input  [63:0] auto_in_wdata,
  input  [7:0]  auto_in_wstrb,
  input         auto_in_wlast,
  input         auto_in_bready,
  output        auto_in_bvalid,
  output [AXI4_ID_WIDTH-1:0]  auto_in_bid,
  output [1:0]  auto_in_bresp,
  output        auto_in_arready,
  input         auto_in_arvalid,
  input  [AXI4_ID_WIDTH-1:0]  auto_in_arid,
  input  [31:0] auto_in_araddr,
  input  [7:0]  auto_in_arlen,
  input  [2:0]  auto_in_arsize,
  input  [1:0]  auto_in_arburst,
  input  [3:0]  auto_in_arcache,
  input  [2:0]  auto_in_arprot,
  input         auto_in_rready,
  output        auto_in_rvalid,
  output [AXI4_ID_WIDTH-1:0]  auto_in_rid,
  output [63:0] auto_in_rdata,
  output [1:0]  auto_in_rresp,
  output        auto_in_rlast,
  input         auto_out_awready,
  output        auto_out_awvalid,
  output        auto_out_awid,
  output [31:0] auto_out_awaddr,
  output [7:0]  auto_out_awlen,
  output [2:0]  auto_out_awsize,
  output [1:0]  auto_out_awburst,
  output [3:0]  auto_out_awcache,
  output [2:0]  auto_out_awprot,
  output [AXI4_ID_WIDTH-2:0]  auto_out_awecho_extra_id,
  input         auto_out_wready,
  output        auto_out_wvalid,
  output [63:0] auto_out_wdata,
  output [7:0]  auto_out_wstrb,
  output        auto_out_wlast,
  output        auto_out_bready,
  input         auto_out_bvalid,
  input         auto_out_bid,
  input  [1:0]  auto_out_bresp,
  input  [AXI4_ID_WIDTH-2:0]  auto_out_becho_extra_id,
  input         auto_out_arready,
  output        auto_out_arvalid,
  output        auto_out_arid,
  output [31:0] auto_out_araddr,
  output [7:0]  auto_out_arlen,
  output [2:0]  auto_out_arsize,
  output [1:0]  auto_out_arburst,
  output [3:0]  auto_out_arcache,
  output [2:0]  auto_out_arprot,
  output [AXI4_ID_WIDTH-2:0]  auto_out_arecho_extra_id,
  output        auto_out_rready,
  input         auto_out_rvalid,
  input         auto_out_rid,
  input  [63:0] auto_out_rdata,
  input  [1:0]  auto_out_rresp,
  input  [AXI4_ID_WIDTH-2:0]  auto_out_recho_extra_id,
  input         auto_out_rlast
);
  assign auto_in_awready = auto_out_awready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_wready = auto_out_wready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_bvalid = auto_out_bvalid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_bid = {auto_out_becho_extra_id,auto_out_bid}; // @[Cat.scala 31:58]
  assign auto_in_bresp = auto_out_bresp; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_arready = auto_out_arready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_rvalid = auto_out_rvalid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_rid = {auto_out_recho_extra_id,auto_out_rid}; // @[Cat.scala 31:58]
  assign auto_in_rdata = auto_out_rdata; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_rresp = auto_out_rresp; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_rlast = auto_out_rlast; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_out_awvalid = auto_in_awvalid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_awid = auto_in_awid[0]; // @[Nodes.scala 1207:84 BundleMap.scala 247:19]
  assign auto_out_awaddr = auto_in_awaddr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_awlen = auto_in_awlen; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_awsize = auto_in_awsize; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_awburst = auto_in_awburst; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_awcache = auto_in_awcache; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_awprot = auto_in_awprot; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_awecho_extra_id = auto_in_awid[AXI4_ID_WIDTH-1:1]; // @[IdIndexer.scala 71:56]
  assign auto_out_wvalid = auto_in_wvalid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_wdata = auto_in_wdata; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_wstrb = auto_in_wstrb; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_wlast = auto_in_wlast; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_bready = auto_in_bready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_arvalid = auto_in_arvalid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_arid = auto_in_arid[0]; // @[Nodes.scala 1207:84 BundleMap.scala 247:19]
  assign auto_out_araddr = auto_in_araddr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_arlen = auto_in_arlen; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_arsize = auto_in_arsize; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_arburst = auto_in_arburst; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_arcache = auto_in_arcache; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_arprot = auto_in_arprot; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_arecho_extra_id = auto_in_arid[AXI4_ID_WIDTH-1:1]; // @[IdIndexer.scala 70:56]
  assign auto_out_rready = auto_in_rready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule