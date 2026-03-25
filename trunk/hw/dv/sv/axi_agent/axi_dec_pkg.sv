
package axi_dec_pkg;

  typedef enum bit [1:0] {
    Fixed    = 2'h 0,
    Incr     = 2'h 1,
    Wrap     = 2'h 2
  } axi_burst_type_e;

  typedef enum bit [1:0] {
    Ok       = 2'h 0,
    Exok     = 2'h 1,
    Slverr   = 2'h 2,
    Decerr   = 2'h 3
  } axi_resp_e;

  typedef enum bit {
    Write    = 1'b0,
    Read     = 1'b1
  } axi_dir_e;

  typedef enum bit [3:0] {
    Length_1     = 4'h0,
    Length_2     = 4'h1,
    Length_3     = 4'h2,
    Length_4     = 4'h3,
    Length_5     = 4'h4,
    Length_6     = 4'h5,
    Length_7     = 4'h6,
    Length_8     = 4'h7,
    Length_9     = 4'h8,
    Length_10    = 4'h9,
    Length_11    = 4'ha,
    Length_12    = 4'hb,
    Length_13    = 4'hc,
    Length_14    = 4'hd,
    Length_15    = 4'he,
    Length_16    = 4'hf
  } axi_burst_length_e;

  typedef enum bit [2:0] {
    Byte_1     = 3'b000,
    Byte_2     = 3'b001,
    Byte_4     = 3'b010,
    Byte_8     = 3'b011,
    Byte_16    = 3'b100,
    Byte_32    = 3'b101,
    Byte_64    = 3'b110,
    Byte_128   = 3'b111
  } axi_burst_size_e;

// axi interface 
  typedef struct packed {

    bit                 [top_pkg::AXI_AWID_WIDTH-1:0]  awid;
    bit                 [top_pkg::AXI_ADDR_WIDTH-1:0]  awaddr;
    axi_burst_length_e  awlen;
    bit                 [1:0]  awlock;
    axi_burst_size_e  awsize;
    axi_burst_type_e  awburst;
    bit                 [3:0]  awcache;
    bit                 [1:0]  awprot;
    bit                        awvalid;
    bit                        awready;
    bit                 [3:0]  awqos;
    bit                 [3:0]  awregion;
    bit [top_pkg::AXI_AWUSER_WIDTH-1:0]  awuser;

    bit [top_pkg::AXI_AWID_WIDTH-1:0]  wid;
    bit [top_pkg::AXI_DATA_WIDTH-1:0]  wdata;
    bit [top_pkg::AXI_WSTRB_WIDTH-1:0] wstrb;
    bit                        wlast;
    bit                        wvalid;
    bit                        wready;
    bit [top_pkg::AXI_AWUSER_WIDTH-1:0]  wuser;

    bit [top_pkg::AXI_AWID_WIDTH-1:0]  bid;
    axi_resp_e  bresp;
    bit                        bvalid;
    bit                        bready;
    bit [top_pkg::AXI_BUSER_WIDTH-1:0] buser;

    bit                 [top_pkg::AXI_ARID_WIDTH-1:0]  arid;
    bit                 [top_pkg::AXI_ADDR_WIDTH-1:0]  araddr;
    axi_burst_length_e  arlen;
    bit                 [1:0]  arlock;
    axi_burst_size_e  arsize;
    axi_burst_type_e  arburst;
    bit                 [3:0]  arcache;
    bit                 [1:0]  arprot;
    bit                        arvalid;
    bit                        arready;
    bit                 [3:0]  arqos;
    bit                 [3:0]  arregion;
    bit                 [top_pkg::AXI_ARUSER_WIDTH-1:0]  aruser;

    bit [top_pkg::AXI_AWID_WIDTH-1:0]  rid;
    axi_resp_e  rresp;
    bit                        rvalid;
    bit                        rready;
    bit [top_pkg::AXI_BUSER_WIDTH-1:0] ruser;
    bit [top_pkg::AXI_DATA_WIDTH-1:0]  rdata;
  } axi_if_t;



endpackage

