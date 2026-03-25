
module sdram_axi_pmem
      #(parameter 
                  WIDTH_ID    = 4 // ID width in bits
                , WIDTH_AD    = 32 // address width
                , WIDTH_DA    = 64 // data width
      )
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           axi_awvalid
    ,input  [ 31:0]  axi_awaddr
    ,input  [  3:0]  axi_awid
    ,input  [  2:0]  axi_awsize
    ,input  [  7:0]  axi_awlen
    ,input  [  1:0]  axi_awburst
    ,input           axi_wvalid
    ,input  [ WIDTH_DA-1:0]  axi_wdata
    ,input  [ WIDTH_DA/8-1:0]  axi_wstrb
    ,input           axi_wlast
    ,input           axi_bready
    ,input           axi_arvalid
    ,input  [ 31:0]  axi_araddr
    ,input  [  3:0]  axi_arid
    ,input  [  2:0]  axi_arsize
    ,input  [  7:0]  axi_arlen
    ,input  [  1:0]  axi_arburst
    ,input           axi_rready
    // Outputs
    ,output          axi_awready
    ,output          axi_wready
    ,output          axi_bvalid
    ,output [  1:0]  axi_bresp
    ,output [  3:0]  axi_bid
    ,output          axi_arready
    ,output          axi_rvalid
    ,output [ WIDTH_DA-1:0]  axi_rdata
    ,output [  1:0]  axi_rresp
    ,output [  3:0]  axi_rid
    ,output          axi_rlast

    ,input           ram_accept_i
    ,input           ram_ack_i
    ,input           ram_error_i
    ,input  [ 31:0]  ram_read_data_i

    ,output [  3:0]  ram_wr_o
    ,output          ram_rd_o
    //,output [  7:0]  ram_len_o unused
    ,output [ WIDTH_AD-1:0]  ram_addr_o
    ,output [ 31:0]  ram_write_data_o
);

  // unused signal
  wire [0:0] axi_awlock;
  wire [3:0] axi_awcache;
  wire [2:0] axi_awprot;
  wire [3:0] axi_awqos;
  wire [3:0] axi_awregion;
  wire [5:0] axi_awatop;
  wire [0:0] axi_awuser;
  
  wire [0:0] axi_wuser;
  wire [0:0] axi_buser;

  wire [0:0] axi_arlock;
  wire [3:0] axi_arcache;
  wire [2:0] axi_arprot;
  wire [3:0] axi_arqos;
  wire [3:0] axi_arregion;
  wire [5:0] axi_aratop;
  wire [0:0] axi_aruser;
  wire [0:0] axi_ruser;

  `__SIGNAL_TO_SIGNAL(assign, axi, _awlock, 1'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _awcache, 4'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _awprot, 3'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _awqos, 4'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _awregion, 4'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _awatop, 6'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _awuser, 1'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _wuser, 1'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _arlock, 1'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _arcache, 4'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _arprot, 3'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _arqos, 4'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _arregion, 4'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _aratop, 6'b0)
  `__SIGNAL_TO_SIGNAL(assign, axi, _aruser, 1'b0)

  typedef logic [WIDTH_ID-1:0] id_t                   ;
  typedef logic [WIDTH_AD-1:0] addr_t               ;
  typedef logic [32-1:0] mst_data_t  ;
  typedef logic [32/8-1:0] mst_strb_t;
  typedef logic [WIDTH_DA-1:0] slv_data_t  ;
  typedef logic [WIDTH_DA/8-1:0] slv_strb_t;
  typedef logic [1-1:0] user_t;
  `AXI_TYPEDEF_AW_CHAN_T(aw_chan_t, addr_t, id_t, user_t)
  `AXI_TYPEDEF_W_CHAN_T(mst_w_chan_t, mst_data_t, mst_strb_t, user_t)
  `AXI_TYPEDEF_W_CHAN_T(slv_w_chan_t, slv_data_t, slv_strb_t, user_t)
  `AXI_TYPEDEF_B_CHAN_T(b_chan_t, id_t, user_t)
  `AXI_TYPEDEF_AR_CHAN_T(ar_chan_t, addr_t, id_t, user_t)
  `AXI_TYPEDEF_R_CHAN_T(mst_r_chan_t, mst_data_t, id_t, user_t)
  `AXI_TYPEDEF_R_CHAN_T(slv_r_chan_t, slv_data_t, id_t, user_t)
  `AXI_TYPEDEF_REQ_T(mst_req_t, aw_chan_t, mst_w_chan_t, ar_chan_t)
  `AXI_TYPEDEF_RESP_T(mst_resp_t, b_chan_t, mst_r_chan_t)
  `AXI_TYPEDEF_REQ_T(slv_req_t, aw_chan_t, slv_w_chan_t, ar_chan_t)
  `AXI_TYPEDEF_RESP_T(slv_resp_t, b_chan_t, slv_r_chan_t)

  slv_req_t  slv_req_i;
  slv_resp_t slv_resp_o;
  mst_req_t  mst_req_o;
  mst_resp_t mst_resp_i;

  `__AXI_TO_AW(assign, slv_req_i, .aw., axi, _aw)
  assign slv_req_i.aw_valid = axi_awvalid;
  `__AXI_TO_W(assign, slv_req_i, .w., axi, _w)
  assign slv_req_i.w_valid = axi_wvalid;
  assign slv_req_i.b_ready = axi_bready;
  `__AXI_TO_AR(assign, slv_req_i, .ar., axi, _ar)
  assign slv_req_i.ar_valid = axi_arvalid;
  assign slv_req_i.r_ready = axi_rready;
  
  assign axi_awready = slv_resp_o.aw_ready;
  assign axi_arready = slv_resp_o.ar_ready;
  assign axi_wready = slv_resp_o.w_ready;
  assign axi_bvalid = slv_resp_o.b_valid;
  `__AXI_TO_B(assign, axi, _b, slv_resp_o, .b.)
  assign axi_bvalid = slv_resp_o.b_valid;
  `__AXI_TO_R(assign, axi, _r, slv_resp_o, .r.)
  assign axi_rvalid = slv_resp_o.r_valid;

   axi_dw_downsizer #(
      .AxiMaxReads        (16        ),
      .AxiSlvPortDataWidth(WIDTH_DA),
      .AxiMstPortDataWidth(32),
      .AxiAddrWidth       (WIDTH_AD       ),
      .AxiIdWidth         (WIDTH_ID         ),
      .aw_chan_t          (aw_chan_t          ),
      .mst_w_chan_t       (mst_w_chan_t       ),
      .slv_w_chan_t       (slv_w_chan_t       ),
      .b_chan_t           (b_chan_t           ),
      .ar_chan_t          (ar_chan_t          ),
      .mst_r_chan_t       (mst_r_chan_t       ),
      .slv_r_chan_t       (slv_r_chan_t       ),
      .axi_mst_req_t      (mst_req_t      ),
      .axi_mst_resp_t     (mst_resp_t     ),
      .axi_slv_req_t      (slv_req_t      ),
      .axi_slv_resp_t     (slv_resp_t     )
  ) i_axi_dw_downsizer (
      .clk_i     (clk_i     ),
      .rst_ni    (~rst_i    ),
      // Slave interface
      .slv_req_i (slv_req_i ),
      .slv_resp_o(slv_resp_o),
      // Master interface
      .mst_req_o (mst_req_o ),
      .mst_resp_i(mst_resp_i)
    );

  wire busy_o;
  wire mem_req_o;
  wire mem_we_o;
  wire [5:0] mem_atop_o;
  wire [3:0] mem_strb_o;


   axi_to_mem_interleaved #(
    .axi_req_t     ( mst_req_t      ),
    .axi_resp_t    ( mst_resp_t     ),
    .AddrWidth     ( WIDTH_AD ),
    .DataWidth     ( 32 ),
    .IdWidth       ( WIDTH_ID   ),
    .NumBanks      ( 1  ),
    .BufDepth      ( 16      ),
    .HideStrb      ( 0      ),
    .OutFifoDepth  ( 16 )
  ) i_axi_to_mem_interleaved (
    
    .clk_i          (clk_i     ),
    .rst_ni         (~rst_i    ),
    .test_i         (1'b0),
    .busy_o         (busy_o),
    .axi_req_i      (mst_req_o  ),
    .axi_resp_o     (mst_resp_i ),
    .mem_req_o      (mem_req_o),
    .mem_gnt_i      (ram_accept_i),
    .mem_addr_o     (ram_addr_o),
    .mem_wdata_o    (ram_write_data_o),
    .mem_strb_o     (mem_strb_o),
    .mem_atop_o     (mem_atop_o),
    .mem_we_o       (mem_we_o),
    .mem_rvalid_i   (ram_ack_i),
    .mem_rdata_i    (ram_read_data_i)
  );

  assign ram_rd_o = mem_req_o && (ram_wr_o == 4'h0);
  assign ram_wr_o = {4{mem_we_o}} && {4{mem_req_o}} && mem_strb_o ;



endmodule
