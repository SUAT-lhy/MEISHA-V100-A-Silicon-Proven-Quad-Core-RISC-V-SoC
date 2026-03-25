module VC707AXIToPCIeX1( 
  `ifdef USE_C2C_FOR_PCIE
    output        io_c2b_clk,
    output        io_c2b_rst,
    output        io_c2b_send,
    output [7:0]  io_c2b_data,
    input         io_b2c_clk,
    input         io_b2c_rst,
    input         io_b2c_send,
    input  [7:0]  io_b2c_data,
  `else
    input  logic                        spi_sclk,
    input  logic                        spi_cs,
    output logic  [1:0]                 spi_mode,
    input  logic                        spi_sdi0,
    input  logic                        spi_sdi1,
    input  logic                        spi_sdi2,
    input  logic                        spi_sdi3,
    output logic                        spi_sdo0,
    output logic                        spi_sdo1,
    output logic                        spi_sdo2,
    output logic                        spi_sdo3,
  `endif
  output        auto_int_out_0, 
  input         auto_master_out_aw_ready, 
  output        auto_master_out_aw_valid, 
  output [37:0] auto_master_out_aw_bits_addr, 
  output [7:0]  auto_master_out_aw_bits_len, 
  output [2:0]  auto_master_out_aw_bits_size, 
  output [1:0]  auto_master_out_aw_bits_burst, 
  input         auto_master_out_w_ready, 
  output        auto_master_out_w_valid, 
  output [63:0] auto_master_out_w_bits_data, 
  output [7:0]  auto_master_out_w_bits_strb, 
  output        auto_master_out_w_bits_last, 
  output        auto_master_out_b_ready, 
  input         auto_master_out_b_valid, 
  input  [1:0]  auto_master_out_b_bits_resp, 
  input         auto_master_out_ar_ready, 
  output        auto_master_out_ar_valid, 
  output [37:0] auto_master_out_ar_bits_addr, 
  output [7:0]  auto_master_out_ar_bits_len, 
  output [2:0]  auto_master_out_ar_bits_size, 
  output [1:0]  auto_master_out_ar_bits_burst, 
  output        auto_master_out_r_ready, 
  input         auto_master_out_r_valid, 
  input  [63:0] auto_master_out_r_bits_data, 
  input  [1:0]  auto_master_out_r_bits_resp, 
  input         auto_master_out_r_bits_last, 
  output        auto_control_in_aw_ready, 
  input         auto_control_in_aw_valid, 
  input  [37:0] auto_control_in_aw_bits_addr, 
  output        auto_control_in_w_ready, 
  input         auto_control_in_w_valid, 
  input  [31:0] auto_control_in_w_bits_data, 
  input  [3:0]  auto_control_in_w_bits_strb, 
  input         auto_control_in_b_ready, 
  output        auto_control_in_b_valid, 
  output [1:0]  auto_control_in_b_bits_resp, 
  output        auto_control_in_ar_ready, 
  input         auto_control_in_ar_valid, 
  input  [37:0] auto_control_in_ar_bits_addr, 
  input         auto_control_in_r_ready, 
  output        auto_control_in_r_valid, 
  output [31:0] auto_control_in_r_bits_data, 
  output [1:0]  auto_control_in_r_bits_resp, 
  output        auto_slave_in_aw_ready, 
  input         auto_slave_in_aw_valid, 
  input  [3:0]  auto_slave_in_aw_bits_id, 
  input  [30:0] auto_slave_in_aw_bits_addr, 
  input  [7:0]  auto_slave_in_aw_bits_len, 
  input  [2:0]  auto_slave_in_aw_bits_size, 
  input  [1:0]  auto_slave_in_aw_bits_burst, 
  output        auto_slave_in_w_ready, 
  input         auto_slave_in_w_valid, 
  input  [63:0] auto_slave_in_w_bits_data, 
  input  [7:0]  auto_slave_in_w_bits_strb, 
  input         auto_slave_in_w_bits_last, 
  input         auto_slave_in_b_ready, 
  output        auto_slave_in_b_valid, 
  output [3:0]  auto_slave_in_b_bits_id, 
  output [1:0]  auto_slave_in_b_bits_resp, 
  output        auto_slave_in_ar_ready, 
  input         auto_slave_in_ar_valid, 
  input  [3:0]  auto_slave_in_ar_bits_id, 
  input  [30:0] auto_slave_in_ar_bits_addr, 
  input  [7:0]  auto_slave_in_ar_bits_len, 
  input  [2:0]  auto_slave_in_ar_bits_size, 
  input  [1:0]  auto_slave_in_ar_bits_burst, 
  input         auto_slave_in_r_ready, 
  output        auto_slave_in_r_valid, 
  output [3:0]  auto_slave_in_r_bits_id, 
  output [63:0] auto_slave_in_r_bits_data, 
  output [1:0]  auto_slave_in_r_bits_resp, 
  output        auto_slave_in_r_bits_last, 
  output        io_port_pci_exp_txp, 
  output        io_port_pci_exp_txn, 
  input         io_port_pci_exp_rxp, 
  input         io_port_pci_exp_rxn, 
  input         io_port_axi_aresetn, 
  output        io_port_axi_aclk_out, 
  output        io_port_mmcm_lock, 
  input         io_REFCLK 
);
  wire  blackbox_s_axi_ctl_rready; 
  wire  blackbox_s_axi_ctl_rvalid; 
  wire [1:0] blackbox_s_axi_ctl_rresp; 
  wire [31:0] blackbox_s_axi_ctl_rdata; 
  wire  blackbox_s_axi_ctl_arready; 
  wire  blackbox_s_axi_ctl_arvalid; 
  wire [31:0] blackbox_s_axi_ctl_araddr; 
  wire  blackbox_s_axi_ctl_bready; 
  wire  blackbox_s_axi_ctl_bvalid; 
  wire [1:0] blackbox_s_axi_ctl_bresp; 
  wire  blackbox_s_axi_ctl_wready; 
  wire  blackbox_s_axi_ctl_wvalid; 
  wire [3:0] blackbox_s_axi_ctl_wstrb; 
  wire [31:0] blackbox_s_axi_ctl_wdata; 
  wire  blackbox_s_axi_ctl_awready; 
  wire  blackbox_s_axi_ctl_awvalid; 
  wire [31:0] blackbox_s_axi_ctl_awaddr; 
  wire  blackbox_m_axi_rvalid; 
  wire  blackbox_m_axi_rlast; 
  wire [1:0] blackbox_m_axi_rresp; 
  wire [63:0] blackbox_m_axi_rdata; 
  wire  blackbox_m_axi_rready; 
  wire  blackbox_m_axi_arready; 
  wire  blackbox_m_axi_arvalid; 
  wire [2:0] blackbox_m_axi_arprot; 
  wire [3:0] blackbox_m_axi_arcache; 
  wire  blackbox_m_axi_arlock; 
  wire [1:0] blackbox_m_axi_arburst; 
  wire [2:0] blackbox_m_axi_arsize; 
  wire [7:0] blackbox_m_axi_arlen; 
  wire [31:0] blackbox_m_axi_araddr; 
  wire  blackbox_m_axi_bvalid; 
  wire [1:0] blackbox_m_axi_bresp; 
  wire  blackbox_m_axi_bready; 
  wire  blackbox_m_axi_wready; 
  wire  blackbox_m_axi_wvalid; 
  wire  blackbox_m_axi_wlast; 
  wire [7:0] blackbox_m_axi_wstrb; 
  wire [63:0] blackbox_m_axi_wdata; 
  wire  blackbox_m_axi_awready; 
  wire  blackbox_m_axi_awvalid; 
  wire [2:0] blackbox_m_axi_awprot; 
  wire [3:0] blackbox_m_axi_awcache; 
  wire  blackbox_m_axi_awlock; 
  wire [1:0] blackbox_m_axi_awburst; 
  wire [2:0] blackbox_m_axi_awsize; 
  wire [7:0] blackbox_m_axi_awlen; 
  wire [31:0] blackbox_m_axi_awaddr; 
  wire  blackbox_s_axi_rvalid; 
  wire  blackbox_s_axi_rlast; 
  wire [1:0] blackbox_s_axi_rresp; 
  wire [63:0] blackbox_s_axi_rdata; 
  wire [3:0] blackbox_s_axi_rid; 
  wire  blackbox_s_axi_rready; 
  wire  blackbox_s_axi_arready; 
  wire  blackbox_s_axi_arvalid; 
  wire [1:0] blackbox_s_axi_arburst; 
  wire [2:0] blackbox_s_axi_arsize; 
  wire [7:0] blackbox_s_axi_arlen; 
  wire [3:0] blackbox_s_axi_arregion; 
  wire [31:0] blackbox_s_axi_araddr; 
  wire [3:0] blackbox_s_axi_arid; 
  wire  blackbox_s_axi_bvalid; 
  wire [1:0] blackbox_s_axi_bresp; 
  wire [3:0] blackbox_s_axi_bid; 
  wire  blackbox_s_axi_bready; 
  wire  blackbox_s_axi_wready; 
  wire  blackbox_s_axi_wvalid; 
  wire  blackbox_s_axi_wlast; 
  wire [7:0] blackbox_s_axi_wstrb; 
  wire [63:0] blackbox_s_axi_wdata; 
  wire  blackbox_s_axi_awready; 
  wire  blackbox_s_axi_awvalid; 
  wire [1:0] blackbox_s_axi_awburst; 
  wire [2:0] blackbox_s_axi_awsize; 
  wire [7:0] blackbox_s_axi_awlen; 
  wire [3:0] blackbox_s_axi_awregion; 
  wire [31:0] blackbox_s_axi_awaddr; 
  wire [3:0] blackbox_s_axi_awid; 
  wire  blackbox_interrupt_out; 
  wire [2:0] blackbox_MSI_Vector_Width; 
  wire [4:0] blackbox_MSI_Vector_Num; 
  wire  blackbox_MSI_enable; 
  wire  blackbox_INTX_MSI_Grant; 
  wire  blackbox_INTX_MSI_Request; 
  wire  blackbox_REFCLK; 
  wire  blackbox_mmcm_lock; 
  wire  blackbox_axi_ctl_aclk_out; 
  wire  blackbox_axi_aclk_out; 
  wire  blackbox_axi_aresetn; 
  wire  blackbox_pci_exp_rxn; 
  wire  blackbox_pci_exp_rxp; 
  wire  blackbox_pci_exp_txn; 
  wire  blackbox_pci_exp_txp; 
  vc707axi_to_pcie_x1 blackbox ( 
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
    .spi_mode(spi_mode),
    .spi_sdi0(spi_sdi0),
    .spi_sdi1(spi_sdi1),
    .spi_sdi2(spi_sdi2),
    .spi_sdi3(spi_sdi3),
    .spi_sdo0(spi_sdo0),
    .spi_sdo1(spi_sdo1),
    .spi_sdo2(spi_sdo2),
    .spi_sdo3(spi_sdo3),
    `endif
    .s_axi_ctl_rready(blackbox_s_axi_ctl_rready),
    .s_axi_ctl_rvalid(blackbox_s_axi_ctl_rvalid),
    .s_axi_ctl_rresp(blackbox_s_axi_ctl_rresp),
    .s_axi_ctl_rdata(blackbox_s_axi_ctl_rdata),
    .s_axi_ctl_arready(blackbox_s_axi_ctl_arready),
    .s_axi_ctl_arvalid(blackbox_s_axi_ctl_arvalid),
    .s_axi_ctl_araddr(blackbox_s_axi_ctl_araddr),
    .s_axi_ctl_bready(blackbox_s_axi_ctl_bready),
    .s_axi_ctl_bvalid(blackbox_s_axi_ctl_bvalid),
    .s_axi_ctl_bresp(blackbox_s_axi_ctl_bresp),
    .s_axi_ctl_wready(blackbox_s_axi_ctl_wready),
    .s_axi_ctl_wvalid(blackbox_s_axi_ctl_wvalid),
    .s_axi_ctl_wstrb(blackbox_s_axi_ctl_wstrb),
    .s_axi_ctl_wdata(blackbox_s_axi_ctl_wdata),
    .s_axi_ctl_awready(blackbox_s_axi_ctl_awready),
    .s_axi_ctl_awvalid(blackbox_s_axi_ctl_awvalid),
    .s_axi_ctl_awaddr(blackbox_s_axi_ctl_awaddr),
    .m_axi_rvalid(blackbox_m_axi_rvalid),
    .m_axi_rlast(blackbox_m_axi_rlast),
    .m_axi_rresp(blackbox_m_axi_rresp),
    .m_axi_rdata(blackbox_m_axi_rdata),
    .m_axi_rready(blackbox_m_axi_rready),
    .m_axi_arready(blackbox_m_axi_arready),
    .m_axi_arvalid(blackbox_m_axi_arvalid),
    .m_axi_arprot(blackbox_m_axi_arprot),
    .m_axi_arcache(blackbox_m_axi_arcache),
    .m_axi_arlock(blackbox_m_axi_arlock),
    .m_axi_arburst(blackbox_m_axi_arburst),
    .m_axi_arsize(blackbox_m_axi_arsize),
    .m_axi_arlen(blackbox_m_axi_arlen),
    .m_axi_araddr(blackbox_m_axi_araddr),
    .m_axi_bvalid(blackbox_m_axi_bvalid),
    .m_axi_bresp(blackbox_m_axi_bresp),
    .m_axi_bready(blackbox_m_axi_bready),
    .m_axi_wready(blackbox_m_axi_wready),
    .m_axi_wvalid(blackbox_m_axi_wvalid),
    .m_axi_wlast(blackbox_m_axi_wlast),
    .m_axi_wstrb(blackbox_m_axi_wstrb),
    .m_axi_wdata(blackbox_m_axi_wdata),
    .m_axi_awready(blackbox_m_axi_awready),
    .m_axi_awvalid(blackbox_m_axi_awvalid),
    .m_axi_awprot(blackbox_m_axi_awprot),
    .m_axi_awcache(blackbox_m_axi_awcache),
    .m_axi_awlock(blackbox_m_axi_awlock),
    .m_axi_awburst(blackbox_m_axi_awburst),
    .m_axi_awsize(blackbox_m_axi_awsize),
    .m_axi_awlen(blackbox_m_axi_awlen),
    .m_axi_awaddr(blackbox_m_axi_awaddr),
    .s_axi_rvalid(blackbox_s_axi_rvalid),
    .s_axi_rlast(blackbox_s_axi_rlast),
    .s_axi_rresp(blackbox_s_axi_rresp),
    .s_axi_rdata(blackbox_s_axi_rdata),
    .s_axi_rid(blackbox_s_axi_rid),
    .s_axi_rready(blackbox_s_axi_rready),
    .s_axi_arready(blackbox_s_axi_arready),
    .s_axi_arvalid(blackbox_s_axi_arvalid),
    .s_axi_arburst(blackbox_s_axi_arburst),
    .s_axi_arsize(blackbox_s_axi_arsize),
    .s_axi_arlen(blackbox_s_axi_arlen),
    .s_axi_arregion(blackbox_s_axi_arregion),
    .s_axi_araddr(blackbox_s_axi_araddr),
    .s_axi_arid(blackbox_s_axi_arid),
    .s_axi_bvalid(blackbox_s_axi_bvalid),
    .s_axi_bresp(blackbox_s_axi_bresp),
    .s_axi_bid(blackbox_s_axi_bid),
    .s_axi_bready(blackbox_s_axi_bready),
    .s_axi_wready(blackbox_s_axi_wready),
    .s_axi_wvalid(blackbox_s_axi_wvalid),
    .s_axi_wlast(blackbox_s_axi_wlast),
    .s_axi_wstrb(blackbox_s_axi_wstrb),
    .s_axi_wdata(blackbox_s_axi_wdata),
    .s_axi_awready(blackbox_s_axi_awready),
    .s_axi_awvalid(blackbox_s_axi_awvalid),
    .s_axi_awburst(blackbox_s_axi_awburst),
    .s_axi_awsize(blackbox_s_axi_awsize),
    .s_axi_awlen(blackbox_s_axi_awlen),
    .s_axi_awregion(blackbox_s_axi_awregion),
    .s_axi_awaddr(blackbox_s_axi_awaddr),
    .s_axi_awid(blackbox_s_axi_awid),
    .interrupt_out(blackbox_interrupt_out),
    .MSI_Vector_Width(blackbox_MSI_Vector_Width),
    .MSI_Vector_Num(blackbox_MSI_Vector_Num),
    .MSI_enable(blackbox_MSI_enable),
    .INTX_MSI_Grant(blackbox_INTX_MSI_Grant),
    .INTX_MSI_Request(blackbox_INTX_MSI_Request),
    .REFCLK(blackbox_REFCLK),
    .mmcm_lock(blackbox_mmcm_lock),
    .axi_ctl_aclk_out(blackbox_axi_ctl_aclk_out),
    .axi_aclk_out(blackbox_axi_aclk_out),
    .axi_aresetn(blackbox_axi_aresetn),
    .pci_exp_rxn(blackbox_pci_exp_rxn),
    .pci_exp_rxp(blackbox_pci_exp_rxp),
    .pci_exp_txn(blackbox_pci_exp_txn),
    .pci_exp_txp(blackbox_pci_exp_txp)
  );
  assign auto_int_out_0 = blackbox_interrupt_out; 
  assign auto_master_out_aw_valid = blackbox_m_axi_awvalid; 
  assign auto_master_out_aw_bits_addr = {{6'd0}, blackbox_m_axi_awaddr}; 
  assign auto_master_out_aw_bits_len = blackbox_m_axi_awlen; 
  assign auto_master_out_aw_bits_size = blackbox_m_axi_awsize; 
  assign auto_master_out_aw_bits_burst = blackbox_m_axi_awburst; 
  assign auto_master_out_w_valid = blackbox_m_axi_wvalid; 
  assign auto_master_out_w_bits_data = blackbox_m_axi_wdata; 
  assign auto_master_out_w_bits_strb = blackbox_m_axi_wstrb; 
  assign auto_master_out_w_bits_last = blackbox_m_axi_wlast; 
  assign auto_master_out_b_ready = blackbox_m_axi_bready; 
  assign auto_master_out_ar_valid = blackbox_m_axi_arvalid; 
  assign auto_master_out_ar_bits_addr = {{6'd0}, blackbox_m_axi_araddr}; 
  assign auto_master_out_ar_bits_len = blackbox_m_axi_arlen; 
  assign auto_master_out_ar_bits_size = blackbox_m_axi_arsize; 
  assign auto_master_out_ar_bits_burst = blackbox_m_axi_arburst; 
  assign auto_master_out_r_ready = blackbox_m_axi_rready; 
  assign auto_control_in_aw_ready = blackbox_s_axi_ctl_awready; 
  assign auto_control_in_w_ready = blackbox_s_axi_ctl_wready; 
  assign auto_control_in_b_valid = blackbox_s_axi_ctl_bvalid; 
  assign auto_control_in_b_bits_resp = blackbox_s_axi_ctl_bresp; 
  assign auto_control_in_ar_ready = blackbox_s_axi_ctl_arready; 
  assign auto_control_in_r_valid = blackbox_s_axi_ctl_rvalid; 
  assign auto_control_in_r_bits_data = blackbox_s_axi_ctl_rdata; 
  assign auto_control_in_r_bits_resp = blackbox_s_axi_ctl_rresp; 
  assign auto_slave_in_aw_ready = blackbox_s_axi_awready; 
  assign auto_slave_in_w_ready = blackbox_s_axi_wready; 
  assign auto_slave_in_b_valid = blackbox_s_axi_bvalid; 
  assign auto_slave_in_b_bits_id = blackbox_s_axi_bid; 
  assign auto_slave_in_b_bits_resp = blackbox_s_axi_bresp; 
  assign auto_slave_in_ar_ready = blackbox_s_axi_arready; 
  assign auto_slave_in_r_valid = blackbox_s_axi_rvalid; 
  assign auto_slave_in_r_bits_id = blackbox_s_axi_rid; 
  assign auto_slave_in_r_bits_data = blackbox_s_axi_rdata; 
  assign auto_slave_in_r_bits_resp = blackbox_s_axi_rresp; 
  assign auto_slave_in_r_bits_last = blackbox_s_axi_rlast; 
  assign io_port_pci_exp_txp = blackbox_pci_exp_txp; 
  assign io_port_pci_exp_txn = blackbox_pci_exp_txn; 
  assign io_port_axi_aclk_out = blackbox_axi_aclk_out; 
  assign io_port_mmcm_lock = blackbox_mmcm_lock; 
  assign blackbox_s_axi_ctl_rready = auto_control_in_r_ready; 
  assign blackbox_s_axi_ctl_arvalid = auto_control_in_ar_valid; 
  assign blackbox_s_axi_ctl_araddr = auto_control_in_ar_bits_addr[31:0]; 
  assign blackbox_s_axi_ctl_bready = auto_control_in_b_ready; 
  assign blackbox_s_axi_ctl_wvalid = auto_control_in_w_valid; 
  assign blackbox_s_axi_ctl_wstrb = auto_control_in_w_bits_strb; 
  assign blackbox_s_axi_ctl_wdata = auto_control_in_w_bits_data; 
  assign blackbox_s_axi_ctl_awvalid = auto_control_in_aw_valid; 
  assign blackbox_s_axi_ctl_awaddr = auto_control_in_aw_bits_addr[31:0]; 
  assign blackbox_m_axi_rvalid = auto_master_out_r_valid; 
  assign blackbox_m_axi_rlast = auto_master_out_r_bits_last; 
  assign blackbox_m_axi_rresp = auto_master_out_r_bits_resp; 
  assign blackbox_m_axi_rdata = auto_master_out_r_bits_data; 
  assign blackbox_m_axi_arready = auto_master_out_ar_ready; 
  assign blackbox_m_axi_bvalid = auto_master_out_b_valid; 
  assign blackbox_m_axi_bresp = auto_master_out_b_bits_resp; 
  assign blackbox_m_axi_wready = auto_master_out_w_ready; 
  assign blackbox_m_axi_awready = auto_master_out_aw_ready; 
  assign blackbox_s_axi_rready = auto_slave_in_r_ready; 
  assign blackbox_s_axi_arvalid = auto_slave_in_ar_valid; 
  assign blackbox_s_axi_arburst = auto_slave_in_ar_bits_burst; 
  assign blackbox_s_axi_arsize = auto_slave_in_ar_bits_size; 
  assign blackbox_s_axi_arlen = auto_slave_in_ar_bits_len; 
  assign blackbox_s_axi_arregion = 4'h0; 
  assign blackbox_s_axi_araddr = {{1'd0}, auto_slave_in_ar_bits_addr}; 
  assign blackbox_s_axi_arid = auto_slave_in_ar_bits_id; 
  assign blackbox_s_axi_bready = auto_slave_in_b_ready; 
  assign blackbox_s_axi_wvalid = auto_slave_in_w_valid; 
  assign blackbox_s_axi_wlast = auto_slave_in_w_bits_last; 
  assign blackbox_s_axi_wstrb = auto_slave_in_w_bits_strb; 
  assign blackbox_s_axi_wdata = auto_slave_in_w_bits_data; 
  assign blackbox_s_axi_awvalid = auto_slave_in_aw_valid; 
  assign blackbox_s_axi_awburst = auto_slave_in_aw_bits_burst; 
  assign blackbox_s_axi_awsize = auto_slave_in_aw_bits_size; 
  assign blackbox_s_axi_awlen = auto_slave_in_aw_bits_len; 
  assign blackbox_s_axi_awregion = 4'h0; 
  assign blackbox_s_axi_awaddr = {{1'd0}, auto_slave_in_aw_bits_addr}; 
  assign blackbox_s_axi_awid = auto_slave_in_aw_bits_id; 
  assign blackbox_MSI_Vector_Num = 5'h0;
  assign blackbox_INTX_MSI_Request = 1'h0;
  assign blackbox_REFCLK = io_REFCLK; 
  assign blackbox_axi_aresetn = io_port_axi_aresetn; 
  assign blackbox_pci_exp_rxn = io_port_pci_exp_rxn; 
  assign blackbox_pci_exp_rxp = io_port_pci_exp_rxp; 
endmodule
