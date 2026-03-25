`ifdef NV_nvdla_black_module__sv
`define NV_nvdla_black_module__sv
module NV_nvdla (
   dla_core_clk //|< i
  ,dla_csb_clk //|< i
  ,global_clk_ovr_on //|< i
  ,tmc2slcg_disable_clock_gating //|< i
  ,dla_reset_rstn //|< i
  ,direct_reset_ //|< i
  ,test_mode //|< i
  ,csb2nvdla_valid //|< i
  ,csb2nvdla_ready //|> o
  ,csb2nvdla_addr //|< i
  ,csb2nvdla_wdat //|< i
  ,csb2nvdla_write //|< i
  ,csb2nvdla_nposted //|< i
  ,nvdla2csb_valid //|> o
  ,nvdla2csb_data //|> o
  ,nvdla2csb_wr_complete //|> o
  ,nvdla_core2dbb_aw_awvalid //|> o
  ,nvdla_core2dbb_aw_awready //|< i
  ,nvdla_core2dbb_aw_awid //|> o
  ,nvdla_core2dbb_aw_awlen //|> o
  ,nvdla_core2dbb_aw_awaddr //|> o
  ,nvdla_core2dbb_w_wvalid //|> o
  ,nvdla_core2dbb_w_wready //|< i
  ,nvdla_core2dbb_w_wdata //|> o
  ,nvdla_core2dbb_w_wstrb //|> o
  ,nvdla_core2dbb_w_wlast //|> o
  ,nvdla_core2dbb_b_bvalid //|< i
  ,nvdla_core2dbb_b_bready //|> o
  ,nvdla_core2dbb_b_bid //|< i
  ,nvdla_core2dbb_ar_arvalid //|> o
  ,nvdla_core2dbb_ar_arready //|< i
  ,nvdla_core2dbb_ar_arid //|> o
  ,nvdla_core2dbb_ar_arlen //|> o
  ,nvdla_core2dbb_ar_araddr //|> o
  ,nvdla_core2dbb_r_rvalid //|< i
  ,nvdla_core2dbb_r_rready //|> o
  ,nvdla_core2dbb_r_rid //|< i
  ,nvdla_core2dbb_r_rlast //|< i
  ,nvdla_core2dbb_r_rdata //|< i
  ,dla_intr //|> o
  ,nvdla_pwrbus_ram_c_pd //|< i
  ,nvdla_pwrbus_ram_ma_pd //|< i *
  ,nvdla_pwrbus_ram_mb_pd //|< i *
  ,nvdla_pwrbus_ram_p_pd //|< i
  ,nvdla_pwrbus_ram_o_pd //|< i
  ,nvdla_pwrbus_ram_a_pd //|< i
  );
////////////////////////////////////////////////////////////////////////////////
input dla_core_clk;
input dla_csb_clk;
input global_clk_ovr_on;
input tmc2slcg_disable_clock_gating;
input dla_reset_rstn;
input direct_reset_;
input test_mode;
//csb
input csb2nvdla_valid;
output csb2nvdla_ready;
input [15:0] csb2nvdla_addr;
input [31:0] csb2nvdla_wdat;
input csb2nvdla_write;
input csb2nvdla_nposted;
output nvdla2csb_valid;
output [31:0] nvdla2csb_data;
output nvdla2csb_wr_complete;
///////////////
output nvdla_core2dbb_aw_awvalid;
input nvdla_core2dbb_aw_awready;
output [7:0] nvdla_core2dbb_aw_awid;
output [3:0] nvdla_core2dbb_aw_awlen;
output [32 -1:0] nvdla_core2dbb_aw_awaddr;
output nvdla_core2dbb_w_wvalid;
input nvdla_core2dbb_w_wready;
output [64 -1:0] nvdla_core2dbb_w_wdata;
output [64/8-1:0] nvdla_core2dbb_w_wstrb;
output nvdla_core2dbb_w_wlast;
output nvdla_core2dbb_ar_arvalid;
input nvdla_core2dbb_ar_arready;
output [7:0] nvdla_core2dbb_ar_arid;
output [3:0] nvdla_core2dbb_ar_arlen;
output [32 -1:0] nvdla_core2dbb_ar_araddr;
input nvdla_core2dbb_b_bvalid;
output nvdla_core2dbb_b_bready;
input [7:0] nvdla_core2dbb_b_bid;
input nvdla_core2dbb_r_rvalid;
output nvdla_core2dbb_r_rready;
input [7:0] nvdla_core2dbb_r_rid;
input nvdla_core2dbb_r_rlast;
input [64 -1:0] nvdla_core2dbb_r_rdata;
output dla_intr;
input [31:0] nvdla_pwrbus_ram_c_pd;
input [31:0] nvdla_pwrbus_ram_ma_pd;
input [31:0] nvdla_pwrbus_ram_mb_pd;
input [31:0] nvdla_pwrbus_ram_p_pd;
input [31:0] nvdla_pwrbus_ram_o_pd;
input [31:0] nvdla_pwrbus_ram_a_pd;




//csb
   assign csb2nvdla_ready = 0;
   assign nvdla2csb_valid = 0;
   assign nvdla2csb_data = 0;
   assign nvdla2csb_wr_complete = 0;
///////////////
   assign nvdla_core2dbb_aw_awvalid = 0;
   assign nvdla_core2dbb_aw_awid = 0;
   assign nvdla_core2dbb_aw_awlen = 0;
   assign nvdla_core2dbb_aw_awaddr = 0;
   assign nvdla_core2dbb_w_wvalid = 0;
   assign nvdla_core2dbb_w_wdata = 0;
   assign nvdla_core2dbb_w_wstrb = 0;
   assign nvdla_core2dbb_w_wlast = 0;
   assign nvdla_core2dbb_ar_arvalid = 0;
   assign nvdla_core2dbb_ar_arid = 0;
   assign nvdla_core2dbb_ar_arlen = 0;
   assign nvdla_core2dbb_ar_araddr = 0;
   assign nvdla_core2dbb_b_bready = 0;
   assign nvdla_core2dbb_r_rready = 0;
   assign dla_intr = 0;


endmodule // NV_nvdla
`endif