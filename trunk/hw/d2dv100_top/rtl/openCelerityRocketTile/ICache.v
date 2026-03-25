module ICache( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281026.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281027.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281028.4]
  input         auto_master_out_a_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281029.4]
  output        auto_master_out_a_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281029.4]
  output [37:0] auto_master_out_a_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281029.4]
  input         auto_master_out_d_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281029.4]
  input  [2:0]  auto_master_out_d_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281029.4]
  input  [2:0]  auto_master_out_d_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281029.4]
  input  [63:0] auto_master_out_d_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281029.4]
  input         auto_master_out_d_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281029.4]
  output        io_req_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281030.4]
  input         io_req_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281030.4]
  input  [38:0] io_req_bits_addr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281030.4]
  input  [37:0] io_s1_paddr, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281030.4]
  input         io_s1_kill, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281030.4]
  input         io_s2_kill, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281030.4]
  output        io_resp_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281030.4]
  output [31:0] io_resp_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281030.4]
  output        io_resp_bits_ae, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281030.4]
  input         io_invalidate // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281030.4]
);
  reg [26:0] tag_array_0 [0:63]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  reg [31:0] _RAND_0;
  wire [26:0] tag_array_0_tag_rdata_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire [5:0] tag_array_0_tag_rdata_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire [26:0] tag_array_0__T_256_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire [5:0] tag_array_0__T_256_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire  tag_array_0__T_256_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire  tag_array_0__T_256_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  reg [26:0] tag_array_1 [0:63]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  reg [31:0] _RAND_1;
  wire [26:0] tag_array_1_tag_rdata_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire [5:0] tag_array_1_tag_rdata_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire [26:0] tag_array_1__T_256_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire [5:0] tag_array_1__T_256_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire  tag_array_1__T_256_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire  tag_array_1__T_256_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  reg [26:0] tag_array_2 [0:63]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  reg [31:0] _RAND_2;
  wire [26:0] tag_array_2_tag_rdata_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire [5:0] tag_array_2_tag_rdata_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire [26:0] tag_array_2__T_256_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire [5:0] tag_array_2__T_256_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire  tag_array_2__T_256_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire  tag_array_2__T_256_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  reg [26:0] tag_array_3 [0:63]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  reg [31:0] _RAND_3;
  wire [26:0] tag_array_3_tag_rdata_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire [5:0] tag_array_3_tag_rdata_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire [26:0] tag_array_3__T_256_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire [5:0] tag_array_3__T_256_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire  tag_array_3__T_256_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  wire  tag_array_3__T_256_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  reg [31:0] data_arrays_0_0 [0:511]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  reg [31:0] _RAND_4;
  wire [31:0] data_arrays_0_0__T_513_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire [8:0] data_arrays_0_0__T_513_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire [31:0] data_arrays_0_0__T_495_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire [8:0] data_arrays_0_0__T_495_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire  data_arrays_0_0__T_495_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire  data_arrays_0_0__T_495_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  reg [31:0] data_arrays_0_1 [0:511]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  reg [31:0] _RAND_5;
  wire [31:0] data_arrays_0_1__T_513_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire [8:0] data_arrays_0_1__T_513_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire [31:0] data_arrays_0_1__T_495_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire [8:0] data_arrays_0_1__T_495_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire  data_arrays_0_1__T_495_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire  data_arrays_0_1__T_495_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  reg [31:0] data_arrays_0_2 [0:511]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  reg [31:0] _RAND_6;
  wire [31:0] data_arrays_0_2__T_513_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire [8:0] data_arrays_0_2__T_513_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire [31:0] data_arrays_0_2__T_495_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire [8:0] data_arrays_0_2__T_495_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire  data_arrays_0_2__T_495_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire  data_arrays_0_2__T_495_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  reg [31:0] data_arrays_0_3 [0:511]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  reg [31:0] _RAND_7;
  wire [31:0] data_arrays_0_3__T_513_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire [8:0] data_arrays_0_3__T_513_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire [31:0] data_arrays_0_3__T_495_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire [8:0] data_arrays_0_3__T_495_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire  data_arrays_0_3__T_495_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  wire  data_arrays_0_3__T_495_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  reg [31:0] data_arrays_1_0 [0:511]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  reg [31:0] _RAND_8;
  wire [31:0] data_arrays_1_0__T_583_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire [8:0] data_arrays_1_0__T_583_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire [31:0] data_arrays_1_0__T_565_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire [8:0] data_arrays_1_0__T_565_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire  data_arrays_1_0__T_565_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire  data_arrays_1_0__T_565_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  reg [31:0] data_arrays_1_1 [0:511]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  reg [31:0] _RAND_9;
  wire [31:0] data_arrays_1_1__T_583_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire [8:0] data_arrays_1_1__T_583_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire [31:0] data_arrays_1_1__T_565_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire [8:0] data_arrays_1_1__T_565_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire  data_arrays_1_1__T_565_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire  data_arrays_1_1__T_565_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  reg [31:0] data_arrays_1_2 [0:511]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  reg [31:0] _RAND_10;
  wire [31:0] data_arrays_1_2__T_583_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire [8:0] data_arrays_1_2__T_583_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire [31:0] data_arrays_1_2__T_565_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire [8:0] data_arrays_1_2__T_565_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire  data_arrays_1_2__T_565_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire  data_arrays_1_2__T_565_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  reg [31:0] data_arrays_1_3 [0:511]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  reg [31:0] _RAND_11;
  wire [31:0] data_arrays_1_3__T_583_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire [8:0] data_arrays_1_3__T_583_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire [31:0] data_arrays_1_3__T_565_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire [8:0] data_arrays_1_3__T_565_addr; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire  data_arrays_1_3__T_565_mask; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  wire  data_arrays_1_3__T_565_en; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  reg  s1_valid; // @[ICache.scala 136:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281046.4]
  reg [31:0] _RAND_12;
  reg [255:0] vb_array; // @[ICache.scala 195:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281189.4]
  reg [255:0] _RAND_13;
  wire [5:0] _T_308; // @[ICache.scala 216:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281217.4]
  wire [6:0] _T_322; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281231.4]
  wire [255:0] _T_323; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281232.4]
  wire  _T_324; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281233.4]
  wire [25:0] _T_328; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281237.4]
  wire [25:0] _T_309; // @[ICache.scala 217:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281218.4]
  wire  _T_329; // @[ICache.scala 225:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281238.4]
  wire  s1_tag_hit_0; // @[ICache.scala 225:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281239.4]
  wire [6:0] _T_350; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281262.4]
  wire [255:0] _T_351; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281263.4]
  wire  _T_352; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281264.4]
  wire [25:0] _T_356; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281268.4]
  wire  _T_357; // @[ICache.scala 225:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281269.4]
  wire  s1_tag_hit_1; // @[ICache.scala 225:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281270.4]
  wire  _T_141; // @[ICache.scala 138:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281049.4]
  wire [7:0] _T_378; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281293.4]
  wire [255:0] _T_379; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281294.4]
  wire  _T_380; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281295.4]
  wire [25:0] _T_384; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281299.4]
  wire  _T_385; // @[ICache.scala 225:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281300.4]
  wire  s1_tag_hit_2; // @[ICache.scala 225:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281301.4]
  wire  _T_142; // @[ICache.scala 138:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281050.4]
  wire [7:0] _T_406; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281324.4]
  wire [255:0] _T_407; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281325.4]
  wire  _T_408; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281326.4]
  wire [25:0] _T_412; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281330.4]
  wire  _T_413; // @[ICache.scala 225:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281331.4]
  wire  s1_tag_hit_3; // @[ICache.scala 225:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281332.4]
  wire  _T_145; // @[ICache.scala 140:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281054.4]
  wire  _T_146; // @[ICache.scala 140:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281055.4]
  reg  s2_valid; // @[ICache.scala 140:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281056.4]
  reg [31:0] _RAND_14;
  reg  s2_hit; // @[ICache.scala 141:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281058.4]
  reg [31:0] _RAND_15;
  reg  invalidated; // @[ICache.scala 143:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281060.4]
  reg [31:0] _RAND_16;
  reg  refill_valid; // @[ICache.scala 144:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281061.4]
  reg [31:0] _RAND_17;
  wire  _T_155; // @[ICache.scala 148:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281067.4]
  wire  _T_156; // @[ICache.scala 148:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281068.4]
  wire  _T_157; // @[ICache.scala 148:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281069.4]
  wire  s2_miss; // @[ICache.scala 148:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281070.4]
  reg  _T_160; // @[ICache.scala 150:45:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281073.4]
  reg [31:0] _RAND_18;
  wire  s2_request_refill; // @[ICache.scala 150:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281075.4]
  wire  refill_fire; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281063.4]
  wire  _T_158; // @[ICache.scala 149:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281071.4]
  wire  s1_can_request_refill; // @[ICache.scala 149:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281072.4]
  wire  _T_161; // @[ICache.scala 151:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281076.4]
  reg [37:0] refill_addr; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281077.4]
  reg [63:0] _RAND_19;
  wire [25:0] refill_tag; // @[ICache.scala 152:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281081.4]
  wire [5:0] refill_idx; // @[ICache.scala 153:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281082.4]
  wire  _T_164; // @[Edges.scala 106:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281084.4]
  wire  refill_one_beat; // @[ICache.scala 154:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281085.4]
  wire  s0_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281090.4]
  wire [13:0] _T_170; // @[package.scala 185:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281094.4]
  wire [6:0] _T_171; // @[package.scala 185:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281095.4]
  wire [6:0] _T_172; // @[package.scala 185:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281096.4]
  wire [3:0] _T_173; // @[Edges.scala 220:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281097.4]
  wire [3:0] _T_175; // @[Edges.scala 221:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281099.4]
  reg [3:0] _T_177; // @[Edges.scala 229:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281100.4]
  reg [31:0] _RAND_20;
  wire [4:0] _T_178; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281101.4]
  wire [4:0] _T_179; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281102.4]
  wire [3:0] _T_180; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281103.4]
  wire  _T_181; // @[Edges.scala 231:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281104.4]
  wire  _T_182; // @[Edges.scala 232:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281105.4]
  wire  _T_183; // @[Edges.scala 232:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281106.4]
  wire  _T_184; // @[Edges.scala 232:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281107.4]
  wire  d_done; // @[Edges.scala 233:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281108.4]
  wire [3:0] _T_185; // @[Edges.scala 234:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281109.4]
  wire [3:0] refill_cnt; // @[Edges.scala 234:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281110.4]
  wire  refill_done; // @[ICache.scala 162:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281115.4]
  reg [15:0] _T_189; // @[LFSR.scala 22:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281118.4]
  reg [31:0] _RAND_21;
  wire  _T_190; // @[LFSR.scala 23:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281120.6]
  wire  _T_191; // @[LFSR.scala 23:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281121.6]
  wire  _T_192; // @[LFSR.scala 23:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281122.6]
  wire  _T_193; // @[LFSR.scala 23:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281123.6]
  wire  _T_194; // @[LFSR.scala 23:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281124.6]
  wire  _T_195; // @[LFSR.scala 23:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281125.6]
  wire  _T_196; // @[LFSR.scala 23:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281126.6]
  wire [14:0] _T_197; // @[LFSR.scala 23:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281127.6]
  wire [15:0] _T_198; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281128.6]
  wire [1:0] repl_way; // @[ICache.scala 168:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281131.4]
  wire [7:0] _T_201; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281133.4]
  wire [5:0] _T_222; // @[ICache.scala 185:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281150.4]
  wire  _T_223; // @[ICache.scala 185:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281151.4]
  wire  _T_224; // @[ICache.scala 185:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281152.4]
  wire  _GEN_4; // @[ICache.scala 185:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281156.4]
  wire  _T_270; // @[ICache.scala 198:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281192.6]
  wire  _T_271; // @[ICache.scala 198:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281193.6]
  wire [255:0] _T_272; // @[ICache.scala 198:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281194.6]
  wire [255:0] _T_273; // @[ICache.scala 198:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281195.6]
  wire [255:0] _T_274; // @[ICache.scala 198:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281196.6]
  wire [255:0] _T_275; // @[ICache.scala 198:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281197.6]
  wire [255:0] _T_276; // @[ICache.scala 198:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281198.6]
  wire  _T_327; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281236.4]
  wire  s1_tl_error_0; // @[ICache.scala 227:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281244.4]
  wire  _T_355; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281267.4]
  wire  s1_tl_error_1; // @[ICache.scala 227:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281275.4]
  wire  _T_383; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281298.4]
  wire  s1_tl_error_2; // @[ICache.scala 227:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281306.4]
  wire  _T_411; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281329.4]
  wire  s1_tl_error_3; // @[ICache.scala 227:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281337.4]
  wire  _T_421; // @[ICache.scala 230:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281342.4]
  wire [1:0] _T_430; // @[Bitwise.scala 48:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281351.4]
  wire [1:0] _T_431; // @[Bitwise.scala 48:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281352.4]
  wire [2:0] _T_432; // @[Bitwise.scala 48:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281353.4]
  wire  _T_433; // @[ICache.scala 230:115:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281354.4]
  wire  _T_434; // @[ICache.scala 230:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281355.4]
  wire  _T_436; // @[ICache.scala 230:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281357.4]
  wire  _T_437; // @[ICache.scala 230:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281358.4]
  wire  _T_458; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281365.4]
  wire  _T_459; // @[ICache.scala 245:111:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281366.4]
  wire  _T_460; // @[ICache.scala 247:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281367.4]
  wire  _T_465; // @[ICache.scala 248:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281372.4]
  wire [8:0] _GEN_173; // @[ICache.scala 249:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281377.4]
  wire [8:0] _T_470; // @[ICache.scala 249:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281377.4]
  wire [8:0] _GEN_174; // @[ICache.scala 249:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281378.4]
  wire [8:0] _T_471; // @[ICache.scala 249:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281378.4]
  wire [8:0] _T_473; // @[ICache.scala 246:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281380.4]
  wire [8:0] _T_476; // @[ICache.scala 249:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281383.4]
  wire  _T_507; // @[ICache.scala 258:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281413.4]
  wire  _T_508; // @[ICache.scala 258:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281414.4]
  wire  _GEN_49; // @[ICache.scala 258:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281418.4]
  wire  _T_526; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281425.4]
  wire [31:0] _GEN_52; // @[ICache.scala 259:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281427.4]
  wire [31:0] _GEN_53; // @[ICache.scala 259:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281427.4]
  wire [31:0] _GEN_54; // @[ICache.scala 259:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281427.4]
  wire [31:0] _GEN_55; // @[ICache.scala 259:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281427.4]
  wire  _T_530; // @[ICache.scala 247:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281432.4]
  wire  _T_578; // @[ICache.scala 258:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281479.4]
  wire  _GEN_76; // @[ICache.scala 258:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281483.4]
  reg  s2_tag_hit_0; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281496.4]
  reg [31:0] _RAND_22;
  reg  s2_tag_hit_1; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281496.4]
  reg [31:0] _RAND_23;
  reg  s2_tag_hit_2; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281496.4]
  reg [31:0] _RAND_24;
  reg  s2_tag_hit_3; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281496.4]
  reg [31:0] _RAND_25;
  reg [31:0] s2_dout_0; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281516.4]
  reg [31:0] _RAND_26;
  reg [31:0] s2_dout_1; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281516.4]
  reg [31:0] _RAND_27;
  reg [31:0] s2_dout_2; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281516.4]
  reg [31:0] _RAND_28;
  reg [31:0] s2_dout_3; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281516.4]
  reg [31:0] _RAND_29;
  wire [31:0] _T_666; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281523.4]
  wire [31:0] _T_667; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281524.4]
  wire [31:0] _T_668; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281525.4]
  wire [31:0] _T_669; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281526.4]
  wire [31:0] _T_670; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281527.4]
  wire [31:0] _T_671; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281528.4]
  wire [1:0] _T_706; // @[ICache.scala 272:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281543.4]
  wire [1:0] _T_707; // @[ICache.scala 272:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281544.4]
  wire [3:0] _T_708; // @[ICache.scala 272:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281545.4]
  wire  _T_709; // @[ICache.scala 272:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281546.4]
  reg  s2_tl_error; // @[Reg.scala 11:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281547.4]
  reg [31:0] _RAND_30;
  wire [31:0] _T_723; // @[ICache.scala 381:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281579.4]
  wire [37:0] _GEN_177; // @[ICache.scala 381:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281580.4]
  wire  _T_854; // @[ICache.scala 418:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281726.4]
  reg [5:0] tag_array_0_tag_rdata_addr_pipe_0;
  reg [31:0] _RAND_31;
  reg [5:0] tag_array_1_tag_rdata_addr_pipe_0;
  reg [31:0] _RAND_32;
  reg [5:0] tag_array_2_tag_rdata_addr_pipe_0;
  reg [31:0] _RAND_33;
  reg [5:0] tag_array_3_tag_rdata_addr_pipe_0;
  reg [31:0] _RAND_34;
  reg [8:0] data_arrays_0_0__T_513_addr_pipe_0;
  reg [31:0] _RAND_35;
  reg [8:0] data_arrays_0_1__T_513_addr_pipe_0;
  reg [31:0] _RAND_36;
  reg [8:0] data_arrays_0_2__T_513_addr_pipe_0;
  reg [31:0] _RAND_37;
  reg [8:0] data_arrays_0_3__T_513_addr_pipe_0;
  reg [31:0] _RAND_38;
  reg [8:0] data_arrays_1_0__T_583_addr_pipe_0;
  reg [31:0] _RAND_39;
  reg [8:0] data_arrays_1_1__T_583_addr_pipe_0;
  reg [31:0] _RAND_40;
  reg [8:0] data_arrays_1_2__T_583_addr_pipe_0;
  reg [31:0] _RAND_41;
  reg [8:0] data_arrays_1_3__T_583_addr_pipe_0;
  reg [31:0] _RAND_42;
  assign tag_array_0_tag_rdata_addr = tag_array_0_tag_rdata_addr_pipe_0;
  assign tag_array_0_tag_rdata_data = tag_array_0[tag_array_0_tag_rdata_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  assign tag_array_0__T_256_data = {auto_master_out_d_bits_corrupt,refill_tag};
  assign tag_array_0__T_256_addr = refill_addr[11:6];
  assign tag_array_0__T_256_mask = repl_way == 2'h0;
  assign tag_array_0__T_256_en = refill_one_beat & d_done;
  assign tag_array_1_tag_rdata_addr = tag_array_1_tag_rdata_addr_pipe_0;
  assign tag_array_1_tag_rdata_data = tag_array_1[tag_array_1_tag_rdata_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  assign tag_array_1__T_256_data = {auto_master_out_d_bits_corrupt,refill_tag};
  assign tag_array_1__T_256_addr = refill_addr[11:6];
  assign tag_array_1__T_256_mask = repl_way == 2'h1;
  assign tag_array_1__T_256_en = refill_one_beat & d_done;
  assign tag_array_2_tag_rdata_addr = tag_array_2_tag_rdata_addr_pipe_0;
  assign tag_array_2_tag_rdata_data = tag_array_2[tag_array_2_tag_rdata_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  assign tag_array_2__T_256_data = {auto_master_out_d_bits_corrupt,refill_tag};
  assign tag_array_2__T_256_addr = refill_addr[11:6];
  assign tag_array_2__T_256_mask = repl_way == 2'h2;
  assign tag_array_2__T_256_en = refill_one_beat & d_done;
  assign tag_array_3_tag_rdata_addr = tag_array_3_tag_rdata_addr_pipe_0;
  assign tag_array_3_tag_rdata_data = tag_array_3[tag_array_3_tag_rdata_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
  assign tag_array_3__T_256_data = {auto_master_out_d_bits_corrupt,refill_tag};
  assign tag_array_3__T_256_addr = refill_addr[11:6];
  assign tag_array_3__T_256_mask = repl_way == 2'h3;
  assign tag_array_3__T_256_en = refill_one_beat & d_done;
  assign data_arrays_0_0__T_513_addr = data_arrays_0_0__T_513_addr_pipe_0;
  assign data_arrays_0_0__T_513_data = data_arrays_0_0[data_arrays_0_0__T_513_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  assign data_arrays_0_0__T_495_data = auto_master_out_d_bits_data[31:0];
  assign data_arrays_0_0__T_495_addr = refill_one_beat ? _T_471 : _T_473;
  assign data_arrays_0_0__T_495_mask = repl_way == 2'h0;
  assign data_arrays_0_0__T_495_en = refill_one_beat & _T_270;
  assign data_arrays_0_1__T_513_addr = data_arrays_0_1__T_513_addr_pipe_0;
  assign data_arrays_0_1__T_513_data = data_arrays_0_1[data_arrays_0_1__T_513_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  assign data_arrays_0_1__T_495_data = auto_master_out_d_bits_data[31:0];
  assign data_arrays_0_1__T_495_addr = refill_one_beat ? _T_471 : _T_473;
  assign data_arrays_0_1__T_495_mask = repl_way == 2'h1;
  assign data_arrays_0_1__T_495_en = refill_one_beat & _T_270;
  assign data_arrays_0_2__T_513_addr = data_arrays_0_2__T_513_addr_pipe_0;
  assign data_arrays_0_2__T_513_data = data_arrays_0_2[data_arrays_0_2__T_513_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  assign data_arrays_0_2__T_495_data = auto_master_out_d_bits_data[31:0];
  assign data_arrays_0_2__T_495_addr = refill_one_beat ? _T_471 : _T_473;
  assign data_arrays_0_2__T_495_mask = repl_way == 2'h2;
  assign data_arrays_0_2__T_495_en = refill_one_beat & _T_270;
  assign data_arrays_0_3__T_513_addr = data_arrays_0_3__T_513_addr_pipe_0;
  assign data_arrays_0_3__T_513_data = data_arrays_0_3[data_arrays_0_3__T_513_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
  assign data_arrays_0_3__T_495_data = auto_master_out_d_bits_data[31:0];
  assign data_arrays_0_3__T_495_addr = refill_one_beat ? _T_471 : _T_473;
  assign data_arrays_0_3__T_495_mask = repl_way == 2'h3;
  assign data_arrays_0_3__T_495_en = refill_one_beat & _T_270;
  assign data_arrays_1_0__T_583_addr = data_arrays_1_0__T_583_addr_pipe_0;
  assign data_arrays_1_0__T_583_data = data_arrays_1_0[data_arrays_1_0__T_583_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  assign data_arrays_1_0__T_565_data = auto_master_out_d_bits_data[63:32];
  assign data_arrays_1_0__T_565_addr = refill_one_beat ? _T_471 : _T_473;
  assign data_arrays_1_0__T_565_mask = repl_way == 2'h0;
  assign data_arrays_1_0__T_565_en = refill_one_beat & _T_270;
  assign data_arrays_1_1__T_583_addr = data_arrays_1_1__T_583_addr_pipe_0;
  assign data_arrays_1_1__T_583_data = data_arrays_1_1[data_arrays_1_1__T_583_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  assign data_arrays_1_1__T_565_data = auto_master_out_d_bits_data[63:32];
  assign data_arrays_1_1__T_565_addr = refill_one_beat ? _T_471 : _T_473;
  assign data_arrays_1_1__T_565_mask = repl_way == 2'h1;
  assign data_arrays_1_1__T_565_en = refill_one_beat & _T_270;
  assign data_arrays_1_2__T_583_addr = data_arrays_1_2__T_583_addr_pipe_0;
  assign data_arrays_1_2__T_583_data = data_arrays_1_2[data_arrays_1_2__T_583_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  assign data_arrays_1_2__T_565_data = auto_master_out_d_bits_data[63:32];
  assign data_arrays_1_2__T_565_addr = refill_one_beat ? _T_471 : _T_473;
  assign data_arrays_1_2__T_565_mask = repl_way == 2'h2;
  assign data_arrays_1_2__T_565_en = refill_one_beat & _T_270;
  assign data_arrays_1_3__T_583_addr = data_arrays_1_3__T_583_addr_pipe_0;
  assign data_arrays_1_3__T_583_data = data_arrays_1_3[data_arrays_1_3__T_583_addr]; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
  assign data_arrays_1_3__T_565_data = auto_master_out_d_bits_data[63:32];
  assign data_arrays_1_3__T_565_addr = refill_one_beat ? _T_471 : _T_473;
  assign data_arrays_1_3__T_565_mask = repl_way == 2'h3;
  assign data_arrays_1_3__T_565_en = refill_one_beat & _T_270;
  assign _T_308 = io_s1_paddr[11:6]; // @[ICache.scala 216:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281217.4]
  assign _T_322 = {1'h0,_T_308}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281231.4]
  assign _T_323 = vb_array >> _T_322; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281232.4]
  assign _T_324 = _T_323[0]; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281233.4]
  assign _T_328 = tag_array_0_tag_rdata_data[25:0]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281237.4]
  assign _T_309 = io_s1_paddr[37:12]; // @[ICache.scala 217:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281218.4]
  assign _T_329 = _T_328 == _T_309; // @[ICache.scala 225:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281238.4]
  assign s1_tag_hit_0 = _T_324 & _T_329; // @[ICache.scala 225:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281239.4]
  assign _T_350 = {1'h1,_T_308}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281262.4]
  assign _T_351 = vb_array >> _T_350; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281263.4]
  assign _T_352 = _T_351[0]; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281264.4]
  assign _T_356 = tag_array_1_tag_rdata_data[25:0]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281268.4]
  assign _T_357 = _T_356 == _T_309; // @[ICache.scala 225:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281269.4]
  assign s1_tag_hit_1 = _T_352 & _T_357; // @[ICache.scala 225:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281270.4]
  assign _T_141 = s1_tag_hit_0 | s1_tag_hit_1; // @[ICache.scala 138:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281049.4]
  assign _T_378 = {2'h2,_T_308}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281293.4]
  assign _T_379 = vb_array >> _T_378; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281294.4]
  assign _T_380 = _T_379[0]; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281295.4]
  assign _T_384 = tag_array_2_tag_rdata_data[25:0]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281299.4]
  assign _T_385 = _T_384 == _T_309; // @[ICache.scala 225:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281300.4]
  assign s1_tag_hit_2 = _T_380 & _T_385; // @[ICache.scala 225:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281301.4]
  assign _T_142 = _T_141 | s1_tag_hit_2; // @[ICache.scala 138:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281050.4]
  assign _T_406 = {2'h3,_T_308}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281324.4]
  assign _T_407 = vb_array >> _T_406; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281325.4]
  assign _T_408 = _T_407[0]; // @[ICache.scala 222:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281326.4]
  assign _T_412 = tag_array_3_tag_rdata_data[25:0]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281330.4]
  assign _T_413 = _T_412 == _T_309; // @[ICache.scala 225:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281331.4]
  assign s1_tag_hit_3 = _T_408 & _T_413; // @[ICache.scala 225:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281332.4]
  assign _T_145 = io_s1_kill == 1'h0; // @[ICache.scala 140:38:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281054.4]
  assign _T_146 = s1_valid & _T_145; // @[ICache.scala 140:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281055.4]
  assign _T_155 = s2_hit == 1'h0; // @[ICache.scala 148:29:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281067.4]
  assign _T_156 = s2_valid & _T_155; // @[ICache.scala 148:26:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281068.4]
  assign _T_157 = io_s2_kill == 1'h0; // @[ICache.scala 148:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281069.4]
  assign s2_miss = _T_156 & _T_157; // @[ICache.scala 148:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281070.4]
  assign s2_request_refill = s2_miss & _T_160; // @[ICache.scala 150:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281075.4]
  assign refill_fire = auto_master_out_a_ready & s2_request_refill; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281063.4]
  assign _T_158 = s2_miss | refill_valid; // @[ICache.scala 149:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281071.4]
  assign s1_can_request_refill = _T_158 == 1'h0; // @[ICache.scala 149:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281072.4]
  assign _T_161 = s1_valid & s1_can_request_refill; // @[ICache.scala 151:53:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281076.4]
  assign refill_tag = refill_addr[37:12]; // @[ICache.scala 152:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281081.4]
  assign refill_idx = refill_addr[11:6]; // @[ICache.scala 153:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281082.4]
  assign _T_164 = auto_master_out_d_bits_opcode[0]; // @[Edges.scala 106:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281084.4]
  assign refill_one_beat = auto_master_out_d_valid & _T_164; // @[ICache.scala 154:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281085.4]
  assign s0_valid = io_req_ready & io_req_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281090.4]
  assign _T_170 = 14'h7f << auto_master_out_d_bits_size; // @[package.scala 185:77:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281094.4]
  assign _T_171 = _T_170[6:0]; // @[package.scala 185:82:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281095.4]
  assign _T_172 = ~ _T_171; // @[package.scala 185:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281096.4]
  assign _T_173 = _T_172[6:3]; // @[Edges.scala 220:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281097.4]
  assign _T_175 = _T_164 ? _T_173 : 4'h0; // @[Edges.scala 221:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281099.4]
  assign _T_178 = _T_177 - 4'h1; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281101.4]
  assign _T_179 = $unsigned(_T_178); // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281102.4]
  assign _T_180 = _T_179[3:0]; // @[Edges.scala 230:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281103.4]
  assign _T_181 = _T_177 == 4'h0; // @[Edges.scala 231:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281104.4]
  assign _T_182 = _T_177 == 4'h1; // @[Edges.scala 232:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281105.4]
  assign _T_183 = _T_175 == 4'h0; // @[Edges.scala 232:47:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281106.4]
  assign _T_184 = _T_182 | _T_183; // @[Edges.scala 232:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281107.4]
  assign d_done = _T_184 & auto_master_out_d_valid; // @[Edges.scala 233:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281108.4]
  assign _T_185 = ~ _T_180; // @[Edges.scala 234:27:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281109.4]
  assign refill_cnt = _T_175 & _T_185; // @[Edges.scala 234:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281110.4]
  assign refill_done = refill_one_beat & d_done; // @[ICache.scala 162:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281115.4]
  assign _T_190 = _T_189[0]; // @[LFSR.scala 23:40:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281120.6]
  assign _T_191 = _T_189[2]; // @[LFSR.scala 23:48:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281121.6]
  assign _T_192 = _T_190 ^ _T_191; // @[LFSR.scala 23:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281122.6]
  assign _T_193 = _T_189[3]; // @[LFSR.scala 23:56:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281123.6]
  assign _T_194 = _T_192 ^ _T_193; // @[LFSR.scala 23:51:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281124.6]
  assign _T_195 = _T_189[5]; // @[LFSR.scala 23:64:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281125.6]
  assign _T_196 = _T_194 ^ _T_195; // @[LFSR.scala 23:59:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281126.6]
  assign _T_197 = _T_189[15:1]; // @[LFSR.scala 23:73:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281127.6]
  assign _T_198 = {_T_196,_T_197}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281128.6]
  assign repl_way = _T_189[1:0]; // @[ICache.scala 168:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281131.4]
  assign _T_201 = {repl_way,refill_idx}; // @[Cat.scala 30:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281133.4]
  assign _T_222 = io_req_bits_addr[11:6]; // @[ICache.scala 185:42:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281150.4]
  assign _T_223 = refill_done == 1'h0; // @[ICache.scala 185:70:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281151.4]
  assign _T_224 = _T_223 & s0_valid; // @[ICache.scala 185:83:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281152.4]
  assign _GEN_4 = _T_224; // @[ICache.scala 185:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281156.4]
  assign _T_270 = invalidated == 1'h0; // @[ICache.scala 198:75:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281192.6]
  assign _T_271 = refill_done & _T_270; // @[ICache.scala 198:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281193.6]
  assign _T_272 = 256'h1 << _T_201; // @[ICache.scala 198:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281194.6]
  assign _T_273 = vb_array | _T_272; // @[ICache.scala 198:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281195.6]
  assign _T_274 = ~ vb_array; // @[ICache.scala 198:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281196.6]
  assign _T_275 = _T_274 | _T_272; // @[ICache.scala 198:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281197.6]
  assign _T_276 = ~ _T_275; // @[ICache.scala 198:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281198.6]
  assign _T_327 = tag_array_0_tag_rdata_data[26]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281236.4]
  assign s1_tl_error_0 = s1_tag_hit_0 & _T_327; // @[ICache.scala 227:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281244.4]
  assign _T_355 = tag_array_1_tag_rdata_data[26]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281267.4]
  assign s1_tl_error_1 = s1_tag_hit_1 & _T_355; // @[ICache.scala 227:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281275.4]
  assign _T_383 = tag_array_2_tag_rdata_data[26]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281298.4]
  assign s1_tl_error_2 = s1_tag_hit_2 & _T_383; // @[ICache.scala 227:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281306.4]
  assign _T_411 = tag_array_3_tag_rdata_data[26]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281329.4]
  assign s1_tl_error_3 = s1_tag_hit_3 & _T_411; // @[ICache.scala 227:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281337.4]
  assign _T_421 = s1_valid == 1'h0; // @[ICache.scala 230:10:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281342.4]
  assign _T_430 = s1_tag_hit_0 + s1_tag_hit_1; // @[Bitwise.scala 48:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281351.4]
  assign _T_431 = s1_tag_hit_2 + s1_tag_hit_3; // @[Bitwise.scala 48:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281352.4]
  assign _T_432 = _T_430 + _T_431; // @[Bitwise.scala 48:55:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281353.4]
  assign _T_433 = _T_432 <= 3'h1; // @[ICache.scala 230:115:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281354.4]
  assign _T_434 = _T_421 | _T_433; // @[ICache.scala 230:39:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281355.4]
  assign _T_436 = _T_434 | reset; // @[ICache.scala 230:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281357.4]
  assign _T_437 = _T_436 == 1'h0; // @[ICache.scala 230:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281358.4]
  assign _T_458 = io_req_bits_addr[2]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281365.4]
  assign _T_459 = _T_458 == 1'h0; // @[ICache.scala 245:111:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281366.4]
  assign _T_460 = s0_valid & _T_459; // @[ICache.scala 247:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281367.4]
  assign _T_465 = refill_one_beat & _T_270; // @[ICache.scala 248:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281372.4]
  assign _GEN_173 = {{3'd0}, refill_idx}; // @[ICache.scala 249:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281377.4]
  assign _T_470 = _GEN_173 << 3; // @[ICache.scala 249:52:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281377.4]
  assign _GEN_174 = {{5'd0}, refill_cnt}; // @[ICache.scala 249:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281378.4]
  assign _T_471 = _T_470 | _GEN_174; // @[ICache.scala 249:79:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281378.4]
  assign _T_473 = io_req_bits_addr[11:3]; // @[ICache.scala 246:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281380.4]
  assign _T_476 = refill_one_beat ? _T_471 : _T_473; // @[ICache.scala 249:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281383.4]
  assign _T_507 = _T_465 == 1'h0; // @[ICache.scala 258:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281413.4]
  assign _T_508 = _T_507 & _T_460; // @[ICache.scala 258:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281414.4]
  assign _GEN_49 = _T_508; // @[ICache.scala 258:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281418.4]
  assign _T_526 = io_s1_paddr[2]; // @[package.scala 119:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281425.4]
  assign _GEN_52 = data_arrays_0_0__T_513_data; // @[ICache.scala 259:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281427.4]
  assign _GEN_53 = data_arrays_0_1__T_513_data; // @[ICache.scala 259:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281427.4]
  assign _GEN_54 = data_arrays_0_2__T_513_data; // @[ICache.scala 259:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281427.4]
  assign _GEN_55 = data_arrays_0_3__T_513_data; // @[ICache.scala 259:71:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281427.4]
  assign _T_530 = s0_valid & _T_458; // @[ICache.scala 247:28:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281432.4]
  assign _T_578 = _T_507 & _T_530; // @[ICache.scala 258:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281479.4]
  assign _GEN_76 = _T_578; // @[ICache.scala 258:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281483.4]
  assign _T_666 = s2_tag_hit_0 ? s2_dout_0 : 32'h0; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281523.4]
  assign _T_667 = s2_tag_hit_1 ? s2_dout_1 : 32'h0; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281524.4]
  assign _T_668 = s2_tag_hit_2 ? s2_dout_2 : 32'h0; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281525.4]
  assign _T_669 = s2_tag_hit_3 ? s2_dout_3 : 32'h0; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281526.4]
  assign _T_670 = _T_666 | _T_667; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281527.4]
  assign _T_671 = _T_670 | _T_668; // @[Mux.scala 19:72:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281528.4]
  assign _T_706 = {s1_tl_error_1,s1_tl_error_0}; // @[ICache.scala 272:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281543.4]
  assign _T_707 = {s1_tl_error_3,s1_tl_error_2}; // @[ICache.scala 272:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281544.4]
  assign _T_708 = {_T_707,_T_706}; // @[ICache.scala 272:43:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281545.4]
  assign _T_709 = _T_708 != 4'h0; // @[ICache.scala 272:50:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281546.4]
  assign _T_723 = refill_addr[37:6]; // @[ICache.scala 381:46:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281579.4]
  assign _GEN_177 = {{6'd0}, _T_723}; // @[ICache.scala 381:63:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281580.4]
  assign _T_854 = refill_valid == 1'h0; // @[ICache.scala 418:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281726.4]
  assign auto_master_out_a_valid = s2_miss & _T_160; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281038.4]
  assign auto_master_out_a_bits_address = _GEN_177 << 6; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281038.4]
  assign io_req_ready = refill_one_beat == 1'h0; // @[ICache.scala 156:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281089.4]
  assign io_resp_valid = s2_valid & s2_hit; // @[ICache.scala 299:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281577.4]
  assign io_resp_bits_data = _T_671 | _T_669; // @[ICache.scala 296:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281573.4]
  assign io_resp_bits_ae = s2_tl_error; // @[ICache.scala 297:23:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281574.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_0[initvar] = _RAND_0[26:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_1[initvar] = _RAND_1[26:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_2[initvar] = _RAND_2[26:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_3[initvar] = _RAND_3[26:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_4 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_arrays_0_0[initvar] = _RAND_4[31:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_5 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_arrays_0_1[initvar] = _RAND_5[31:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_6 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_arrays_0_2[initvar] = _RAND_6[31:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_7 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_arrays_0_3[initvar] = _RAND_7[31:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_8 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_arrays_1_0[initvar] = _RAND_8[31:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_9 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_arrays_1_1[initvar] = _RAND_9[31:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_10 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_arrays_1_2[initvar] = _RAND_10[31:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_11 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    data_arrays_1_3[initvar] = _RAND_11[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  s1_valid = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {8{`RANDOM}};
  vb_array = _RAND_13[255:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  s2_valid = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  s2_hit = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  invalidated = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  refill_valid = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_160 = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {2{`RANDOM}};
  refill_addr = _RAND_19[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_177 = _RAND_20[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_189 = _RAND_21[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  s2_tag_hit_0 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  s2_tag_hit_1 = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  s2_tag_hit_2 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  s2_tag_hit_3 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  s2_dout_0 = _RAND_26[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  s2_dout_1 = _RAND_27[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  s2_dout_2 = _RAND_28[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  s2_dout_3 = _RAND_29[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  s2_tl_error = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  tag_array_0_tag_rdata_addr_pipe_0 = _RAND_31[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  tag_array_1_tag_rdata_addr_pipe_0 = _RAND_32[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  tag_array_2_tag_rdata_addr_pipe_0 = _RAND_33[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  tag_array_3_tag_rdata_addr_pipe_0 = _RAND_34[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  data_arrays_0_0__T_513_addr_pipe_0 = _RAND_35[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  data_arrays_0_1__T_513_addr_pipe_0 = _RAND_36[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  data_arrays_0_2__T_513_addr_pipe_0 = _RAND_37[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  data_arrays_0_3__T_513_addr_pipe_0 = _RAND_38[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  data_arrays_1_0__T_583_addr_pipe_0 = _RAND_39[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  data_arrays_1_1__T_583_addr_pipe_0 = _RAND_40[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  data_arrays_1_2__T_583_addr_pipe_0 = _RAND_41[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  data_arrays_1_3__T_583_addr_pipe_0 = _RAND_42[8:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(tag_array_0__T_256_en & tag_array_0__T_256_mask) begin
      tag_array_0[tag_array_0__T_256_addr] <= tag_array_0__T_256_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
    end
    if(tag_array_1__T_256_en & tag_array_1__T_256_mask) begin
      tag_array_1[tag_array_1__T_256_addr] <= tag_array_1__T_256_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
    end
    if(tag_array_2__T_256_en & tag_array_2__T_256_mask) begin
      tag_array_2[tag_array_2__T_256_addr] <= tag_array_2__T_256_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
    end
    if(tag_array_3__T_256_en & tag_array_3__T_256_mask) begin
      tag_array_3[tag_array_3__T_256_addr] <= tag_array_3__T_256_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281149.4]
    end
    if(data_arrays_0_0__T_495_en & data_arrays_0_0__T_495_mask) begin
      data_arrays_0_0[data_arrays_0_0__T_495_addr] <= data_arrays_0_0__T_495_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
    end
    if(data_arrays_0_1__T_495_en & data_arrays_0_1__T_495_mask) begin
      data_arrays_0_1[data_arrays_0_1__T_495_addr] <= data_arrays_0_1__T_495_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
    end
    if(data_arrays_0_2__T_495_en & data_arrays_0_2__T_495_mask) begin
      data_arrays_0_2[data_arrays_0_2__T_495_addr] <= data_arrays_0_2__T_495_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
    end
    if(data_arrays_0_3__T_495_en & data_arrays_0_3__T_495_mask) begin
      data_arrays_0_3[data_arrays_0_3__T_495_addr] <= data_arrays_0_3__T_495_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281363.4]
    end
    if(data_arrays_1_0__T_565_en & data_arrays_1_0__T_565_mask) begin
      data_arrays_1_0[data_arrays_1_0__T_565_addr] <= data_arrays_1_0__T_565_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
    end
    if(data_arrays_1_1__T_565_en & data_arrays_1_1__T_565_mask) begin
      data_arrays_1_1[data_arrays_1_1__T_565_addr] <= data_arrays_1_1__T_565_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
    end
    if(data_arrays_1_2__T_565_en & data_arrays_1_2__T_565_mask) begin
      data_arrays_1_2[data_arrays_1_2__T_565_addr] <= data_arrays_1_2__T_565_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
    end
    if(data_arrays_1_3__T_565_en & data_arrays_1_3__T_565_mask) begin
      data_arrays_1_3[data_arrays_1_3__T_565_addr] <= data_arrays_1_3__T_565_data; // @[DescribedSRAM.scala 23:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281364.4]
    end
    if (reset) begin
      s1_valid <= 1'h0;
    end else begin
      s1_valid <= s0_valid;
    end
    if (reset) begin
      vb_array <= 256'h0;
    end else begin
      if (io_invalidate) begin
        vb_array <= 256'h0;
      end else begin
        if (refill_one_beat) begin
          if (_T_271) begin
            vb_array <= _T_273;
          end else begin
            vb_array <= _T_276;
          end
        end
      end
    end
    if (reset) begin
      s2_valid <= 1'h0;
    end else begin
      s2_valid <= _T_146;
    end
    s2_hit <= _T_142 | s1_tag_hit_3;
    if (_T_854) begin
      invalidated <= 1'h0;
    end else begin
      if (io_invalidate) begin
        invalidated <= 1'h1;
      end
    end
    if (reset) begin
      refill_valid <= 1'h0;
    end else begin
      if (refill_done) begin
        refill_valid <= 1'h0;
      end else begin
        if (refill_fire) begin
          refill_valid <= 1'h1;
        end
      end
    end
    _T_160 <= _T_158 == 1'h0;
    if (_T_161) begin
      refill_addr <= io_s1_paddr;
    end
    if (reset) begin
      _T_177 <= 4'h0;
    end else begin
      if (auto_master_out_d_valid) begin
        if (_T_181) begin
          if (_T_164) begin
            _T_177 <= _T_173;
          end else begin
            _T_177 <= 4'h0;
          end
        end else begin
          _T_177 <= _T_180;
        end
      end
    end
    if (reset) begin
      _T_189 <= 16'h1;
    end else begin
      if (refill_fire) begin
        _T_189 <= _T_198;
      end
    end
    if (s1_valid) begin
      s2_tag_hit_0 <= s1_tag_hit_0;
    end
    if (s1_valid) begin
      s2_tag_hit_1 <= s1_tag_hit_1;
    end
    if (s1_valid) begin
      s2_tag_hit_2 <= s1_tag_hit_2;
    end
    if (s1_valid) begin
      s2_tag_hit_3 <= s1_tag_hit_3;
    end
    if (s1_valid) begin
      if (_T_526) begin
        s2_dout_0 <= data_arrays_1_0__T_583_data;
      end else begin
        s2_dout_0 <= _GEN_52;
      end
    end
    if (s1_valid) begin
      if (_T_526) begin
        s2_dout_1 <= data_arrays_1_1__T_583_data;
      end else begin
        s2_dout_1 <= _GEN_53;
      end
    end
    if (s1_valid) begin
      if (_T_526) begin
        s2_dout_2 <= data_arrays_1_2__T_583_data;
      end else begin
        s2_dout_2 <= _GEN_54;
      end
    end
    if (s1_valid) begin
      if (_T_526) begin
        s2_dout_3 <= data_arrays_1_3__T_583_data;
      end else begin
        s2_dout_3 <= _GEN_55;
      end
    end
    if (s1_valid) begin
      s2_tl_error <= _T_709;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed\n    at ICache.scala:174 assert(!lineInScratchpad(Cat(v, refill_idx)))\n"); // @[ICache.scala 174:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281146.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
          $fatal; // @[ICache.scala 174:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281147.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_437) begin
          $fwrite(32'h80000002,"Assertion failed\n    at ICache.scala:230 assert(!(s1_valid || s1_slaveValid) || PopCount(s1_tag_hit zip s1_tag_disparity map { case (h, d) => h && !d }) <= 1)\n"); // @[ICache.scala 230:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281360.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_437) begin
          $fatal; // @[ICache.scala 230:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281361.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed\n    at ICache.scala:416 assert(!(tl_out.a.valid && addrMaybeInScratchpad(tl_out.a.bits.address)))\n"); // @[ICache.scala 416:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281723.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
          $fatal; // @[ICache.scala 416:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@281724.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    if (_GEN_4) begin
      tag_array_0_tag_rdata_addr_pipe_0 <= _T_222;
    end
    if (_GEN_4) begin
      tag_array_1_tag_rdata_addr_pipe_0 <= _T_222;
    end
    if (_GEN_4) begin
      tag_array_2_tag_rdata_addr_pipe_0 <= _T_222;
    end
    if (_GEN_4) begin
      tag_array_3_tag_rdata_addr_pipe_0 <= _T_222;
    end
    if (_GEN_49) begin
      if (refill_one_beat) begin
        data_arrays_0_0__T_513_addr_pipe_0 <= _T_471;
      end else begin
        data_arrays_0_0__T_513_addr_pipe_0 <= _T_473;
      end
    end
    if (_GEN_49) begin
      if (refill_one_beat) begin
        data_arrays_0_1__T_513_addr_pipe_0 <= _T_471;
      end else begin
        data_arrays_0_1__T_513_addr_pipe_0 <= _T_473;
      end
    end
    if (_GEN_49) begin
      if (refill_one_beat) begin
        data_arrays_0_2__T_513_addr_pipe_0 <= _T_471;
      end else begin
        data_arrays_0_2__T_513_addr_pipe_0 <= _T_473;
      end
    end
    if (_GEN_49) begin
      if (refill_one_beat) begin
        data_arrays_0_3__T_513_addr_pipe_0 <= _T_471;
      end else begin
        data_arrays_0_3__T_513_addr_pipe_0 <= _T_473;
      end
    end
    if (_GEN_76) begin
      data_arrays_1_0__T_583_addr_pipe_0 <= _T_476;
    end
    if (_GEN_76) begin
      data_arrays_1_1__T_583_addr_pipe_0 <= _T_476;
    end
    if (_GEN_76) begin
      data_arrays_1_2__T_583_addr_pipe_0 <= _T_476;
    end
    if (_GEN_76) begin
      data_arrays_1_3__T_583_addr_pipe_0 <= _T_476;
    end
  end
endmodule