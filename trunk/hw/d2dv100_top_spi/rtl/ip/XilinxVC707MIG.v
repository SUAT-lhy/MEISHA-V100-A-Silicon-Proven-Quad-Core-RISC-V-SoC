module XilinxVC707MIG( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456351.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456352.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456353.4]
  output        auto_buffer_in_a_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  input         auto_buffer_in_a_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  input  [2:0]  auto_buffer_in_a_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  input  [2:0]  auto_buffer_in_a_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  input  [2:0]  auto_buffer_in_a_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  input  [5:0]  auto_buffer_in_a_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  input  [31:0] auto_buffer_in_a_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  input  [7:0]  auto_buffer_in_a_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  input  [63:0] auto_buffer_in_a_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  input         auto_buffer_in_a_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  input         auto_buffer_in_d_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  output        auto_buffer_in_d_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  output [2:0]  auto_buffer_in_d_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  output [1:0]  auto_buffer_in_d_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  output [2:0]  auto_buffer_in_d_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  output [5:0]  auto_buffer_in_d_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  output        auto_buffer_in_d_bits_sink, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  output        auto_buffer_in_d_bits_denied, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  output [63:0] auto_buffer_in_d_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  output        auto_buffer_in_d_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456354.4]
  output [13:0] io_port_ddr3_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output [2:0]  io_port_ddr3_ba, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output        io_port_ddr3_ras_n, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output        io_port_ddr3_cas_n, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output        io_port_ddr3_we_n, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output        io_port_ddr3_reset_n, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output        io_port_ddr3_ck_p, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output        io_port_ddr3_ck_n, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output        io_port_ddr3_cke, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output        io_port_ddr3_cs_n, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output [7:0]  io_port_ddr3_dm, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output        io_port_ddr3_odt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  inout  [63:0] io_port_ddr3_dq, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  inout  [7:0]  io_port_ddr3_dqs_n, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  inout  [7:0]  io_port_ddr3_dqs_p, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  input         io_port_sys_clk_i, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output        io_port_ui_clk, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output        io_port_ui_clk_sync_rst, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  output        io_port_mmcm_locked, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  input         io_port_aresetn, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
  input         io_port_sys_rst // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@456355.4]
);

wire [31:0] auto_buffer_in_d_bits_address;
wire [7:0] auto_buffer_in_d_bits_mask;

SRAM_CTRL U_SRAM_CTRL ( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256257.2]
  .clock(clock) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256258.4]
  ,.reset(reset) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256259.4]
  ,.io_enq_ready(auto_buffer_in_a_ready) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_enq_valid(auto_buffer_in_a_valid) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_enq_bits_opcode(auto_buffer_in_a_bits_opcode) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_enq_bits_param(auto_buffer_in_a_bits_param) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_enq_bits_size(auto_buffer_in_a_bits_size) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_enq_bits_source(auto_buffer_in_a_bits_source) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_enq_bits_address(auto_buffer_in_a_bits_address) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_enq_bits_mask(auto_buffer_in_a_bits_mask) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_enq_bits_data(auto_buffer_in_a_bits_data) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_enq_bits_corrupt(auto_buffer_in_a_bits_corrupt) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_deq_ready(auto_buffer_in_d_ready) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_deq_valid(auto_buffer_in_d_valid) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_deq_bits_opcode(auto_buffer_in_d_bits_opcode) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_deq_bits_param(auto_buffer_in_d_bits_param) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_deq_bits_size(auto_buffer_in_d_bits_size) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_deq_bits_source(auto_buffer_in_d_bits_source) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_deq_bits_address(auto_buffer_in_d_bits_address) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_deq_bits_mask(auto_buffer_in_d_bits_mask) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_deq_bits_data(auto_buffer_in_d_bits_data) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
  ,.io_deq_bits_corrupt(auto_buffer_in_d_bits_corrupt) // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@256260.4]
);


assign auto_buffer_in_d_bits_address = 'd0;
assign auto_buffer_in_d_bits_mask = 'd0;
assign auto_buffer_in_d_bits_denied = 'd0;
assign auto_buffer_in_d_bits_sink = 'd0;

assign io_port_ddr3_addr = 14'd0;
assign io_port_ddr3_ba = 3'd0;
assign io_port_ddr3_ras_n = 1'b0;
assign io_port_ddr3_cas_n = 1'b0;
assign io_port_ddr3_we_n = 1'b0;
assign io_port_ddr3_reset_n = 1'b0;
assign io_port_ddr3_ck_p = 1'b0;
assign io_port_ddr3_ck_n = 1'b0;
assign io_port_ddr3_cke = 1'b0;
assign io_port_ddr3_cs_n = 1'b0;
assign io_port_ddr3_dm = 8'd0;
assign io_port_ddr3_odt = 1'd0;
assign io_port_ui_clk = 1'd0;
assign io_port_ui_clk_sync_rst = 1'd0;
assign io_port_mmcm_locked = 1'd1;


endmodule
