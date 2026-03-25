module TLBuffer_23( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294764.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294765.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294766.4]
  output        auto_in_a_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_in_a_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [2:0]  auto_in_a_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [2:0]  auto_in_a_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [2:0]  auto_in_a_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [1:0]  auto_in_a_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [37:0] auto_in_a_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [7:0]  auto_in_a_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [63:0] auto_in_a_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_in_a_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_in_b_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_in_b_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [2:0]  auto_in_b_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [1:0]  auto_in_b_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [2:0]  auto_in_b_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [1:0]  auto_in_b_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [37:0] auto_in_b_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [7:0]  auto_in_b_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_in_b_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_in_c_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_in_c_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [2:0]  auto_in_c_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [2:0]  auto_in_c_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [2:0]  auto_in_c_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [1:0]  auto_in_c_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [37:0] auto_in_c_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [63:0] auto_in_c_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_in_c_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_in_d_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_in_d_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [2:0]  auto_in_d_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [1:0]  auto_in_d_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [2:0]  auto_in_d_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [1:0]  auto_in_d_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [2:0]  auto_in_d_bits_sink, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_in_d_bits_denied, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [63:0] auto_in_d_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_in_d_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_in_e_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_in_e_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [2:0]  auto_in_e_bits_sink, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_out_a_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_out_a_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [2:0]  auto_out_a_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [2:0]  auto_out_a_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [2:0]  auto_out_a_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [1:0]  auto_out_a_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [37:0] auto_out_a_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [7:0]  auto_out_a_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [63:0] auto_out_a_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_out_a_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_out_b_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_out_b_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [2:0]  auto_out_b_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [1:0]  auto_out_b_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [2:0]  auto_out_b_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [1:0]  auto_out_b_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [37:0] auto_out_b_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [7:0]  auto_out_b_bits_mask, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_out_b_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_out_c_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_out_c_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [2:0]  auto_out_c_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [2:0]  auto_out_c_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [2:0]  auto_out_c_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [1:0]  auto_out_c_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [37:0] auto_out_c_bits_address, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [63:0] auto_out_c_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_out_c_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_out_d_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_out_d_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [2:0]  auto_out_d_bits_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [1:0]  auto_out_d_bits_param, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [2:0]  auto_out_d_bits_size, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [1:0]  auto_out_d_bits_source, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [2:0]  auto_out_d_bits_sink, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_out_d_bits_denied, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input  [63:0] auto_out_d_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_out_d_bits_corrupt, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  input         auto_out_e_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output        auto_out_e_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
  output [2:0]  auto_out_e_bits_sink // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294767.4]
);
  wire  TLMonitor_clock; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_reset; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_a_ready; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_a_valid; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [2:0] TLMonitor_io_in_a_bits_opcode; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [2:0] TLMonitor_io_in_a_bits_param; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [2:0] TLMonitor_io_in_a_bits_size; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [1:0] TLMonitor_io_in_a_bits_source; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [37:0] TLMonitor_io_in_a_bits_address; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [7:0] TLMonitor_io_in_a_bits_mask; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_a_bits_corrupt; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_b_ready; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_b_valid; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [2:0] TLMonitor_io_in_b_bits_opcode; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [1:0] TLMonitor_io_in_b_bits_param; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [2:0] TLMonitor_io_in_b_bits_size; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [1:0] TLMonitor_io_in_b_bits_source; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [37:0] TLMonitor_io_in_b_bits_address; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [7:0] TLMonitor_io_in_b_bits_mask; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_b_bits_corrupt; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_c_ready; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_c_valid; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [2:0] TLMonitor_io_in_c_bits_opcode; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [2:0] TLMonitor_io_in_c_bits_param; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [2:0] TLMonitor_io_in_c_bits_size; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [1:0] TLMonitor_io_in_c_bits_source; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [37:0] TLMonitor_io_in_c_bits_address; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_c_bits_corrupt; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_d_ready; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_d_valid; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [2:0] TLMonitor_io_in_d_bits_opcode; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [1:0] TLMonitor_io_in_d_bits_param; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [2:0] TLMonitor_io_in_d_bits_size; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [1:0] TLMonitor_io_in_d_bits_source; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [2:0] TLMonitor_io_in_d_bits_sink; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_d_bits_denied; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_d_bits_corrupt; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_e_ready; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  TLMonitor_io_in_e_valid; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire [2:0] TLMonitor_io_in_e_bits_sink; // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
  wire  Queue_clock; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire  Queue_reset; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire  Queue_io_enq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire  Queue_io_enq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [2:0] Queue_io_enq_bits_opcode; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [2:0] Queue_io_enq_bits_param; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [2:0] Queue_io_enq_bits_size; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [1:0] Queue_io_enq_bits_source; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [37:0] Queue_io_enq_bits_address; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [7:0] Queue_io_enq_bits_mask; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [63:0] Queue_io_enq_bits_data; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire  Queue_io_enq_bits_corrupt; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire  Queue_io_deq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire  Queue_io_deq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [2:0] Queue_io_deq_bits_opcode; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [2:0] Queue_io_deq_bits_param; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [2:0] Queue_io_deq_bits_size; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [1:0] Queue_io_deq_bits_source; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [37:0] Queue_io_deq_bits_address; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [7:0] Queue_io_deq_bits_mask; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire [63:0] Queue_io_deq_bits_data; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire  Queue_io_deq_bits_corrupt; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
  wire  Queue_1_clock; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire  Queue_1_reset; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire  Queue_1_io_enq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire  Queue_1_io_enq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire [2:0] Queue_1_io_enq_bits_opcode; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire [1:0] Queue_1_io_enq_bits_param; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire [2:0] Queue_1_io_enq_bits_size; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire [1:0] Queue_1_io_enq_bits_source; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire [2:0] Queue_1_io_enq_bits_sink; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire  Queue_1_io_enq_bits_denied; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire [63:0] Queue_1_io_enq_bits_data; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire  Queue_1_io_enq_bits_corrupt; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire  Queue_1_io_deq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire  Queue_1_io_deq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire [2:0] Queue_1_io_deq_bits_opcode; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire [1:0] Queue_1_io_deq_bits_param; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire [2:0] Queue_1_io_deq_bits_size; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire [1:0] Queue_1_io_deq_bits_source; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire [2:0] Queue_1_io_deq_bits_sink; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire  Queue_1_io_deq_bits_denied; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire [63:0] Queue_1_io_deq_bits_data; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire  Queue_1_io_deq_bits_corrupt; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
  wire  Queue_2_clock; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire  Queue_2_reset; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire  Queue_2_io_enq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire  Queue_2_io_enq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire [2:0] Queue_2_io_enq_bits_opcode; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire [1:0] Queue_2_io_enq_bits_param; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire [2:0] Queue_2_io_enq_bits_size; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire [1:0] Queue_2_io_enq_bits_source; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire [37:0] Queue_2_io_enq_bits_address; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire [7:0] Queue_2_io_enq_bits_mask; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire  Queue_2_io_enq_bits_corrupt; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire  Queue_2_io_deq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire  Queue_2_io_deq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire [2:0] Queue_2_io_deq_bits_opcode; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire [1:0] Queue_2_io_deq_bits_param; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire [2:0] Queue_2_io_deq_bits_size; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire [1:0] Queue_2_io_deq_bits_source; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire [37:0] Queue_2_io_deq_bits_address; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire [7:0] Queue_2_io_deq_bits_mask; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire  Queue_2_io_deq_bits_corrupt; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
  wire  Queue_3_clock; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire  Queue_3_reset; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire  Queue_3_io_enq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire  Queue_3_io_enq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire [2:0] Queue_3_io_enq_bits_opcode; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire [2:0] Queue_3_io_enq_bits_param; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire [2:0] Queue_3_io_enq_bits_size; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire [1:0] Queue_3_io_enq_bits_source; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire [37:0] Queue_3_io_enq_bits_address; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire [63:0] Queue_3_io_enq_bits_data; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire  Queue_3_io_enq_bits_corrupt; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire  Queue_3_io_deq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire  Queue_3_io_deq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire [2:0] Queue_3_io_deq_bits_opcode; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire [2:0] Queue_3_io_deq_bits_param; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire [2:0] Queue_3_io_deq_bits_size; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire [1:0] Queue_3_io_deq_bits_source; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire [37:0] Queue_3_io_deq_bits_address; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire [63:0] Queue_3_io_deq_bits_data; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire  Queue_3_io_deq_bits_corrupt; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
  wire  Queue_4_clock; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294870.4]
  wire  Queue_4_reset; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294870.4]
  wire  Queue_4_io_enq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294870.4]
  wire  Queue_4_io_enq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294870.4]
  wire [2:0] Queue_4_io_enq_bits_sink; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294870.4]
  wire  Queue_4_io_deq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294870.4]
  wire  Queue_4_io_deq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294870.4]
  wire [2:0] Queue_4_io_deq_bits_sink; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294870.4]
  TLMonitor_66 TLMonitor ( // @[Nodes.scala 25:25:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294774.4]
    .clock(TLMonitor_clock),
    .reset(TLMonitor_reset),
    .io_in_a_ready(TLMonitor_io_in_a_ready),
    .io_in_a_valid(TLMonitor_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLMonitor_io_in_a_bits_param),
    .io_in_a_bits_size(TLMonitor_io_in_a_bits_size),
    .io_in_a_bits_source(TLMonitor_io_in_a_bits_source),
    .io_in_a_bits_address(TLMonitor_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_io_in_a_bits_mask),
    .io_in_a_bits_corrupt(TLMonitor_io_in_a_bits_corrupt),
    .io_in_b_ready(TLMonitor_io_in_b_ready),
    .io_in_b_valid(TLMonitor_io_in_b_valid),
    .io_in_b_bits_opcode(TLMonitor_io_in_b_bits_opcode),
    .io_in_b_bits_param(TLMonitor_io_in_b_bits_param),
    .io_in_b_bits_size(TLMonitor_io_in_b_bits_size),
    .io_in_b_bits_source(TLMonitor_io_in_b_bits_source),
    .io_in_b_bits_address(TLMonitor_io_in_b_bits_address),
    .io_in_b_bits_mask(TLMonitor_io_in_b_bits_mask),
    .io_in_b_bits_corrupt(TLMonitor_io_in_b_bits_corrupt),
    .io_in_c_ready(TLMonitor_io_in_c_ready),
    .io_in_c_valid(TLMonitor_io_in_c_valid),
    .io_in_c_bits_opcode(TLMonitor_io_in_c_bits_opcode),
    .io_in_c_bits_param(TLMonitor_io_in_c_bits_param),
    .io_in_c_bits_size(TLMonitor_io_in_c_bits_size),
    .io_in_c_bits_source(TLMonitor_io_in_c_bits_source),
    .io_in_c_bits_address(TLMonitor_io_in_c_bits_address),
    .io_in_c_bits_corrupt(TLMonitor_io_in_c_bits_corrupt),
    .io_in_d_ready(TLMonitor_io_in_d_ready),
    .io_in_d_valid(TLMonitor_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source),
    .io_in_d_bits_sink(TLMonitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_io_in_d_bits_corrupt),
    .io_in_e_ready(TLMonitor_io_in_e_ready),
    .io_in_e_valid(TLMonitor_io_in_e_valid),
    .io_in_e_bits_sink(TLMonitor_io_in_e_bits_sink)
  );
  Queue_18 Queue ( // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294815.4]
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_opcode(Queue_io_enq_bits_opcode),
    .io_enq_bits_param(Queue_io_enq_bits_param),
    .io_enq_bits_size(Queue_io_enq_bits_size),
    .io_enq_bits_source(Queue_io_enq_bits_source),
    .io_enq_bits_address(Queue_io_enq_bits_address),
    .io_enq_bits_mask(Queue_io_enq_bits_mask),
    .io_enq_bits_data(Queue_io_enq_bits_data),
    .io_enq_bits_corrupt(Queue_io_enq_bits_corrupt),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_opcode(Queue_io_deq_bits_opcode),
    .io_deq_bits_param(Queue_io_deq_bits_param),
    .io_deq_bits_size(Queue_io_deq_bits_size),
    .io_deq_bits_source(Queue_io_deq_bits_source),
    .io_deq_bits_address(Queue_io_deq_bits_address),
    .io_deq_bits_mask(Queue_io_deq_bits_mask),
    .io_deq_bits_data(Queue_io_deq_bits_data),
    .io_deq_bits_corrupt(Queue_io_deq_bits_corrupt)
  );
  Queue_19 Queue_1 ( // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294829.4]
    .clock(Queue_1_clock),
    .reset(Queue_1_reset),
    .io_enq_ready(Queue_1_io_enq_ready),
    .io_enq_valid(Queue_1_io_enq_valid),
    .io_enq_bits_opcode(Queue_1_io_enq_bits_opcode),
    .io_enq_bits_param(Queue_1_io_enq_bits_param),
    .io_enq_bits_size(Queue_1_io_enq_bits_size),
    .io_enq_bits_source(Queue_1_io_enq_bits_source),
    .io_enq_bits_sink(Queue_1_io_enq_bits_sink),
    .io_enq_bits_denied(Queue_1_io_enq_bits_denied),
    .io_enq_bits_data(Queue_1_io_enq_bits_data),
    .io_enq_bits_corrupt(Queue_1_io_enq_bits_corrupt),
    .io_deq_ready(Queue_1_io_deq_ready),
    .io_deq_valid(Queue_1_io_deq_valid),
    .io_deq_bits_opcode(Queue_1_io_deq_bits_opcode),
    .io_deq_bits_param(Queue_1_io_deq_bits_param),
    .io_deq_bits_size(Queue_1_io_deq_bits_size),
    .io_deq_bits_source(Queue_1_io_deq_bits_source),
    .io_deq_bits_sink(Queue_1_io_deq_bits_sink),
    .io_deq_bits_denied(Queue_1_io_deq_bits_denied),
    .io_deq_bits_data(Queue_1_io_deq_bits_data),
    .io_deq_bits_corrupt(Queue_1_io_deq_bits_corrupt)
  );
  Queue_20 Queue_2 ( // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294843.4]
    .clock(Queue_2_clock),
    .reset(Queue_2_reset),
    .io_enq_ready(Queue_2_io_enq_ready),
    .io_enq_valid(Queue_2_io_enq_valid),
    .io_enq_bits_opcode(Queue_2_io_enq_bits_opcode),
    .io_enq_bits_param(Queue_2_io_enq_bits_param),
    .io_enq_bits_size(Queue_2_io_enq_bits_size),
    .io_enq_bits_source(Queue_2_io_enq_bits_source),
    .io_enq_bits_address(Queue_2_io_enq_bits_address),
    .io_enq_bits_mask(Queue_2_io_enq_bits_mask),
    .io_enq_bits_corrupt(Queue_2_io_enq_bits_corrupt),
    .io_deq_ready(Queue_2_io_deq_ready),
    .io_deq_valid(Queue_2_io_deq_valid),
    .io_deq_bits_opcode(Queue_2_io_deq_bits_opcode),
    .io_deq_bits_param(Queue_2_io_deq_bits_param),
    .io_deq_bits_size(Queue_2_io_deq_bits_size),
    .io_deq_bits_source(Queue_2_io_deq_bits_source),
    .io_deq_bits_address(Queue_2_io_deq_bits_address),
    .io_deq_bits_mask(Queue_2_io_deq_bits_mask),
    .io_deq_bits_corrupt(Queue_2_io_deq_bits_corrupt)
  );
  Queue_21 Queue_3 ( // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294857.4]
    .clock(Queue_3_clock),
    .reset(Queue_3_reset),
    .io_enq_ready(Queue_3_io_enq_ready),
    .io_enq_valid(Queue_3_io_enq_valid),
    .io_enq_bits_opcode(Queue_3_io_enq_bits_opcode),
    .io_enq_bits_param(Queue_3_io_enq_bits_param),
    .io_enq_bits_size(Queue_3_io_enq_bits_size),
    .io_enq_bits_source(Queue_3_io_enq_bits_source),
    .io_enq_bits_address(Queue_3_io_enq_bits_address),
    .io_enq_bits_data(Queue_3_io_enq_bits_data),
    .io_enq_bits_corrupt(Queue_3_io_enq_bits_corrupt),
    .io_deq_ready(Queue_3_io_deq_ready),
    .io_deq_valid(Queue_3_io_deq_valid),
    .io_deq_bits_opcode(Queue_3_io_deq_bits_opcode),
    .io_deq_bits_param(Queue_3_io_deq_bits_param),
    .io_deq_bits_size(Queue_3_io_deq_bits_size),
    .io_deq_bits_source(Queue_3_io_deq_bits_source),
    .io_deq_bits_address(Queue_3_io_deq_bits_address),
    .io_deq_bits_data(Queue_3_io_deq_bits_data),
    .io_deq_bits_corrupt(Queue_3_io_deq_bits_corrupt)
  );
  Queue_22 Queue_4 ( // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294870.4]
    .clock(Queue_4_clock),
    .reset(Queue_4_reset),
    .io_enq_ready(Queue_4_io_enq_ready),
    .io_enq_valid(Queue_4_io_enq_valid),
    .io_enq_bits_sink(Queue_4_io_enq_bits_sink),
    .io_deq_ready(Queue_4_io_deq_ready),
    .io_deq_valid(Queue_4_io_deq_valid),
    .io_deq_bits_sink(Queue_4_io_deq_bits_sink)
  );
  assign auto_in_a_ready = Queue_io_enq_ready; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_b_valid = Queue_2_io_deq_valid; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_b_bits_opcode = Queue_2_io_deq_bits_opcode; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_b_bits_param = Queue_2_io_deq_bits_param; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_b_bits_size = Queue_2_io_deq_bits_size; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_b_bits_source = Queue_2_io_deq_bits_source; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_b_bits_address = Queue_2_io_deq_bits_address; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_b_bits_mask = Queue_2_io_deq_bits_mask; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_b_bits_corrupt = Queue_2_io_deq_bits_corrupt; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_c_ready = Queue_3_io_enq_ready; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_d_valid = Queue_1_io_deq_valid; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_d_bits_opcode = Queue_1_io_deq_bits_opcode; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_d_bits_param = Queue_1_io_deq_bits_param; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_d_bits_size = Queue_1_io_deq_bits_size; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_d_bits_source = Queue_1_io_deq_bits_source; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_d_bits_sink = Queue_1_io_deq_bits_sink; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_d_bits_denied = Queue_1_io_deq_bits_denied; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_d_bits_data = Queue_1_io_deq_bits_data; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_d_bits_corrupt = Queue_1_io_deq_bits_corrupt; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_in_e_ready = Queue_4_io_enq_ready; // @[LazyModule.scala 173:31:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294814.4]
  assign auto_out_a_valid = Queue_io_deq_valid; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_a_bits_opcode = Queue_io_deq_bits_opcode; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_a_bits_param = Queue_io_deq_bits_param; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_a_bits_size = Queue_io_deq_bits_size; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_a_bits_source = Queue_io_deq_bits_source; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_a_bits_address = Queue_io_deq_bits_address; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_a_bits_mask = Queue_io_deq_bits_mask; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_a_bits_data = Queue_io_deq_bits_data; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_a_bits_corrupt = Queue_io_deq_bits_corrupt; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_b_ready = Queue_2_io_enq_ready; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_c_valid = Queue_3_io_deq_valid; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_c_bits_opcode = Queue_3_io_deq_bits_opcode; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_c_bits_param = Queue_3_io_deq_bits_param; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_c_bits_size = Queue_3_io_deq_bits_size; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_c_bits_source = Queue_3_io_deq_bits_source; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_c_bits_address = Queue_3_io_deq_bits_address; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_c_bits_data = Queue_3_io_deq_bits_data; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_c_bits_corrupt = Queue_3_io_deq_bits_corrupt; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_d_ready = Queue_1_io_enq_ready; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_e_valid = Queue_4_io_deq_valid; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign auto_out_e_bits_sink = Queue_4_io_deq_bits_sink; // @[LazyModule.scala 173:49:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294813.4]
  assign TLMonitor_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294776.4]
  assign TLMonitor_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294777.4]
  assign TLMonitor_io_in_a_ready = Queue_io_enq_ready; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_b_ready = auto_in_b_ready; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_b_valid = Queue_2_io_deq_valid; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_b_bits_opcode = Queue_2_io_deq_bits_opcode; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_b_bits_param = Queue_2_io_deq_bits_param; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_b_bits_size = Queue_2_io_deq_bits_size; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_b_bits_source = Queue_2_io_deq_bits_source; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_b_bits_address = Queue_2_io_deq_bits_address; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_b_bits_mask = Queue_2_io_deq_bits_mask; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_b_bits_corrupt = Queue_2_io_deq_bits_corrupt; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_c_ready = Queue_3_io_enq_ready; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_c_valid = auto_in_c_valid; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_c_bits_opcode = auto_in_c_bits_opcode; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_c_bits_param = auto_in_c_bits_param; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_c_bits_size = auto_in_c_bits_size; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_c_bits_source = auto_in_c_bits_source; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_c_bits_address = auto_in_c_bits_address; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_c_bits_corrupt = auto_in_c_bits_corrupt; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_d_valid = Queue_1_io_deq_valid; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_d_bits_opcode = Queue_1_io_deq_bits_opcode; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_d_bits_param = Queue_1_io_deq_bits_param; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_d_bits_size = Queue_1_io_deq_bits_size; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_d_bits_source = Queue_1_io_deq_bits_source; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_d_bits_sink = Queue_1_io_deq_bits_sink; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_d_bits_denied = Queue_1_io_deq_bits_denied; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_d_bits_corrupt = Queue_1_io_deq_bits_corrupt; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_e_ready = Queue_4_io_enq_ready; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_e_valid = auto_in_e_valid; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign TLMonitor_io_in_e_bits_sink = auto_in_e_bits_sink; // @[Nodes.scala 26:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294810.4]
  assign Queue_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294816.4]
  assign Queue_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294817.4]
  assign Queue_io_enq_valid = auto_in_a_valid; // @[Decoupled.scala 294:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294818.4]
  assign Queue_io_enq_bits_opcode = auto_in_a_bits_opcode; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294826.4]
  assign Queue_io_enq_bits_param = auto_in_a_bits_param; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294825.4]
  assign Queue_io_enq_bits_size = auto_in_a_bits_size; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294824.4]
  assign Queue_io_enq_bits_source = auto_in_a_bits_source; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294823.4]
  assign Queue_io_enq_bits_address = auto_in_a_bits_address; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294822.4]
  assign Queue_io_enq_bits_mask = auto_in_a_bits_mask; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294821.4]
  assign Queue_io_enq_bits_data = auto_in_a_bits_data; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294820.4]
  assign Queue_io_enq_bits_corrupt = auto_in_a_bits_corrupt; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294819.4]
  assign Queue_io_deq_ready = auto_out_a_ready; // @[Buffer.scala 38:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294828.4]
  assign Queue_1_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294830.4]
  assign Queue_1_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294831.4]
  assign Queue_1_io_enq_valid = auto_out_d_valid; // @[Decoupled.scala 294:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294832.4]
  assign Queue_1_io_enq_bits_opcode = auto_out_d_bits_opcode; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294840.4]
  assign Queue_1_io_enq_bits_param = auto_out_d_bits_param; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294839.4]
  assign Queue_1_io_enq_bits_size = auto_out_d_bits_size; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294838.4]
  assign Queue_1_io_enq_bits_source = auto_out_d_bits_source; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294837.4]
  assign Queue_1_io_enq_bits_sink = auto_out_d_bits_sink; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294836.4]
  assign Queue_1_io_enq_bits_denied = auto_out_d_bits_denied; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294835.4]
  assign Queue_1_io_enq_bits_data = auto_out_d_bits_data; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294834.4]
  assign Queue_1_io_enq_bits_corrupt = auto_out_d_bits_corrupt; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294833.4]
  assign Queue_1_io_deq_ready = auto_in_d_ready; // @[Buffer.scala 39:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294842.4]
  assign Queue_2_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294844.4]
  assign Queue_2_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294845.4]
  assign Queue_2_io_enq_valid = auto_out_b_valid; // @[Decoupled.scala 294:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294846.4]
  assign Queue_2_io_enq_bits_opcode = auto_out_b_bits_opcode; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294854.4]
  assign Queue_2_io_enq_bits_param = auto_out_b_bits_param; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294853.4]
  assign Queue_2_io_enq_bits_size = auto_out_b_bits_size; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294852.4]
  assign Queue_2_io_enq_bits_source = auto_out_b_bits_source; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294851.4]
  assign Queue_2_io_enq_bits_address = auto_out_b_bits_address; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294850.4]
  assign Queue_2_io_enq_bits_mask = auto_out_b_bits_mask; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294849.4]
  assign Queue_2_io_enq_bits_corrupt = auto_out_b_bits_corrupt; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294847.4]
  assign Queue_2_io_deq_ready = auto_in_b_ready; // @[Buffer.scala 42:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294856.4]
  assign Queue_3_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294858.4]
  assign Queue_3_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294859.4]
  assign Queue_3_io_enq_valid = auto_in_c_valid; // @[Decoupled.scala 294:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294860.4]
  assign Queue_3_io_enq_bits_opcode = auto_in_c_bits_opcode; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294867.4]
  assign Queue_3_io_enq_bits_param = auto_in_c_bits_param; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294866.4]
  assign Queue_3_io_enq_bits_size = auto_in_c_bits_size; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294865.4]
  assign Queue_3_io_enq_bits_source = auto_in_c_bits_source; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294864.4]
  assign Queue_3_io_enq_bits_address = auto_in_c_bits_address; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294863.4]
  assign Queue_3_io_enq_bits_data = auto_in_c_bits_data; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294862.4]
  assign Queue_3_io_enq_bits_corrupt = auto_in_c_bits_corrupt; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294861.4]
  assign Queue_3_io_deq_ready = auto_out_c_ready; // @[Buffer.scala 43:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294869.4]
  assign Queue_4_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294871.4]
  assign Queue_4_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294872.4]
  assign Queue_4_io_enq_valid = auto_in_e_valid; // @[Decoupled.scala 294:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294873.4]
  assign Queue_4_io_enq_bits_sink = auto_in_e_bits_sink; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294874.4]
  assign Queue_4_io_deq_ready = auto_out_e_ready; // @[Buffer.scala 44:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@294876.4]
endmodule