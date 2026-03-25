module XilinxVC707PCIeX1( 
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
  output        auto_int_out_xing_out_sync_0, 
  output [2:0]  auto_tl_out_xing_out_a_mem_0_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_0_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_0_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_0_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_0_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_0_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_0_data, 
  output        auto_tl_out_xing_out_a_mem_0_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_1_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_1_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_1_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_1_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_1_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_1_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_1_data, 
  output        auto_tl_out_xing_out_a_mem_1_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_2_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_2_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_2_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_2_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_2_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_2_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_2_data, 
  output        auto_tl_out_xing_out_a_mem_2_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_3_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_3_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_3_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_3_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_3_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_3_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_3_data, 
  output        auto_tl_out_xing_out_a_mem_3_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_4_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_4_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_4_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_4_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_4_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_4_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_4_data, 
  output        auto_tl_out_xing_out_a_mem_4_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_5_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_5_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_5_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_5_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_5_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_5_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_5_data, 
  output        auto_tl_out_xing_out_a_mem_5_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_6_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_6_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_6_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_6_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_6_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_6_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_6_data, 
  output        auto_tl_out_xing_out_a_mem_6_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_7_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_7_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_7_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_7_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_7_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_7_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_7_data, 
  output        auto_tl_out_xing_out_a_mem_7_corrupt, 
  input  [3:0]  auto_tl_out_xing_out_a_ridx, 
  output [3:0]  auto_tl_out_xing_out_a_widx, 
  input         auto_tl_out_xing_out_a_safe_ridx_valid, 
  output        auto_tl_out_xing_out_a_safe_widx_valid, 
  output        auto_tl_out_xing_out_a_safe_source_reset_n, 
  input         auto_tl_out_xing_out_a_safe_sink_reset_n, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_0_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_0_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_0_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_0_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_0_sink, 
  input         auto_tl_out_xing_out_d_mem_0_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_0_data, 
  input         auto_tl_out_xing_out_d_mem_0_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_1_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_1_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_1_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_1_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_1_sink, 
  input         auto_tl_out_xing_out_d_mem_1_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_1_data, 
  input         auto_tl_out_xing_out_d_mem_1_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_2_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_2_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_2_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_2_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_2_sink, 
  input         auto_tl_out_xing_out_d_mem_2_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_2_data, 
  input         auto_tl_out_xing_out_d_mem_2_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_3_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_3_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_3_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_3_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_3_sink, 
  input         auto_tl_out_xing_out_d_mem_3_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_3_data, 
  input         auto_tl_out_xing_out_d_mem_3_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_4_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_4_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_4_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_4_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_4_sink, 
  input         auto_tl_out_xing_out_d_mem_4_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_4_data, 
  input         auto_tl_out_xing_out_d_mem_4_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_5_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_5_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_5_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_5_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_5_sink, 
  input         auto_tl_out_xing_out_d_mem_5_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_5_data, 
  input         auto_tl_out_xing_out_d_mem_5_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_6_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_6_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_6_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_6_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_6_sink, 
  input         auto_tl_out_xing_out_d_mem_6_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_6_data, 
  input         auto_tl_out_xing_out_d_mem_6_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_7_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_7_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_7_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_7_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_7_sink, 
  input         auto_tl_out_xing_out_d_mem_7_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_7_data, 
  input         auto_tl_out_xing_out_d_mem_7_corrupt, 
  output [3:0]  auto_tl_out_xing_out_d_ridx, 
  input  [3:0]  auto_tl_out_xing_out_d_widx, 
  output        auto_tl_out_xing_out_d_safe_ridx_valid, 
  input         auto_tl_out_xing_out_d_safe_widx_valid, 
  input         auto_tl_out_xing_out_d_safe_source_reset_n, 
  output        auto_tl_out_xing_out_d_safe_sink_reset_n, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_0_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_0_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_0_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_0_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_0_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_0_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_0_data, 
  input         auto_tl_in_xing_in_1_a_mem_0_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_1_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_1_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_1_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_1_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_1_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_1_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_1_data, 
  input         auto_tl_in_xing_in_1_a_mem_1_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_2_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_2_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_2_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_2_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_2_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_2_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_2_data, 
  input         auto_tl_in_xing_in_1_a_mem_2_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_3_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_3_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_3_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_3_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_3_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_3_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_3_data, 
  input         auto_tl_in_xing_in_1_a_mem_3_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_4_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_4_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_4_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_4_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_4_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_4_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_4_data, 
  input         auto_tl_in_xing_in_1_a_mem_4_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_5_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_5_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_5_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_5_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_5_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_5_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_5_data, 
  input         auto_tl_in_xing_in_1_a_mem_5_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_6_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_6_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_6_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_6_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_6_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_6_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_6_data, 
  input         auto_tl_in_xing_in_1_a_mem_6_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_7_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_7_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_7_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_7_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_7_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_7_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_7_data, 
  input         auto_tl_in_xing_in_1_a_mem_7_corrupt, 
  output [3:0]  auto_tl_in_xing_in_1_a_ridx, 
  input  [3:0]  auto_tl_in_xing_in_1_a_widx, 
  output        auto_tl_in_xing_in_1_a_safe_ridx_valid, 
  input         auto_tl_in_xing_in_1_a_safe_widx_valid, 
  input         auto_tl_in_xing_in_1_a_safe_source_reset_n, 
  output        auto_tl_in_xing_in_1_a_safe_sink_reset_n, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_0_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_0_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_0_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_0_source, 
  output        auto_tl_in_xing_in_1_d_mem_0_sink, 
  output        auto_tl_in_xing_in_1_d_mem_0_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_0_data, 
  output        auto_tl_in_xing_in_1_d_mem_0_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_1_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_1_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_1_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_1_source, 
  output        auto_tl_in_xing_in_1_d_mem_1_sink, 
  output        auto_tl_in_xing_in_1_d_mem_1_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_1_data, 
  output        auto_tl_in_xing_in_1_d_mem_1_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_2_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_2_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_2_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_2_source, 
  output        auto_tl_in_xing_in_1_d_mem_2_sink, 
  output        auto_tl_in_xing_in_1_d_mem_2_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_2_data, 
  output        auto_tl_in_xing_in_1_d_mem_2_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_3_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_3_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_3_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_3_source, 
  output        auto_tl_in_xing_in_1_d_mem_3_sink, 
  output        auto_tl_in_xing_in_1_d_mem_3_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_3_data, 
  output        auto_tl_in_xing_in_1_d_mem_3_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_4_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_4_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_4_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_4_source, 
  output        auto_tl_in_xing_in_1_d_mem_4_sink, 
  output        auto_tl_in_xing_in_1_d_mem_4_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_4_data, 
  output        auto_tl_in_xing_in_1_d_mem_4_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_5_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_5_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_5_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_5_source, 
  output        auto_tl_in_xing_in_1_d_mem_5_sink, 
  output        auto_tl_in_xing_in_1_d_mem_5_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_5_data, 
  output        auto_tl_in_xing_in_1_d_mem_5_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_6_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_6_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_6_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_6_source, 
  output        auto_tl_in_xing_in_1_d_mem_6_sink, 
  output        auto_tl_in_xing_in_1_d_mem_6_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_6_data, 
  output        auto_tl_in_xing_in_1_d_mem_6_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_7_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_7_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_7_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_7_source, 
  output        auto_tl_in_xing_in_1_d_mem_7_sink, 
  output        auto_tl_in_xing_in_1_d_mem_7_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_7_data, 
  output        auto_tl_in_xing_in_1_d_mem_7_corrupt, 
  input  [3:0]  auto_tl_in_xing_in_1_d_ridx, 
  output [3:0]  auto_tl_in_xing_in_1_d_widx, 
  input         auto_tl_in_xing_in_1_d_safe_ridx_valid, 
  output        auto_tl_in_xing_in_1_d_safe_widx_valid, 
  output        auto_tl_in_xing_in_1_d_safe_source_reset_n, 
  input         auto_tl_in_xing_in_1_d_safe_sink_reset_n, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_0_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_0_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_0_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_0_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_0_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_0_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_0_data, 
  input         auto_tl_in_xing_in_0_a_mem_0_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_1_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_1_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_1_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_1_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_1_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_1_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_1_data, 
  input         auto_tl_in_xing_in_0_a_mem_1_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_2_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_2_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_2_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_2_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_2_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_2_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_2_data, 
  input         auto_tl_in_xing_in_0_a_mem_2_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_3_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_3_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_3_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_3_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_3_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_3_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_3_data, 
  input         auto_tl_in_xing_in_0_a_mem_3_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_4_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_4_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_4_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_4_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_4_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_4_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_4_data, 
  input         auto_tl_in_xing_in_0_a_mem_4_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_5_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_5_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_5_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_5_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_5_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_5_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_5_data, 
  input         auto_tl_in_xing_in_0_a_mem_5_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_6_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_6_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_6_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_6_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_6_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_6_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_6_data, 
  input         auto_tl_in_xing_in_0_a_mem_6_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_7_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_7_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_7_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_7_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_7_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_7_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_7_data, 
  input         auto_tl_in_xing_in_0_a_mem_7_corrupt, 
  output [3:0]  auto_tl_in_xing_in_0_a_ridx, 
  input  [3:0]  auto_tl_in_xing_in_0_a_widx, 
  output        auto_tl_in_xing_in_0_a_safe_ridx_valid, 
  input         auto_tl_in_xing_in_0_a_safe_widx_valid, 
  input         auto_tl_in_xing_in_0_a_safe_source_reset_n, 
  output        auto_tl_in_xing_in_0_a_safe_sink_reset_n, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_0_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_0_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_0_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_0_source, 
  output        auto_tl_in_xing_in_0_d_mem_0_sink, 
  output        auto_tl_in_xing_in_0_d_mem_0_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_0_data, 
  output        auto_tl_in_xing_in_0_d_mem_0_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_1_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_1_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_1_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_1_source, 
  output        auto_tl_in_xing_in_0_d_mem_1_sink, 
  output        auto_tl_in_xing_in_0_d_mem_1_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_1_data, 
  output        auto_tl_in_xing_in_0_d_mem_1_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_2_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_2_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_2_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_2_source, 
  output        auto_tl_in_xing_in_0_d_mem_2_sink, 
  output        auto_tl_in_xing_in_0_d_mem_2_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_2_data, 
  output        auto_tl_in_xing_in_0_d_mem_2_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_3_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_3_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_3_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_3_source, 
  output        auto_tl_in_xing_in_0_d_mem_3_sink, 
  output        auto_tl_in_xing_in_0_d_mem_3_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_3_data, 
  output        auto_tl_in_xing_in_0_d_mem_3_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_4_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_4_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_4_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_4_source, 
  output        auto_tl_in_xing_in_0_d_mem_4_sink, 
  output        auto_tl_in_xing_in_0_d_mem_4_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_4_data, 
  output        auto_tl_in_xing_in_0_d_mem_4_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_5_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_5_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_5_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_5_source, 
  output        auto_tl_in_xing_in_0_d_mem_5_sink, 
  output        auto_tl_in_xing_in_0_d_mem_5_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_5_data, 
  output        auto_tl_in_xing_in_0_d_mem_5_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_6_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_6_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_6_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_6_source, 
  output        auto_tl_in_xing_in_0_d_mem_6_sink, 
  output        auto_tl_in_xing_in_0_d_mem_6_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_6_data, 
  output        auto_tl_in_xing_in_0_d_mem_6_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_7_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_7_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_7_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_7_source, 
  output        auto_tl_in_xing_in_0_d_mem_7_sink, 
  output        auto_tl_in_xing_in_0_d_mem_7_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_7_data, 
  output        auto_tl_in_xing_in_0_d_mem_7_corrupt, 
  input  [3:0]  auto_tl_in_xing_in_0_d_ridx, 
  output [3:0]  auto_tl_in_xing_in_0_d_widx, 
  input         auto_tl_in_xing_in_0_d_safe_ridx_valid, 
  output        auto_tl_in_xing_in_0_d_safe_widx_valid, 
  output        auto_tl_in_xing_in_0_d_safe_source_reset_n, 
  input         auto_tl_in_xing_in_0_d_safe_sink_reset_n, 
  input         io_port_REFCLK_rxp, 
  input         io_port_REFCLK_rxn, 
  output        io_port_pci_exp_txp, 
  output        io_port_pci_exp_txn, 
  input         io_port_pci_exp_rxp, 
  input         io_port_pci_exp_rxn, 
  input         io_port_axi_aresetn, 
  output        io_port_axi_aclk_out, 
  output        io_port_mmcm_lock 
);
  wire  axi_to_pcie_x1_auto_int_out_0; 
  wire  axi_to_pcie_x1_auto_master_out_aw_ready; 
  wire  axi_to_pcie_x1_auto_master_out_aw_valid; 
  wire [37:0] axi_to_pcie_x1_auto_master_out_aw_bits_addr; 
  wire [7:0] axi_to_pcie_x1_auto_master_out_aw_bits_len; 
  wire [2:0] axi_to_pcie_x1_auto_master_out_aw_bits_size; 
  wire [1:0] axi_to_pcie_x1_auto_master_out_aw_bits_burst; 
  wire  axi_to_pcie_x1_auto_master_out_w_ready; 
  wire  axi_to_pcie_x1_auto_master_out_w_valid; 
  wire [63:0] axi_to_pcie_x1_auto_master_out_w_bits_data; 
  wire [7:0] axi_to_pcie_x1_auto_master_out_w_bits_strb; 
  wire  axi_to_pcie_x1_auto_master_out_w_bits_last; 
  wire  axi_to_pcie_x1_auto_master_out_b_ready; 
  wire  axi_to_pcie_x1_auto_master_out_b_valid; 
  wire [1:0] axi_to_pcie_x1_auto_master_out_b_bits_resp; 
  wire  axi_to_pcie_x1_auto_master_out_ar_ready; 
  wire  axi_to_pcie_x1_auto_master_out_ar_valid; 
  wire [37:0] axi_to_pcie_x1_auto_master_out_ar_bits_addr; 
  wire [7:0] axi_to_pcie_x1_auto_master_out_ar_bits_len; 
  wire [2:0] axi_to_pcie_x1_auto_master_out_ar_bits_size; 
  wire [1:0] axi_to_pcie_x1_auto_master_out_ar_bits_burst; 
  wire  axi_to_pcie_x1_auto_master_out_r_ready; 
  wire  axi_to_pcie_x1_auto_master_out_r_valid; 
  wire [63:0] axi_to_pcie_x1_auto_master_out_r_bits_data; 
  wire [1:0] axi_to_pcie_x1_auto_master_out_r_bits_resp; 
  wire  axi_to_pcie_x1_auto_master_out_r_bits_last; 
  wire  axi_to_pcie_x1_auto_control_in_aw_ready; 
  wire  axi_to_pcie_x1_auto_control_in_aw_valid; 
  wire [37:0] axi_to_pcie_x1_auto_control_in_aw_bits_addr; 
  wire  axi_to_pcie_x1_auto_control_in_w_ready; 
  wire  axi_to_pcie_x1_auto_control_in_w_valid; 
  wire [31:0] axi_to_pcie_x1_auto_control_in_w_bits_data; 
  wire [3:0] axi_to_pcie_x1_auto_control_in_w_bits_strb; 
  wire  axi_to_pcie_x1_auto_control_in_b_ready; 
  wire  axi_to_pcie_x1_auto_control_in_b_valid; 
  wire [1:0] axi_to_pcie_x1_auto_control_in_b_bits_resp; 
  wire  axi_to_pcie_x1_auto_control_in_ar_ready; 
  wire  axi_to_pcie_x1_auto_control_in_ar_valid; 
  wire [37:0] axi_to_pcie_x1_auto_control_in_ar_bits_addr; 
  wire  axi_to_pcie_x1_auto_control_in_r_ready; 
  wire  axi_to_pcie_x1_auto_control_in_r_valid; 
  wire [31:0] axi_to_pcie_x1_auto_control_in_r_bits_data; 
  wire [1:0] axi_to_pcie_x1_auto_control_in_r_bits_resp; 
  wire  axi_to_pcie_x1_auto_slave_in_aw_ready; 
  wire  axi_to_pcie_x1_auto_slave_in_aw_valid; 
  wire [3:0] axi_to_pcie_x1_auto_slave_in_aw_bits_id; 
  wire [30:0] axi_to_pcie_x1_auto_slave_in_aw_bits_addr; 
  wire [7:0] axi_to_pcie_x1_auto_slave_in_aw_bits_len; 
  wire [2:0] axi_to_pcie_x1_auto_slave_in_aw_bits_size; 
  wire [1:0] axi_to_pcie_x1_auto_slave_in_aw_bits_burst; 
  wire  axi_to_pcie_x1_auto_slave_in_w_ready; 
  wire  axi_to_pcie_x1_auto_slave_in_w_valid; 
  wire [63:0] axi_to_pcie_x1_auto_slave_in_w_bits_data; 
  wire [7:0] axi_to_pcie_x1_auto_slave_in_w_bits_strb; 
  wire  axi_to_pcie_x1_auto_slave_in_w_bits_last; 
  wire  axi_to_pcie_x1_auto_slave_in_b_ready; 
  wire  axi_to_pcie_x1_auto_slave_in_b_valid; 
  wire [3:0] axi_to_pcie_x1_auto_slave_in_b_bits_id; 
  wire [1:0] axi_to_pcie_x1_auto_slave_in_b_bits_resp; 
  wire  axi_to_pcie_x1_auto_slave_in_ar_ready; 
  wire  axi_to_pcie_x1_auto_slave_in_ar_valid; 
  wire [3:0] axi_to_pcie_x1_auto_slave_in_ar_bits_id; 
  wire [30:0] axi_to_pcie_x1_auto_slave_in_ar_bits_addr; 
  wire [7:0] axi_to_pcie_x1_auto_slave_in_ar_bits_len; 
  wire [2:0] axi_to_pcie_x1_auto_slave_in_ar_bits_size; 
  wire [1:0] axi_to_pcie_x1_auto_slave_in_ar_bits_burst; 
  wire  axi_to_pcie_x1_auto_slave_in_r_ready; 
  wire  axi_to_pcie_x1_auto_slave_in_r_valid; 
  wire [3:0] axi_to_pcie_x1_auto_slave_in_r_bits_id; 
  wire [63:0] axi_to_pcie_x1_auto_slave_in_r_bits_data; 
  wire [1:0] axi_to_pcie_x1_auto_slave_in_r_bits_resp; 
  wire  axi_to_pcie_x1_auto_slave_in_r_bits_last; 
  wire  axi_to_pcie_x1_io_port_pci_exp_txp; 
  wire  axi_to_pcie_x1_io_port_pci_exp_txn; 
  wire  axi_to_pcie_x1_io_port_pci_exp_rxp; 
  wire  axi_to_pcie_x1_io_port_pci_exp_rxn; 
  wire  axi_to_pcie_x1_io_port_axi_aresetn; 
  wire  axi_to_pcie_x1_io_port_axi_aclk_out; 
  wire  axi_to_pcie_x1_io_port_mmcm_lock; 
  wire  axi_to_pcie_x1_io_REFCLK; 
  wire  axi4buf_clock; 
  wire  axi4buf_reset; 
  wire  axi4buf_auto_in_aw_ready; 
  wire  axi4buf_auto_in_aw_valid; 
  wire [3:0] axi4buf_auto_in_aw_bits_id; 
  wire [30:0] axi4buf_auto_in_aw_bits_addr; 
  wire [7:0] axi4buf_auto_in_aw_bits_len; 
  wire [2:0] axi4buf_auto_in_aw_bits_size; 
  wire [1:0] axi4buf_auto_in_aw_bits_burst; 
  wire  axi4buf_auto_in_w_ready; 
  wire  axi4buf_auto_in_w_valid; 
  wire [63:0] axi4buf_auto_in_w_bits_data; 
  wire [7:0] axi4buf_auto_in_w_bits_strb; 
  wire  axi4buf_auto_in_w_bits_last; 
  wire  axi4buf_auto_in_b_ready; 
  wire  axi4buf_auto_in_b_valid; 
  wire [3:0] axi4buf_auto_in_b_bits_id; 
  wire [1:0] axi4buf_auto_in_b_bits_resp; 
  wire  axi4buf_auto_in_ar_ready; 
  wire  axi4buf_auto_in_ar_valid; 
  wire [3:0] axi4buf_auto_in_ar_bits_id; 
  wire [30:0] axi4buf_auto_in_ar_bits_addr; 
  wire [7:0] axi4buf_auto_in_ar_bits_len; 
  wire [2:0] axi4buf_auto_in_ar_bits_size; 
  wire [1:0] axi4buf_auto_in_ar_bits_burst; 
  wire  axi4buf_auto_in_r_ready; 
  wire  axi4buf_auto_in_r_valid; 
  wire [3:0] axi4buf_auto_in_r_bits_id; 
  wire [63:0] axi4buf_auto_in_r_bits_data; 
  wire [1:0] axi4buf_auto_in_r_bits_resp; 
  wire  axi4buf_auto_in_r_bits_last; 
  wire  axi4buf_auto_out_aw_ready; 
  wire  axi4buf_auto_out_aw_valid; 
  wire [3:0] axi4buf_auto_out_aw_bits_id; 
  wire [30:0] axi4buf_auto_out_aw_bits_addr; 
  wire [7:0] axi4buf_auto_out_aw_bits_len; 
  wire [2:0] axi4buf_auto_out_aw_bits_size; 
  wire [1:0] axi4buf_auto_out_aw_bits_burst; 
  wire  axi4buf_auto_out_w_ready; 
  wire  axi4buf_auto_out_w_valid; 
  wire [63:0] axi4buf_auto_out_w_bits_data; 
  wire [7:0] axi4buf_auto_out_w_bits_strb; 
  wire  axi4buf_auto_out_w_bits_last; 
  wire  axi4buf_auto_out_b_ready; 
  wire  axi4buf_auto_out_b_valid; 
  wire [3:0] axi4buf_auto_out_b_bits_id; 
  wire [1:0] axi4buf_auto_out_b_bits_resp; 
  wire  axi4buf_auto_out_ar_ready; 
  wire  axi4buf_auto_out_ar_valid; 
  wire [3:0] axi4buf_auto_out_ar_bits_id; 
  wire [30:0] axi4buf_auto_out_ar_bits_addr; 
  wire [7:0] axi4buf_auto_out_ar_bits_len; 
  wire [2:0] axi4buf_auto_out_ar_bits_size; 
  wire [1:0] axi4buf_auto_out_ar_bits_burst; 
  wire  axi4buf_auto_out_r_ready; 
  wire  axi4buf_auto_out_r_valid; 
  wire [3:0] axi4buf_auto_out_r_bits_id; 
  wire [63:0] axi4buf_auto_out_r_bits_data; 
  wire [1:0] axi4buf_auto_out_r_bits_resp; 
  wire  axi4buf_auto_out_r_bits_last; 
  wire  axi4yank_clock; 
  wire  axi4yank_reset; 
  wire  axi4yank_auto_in_aw_ready; 
  wire  axi4yank_auto_in_aw_valid; 
  wire [3:0] axi4yank_auto_in_aw_bits_id; 
  wire [30:0] axi4yank_auto_in_aw_bits_addr; 
  wire [7:0] axi4yank_auto_in_aw_bits_len; 
  wire [2:0] axi4yank_auto_in_aw_bits_size; 
  wire [1:0] axi4yank_auto_in_aw_bits_burst; 
  wire [8:0] axi4yank_auto_in_aw_bits_user; 
  wire  axi4yank_auto_in_w_ready; 
  wire  axi4yank_auto_in_w_valid; 
  wire [63:0] axi4yank_auto_in_w_bits_data; 
  wire [7:0] axi4yank_auto_in_w_bits_strb; 
  wire  axi4yank_auto_in_w_bits_last; 
  wire  axi4yank_auto_in_b_ready; 
  wire  axi4yank_auto_in_b_valid; 
  wire [3:0] axi4yank_auto_in_b_bits_id; 
  wire [1:0] axi4yank_auto_in_b_bits_resp; 
  wire [8:0] axi4yank_auto_in_b_bits_user; 
  wire  axi4yank_auto_in_ar_ready; 
  wire  axi4yank_auto_in_ar_valid; 
  wire [3:0] axi4yank_auto_in_ar_bits_id; 
  wire [30:0] axi4yank_auto_in_ar_bits_addr; 
  wire [7:0] axi4yank_auto_in_ar_bits_len; 
  wire [2:0] axi4yank_auto_in_ar_bits_size; 
  wire [1:0] axi4yank_auto_in_ar_bits_burst; 
  wire [8:0] axi4yank_auto_in_ar_bits_user; 
  wire  axi4yank_auto_in_r_ready; 
  wire  axi4yank_auto_in_r_valid; 
  wire [3:0] axi4yank_auto_in_r_bits_id; 
  wire [63:0] axi4yank_auto_in_r_bits_data; 
  wire [1:0] axi4yank_auto_in_r_bits_resp; 
  wire [8:0] axi4yank_auto_in_r_bits_user; 
  wire  axi4yank_auto_in_r_bits_last; 
  wire  axi4yank_auto_out_aw_ready; 
  wire  axi4yank_auto_out_aw_valid; 
  wire [3:0] axi4yank_auto_out_aw_bits_id; 
  wire [30:0] axi4yank_auto_out_aw_bits_addr; 
  wire [7:0] axi4yank_auto_out_aw_bits_len; 
  wire [2:0] axi4yank_auto_out_aw_bits_size; 
  wire [1:0] axi4yank_auto_out_aw_bits_burst; 
  wire  axi4yank_auto_out_w_ready; 
  wire  axi4yank_auto_out_w_valid; 
  wire [63:0] axi4yank_auto_out_w_bits_data; 
  wire [7:0] axi4yank_auto_out_w_bits_strb; 
  wire  axi4yank_auto_out_w_bits_last; 
  wire  axi4yank_auto_out_b_ready; 
  wire  axi4yank_auto_out_b_valid; 
  wire [3:0] axi4yank_auto_out_b_bits_id; 
  wire [1:0] axi4yank_auto_out_b_bits_resp; 
  wire  axi4yank_auto_out_ar_ready; 
  wire  axi4yank_auto_out_ar_valid; 
  wire [3:0] axi4yank_auto_out_ar_bits_id; 
  wire [30:0] axi4yank_auto_out_ar_bits_addr; 
  wire [7:0] axi4yank_auto_out_ar_bits_len; 
  wire [2:0] axi4yank_auto_out_ar_bits_size; 
  wire [1:0] axi4yank_auto_out_ar_bits_burst; 
  wire  axi4yank_auto_out_r_ready; 
  wire  axi4yank_auto_out_r_valid; 
  wire [3:0] axi4yank_auto_out_r_bits_id; 
  wire [63:0] axi4yank_auto_out_r_bits_data; 
  wire [1:0] axi4yank_auto_out_r_bits_resp; 
  wire  axi4yank_auto_out_r_bits_last; 
  wire  axi4deint_clock; 
  wire  axi4deint_reset; 
  wire  axi4deint_auto_in_aw_ready; 
  wire  axi4deint_auto_in_aw_valid; 
  wire [3:0] axi4deint_auto_in_aw_bits_id; 
  wire [30:0] axi4deint_auto_in_aw_bits_addr; 
  wire [7:0] axi4deint_auto_in_aw_bits_len; 
  wire [2:0] axi4deint_auto_in_aw_bits_size; 
  wire [1:0] axi4deint_auto_in_aw_bits_burst; 
  wire [8:0] axi4deint_auto_in_aw_bits_user; 
  wire  axi4deint_auto_in_w_ready; 
  wire  axi4deint_auto_in_w_valid; 
  wire [63:0] axi4deint_auto_in_w_bits_data; 
  wire [7:0] axi4deint_auto_in_w_bits_strb; 
  wire  axi4deint_auto_in_w_bits_last; 
  wire  axi4deint_auto_in_b_ready; 
  wire  axi4deint_auto_in_b_valid; 
  wire [3:0] axi4deint_auto_in_b_bits_id; 
  wire [1:0] axi4deint_auto_in_b_bits_resp; 
  wire [8:0] axi4deint_auto_in_b_bits_user; 
  wire  axi4deint_auto_in_ar_ready; 
  wire  axi4deint_auto_in_ar_valid; 
  wire [3:0] axi4deint_auto_in_ar_bits_id; 
  wire [30:0] axi4deint_auto_in_ar_bits_addr; 
  wire [7:0] axi4deint_auto_in_ar_bits_len; 
  wire [2:0] axi4deint_auto_in_ar_bits_size; 
  wire [1:0] axi4deint_auto_in_ar_bits_burst; 
  wire [8:0] axi4deint_auto_in_ar_bits_user; 
  wire  axi4deint_auto_in_r_ready; 
  wire  axi4deint_auto_in_r_valid; 
  wire [3:0] axi4deint_auto_in_r_bits_id; 
  wire [63:0] axi4deint_auto_in_r_bits_data; 
  wire [1:0] axi4deint_auto_in_r_bits_resp; 
  wire [8:0] axi4deint_auto_in_r_bits_user; 
  wire  axi4deint_auto_in_r_bits_last; 
  wire  axi4deint_auto_out_aw_ready; 
  wire  axi4deint_auto_out_aw_valid; 
  wire [3:0] axi4deint_auto_out_aw_bits_id; 
  wire [30:0] axi4deint_auto_out_aw_bits_addr; 
  wire [7:0] axi4deint_auto_out_aw_bits_len; 
  wire [2:0] axi4deint_auto_out_aw_bits_size; 
  wire [1:0] axi4deint_auto_out_aw_bits_burst; 
  wire [8:0] axi4deint_auto_out_aw_bits_user; 
  wire  axi4deint_auto_out_w_ready; 
  wire  axi4deint_auto_out_w_valid; 
  wire [63:0] axi4deint_auto_out_w_bits_data; 
  wire [7:0] axi4deint_auto_out_w_bits_strb; 
  wire  axi4deint_auto_out_w_bits_last; 
  wire  axi4deint_auto_out_b_ready; 
  wire  axi4deint_auto_out_b_valid; 
  wire [3:0] axi4deint_auto_out_b_bits_id; 
  wire [1:0] axi4deint_auto_out_b_bits_resp; 
  wire [8:0] axi4deint_auto_out_b_bits_user; 
  wire  axi4deint_auto_out_ar_ready; 
  wire  axi4deint_auto_out_ar_valid; 
  wire [3:0] axi4deint_auto_out_ar_bits_id; 
  wire [30:0] axi4deint_auto_out_ar_bits_addr; 
  wire [7:0] axi4deint_auto_out_ar_bits_len; 
  wire [2:0] axi4deint_auto_out_ar_bits_size; 
  wire [1:0] axi4deint_auto_out_ar_bits_burst; 
  wire [8:0] axi4deint_auto_out_ar_bits_user; 
  wire  axi4deint_auto_out_r_ready; 
  wire  axi4deint_auto_out_r_valid; 
  wire [3:0] axi4deint_auto_out_r_bits_id; 
  wire [63:0] axi4deint_auto_out_r_bits_data; 
  wire [1:0] axi4deint_auto_out_r_bits_resp; 
  wire [8:0] axi4deint_auto_out_r_bits_user; 
  wire  axi4deint_auto_out_r_bits_last; 
  wire  axi4index_auto_in_aw_ready; 
  wire  axi4index_auto_in_aw_valid; 
  wire [3:0] axi4index_auto_in_aw_bits_id; 
  wire [30:0] axi4index_auto_in_aw_bits_addr; 
  wire [7:0] axi4index_auto_in_aw_bits_len; 
  wire [2:0] axi4index_auto_in_aw_bits_size; 
  wire [1:0] axi4index_auto_in_aw_bits_burst; 
  wire [8:0] axi4index_auto_in_aw_bits_user; 
  wire  axi4index_auto_in_w_ready; 
  wire  axi4index_auto_in_w_valid; 
  wire [63:0] axi4index_auto_in_w_bits_data; 
  wire [7:0] axi4index_auto_in_w_bits_strb; 
  wire  axi4index_auto_in_w_bits_last; 
  wire  axi4index_auto_in_b_ready; 
  wire  axi4index_auto_in_b_valid; 
  wire [3:0] axi4index_auto_in_b_bits_id; 
  wire [1:0] axi4index_auto_in_b_bits_resp; 
  wire [8:0] axi4index_auto_in_b_bits_user; 
  wire  axi4index_auto_in_ar_ready; 
  wire  axi4index_auto_in_ar_valid; 
  wire [3:0] axi4index_auto_in_ar_bits_id; 
  wire [30:0] axi4index_auto_in_ar_bits_addr; 
  wire [7:0] axi4index_auto_in_ar_bits_len; 
  wire [2:0] axi4index_auto_in_ar_bits_size; 
  wire [1:0] axi4index_auto_in_ar_bits_burst; 
  wire [8:0] axi4index_auto_in_ar_bits_user; 
  wire  axi4index_auto_in_r_ready; 
  wire  axi4index_auto_in_r_valid; 
  wire [3:0] axi4index_auto_in_r_bits_id; 
  wire [63:0] axi4index_auto_in_r_bits_data; 
  wire [1:0] axi4index_auto_in_r_bits_resp; 
  wire [8:0] axi4index_auto_in_r_bits_user; 
  wire  axi4index_auto_in_r_bits_last; 
  wire  axi4index_auto_out_aw_ready; 
  wire  axi4index_auto_out_aw_valid; 
  wire [3:0] axi4index_auto_out_aw_bits_id; 
  wire [30:0] axi4index_auto_out_aw_bits_addr; 
  wire [7:0] axi4index_auto_out_aw_bits_len; 
  wire [2:0] axi4index_auto_out_aw_bits_size; 
  wire [1:0] axi4index_auto_out_aw_bits_burst; 
  wire [8:0] axi4index_auto_out_aw_bits_user; 
  wire  axi4index_auto_out_w_ready; 
  wire  axi4index_auto_out_w_valid; 
  wire [63:0] axi4index_auto_out_w_bits_data; 
  wire [7:0] axi4index_auto_out_w_bits_strb; 
  wire  axi4index_auto_out_w_bits_last; 
  wire  axi4index_auto_out_b_ready; 
  wire  axi4index_auto_out_b_valid; 
  wire [3:0] axi4index_auto_out_b_bits_id; 
  wire [1:0] axi4index_auto_out_b_bits_resp; 
  wire [8:0] axi4index_auto_out_b_bits_user; 
  wire  axi4index_auto_out_ar_ready; 
  wire  axi4index_auto_out_ar_valid; 
  wire [3:0] axi4index_auto_out_ar_bits_id; 
  wire [30:0] axi4index_auto_out_ar_bits_addr; 
  wire [7:0] axi4index_auto_out_ar_bits_len; 
  wire [2:0] axi4index_auto_out_ar_bits_size; 
  wire [1:0] axi4index_auto_out_ar_bits_burst; 
  wire [8:0] axi4index_auto_out_ar_bits_user; 
  wire  axi4index_auto_out_r_ready; 
  wire  axi4index_auto_out_r_valid; 
  wire [3:0] axi4index_auto_out_r_bits_id; 
  wire [63:0] axi4index_auto_out_r_bits_data; 
  wire [1:0] axi4index_auto_out_r_bits_resp; 
  wire [8:0] axi4index_auto_out_r_bits_user; 
  wire  axi4index_auto_out_r_bits_last; 
  wire  tl2axi4_clock; 
  wire  tl2axi4_reset; 
  wire  tl2axi4_auto_in_a_ready; 
  wire  tl2axi4_auto_in_a_valid; 
  wire [2:0] tl2axi4_auto_in_a_bits_opcode; 
  wire [2:0] tl2axi4_auto_in_a_bits_param; 
  wire [2:0] tl2axi4_auto_in_a_bits_size; 
  wire [4:0] tl2axi4_auto_in_a_bits_source; 
  wire [30:0] tl2axi4_auto_in_a_bits_address; 
  wire [7:0] tl2axi4_auto_in_a_bits_mask; 
  wire [63:0] tl2axi4_auto_in_a_bits_data; 
  wire  tl2axi4_auto_in_a_bits_corrupt; 
  wire  tl2axi4_auto_in_d_ready; 
  wire  tl2axi4_auto_in_d_valid; 
  wire [2:0] tl2axi4_auto_in_d_bits_opcode; 
  wire [2:0] tl2axi4_auto_in_d_bits_size; 
  wire [4:0] tl2axi4_auto_in_d_bits_source; 
  wire  tl2axi4_auto_in_d_bits_denied; 
  wire [63:0] tl2axi4_auto_in_d_bits_data; 
  wire  tl2axi4_auto_in_d_bits_corrupt; 
  wire  tl2axi4_auto_out_aw_ready; 
  wire  tl2axi4_auto_out_aw_valid; 
  wire [3:0] tl2axi4_auto_out_aw_bits_id; 
  wire [30:0] tl2axi4_auto_out_aw_bits_addr; 
  wire [7:0] tl2axi4_auto_out_aw_bits_len; 
  wire [2:0] tl2axi4_auto_out_aw_bits_size; 
  wire [1:0] tl2axi4_auto_out_aw_bits_burst; 
  wire [8:0] tl2axi4_auto_out_aw_bits_user; 
  wire  tl2axi4_auto_out_w_ready; 
  wire  tl2axi4_auto_out_w_valid; 
  wire [63:0] tl2axi4_auto_out_w_bits_data; 
  wire [7:0] tl2axi4_auto_out_w_bits_strb; 
  wire  tl2axi4_auto_out_w_bits_last; 
  wire  tl2axi4_auto_out_b_ready; 
  wire  tl2axi4_auto_out_b_valid; 
  wire [3:0] tl2axi4_auto_out_b_bits_id; 
  wire [1:0] tl2axi4_auto_out_b_bits_resp; 
  wire [8:0] tl2axi4_auto_out_b_bits_user; 
  wire  tl2axi4_auto_out_ar_ready; 
  wire  tl2axi4_auto_out_ar_valid; 
  wire [3:0] tl2axi4_auto_out_ar_bits_id; 
  wire [30:0] tl2axi4_auto_out_ar_bits_addr; 
  wire [7:0] tl2axi4_auto_out_ar_bits_len; 
  wire [2:0] tl2axi4_auto_out_ar_bits_size; 
  wire [1:0] tl2axi4_auto_out_ar_bits_burst; 
  wire [8:0] tl2axi4_auto_out_ar_bits_user; 
  wire  tl2axi4_auto_out_r_ready; 
  wire  tl2axi4_auto_out_r_valid; 
  wire [3:0] tl2axi4_auto_out_r_bits_id; 
  wire [63:0] tl2axi4_auto_out_r_bits_data; 
  wire [1:0] tl2axi4_auto_out_r_bits_resp; 
  wire [8:0] tl2axi4_auto_out_r_bits_user; 
  wire  tl2axi4_auto_out_r_bits_last; 
  wire  axi4buf_1_clock; 
  wire  axi4buf_1_reset; 
  wire  axi4buf_1_auto_in_aw_ready; 
  wire  axi4buf_1_auto_in_aw_valid; 
  wire [37:0] axi4buf_1_auto_in_aw_bits_addr; 
  wire  axi4buf_1_auto_in_w_ready; 
  wire  axi4buf_1_auto_in_w_valid; 
  wire [31:0] axi4buf_1_auto_in_w_bits_data; 
  wire [3:0] axi4buf_1_auto_in_w_bits_strb; 
  wire  axi4buf_1_auto_in_b_ready; 
  wire  axi4buf_1_auto_in_b_valid; 
  wire [1:0] axi4buf_1_auto_in_b_bits_resp; 
  wire  axi4buf_1_auto_in_ar_ready; 
  wire  axi4buf_1_auto_in_ar_valid; 
  wire [37:0] axi4buf_1_auto_in_ar_bits_addr; 
  wire  axi4buf_1_auto_in_r_ready; 
  wire  axi4buf_1_auto_in_r_valid; 
  wire [31:0] axi4buf_1_auto_in_r_bits_data; 
  wire [1:0] axi4buf_1_auto_in_r_bits_resp; 
  wire  axi4buf_1_auto_in_r_bits_last; 
  wire  axi4buf_1_auto_out_aw_ready; 
  wire  axi4buf_1_auto_out_aw_valid; 
  wire [37:0] axi4buf_1_auto_out_aw_bits_addr; 
  wire  axi4buf_1_auto_out_w_ready; 
  wire  axi4buf_1_auto_out_w_valid; 
  wire [31:0] axi4buf_1_auto_out_w_bits_data; 
  wire [3:0] axi4buf_1_auto_out_w_bits_strb; 
  wire  axi4buf_1_auto_out_b_ready; 
  wire  axi4buf_1_auto_out_b_valid; 
  wire [1:0] axi4buf_1_auto_out_b_bits_resp; 
  wire  axi4buf_1_auto_out_ar_ready; 
  wire  axi4buf_1_auto_out_ar_valid; 
  wire [37:0] axi4buf_1_auto_out_ar_bits_addr; 
  wire  axi4buf_1_auto_out_r_ready; 
  wire  axi4buf_1_auto_out_r_valid; 
  wire [31:0] axi4buf_1_auto_out_r_bits_data; 
  wire [1:0] axi4buf_1_auto_out_r_bits_resp; 
  wire  axi4yank_1_clock; 
  wire  axi4yank_1_reset; 
  wire  axi4yank_1_auto_in_aw_ready; 
  wire  axi4yank_1_auto_in_aw_valid; 
  wire [37:0] axi4yank_1_auto_in_aw_bits_addr; 
  wire [13:0] axi4yank_1_auto_in_aw_bits_user; 
  wire  axi4yank_1_auto_in_w_ready; 
  wire  axi4yank_1_auto_in_w_valid; 
  wire [31:0] axi4yank_1_auto_in_w_bits_data; 
  wire [3:0] axi4yank_1_auto_in_w_bits_strb; 
  wire  axi4yank_1_auto_in_b_ready; 
  wire  axi4yank_1_auto_in_b_valid; 
  wire [1:0] axi4yank_1_auto_in_b_bits_resp; 
  wire [13:0] axi4yank_1_auto_in_b_bits_user; 
  wire  axi4yank_1_auto_in_ar_ready; 
  wire  axi4yank_1_auto_in_ar_valid; 
  wire [37:0] axi4yank_1_auto_in_ar_bits_addr; 
  wire [13:0] axi4yank_1_auto_in_ar_bits_user; 
  wire  axi4yank_1_auto_in_r_ready; 
  wire  axi4yank_1_auto_in_r_valid; 
  wire [31:0] axi4yank_1_auto_in_r_bits_data; 
  wire [1:0] axi4yank_1_auto_in_r_bits_resp; 
  wire [13:0] axi4yank_1_auto_in_r_bits_user; 
  wire  axi4yank_1_auto_in_r_bits_last; 
  wire  axi4yank_1_auto_out_aw_ready; 
  wire  axi4yank_1_auto_out_aw_valid; 
  wire [37:0] axi4yank_1_auto_out_aw_bits_addr; 
  wire  axi4yank_1_auto_out_w_ready; 
  wire  axi4yank_1_auto_out_w_valid; 
  wire [31:0] axi4yank_1_auto_out_w_bits_data; 
  wire [3:0] axi4yank_1_auto_out_w_bits_strb; 
  wire  axi4yank_1_auto_out_b_ready; 
  wire  axi4yank_1_auto_out_b_valid; 
  wire [1:0] axi4yank_1_auto_out_b_bits_resp; 
  wire  axi4yank_1_auto_out_ar_ready; 
  wire  axi4yank_1_auto_out_ar_valid; 
  wire [37:0] axi4yank_1_auto_out_ar_bits_addr; 
  wire  axi4yank_1_auto_out_r_ready; 
  wire  axi4yank_1_auto_out_r_valid; 
  wire [31:0] axi4yank_1_auto_out_r_bits_data; 
  wire [1:0] axi4yank_1_auto_out_r_bits_resp; 
  wire  axi4yank_1_auto_out_r_bits_last; 
  wire  tl2axi4_1_clock; 
  wire  tl2axi4_1_reset; 
  wire  tl2axi4_1_auto_in_a_ready; 
  wire  tl2axi4_1_auto_in_a_valid; 
  wire [2:0] tl2axi4_1_auto_in_a_bits_opcode; 
  wire [2:0] tl2axi4_1_auto_in_a_bits_param; 
  wire [1:0] tl2axi4_1_auto_in_a_bits_size; 
  wire [9:0] tl2axi4_1_auto_in_a_bits_source; 
  wire [37:0] tl2axi4_1_auto_in_a_bits_address; 
  wire [3:0] tl2axi4_1_auto_in_a_bits_mask; 
  wire [31:0] tl2axi4_1_auto_in_a_bits_data; 
  wire  tl2axi4_1_auto_in_a_bits_corrupt; 
  wire  tl2axi4_1_auto_in_d_ready; 
  wire  tl2axi4_1_auto_in_d_valid; 
  wire [2:0] tl2axi4_1_auto_in_d_bits_opcode; 
  wire [1:0] tl2axi4_1_auto_in_d_bits_size; 
  wire [9:0] tl2axi4_1_auto_in_d_bits_source; 
  wire  tl2axi4_1_auto_in_d_bits_denied; 
  wire [31:0] tl2axi4_1_auto_in_d_bits_data; 
  wire  tl2axi4_1_auto_in_d_bits_corrupt; 
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
  wire  fragmenter_clock; 
  wire  fragmenter_reset; 
  wire  fragmenter_auto_in_a_ready; 
  wire  fragmenter_auto_in_a_valid; 
  wire [2:0] fragmenter_auto_in_a_bits_opcode; 
  wire [2:0] fragmenter_auto_in_a_bits_param; 
  wire [2:0] fragmenter_auto_in_a_bits_size; 
  wire [4:0] fragmenter_auto_in_a_bits_source; 
  wire [37:0] fragmenter_auto_in_a_bits_address; 
  wire [3:0] fragmenter_auto_in_a_bits_mask; 
  wire [31:0] fragmenter_auto_in_a_bits_data; 
  wire  fragmenter_auto_in_a_bits_corrupt; 
  wire  fragmenter_auto_in_d_ready; 
  wire  fragmenter_auto_in_d_valid; 
  wire [2:0] fragmenter_auto_in_d_bits_opcode; 
  wire [2:0] fragmenter_auto_in_d_bits_size; 
  wire [4:0] fragmenter_auto_in_d_bits_source; 
  wire  fragmenter_auto_in_d_bits_denied; 
  wire [31:0] fragmenter_auto_in_d_bits_data; 
  wire  fragmenter_auto_in_d_bits_corrupt; 
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
  wire  widget_clock; 
  wire  widget_reset; 
  wire  widget_auto_in_a_ready; 
  wire  widget_auto_in_a_valid; 
  wire [2:0] widget_auto_in_a_bits_opcode; 
  wire [2:0] widget_auto_in_a_bits_param; 
  wire [2:0] widget_auto_in_a_bits_size; 
  wire [3:0] widget_auto_in_a_bits_source; 
  wire [37:0] widget_auto_in_a_bits_address; 
  wire [7:0] widget_auto_in_a_bits_mask; 
  wire [63:0] widget_auto_in_a_bits_data; 
  wire  widget_auto_in_a_bits_corrupt; 
  wire  widget_auto_in_d_ready; 
  wire  widget_auto_in_d_valid; 
  wire [2:0] widget_auto_in_d_bits_opcode; 
  wire [2:0] widget_auto_in_d_bits_size; 
  wire  widget_auto_in_d_bits_denied; 
  wire [63:0] widget_auto_in_d_bits_data; 
  wire  widget_auto_in_d_bits_corrupt; 
  wire  widget_auto_out_a_ready; 
  wire  widget_auto_out_a_valid; 
  wire [2:0] widget_auto_out_a_bits_opcode; 
  wire [2:0] widget_auto_out_a_bits_param; 
  wire [2:0] widget_auto_out_a_bits_size; 
  wire [3:0] widget_auto_out_a_bits_source; 
  wire [37:0] widget_auto_out_a_bits_address; 
  wire [7:0] widget_auto_out_a_bits_mask; 
  wire [63:0] widget_auto_out_a_bits_data; 
  wire  widget_auto_out_a_bits_corrupt; 
  wire  widget_auto_out_d_ready; 
  wire  widget_auto_out_d_valid; 
  wire [2:0] widget_auto_out_d_bits_opcode; 
  wire [1:0] widget_auto_out_d_bits_param; 
  wire [2:0] widget_auto_out_d_bits_size; 
  wire [3:0] widget_auto_out_d_bits_source; 
  wire [2:0] widget_auto_out_d_bits_sink; 
  wire  widget_auto_out_d_bits_denied; 
  wire [63:0] widget_auto_out_d_bits_data; 
  wire  widget_auto_out_d_bits_corrupt; 
  wire  axi42tl_clock; 
  wire  axi42tl_reset; 
  wire  axi42tl_auto_in_aw_ready; 
  wire  axi42tl_auto_in_aw_valid; 
  wire  axi42tl_auto_in_aw_bits_id; 
  wire [37:0] axi42tl_auto_in_aw_bits_addr; 
  wire [7:0] axi42tl_auto_in_aw_bits_len; 
  wire [2:0] axi42tl_auto_in_aw_bits_size; 
  wire  axi42tl_auto_in_w_ready; 
  wire  axi42tl_auto_in_w_valid; 
  wire [63:0] axi42tl_auto_in_w_bits_data; 
  wire [7:0] axi42tl_auto_in_w_bits_strb; 
  wire  axi42tl_auto_in_w_bits_last; 
  wire  axi42tl_auto_in_b_ready; 
  wire  axi42tl_auto_in_b_valid; 
  wire [1:0] axi42tl_auto_in_b_bits_resp; 
  wire  axi42tl_auto_in_ar_ready; 
  wire  axi42tl_auto_in_ar_valid; 
  wire  axi42tl_auto_in_ar_bits_id; 
  wire [37:0] axi42tl_auto_in_ar_bits_addr; 
  wire [7:0] axi42tl_auto_in_ar_bits_len; 
  wire [2:0] axi42tl_auto_in_ar_bits_size; 
  wire  axi42tl_auto_in_r_ready; 
  wire  axi42tl_auto_in_r_valid; 
  wire [63:0] axi42tl_auto_in_r_bits_data; 
  wire [1:0] axi42tl_auto_in_r_bits_resp; 
  wire  axi42tl_auto_in_r_bits_last; 
  wire  axi42tl_auto_out_a_ready; 
  wire  axi42tl_auto_out_a_valid; 
  wire [2:0] axi42tl_auto_out_a_bits_opcode; 
  wire [2:0] axi42tl_auto_out_a_bits_param; 
  wire [2:0] axi42tl_auto_out_a_bits_size; 
  wire [3:0] axi42tl_auto_out_a_bits_source; 
  wire [37:0] axi42tl_auto_out_a_bits_address; 
  wire [7:0] axi42tl_auto_out_a_bits_mask; 
  wire [63:0] axi42tl_auto_out_a_bits_data; 
  wire  axi42tl_auto_out_a_bits_corrupt; 
  wire  axi42tl_auto_out_d_ready; 
  wire  axi42tl_auto_out_d_valid; 
  wire [2:0] axi42tl_auto_out_d_bits_opcode; 
  wire [2:0] axi42tl_auto_out_d_bits_size; 
  wire  axi42tl_auto_out_d_bits_denied; 
  wire [63:0] axi42tl_auto_out_d_bits_data; 
  wire  axi42tl_auto_out_d_bits_corrupt; 
  wire  axi4yank_2_clock; 
  wire  axi4yank_2_reset; 
  wire  axi4yank_2_auto_in_aw_ready; 
  wire  axi4yank_2_auto_in_aw_valid; 
  wire  axi4yank_2_auto_in_aw_bits_id; 
  wire [37:0] axi4yank_2_auto_in_aw_bits_addr; 
  wire [7:0] axi4yank_2_auto_in_aw_bits_len; 
  wire [2:0] axi4yank_2_auto_in_aw_bits_size; 
  wire  axi4yank_2_auto_in_aw_bits_user; 
  wire  axi4yank_2_auto_in_w_ready; 
  wire  axi4yank_2_auto_in_w_valid; 
  wire [63:0] axi4yank_2_auto_in_w_bits_data; 
  wire [7:0] axi4yank_2_auto_in_w_bits_strb; 
  wire  axi4yank_2_auto_in_w_bits_last; 
  wire  axi4yank_2_auto_in_b_ready; 
  wire  axi4yank_2_auto_in_b_valid; 
  wire [1:0] axi4yank_2_auto_in_b_bits_resp; 
  wire  axi4yank_2_auto_in_b_bits_user; 
  wire  axi4yank_2_auto_in_ar_ready; 
  wire  axi4yank_2_auto_in_ar_valid; 
  wire  axi4yank_2_auto_in_ar_bits_id; 
  wire [37:0] axi4yank_2_auto_in_ar_bits_addr; 
  wire [7:0] axi4yank_2_auto_in_ar_bits_len; 
  wire [2:0] axi4yank_2_auto_in_ar_bits_size; 
  wire  axi4yank_2_auto_in_ar_bits_user; 
  wire  axi4yank_2_auto_in_r_ready; 
  wire  axi4yank_2_auto_in_r_valid; 
  wire [63:0] axi4yank_2_auto_in_r_bits_data; 
  wire [1:0] axi4yank_2_auto_in_r_bits_resp; 
  wire  axi4yank_2_auto_in_r_bits_user; 
  wire  axi4yank_2_auto_in_r_bits_last; 
  wire  axi4yank_2_auto_out_aw_ready; 
  wire  axi4yank_2_auto_out_aw_valid; 
  wire  axi4yank_2_auto_out_aw_bits_id; 
  wire [37:0] axi4yank_2_auto_out_aw_bits_addr; 
  wire [7:0] axi4yank_2_auto_out_aw_bits_len; 
  wire [2:0] axi4yank_2_auto_out_aw_bits_size; 
  wire  axi4yank_2_auto_out_w_ready; 
  wire  axi4yank_2_auto_out_w_valid; 
  wire [63:0] axi4yank_2_auto_out_w_bits_data; 
  wire [7:0] axi4yank_2_auto_out_w_bits_strb; 
  wire  axi4yank_2_auto_out_w_bits_last; 
  wire  axi4yank_2_auto_out_b_ready; 
  wire  axi4yank_2_auto_out_b_valid; 
  wire [1:0] axi4yank_2_auto_out_b_bits_resp; 
  wire  axi4yank_2_auto_out_ar_ready; 
  wire  axi4yank_2_auto_out_ar_valid; 
  wire  axi4yank_2_auto_out_ar_bits_id; 
  wire [37:0] axi4yank_2_auto_out_ar_bits_addr; 
  wire [7:0] axi4yank_2_auto_out_ar_bits_len; 
  wire [2:0] axi4yank_2_auto_out_ar_bits_size; 
  wire  axi4yank_2_auto_out_r_ready; 
  wire  axi4yank_2_auto_out_r_valid; 
  wire [63:0] axi4yank_2_auto_out_r_bits_data; 
  wire [1:0] axi4yank_2_auto_out_r_bits_resp; 
  wire  axi4yank_2_auto_out_r_bits_last; 
  wire  axi4frag_clock; 
  wire  axi4frag_reset; 
  wire  axi4frag_auto_in_aw_ready; 
  wire  axi4frag_auto_in_aw_valid; 
  wire [37:0] axi4frag_auto_in_aw_bits_addr; 
  wire [7:0] axi4frag_auto_in_aw_bits_len; 
  wire [2:0] axi4frag_auto_in_aw_bits_size; 
  wire [1:0] axi4frag_auto_in_aw_bits_burst; 
  wire  axi4frag_auto_in_w_ready; 
  wire  axi4frag_auto_in_w_valid; 
  wire [63:0] axi4frag_auto_in_w_bits_data; 
  wire [7:0] axi4frag_auto_in_w_bits_strb; 
  wire  axi4frag_auto_in_w_bits_last; 
  wire  axi4frag_auto_in_b_ready; 
  wire  axi4frag_auto_in_b_valid; 
  wire [1:0] axi4frag_auto_in_b_bits_resp; 
  wire  axi4frag_auto_in_ar_ready; 
  wire  axi4frag_auto_in_ar_valid; 
  wire [37:0] axi4frag_auto_in_ar_bits_addr; 
  wire [7:0] axi4frag_auto_in_ar_bits_len; 
  wire [2:0] axi4frag_auto_in_ar_bits_size; 
  wire [1:0] axi4frag_auto_in_ar_bits_burst; 
  wire  axi4frag_auto_in_r_ready; 
  wire  axi4frag_auto_in_r_valid; 
  wire [63:0] axi4frag_auto_in_r_bits_data; 
  wire [1:0] axi4frag_auto_in_r_bits_resp; 
  wire  axi4frag_auto_in_r_bits_last; 
  wire  axi4frag_auto_out_aw_ready; 
  wire  axi4frag_auto_out_aw_valid; 
  wire  axi4frag_auto_out_aw_bits_id; 
  wire [37:0] axi4frag_auto_out_aw_bits_addr; 
  wire [7:0] axi4frag_auto_out_aw_bits_len; 
  wire [2:0] axi4frag_auto_out_aw_bits_size; 
  wire  axi4frag_auto_out_aw_bits_user; 
  wire  axi4frag_auto_out_w_ready; 
  wire  axi4frag_auto_out_w_valid; 
  wire [63:0] axi4frag_auto_out_w_bits_data; 
  wire [7:0] axi4frag_auto_out_w_bits_strb; 
  wire  axi4frag_auto_out_w_bits_last; 
  wire  axi4frag_auto_out_b_ready; 
  wire  axi4frag_auto_out_b_valid; 
  wire [1:0] axi4frag_auto_out_b_bits_resp; 
  wire  axi4frag_auto_out_b_bits_user; 
  wire  axi4frag_auto_out_ar_ready; 
  wire  axi4frag_auto_out_ar_valid; 
  wire  axi4frag_auto_out_ar_bits_id; 
  wire [37:0] axi4frag_auto_out_ar_bits_addr; 
  wire [7:0] axi4frag_auto_out_ar_bits_len; 
  wire [2:0] axi4frag_auto_out_ar_bits_size; 
  wire  axi4frag_auto_out_ar_bits_user; 
  wire  axi4frag_auto_out_r_ready; 
  wire  axi4frag_auto_out_r_valid; 
  wire [63:0] axi4frag_auto_out_r_bits_data; 
  wire [1:0] axi4frag_auto_out_r_bits_resp; 
  wire  axi4frag_auto_out_r_bits_user; 
  wire  axi4frag_auto_out_r_bits_last; 
  wire  asink_clock; 
  wire  asink_reset; 
  wire [2:0] asink_auto_in_a_mem_0_opcode; 
  wire [2:0] asink_auto_in_a_mem_0_param; 
  wire [2:0] asink_auto_in_a_mem_0_size; 
  wire [4:0] asink_auto_in_a_mem_0_source; 
  wire [30:0] asink_auto_in_a_mem_0_address; 
  wire [7:0] asink_auto_in_a_mem_0_mask; 
  wire [63:0] asink_auto_in_a_mem_0_data; 
  wire  asink_auto_in_a_mem_0_corrupt; 
  wire [2:0] asink_auto_in_a_mem_1_opcode; 
  wire [2:0] asink_auto_in_a_mem_1_param; 
  wire [2:0] asink_auto_in_a_mem_1_size; 
  wire [4:0] asink_auto_in_a_mem_1_source; 
  wire [30:0] asink_auto_in_a_mem_1_address; 
  wire [7:0] asink_auto_in_a_mem_1_mask; 
  wire [63:0] asink_auto_in_a_mem_1_data; 
  wire  asink_auto_in_a_mem_1_corrupt; 
  wire [2:0] asink_auto_in_a_mem_2_opcode; 
  wire [2:0] asink_auto_in_a_mem_2_param; 
  wire [2:0] asink_auto_in_a_mem_2_size; 
  wire [4:0] asink_auto_in_a_mem_2_source; 
  wire [30:0] asink_auto_in_a_mem_2_address; 
  wire [7:0] asink_auto_in_a_mem_2_mask; 
  wire [63:0] asink_auto_in_a_mem_2_data; 
  wire  asink_auto_in_a_mem_2_corrupt; 
  wire [2:0] asink_auto_in_a_mem_3_opcode; 
  wire [2:0] asink_auto_in_a_mem_3_param; 
  wire [2:0] asink_auto_in_a_mem_3_size; 
  wire [4:0] asink_auto_in_a_mem_3_source; 
  wire [30:0] asink_auto_in_a_mem_3_address; 
  wire [7:0] asink_auto_in_a_mem_3_mask; 
  wire [63:0] asink_auto_in_a_mem_3_data; 
  wire  asink_auto_in_a_mem_3_corrupt; 
  wire [2:0] asink_auto_in_a_mem_4_opcode; 
  wire [2:0] asink_auto_in_a_mem_4_param; 
  wire [2:0] asink_auto_in_a_mem_4_size; 
  wire [4:0] asink_auto_in_a_mem_4_source; 
  wire [30:0] asink_auto_in_a_mem_4_address; 
  wire [7:0] asink_auto_in_a_mem_4_mask; 
  wire [63:0] asink_auto_in_a_mem_4_data; 
  wire  asink_auto_in_a_mem_4_corrupt; 
  wire [2:0] asink_auto_in_a_mem_5_opcode; 
  wire [2:0] asink_auto_in_a_mem_5_param; 
  wire [2:0] asink_auto_in_a_mem_5_size; 
  wire [4:0] asink_auto_in_a_mem_5_source; 
  wire [30:0] asink_auto_in_a_mem_5_address; 
  wire [7:0] asink_auto_in_a_mem_5_mask; 
  wire [63:0] asink_auto_in_a_mem_5_data; 
  wire  asink_auto_in_a_mem_5_corrupt; 
  wire [2:0] asink_auto_in_a_mem_6_opcode; 
  wire [2:0] asink_auto_in_a_mem_6_param; 
  wire [2:0] asink_auto_in_a_mem_6_size; 
  wire [4:0] asink_auto_in_a_mem_6_source; 
  wire [30:0] asink_auto_in_a_mem_6_address; 
  wire [7:0] asink_auto_in_a_mem_6_mask; 
  wire [63:0] asink_auto_in_a_mem_6_data; 
  wire  asink_auto_in_a_mem_6_corrupt; 
  wire [2:0] asink_auto_in_a_mem_7_opcode; 
  wire [2:0] asink_auto_in_a_mem_7_param; 
  wire [2:0] asink_auto_in_a_mem_7_size; 
  wire [4:0] asink_auto_in_a_mem_7_source; 
  wire [30:0] asink_auto_in_a_mem_7_address; 
  wire [7:0] asink_auto_in_a_mem_7_mask; 
  wire [63:0] asink_auto_in_a_mem_7_data; 
  wire  asink_auto_in_a_mem_7_corrupt; 
  wire [3:0] asink_auto_in_a_ridx; 
  wire [3:0] asink_auto_in_a_widx; 
  wire  asink_auto_in_a_safe_ridx_valid; 
  wire  asink_auto_in_a_safe_widx_valid; 
  wire  asink_auto_in_a_safe_source_reset_n; 
  wire  asink_auto_in_a_safe_sink_reset_n; 
  wire [2:0] asink_auto_in_d_mem_0_opcode; 
  wire [1:0] asink_auto_in_d_mem_0_param; 
  wire [2:0] asink_auto_in_d_mem_0_size; 
  wire [4:0] asink_auto_in_d_mem_0_source; 
  wire  asink_auto_in_d_mem_0_sink; 
  wire  asink_auto_in_d_mem_0_denied; 
  wire [63:0] asink_auto_in_d_mem_0_data; 
  wire  asink_auto_in_d_mem_0_corrupt; 
  wire [2:0] asink_auto_in_d_mem_1_opcode; 
  wire [1:0] asink_auto_in_d_mem_1_param; 
  wire [2:0] asink_auto_in_d_mem_1_size; 
  wire [4:0] asink_auto_in_d_mem_1_source; 
  wire  asink_auto_in_d_mem_1_sink; 
  wire  asink_auto_in_d_mem_1_denied; 
  wire [63:0] asink_auto_in_d_mem_1_data; 
  wire  asink_auto_in_d_mem_1_corrupt; 
  wire [2:0] asink_auto_in_d_mem_2_opcode; 
  wire [1:0] asink_auto_in_d_mem_2_param; 
  wire [2:0] asink_auto_in_d_mem_2_size; 
  wire [4:0] asink_auto_in_d_mem_2_source; 
  wire  asink_auto_in_d_mem_2_sink; 
  wire  asink_auto_in_d_mem_2_denied; 
  wire [63:0] asink_auto_in_d_mem_2_data; 
  wire  asink_auto_in_d_mem_2_corrupt; 
  wire [2:0] asink_auto_in_d_mem_3_opcode; 
  wire [1:0] asink_auto_in_d_mem_3_param; 
  wire [2:0] asink_auto_in_d_mem_3_size; 
  wire [4:0] asink_auto_in_d_mem_3_source; 
  wire  asink_auto_in_d_mem_3_sink; 
  wire  asink_auto_in_d_mem_3_denied; 
  wire [63:0] asink_auto_in_d_mem_3_data; 
  wire  asink_auto_in_d_mem_3_corrupt; 
  wire [2:0] asink_auto_in_d_mem_4_opcode; 
  wire [1:0] asink_auto_in_d_mem_4_param; 
  wire [2:0] asink_auto_in_d_mem_4_size; 
  wire [4:0] asink_auto_in_d_mem_4_source; 
  wire  asink_auto_in_d_mem_4_sink; 
  wire  asink_auto_in_d_mem_4_denied; 
  wire [63:0] asink_auto_in_d_mem_4_data; 
  wire  asink_auto_in_d_mem_4_corrupt; 
  wire [2:0] asink_auto_in_d_mem_5_opcode; 
  wire [1:0] asink_auto_in_d_mem_5_param; 
  wire [2:0] asink_auto_in_d_mem_5_size; 
  wire [4:0] asink_auto_in_d_mem_5_source; 
  wire  asink_auto_in_d_mem_5_sink; 
  wire  asink_auto_in_d_mem_5_denied; 
  wire [63:0] asink_auto_in_d_mem_5_data; 
  wire  asink_auto_in_d_mem_5_corrupt; 
  wire [2:0] asink_auto_in_d_mem_6_opcode; 
  wire [1:0] asink_auto_in_d_mem_6_param; 
  wire [2:0] asink_auto_in_d_mem_6_size; 
  wire [4:0] asink_auto_in_d_mem_6_source; 
  wire  asink_auto_in_d_mem_6_sink; 
  wire  asink_auto_in_d_mem_6_denied; 
  wire [63:0] asink_auto_in_d_mem_6_data; 
  wire  asink_auto_in_d_mem_6_corrupt; 
  wire [2:0] asink_auto_in_d_mem_7_opcode; 
  wire [1:0] asink_auto_in_d_mem_7_param; 
  wire [2:0] asink_auto_in_d_mem_7_size; 
  wire [4:0] asink_auto_in_d_mem_7_source; 
  wire  asink_auto_in_d_mem_7_sink; 
  wire  asink_auto_in_d_mem_7_denied; 
  wire [63:0] asink_auto_in_d_mem_7_data; 
  wire  asink_auto_in_d_mem_7_corrupt; 
  wire [3:0] asink_auto_in_d_ridx; 
  wire [3:0] asink_auto_in_d_widx; 
  wire  asink_auto_in_d_safe_ridx_valid; 
  wire  asink_auto_in_d_safe_widx_valid; 
  wire  asink_auto_in_d_safe_source_reset_n; 
  wire  asink_auto_in_d_safe_sink_reset_n; 
  wire  asink_auto_out_a_ready; 
  wire  asink_auto_out_a_valid; 
  wire [2:0] asink_auto_out_a_bits_opcode; 
  wire [2:0] asink_auto_out_a_bits_param; 
  wire [2:0] asink_auto_out_a_bits_size; 
  wire [4:0] asink_auto_out_a_bits_source; 
  wire [30:0] asink_auto_out_a_bits_address; 
  wire [7:0] asink_auto_out_a_bits_mask; 
  wire [63:0] asink_auto_out_a_bits_data; 
  wire  asink_auto_out_a_bits_corrupt; 
  wire  asink_auto_out_d_ready; 
  wire  asink_auto_out_d_valid; 
  wire [2:0] asink_auto_out_d_bits_opcode; 
  wire [2:0] asink_auto_out_d_bits_size; 
  wire [4:0] asink_auto_out_d_bits_source; 
  wire  asink_auto_out_d_bits_denied; 
  wire [63:0] asink_auto_out_d_bits_data; 
  wire  asink_auto_out_d_bits_corrupt; 
  wire  asink_1_clock; 
  wire  asink_1_reset; 
  wire [2:0] asink_1_auto_in_a_mem_0_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_0_param; 
  wire [2:0] asink_1_auto_in_a_mem_0_size; 
  wire [4:0] asink_1_auto_in_a_mem_0_source; 
  wire [37:0] asink_1_auto_in_a_mem_0_address; 
  wire [3:0] asink_1_auto_in_a_mem_0_mask; 
  wire [31:0] asink_1_auto_in_a_mem_0_data; 
  wire  asink_1_auto_in_a_mem_0_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_1_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_1_param; 
  wire [2:0] asink_1_auto_in_a_mem_1_size; 
  wire [4:0] asink_1_auto_in_a_mem_1_source; 
  wire [37:0] asink_1_auto_in_a_mem_1_address; 
  wire [3:0] asink_1_auto_in_a_mem_1_mask; 
  wire [31:0] asink_1_auto_in_a_mem_1_data; 
  wire  asink_1_auto_in_a_mem_1_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_2_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_2_param; 
  wire [2:0] asink_1_auto_in_a_mem_2_size; 
  wire [4:0] asink_1_auto_in_a_mem_2_source; 
  wire [37:0] asink_1_auto_in_a_mem_2_address; 
  wire [3:0] asink_1_auto_in_a_mem_2_mask; 
  wire [31:0] asink_1_auto_in_a_mem_2_data; 
  wire  asink_1_auto_in_a_mem_2_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_3_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_3_param; 
  wire [2:0] asink_1_auto_in_a_mem_3_size; 
  wire [4:0] asink_1_auto_in_a_mem_3_source; 
  wire [37:0] asink_1_auto_in_a_mem_3_address; 
  wire [3:0] asink_1_auto_in_a_mem_3_mask; 
  wire [31:0] asink_1_auto_in_a_mem_3_data; 
  wire  asink_1_auto_in_a_mem_3_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_4_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_4_param; 
  wire [2:0] asink_1_auto_in_a_mem_4_size; 
  wire [4:0] asink_1_auto_in_a_mem_4_source; 
  wire [37:0] asink_1_auto_in_a_mem_4_address; 
  wire [3:0] asink_1_auto_in_a_mem_4_mask; 
  wire [31:0] asink_1_auto_in_a_mem_4_data; 
  wire  asink_1_auto_in_a_mem_4_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_5_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_5_param; 
  wire [2:0] asink_1_auto_in_a_mem_5_size; 
  wire [4:0] asink_1_auto_in_a_mem_5_source; 
  wire [37:0] asink_1_auto_in_a_mem_5_address; 
  wire [3:0] asink_1_auto_in_a_mem_5_mask; 
  wire [31:0] asink_1_auto_in_a_mem_5_data; 
  wire  asink_1_auto_in_a_mem_5_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_6_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_6_param; 
  wire [2:0] asink_1_auto_in_a_mem_6_size; 
  wire [4:0] asink_1_auto_in_a_mem_6_source; 
  wire [37:0] asink_1_auto_in_a_mem_6_address; 
  wire [3:0] asink_1_auto_in_a_mem_6_mask; 
  wire [31:0] asink_1_auto_in_a_mem_6_data; 
  wire  asink_1_auto_in_a_mem_6_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_7_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_7_param; 
  wire [2:0] asink_1_auto_in_a_mem_7_size; 
  wire [4:0] asink_1_auto_in_a_mem_7_source; 
  wire [37:0] asink_1_auto_in_a_mem_7_address; 
  wire [3:0] asink_1_auto_in_a_mem_7_mask; 
  wire [31:0] asink_1_auto_in_a_mem_7_data; 
  wire  asink_1_auto_in_a_mem_7_corrupt; 
  wire [3:0] asink_1_auto_in_a_ridx; 
  wire [3:0] asink_1_auto_in_a_widx; 
  wire  asink_1_auto_in_a_safe_ridx_valid; 
  wire  asink_1_auto_in_a_safe_widx_valid; 
  wire  asink_1_auto_in_a_safe_source_reset_n; 
  wire  asink_1_auto_in_a_safe_sink_reset_n; 
  wire [2:0] asink_1_auto_in_d_mem_0_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_0_param; 
  wire [2:0] asink_1_auto_in_d_mem_0_size; 
  wire [4:0] asink_1_auto_in_d_mem_0_source; 
  wire  asink_1_auto_in_d_mem_0_sink; 
  wire  asink_1_auto_in_d_mem_0_denied; 
  wire [31:0] asink_1_auto_in_d_mem_0_data; 
  wire  asink_1_auto_in_d_mem_0_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_1_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_1_param; 
  wire [2:0] asink_1_auto_in_d_mem_1_size; 
  wire [4:0] asink_1_auto_in_d_mem_1_source; 
  wire  asink_1_auto_in_d_mem_1_sink; 
  wire  asink_1_auto_in_d_mem_1_denied; 
  wire [31:0] asink_1_auto_in_d_mem_1_data; 
  wire  asink_1_auto_in_d_mem_1_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_2_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_2_param; 
  wire [2:0] asink_1_auto_in_d_mem_2_size; 
  wire [4:0] asink_1_auto_in_d_mem_2_source; 
  wire  asink_1_auto_in_d_mem_2_sink; 
  wire  asink_1_auto_in_d_mem_2_denied; 
  wire [31:0] asink_1_auto_in_d_mem_2_data; 
  wire  asink_1_auto_in_d_mem_2_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_3_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_3_param; 
  wire [2:0] asink_1_auto_in_d_mem_3_size; 
  wire [4:0] asink_1_auto_in_d_mem_3_source; 
  wire  asink_1_auto_in_d_mem_3_sink; 
  wire  asink_1_auto_in_d_mem_3_denied; 
  wire [31:0] asink_1_auto_in_d_mem_3_data; 
  wire  asink_1_auto_in_d_mem_3_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_4_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_4_param; 
  wire [2:0] asink_1_auto_in_d_mem_4_size; 
  wire [4:0] asink_1_auto_in_d_mem_4_source; 
  wire  asink_1_auto_in_d_mem_4_sink; 
  wire  asink_1_auto_in_d_mem_4_denied; 
  wire [31:0] asink_1_auto_in_d_mem_4_data; 
  wire  asink_1_auto_in_d_mem_4_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_5_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_5_param; 
  wire [2:0] asink_1_auto_in_d_mem_5_size; 
  wire [4:0] asink_1_auto_in_d_mem_5_source; 
  wire  asink_1_auto_in_d_mem_5_sink; 
  wire  asink_1_auto_in_d_mem_5_denied; 
  wire [31:0] asink_1_auto_in_d_mem_5_data; 
  wire  asink_1_auto_in_d_mem_5_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_6_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_6_param; 
  wire [2:0] asink_1_auto_in_d_mem_6_size; 
  wire [4:0] asink_1_auto_in_d_mem_6_source; 
  wire  asink_1_auto_in_d_mem_6_sink; 
  wire  asink_1_auto_in_d_mem_6_denied; 
  wire [31:0] asink_1_auto_in_d_mem_6_data; 
  wire  asink_1_auto_in_d_mem_6_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_7_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_7_param; 
  wire [2:0] asink_1_auto_in_d_mem_7_size; 
  wire [4:0] asink_1_auto_in_d_mem_7_source; 
  wire  asink_1_auto_in_d_mem_7_sink; 
  wire  asink_1_auto_in_d_mem_7_denied; 
  wire [31:0] asink_1_auto_in_d_mem_7_data; 
  wire  asink_1_auto_in_d_mem_7_corrupt; 
  wire [3:0] asink_1_auto_in_d_ridx; 
  wire [3:0] asink_1_auto_in_d_widx; 
  wire  asink_1_auto_in_d_safe_ridx_valid; 
  wire  asink_1_auto_in_d_safe_widx_valid; 
  wire  asink_1_auto_in_d_safe_source_reset_n; 
  wire  asink_1_auto_in_d_safe_sink_reset_n; 
  wire  asink_1_auto_out_a_ready; 
  wire  asink_1_auto_out_a_valid; 
  wire [2:0] asink_1_auto_out_a_bits_opcode; 
  wire [2:0] asink_1_auto_out_a_bits_param; 
  wire [2:0] asink_1_auto_out_a_bits_size; 
  wire [4:0] asink_1_auto_out_a_bits_source; 
  wire [37:0] asink_1_auto_out_a_bits_address; 
  wire [3:0] asink_1_auto_out_a_bits_mask; 
  wire [31:0] asink_1_auto_out_a_bits_data; 
  wire  asink_1_auto_out_a_bits_corrupt; 
  wire  asink_1_auto_out_d_ready; 
  wire  asink_1_auto_out_d_valid; 
  wire [2:0] asink_1_auto_out_d_bits_opcode; 
  wire [2:0] asink_1_auto_out_d_bits_size; 
  wire [4:0] asink_1_auto_out_d_bits_source; 
  wire  asink_1_auto_out_d_bits_denied; 
  wire [31:0] asink_1_auto_out_d_bits_data; 
  wire  asink_1_auto_out_d_bits_corrupt; 
  wire  asource_clock; 
  wire  asource_reset; 
  wire  asource_auto_in_a_ready; 
  wire  asource_auto_in_a_valid; 
  wire [2:0] asource_auto_in_a_bits_opcode; 
  wire [2:0] asource_auto_in_a_bits_param; 
  wire [2:0] asource_auto_in_a_bits_size; 
  wire [3:0] asource_auto_in_a_bits_source; 
  wire [37:0] asource_auto_in_a_bits_address; 
  wire [7:0] asource_auto_in_a_bits_mask; 
  wire [63:0] asource_auto_in_a_bits_data; 
  wire  asource_auto_in_a_bits_corrupt; 
  wire  asource_auto_in_d_ready; 
  wire  asource_auto_in_d_valid; 
  wire [2:0] asource_auto_in_d_bits_opcode; 
  wire [1:0] asource_auto_in_d_bits_param; 
  wire [2:0] asource_auto_in_d_bits_size; 
  wire [3:0] asource_auto_in_d_bits_source; 
  wire [2:0] asource_auto_in_d_bits_sink; 
  wire  asource_auto_in_d_bits_denied; 
  wire [63:0] asource_auto_in_d_bits_data; 
  wire  asource_auto_in_d_bits_corrupt; 
  wire [2:0] asource_auto_out_a_mem_0_opcode; 
  wire [2:0] asource_auto_out_a_mem_0_param; 
  wire [2:0] asource_auto_out_a_mem_0_size; 
  wire [3:0] asource_auto_out_a_mem_0_source; 
  wire [37:0] asource_auto_out_a_mem_0_address; 
  wire [7:0] asource_auto_out_a_mem_0_mask; 
  wire [63:0] asource_auto_out_a_mem_0_data; 
  wire  asource_auto_out_a_mem_0_corrupt; 
  wire [2:0] asource_auto_out_a_mem_1_opcode; 
  wire [2:0] asource_auto_out_a_mem_1_param; 
  wire [2:0] asource_auto_out_a_mem_1_size; 
  wire [3:0] asource_auto_out_a_mem_1_source; 
  wire [37:0] asource_auto_out_a_mem_1_address; 
  wire [7:0] asource_auto_out_a_mem_1_mask; 
  wire [63:0] asource_auto_out_a_mem_1_data; 
  wire  asource_auto_out_a_mem_1_corrupt; 
  wire [2:0] asource_auto_out_a_mem_2_opcode; 
  wire [2:0] asource_auto_out_a_mem_2_param; 
  wire [2:0] asource_auto_out_a_mem_2_size; 
  wire [3:0] asource_auto_out_a_mem_2_source; 
  wire [37:0] asource_auto_out_a_mem_2_address; 
  wire [7:0] asource_auto_out_a_mem_2_mask; 
  wire [63:0] asource_auto_out_a_mem_2_data; 
  wire  asource_auto_out_a_mem_2_corrupt; 
  wire [2:0] asource_auto_out_a_mem_3_opcode; 
  wire [2:0] asource_auto_out_a_mem_3_param; 
  wire [2:0] asource_auto_out_a_mem_3_size; 
  wire [3:0] asource_auto_out_a_mem_3_source; 
  wire [37:0] asource_auto_out_a_mem_3_address; 
  wire [7:0] asource_auto_out_a_mem_3_mask; 
  wire [63:0] asource_auto_out_a_mem_3_data; 
  wire  asource_auto_out_a_mem_3_corrupt; 
  wire [2:0] asource_auto_out_a_mem_4_opcode; 
  wire [2:0] asource_auto_out_a_mem_4_param; 
  wire [2:0] asource_auto_out_a_mem_4_size; 
  wire [3:0] asource_auto_out_a_mem_4_source; 
  wire [37:0] asource_auto_out_a_mem_4_address; 
  wire [7:0] asource_auto_out_a_mem_4_mask; 
  wire [63:0] asource_auto_out_a_mem_4_data; 
  wire  asource_auto_out_a_mem_4_corrupt; 
  wire [2:0] asource_auto_out_a_mem_5_opcode; 
  wire [2:0] asource_auto_out_a_mem_5_param; 
  wire [2:0] asource_auto_out_a_mem_5_size; 
  wire [3:0] asource_auto_out_a_mem_5_source; 
  wire [37:0] asource_auto_out_a_mem_5_address; 
  wire [7:0] asource_auto_out_a_mem_5_mask; 
  wire [63:0] asource_auto_out_a_mem_5_data; 
  wire  asource_auto_out_a_mem_5_corrupt; 
  wire [2:0] asource_auto_out_a_mem_6_opcode; 
  wire [2:0] asource_auto_out_a_mem_6_param; 
  wire [2:0] asource_auto_out_a_mem_6_size; 
  wire [3:0] asource_auto_out_a_mem_6_source; 
  wire [37:0] asource_auto_out_a_mem_6_address; 
  wire [7:0] asource_auto_out_a_mem_6_mask; 
  wire [63:0] asource_auto_out_a_mem_6_data; 
  wire  asource_auto_out_a_mem_6_corrupt; 
  wire [2:0] asource_auto_out_a_mem_7_opcode; 
  wire [2:0] asource_auto_out_a_mem_7_param; 
  wire [2:0] asource_auto_out_a_mem_7_size; 
  wire [3:0] asource_auto_out_a_mem_7_source; 
  wire [37:0] asource_auto_out_a_mem_7_address; 
  wire [7:0] asource_auto_out_a_mem_7_mask; 
  wire [63:0] asource_auto_out_a_mem_7_data; 
  wire  asource_auto_out_a_mem_7_corrupt; 
  wire [3:0] asource_auto_out_a_ridx; 
  wire [3:0] asource_auto_out_a_widx; 
  wire  asource_auto_out_a_safe_ridx_valid; 
  wire  asource_auto_out_a_safe_widx_valid; 
  wire  asource_auto_out_a_safe_source_reset_n; 
  wire  asource_auto_out_a_safe_sink_reset_n; 
  wire [2:0] asource_auto_out_d_mem_0_opcode; 
  wire [1:0] asource_auto_out_d_mem_0_param; 
  wire [2:0] asource_auto_out_d_mem_0_size; 
  wire [3:0] asource_auto_out_d_mem_0_source; 
  wire [2:0] asource_auto_out_d_mem_0_sink; 
  wire  asource_auto_out_d_mem_0_denied; 
  wire [63:0] asource_auto_out_d_mem_0_data; 
  wire  asource_auto_out_d_mem_0_corrupt; 
  wire [2:0] asource_auto_out_d_mem_1_opcode; 
  wire [1:0] asource_auto_out_d_mem_1_param; 
  wire [2:0] asource_auto_out_d_mem_1_size; 
  wire [3:0] asource_auto_out_d_mem_1_source; 
  wire [2:0] asource_auto_out_d_mem_1_sink; 
  wire  asource_auto_out_d_mem_1_denied; 
  wire [63:0] asource_auto_out_d_mem_1_data; 
  wire  asource_auto_out_d_mem_1_corrupt; 
  wire [2:0] asource_auto_out_d_mem_2_opcode; 
  wire [1:0] asource_auto_out_d_mem_2_param; 
  wire [2:0] asource_auto_out_d_mem_2_size; 
  wire [3:0] asource_auto_out_d_mem_2_source; 
  wire [2:0] asource_auto_out_d_mem_2_sink; 
  wire  asource_auto_out_d_mem_2_denied; 
  wire [63:0] asource_auto_out_d_mem_2_data; 
  wire  asource_auto_out_d_mem_2_corrupt; 
  wire [2:0] asource_auto_out_d_mem_3_opcode; 
  wire [1:0] asource_auto_out_d_mem_3_param; 
  wire [2:0] asource_auto_out_d_mem_3_size; 
  wire [3:0] asource_auto_out_d_mem_3_source; 
  wire [2:0] asource_auto_out_d_mem_3_sink; 
  wire  asource_auto_out_d_mem_3_denied; 
  wire [63:0] asource_auto_out_d_mem_3_data; 
  wire  asource_auto_out_d_mem_3_corrupt; 
  wire [2:0] asource_auto_out_d_mem_4_opcode; 
  wire [1:0] asource_auto_out_d_mem_4_param; 
  wire [2:0] asource_auto_out_d_mem_4_size; 
  wire [3:0] asource_auto_out_d_mem_4_source; 
  wire [2:0] asource_auto_out_d_mem_4_sink; 
  wire  asource_auto_out_d_mem_4_denied; 
  wire [63:0] asource_auto_out_d_mem_4_data; 
  wire  asource_auto_out_d_mem_4_corrupt; 
  wire [2:0] asource_auto_out_d_mem_5_opcode; 
  wire [1:0] asource_auto_out_d_mem_5_param; 
  wire [2:0] asource_auto_out_d_mem_5_size; 
  wire [3:0] asource_auto_out_d_mem_5_source; 
  wire [2:0] asource_auto_out_d_mem_5_sink; 
  wire  asource_auto_out_d_mem_5_denied; 
  wire [63:0] asource_auto_out_d_mem_5_data; 
  wire  asource_auto_out_d_mem_5_corrupt; 
  wire [2:0] asource_auto_out_d_mem_6_opcode; 
  wire [1:0] asource_auto_out_d_mem_6_param; 
  wire [2:0] asource_auto_out_d_mem_6_size; 
  wire [3:0] asource_auto_out_d_mem_6_source; 
  wire [2:0] asource_auto_out_d_mem_6_sink; 
  wire  asource_auto_out_d_mem_6_denied; 
  wire [63:0] asource_auto_out_d_mem_6_data; 
  wire  asource_auto_out_d_mem_6_corrupt; 
  wire [2:0] asource_auto_out_d_mem_7_opcode; 
  wire [1:0] asource_auto_out_d_mem_7_param; 
  wire [2:0] asource_auto_out_d_mem_7_size; 
  wire [3:0] asource_auto_out_d_mem_7_source; 
  wire [2:0] asource_auto_out_d_mem_7_sink; 
  wire  asource_auto_out_d_mem_7_denied; 
  wire [63:0] asource_auto_out_d_mem_7_data; 
  wire  asource_auto_out_d_mem_7_corrupt; 
  wire [3:0] asource_auto_out_d_ridx; 
  wire [3:0] asource_auto_out_d_widx; 
  wire  asource_auto_out_d_safe_ridx_valid; 
  wire  asource_auto_out_d_safe_widx_valid; 
  wire  asource_auto_out_d_safe_source_reset_n; 
  wire  asource_auto_out_d_safe_sink_reset_n; 
  wire  intsource_clock; 
  wire  intsource_reset; 
  wire  intsource_auto_in_0; 
  wire  intsource_auto_out_sync_0; 
  wire  ibufds_gte2_IB; 
  wire  ibufds_gte2_I; 
  wire  ibufds_gte2_CEB; 
  wire  ibufds_gte2_ODIV2; 
  wire  ibufds_gte2_O; 
  VC707AXIToPCIeX1 axi_to_pcie_x1 ( 
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
    .auto_int_out_0(axi_to_pcie_x1_auto_int_out_0),
    .auto_master_out_aw_ready(axi_to_pcie_x1_auto_master_out_aw_ready),
    .auto_master_out_aw_valid(axi_to_pcie_x1_auto_master_out_aw_valid),
    .auto_master_out_aw_bits_addr(axi_to_pcie_x1_auto_master_out_aw_bits_addr),
    .auto_master_out_aw_bits_len(axi_to_pcie_x1_auto_master_out_aw_bits_len),
    .auto_master_out_aw_bits_size(axi_to_pcie_x1_auto_master_out_aw_bits_size),
    .auto_master_out_aw_bits_burst(axi_to_pcie_x1_auto_master_out_aw_bits_burst),
    .auto_master_out_w_ready(axi_to_pcie_x1_auto_master_out_w_ready),
    .auto_master_out_w_valid(axi_to_pcie_x1_auto_master_out_w_valid),
    .auto_master_out_w_bits_data(axi_to_pcie_x1_auto_master_out_w_bits_data),
    .auto_master_out_w_bits_strb(axi_to_pcie_x1_auto_master_out_w_bits_strb),
    .auto_master_out_w_bits_last(axi_to_pcie_x1_auto_master_out_w_bits_last),
    .auto_master_out_b_ready(axi_to_pcie_x1_auto_master_out_b_ready),
    .auto_master_out_b_valid(axi_to_pcie_x1_auto_master_out_b_valid),
    .auto_master_out_b_bits_resp(axi_to_pcie_x1_auto_master_out_b_bits_resp),
    .auto_master_out_ar_ready(axi_to_pcie_x1_auto_master_out_ar_ready),
    .auto_master_out_ar_valid(axi_to_pcie_x1_auto_master_out_ar_valid),
    .auto_master_out_ar_bits_addr(axi_to_pcie_x1_auto_master_out_ar_bits_addr),
    .auto_master_out_ar_bits_len(axi_to_pcie_x1_auto_master_out_ar_bits_len),
    .auto_master_out_ar_bits_size(axi_to_pcie_x1_auto_master_out_ar_bits_size),
    .auto_master_out_ar_bits_burst(axi_to_pcie_x1_auto_master_out_ar_bits_burst),
    .auto_master_out_r_ready(axi_to_pcie_x1_auto_master_out_r_ready),
    .auto_master_out_r_valid(axi_to_pcie_x1_auto_master_out_r_valid),
    .auto_master_out_r_bits_data(axi_to_pcie_x1_auto_master_out_r_bits_data),
    .auto_master_out_r_bits_resp(axi_to_pcie_x1_auto_master_out_r_bits_resp),
    .auto_master_out_r_bits_last(axi_to_pcie_x1_auto_master_out_r_bits_last),
    .auto_control_in_aw_ready(axi_to_pcie_x1_auto_control_in_aw_ready),
    .auto_control_in_aw_valid(axi_to_pcie_x1_auto_control_in_aw_valid),
    .auto_control_in_aw_bits_addr(axi_to_pcie_x1_auto_control_in_aw_bits_addr),
    .auto_control_in_w_ready(axi_to_pcie_x1_auto_control_in_w_ready),
    .auto_control_in_w_valid(axi_to_pcie_x1_auto_control_in_w_valid),
    .auto_control_in_w_bits_data(axi_to_pcie_x1_auto_control_in_w_bits_data),
    .auto_control_in_w_bits_strb(axi_to_pcie_x1_auto_control_in_w_bits_strb),
    .auto_control_in_b_ready(axi_to_pcie_x1_auto_control_in_b_ready),
    .auto_control_in_b_valid(axi_to_pcie_x1_auto_control_in_b_valid),
    .auto_control_in_b_bits_resp(axi_to_pcie_x1_auto_control_in_b_bits_resp),
    .auto_control_in_ar_ready(axi_to_pcie_x1_auto_control_in_ar_ready),
    .auto_control_in_ar_valid(axi_to_pcie_x1_auto_control_in_ar_valid),
    .auto_control_in_ar_bits_addr(axi_to_pcie_x1_auto_control_in_ar_bits_addr),
    .auto_control_in_r_ready(axi_to_pcie_x1_auto_control_in_r_ready),
    .auto_control_in_r_valid(axi_to_pcie_x1_auto_control_in_r_valid),
    .auto_control_in_r_bits_data(axi_to_pcie_x1_auto_control_in_r_bits_data),
    .auto_control_in_r_bits_resp(axi_to_pcie_x1_auto_control_in_r_bits_resp),
    .auto_slave_in_aw_ready(axi_to_pcie_x1_auto_slave_in_aw_ready),
    .auto_slave_in_aw_valid(axi_to_pcie_x1_auto_slave_in_aw_valid),
    .auto_slave_in_aw_bits_id(axi_to_pcie_x1_auto_slave_in_aw_bits_id),
    .auto_slave_in_aw_bits_addr(axi_to_pcie_x1_auto_slave_in_aw_bits_addr),
    .auto_slave_in_aw_bits_len(axi_to_pcie_x1_auto_slave_in_aw_bits_len),
    .auto_slave_in_aw_bits_size(axi_to_pcie_x1_auto_slave_in_aw_bits_size),
    .auto_slave_in_aw_bits_burst(axi_to_pcie_x1_auto_slave_in_aw_bits_burst),
    .auto_slave_in_w_ready(axi_to_pcie_x1_auto_slave_in_w_ready),
    .auto_slave_in_w_valid(axi_to_pcie_x1_auto_slave_in_w_valid),
    .auto_slave_in_w_bits_data(axi_to_pcie_x1_auto_slave_in_w_bits_data),
    .auto_slave_in_w_bits_strb(axi_to_pcie_x1_auto_slave_in_w_bits_strb),
    .auto_slave_in_w_bits_last(axi_to_pcie_x1_auto_slave_in_w_bits_last),
    .auto_slave_in_b_ready(axi_to_pcie_x1_auto_slave_in_b_ready),
    .auto_slave_in_b_valid(axi_to_pcie_x1_auto_slave_in_b_valid),
    .auto_slave_in_b_bits_id(axi_to_pcie_x1_auto_slave_in_b_bits_id),
    .auto_slave_in_b_bits_resp(axi_to_pcie_x1_auto_slave_in_b_bits_resp),
    .auto_slave_in_ar_ready(axi_to_pcie_x1_auto_slave_in_ar_ready),
    .auto_slave_in_ar_valid(axi_to_pcie_x1_auto_slave_in_ar_valid),
    .auto_slave_in_ar_bits_id(axi_to_pcie_x1_auto_slave_in_ar_bits_id),
    .auto_slave_in_ar_bits_addr(axi_to_pcie_x1_auto_slave_in_ar_bits_addr),
    .auto_slave_in_ar_bits_len(axi_to_pcie_x1_auto_slave_in_ar_bits_len),
    .auto_slave_in_ar_bits_size(axi_to_pcie_x1_auto_slave_in_ar_bits_size),
    .auto_slave_in_ar_bits_burst(axi_to_pcie_x1_auto_slave_in_ar_bits_burst),
    .auto_slave_in_r_ready(axi_to_pcie_x1_auto_slave_in_r_ready),
    .auto_slave_in_r_valid(axi_to_pcie_x1_auto_slave_in_r_valid),
    .auto_slave_in_r_bits_id(axi_to_pcie_x1_auto_slave_in_r_bits_id),
    .auto_slave_in_r_bits_data(axi_to_pcie_x1_auto_slave_in_r_bits_data),
    .auto_slave_in_r_bits_resp(axi_to_pcie_x1_auto_slave_in_r_bits_resp),
    .auto_slave_in_r_bits_last(axi_to_pcie_x1_auto_slave_in_r_bits_last),
    .io_port_pci_exp_txp(axi_to_pcie_x1_io_port_pci_exp_txp),
    .io_port_pci_exp_txn(axi_to_pcie_x1_io_port_pci_exp_txn),
    .io_port_pci_exp_rxp(axi_to_pcie_x1_io_port_pci_exp_rxp),
    .io_port_pci_exp_rxn(axi_to_pcie_x1_io_port_pci_exp_rxn),
    .io_port_axi_aresetn(axi_to_pcie_x1_io_port_axi_aresetn),
    .io_port_axi_aclk_out(axi_to_pcie_x1_io_port_axi_aclk_out),
    .io_port_mmcm_lock(axi_to_pcie_x1_io_port_mmcm_lock),
    .io_REFCLK(axi_to_pcie_x1_io_REFCLK)
  );
  AXI4Buffer axi4buf ( 
    .clock(axi4buf_clock),
    .reset(axi4buf_reset),
    .auto_in_aw_ready(axi4buf_auto_in_aw_ready),
    .auto_in_aw_valid(axi4buf_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4buf_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4buf_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4buf_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4buf_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4buf_auto_in_aw_bits_burst),
    .auto_in_w_ready(axi4buf_auto_in_w_ready),
    .auto_in_w_valid(axi4buf_auto_in_w_valid),
    .auto_in_w_bits_data(axi4buf_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4buf_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4buf_auto_in_w_bits_last),
    .auto_in_b_ready(axi4buf_auto_in_b_ready),
    .auto_in_b_valid(axi4buf_auto_in_b_valid),
    .auto_in_b_bits_id(axi4buf_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4buf_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4buf_auto_in_ar_ready),
    .auto_in_ar_valid(axi4buf_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4buf_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4buf_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4buf_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4buf_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4buf_auto_in_ar_bits_burst),
    .auto_in_r_ready(axi4buf_auto_in_r_ready),
    .auto_in_r_valid(axi4buf_auto_in_r_valid),
    .auto_in_r_bits_id(axi4buf_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4buf_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4buf_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4buf_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4buf_auto_out_aw_ready),
    .auto_out_aw_valid(axi4buf_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4buf_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4buf_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4buf_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4buf_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4buf_auto_out_aw_bits_burst),
    .auto_out_w_ready(axi4buf_auto_out_w_ready),
    .auto_out_w_valid(axi4buf_auto_out_w_valid),
    .auto_out_w_bits_data(axi4buf_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4buf_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4buf_auto_out_w_bits_last),
    .auto_out_b_ready(axi4buf_auto_out_b_ready),
    .auto_out_b_valid(axi4buf_auto_out_b_valid),
    .auto_out_b_bits_id(axi4buf_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4buf_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4buf_auto_out_ar_ready),
    .auto_out_ar_valid(axi4buf_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4buf_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4buf_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4buf_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4buf_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4buf_auto_out_ar_bits_burst),
    .auto_out_r_ready(axi4buf_auto_out_r_ready),
    .auto_out_r_valid(axi4buf_auto_out_r_valid),
    .auto_out_r_bits_id(axi4buf_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4buf_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4buf_auto_out_r_bits_resp),
    .auto_out_r_bits_last(axi4buf_auto_out_r_bits_last)
  );
  AXI4UserYanker_1 axi4yank ( 
    .clock(axi4yank_clock),
    .reset(axi4yank_reset),
    .auto_in_aw_ready(axi4yank_auto_in_aw_ready),
    .auto_in_aw_valid(axi4yank_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4yank_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4yank_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4yank_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4yank_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4yank_auto_in_aw_bits_burst),
    .auto_in_aw_bits_user(axi4yank_auto_in_aw_bits_user),
    .auto_in_w_ready(axi4yank_auto_in_w_ready),
    .auto_in_w_valid(axi4yank_auto_in_w_valid),
    .auto_in_w_bits_data(axi4yank_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4yank_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4yank_auto_in_w_bits_last),
    .auto_in_b_ready(axi4yank_auto_in_b_ready),
    .auto_in_b_valid(axi4yank_auto_in_b_valid),
    .auto_in_b_bits_id(axi4yank_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4yank_auto_in_b_bits_resp),
    .auto_in_b_bits_user(axi4yank_auto_in_b_bits_user),
    .auto_in_ar_ready(axi4yank_auto_in_ar_ready),
    .auto_in_ar_valid(axi4yank_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4yank_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4yank_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4yank_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4yank_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4yank_auto_in_ar_bits_burst),
    .auto_in_ar_bits_user(axi4yank_auto_in_ar_bits_user),
    .auto_in_r_ready(axi4yank_auto_in_r_ready),
    .auto_in_r_valid(axi4yank_auto_in_r_valid),
    .auto_in_r_bits_id(axi4yank_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4yank_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4yank_auto_in_r_bits_resp),
    .auto_in_r_bits_user(axi4yank_auto_in_r_bits_user),
    .auto_in_r_bits_last(axi4yank_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4yank_auto_out_aw_ready),
    .auto_out_aw_valid(axi4yank_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4yank_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4yank_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4yank_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4yank_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4yank_auto_out_aw_bits_burst),
    .auto_out_w_ready(axi4yank_auto_out_w_ready),
    .auto_out_w_valid(axi4yank_auto_out_w_valid),
    .auto_out_w_bits_data(axi4yank_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4yank_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4yank_auto_out_w_bits_last),
    .auto_out_b_ready(axi4yank_auto_out_b_ready),
    .auto_out_b_valid(axi4yank_auto_out_b_valid),
    .auto_out_b_bits_id(axi4yank_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4yank_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4yank_auto_out_ar_ready),
    .auto_out_ar_valid(axi4yank_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4yank_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4yank_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4yank_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4yank_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4yank_auto_out_ar_bits_burst),
    .auto_out_r_ready(axi4yank_auto_out_r_ready),
    .auto_out_r_valid(axi4yank_auto_out_r_valid),
    .auto_out_r_bits_id(axi4yank_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4yank_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4yank_auto_out_r_bits_resp),
    .auto_out_r_bits_last(axi4yank_auto_out_r_bits_last)
  );
  AXI4Deinterleaver_1 axi4deint ( 
    .clock(axi4deint_clock),
    .reset(axi4deint_reset),
    .auto_in_aw_ready(axi4deint_auto_in_aw_ready),
    .auto_in_aw_valid(axi4deint_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4deint_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4deint_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4deint_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4deint_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4deint_auto_in_aw_bits_burst),
    .auto_in_aw_bits_user(axi4deint_auto_in_aw_bits_user),
    .auto_in_w_ready(axi4deint_auto_in_w_ready),
    .auto_in_w_valid(axi4deint_auto_in_w_valid),
    .auto_in_w_bits_data(axi4deint_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4deint_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4deint_auto_in_w_bits_last),
    .auto_in_b_ready(axi4deint_auto_in_b_ready),
    .auto_in_b_valid(axi4deint_auto_in_b_valid),
    .auto_in_b_bits_id(axi4deint_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4deint_auto_in_b_bits_resp),
    .auto_in_b_bits_user(axi4deint_auto_in_b_bits_user),
    .auto_in_ar_ready(axi4deint_auto_in_ar_ready),
    .auto_in_ar_valid(axi4deint_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4deint_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4deint_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4deint_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4deint_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4deint_auto_in_ar_bits_burst),
    .auto_in_ar_bits_user(axi4deint_auto_in_ar_bits_user),
    .auto_in_r_ready(axi4deint_auto_in_r_ready),
    .auto_in_r_valid(axi4deint_auto_in_r_valid),
    .auto_in_r_bits_id(axi4deint_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4deint_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4deint_auto_in_r_bits_resp),
    .auto_in_r_bits_user(axi4deint_auto_in_r_bits_user),
    .auto_in_r_bits_last(axi4deint_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4deint_auto_out_aw_ready),
    .auto_out_aw_valid(axi4deint_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4deint_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4deint_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4deint_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4deint_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4deint_auto_out_aw_bits_burst),
    .auto_out_aw_bits_user(axi4deint_auto_out_aw_bits_user),
    .auto_out_w_ready(axi4deint_auto_out_w_ready),
    .auto_out_w_valid(axi4deint_auto_out_w_valid),
    .auto_out_w_bits_data(axi4deint_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4deint_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4deint_auto_out_w_bits_last),
    .auto_out_b_ready(axi4deint_auto_out_b_ready),
    .auto_out_b_valid(axi4deint_auto_out_b_valid),
    .auto_out_b_bits_id(axi4deint_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4deint_auto_out_b_bits_resp),
    .auto_out_b_bits_user(axi4deint_auto_out_b_bits_user),
    .auto_out_ar_ready(axi4deint_auto_out_ar_ready),
    .auto_out_ar_valid(axi4deint_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4deint_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4deint_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4deint_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4deint_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4deint_auto_out_ar_bits_burst),
    .auto_out_ar_bits_user(axi4deint_auto_out_ar_bits_user),
    .auto_out_r_ready(axi4deint_auto_out_r_ready),
    .auto_out_r_valid(axi4deint_auto_out_r_valid),
    .auto_out_r_bits_id(axi4deint_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4deint_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4deint_auto_out_r_bits_resp),
    .auto_out_r_bits_user(axi4deint_auto_out_r_bits_user),
    .auto_out_r_bits_last(axi4deint_auto_out_r_bits_last)
  );
  AXI4IdIndexer_1 axi4index ( 
    .auto_in_aw_ready(axi4index_auto_in_aw_ready),
    .auto_in_aw_valid(axi4index_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4index_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4index_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4index_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4index_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4index_auto_in_aw_bits_burst),
    .auto_in_aw_bits_user(axi4index_auto_in_aw_bits_user),
    .auto_in_w_ready(axi4index_auto_in_w_ready),
    .auto_in_w_valid(axi4index_auto_in_w_valid),
    .auto_in_w_bits_data(axi4index_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4index_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4index_auto_in_w_bits_last),
    .auto_in_b_ready(axi4index_auto_in_b_ready),
    .auto_in_b_valid(axi4index_auto_in_b_valid),
    .auto_in_b_bits_id(axi4index_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4index_auto_in_b_bits_resp),
    .auto_in_b_bits_user(axi4index_auto_in_b_bits_user),
    .auto_in_ar_ready(axi4index_auto_in_ar_ready),
    .auto_in_ar_valid(axi4index_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4index_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4index_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4index_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4index_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4index_auto_in_ar_bits_burst),
    .auto_in_ar_bits_user(axi4index_auto_in_ar_bits_user),
    .auto_in_r_ready(axi4index_auto_in_r_ready),
    .auto_in_r_valid(axi4index_auto_in_r_valid),
    .auto_in_r_bits_id(axi4index_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4index_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4index_auto_in_r_bits_resp),
    .auto_in_r_bits_user(axi4index_auto_in_r_bits_user),
    .auto_in_r_bits_last(axi4index_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4index_auto_out_aw_ready),
    .auto_out_aw_valid(axi4index_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4index_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4index_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4index_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4index_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4index_auto_out_aw_bits_burst),
    .auto_out_aw_bits_user(axi4index_auto_out_aw_bits_user),
    .auto_out_w_ready(axi4index_auto_out_w_ready),
    .auto_out_w_valid(axi4index_auto_out_w_valid),
    .auto_out_w_bits_data(axi4index_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4index_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4index_auto_out_w_bits_last),
    .auto_out_b_ready(axi4index_auto_out_b_ready),
    .auto_out_b_valid(axi4index_auto_out_b_valid),
    .auto_out_b_bits_id(axi4index_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4index_auto_out_b_bits_resp),
    .auto_out_b_bits_user(axi4index_auto_out_b_bits_user),
    .auto_out_ar_ready(axi4index_auto_out_ar_ready),
    .auto_out_ar_valid(axi4index_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4index_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4index_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4index_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4index_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4index_auto_out_ar_bits_burst),
    .auto_out_ar_bits_user(axi4index_auto_out_ar_bits_user),
    .auto_out_r_ready(axi4index_auto_out_r_ready),
    .auto_out_r_valid(axi4index_auto_out_r_valid),
    .auto_out_r_bits_id(axi4index_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4index_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4index_auto_out_r_bits_resp),
    .auto_out_r_bits_user(axi4index_auto_out_r_bits_user),
    .auto_out_r_bits_last(axi4index_auto_out_r_bits_last)
  );
  TLToAXI4_1 tl2axi4 ( 
    .clock(tl2axi4_clock),
    .reset(tl2axi4_reset),
    .auto_in_a_ready(tl2axi4_auto_in_a_ready),
    .auto_in_a_valid(tl2axi4_auto_in_a_valid),
    .auto_in_a_bits_opcode(tl2axi4_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(tl2axi4_auto_in_a_bits_param),
    .auto_in_a_bits_size(tl2axi4_auto_in_a_bits_size),
    .auto_in_a_bits_source(tl2axi4_auto_in_a_bits_source),
    .auto_in_a_bits_address(tl2axi4_auto_in_a_bits_address),
    .auto_in_a_bits_mask(tl2axi4_auto_in_a_bits_mask),
    .auto_in_a_bits_data(tl2axi4_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(tl2axi4_auto_in_a_bits_corrupt),
    .auto_in_d_ready(tl2axi4_auto_in_d_ready),
    .auto_in_d_valid(tl2axi4_auto_in_d_valid),
    .auto_in_d_bits_opcode(tl2axi4_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(tl2axi4_auto_in_d_bits_size),
    .auto_in_d_bits_source(tl2axi4_auto_in_d_bits_source),
    .auto_in_d_bits_denied(tl2axi4_auto_in_d_bits_denied),
    .auto_in_d_bits_data(tl2axi4_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(tl2axi4_auto_in_d_bits_corrupt),
    .auto_out_aw_ready(tl2axi4_auto_out_aw_ready),
    .auto_out_aw_valid(tl2axi4_auto_out_aw_valid),
    .auto_out_aw_bits_id(tl2axi4_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(tl2axi4_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(tl2axi4_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(tl2axi4_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(tl2axi4_auto_out_aw_bits_burst),
    .auto_out_aw_bits_user(tl2axi4_auto_out_aw_bits_user),
    .auto_out_w_ready(tl2axi4_auto_out_w_ready),
    .auto_out_w_valid(tl2axi4_auto_out_w_valid),
    .auto_out_w_bits_data(tl2axi4_auto_out_w_bits_data),
    .auto_out_w_bits_strb(tl2axi4_auto_out_w_bits_strb),
    .auto_out_w_bits_last(tl2axi4_auto_out_w_bits_last),
    .auto_out_b_ready(tl2axi4_auto_out_b_ready),
    .auto_out_b_valid(tl2axi4_auto_out_b_valid),
    .auto_out_b_bits_id(tl2axi4_auto_out_b_bits_id),
    .auto_out_b_bits_resp(tl2axi4_auto_out_b_bits_resp),
    .auto_out_b_bits_user(tl2axi4_auto_out_b_bits_user),
    .auto_out_ar_ready(tl2axi4_auto_out_ar_ready),
    .auto_out_ar_valid(tl2axi4_auto_out_ar_valid),
    .auto_out_ar_bits_id(tl2axi4_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(tl2axi4_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(tl2axi4_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(tl2axi4_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(tl2axi4_auto_out_ar_bits_burst),
    .auto_out_ar_bits_user(tl2axi4_auto_out_ar_bits_user),
    .auto_out_r_ready(tl2axi4_auto_out_r_ready),
    .auto_out_r_valid(tl2axi4_auto_out_r_valid),
    .auto_out_r_bits_id(tl2axi4_auto_out_r_bits_id),
    .auto_out_r_bits_data(tl2axi4_auto_out_r_bits_data),
    .auto_out_r_bits_resp(tl2axi4_auto_out_r_bits_resp),
    .auto_out_r_bits_user(tl2axi4_auto_out_r_bits_user),
    .auto_out_r_bits_last(tl2axi4_auto_out_r_bits_last)
  );
  AXI4Buffer_1 axi4buf_1 ( 
    .clock(axi4buf_1_clock),
    .reset(axi4buf_1_reset),
    .auto_in_aw_ready(axi4buf_1_auto_in_aw_ready),
    .auto_in_aw_valid(axi4buf_1_auto_in_aw_valid),
    .auto_in_aw_bits_addr(axi4buf_1_auto_in_aw_bits_addr),
    .auto_in_w_ready(axi4buf_1_auto_in_w_ready),
    .auto_in_w_valid(axi4buf_1_auto_in_w_valid),
    .auto_in_w_bits_data(axi4buf_1_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4buf_1_auto_in_w_bits_strb),
    .auto_in_b_ready(axi4buf_1_auto_in_b_ready),
    .auto_in_b_valid(axi4buf_1_auto_in_b_valid),
    .auto_in_b_bits_resp(axi4buf_1_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4buf_1_auto_in_ar_ready),
    .auto_in_ar_valid(axi4buf_1_auto_in_ar_valid),
    .auto_in_ar_bits_addr(axi4buf_1_auto_in_ar_bits_addr),
    .auto_in_r_ready(axi4buf_1_auto_in_r_ready),
    .auto_in_r_valid(axi4buf_1_auto_in_r_valid),
    .auto_in_r_bits_data(axi4buf_1_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4buf_1_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4buf_1_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4buf_1_auto_out_aw_ready),
    .auto_out_aw_valid(axi4buf_1_auto_out_aw_valid),
    .auto_out_aw_bits_addr(axi4buf_1_auto_out_aw_bits_addr),
    .auto_out_w_ready(axi4buf_1_auto_out_w_ready),
    .auto_out_w_valid(axi4buf_1_auto_out_w_valid),
    .auto_out_w_bits_data(axi4buf_1_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4buf_1_auto_out_w_bits_strb),
    .auto_out_b_ready(axi4buf_1_auto_out_b_ready),
    .auto_out_b_valid(axi4buf_1_auto_out_b_valid),
    .auto_out_b_bits_resp(axi4buf_1_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4buf_1_auto_out_ar_ready),
    .auto_out_ar_valid(axi4buf_1_auto_out_ar_valid),
    .auto_out_ar_bits_addr(axi4buf_1_auto_out_ar_bits_addr),
    .auto_out_r_ready(axi4buf_1_auto_out_r_ready),
    .auto_out_r_valid(axi4buf_1_auto_out_r_valid),
    .auto_out_r_bits_data(axi4buf_1_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4buf_1_auto_out_r_bits_resp)
  );
  AXI4UserYanker_2 axi4yank_1 ( 
    .clock(axi4yank_1_clock),
    .reset(axi4yank_1_reset),
    .auto_in_aw_ready(axi4yank_1_auto_in_aw_ready),
    .auto_in_aw_valid(axi4yank_1_auto_in_aw_valid),
    .auto_in_aw_bits_addr(axi4yank_1_auto_in_aw_bits_addr),
    .auto_in_aw_bits_user(axi4yank_1_auto_in_aw_bits_user),
    .auto_in_w_ready(axi4yank_1_auto_in_w_ready),
    .auto_in_w_valid(axi4yank_1_auto_in_w_valid),
    .auto_in_w_bits_data(axi4yank_1_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4yank_1_auto_in_w_bits_strb),
    .auto_in_b_ready(axi4yank_1_auto_in_b_ready),
    .auto_in_b_valid(axi4yank_1_auto_in_b_valid),
    .auto_in_b_bits_resp(axi4yank_1_auto_in_b_bits_resp),
    .auto_in_b_bits_user(axi4yank_1_auto_in_b_bits_user),
    .auto_in_ar_ready(axi4yank_1_auto_in_ar_ready),
    .auto_in_ar_valid(axi4yank_1_auto_in_ar_valid),
    .auto_in_ar_bits_addr(axi4yank_1_auto_in_ar_bits_addr),
    .auto_in_ar_bits_user(axi4yank_1_auto_in_ar_bits_user),
    .auto_in_r_ready(axi4yank_1_auto_in_r_ready),
    .auto_in_r_valid(axi4yank_1_auto_in_r_valid),
    .auto_in_r_bits_data(axi4yank_1_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4yank_1_auto_in_r_bits_resp),
    .auto_in_r_bits_user(axi4yank_1_auto_in_r_bits_user),
    .auto_in_r_bits_last(axi4yank_1_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4yank_1_auto_out_aw_ready),
    .auto_out_aw_valid(axi4yank_1_auto_out_aw_valid),
    .auto_out_aw_bits_addr(axi4yank_1_auto_out_aw_bits_addr),
    .auto_out_w_ready(axi4yank_1_auto_out_w_ready),
    .auto_out_w_valid(axi4yank_1_auto_out_w_valid),
    .auto_out_w_bits_data(axi4yank_1_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4yank_1_auto_out_w_bits_strb),
    .auto_out_b_ready(axi4yank_1_auto_out_b_ready),
    .auto_out_b_valid(axi4yank_1_auto_out_b_valid),
    .auto_out_b_bits_resp(axi4yank_1_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4yank_1_auto_out_ar_ready),
    .auto_out_ar_valid(axi4yank_1_auto_out_ar_valid),
    .auto_out_ar_bits_addr(axi4yank_1_auto_out_ar_bits_addr),
    .auto_out_r_ready(axi4yank_1_auto_out_r_ready),
    .auto_out_r_valid(axi4yank_1_auto_out_r_valid),
    .auto_out_r_bits_data(axi4yank_1_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4yank_1_auto_out_r_bits_resp),
    .auto_out_r_bits_last(axi4yank_1_auto_out_r_bits_last)
  );
  TLToAXI4_2 tl2axi4_1 ( 
    .clock(tl2axi4_1_clock),
    .reset(tl2axi4_1_reset),
    .auto_in_a_ready(tl2axi4_1_auto_in_a_ready),
    .auto_in_a_valid(tl2axi4_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(tl2axi4_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(tl2axi4_1_auto_in_a_bits_param),
    .auto_in_a_bits_size(tl2axi4_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(tl2axi4_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(tl2axi4_1_auto_in_a_bits_address),
    .auto_in_a_bits_mask(tl2axi4_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(tl2axi4_1_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(tl2axi4_1_auto_in_a_bits_corrupt),
    .auto_in_d_ready(tl2axi4_1_auto_in_d_ready),
    .auto_in_d_valid(tl2axi4_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(tl2axi4_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(tl2axi4_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(tl2axi4_1_auto_in_d_bits_source),
    .auto_in_d_bits_denied(tl2axi4_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data(tl2axi4_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(tl2axi4_1_auto_in_d_bits_corrupt),
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
  TLFragmenter_11 fragmenter ( 
    .clock(fragmenter_clock),
    .reset(fragmenter_reset),
    .auto_in_a_ready(fragmenter_auto_in_a_ready),
    .auto_in_a_valid(fragmenter_auto_in_a_valid),
    .auto_in_a_bits_opcode(fragmenter_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(fragmenter_auto_in_a_bits_param),
    .auto_in_a_bits_size(fragmenter_auto_in_a_bits_size),
    .auto_in_a_bits_source(fragmenter_auto_in_a_bits_source),
    .auto_in_a_bits_address(fragmenter_auto_in_a_bits_address),
    .auto_in_a_bits_mask(fragmenter_auto_in_a_bits_mask),
    .auto_in_a_bits_data(fragmenter_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(fragmenter_auto_in_a_bits_corrupt),
    .auto_in_d_ready(fragmenter_auto_in_d_ready),
    .auto_in_d_valid(fragmenter_auto_in_d_valid),
    .auto_in_d_bits_opcode(fragmenter_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(fragmenter_auto_in_d_bits_size),
    .auto_in_d_bits_source(fragmenter_auto_in_d_bits_source),
    .auto_in_d_bits_denied(fragmenter_auto_in_d_bits_denied),
    .auto_in_d_bits_data(fragmenter_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(fragmenter_auto_in_d_bits_corrupt),
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

  TLWidthWidget_9 widget ( 
    .clock(widget_clock),
    .reset(widget_reset),
    .auto_in_a_ready(widget_auto_in_a_ready),
    .auto_in_a_valid(widget_auto_in_a_valid),
    .auto_in_a_bits_opcode(widget_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(widget_auto_in_a_bits_param),
    .auto_in_a_bits_size(widget_auto_in_a_bits_size),
    .auto_in_a_bits_source(widget_auto_in_a_bits_source),
    .auto_in_a_bits_address(widget_auto_in_a_bits_address),
    .auto_in_a_bits_mask(widget_auto_in_a_bits_mask),
    .auto_in_a_bits_data(widget_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(widget_auto_in_a_bits_corrupt),
    .auto_in_d_ready(widget_auto_in_d_ready),
    .auto_in_d_valid(widget_auto_in_d_valid),
    .auto_in_d_bits_opcode(widget_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(widget_auto_in_d_bits_size),
    .auto_in_d_bits_denied(widget_auto_in_d_bits_denied),
    .auto_in_d_bits_data(widget_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(widget_auto_in_d_bits_corrupt),
    .auto_out_a_ready(widget_auto_out_a_ready),
    .auto_out_a_valid(widget_auto_out_a_valid),
    .auto_out_a_bits_opcode(widget_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(widget_auto_out_a_bits_param),
    .auto_out_a_bits_size(widget_auto_out_a_bits_size),
    .auto_out_a_bits_source(widget_auto_out_a_bits_source),
    .auto_out_a_bits_address(widget_auto_out_a_bits_address),
    .auto_out_a_bits_mask(widget_auto_out_a_bits_mask),
    .auto_out_a_bits_data(widget_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(widget_auto_out_a_bits_corrupt),
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
  
  AXI4ToTL axi42tl ( 
    .clock(axi42tl_clock),
    .reset(axi42tl_reset),
    .auto_in_aw_ready(axi42tl_auto_in_aw_ready),
    .auto_in_aw_valid(axi42tl_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi42tl_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi42tl_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi42tl_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi42tl_auto_in_aw_bits_size),
    .auto_in_w_ready(axi42tl_auto_in_w_ready),
    .auto_in_w_valid(axi42tl_auto_in_w_valid),
    .auto_in_w_bits_data(axi42tl_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi42tl_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi42tl_auto_in_w_bits_last),
    .auto_in_b_ready(axi42tl_auto_in_b_ready),
    .auto_in_b_valid(axi42tl_auto_in_b_valid),
    .auto_in_b_bits_resp(axi42tl_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi42tl_auto_in_ar_ready),
    .auto_in_ar_valid(axi42tl_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi42tl_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi42tl_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi42tl_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi42tl_auto_in_ar_bits_size),
    .auto_in_r_ready(axi42tl_auto_in_r_ready),
    .auto_in_r_valid(axi42tl_auto_in_r_valid),
    .auto_in_r_bits_data(axi42tl_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi42tl_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi42tl_auto_in_r_bits_last),
    .auto_out_a_ready(axi42tl_auto_out_a_ready),
    .auto_out_a_valid(axi42tl_auto_out_a_valid),
    .auto_out_a_bits_opcode(axi42tl_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(axi42tl_auto_out_a_bits_param),
    .auto_out_a_bits_size(axi42tl_auto_out_a_bits_size),
    .auto_out_a_bits_source(axi42tl_auto_out_a_bits_source),
    .auto_out_a_bits_address(axi42tl_auto_out_a_bits_address),
    .auto_out_a_bits_mask(axi42tl_auto_out_a_bits_mask),
    .auto_out_a_bits_data(axi42tl_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(axi42tl_auto_out_a_bits_corrupt),
    .auto_out_d_ready(axi42tl_auto_out_d_ready),
    .auto_out_d_valid(axi42tl_auto_out_d_valid),
    .auto_out_d_bits_opcode(axi42tl_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(axi42tl_auto_out_d_bits_size),
    .auto_out_d_bits_denied(axi42tl_auto_out_d_bits_denied),
    .auto_out_d_bits_data(axi42tl_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(axi42tl_auto_out_d_bits_corrupt)
  );
  AXI4UserYanker_3 axi4yank_2 ( 
    .clock(axi4yank_2_clock),
    .reset(axi4yank_2_reset),
    .auto_in_aw_ready(axi4yank_2_auto_in_aw_ready),
    .auto_in_aw_valid(axi4yank_2_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4yank_2_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4yank_2_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4yank_2_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4yank_2_auto_in_aw_bits_size),
    .auto_in_aw_bits_user(axi4yank_2_auto_in_aw_bits_user),
    .auto_in_w_ready(axi4yank_2_auto_in_w_ready),
    .auto_in_w_valid(axi4yank_2_auto_in_w_valid),
    .auto_in_w_bits_data(axi4yank_2_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4yank_2_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4yank_2_auto_in_w_bits_last),
    .auto_in_b_ready(axi4yank_2_auto_in_b_ready),
    .auto_in_b_valid(axi4yank_2_auto_in_b_valid),
    .auto_in_b_bits_resp(axi4yank_2_auto_in_b_bits_resp),
    .auto_in_b_bits_user(axi4yank_2_auto_in_b_bits_user),
    .auto_in_ar_ready(axi4yank_2_auto_in_ar_ready),
    .auto_in_ar_valid(axi4yank_2_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4yank_2_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4yank_2_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4yank_2_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4yank_2_auto_in_ar_bits_size),
    .auto_in_ar_bits_user(axi4yank_2_auto_in_ar_bits_user),
    .auto_in_r_ready(axi4yank_2_auto_in_r_ready),
    .auto_in_r_valid(axi4yank_2_auto_in_r_valid),
    .auto_in_r_bits_data(axi4yank_2_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4yank_2_auto_in_r_bits_resp),
    .auto_in_r_bits_user(axi4yank_2_auto_in_r_bits_user),
    .auto_in_r_bits_last(axi4yank_2_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4yank_2_auto_out_aw_ready),
    .auto_out_aw_valid(axi4yank_2_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4yank_2_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4yank_2_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4yank_2_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4yank_2_auto_out_aw_bits_size),
    .auto_out_w_ready(axi4yank_2_auto_out_w_ready),
    .auto_out_w_valid(axi4yank_2_auto_out_w_valid),
    .auto_out_w_bits_data(axi4yank_2_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4yank_2_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4yank_2_auto_out_w_bits_last),
    .auto_out_b_ready(axi4yank_2_auto_out_b_ready),
    .auto_out_b_valid(axi4yank_2_auto_out_b_valid),
    .auto_out_b_bits_resp(axi4yank_2_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4yank_2_auto_out_ar_ready),
    .auto_out_ar_valid(axi4yank_2_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4yank_2_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4yank_2_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4yank_2_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4yank_2_auto_out_ar_bits_size),
    .auto_out_r_ready(axi4yank_2_auto_out_r_ready),
    .auto_out_r_valid(axi4yank_2_auto_out_r_valid),
    .auto_out_r_bits_data(axi4yank_2_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4yank_2_auto_out_r_bits_resp),
    .auto_out_r_bits_last(axi4yank_2_auto_out_r_bits_last)
  );
  AXI4Fragmenter axi4frag ( 
    .clock(axi4frag_clock),
    .reset(axi4frag_reset),
    .auto_in_aw_ready(axi4frag_auto_in_aw_ready),
    .auto_in_aw_valid(axi4frag_auto_in_aw_valid),
    .auto_in_aw_bits_addr(axi4frag_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4frag_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4frag_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4frag_auto_in_aw_bits_burst),
    .auto_in_w_ready(axi4frag_auto_in_w_ready),
    .auto_in_w_valid(axi4frag_auto_in_w_valid),
    .auto_in_w_bits_data(axi4frag_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4frag_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4frag_auto_in_w_bits_last),
    .auto_in_b_ready(axi4frag_auto_in_b_ready),
    .auto_in_b_valid(axi4frag_auto_in_b_valid),
    .auto_in_b_bits_resp(axi4frag_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4frag_auto_in_ar_ready),
    .auto_in_ar_valid(axi4frag_auto_in_ar_valid),
    .auto_in_ar_bits_addr(axi4frag_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4frag_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4frag_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4frag_auto_in_ar_bits_burst),
    .auto_in_r_ready(axi4frag_auto_in_r_ready),
    .auto_in_r_valid(axi4frag_auto_in_r_valid),
    .auto_in_r_bits_data(axi4frag_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4frag_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4frag_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4frag_auto_out_aw_ready),
    .auto_out_aw_valid(axi4frag_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4frag_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4frag_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4frag_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4frag_auto_out_aw_bits_size),
    .auto_out_aw_bits_user(axi4frag_auto_out_aw_bits_user),
    .auto_out_w_ready(axi4frag_auto_out_w_ready),
    .auto_out_w_valid(axi4frag_auto_out_w_valid),
    .auto_out_w_bits_data(axi4frag_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4frag_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4frag_auto_out_w_bits_last),
    .auto_out_b_ready(axi4frag_auto_out_b_ready),
    .auto_out_b_valid(axi4frag_auto_out_b_valid),
    .auto_out_b_bits_resp(axi4frag_auto_out_b_bits_resp),
    .auto_out_b_bits_user(axi4frag_auto_out_b_bits_user),
    .auto_out_ar_ready(axi4frag_auto_out_ar_ready),
    .auto_out_ar_valid(axi4frag_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4frag_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4frag_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4frag_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4frag_auto_out_ar_bits_size),
    .auto_out_ar_bits_user(axi4frag_auto_out_ar_bits_user),
    .auto_out_r_ready(axi4frag_auto_out_r_ready),
    .auto_out_r_valid(axi4frag_auto_out_r_valid),
    .auto_out_r_bits_data(axi4frag_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4frag_auto_out_r_bits_resp),
    .auto_out_r_bits_user(axi4frag_auto_out_r_bits_user),
    .auto_out_r_bits_last(axi4frag_auto_out_r_bits_last)
  );
  TLAsyncCrossingSink_1 asink ( 
    .clock(asink_clock),
    .reset(asink_reset),
    .auto_in_a_mem_0_opcode(asink_auto_in_a_mem_0_opcode),
    .auto_in_a_mem_0_param(asink_auto_in_a_mem_0_param),
    .auto_in_a_mem_0_size(asink_auto_in_a_mem_0_size),
    .auto_in_a_mem_0_source(asink_auto_in_a_mem_0_source),
    .auto_in_a_mem_0_address(asink_auto_in_a_mem_0_address),
    .auto_in_a_mem_0_mask(asink_auto_in_a_mem_0_mask),
    .auto_in_a_mem_0_data(asink_auto_in_a_mem_0_data),
    .auto_in_a_mem_0_corrupt(asink_auto_in_a_mem_0_corrupt),
    .auto_in_a_mem_1_opcode(asink_auto_in_a_mem_1_opcode),
    .auto_in_a_mem_1_param(asink_auto_in_a_mem_1_param),
    .auto_in_a_mem_1_size(asink_auto_in_a_mem_1_size),
    .auto_in_a_mem_1_source(asink_auto_in_a_mem_1_source),
    .auto_in_a_mem_1_address(asink_auto_in_a_mem_1_address),
    .auto_in_a_mem_1_mask(asink_auto_in_a_mem_1_mask),
    .auto_in_a_mem_1_data(asink_auto_in_a_mem_1_data),
    .auto_in_a_mem_1_corrupt(asink_auto_in_a_mem_1_corrupt),
    .auto_in_a_mem_2_opcode(asink_auto_in_a_mem_2_opcode),
    .auto_in_a_mem_2_param(asink_auto_in_a_mem_2_param),
    .auto_in_a_mem_2_size(asink_auto_in_a_mem_2_size),
    .auto_in_a_mem_2_source(asink_auto_in_a_mem_2_source),
    .auto_in_a_mem_2_address(asink_auto_in_a_mem_2_address),
    .auto_in_a_mem_2_mask(asink_auto_in_a_mem_2_mask),
    .auto_in_a_mem_2_data(asink_auto_in_a_mem_2_data),
    .auto_in_a_mem_2_corrupt(asink_auto_in_a_mem_2_corrupt),
    .auto_in_a_mem_3_opcode(asink_auto_in_a_mem_3_opcode),
    .auto_in_a_mem_3_param(asink_auto_in_a_mem_3_param),
    .auto_in_a_mem_3_size(asink_auto_in_a_mem_3_size),
    .auto_in_a_mem_3_source(asink_auto_in_a_mem_3_source),
    .auto_in_a_mem_3_address(asink_auto_in_a_mem_3_address),
    .auto_in_a_mem_3_mask(asink_auto_in_a_mem_3_mask),
    .auto_in_a_mem_3_data(asink_auto_in_a_mem_3_data),
    .auto_in_a_mem_3_corrupt(asink_auto_in_a_mem_3_corrupt),
    .auto_in_a_mem_4_opcode(asink_auto_in_a_mem_4_opcode),
    .auto_in_a_mem_4_param(asink_auto_in_a_mem_4_param),
    .auto_in_a_mem_4_size(asink_auto_in_a_mem_4_size),
    .auto_in_a_mem_4_source(asink_auto_in_a_mem_4_source),
    .auto_in_a_mem_4_address(asink_auto_in_a_mem_4_address),
    .auto_in_a_mem_4_mask(asink_auto_in_a_mem_4_mask),
    .auto_in_a_mem_4_data(asink_auto_in_a_mem_4_data),
    .auto_in_a_mem_4_corrupt(asink_auto_in_a_mem_4_corrupt),
    .auto_in_a_mem_5_opcode(asink_auto_in_a_mem_5_opcode),
    .auto_in_a_mem_5_param(asink_auto_in_a_mem_5_param),
    .auto_in_a_mem_5_size(asink_auto_in_a_mem_5_size),
    .auto_in_a_mem_5_source(asink_auto_in_a_mem_5_source),
    .auto_in_a_mem_5_address(asink_auto_in_a_mem_5_address),
    .auto_in_a_mem_5_mask(asink_auto_in_a_mem_5_mask),
    .auto_in_a_mem_5_data(asink_auto_in_a_mem_5_data),
    .auto_in_a_mem_5_corrupt(asink_auto_in_a_mem_5_corrupt),
    .auto_in_a_mem_6_opcode(asink_auto_in_a_mem_6_opcode),
    .auto_in_a_mem_6_param(asink_auto_in_a_mem_6_param),
    .auto_in_a_mem_6_size(asink_auto_in_a_mem_6_size),
    .auto_in_a_mem_6_source(asink_auto_in_a_mem_6_source),
    .auto_in_a_mem_6_address(asink_auto_in_a_mem_6_address),
    .auto_in_a_mem_6_mask(asink_auto_in_a_mem_6_mask),
    .auto_in_a_mem_6_data(asink_auto_in_a_mem_6_data),
    .auto_in_a_mem_6_corrupt(asink_auto_in_a_mem_6_corrupt),
    .auto_in_a_mem_7_opcode(asink_auto_in_a_mem_7_opcode),
    .auto_in_a_mem_7_param(asink_auto_in_a_mem_7_param),
    .auto_in_a_mem_7_size(asink_auto_in_a_mem_7_size),
    .auto_in_a_mem_7_source(asink_auto_in_a_mem_7_source),
    .auto_in_a_mem_7_address(asink_auto_in_a_mem_7_address),
    .auto_in_a_mem_7_mask(asink_auto_in_a_mem_7_mask),
    .auto_in_a_mem_7_data(asink_auto_in_a_mem_7_data),
    .auto_in_a_mem_7_corrupt(asink_auto_in_a_mem_7_corrupt),
    .auto_in_a_ridx(asink_auto_in_a_ridx),
    .auto_in_a_widx(asink_auto_in_a_widx),
    .auto_in_a_safe_ridx_valid(asink_auto_in_a_safe_ridx_valid),
    .auto_in_a_safe_widx_valid(asink_auto_in_a_safe_widx_valid),
    .auto_in_a_safe_source_reset_n(asink_auto_in_a_safe_source_reset_n),
    .auto_in_a_safe_sink_reset_n(asink_auto_in_a_safe_sink_reset_n),
    .auto_in_d_mem_0_opcode(asink_auto_in_d_mem_0_opcode),
    .auto_in_d_mem_0_param(asink_auto_in_d_mem_0_param),
    .auto_in_d_mem_0_size(asink_auto_in_d_mem_0_size),
    .auto_in_d_mem_0_source(asink_auto_in_d_mem_0_source),
    .auto_in_d_mem_0_sink(asink_auto_in_d_mem_0_sink),
    .auto_in_d_mem_0_denied(asink_auto_in_d_mem_0_denied),
    .auto_in_d_mem_0_data(asink_auto_in_d_mem_0_data),
    .auto_in_d_mem_0_corrupt(asink_auto_in_d_mem_0_corrupt),
    .auto_in_d_mem_1_opcode(asink_auto_in_d_mem_1_opcode),
    .auto_in_d_mem_1_param(asink_auto_in_d_mem_1_param),
    .auto_in_d_mem_1_size(asink_auto_in_d_mem_1_size),
    .auto_in_d_mem_1_source(asink_auto_in_d_mem_1_source),
    .auto_in_d_mem_1_sink(asink_auto_in_d_mem_1_sink),
    .auto_in_d_mem_1_denied(asink_auto_in_d_mem_1_denied),
    .auto_in_d_mem_1_data(asink_auto_in_d_mem_1_data),
    .auto_in_d_mem_1_corrupt(asink_auto_in_d_mem_1_corrupt),
    .auto_in_d_mem_2_opcode(asink_auto_in_d_mem_2_opcode),
    .auto_in_d_mem_2_param(asink_auto_in_d_mem_2_param),
    .auto_in_d_mem_2_size(asink_auto_in_d_mem_2_size),
    .auto_in_d_mem_2_source(asink_auto_in_d_mem_2_source),
    .auto_in_d_mem_2_sink(asink_auto_in_d_mem_2_sink),
    .auto_in_d_mem_2_denied(asink_auto_in_d_mem_2_denied),
    .auto_in_d_mem_2_data(asink_auto_in_d_mem_2_data),
    .auto_in_d_mem_2_corrupt(asink_auto_in_d_mem_2_corrupt),
    .auto_in_d_mem_3_opcode(asink_auto_in_d_mem_3_opcode),
    .auto_in_d_mem_3_param(asink_auto_in_d_mem_3_param),
    .auto_in_d_mem_3_size(asink_auto_in_d_mem_3_size),
    .auto_in_d_mem_3_source(asink_auto_in_d_mem_3_source),
    .auto_in_d_mem_3_sink(asink_auto_in_d_mem_3_sink),
    .auto_in_d_mem_3_denied(asink_auto_in_d_mem_3_denied),
    .auto_in_d_mem_3_data(asink_auto_in_d_mem_3_data),
    .auto_in_d_mem_3_corrupt(asink_auto_in_d_mem_3_corrupt),
    .auto_in_d_mem_4_opcode(asink_auto_in_d_mem_4_opcode),
    .auto_in_d_mem_4_param(asink_auto_in_d_mem_4_param),
    .auto_in_d_mem_4_size(asink_auto_in_d_mem_4_size),
    .auto_in_d_mem_4_source(asink_auto_in_d_mem_4_source),
    .auto_in_d_mem_4_sink(asink_auto_in_d_mem_4_sink),
    .auto_in_d_mem_4_denied(asink_auto_in_d_mem_4_denied),
    .auto_in_d_mem_4_data(asink_auto_in_d_mem_4_data),
    .auto_in_d_mem_4_corrupt(asink_auto_in_d_mem_4_corrupt),
    .auto_in_d_mem_5_opcode(asink_auto_in_d_mem_5_opcode),
    .auto_in_d_mem_5_param(asink_auto_in_d_mem_5_param),
    .auto_in_d_mem_5_size(asink_auto_in_d_mem_5_size),
    .auto_in_d_mem_5_source(asink_auto_in_d_mem_5_source),
    .auto_in_d_mem_5_sink(asink_auto_in_d_mem_5_sink),
    .auto_in_d_mem_5_denied(asink_auto_in_d_mem_5_denied),
    .auto_in_d_mem_5_data(asink_auto_in_d_mem_5_data),
    .auto_in_d_mem_5_corrupt(asink_auto_in_d_mem_5_corrupt),
    .auto_in_d_mem_6_opcode(asink_auto_in_d_mem_6_opcode),
    .auto_in_d_mem_6_param(asink_auto_in_d_mem_6_param),
    .auto_in_d_mem_6_size(asink_auto_in_d_mem_6_size),
    .auto_in_d_mem_6_source(asink_auto_in_d_mem_6_source),
    .auto_in_d_mem_6_sink(asink_auto_in_d_mem_6_sink),
    .auto_in_d_mem_6_denied(asink_auto_in_d_mem_6_denied),
    .auto_in_d_mem_6_data(asink_auto_in_d_mem_6_data),
    .auto_in_d_mem_6_corrupt(asink_auto_in_d_mem_6_corrupt),
    .auto_in_d_mem_7_opcode(asink_auto_in_d_mem_7_opcode),
    .auto_in_d_mem_7_param(asink_auto_in_d_mem_7_param),
    .auto_in_d_mem_7_size(asink_auto_in_d_mem_7_size),
    .auto_in_d_mem_7_source(asink_auto_in_d_mem_7_source),
    .auto_in_d_mem_7_sink(asink_auto_in_d_mem_7_sink),
    .auto_in_d_mem_7_denied(asink_auto_in_d_mem_7_denied),
    .auto_in_d_mem_7_data(asink_auto_in_d_mem_7_data),
    .auto_in_d_mem_7_corrupt(asink_auto_in_d_mem_7_corrupt),
    .auto_in_d_ridx(asink_auto_in_d_ridx),
    .auto_in_d_widx(asink_auto_in_d_widx),
    .auto_in_d_safe_ridx_valid(asink_auto_in_d_safe_ridx_valid),
    .auto_in_d_safe_widx_valid(asink_auto_in_d_safe_widx_valid),
    .auto_in_d_safe_source_reset_n(asink_auto_in_d_safe_source_reset_n),
    .auto_in_d_safe_sink_reset_n(asink_auto_in_d_safe_sink_reset_n),
    .auto_out_a_ready(asink_auto_out_a_ready),
    .auto_out_a_valid(asink_auto_out_a_valid),
    .auto_out_a_bits_opcode(asink_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(asink_auto_out_a_bits_param),
    .auto_out_a_bits_size(asink_auto_out_a_bits_size),
    .auto_out_a_bits_source(asink_auto_out_a_bits_source),
    .auto_out_a_bits_address(asink_auto_out_a_bits_address),
    .auto_out_a_bits_mask(asink_auto_out_a_bits_mask),
    .auto_out_a_bits_data(asink_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(asink_auto_out_a_bits_corrupt),
    .auto_out_d_ready(asink_auto_out_d_ready),
    .auto_out_d_valid(asink_auto_out_d_valid),
    .auto_out_d_bits_opcode(asink_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(asink_auto_out_d_bits_size),
    .auto_out_d_bits_source(asink_auto_out_d_bits_source),
    .auto_out_d_bits_denied(asink_auto_out_d_bits_denied),
    .auto_out_d_bits_data(asink_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(asink_auto_out_d_bits_corrupt)
  );
  TLAsyncCrossingSink_2 asink_1 ( 
    .clock(asink_1_clock),
    .reset(asink_1_reset),
    .auto_in_a_mem_0_opcode(asink_1_auto_in_a_mem_0_opcode),
    .auto_in_a_mem_0_param(asink_1_auto_in_a_mem_0_param),
    .auto_in_a_mem_0_size(asink_1_auto_in_a_mem_0_size),
    .auto_in_a_mem_0_source(asink_1_auto_in_a_mem_0_source),
    .auto_in_a_mem_0_address(asink_1_auto_in_a_mem_0_address),
    .auto_in_a_mem_0_mask(asink_1_auto_in_a_mem_0_mask),
    .auto_in_a_mem_0_data(asink_1_auto_in_a_mem_0_data),
    .auto_in_a_mem_0_corrupt(asink_1_auto_in_a_mem_0_corrupt),
    .auto_in_a_mem_1_opcode(asink_1_auto_in_a_mem_1_opcode),
    .auto_in_a_mem_1_param(asink_1_auto_in_a_mem_1_param),
    .auto_in_a_mem_1_size(asink_1_auto_in_a_mem_1_size),
    .auto_in_a_mem_1_source(asink_1_auto_in_a_mem_1_source),
    .auto_in_a_mem_1_address(asink_1_auto_in_a_mem_1_address),
    .auto_in_a_mem_1_mask(asink_1_auto_in_a_mem_1_mask),
    .auto_in_a_mem_1_data(asink_1_auto_in_a_mem_1_data),
    .auto_in_a_mem_1_corrupt(asink_1_auto_in_a_mem_1_corrupt),
    .auto_in_a_mem_2_opcode(asink_1_auto_in_a_mem_2_opcode),
    .auto_in_a_mem_2_param(asink_1_auto_in_a_mem_2_param),
    .auto_in_a_mem_2_size(asink_1_auto_in_a_mem_2_size),
    .auto_in_a_mem_2_source(asink_1_auto_in_a_mem_2_source),
    .auto_in_a_mem_2_address(asink_1_auto_in_a_mem_2_address),
    .auto_in_a_mem_2_mask(asink_1_auto_in_a_mem_2_mask),
    .auto_in_a_mem_2_data(asink_1_auto_in_a_mem_2_data),
    .auto_in_a_mem_2_corrupt(asink_1_auto_in_a_mem_2_corrupt),
    .auto_in_a_mem_3_opcode(asink_1_auto_in_a_mem_3_opcode),
    .auto_in_a_mem_3_param(asink_1_auto_in_a_mem_3_param),
    .auto_in_a_mem_3_size(asink_1_auto_in_a_mem_3_size),
    .auto_in_a_mem_3_source(asink_1_auto_in_a_mem_3_source),
    .auto_in_a_mem_3_address(asink_1_auto_in_a_mem_3_address),
    .auto_in_a_mem_3_mask(asink_1_auto_in_a_mem_3_mask),
    .auto_in_a_mem_3_data(asink_1_auto_in_a_mem_3_data),
    .auto_in_a_mem_3_corrupt(asink_1_auto_in_a_mem_3_corrupt),
    .auto_in_a_mem_4_opcode(asink_1_auto_in_a_mem_4_opcode),
    .auto_in_a_mem_4_param(asink_1_auto_in_a_mem_4_param),
    .auto_in_a_mem_4_size(asink_1_auto_in_a_mem_4_size),
    .auto_in_a_mem_4_source(asink_1_auto_in_a_mem_4_source),
    .auto_in_a_mem_4_address(asink_1_auto_in_a_mem_4_address),
    .auto_in_a_mem_4_mask(asink_1_auto_in_a_mem_4_mask),
    .auto_in_a_mem_4_data(asink_1_auto_in_a_mem_4_data),
    .auto_in_a_mem_4_corrupt(asink_1_auto_in_a_mem_4_corrupt),
    .auto_in_a_mem_5_opcode(asink_1_auto_in_a_mem_5_opcode),
    .auto_in_a_mem_5_param(asink_1_auto_in_a_mem_5_param),
    .auto_in_a_mem_5_size(asink_1_auto_in_a_mem_5_size),
    .auto_in_a_mem_5_source(asink_1_auto_in_a_mem_5_source),
    .auto_in_a_mem_5_address(asink_1_auto_in_a_mem_5_address),
    .auto_in_a_mem_5_mask(asink_1_auto_in_a_mem_5_mask),
    .auto_in_a_mem_5_data(asink_1_auto_in_a_mem_5_data),
    .auto_in_a_mem_5_corrupt(asink_1_auto_in_a_mem_5_corrupt),
    .auto_in_a_mem_6_opcode(asink_1_auto_in_a_mem_6_opcode),
    .auto_in_a_mem_6_param(asink_1_auto_in_a_mem_6_param),
    .auto_in_a_mem_6_size(asink_1_auto_in_a_mem_6_size),
    .auto_in_a_mem_6_source(asink_1_auto_in_a_mem_6_source),
    .auto_in_a_mem_6_address(asink_1_auto_in_a_mem_6_address),
    .auto_in_a_mem_6_mask(asink_1_auto_in_a_mem_6_mask),
    .auto_in_a_mem_6_data(asink_1_auto_in_a_mem_6_data),
    .auto_in_a_mem_6_corrupt(asink_1_auto_in_a_mem_6_corrupt),
    .auto_in_a_mem_7_opcode(asink_1_auto_in_a_mem_7_opcode),
    .auto_in_a_mem_7_param(asink_1_auto_in_a_mem_7_param),
    .auto_in_a_mem_7_size(asink_1_auto_in_a_mem_7_size),
    .auto_in_a_mem_7_source(asink_1_auto_in_a_mem_7_source),
    .auto_in_a_mem_7_address(asink_1_auto_in_a_mem_7_address),
    .auto_in_a_mem_7_mask(asink_1_auto_in_a_mem_7_mask),
    .auto_in_a_mem_7_data(asink_1_auto_in_a_mem_7_data),
    .auto_in_a_mem_7_corrupt(asink_1_auto_in_a_mem_7_corrupt),
    .auto_in_a_ridx(asink_1_auto_in_a_ridx),
    .auto_in_a_widx(asink_1_auto_in_a_widx),
    .auto_in_a_safe_ridx_valid(asink_1_auto_in_a_safe_ridx_valid),
    .auto_in_a_safe_widx_valid(asink_1_auto_in_a_safe_widx_valid),
    .auto_in_a_safe_source_reset_n(asink_1_auto_in_a_safe_source_reset_n),
    .auto_in_a_safe_sink_reset_n(asink_1_auto_in_a_safe_sink_reset_n),
    .auto_in_d_mem_0_opcode(asink_1_auto_in_d_mem_0_opcode),
    .auto_in_d_mem_0_param(asink_1_auto_in_d_mem_0_param),
    .auto_in_d_mem_0_size(asink_1_auto_in_d_mem_0_size),
    .auto_in_d_mem_0_source(asink_1_auto_in_d_mem_0_source),
    .auto_in_d_mem_0_sink(asink_1_auto_in_d_mem_0_sink),
    .auto_in_d_mem_0_denied(asink_1_auto_in_d_mem_0_denied),
    .auto_in_d_mem_0_data(asink_1_auto_in_d_mem_0_data),
    .auto_in_d_mem_0_corrupt(asink_1_auto_in_d_mem_0_corrupt),
    .auto_in_d_mem_1_opcode(asink_1_auto_in_d_mem_1_opcode),
    .auto_in_d_mem_1_param(asink_1_auto_in_d_mem_1_param),
    .auto_in_d_mem_1_size(asink_1_auto_in_d_mem_1_size),
    .auto_in_d_mem_1_source(asink_1_auto_in_d_mem_1_source),
    .auto_in_d_mem_1_sink(asink_1_auto_in_d_mem_1_sink),
    .auto_in_d_mem_1_denied(asink_1_auto_in_d_mem_1_denied),
    .auto_in_d_mem_1_data(asink_1_auto_in_d_mem_1_data),
    .auto_in_d_mem_1_corrupt(asink_1_auto_in_d_mem_1_corrupt),
    .auto_in_d_mem_2_opcode(asink_1_auto_in_d_mem_2_opcode),
    .auto_in_d_mem_2_param(asink_1_auto_in_d_mem_2_param),
    .auto_in_d_mem_2_size(asink_1_auto_in_d_mem_2_size),
    .auto_in_d_mem_2_source(asink_1_auto_in_d_mem_2_source),
    .auto_in_d_mem_2_sink(asink_1_auto_in_d_mem_2_sink),
    .auto_in_d_mem_2_denied(asink_1_auto_in_d_mem_2_denied),
    .auto_in_d_mem_2_data(asink_1_auto_in_d_mem_2_data),
    .auto_in_d_mem_2_corrupt(asink_1_auto_in_d_mem_2_corrupt),
    .auto_in_d_mem_3_opcode(asink_1_auto_in_d_mem_3_opcode),
    .auto_in_d_mem_3_param(asink_1_auto_in_d_mem_3_param),
    .auto_in_d_mem_3_size(asink_1_auto_in_d_mem_3_size),
    .auto_in_d_mem_3_source(asink_1_auto_in_d_mem_3_source),
    .auto_in_d_mem_3_sink(asink_1_auto_in_d_mem_3_sink),
    .auto_in_d_mem_3_denied(asink_1_auto_in_d_mem_3_denied),
    .auto_in_d_mem_3_data(asink_1_auto_in_d_mem_3_data),
    .auto_in_d_mem_3_corrupt(asink_1_auto_in_d_mem_3_corrupt),
    .auto_in_d_mem_4_opcode(asink_1_auto_in_d_mem_4_opcode),
    .auto_in_d_mem_4_param(asink_1_auto_in_d_mem_4_param),
    .auto_in_d_mem_4_size(asink_1_auto_in_d_mem_4_size),
    .auto_in_d_mem_4_source(asink_1_auto_in_d_mem_4_source),
    .auto_in_d_mem_4_sink(asink_1_auto_in_d_mem_4_sink),
    .auto_in_d_mem_4_denied(asink_1_auto_in_d_mem_4_denied),
    .auto_in_d_mem_4_data(asink_1_auto_in_d_mem_4_data),
    .auto_in_d_mem_4_corrupt(asink_1_auto_in_d_mem_4_corrupt),
    .auto_in_d_mem_5_opcode(asink_1_auto_in_d_mem_5_opcode),
    .auto_in_d_mem_5_param(asink_1_auto_in_d_mem_5_param),
    .auto_in_d_mem_5_size(asink_1_auto_in_d_mem_5_size),
    .auto_in_d_mem_5_source(asink_1_auto_in_d_mem_5_source),
    .auto_in_d_mem_5_sink(asink_1_auto_in_d_mem_5_sink),
    .auto_in_d_mem_5_denied(asink_1_auto_in_d_mem_5_denied),
    .auto_in_d_mem_5_data(asink_1_auto_in_d_mem_5_data),
    .auto_in_d_mem_5_corrupt(asink_1_auto_in_d_mem_5_corrupt),
    .auto_in_d_mem_6_opcode(asink_1_auto_in_d_mem_6_opcode),
    .auto_in_d_mem_6_param(asink_1_auto_in_d_mem_6_param),
    .auto_in_d_mem_6_size(asink_1_auto_in_d_mem_6_size),
    .auto_in_d_mem_6_source(asink_1_auto_in_d_mem_6_source),
    .auto_in_d_mem_6_sink(asink_1_auto_in_d_mem_6_sink),
    .auto_in_d_mem_6_denied(asink_1_auto_in_d_mem_6_denied),
    .auto_in_d_mem_6_data(asink_1_auto_in_d_mem_6_data),
    .auto_in_d_mem_6_corrupt(asink_1_auto_in_d_mem_6_corrupt),
    .auto_in_d_mem_7_opcode(asink_1_auto_in_d_mem_7_opcode),
    .auto_in_d_mem_7_param(asink_1_auto_in_d_mem_7_param),
    .auto_in_d_mem_7_size(asink_1_auto_in_d_mem_7_size),
    .auto_in_d_mem_7_source(asink_1_auto_in_d_mem_7_source),
    .auto_in_d_mem_7_sink(asink_1_auto_in_d_mem_7_sink),
    .auto_in_d_mem_7_denied(asink_1_auto_in_d_mem_7_denied),
    .auto_in_d_mem_7_data(asink_1_auto_in_d_mem_7_data),
    .auto_in_d_mem_7_corrupt(asink_1_auto_in_d_mem_7_corrupt),
    .auto_in_d_ridx(asink_1_auto_in_d_ridx),
    .auto_in_d_widx(asink_1_auto_in_d_widx),
    .auto_in_d_safe_ridx_valid(asink_1_auto_in_d_safe_ridx_valid),
    .auto_in_d_safe_widx_valid(asink_1_auto_in_d_safe_widx_valid),
    .auto_in_d_safe_source_reset_n(asink_1_auto_in_d_safe_source_reset_n),
    .auto_in_d_safe_sink_reset_n(asink_1_auto_in_d_safe_sink_reset_n),
    .auto_out_a_ready(asink_1_auto_out_a_ready),
    .auto_out_a_valid(asink_1_auto_out_a_valid),
    .auto_out_a_bits_opcode(asink_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(asink_1_auto_out_a_bits_param),
    .auto_out_a_bits_size(asink_1_auto_out_a_bits_size),
    .auto_out_a_bits_source(asink_1_auto_out_a_bits_source),
    .auto_out_a_bits_address(asink_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask(asink_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data(asink_1_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(asink_1_auto_out_a_bits_corrupt),
    .auto_out_d_ready(asink_1_auto_out_d_ready),
    .auto_out_d_valid(asink_1_auto_out_d_valid),
    .auto_out_d_bits_opcode(asink_1_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(asink_1_auto_out_d_bits_size),
    .auto_out_d_bits_source(asink_1_auto_out_d_bits_source),
    .auto_out_d_bits_denied(asink_1_auto_out_d_bits_denied),
    .auto_out_d_bits_data(asink_1_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(asink_1_auto_out_d_bits_corrupt)
  );
  TLAsyncCrossingSource_1 asource ( 
    .clock(asource_clock),
    .reset(asource_reset),
    .auto_in_a_ready(asource_auto_in_a_ready),
    .auto_in_a_valid(asource_auto_in_a_valid),
    .auto_in_a_bits_opcode(asource_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(asource_auto_in_a_bits_param),
    .auto_in_a_bits_size(asource_auto_in_a_bits_size),
    .auto_in_a_bits_source(asource_auto_in_a_bits_source),
    .auto_in_a_bits_address(asource_auto_in_a_bits_address),
    .auto_in_a_bits_mask(asource_auto_in_a_bits_mask),
    .auto_in_a_bits_data(asource_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(asource_auto_in_a_bits_corrupt),
    .auto_in_d_ready(asource_auto_in_d_ready),
    .auto_in_d_valid(asource_auto_in_d_valid),
    .auto_in_d_bits_opcode(asource_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(asource_auto_in_d_bits_param),
    .auto_in_d_bits_size(asource_auto_in_d_bits_size),
    .auto_in_d_bits_source(asource_auto_in_d_bits_source),
    .auto_in_d_bits_sink(asource_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(asource_auto_in_d_bits_denied),
    .auto_in_d_bits_data(asource_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(asource_auto_in_d_bits_corrupt),
    .auto_out_a_mem_0_opcode(asource_auto_out_a_mem_0_opcode),
    .auto_out_a_mem_0_param(asource_auto_out_a_mem_0_param),
    .auto_out_a_mem_0_size(asource_auto_out_a_mem_0_size),
    .auto_out_a_mem_0_source(asource_auto_out_a_mem_0_source),
    .auto_out_a_mem_0_address(asource_auto_out_a_mem_0_address),
    .auto_out_a_mem_0_mask(asource_auto_out_a_mem_0_mask),
    .auto_out_a_mem_0_data(asource_auto_out_a_mem_0_data),
    .auto_out_a_mem_0_corrupt(asource_auto_out_a_mem_0_corrupt),
    .auto_out_a_mem_1_opcode(asource_auto_out_a_mem_1_opcode),
    .auto_out_a_mem_1_param(asource_auto_out_a_mem_1_param),
    .auto_out_a_mem_1_size(asource_auto_out_a_mem_1_size),
    .auto_out_a_mem_1_source(asource_auto_out_a_mem_1_source),
    .auto_out_a_mem_1_address(asource_auto_out_a_mem_1_address),
    .auto_out_a_mem_1_mask(asource_auto_out_a_mem_1_mask),
    .auto_out_a_mem_1_data(asource_auto_out_a_mem_1_data),
    .auto_out_a_mem_1_corrupt(asource_auto_out_a_mem_1_corrupt),
    .auto_out_a_mem_2_opcode(asource_auto_out_a_mem_2_opcode),
    .auto_out_a_mem_2_param(asource_auto_out_a_mem_2_param),
    .auto_out_a_mem_2_size(asource_auto_out_a_mem_2_size),
    .auto_out_a_mem_2_source(asource_auto_out_a_mem_2_source),
    .auto_out_a_mem_2_address(asource_auto_out_a_mem_2_address),
    .auto_out_a_mem_2_mask(asource_auto_out_a_mem_2_mask),
    .auto_out_a_mem_2_data(asource_auto_out_a_mem_2_data),
    .auto_out_a_mem_2_corrupt(asource_auto_out_a_mem_2_corrupt),
    .auto_out_a_mem_3_opcode(asource_auto_out_a_mem_3_opcode),
    .auto_out_a_mem_3_param(asource_auto_out_a_mem_3_param),
    .auto_out_a_mem_3_size(asource_auto_out_a_mem_3_size),
    .auto_out_a_mem_3_source(asource_auto_out_a_mem_3_source),
    .auto_out_a_mem_3_address(asource_auto_out_a_mem_3_address),
    .auto_out_a_mem_3_mask(asource_auto_out_a_mem_3_mask),
    .auto_out_a_mem_3_data(asource_auto_out_a_mem_3_data),
    .auto_out_a_mem_3_corrupt(asource_auto_out_a_mem_3_corrupt),
    .auto_out_a_mem_4_opcode(asource_auto_out_a_mem_4_opcode),
    .auto_out_a_mem_4_param(asource_auto_out_a_mem_4_param),
    .auto_out_a_mem_4_size(asource_auto_out_a_mem_4_size),
    .auto_out_a_mem_4_source(asource_auto_out_a_mem_4_source),
    .auto_out_a_mem_4_address(asource_auto_out_a_mem_4_address),
    .auto_out_a_mem_4_mask(asource_auto_out_a_mem_4_mask),
    .auto_out_a_mem_4_data(asource_auto_out_a_mem_4_data),
    .auto_out_a_mem_4_corrupt(asource_auto_out_a_mem_4_corrupt),
    .auto_out_a_mem_5_opcode(asource_auto_out_a_mem_5_opcode),
    .auto_out_a_mem_5_param(asource_auto_out_a_mem_5_param),
    .auto_out_a_mem_5_size(asource_auto_out_a_mem_5_size),
    .auto_out_a_mem_5_source(asource_auto_out_a_mem_5_source),
    .auto_out_a_mem_5_address(asource_auto_out_a_mem_5_address),
    .auto_out_a_mem_5_mask(asource_auto_out_a_mem_5_mask),
    .auto_out_a_mem_5_data(asource_auto_out_a_mem_5_data),
    .auto_out_a_mem_5_corrupt(asource_auto_out_a_mem_5_corrupt),
    .auto_out_a_mem_6_opcode(asource_auto_out_a_mem_6_opcode),
    .auto_out_a_mem_6_param(asource_auto_out_a_mem_6_param),
    .auto_out_a_mem_6_size(asource_auto_out_a_mem_6_size),
    .auto_out_a_mem_6_source(asource_auto_out_a_mem_6_source),
    .auto_out_a_mem_6_address(asource_auto_out_a_mem_6_address),
    .auto_out_a_mem_6_mask(asource_auto_out_a_mem_6_mask),
    .auto_out_a_mem_6_data(asource_auto_out_a_mem_6_data),
    .auto_out_a_mem_6_corrupt(asource_auto_out_a_mem_6_corrupt),
    .auto_out_a_mem_7_opcode(asource_auto_out_a_mem_7_opcode),
    .auto_out_a_mem_7_param(asource_auto_out_a_mem_7_param),
    .auto_out_a_mem_7_size(asource_auto_out_a_mem_7_size),
    .auto_out_a_mem_7_source(asource_auto_out_a_mem_7_source),
    .auto_out_a_mem_7_address(asource_auto_out_a_mem_7_address),
    .auto_out_a_mem_7_mask(asource_auto_out_a_mem_7_mask),
    .auto_out_a_mem_7_data(asource_auto_out_a_mem_7_data),
    .auto_out_a_mem_7_corrupt(asource_auto_out_a_mem_7_corrupt),
    .auto_out_a_ridx(asource_auto_out_a_ridx),
    .auto_out_a_widx(asource_auto_out_a_widx),
    .auto_out_a_safe_ridx_valid(asource_auto_out_a_safe_ridx_valid),
    .auto_out_a_safe_widx_valid(asource_auto_out_a_safe_widx_valid),
    .auto_out_a_safe_source_reset_n(asource_auto_out_a_safe_source_reset_n),
    .auto_out_a_safe_sink_reset_n(asource_auto_out_a_safe_sink_reset_n),
    .auto_out_d_mem_0_opcode(asource_auto_out_d_mem_0_opcode),
    .auto_out_d_mem_0_param(asource_auto_out_d_mem_0_param),
    .auto_out_d_mem_0_size(asource_auto_out_d_mem_0_size),
    .auto_out_d_mem_0_source(asource_auto_out_d_mem_0_source),
    .auto_out_d_mem_0_sink(asource_auto_out_d_mem_0_sink),
    .auto_out_d_mem_0_denied(asource_auto_out_d_mem_0_denied),
    .auto_out_d_mem_0_data(asource_auto_out_d_mem_0_data),
    .auto_out_d_mem_0_corrupt(asource_auto_out_d_mem_0_corrupt),
    .auto_out_d_mem_1_opcode(asource_auto_out_d_mem_1_opcode),
    .auto_out_d_mem_1_param(asource_auto_out_d_mem_1_param),
    .auto_out_d_mem_1_size(asource_auto_out_d_mem_1_size),
    .auto_out_d_mem_1_source(asource_auto_out_d_mem_1_source),
    .auto_out_d_mem_1_sink(asource_auto_out_d_mem_1_sink),
    .auto_out_d_mem_1_denied(asource_auto_out_d_mem_1_denied),
    .auto_out_d_mem_1_data(asource_auto_out_d_mem_1_data),
    .auto_out_d_mem_1_corrupt(asource_auto_out_d_mem_1_corrupt),
    .auto_out_d_mem_2_opcode(asource_auto_out_d_mem_2_opcode),
    .auto_out_d_mem_2_param(asource_auto_out_d_mem_2_param),
    .auto_out_d_mem_2_size(asource_auto_out_d_mem_2_size),
    .auto_out_d_mem_2_source(asource_auto_out_d_mem_2_source),
    .auto_out_d_mem_2_sink(asource_auto_out_d_mem_2_sink),
    .auto_out_d_mem_2_denied(asource_auto_out_d_mem_2_denied),
    .auto_out_d_mem_2_data(asource_auto_out_d_mem_2_data),
    .auto_out_d_mem_2_corrupt(asource_auto_out_d_mem_2_corrupt),
    .auto_out_d_mem_3_opcode(asource_auto_out_d_mem_3_opcode),
    .auto_out_d_mem_3_param(asource_auto_out_d_mem_3_param),
    .auto_out_d_mem_3_size(asource_auto_out_d_mem_3_size),
    .auto_out_d_mem_3_source(asource_auto_out_d_mem_3_source),
    .auto_out_d_mem_3_sink(asource_auto_out_d_mem_3_sink),
    .auto_out_d_mem_3_denied(asource_auto_out_d_mem_3_denied),
    .auto_out_d_mem_3_data(asource_auto_out_d_mem_3_data),
    .auto_out_d_mem_3_corrupt(asource_auto_out_d_mem_3_corrupt),
    .auto_out_d_mem_4_opcode(asource_auto_out_d_mem_4_opcode),
    .auto_out_d_mem_4_param(asource_auto_out_d_mem_4_param),
    .auto_out_d_mem_4_size(asource_auto_out_d_mem_4_size),
    .auto_out_d_mem_4_source(asource_auto_out_d_mem_4_source),
    .auto_out_d_mem_4_sink(asource_auto_out_d_mem_4_sink),
    .auto_out_d_mem_4_denied(asource_auto_out_d_mem_4_denied),
    .auto_out_d_mem_4_data(asource_auto_out_d_mem_4_data),
    .auto_out_d_mem_4_corrupt(asource_auto_out_d_mem_4_corrupt),
    .auto_out_d_mem_5_opcode(asource_auto_out_d_mem_5_opcode),
    .auto_out_d_mem_5_param(asource_auto_out_d_mem_5_param),
    .auto_out_d_mem_5_size(asource_auto_out_d_mem_5_size),
    .auto_out_d_mem_5_source(asource_auto_out_d_mem_5_source),
    .auto_out_d_mem_5_sink(asource_auto_out_d_mem_5_sink),
    .auto_out_d_mem_5_denied(asource_auto_out_d_mem_5_denied),
    .auto_out_d_mem_5_data(asource_auto_out_d_mem_5_data),
    .auto_out_d_mem_5_corrupt(asource_auto_out_d_mem_5_corrupt),
    .auto_out_d_mem_6_opcode(asource_auto_out_d_mem_6_opcode),
    .auto_out_d_mem_6_param(asource_auto_out_d_mem_6_param),
    .auto_out_d_mem_6_size(asource_auto_out_d_mem_6_size),
    .auto_out_d_mem_6_source(asource_auto_out_d_mem_6_source),
    .auto_out_d_mem_6_sink(asource_auto_out_d_mem_6_sink),
    .auto_out_d_mem_6_denied(asource_auto_out_d_mem_6_denied),
    .auto_out_d_mem_6_data(asource_auto_out_d_mem_6_data),
    .auto_out_d_mem_6_corrupt(asource_auto_out_d_mem_6_corrupt),
    .auto_out_d_mem_7_opcode(asource_auto_out_d_mem_7_opcode),
    .auto_out_d_mem_7_param(asource_auto_out_d_mem_7_param),
    .auto_out_d_mem_7_size(asource_auto_out_d_mem_7_size),
    .auto_out_d_mem_7_source(asource_auto_out_d_mem_7_source),
    .auto_out_d_mem_7_sink(asource_auto_out_d_mem_7_sink),
    .auto_out_d_mem_7_denied(asource_auto_out_d_mem_7_denied),
    .auto_out_d_mem_7_data(asource_auto_out_d_mem_7_data),
    .auto_out_d_mem_7_corrupt(asource_auto_out_d_mem_7_corrupt),
    .auto_out_d_ridx(asource_auto_out_d_ridx),
    .auto_out_d_widx(asource_auto_out_d_widx),
    .auto_out_d_safe_ridx_valid(asource_auto_out_d_safe_ridx_valid),
    .auto_out_d_safe_widx_valid(asource_auto_out_d_safe_widx_valid),
    .auto_out_d_safe_source_reset_n(asource_auto_out_d_safe_source_reset_n),
    .auto_out_d_safe_sink_reset_n(asource_auto_out_d_safe_sink_reset_n)
  );
  IntSyncCrossingSource_3 intsource ( 
    .clock(intsource_clock),
    .reset(intsource_reset),
    .auto_in_0(intsource_auto_in_0),
    .auto_out_sync_0(intsource_auto_out_sync_0)
  );
  IBUFDS_GTE2 ibufds_gte2 ( 
    .IB(ibufds_gte2_IB),
    .I(ibufds_gte2_I),
    .CEB(ibufds_gte2_CEB),
    .ODIV2(ibufds_gte2_ODIV2),
    .O(ibufds_gte2_O)
  );
  assign auto_int_out_xing_out_sync_0 = intsource_auto_out_sync_0; 
  assign auto_tl_out_xing_out_a_mem_0_opcode = asource_auto_out_a_mem_0_opcode; 
  assign auto_tl_out_xing_out_a_mem_0_param = asource_auto_out_a_mem_0_param; 
  assign auto_tl_out_xing_out_a_mem_0_size = asource_auto_out_a_mem_0_size; 
  assign auto_tl_out_xing_out_a_mem_0_source = asource_auto_out_a_mem_0_source; 
  assign auto_tl_out_xing_out_a_mem_0_address = asource_auto_out_a_mem_0_address; 
  assign auto_tl_out_xing_out_a_mem_0_mask = asource_auto_out_a_mem_0_mask; 
  assign auto_tl_out_xing_out_a_mem_0_data = asource_auto_out_a_mem_0_data; 
  assign auto_tl_out_xing_out_a_mem_0_corrupt = asource_auto_out_a_mem_0_corrupt; 
  assign auto_tl_out_xing_out_a_mem_1_opcode = asource_auto_out_a_mem_1_opcode; 
  assign auto_tl_out_xing_out_a_mem_1_param = asource_auto_out_a_mem_1_param; 
  assign auto_tl_out_xing_out_a_mem_1_size = asource_auto_out_a_mem_1_size; 
  assign auto_tl_out_xing_out_a_mem_1_source = asource_auto_out_a_mem_1_source; 
  assign auto_tl_out_xing_out_a_mem_1_address = asource_auto_out_a_mem_1_address; 
  assign auto_tl_out_xing_out_a_mem_1_mask = asource_auto_out_a_mem_1_mask; 
  assign auto_tl_out_xing_out_a_mem_1_data = asource_auto_out_a_mem_1_data; 
  assign auto_tl_out_xing_out_a_mem_1_corrupt = asource_auto_out_a_mem_1_corrupt; 
  assign auto_tl_out_xing_out_a_mem_2_opcode = asource_auto_out_a_mem_2_opcode; 
  assign auto_tl_out_xing_out_a_mem_2_param = asource_auto_out_a_mem_2_param; 
  assign auto_tl_out_xing_out_a_mem_2_size = asource_auto_out_a_mem_2_size; 
  assign auto_tl_out_xing_out_a_mem_2_source = asource_auto_out_a_mem_2_source; 
  assign auto_tl_out_xing_out_a_mem_2_address = asource_auto_out_a_mem_2_address; 
  assign auto_tl_out_xing_out_a_mem_2_mask = asource_auto_out_a_mem_2_mask; 
  assign auto_tl_out_xing_out_a_mem_2_data = asource_auto_out_a_mem_2_data; 
  assign auto_tl_out_xing_out_a_mem_2_corrupt = asource_auto_out_a_mem_2_corrupt; 
  assign auto_tl_out_xing_out_a_mem_3_opcode = asource_auto_out_a_mem_3_opcode; 
  assign auto_tl_out_xing_out_a_mem_3_param = asource_auto_out_a_mem_3_param; 
  assign auto_tl_out_xing_out_a_mem_3_size = asource_auto_out_a_mem_3_size; 
  assign auto_tl_out_xing_out_a_mem_3_source = asource_auto_out_a_mem_3_source; 
  assign auto_tl_out_xing_out_a_mem_3_address = asource_auto_out_a_mem_3_address; 
  assign auto_tl_out_xing_out_a_mem_3_mask = asource_auto_out_a_mem_3_mask; 
  assign auto_tl_out_xing_out_a_mem_3_data = asource_auto_out_a_mem_3_data; 
  assign auto_tl_out_xing_out_a_mem_3_corrupt = asource_auto_out_a_mem_3_corrupt; 
  assign auto_tl_out_xing_out_a_mem_4_opcode = asource_auto_out_a_mem_4_opcode; 
  assign auto_tl_out_xing_out_a_mem_4_param = asource_auto_out_a_mem_4_param; 
  assign auto_tl_out_xing_out_a_mem_4_size = asource_auto_out_a_mem_4_size; 
  assign auto_tl_out_xing_out_a_mem_4_source = asource_auto_out_a_mem_4_source; 
  assign auto_tl_out_xing_out_a_mem_4_address = asource_auto_out_a_mem_4_address; 
  assign auto_tl_out_xing_out_a_mem_4_mask = asource_auto_out_a_mem_4_mask; 
  assign auto_tl_out_xing_out_a_mem_4_data = asource_auto_out_a_mem_4_data; 
  assign auto_tl_out_xing_out_a_mem_4_corrupt = asource_auto_out_a_mem_4_corrupt; 
  assign auto_tl_out_xing_out_a_mem_5_opcode = asource_auto_out_a_mem_5_opcode; 
  assign auto_tl_out_xing_out_a_mem_5_param = asource_auto_out_a_mem_5_param; 
  assign auto_tl_out_xing_out_a_mem_5_size = asource_auto_out_a_mem_5_size; 
  assign auto_tl_out_xing_out_a_mem_5_source = asource_auto_out_a_mem_5_source; 
  assign auto_tl_out_xing_out_a_mem_5_address = asource_auto_out_a_mem_5_address; 
  assign auto_tl_out_xing_out_a_mem_5_mask = asource_auto_out_a_mem_5_mask; 
  assign auto_tl_out_xing_out_a_mem_5_data = asource_auto_out_a_mem_5_data; 
  assign auto_tl_out_xing_out_a_mem_5_corrupt = asource_auto_out_a_mem_5_corrupt; 
  assign auto_tl_out_xing_out_a_mem_6_opcode = asource_auto_out_a_mem_6_opcode; 
  assign auto_tl_out_xing_out_a_mem_6_param = asource_auto_out_a_mem_6_param; 
  assign auto_tl_out_xing_out_a_mem_6_size = asource_auto_out_a_mem_6_size; 
  assign auto_tl_out_xing_out_a_mem_6_source = asource_auto_out_a_mem_6_source; 
  assign auto_tl_out_xing_out_a_mem_6_address = asource_auto_out_a_mem_6_address; 
  assign auto_tl_out_xing_out_a_mem_6_mask = asource_auto_out_a_mem_6_mask; 
  assign auto_tl_out_xing_out_a_mem_6_data = asource_auto_out_a_mem_6_data; 
  assign auto_tl_out_xing_out_a_mem_6_corrupt = asource_auto_out_a_mem_6_corrupt; 
  assign auto_tl_out_xing_out_a_mem_7_opcode = asource_auto_out_a_mem_7_opcode; 
  assign auto_tl_out_xing_out_a_mem_7_param = asource_auto_out_a_mem_7_param; 
  assign auto_tl_out_xing_out_a_mem_7_size = asource_auto_out_a_mem_7_size; 
  assign auto_tl_out_xing_out_a_mem_7_source = asource_auto_out_a_mem_7_source; 
  assign auto_tl_out_xing_out_a_mem_7_address = asource_auto_out_a_mem_7_address; 
  assign auto_tl_out_xing_out_a_mem_7_mask = asource_auto_out_a_mem_7_mask; 
  assign auto_tl_out_xing_out_a_mem_7_data = asource_auto_out_a_mem_7_data; 
  assign auto_tl_out_xing_out_a_mem_7_corrupt = asource_auto_out_a_mem_7_corrupt; 
  assign auto_tl_out_xing_out_a_widx = asource_auto_out_a_widx; 
  assign auto_tl_out_xing_out_a_safe_widx_valid = asource_auto_out_a_safe_widx_valid; 
  assign auto_tl_out_xing_out_a_safe_source_reset_n = asource_auto_out_a_safe_source_reset_n; 
  assign auto_tl_out_xing_out_d_ridx = asource_auto_out_d_ridx; 
  assign auto_tl_out_xing_out_d_safe_ridx_valid = asource_auto_out_d_safe_ridx_valid; 
  assign auto_tl_out_xing_out_d_safe_sink_reset_n = asource_auto_out_d_safe_sink_reset_n; 
  assign auto_tl_in_xing_in_1_a_ridx = asink_1_auto_in_a_ridx; 
  assign auto_tl_in_xing_in_1_a_safe_ridx_valid = asink_1_auto_in_a_safe_ridx_valid; 
  assign auto_tl_in_xing_in_1_a_safe_sink_reset_n = asink_1_auto_in_a_safe_sink_reset_n; 
  assign auto_tl_in_xing_in_1_d_mem_0_opcode = asink_1_auto_in_d_mem_0_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_0_param = asink_1_auto_in_d_mem_0_param; 
  assign auto_tl_in_xing_in_1_d_mem_0_size = asink_1_auto_in_d_mem_0_size; 
  assign auto_tl_in_xing_in_1_d_mem_0_source = asink_1_auto_in_d_mem_0_source; 
  assign auto_tl_in_xing_in_1_d_mem_0_sink = asink_1_auto_in_d_mem_0_sink; 
  assign auto_tl_in_xing_in_1_d_mem_0_denied = asink_1_auto_in_d_mem_0_denied; 
  assign auto_tl_in_xing_in_1_d_mem_0_data = asink_1_auto_in_d_mem_0_data; 
  assign auto_tl_in_xing_in_1_d_mem_0_corrupt = asink_1_auto_in_d_mem_0_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_1_opcode = asink_1_auto_in_d_mem_1_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_1_param = asink_1_auto_in_d_mem_1_param; 
  assign auto_tl_in_xing_in_1_d_mem_1_size = asink_1_auto_in_d_mem_1_size; 
  assign auto_tl_in_xing_in_1_d_mem_1_source = asink_1_auto_in_d_mem_1_source; 
  assign auto_tl_in_xing_in_1_d_mem_1_sink = asink_1_auto_in_d_mem_1_sink; 
  assign auto_tl_in_xing_in_1_d_mem_1_denied = asink_1_auto_in_d_mem_1_denied; 
  assign auto_tl_in_xing_in_1_d_mem_1_data = asink_1_auto_in_d_mem_1_data; 
  assign auto_tl_in_xing_in_1_d_mem_1_corrupt = asink_1_auto_in_d_mem_1_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_2_opcode = asink_1_auto_in_d_mem_2_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_2_param = asink_1_auto_in_d_mem_2_param; 
  assign auto_tl_in_xing_in_1_d_mem_2_size = asink_1_auto_in_d_mem_2_size; 
  assign auto_tl_in_xing_in_1_d_mem_2_source = asink_1_auto_in_d_mem_2_source; 
  assign auto_tl_in_xing_in_1_d_mem_2_sink = asink_1_auto_in_d_mem_2_sink; 
  assign auto_tl_in_xing_in_1_d_mem_2_denied = asink_1_auto_in_d_mem_2_denied; 
  assign auto_tl_in_xing_in_1_d_mem_2_data = asink_1_auto_in_d_mem_2_data; 
  assign auto_tl_in_xing_in_1_d_mem_2_corrupt = asink_1_auto_in_d_mem_2_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_3_opcode = asink_1_auto_in_d_mem_3_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_3_param = asink_1_auto_in_d_mem_3_param; 
  assign auto_tl_in_xing_in_1_d_mem_3_size = asink_1_auto_in_d_mem_3_size; 
  assign auto_tl_in_xing_in_1_d_mem_3_source = asink_1_auto_in_d_mem_3_source; 
  assign auto_tl_in_xing_in_1_d_mem_3_sink = asink_1_auto_in_d_mem_3_sink; 
  assign auto_tl_in_xing_in_1_d_mem_3_denied = asink_1_auto_in_d_mem_3_denied; 
  assign auto_tl_in_xing_in_1_d_mem_3_data = asink_1_auto_in_d_mem_3_data; 
  assign auto_tl_in_xing_in_1_d_mem_3_corrupt = asink_1_auto_in_d_mem_3_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_4_opcode = asink_1_auto_in_d_mem_4_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_4_param = asink_1_auto_in_d_mem_4_param; 
  assign auto_tl_in_xing_in_1_d_mem_4_size = asink_1_auto_in_d_mem_4_size; 
  assign auto_tl_in_xing_in_1_d_mem_4_source = asink_1_auto_in_d_mem_4_source; 
  assign auto_tl_in_xing_in_1_d_mem_4_sink = asink_1_auto_in_d_mem_4_sink; 
  assign auto_tl_in_xing_in_1_d_mem_4_denied = asink_1_auto_in_d_mem_4_denied; 
  assign auto_tl_in_xing_in_1_d_mem_4_data = asink_1_auto_in_d_mem_4_data; 
  assign auto_tl_in_xing_in_1_d_mem_4_corrupt = asink_1_auto_in_d_mem_4_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_5_opcode = asink_1_auto_in_d_mem_5_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_5_param = asink_1_auto_in_d_mem_5_param; 
  assign auto_tl_in_xing_in_1_d_mem_5_size = asink_1_auto_in_d_mem_5_size; 
  assign auto_tl_in_xing_in_1_d_mem_5_source = asink_1_auto_in_d_mem_5_source; 
  assign auto_tl_in_xing_in_1_d_mem_5_sink = asink_1_auto_in_d_mem_5_sink; 
  assign auto_tl_in_xing_in_1_d_mem_5_denied = asink_1_auto_in_d_mem_5_denied; 
  assign auto_tl_in_xing_in_1_d_mem_5_data = asink_1_auto_in_d_mem_5_data; 
  assign auto_tl_in_xing_in_1_d_mem_5_corrupt = asink_1_auto_in_d_mem_5_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_6_opcode = asink_1_auto_in_d_mem_6_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_6_param = asink_1_auto_in_d_mem_6_param; 
  assign auto_tl_in_xing_in_1_d_mem_6_size = asink_1_auto_in_d_mem_6_size; 
  assign auto_tl_in_xing_in_1_d_mem_6_source = asink_1_auto_in_d_mem_6_source; 
  assign auto_tl_in_xing_in_1_d_mem_6_sink = asink_1_auto_in_d_mem_6_sink; 
  assign auto_tl_in_xing_in_1_d_mem_6_denied = asink_1_auto_in_d_mem_6_denied; 
  assign auto_tl_in_xing_in_1_d_mem_6_data = asink_1_auto_in_d_mem_6_data; 
  assign auto_tl_in_xing_in_1_d_mem_6_corrupt = asink_1_auto_in_d_mem_6_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_7_opcode = asink_1_auto_in_d_mem_7_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_7_param = asink_1_auto_in_d_mem_7_param; 
  assign auto_tl_in_xing_in_1_d_mem_7_size = asink_1_auto_in_d_mem_7_size; 
  assign auto_tl_in_xing_in_1_d_mem_7_source = asink_1_auto_in_d_mem_7_source; 
  assign auto_tl_in_xing_in_1_d_mem_7_sink = asink_1_auto_in_d_mem_7_sink; 
  assign auto_tl_in_xing_in_1_d_mem_7_denied = asink_1_auto_in_d_mem_7_denied; 
  assign auto_tl_in_xing_in_1_d_mem_7_data = asink_1_auto_in_d_mem_7_data; 
  assign auto_tl_in_xing_in_1_d_mem_7_corrupt = asink_1_auto_in_d_mem_7_corrupt; 
  assign auto_tl_in_xing_in_1_d_widx = asink_1_auto_in_d_widx; 
  assign auto_tl_in_xing_in_1_d_safe_widx_valid = asink_1_auto_in_d_safe_widx_valid; 
  assign auto_tl_in_xing_in_1_d_safe_source_reset_n = asink_1_auto_in_d_safe_source_reset_n; 
  assign auto_tl_in_xing_in_0_a_ridx = asink_auto_in_a_ridx; 
  assign auto_tl_in_xing_in_0_a_safe_ridx_valid = asink_auto_in_a_safe_ridx_valid; 
  assign auto_tl_in_xing_in_0_a_safe_sink_reset_n = asink_auto_in_a_safe_sink_reset_n; 
  assign auto_tl_in_xing_in_0_d_mem_0_opcode = asink_auto_in_d_mem_0_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_0_param = asink_auto_in_d_mem_0_param; 
  assign auto_tl_in_xing_in_0_d_mem_0_size = asink_auto_in_d_mem_0_size; 
  assign auto_tl_in_xing_in_0_d_mem_0_source = asink_auto_in_d_mem_0_source; 
  assign auto_tl_in_xing_in_0_d_mem_0_sink = asink_auto_in_d_mem_0_sink; 
  assign auto_tl_in_xing_in_0_d_mem_0_denied = asink_auto_in_d_mem_0_denied; 
  assign auto_tl_in_xing_in_0_d_mem_0_data = asink_auto_in_d_mem_0_data; 
  assign auto_tl_in_xing_in_0_d_mem_0_corrupt = asink_auto_in_d_mem_0_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_1_opcode = asink_auto_in_d_mem_1_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_1_param = asink_auto_in_d_mem_1_param; 
  assign auto_tl_in_xing_in_0_d_mem_1_size = asink_auto_in_d_mem_1_size; 
  assign auto_tl_in_xing_in_0_d_mem_1_source = asink_auto_in_d_mem_1_source; 
  assign auto_tl_in_xing_in_0_d_mem_1_sink = asink_auto_in_d_mem_1_sink; 
  assign auto_tl_in_xing_in_0_d_mem_1_denied = asink_auto_in_d_mem_1_denied; 
  assign auto_tl_in_xing_in_0_d_mem_1_data = asink_auto_in_d_mem_1_data; 
  assign auto_tl_in_xing_in_0_d_mem_1_corrupt = asink_auto_in_d_mem_1_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_2_opcode = asink_auto_in_d_mem_2_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_2_param = asink_auto_in_d_mem_2_param; 
  assign auto_tl_in_xing_in_0_d_mem_2_size = asink_auto_in_d_mem_2_size; 
  assign auto_tl_in_xing_in_0_d_mem_2_source = asink_auto_in_d_mem_2_source; 
  assign auto_tl_in_xing_in_0_d_mem_2_sink = asink_auto_in_d_mem_2_sink; 
  assign auto_tl_in_xing_in_0_d_mem_2_denied = asink_auto_in_d_mem_2_denied; 
  assign auto_tl_in_xing_in_0_d_mem_2_data = asink_auto_in_d_mem_2_data; 
  assign auto_tl_in_xing_in_0_d_mem_2_corrupt = asink_auto_in_d_mem_2_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_3_opcode = asink_auto_in_d_mem_3_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_3_param = asink_auto_in_d_mem_3_param; 
  assign auto_tl_in_xing_in_0_d_mem_3_size = asink_auto_in_d_mem_3_size; 
  assign auto_tl_in_xing_in_0_d_mem_3_source = asink_auto_in_d_mem_3_source; 
  assign auto_tl_in_xing_in_0_d_mem_3_sink = asink_auto_in_d_mem_3_sink; 
  assign auto_tl_in_xing_in_0_d_mem_3_denied = asink_auto_in_d_mem_3_denied; 
  assign auto_tl_in_xing_in_0_d_mem_3_data = asink_auto_in_d_mem_3_data; 
  assign auto_tl_in_xing_in_0_d_mem_3_corrupt = asink_auto_in_d_mem_3_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_4_opcode = asink_auto_in_d_mem_4_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_4_param = asink_auto_in_d_mem_4_param; 
  assign auto_tl_in_xing_in_0_d_mem_4_size = asink_auto_in_d_mem_4_size; 
  assign auto_tl_in_xing_in_0_d_mem_4_source = asink_auto_in_d_mem_4_source; 
  assign auto_tl_in_xing_in_0_d_mem_4_sink = asink_auto_in_d_mem_4_sink; 
  assign auto_tl_in_xing_in_0_d_mem_4_denied = asink_auto_in_d_mem_4_denied; 
  assign auto_tl_in_xing_in_0_d_mem_4_data = asink_auto_in_d_mem_4_data; 
  assign auto_tl_in_xing_in_0_d_mem_4_corrupt = asink_auto_in_d_mem_4_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_5_opcode = asink_auto_in_d_mem_5_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_5_param = asink_auto_in_d_mem_5_param; 
  assign auto_tl_in_xing_in_0_d_mem_5_size = asink_auto_in_d_mem_5_size; 
  assign auto_tl_in_xing_in_0_d_mem_5_source = asink_auto_in_d_mem_5_source; 
  assign auto_tl_in_xing_in_0_d_mem_5_sink = asink_auto_in_d_mem_5_sink; 
  assign auto_tl_in_xing_in_0_d_mem_5_denied = asink_auto_in_d_mem_5_denied; 
  assign auto_tl_in_xing_in_0_d_mem_5_data = asink_auto_in_d_mem_5_data; 
  assign auto_tl_in_xing_in_0_d_mem_5_corrupt = asink_auto_in_d_mem_5_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_6_opcode = asink_auto_in_d_mem_6_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_6_param = asink_auto_in_d_mem_6_param; 
  assign auto_tl_in_xing_in_0_d_mem_6_size = asink_auto_in_d_mem_6_size; 
  assign auto_tl_in_xing_in_0_d_mem_6_source = asink_auto_in_d_mem_6_source; 
  assign auto_tl_in_xing_in_0_d_mem_6_sink = asink_auto_in_d_mem_6_sink; 
  assign auto_tl_in_xing_in_0_d_mem_6_denied = asink_auto_in_d_mem_6_denied; 
  assign auto_tl_in_xing_in_0_d_mem_6_data = asink_auto_in_d_mem_6_data; 
  assign auto_tl_in_xing_in_0_d_mem_6_corrupt = asink_auto_in_d_mem_6_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_7_opcode = asink_auto_in_d_mem_7_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_7_param = asink_auto_in_d_mem_7_param; 
  assign auto_tl_in_xing_in_0_d_mem_7_size = asink_auto_in_d_mem_7_size; 
  assign auto_tl_in_xing_in_0_d_mem_7_source = asink_auto_in_d_mem_7_source; 
  assign auto_tl_in_xing_in_0_d_mem_7_sink = asink_auto_in_d_mem_7_sink; 
  assign auto_tl_in_xing_in_0_d_mem_7_denied = asink_auto_in_d_mem_7_denied; 
  assign auto_tl_in_xing_in_0_d_mem_7_data = asink_auto_in_d_mem_7_data; 
  assign auto_tl_in_xing_in_0_d_mem_7_corrupt = asink_auto_in_d_mem_7_corrupt; 
  assign auto_tl_in_xing_in_0_d_widx = asink_auto_in_d_widx; 
  assign auto_tl_in_xing_in_0_d_safe_widx_valid = asink_auto_in_d_safe_widx_valid; 
  assign auto_tl_in_xing_in_0_d_safe_source_reset_n = asink_auto_in_d_safe_source_reset_n; 
  assign io_port_pci_exp_txp = axi_to_pcie_x1_io_port_pci_exp_txp; 
  assign io_port_pci_exp_txn = axi_to_pcie_x1_io_port_pci_exp_txn; 
  assign io_port_axi_aclk_out = axi_to_pcie_x1_io_port_axi_aclk_out; 
  assign io_port_mmcm_lock = axi_to_pcie_x1_io_port_mmcm_lock; 
  assign axi_to_pcie_x1_auto_master_out_aw_ready = axi4frag_auto_in_aw_ready; 
  assign axi_to_pcie_x1_auto_master_out_w_ready = axi4frag_auto_in_w_ready; 
  assign axi_to_pcie_x1_auto_master_out_b_valid = axi4frag_auto_in_b_valid; 
  assign axi_to_pcie_x1_auto_master_out_b_bits_resp = axi4frag_auto_in_b_bits_resp; 
  assign axi_to_pcie_x1_auto_master_out_ar_ready = axi4frag_auto_in_ar_ready; 
  assign axi_to_pcie_x1_auto_master_out_r_valid = axi4frag_auto_in_r_valid; 
  assign axi_to_pcie_x1_auto_master_out_r_bits_data = axi4frag_auto_in_r_bits_data; 
  assign axi_to_pcie_x1_auto_master_out_r_bits_resp = axi4frag_auto_in_r_bits_resp; 
  assign axi_to_pcie_x1_auto_master_out_r_bits_last = axi4frag_auto_in_r_bits_last; 
  assign axi_to_pcie_x1_auto_control_in_aw_valid = axi4buf_1_auto_out_aw_valid; 
  assign axi_to_pcie_x1_auto_control_in_aw_bits_addr = axi4buf_1_auto_out_aw_bits_addr; 
  assign axi_to_pcie_x1_auto_control_in_w_valid = axi4buf_1_auto_out_w_valid; 
  assign axi_to_pcie_x1_auto_control_in_w_bits_data = axi4buf_1_auto_out_w_bits_data; 
  assign axi_to_pcie_x1_auto_control_in_w_bits_strb = axi4buf_1_auto_out_w_bits_strb; 
  assign axi_to_pcie_x1_auto_control_in_b_ready = axi4buf_1_auto_out_b_ready; 
  assign axi_to_pcie_x1_auto_control_in_ar_valid = axi4buf_1_auto_out_ar_valid; 
  assign axi_to_pcie_x1_auto_control_in_ar_bits_addr = axi4buf_1_auto_out_ar_bits_addr; 
  assign axi_to_pcie_x1_auto_control_in_r_ready = axi4buf_1_auto_out_r_ready; 
  assign axi_to_pcie_x1_auto_slave_in_aw_valid = axi4buf_auto_out_aw_valid; 
  assign axi_to_pcie_x1_auto_slave_in_aw_bits_id = axi4buf_auto_out_aw_bits_id; 
  assign axi_to_pcie_x1_auto_slave_in_aw_bits_addr = axi4buf_auto_out_aw_bits_addr; 
  assign axi_to_pcie_x1_auto_slave_in_aw_bits_len = axi4buf_auto_out_aw_bits_len; 
  assign axi_to_pcie_x1_auto_slave_in_aw_bits_size = axi4buf_auto_out_aw_bits_size; 
  assign axi_to_pcie_x1_auto_slave_in_aw_bits_burst = axi4buf_auto_out_aw_bits_burst; 
  assign axi_to_pcie_x1_auto_slave_in_w_valid = axi4buf_auto_out_w_valid; 
  assign axi_to_pcie_x1_auto_slave_in_w_bits_data = axi4buf_auto_out_w_bits_data; 
  assign axi_to_pcie_x1_auto_slave_in_w_bits_strb = axi4buf_auto_out_w_bits_strb; 
  assign axi_to_pcie_x1_auto_slave_in_w_bits_last = axi4buf_auto_out_w_bits_last; 
  assign axi_to_pcie_x1_auto_slave_in_b_ready = axi4buf_auto_out_b_ready; 
  assign axi_to_pcie_x1_auto_slave_in_ar_valid = axi4buf_auto_out_ar_valid; 
  assign axi_to_pcie_x1_auto_slave_in_ar_bits_id = axi4buf_auto_out_ar_bits_id; 
  assign axi_to_pcie_x1_auto_slave_in_ar_bits_addr = axi4buf_auto_out_ar_bits_addr; 
  assign axi_to_pcie_x1_auto_slave_in_ar_bits_len = axi4buf_auto_out_ar_bits_len; 
  assign axi_to_pcie_x1_auto_slave_in_ar_bits_size = axi4buf_auto_out_ar_bits_size; 
  assign axi_to_pcie_x1_auto_slave_in_ar_bits_burst = axi4buf_auto_out_ar_bits_burst; 
  assign axi_to_pcie_x1_auto_slave_in_r_ready = axi4buf_auto_out_r_ready; 
  assign axi_to_pcie_x1_io_port_pci_exp_rxp = io_port_pci_exp_rxp; 
  assign axi_to_pcie_x1_io_port_pci_exp_rxn = io_port_pci_exp_rxn; 
  assign axi_to_pcie_x1_io_port_axi_aresetn = io_port_axi_aresetn; 
  assign axi_to_pcie_x1_io_REFCLK = ibufds_gte2_O; 
  assign axi4buf_clock = io_port_axi_aclk_out; 
  assign axi4buf_reset = ~ io_port_axi_aresetn; 
  assign axi4buf_auto_in_aw_valid = axi4yank_auto_out_aw_valid; 
  assign axi4buf_auto_in_aw_bits_id = axi4yank_auto_out_aw_bits_id; 
  assign axi4buf_auto_in_aw_bits_addr = axi4yank_auto_out_aw_bits_addr; 
  assign axi4buf_auto_in_aw_bits_len = axi4yank_auto_out_aw_bits_len; 
  assign axi4buf_auto_in_aw_bits_size = axi4yank_auto_out_aw_bits_size; 
  assign axi4buf_auto_in_aw_bits_burst = axi4yank_auto_out_aw_bits_burst; 
  assign axi4buf_auto_in_w_valid = axi4yank_auto_out_w_valid; 
  assign axi4buf_auto_in_w_bits_data = axi4yank_auto_out_w_bits_data; 
  assign axi4buf_auto_in_w_bits_strb = axi4yank_auto_out_w_bits_strb; 
  assign axi4buf_auto_in_w_bits_last = axi4yank_auto_out_w_bits_last; 
  assign axi4buf_auto_in_b_ready = axi4yank_auto_out_b_ready; 
  assign axi4buf_auto_in_ar_valid = axi4yank_auto_out_ar_valid; 
  assign axi4buf_auto_in_ar_bits_id = axi4yank_auto_out_ar_bits_id; 
  assign axi4buf_auto_in_ar_bits_addr = axi4yank_auto_out_ar_bits_addr; 
  assign axi4buf_auto_in_ar_bits_len = axi4yank_auto_out_ar_bits_len; 
  assign axi4buf_auto_in_ar_bits_size = axi4yank_auto_out_ar_bits_size; 
  assign axi4buf_auto_in_ar_bits_burst = axi4yank_auto_out_ar_bits_burst; 
  assign axi4buf_auto_in_r_ready = axi4yank_auto_out_r_ready; 
  assign axi4buf_auto_out_aw_ready = axi_to_pcie_x1_auto_slave_in_aw_ready; 
  assign axi4buf_auto_out_w_ready = axi_to_pcie_x1_auto_slave_in_w_ready; 
  assign axi4buf_auto_out_b_valid = axi_to_pcie_x1_auto_slave_in_b_valid; 
  assign axi4buf_auto_out_b_bits_id = axi_to_pcie_x1_auto_slave_in_b_bits_id; 
  assign axi4buf_auto_out_b_bits_resp = axi_to_pcie_x1_auto_slave_in_b_bits_resp; 
  assign axi4buf_auto_out_ar_ready = axi_to_pcie_x1_auto_slave_in_ar_ready; 
  assign axi4buf_auto_out_r_valid = axi_to_pcie_x1_auto_slave_in_r_valid; 
  assign axi4buf_auto_out_r_bits_id = axi_to_pcie_x1_auto_slave_in_r_bits_id; 
  assign axi4buf_auto_out_r_bits_data = axi_to_pcie_x1_auto_slave_in_r_bits_data; 
  assign axi4buf_auto_out_r_bits_resp = axi_to_pcie_x1_auto_slave_in_r_bits_resp; 
  assign axi4buf_auto_out_r_bits_last = axi_to_pcie_x1_auto_slave_in_r_bits_last; 
  assign axi4yank_clock = io_port_axi_aclk_out; 
  assign axi4yank_reset = ~ io_port_axi_aresetn; 
  assign axi4yank_auto_in_aw_valid = axi4deint_auto_out_aw_valid; 
  assign axi4yank_auto_in_aw_bits_id = axi4deint_auto_out_aw_bits_id; 
  assign axi4yank_auto_in_aw_bits_addr = axi4deint_auto_out_aw_bits_addr; 
  assign axi4yank_auto_in_aw_bits_len = axi4deint_auto_out_aw_bits_len; 
  assign axi4yank_auto_in_aw_bits_size = axi4deint_auto_out_aw_bits_size; 
  assign axi4yank_auto_in_aw_bits_burst = axi4deint_auto_out_aw_bits_burst; 
  assign axi4yank_auto_in_aw_bits_user = axi4deint_auto_out_aw_bits_user; 
  assign axi4yank_auto_in_w_valid = axi4deint_auto_out_w_valid; 
  assign axi4yank_auto_in_w_bits_data = axi4deint_auto_out_w_bits_data; 
  assign axi4yank_auto_in_w_bits_strb = axi4deint_auto_out_w_bits_strb; 
  assign axi4yank_auto_in_w_bits_last = axi4deint_auto_out_w_bits_last; 
  assign axi4yank_auto_in_b_ready = axi4deint_auto_out_b_ready; 
  assign axi4yank_auto_in_ar_valid = axi4deint_auto_out_ar_valid; 
  assign axi4yank_auto_in_ar_bits_id = axi4deint_auto_out_ar_bits_id; 
  assign axi4yank_auto_in_ar_bits_addr = axi4deint_auto_out_ar_bits_addr; 
  assign axi4yank_auto_in_ar_bits_len = axi4deint_auto_out_ar_bits_len; 
  assign axi4yank_auto_in_ar_bits_size = axi4deint_auto_out_ar_bits_size; 
  assign axi4yank_auto_in_ar_bits_burst = axi4deint_auto_out_ar_bits_burst; 
  assign axi4yank_auto_in_ar_bits_user = axi4deint_auto_out_ar_bits_user; 
  assign axi4yank_auto_in_r_ready = axi4deint_auto_out_r_ready; 
  assign axi4yank_auto_out_aw_ready = axi4buf_auto_in_aw_ready; 
  assign axi4yank_auto_out_w_ready = axi4buf_auto_in_w_ready; 
  assign axi4yank_auto_out_b_valid = axi4buf_auto_in_b_valid; 
  assign axi4yank_auto_out_b_bits_id = axi4buf_auto_in_b_bits_id; 
  assign axi4yank_auto_out_b_bits_resp = axi4buf_auto_in_b_bits_resp; 
  assign axi4yank_auto_out_ar_ready = axi4buf_auto_in_ar_ready; 
  assign axi4yank_auto_out_r_valid = axi4buf_auto_in_r_valid; 
  assign axi4yank_auto_out_r_bits_id = axi4buf_auto_in_r_bits_id; 
  assign axi4yank_auto_out_r_bits_data = axi4buf_auto_in_r_bits_data; 
  assign axi4yank_auto_out_r_bits_resp = axi4buf_auto_in_r_bits_resp; 
  assign axi4yank_auto_out_r_bits_last = axi4buf_auto_in_r_bits_last; 
  assign axi4deint_clock = io_port_axi_aclk_out; 
  assign axi4deint_reset = ~ io_port_axi_aresetn; 
  assign axi4deint_auto_in_aw_valid = axi4index_auto_out_aw_valid; 
  assign axi4deint_auto_in_aw_bits_id = axi4index_auto_out_aw_bits_id; 
  assign axi4deint_auto_in_aw_bits_addr = axi4index_auto_out_aw_bits_addr; 
  assign axi4deint_auto_in_aw_bits_len = axi4index_auto_out_aw_bits_len; 
  assign axi4deint_auto_in_aw_bits_size = axi4index_auto_out_aw_bits_size; 
  assign axi4deint_auto_in_aw_bits_burst = axi4index_auto_out_aw_bits_burst; 
  assign axi4deint_auto_in_aw_bits_user = axi4index_auto_out_aw_bits_user; 
  assign axi4deint_auto_in_w_valid = axi4index_auto_out_w_valid; 
  assign axi4deint_auto_in_w_bits_data = axi4index_auto_out_w_bits_data; 
  assign axi4deint_auto_in_w_bits_strb = axi4index_auto_out_w_bits_strb; 
  assign axi4deint_auto_in_w_bits_last = axi4index_auto_out_w_bits_last; 
  assign axi4deint_auto_in_b_ready = axi4index_auto_out_b_ready; 
  assign axi4deint_auto_in_ar_valid = axi4index_auto_out_ar_valid; 
  assign axi4deint_auto_in_ar_bits_id = axi4index_auto_out_ar_bits_id; 
  assign axi4deint_auto_in_ar_bits_addr = axi4index_auto_out_ar_bits_addr; 
  assign axi4deint_auto_in_ar_bits_len = axi4index_auto_out_ar_bits_len; 
  assign axi4deint_auto_in_ar_bits_size = axi4index_auto_out_ar_bits_size; 
  assign axi4deint_auto_in_ar_bits_burst = axi4index_auto_out_ar_bits_burst; 
  assign axi4deint_auto_in_ar_bits_user = axi4index_auto_out_ar_bits_user; 
  assign axi4deint_auto_in_r_ready = axi4index_auto_out_r_ready; 
  assign axi4deint_auto_out_aw_ready = axi4yank_auto_in_aw_ready; 
  assign axi4deint_auto_out_w_ready = axi4yank_auto_in_w_ready; 
  assign axi4deint_auto_out_b_valid = axi4yank_auto_in_b_valid; 
  assign axi4deint_auto_out_b_bits_id = axi4yank_auto_in_b_bits_id; 
  assign axi4deint_auto_out_b_bits_resp = axi4yank_auto_in_b_bits_resp; 
  assign axi4deint_auto_out_b_bits_user = axi4yank_auto_in_b_bits_user; 
  assign axi4deint_auto_out_ar_ready = axi4yank_auto_in_ar_ready; 
  assign axi4deint_auto_out_r_valid = axi4yank_auto_in_r_valid; 
  assign axi4deint_auto_out_r_bits_id = axi4yank_auto_in_r_bits_id; 
  assign axi4deint_auto_out_r_bits_data = axi4yank_auto_in_r_bits_data; 
  assign axi4deint_auto_out_r_bits_resp = axi4yank_auto_in_r_bits_resp; 
  assign axi4deint_auto_out_r_bits_user = axi4yank_auto_in_r_bits_user; 
  assign axi4deint_auto_out_r_bits_last = axi4yank_auto_in_r_bits_last; 
  assign axi4index_auto_in_aw_valid = tl2axi4_auto_out_aw_valid; 
  assign axi4index_auto_in_aw_bits_id = tl2axi4_auto_out_aw_bits_id; 
  assign axi4index_auto_in_aw_bits_addr = tl2axi4_auto_out_aw_bits_addr; 
  assign axi4index_auto_in_aw_bits_len = tl2axi4_auto_out_aw_bits_len; 
  assign axi4index_auto_in_aw_bits_size = tl2axi4_auto_out_aw_bits_size; 
  assign axi4index_auto_in_aw_bits_burst = tl2axi4_auto_out_aw_bits_burst; 
  assign axi4index_auto_in_aw_bits_user = tl2axi4_auto_out_aw_bits_user; 
  assign axi4index_auto_in_w_valid = tl2axi4_auto_out_w_valid; 
  assign axi4index_auto_in_w_bits_data = tl2axi4_auto_out_w_bits_data; 
  assign axi4index_auto_in_w_bits_strb = tl2axi4_auto_out_w_bits_strb; 
  assign axi4index_auto_in_w_bits_last = tl2axi4_auto_out_w_bits_last; 
  assign axi4index_auto_in_b_ready = tl2axi4_auto_out_b_ready; 
  assign axi4index_auto_in_ar_valid = tl2axi4_auto_out_ar_valid; 
  assign axi4index_auto_in_ar_bits_id = tl2axi4_auto_out_ar_bits_id; 
  assign axi4index_auto_in_ar_bits_addr = tl2axi4_auto_out_ar_bits_addr; 
  assign axi4index_auto_in_ar_bits_len = tl2axi4_auto_out_ar_bits_len; 
  assign axi4index_auto_in_ar_bits_size = tl2axi4_auto_out_ar_bits_size; 
  assign axi4index_auto_in_ar_bits_burst = tl2axi4_auto_out_ar_bits_burst; 
  assign axi4index_auto_in_ar_bits_user = tl2axi4_auto_out_ar_bits_user; 
  assign axi4index_auto_in_r_ready = tl2axi4_auto_out_r_ready; 
  assign axi4index_auto_out_aw_ready = axi4deint_auto_in_aw_ready; 
  assign axi4index_auto_out_w_ready = axi4deint_auto_in_w_ready; 
  assign axi4index_auto_out_b_valid = axi4deint_auto_in_b_valid; 
  assign axi4index_auto_out_b_bits_id = axi4deint_auto_in_b_bits_id; 
  assign axi4index_auto_out_b_bits_resp = axi4deint_auto_in_b_bits_resp; 
  assign axi4index_auto_out_b_bits_user = axi4deint_auto_in_b_bits_user; 
  assign axi4index_auto_out_ar_ready = axi4deint_auto_in_ar_ready; 
  assign axi4index_auto_out_r_valid = axi4deint_auto_in_r_valid; 
  assign axi4index_auto_out_r_bits_id = axi4deint_auto_in_r_bits_id; 
  assign axi4index_auto_out_r_bits_data = axi4deint_auto_in_r_bits_data; 
  assign axi4index_auto_out_r_bits_resp = axi4deint_auto_in_r_bits_resp; 
  assign axi4index_auto_out_r_bits_user = axi4deint_auto_in_r_bits_user; 
  assign axi4index_auto_out_r_bits_last = axi4deint_auto_in_r_bits_last; 
  assign tl2axi4_clock = io_port_axi_aclk_out; 
  assign tl2axi4_reset = ~ io_port_axi_aresetn; 
  assign tl2axi4_auto_in_a_valid = asink_auto_out_a_valid; 
  assign tl2axi4_auto_in_a_bits_opcode = asink_auto_out_a_bits_opcode; 
  assign tl2axi4_auto_in_a_bits_param = asink_auto_out_a_bits_param; 
  assign tl2axi4_auto_in_a_bits_size = asink_auto_out_a_bits_size; 
  assign tl2axi4_auto_in_a_bits_source = asink_auto_out_a_bits_source; 
  assign tl2axi4_auto_in_a_bits_address = asink_auto_out_a_bits_address; 
  assign tl2axi4_auto_in_a_bits_mask = asink_auto_out_a_bits_mask; 
  assign tl2axi4_auto_in_a_bits_data = asink_auto_out_a_bits_data; 
  assign tl2axi4_auto_in_a_bits_corrupt = asink_auto_out_a_bits_corrupt; 
  assign tl2axi4_auto_in_d_ready = asink_auto_out_d_ready; 
  assign tl2axi4_auto_out_aw_ready = axi4index_auto_in_aw_ready; 
  assign tl2axi4_auto_out_w_ready = axi4index_auto_in_w_ready; 
  assign tl2axi4_auto_out_b_valid = axi4index_auto_in_b_valid; 
  assign tl2axi4_auto_out_b_bits_id = axi4index_auto_in_b_bits_id; 
  assign tl2axi4_auto_out_b_bits_resp = axi4index_auto_in_b_bits_resp; 
  assign tl2axi4_auto_out_b_bits_user = axi4index_auto_in_b_bits_user; 
  assign tl2axi4_auto_out_ar_ready = axi4index_auto_in_ar_ready; 
  assign tl2axi4_auto_out_r_valid = axi4index_auto_in_r_valid; 
  assign tl2axi4_auto_out_r_bits_id = axi4index_auto_in_r_bits_id; 
  assign tl2axi4_auto_out_r_bits_data = axi4index_auto_in_r_bits_data; 
  assign tl2axi4_auto_out_r_bits_resp = axi4index_auto_in_r_bits_resp; 
  assign tl2axi4_auto_out_r_bits_user = axi4index_auto_in_r_bits_user; 
  assign tl2axi4_auto_out_r_bits_last = axi4index_auto_in_r_bits_last; 
  assign axi4buf_1_clock = io_port_axi_aclk_out; 
  assign axi4buf_1_reset = ~ io_port_axi_aresetn; 
  assign axi4buf_1_auto_in_aw_valid = axi4yank_1_auto_out_aw_valid; 
  assign axi4buf_1_auto_in_aw_bits_addr = axi4yank_1_auto_out_aw_bits_addr; 
  assign axi4buf_1_auto_in_w_valid = axi4yank_1_auto_out_w_valid; 
  assign axi4buf_1_auto_in_w_bits_data = axi4yank_1_auto_out_w_bits_data; 
  assign axi4buf_1_auto_in_w_bits_strb = axi4yank_1_auto_out_w_bits_strb; 
  assign axi4buf_1_auto_in_b_ready = axi4yank_1_auto_out_b_ready; 
  assign axi4buf_1_auto_in_ar_valid = axi4yank_1_auto_out_ar_valid; 
  assign axi4buf_1_auto_in_ar_bits_addr = axi4yank_1_auto_out_ar_bits_addr; 
  assign axi4buf_1_auto_in_r_ready = axi4yank_1_auto_out_r_ready; 
  assign axi4buf_1_auto_out_aw_ready = axi_to_pcie_x1_auto_control_in_aw_ready; 
  assign axi4buf_1_auto_out_w_ready = axi_to_pcie_x1_auto_control_in_w_ready; 
  assign axi4buf_1_auto_out_b_valid = axi_to_pcie_x1_auto_control_in_b_valid; 
  assign axi4buf_1_auto_out_b_bits_resp = axi_to_pcie_x1_auto_control_in_b_bits_resp; 
  assign axi4buf_1_auto_out_ar_ready = axi_to_pcie_x1_auto_control_in_ar_ready; 
  assign axi4buf_1_auto_out_r_valid = axi_to_pcie_x1_auto_control_in_r_valid; 
  assign axi4buf_1_auto_out_r_bits_data = axi_to_pcie_x1_auto_control_in_r_bits_data; 
  assign axi4buf_1_auto_out_r_bits_resp = axi_to_pcie_x1_auto_control_in_r_bits_resp; 
  assign axi4yank_1_clock = io_port_axi_aclk_out; 
  assign axi4yank_1_reset = ~ io_port_axi_aresetn; 
  assign axi4yank_1_auto_in_aw_valid = tl2axi4_1_auto_out_aw_valid; 
  assign axi4yank_1_auto_in_aw_bits_addr = tl2axi4_1_auto_out_aw_bits_addr; 
  assign axi4yank_1_auto_in_aw_bits_user = tl2axi4_1_auto_out_aw_bits_user; 
  assign axi4yank_1_auto_in_w_valid = tl2axi4_1_auto_out_w_valid; 
  assign axi4yank_1_auto_in_w_bits_data = tl2axi4_1_auto_out_w_bits_data; 
  assign axi4yank_1_auto_in_w_bits_strb = tl2axi4_1_auto_out_w_bits_strb; 
  assign axi4yank_1_auto_in_b_ready = tl2axi4_1_auto_out_b_ready; 
  assign axi4yank_1_auto_in_ar_valid = tl2axi4_1_auto_out_ar_valid; 
  assign axi4yank_1_auto_in_ar_bits_addr = tl2axi4_1_auto_out_ar_bits_addr; 
  assign axi4yank_1_auto_in_ar_bits_user = tl2axi4_1_auto_out_ar_bits_user; 
  assign axi4yank_1_auto_in_r_ready = tl2axi4_1_auto_out_r_ready; 
  assign axi4yank_1_auto_out_aw_ready = axi4buf_1_auto_in_aw_ready; 
  assign axi4yank_1_auto_out_w_ready = axi4buf_1_auto_in_w_ready; 
  assign axi4yank_1_auto_out_b_valid = axi4buf_1_auto_in_b_valid; 
  assign axi4yank_1_auto_out_b_bits_resp = axi4buf_1_auto_in_b_bits_resp; 
  assign axi4yank_1_auto_out_ar_ready = axi4buf_1_auto_in_ar_ready; 
  assign axi4yank_1_auto_out_r_valid = axi4buf_1_auto_in_r_valid; 
  assign axi4yank_1_auto_out_r_bits_data = axi4buf_1_auto_in_r_bits_data; 
  assign axi4yank_1_auto_out_r_bits_resp = axi4buf_1_auto_in_r_bits_resp; 
  assign axi4yank_1_auto_out_r_bits_last = axi4buf_1_auto_in_r_bits_last; 
  assign tl2axi4_1_clock = io_port_axi_aclk_out; 
  assign tl2axi4_1_reset = ~ io_port_axi_aresetn; 
  assign tl2axi4_1_auto_in_a_valid = fragmenter_auto_out_a_valid; 
  assign tl2axi4_1_auto_in_a_bits_opcode = fragmenter_auto_out_a_bits_opcode; 
  assign tl2axi4_1_auto_in_a_bits_param = fragmenter_auto_out_a_bits_param; 
  assign tl2axi4_1_auto_in_a_bits_size = fragmenter_auto_out_a_bits_size; 
  assign tl2axi4_1_auto_in_a_bits_source = fragmenter_auto_out_a_bits_source; 
  assign tl2axi4_1_auto_in_a_bits_address = fragmenter_auto_out_a_bits_address; 
  assign tl2axi4_1_auto_in_a_bits_mask = fragmenter_auto_out_a_bits_mask; 
  assign tl2axi4_1_auto_in_a_bits_data = fragmenter_auto_out_a_bits_data; 
  assign tl2axi4_1_auto_in_a_bits_corrupt = fragmenter_auto_out_a_bits_corrupt; 
  assign tl2axi4_1_auto_in_d_ready = fragmenter_auto_out_d_ready; 
  assign tl2axi4_1_auto_out_aw_ready = axi4yank_1_auto_in_aw_ready; 
  assign tl2axi4_1_auto_out_w_ready = axi4yank_1_auto_in_w_ready; 
  assign tl2axi4_1_auto_out_b_valid = axi4yank_1_auto_in_b_valid; 
  assign tl2axi4_1_auto_out_b_bits_resp = axi4yank_1_auto_in_b_bits_resp; 
  assign tl2axi4_1_auto_out_b_bits_user = axi4yank_1_auto_in_b_bits_user; 
  assign tl2axi4_1_auto_out_ar_ready = axi4yank_1_auto_in_ar_ready; 
  assign tl2axi4_1_auto_out_r_valid = axi4yank_1_auto_in_r_valid; 
  assign tl2axi4_1_auto_out_r_bits_data = axi4yank_1_auto_in_r_bits_data; 
  assign tl2axi4_1_auto_out_r_bits_resp = axi4yank_1_auto_in_r_bits_resp; 
  assign tl2axi4_1_auto_out_r_bits_user = axi4yank_1_auto_in_r_bits_user; 
  assign tl2axi4_1_auto_out_r_bits_last = axi4yank_1_auto_in_r_bits_last; 
  assign fragmenter_clock = io_port_axi_aclk_out; 
  assign fragmenter_reset = ~ io_port_axi_aresetn; 
  assign fragmenter_auto_in_a_valid = asink_1_auto_out_a_valid; 
  assign fragmenter_auto_in_a_bits_opcode = asink_1_auto_out_a_bits_opcode; 
  assign fragmenter_auto_in_a_bits_param = asink_1_auto_out_a_bits_param; 
  assign fragmenter_auto_in_a_bits_size = asink_1_auto_out_a_bits_size; 
  assign fragmenter_auto_in_a_bits_source = asink_1_auto_out_a_bits_source; 
  assign fragmenter_auto_in_a_bits_address = asink_1_auto_out_a_bits_address; 
  assign fragmenter_auto_in_a_bits_mask = asink_1_auto_out_a_bits_mask; 
  assign fragmenter_auto_in_a_bits_data = asink_1_auto_out_a_bits_data; 
  assign fragmenter_auto_in_a_bits_corrupt = asink_1_auto_out_a_bits_corrupt; 
  assign fragmenter_auto_in_d_ready = asink_1_auto_out_d_ready; 
  assign fragmenter_auto_out_a_ready = tl2axi4_1_auto_in_a_ready; 
  assign fragmenter_auto_out_d_valid = tl2axi4_1_auto_in_d_valid; 
  assign fragmenter_auto_out_d_bits_opcode = tl2axi4_1_auto_in_d_bits_opcode; 
  assign fragmenter_auto_out_d_bits_size = tl2axi4_1_auto_in_d_bits_size; 
  assign fragmenter_auto_out_d_bits_source = tl2axi4_1_auto_in_d_bits_source; 
  assign fragmenter_auto_out_d_bits_denied = tl2axi4_1_auto_in_d_bits_denied; 
  assign fragmenter_auto_out_d_bits_data = tl2axi4_1_auto_in_d_bits_data; 
  assign fragmenter_auto_out_d_bits_corrupt = tl2axi4_1_auto_in_d_bits_corrupt; 
  assign widget_clock = io_port_axi_aclk_out; 
  assign widget_reset = ~ io_port_axi_aresetn; 
  assign widget_auto_in_a_valid = axi42tl_auto_out_a_valid; 
  assign widget_auto_in_a_bits_opcode = axi42tl_auto_out_a_bits_opcode; 
  assign widget_auto_in_a_bits_param = axi42tl_auto_out_a_bits_param; 
  assign widget_auto_in_a_bits_size = axi42tl_auto_out_a_bits_size; 
  assign widget_auto_in_a_bits_source = axi42tl_auto_out_a_bits_source; 
  assign widget_auto_in_a_bits_address = axi42tl_auto_out_a_bits_address; 
  assign widget_auto_in_a_bits_mask = axi42tl_auto_out_a_bits_mask; 
  assign widget_auto_in_a_bits_data = axi42tl_auto_out_a_bits_data; 
  assign widget_auto_in_a_bits_corrupt = axi42tl_auto_out_a_bits_corrupt; 
  assign widget_auto_in_d_ready = axi42tl_auto_out_d_ready; 
  assign widget_auto_out_a_ready = asource_auto_in_a_ready; 
  assign widget_auto_out_d_valid = asource_auto_in_d_valid; 
  assign widget_auto_out_d_bits_opcode = asource_auto_in_d_bits_opcode; 
  assign widget_auto_out_d_bits_param = asource_auto_in_d_bits_param; 
  assign widget_auto_out_d_bits_size = asource_auto_in_d_bits_size; 
  assign widget_auto_out_d_bits_source = asource_auto_in_d_bits_source; 
  assign widget_auto_out_d_bits_sink = asource_auto_in_d_bits_sink; 
  assign widget_auto_out_d_bits_denied = asource_auto_in_d_bits_denied; 
  assign widget_auto_out_d_bits_data = asource_auto_in_d_bits_data; 
  assign widget_auto_out_d_bits_corrupt = asource_auto_in_d_bits_corrupt; 
  assign axi42tl_clock = io_port_axi_aclk_out; 
  assign axi42tl_reset = ~ io_port_axi_aresetn; 
  assign axi42tl_auto_in_aw_valid = axi4yank_2_auto_out_aw_valid; 
  assign axi42tl_auto_in_aw_bits_id = axi4yank_2_auto_out_aw_bits_id; 
  assign axi42tl_auto_in_aw_bits_addr = axi4yank_2_auto_out_aw_bits_addr; 
  assign axi42tl_auto_in_aw_bits_len = axi4yank_2_auto_out_aw_bits_len; 
  assign axi42tl_auto_in_aw_bits_size = axi4yank_2_auto_out_aw_bits_size; 
  assign axi42tl_auto_in_w_valid = axi4yank_2_auto_out_w_valid; 
  assign axi42tl_auto_in_w_bits_data = axi4yank_2_auto_out_w_bits_data; 
  assign axi42tl_auto_in_w_bits_strb = axi4yank_2_auto_out_w_bits_strb; 
  assign axi42tl_auto_in_w_bits_last = axi4yank_2_auto_out_w_bits_last; 
  assign axi42tl_auto_in_b_ready = axi4yank_2_auto_out_b_ready; 
  assign axi42tl_auto_in_ar_valid = axi4yank_2_auto_out_ar_valid; 
  assign axi42tl_auto_in_ar_bits_id = axi4yank_2_auto_out_ar_bits_id; 
  assign axi42tl_auto_in_ar_bits_addr = axi4yank_2_auto_out_ar_bits_addr; 
  assign axi42tl_auto_in_ar_bits_len = axi4yank_2_auto_out_ar_bits_len; 
  assign axi42tl_auto_in_ar_bits_size = axi4yank_2_auto_out_ar_bits_size; 
  assign axi42tl_auto_in_r_ready = axi4yank_2_auto_out_r_ready; 
  assign axi42tl_auto_out_a_ready = widget_auto_in_a_ready; 
  assign axi42tl_auto_out_d_valid = widget_auto_in_d_valid; 
  assign axi42tl_auto_out_d_bits_opcode = widget_auto_in_d_bits_opcode; 
  assign axi42tl_auto_out_d_bits_size = widget_auto_in_d_bits_size; 
  assign axi42tl_auto_out_d_bits_denied = widget_auto_in_d_bits_denied; 
  assign axi42tl_auto_out_d_bits_data = widget_auto_in_d_bits_data; 
  assign axi42tl_auto_out_d_bits_corrupt = widget_auto_in_d_bits_corrupt; 
  assign axi4yank_2_clock = io_port_axi_aclk_out; 
  assign axi4yank_2_reset = ~ io_port_axi_aresetn; 
  assign axi4yank_2_auto_in_aw_valid = axi4frag_auto_out_aw_valid; 
  assign axi4yank_2_auto_in_aw_bits_id = axi4frag_auto_out_aw_bits_id; 
  assign axi4yank_2_auto_in_aw_bits_addr = axi4frag_auto_out_aw_bits_addr; 
  assign axi4yank_2_auto_in_aw_bits_len = axi4frag_auto_out_aw_bits_len; 
  assign axi4yank_2_auto_in_aw_bits_size = axi4frag_auto_out_aw_bits_size; 
  assign axi4yank_2_auto_in_aw_bits_user = axi4frag_auto_out_aw_bits_user; 
  assign axi4yank_2_auto_in_w_valid = axi4frag_auto_out_w_valid; 
  assign axi4yank_2_auto_in_w_bits_data = axi4frag_auto_out_w_bits_data; 
  assign axi4yank_2_auto_in_w_bits_strb = axi4frag_auto_out_w_bits_strb; 
  assign axi4yank_2_auto_in_w_bits_last = axi4frag_auto_out_w_bits_last; 
  assign axi4yank_2_auto_in_b_ready = axi4frag_auto_out_b_ready; 
  assign axi4yank_2_auto_in_ar_valid = axi4frag_auto_out_ar_valid; 
  assign axi4yank_2_auto_in_ar_bits_id = axi4frag_auto_out_ar_bits_id; 
  assign axi4yank_2_auto_in_ar_bits_addr = axi4frag_auto_out_ar_bits_addr; 
  assign axi4yank_2_auto_in_ar_bits_len = axi4frag_auto_out_ar_bits_len; 
  assign axi4yank_2_auto_in_ar_bits_size = axi4frag_auto_out_ar_bits_size; 
  assign axi4yank_2_auto_in_ar_bits_user = axi4frag_auto_out_ar_bits_user; 
  assign axi4yank_2_auto_in_r_ready = axi4frag_auto_out_r_ready; 
  assign axi4yank_2_auto_out_aw_ready = axi42tl_auto_in_aw_ready; 
  assign axi4yank_2_auto_out_w_ready = axi42tl_auto_in_w_ready; 
  assign axi4yank_2_auto_out_b_valid = axi42tl_auto_in_b_valid; 
  assign axi4yank_2_auto_out_b_bits_resp = axi42tl_auto_in_b_bits_resp; 
  assign axi4yank_2_auto_out_ar_ready = axi42tl_auto_in_ar_ready; 
  assign axi4yank_2_auto_out_r_valid = axi42tl_auto_in_r_valid; 
  assign axi4yank_2_auto_out_r_bits_data = axi42tl_auto_in_r_bits_data; 
  assign axi4yank_2_auto_out_r_bits_resp = axi42tl_auto_in_r_bits_resp; 
  assign axi4yank_2_auto_out_r_bits_last = axi42tl_auto_in_r_bits_last; 
  assign axi4frag_clock = io_port_axi_aclk_out; 
  assign axi4frag_reset = ~ io_port_axi_aresetn; 
  assign axi4frag_auto_in_aw_valid = axi_to_pcie_x1_auto_master_out_aw_valid; 
  assign axi4frag_auto_in_aw_bits_addr = axi_to_pcie_x1_auto_master_out_aw_bits_addr; 
  assign axi4frag_auto_in_aw_bits_len = axi_to_pcie_x1_auto_master_out_aw_bits_len; 
  assign axi4frag_auto_in_aw_bits_size = axi_to_pcie_x1_auto_master_out_aw_bits_size; 
  assign axi4frag_auto_in_aw_bits_burst = axi_to_pcie_x1_auto_master_out_aw_bits_burst; 
  assign axi4frag_auto_in_w_valid = axi_to_pcie_x1_auto_master_out_w_valid; 
  assign axi4frag_auto_in_w_bits_data = axi_to_pcie_x1_auto_master_out_w_bits_data; 
  assign axi4frag_auto_in_w_bits_strb = axi_to_pcie_x1_auto_master_out_w_bits_strb; 
  assign axi4frag_auto_in_w_bits_last = axi_to_pcie_x1_auto_master_out_w_bits_last; 
  assign axi4frag_auto_in_b_ready = axi_to_pcie_x1_auto_master_out_b_ready; 
  assign axi4frag_auto_in_ar_valid = axi_to_pcie_x1_auto_master_out_ar_valid; 
  assign axi4frag_auto_in_ar_bits_addr = axi_to_pcie_x1_auto_master_out_ar_bits_addr; 
  assign axi4frag_auto_in_ar_bits_len = axi_to_pcie_x1_auto_master_out_ar_bits_len; 
  assign axi4frag_auto_in_ar_bits_size = axi_to_pcie_x1_auto_master_out_ar_bits_size; 
  assign axi4frag_auto_in_ar_bits_burst = axi_to_pcie_x1_auto_master_out_ar_bits_burst; 
  assign axi4frag_auto_in_r_ready = axi_to_pcie_x1_auto_master_out_r_ready; 
  assign axi4frag_auto_out_aw_ready = axi4yank_2_auto_in_aw_ready; 
  assign axi4frag_auto_out_w_ready = axi4yank_2_auto_in_w_ready; 
  assign axi4frag_auto_out_b_valid = axi4yank_2_auto_in_b_valid; 
  assign axi4frag_auto_out_b_bits_resp = axi4yank_2_auto_in_b_bits_resp; 
  assign axi4frag_auto_out_b_bits_user = axi4yank_2_auto_in_b_bits_user; 
  assign axi4frag_auto_out_ar_ready = axi4yank_2_auto_in_ar_ready; 
  assign axi4frag_auto_out_r_valid = axi4yank_2_auto_in_r_valid; 
  assign axi4frag_auto_out_r_bits_data = axi4yank_2_auto_in_r_bits_data; 
  assign axi4frag_auto_out_r_bits_resp = axi4yank_2_auto_in_r_bits_resp; 
  assign axi4frag_auto_out_r_bits_user = axi4yank_2_auto_in_r_bits_user; 
  assign axi4frag_auto_out_r_bits_last = axi4yank_2_auto_in_r_bits_last; 
  assign asink_clock = io_port_axi_aclk_out; 
  assign asink_reset = ~ io_port_axi_aresetn; 
  assign asink_auto_in_a_mem_0_opcode = auto_tl_in_xing_in_0_a_mem_0_opcode; 
  assign asink_auto_in_a_mem_0_param = auto_tl_in_xing_in_0_a_mem_0_param; 
  assign asink_auto_in_a_mem_0_size = auto_tl_in_xing_in_0_a_mem_0_size; 
  assign asink_auto_in_a_mem_0_source = auto_tl_in_xing_in_0_a_mem_0_source; 
  assign asink_auto_in_a_mem_0_address = auto_tl_in_xing_in_0_a_mem_0_address; 
  assign asink_auto_in_a_mem_0_mask = auto_tl_in_xing_in_0_a_mem_0_mask; 
  assign asink_auto_in_a_mem_0_data = auto_tl_in_xing_in_0_a_mem_0_data; 
  assign asink_auto_in_a_mem_0_corrupt = auto_tl_in_xing_in_0_a_mem_0_corrupt; 
  assign asink_auto_in_a_mem_1_opcode = auto_tl_in_xing_in_0_a_mem_1_opcode; 
  assign asink_auto_in_a_mem_1_param = auto_tl_in_xing_in_0_a_mem_1_param; 
  assign asink_auto_in_a_mem_1_size = auto_tl_in_xing_in_0_a_mem_1_size; 
  assign asink_auto_in_a_mem_1_source = auto_tl_in_xing_in_0_a_mem_1_source; 
  assign asink_auto_in_a_mem_1_address = auto_tl_in_xing_in_0_a_mem_1_address; 
  assign asink_auto_in_a_mem_1_mask = auto_tl_in_xing_in_0_a_mem_1_mask; 
  assign asink_auto_in_a_mem_1_data = auto_tl_in_xing_in_0_a_mem_1_data; 
  assign asink_auto_in_a_mem_1_corrupt = auto_tl_in_xing_in_0_a_mem_1_corrupt; 
  assign asink_auto_in_a_mem_2_opcode = auto_tl_in_xing_in_0_a_mem_2_opcode; 
  assign asink_auto_in_a_mem_2_param = auto_tl_in_xing_in_0_a_mem_2_param; 
  assign asink_auto_in_a_mem_2_size = auto_tl_in_xing_in_0_a_mem_2_size; 
  assign asink_auto_in_a_mem_2_source = auto_tl_in_xing_in_0_a_mem_2_source; 
  assign asink_auto_in_a_mem_2_address = auto_tl_in_xing_in_0_a_mem_2_address; 
  assign asink_auto_in_a_mem_2_mask = auto_tl_in_xing_in_0_a_mem_2_mask; 
  assign asink_auto_in_a_mem_2_data = auto_tl_in_xing_in_0_a_mem_2_data; 
  assign asink_auto_in_a_mem_2_corrupt = auto_tl_in_xing_in_0_a_mem_2_corrupt; 
  assign asink_auto_in_a_mem_3_opcode = auto_tl_in_xing_in_0_a_mem_3_opcode; 
  assign asink_auto_in_a_mem_3_param = auto_tl_in_xing_in_0_a_mem_3_param; 
  assign asink_auto_in_a_mem_3_size = auto_tl_in_xing_in_0_a_mem_3_size; 
  assign asink_auto_in_a_mem_3_source = auto_tl_in_xing_in_0_a_mem_3_source; 
  assign asink_auto_in_a_mem_3_address = auto_tl_in_xing_in_0_a_mem_3_address; 
  assign asink_auto_in_a_mem_3_mask = auto_tl_in_xing_in_0_a_mem_3_mask; 
  assign asink_auto_in_a_mem_3_data = auto_tl_in_xing_in_0_a_mem_3_data; 
  assign asink_auto_in_a_mem_3_corrupt = auto_tl_in_xing_in_0_a_mem_3_corrupt; 
  assign asink_auto_in_a_mem_4_opcode = auto_tl_in_xing_in_0_a_mem_4_opcode; 
  assign asink_auto_in_a_mem_4_param = auto_tl_in_xing_in_0_a_mem_4_param; 
  assign asink_auto_in_a_mem_4_size = auto_tl_in_xing_in_0_a_mem_4_size; 
  assign asink_auto_in_a_mem_4_source = auto_tl_in_xing_in_0_a_mem_4_source; 
  assign asink_auto_in_a_mem_4_address = auto_tl_in_xing_in_0_a_mem_4_address; 
  assign asink_auto_in_a_mem_4_mask = auto_tl_in_xing_in_0_a_mem_4_mask; 
  assign asink_auto_in_a_mem_4_data = auto_tl_in_xing_in_0_a_mem_4_data; 
  assign asink_auto_in_a_mem_4_corrupt = auto_tl_in_xing_in_0_a_mem_4_corrupt; 
  assign asink_auto_in_a_mem_5_opcode = auto_tl_in_xing_in_0_a_mem_5_opcode; 
  assign asink_auto_in_a_mem_5_param = auto_tl_in_xing_in_0_a_mem_5_param; 
  assign asink_auto_in_a_mem_5_size = auto_tl_in_xing_in_0_a_mem_5_size; 
  assign asink_auto_in_a_mem_5_source = auto_tl_in_xing_in_0_a_mem_5_source; 
  assign asink_auto_in_a_mem_5_address = auto_tl_in_xing_in_0_a_mem_5_address; 
  assign asink_auto_in_a_mem_5_mask = auto_tl_in_xing_in_0_a_mem_5_mask; 
  assign asink_auto_in_a_mem_5_data = auto_tl_in_xing_in_0_a_mem_5_data; 
  assign asink_auto_in_a_mem_5_corrupt = auto_tl_in_xing_in_0_a_mem_5_corrupt; 
  assign asink_auto_in_a_mem_6_opcode = auto_tl_in_xing_in_0_a_mem_6_opcode; 
  assign asink_auto_in_a_mem_6_param = auto_tl_in_xing_in_0_a_mem_6_param; 
  assign asink_auto_in_a_mem_6_size = auto_tl_in_xing_in_0_a_mem_6_size; 
  assign asink_auto_in_a_mem_6_source = auto_tl_in_xing_in_0_a_mem_6_source; 
  assign asink_auto_in_a_mem_6_address = auto_tl_in_xing_in_0_a_mem_6_address; 
  assign asink_auto_in_a_mem_6_mask = auto_tl_in_xing_in_0_a_mem_6_mask; 
  assign asink_auto_in_a_mem_6_data = auto_tl_in_xing_in_0_a_mem_6_data; 
  assign asink_auto_in_a_mem_6_corrupt = auto_tl_in_xing_in_0_a_mem_6_corrupt; 
  assign asink_auto_in_a_mem_7_opcode = auto_tl_in_xing_in_0_a_mem_7_opcode; 
  assign asink_auto_in_a_mem_7_param = auto_tl_in_xing_in_0_a_mem_7_param; 
  assign asink_auto_in_a_mem_7_size = auto_tl_in_xing_in_0_a_mem_7_size; 
  assign asink_auto_in_a_mem_7_source = auto_tl_in_xing_in_0_a_mem_7_source; 
  assign asink_auto_in_a_mem_7_address = auto_tl_in_xing_in_0_a_mem_7_address; 
  assign asink_auto_in_a_mem_7_mask = auto_tl_in_xing_in_0_a_mem_7_mask; 
  assign asink_auto_in_a_mem_7_data = auto_tl_in_xing_in_0_a_mem_7_data; 
  assign asink_auto_in_a_mem_7_corrupt = auto_tl_in_xing_in_0_a_mem_7_corrupt; 
  assign asink_auto_in_a_widx = auto_tl_in_xing_in_0_a_widx; 
  assign asink_auto_in_a_safe_widx_valid = auto_tl_in_xing_in_0_a_safe_widx_valid; 
  assign asink_auto_in_a_safe_source_reset_n = auto_tl_in_xing_in_0_a_safe_source_reset_n; 
  assign asink_auto_in_d_ridx = auto_tl_in_xing_in_0_d_ridx; 
  assign asink_auto_in_d_safe_ridx_valid = auto_tl_in_xing_in_0_d_safe_ridx_valid; 
  assign asink_auto_in_d_safe_sink_reset_n = auto_tl_in_xing_in_0_d_safe_sink_reset_n; 
  assign asink_auto_out_a_ready = tl2axi4_auto_in_a_ready; 
  assign asink_auto_out_d_valid = tl2axi4_auto_in_d_valid; 
  assign asink_auto_out_d_bits_opcode = tl2axi4_auto_in_d_bits_opcode; 
  assign asink_auto_out_d_bits_size = tl2axi4_auto_in_d_bits_size; 
  assign asink_auto_out_d_bits_source = tl2axi4_auto_in_d_bits_source; 
  assign asink_auto_out_d_bits_denied = tl2axi4_auto_in_d_bits_denied; 
  assign asink_auto_out_d_bits_data = tl2axi4_auto_in_d_bits_data; 
  assign asink_auto_out_d_bits_corrupt = tl2axi4_auto_in_d_bits_corrupt; 
  assign asink_1_clock = io_port_axi_aclk_out; 
  assign asink_1_reset = ~ io_port_axi_aresetn; 
  assign asink_1_auto_in_a_mem_0_opcode = auto_tl_in_xing_in_1_a_mem_0_opcode; 
  assign asink_1_auto_in_a_mem_0_param = auto_tl_in_xing_in_1_a_mem_0_param; 
  assign asink_1_auto_in_a_mem_0_size = auto_tl_in_xing_in_1_a_mem_0_size; 
  assign asink_1_auto_in_a_mem_0_source = auto_tl_in_xing_in_1_a_mem_0_source; 
  assign asink_1_auto_in_a_mem_0_address = auto_tl_in_xing_in_1_a_mem_0_address; 
  assign asink_1_auto_in_a_mem_0_mask = auto_tl_in_xing_in_1_a_mem_0_mask; 
  assign asink_1_auto_in_a_mem_0_data = auto_tl_in_xing_in_1_a_mem_0_data; 
  assign asink_1_auto_in_a_mem_0_corrupt = auto_tl_in_xing_in_1_a_mem_0_corrupt; 
  assign asink_1_auto_in_a_mem_1_opcode = auto_tl_in_xing_in_1_a_mem_1_opcode; 
  assign asink_1_auto_in_a_mem_1_param = auto_tl_in_xing_in_1_a_mem_1_param; 
  assign asink_1_auto_in_a_mem_1_size = auto_tl_in_xing_in_1_a_mem_1_size; 
  assign asink_1_auto_in_a_mem_1_source = auto_tl_in_xing_in_1_a_mem_1_source; 
  assign asink_1_auto_in_a_mem_1_address = auto_tl_in_xing_in_1_a_mem_1_address; 
  assign asink_1_auto_in_a_mem_1_mask = auto_tl_in_xing_in_1_a_mem_1_mask; 
  assign asink_1_auto_in_a_mem_1_data = auto_tl_in_xing_in_1_a_mem_1_data; 
  assign asink_1_auto_in_a_mem_1_corrupt = auto_tl_in_xing_in_1_a_mem_1_corrupt; 
  assign asink_1_auto_in_a_mem_2_opcode = auto_tl_in_xing_in_1_a_mem_2_opcode; 
  assign asink_1_auto_in_a_mem_2_param = auto_tl_in_xing_in_1_a_mem_2_param; 
  assign asink_1_auto_in_a_mem_2_size = auto_tl_in_xing_in_1_a_mem_2_size; 
  assign asink_1_auto_in_a_mem_2_source = auto_tl_in_xing_in_1_a_mem_2_source; 
  assign asink_1_auto_in_a_mem_2_address = auto_tl_in_xing_in_1_a_mem_2_address; 
  assign asink_1_auto_in_a_mem_2_mask = auto_tl_in_xing_in_1_a_mem_2_mask; 
  assign asink_1_auto_in_a_mem_2_data = auto_tl_in_xing_in_1_a_mem_2_data; 
  assign asink_1_auto_in_a_mem_2_corrupt = auto_tl_in_xing_in_1_a_mem_2_corrupt; 
  assign asink_1_auto_in_a_mem_3_opcode = auto_tl_in_xing_in_1_a_mem_3_opcode; 
  assign asink_1_auto_in_a_mem_3_param = auto_tl_in_xing_in_1_a_mem_3_param; 
  assign asink_1_auto_in_a_mem_3_size = auto_tl_in_xing_in_1_a_mem_3_size; 
  assign asink_1_auto_in_a_mem_3_source = auto_tl_in_xing_in_1_a_mem_3_source; 
  assign asink_1_auto_in_a_mem_3_address = auto_tl_in_xing_in_1_a_mem_3_address; 
  assign asink_1_auto_in_a_mem_3_mask = auto_tl_in_xing_in_1_a_mem_3_mask; 
  assign asink_1_auto_in_a_mem_3_data = auto_tl_in_xing_in_1_a_mem_3_data; 
  assign asink_1_auto_in_a_mem_3_corrupt = auto_tl_in_xing_in_1_a_mem_3_corrupt; 
  assign asink_1_auto_in_a_mem_4_opcode = auto_tl_in_xing_in_1_a_mem_4_opcode; 
  assign asink_1_auto_in_a_mem_4_param = auto_tl_in_xing_in_1_a_mem_4_param; 
  assign asink_1_auto_in_a_mem_4_size = auto_tl_in_xing_in_1_a_mem_4_size; 
  assign asink_1_auto_in_a_mem_4_source = auto_tl_in_xing_in_1_a_mem_4_source; 
  assign asink_1_auto_in_a_mem_4_address = auto_tl_in_xing_in_1_a_mem_4_address; 
  assign asink_1_auto_in_a_mem_4_mask = auto_tl_in_xing_in_1_a_mem_4_mask; 
  assign asink_1_auto_in_a_mem_4_data = auto_tl_in_xing_in_1_a_mem_4_data; 
  assign asink_1_auto_in_a_mem_4_corrupt = auto_tl_in_xing_in_1_a_mem_4_corrupt; 
  assign asink_1_auto_in_a_mem_5_opcode = auto_tl_in_xing_in_1_a_mem_5_opcode; 
  assign asink_1_auto_in_a_mem_5_param = auto_tl_in_xing_in_1_a_mem_5_param; 
  assign asink_1_auto_in_a_mem_5_size = auto_tl_in_xing_in_1_a_mem_5_size; 
  assign asink_1_auto_in_a_mem_5_source = auto_tl_in_xing_in_1_a_mem_5_source; 
  assign asink_1_auto_in_a_mem_5_address = auto_tl_in_xing_in_1_a_mem_5_address; 
  assign asink_1_auto_in_a_mem_5_mask = auto_tl_in_xing_in_1_a_mem_5_mask; 
  assign asink_1_auto_in_a_mem_5_data = auto_tl_in_xing_in_1_a_mem_5_data; 
  assign asink_1_auto_in_a_mem_5_corrupt = auto_tl_in_xing_in_1_a_mem_5_corrupt; 
  assign asink_1_auto_in_a_mem_6_opcode = auto_tl_in_xing_in_1_a_mem_6_opcode; 
  assign asink_1_auto_in_a_mem_6_param = auto_tl_in_xing_in_1_a_mem_6_param; 
  assign asink_1_auto_in_a_mem_6_size = auto_tl_in_xing_in_1_a_mem_6_size; 
  assign asink_1_auto_in_a_mem_6_source = auto_tl_in_xing_in_1_a_mem_6_source; 
  assign asink_1_auto_in_a_mem_6_address = auto_tl_in_xing_in_1_a_mem_6_address; 
  assign asink_1_auto_in_a_mem_6_mask = auto_tl_in_xing_in_1_a_mem_6_mask; 
  assign asink_1_auto_in_a_mem_6_data = auto_tl_in_xing_in_1_a_mem_6_data; 
  assign asink_1_auto_in_a_mem_6_corrupt = auto_tl_in_xing_in_1_a_mem_6_corrupt; 
  assign asink_1_auto_in_a_mem_7_opcode = auto_tl_in_xing_in_1_a_mem_7_opcode; 
  assign asink_1_auto_in_a_mem_7_param = auto_tl_in_xing_in_1_a_mem_7_param; 
  assign asink_1_auto_in_a_mem_7_size = auto_tl_in_xing_in_1_a_mem_7_size; 
  assign asink_1_auto_in_a_mem_7_source = auto_tl_in_xing_in_1_a_mem_7_source; 
  assign asink_1_auto_in_a_mem_7_address = auto_tl_in_xing_in_1_a_mem_7_address; 
  assign asink_1_auto_in_a_mem_7_mask = auto_tl_in_xing_in_1_a_mem_7_mask; 
  assign asink_1_auto_in_a_mem_7_data = auto_tl_in_xing_in_1_a_mem_7_data; 
  assign asink_1_auto_in_a_mem_7_corrupt = auto_tl_in_xing_in_1_a_mem_7_corrupt; 
  assign asink_1_auto_in_a_widx = auto_tl_in_xing_in_1_a_widx; 
  assign asink_1_auto_in_a_safe_widx_valid = auto_tl_in_xing_in_1_a_safe_widx_valid; 
  assign asink_1_auto_in_a_safe_source_reset_n = auto_tl_in_xing_in_1_a_safe_source_reset_n; 
  assign asink_1_auto_in_d_ridx = auto_tl_in_xing_in_1_d_ridx; 
  assign asink_1_auto_in_d_safe_ridx_valid = auto_tl_in_xing_in_1_d_safe_ridx_valid; 
  assign asink_1_auto_in_d_safe_sink_reset_n = auto_tl_in_xing_in_1_d_safe_sink_reset_n; 
  assign asink_1_auto_out_a_ready = fragmenter_auto_in_a_ready; 
  assign asink_1_auto_out_d_valid = fragmenter_auto_in_d_valid; 
  assign asink_1_auto_out_d_bits_opcode = fragmenter_auto_in_d_bits_opcode; 
  assign asink_1_auto_out_d_bits_size = fragmenter_auto_in_d_bits_size; 
  assign asink_1_auto_out_d_bits_source = fragmenter_auto_in_d_bits_source; 
  assign asink_1_auto_out_d_bits_denied = fragmenter_auto_in_d_bits_denied; 
  assign asink_1_auto_out_d_bits_data = fragmenter_auto_in_d_bits_data; 
  assign asink_1_auto_out_d_bits_corrupt = fragmenter_auto_in_d_bits_corrupt; 
  assign asource_clock = io_port_axi_aclk_out; 
  assign asource_reset = ~ io_port_axi_aresetn; 
  assign asource_auto_in_a_valid = widget_auto_out_a_valid; 
  assign asource_auto_in_a_bits_opcode = widget_auto_out_a_bits_opcode; 
  assign asource_auto_in_a_bits_param = widget_auto_out_a_bits_param; 
  assign asource_auto_in_a_bits_size = widget_auto_out_a_bits_size; 
  assign asource_auto_in_a_bits_source = widget_auto_out_a_bits_source; 
  assign asource_auto_in_a_bits_address = widget_auto_out_a_bits_address; 
  assign asource_auto_in_a_bits_mask = widget_auto_out_a_bits_mask; 
  assign asource_auto_in_a_bits_data = widget_auto_out_a_bits_data; 
  assign asource_auto_in_a_bits_corrupt = widget_auto_out_a_bits_corrupt; 
  assign asource_auto_in_d_ready = widget_auto_out_d_ready; 
  assign asource_auto_out_a_ridx = auto_tl_out_xing_out_a_ridx; 
  assign asource_auto_out_a_safe_ridx_valid = auto_tl_out_xing_out_a_safe_ridx_valid; 
  assign asource_auto_out_a_safe_sink_reset_n = auto_tl_out_xing_out_a_safe_sink_reset_n; 
  assign asource_auto_out_d_mem_0_opcode = auto_tl_out_xing_out_d_mem_0_opcode; 
  assign asource_auto_out_d_mem_0_param = auto_tl_out_xing_out_d_mem_0_param; 
  assign asource_auto_out_d_mem_0_size = auto_tl_out_xing_out_d_mem_0_size; 
  assign asource_auto_out_d_mem_0_source = auto_tl_out_xing_out_d_mem_0_source; 
  assign asource_auto_out_d_mem_0_sink = auto_tl_out_xing_out_d_mem_0_sink; 
  assign asource_auto_out_d_mem_0_denied = auto_tl_out_xing_out_d_mem_0_denied; 
  assign asource_auto_out_d_mem_0_data = auto_tl_out_xing_out_d_mem_0_data; 
  assign asource_auto_out_d_mem_0_corrupt = auto_tl_out_xing_out_d_mem_0_corrupt; 
  assign asource_auto_out_d_mem_1_opcode = auto_tl_out_xing_out_d_mem_1_opcode; 
  assign asource_auto_out_d_mem_1_param = auto_tl_out_xing_out_d_mem_1_param; 
  assign asource_auto_out_d_mem_1_size = auto_tl_out_xing_out_d_mem_1_size; 
  assign asource_auto_out_d_mem_1_source = auto_tl_out_xing_out_d_mem_1_source; 
  assign asource_auto_out_d_mem_1_sink = auto_tl_out_xing_out_d_mem_1_sink; 
  assign asource_auto_out_d_mem_1_denied = auto_tl_out_xing_out_d_mem_1_denied; 
  assign asource_auto_out_d_mem_1_data = auto_tl_out_xing_out_d_mem_1_data; 
  assign asource_auto_out_d_mem_1_corrupt = auto_tl_out_xing_out_d_mem_1_corrupt; 
  assign asource_auto_out_d_mem_2_opcode = auto_tl_out_xing_out_d_mem_2_opcode; 
  assign asource_auto_out_d_mem_2_param = auto_tl_out_xing_out_d_mem_2_param; 
  assign asource_auto_out_d_mem_2_size = auto_tl_out_xing_out_d_mem_2_size; 
  assign asource_auto_out_d_mem_2_source = auto_tl_out_xing_out_d_mem_2_source; 
  assign asource_auto_out_d_mem_2_sink = auto_tl_out_xing_out_d_mem_2_sink; 
  assign asource_auto_out_d_mem_2_denied = auto_tl_out_xing_out_d_mem_2_denied; 
  assign asource_auto_out_d_mem_2_data = auto_tl_out_xing_out_d_mem_2_data; 
  assign asource_auto_out_d_mem_2_corrupt = auto_tl_out_xing_out_d_mem_2_corrupt; 
  assign asource_auto_out_d_mem_3_opcode = auto_tl_out_xing_out_d_mem_3_opcode; 
  assign asource_auto_out_d_mem_3_param = auto_tl_out_xing_out_d_mem_3_param; 
  assign asource_auto_out_d_mem_3_size = auto_tl_out_xing_out_d_mem_3_size; 
  assign asource_auto_out_d_mem_3_source = auto_tl_out_xing_out_d_mem_3_source; 
  assign asource_auto_out_d_mem_3_sink = auto_tl_out_xing_out_d_mem_3_sink; 
  assign asource_auto_out_d_mem_3_denied = auto_tl_out_xing_out_d_mem_3_denied; 
  assign asource_auto_out_d_mem_3_data = auto_tl_out_xing_out_d_mem_3_data; 
  assign asource_auto_out_d_mem_3_corrupt = auto_tl_out_xing_out_d_mem_3_corrupt; 
  assign asource_auto_out_d_mem_4_opcode = auto_tl_out_xing_out_d_mem_4_opcode; 
  assign asource_auto_out_d_mem_4_param = auto_tl_out_xing_out_d_mem_4_param; 
  assign asource_auto_out_d_mem_4_size = auto_tl_out_xing_out_d_mem_4_size; 
  assign asource_auto_out_d_mem_4_source = auto_tl_out_xing_out_d_mem_4_source; 
  assign asource_auto_out_d_mem_4_sink = auto_tl_out_xing_out_d_mem_4_sink; 
  assign asource_auto_out_d_mem_4_denied = auto_tl_out_xing_out_d_mem_4_denied; 
  assign asource_auto_out_d_mem_4_data = auto_tl_out_xing_out_d_mem_4_data; 
  assign asource_auto_out_d_mem_4_corrupt = auto_tl_out_xing_out_d_mem_4_corrupt; 
  assign asource_auto_out_d_mem_5_opcode = auto_tl_out_xing_out_d_mem_5_opcode; 
  assign asource_auto_out_d_mem_5_param = auto_tl_out_xing_out_d_mem_5_param; 
  assign asource_auto_out_d_mem_5_size = auto_tl_out_xing_out_d_mem_5_size; 
  assign asource_auto_out_d_mem_5_source = auto_tl_out_xing_out_d_mem_5_source; 
  assign asource_auto_out_d_mem_5_sink = auto_tl_out_xing_out_d_mem_5_sink; 
  assign asource_auto_out_d_mem_5_denied = auto_tl_out_xing_out_d_mem_5_denied; 
  assign asource_auto_out_d_mem_5_data = auto_tl_out_xing_out_d_mem_5_data; 
  assign asource_auto_out_d_mem_5_corrupt = auto_tl_out_xing_out_d_mem_5_corrupt; 
  assign asource_auto_out_d_mem_6_opcode = auto_tl_out_xing_out_d_mem_6_opcode; 
  assign asource_auto_out_d_mem_6_param = auto_tl_out_xing_out_d_mem_6_param; 
  assign asource_auto_out_d_mem_6_size = auto_tl_out_xing_out_d_mem_6_size; 
  assign asource_auto_out_d_mem_6_source = auto_tl_out_xing_out_d_mem_6_source; 
  assign asource_auto_out_d_mem_6_sink = auto_tl_out_xing_out_d_mem_6_sink; 
  assign asource_auto_out_d_mem_6_denied = auto_tl_out_xing_out_d_mem_6_denied; 
  assign asource_auto_out_d_mem_6_data = auto_tl_out_xing_out_d_mem_6_data; 
  assign asource_auto_out_d_mem_6_corrupt = auto_tl_out_xing_out_d_mem_6_corrupt; 
  assign asource_auto_out_d_mem_7_opcode = auto_tl_out_xing_out_d_mem_7_opcode; 
  assign asource_auto_out_d_mem_7_param = auto_tl_out_xing_out_d_mem_7_param; 
  assign asource_auto_out_d_mem_7_size = auto_tl_out_xing_out_d_mem_7_size; 
  assign asource_auto_out_d_mem_7_source = auto_tl_out_xing_out_d_mem_7_source; 
  assign asource_auto_out_d_mem_7_sink = auto_tl_out_xing_out_d_mem_7_sink; 
  assign asource_auto_out_d_mem_7_denied = auto_tl_out_xing_out_d_mem_7_denied; 
  assign asource_auto_out_d_mem_7_data = auto_tl_out_xing_out_d_mem_7_data; 
  assign asource_auto_out_d_mem_7_corrupt = auto_tl_out_xing_out_d_mem_7_corrupt; 
  assign asource_auto_out_d_widx = auto_tl_out_xing_out_d_widx; 
  assign asource_auto_out_d_safe_widx_valid = auto_tl_out_xing_out_d_safe_widx_valid; 
  assign asource_auto_out_d_safe_source_reset_n = auto_tl_out_xing_out_d_safe_source_reset_n; 
  assign intsource_clock = io_port_axi_aclk_out; 
  assign intsource_reset = ~ io_port_axi_aresetn; 
  assign intsource_auto_in_0 = axi_to_pcie_x1_auto_int_out_0; 
  assign ibufds_gte2_IB = io_port_REFCLK_rxn; 
  assign ibufds_gte2_I = io_port_REFCLK_rxp; 
  assign ibufds_gte2_CEB = 1'h0; 
endmodule
