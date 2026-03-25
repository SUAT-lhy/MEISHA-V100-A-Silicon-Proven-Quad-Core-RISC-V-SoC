
module RoccBlackBox
(
  input         clock,
  input         reset,
  // Core control (CC) signals
  output        cc_busy_o,
  input         cc_status_i,
  output        cc_interrupt_o,
  input         cc_exception_i,
  input  [1:0] cc_host_id_i,

  // Register mode (Core) signals
  // RoCC command  
  output        core_cmd_ready_o,
  input         core_cmd_valid_i,
  input  [6:0]  core_cmd_inst_funct_i,
  input  [4:0]  core_cmd_inst_rs2_i,
  input  [4:0]  core_cmd_inst_rs1_i,
  input         core_cmd_inst_xd_i,
  input         core_cmd_inst_xs1_i,
  input         core_cmd_inst_xs2_i,
  input  [4:0]  core_cmd_inst_rd_i,
  input  [6:0]  core_cmd_inst_opcode_i,
  input  [63:0] core_cmd_rs1_i,
  input  [63:0] core_cmd_rs2_i,

  // RoCC response
  input         core_resp_ready_i,
  output        core_resp_valid_o,  
  output [4:0]  core_resp_rd_o,
  output [63:0] core_resp_data_o,

  // Memory mode (Mem) signals
  // Memory request  
  input         mem_req_ready_i,
  output        mem_req_valid_o,
  output [39:0] mem_req_addr_o,
  output [9:0]  mem_req_tag_o,
  output [4:0]  mem_req_cmd_o,
  output [2:0]  mem_req_typ_o,
  output        mem_req_phys_o,
  output [63:0] mem_req_data_o,

  // Memory response
  input         mem_resp_valid_i,
  input  [39:0] mem_resp_addr_i,
  input  [9:0]  mem_resp_tag_i,
  input  [4:0]  mem_resp_cmd_i,
  input  [2:0]  mem_resp_typ_i, 
  input  [63:0] mem_resp_data_i,
  input         mem_resp_nack_i,
  input         mem_resp_replay_i,
  input         mem_resp_has_data_i,
  input  [63:0] mem_resp_data_word_bypass_i,
  input  [63:0] mem_resp_store_data_i
);


  // Core control (CC) signals
   assign cc_busy_o = 0;
   assign cc_interrupt_o = 0;

  // Register mode (Core) signals
  // RoCC command  
   assign core_cmd_ready_o = 0;

  // RoCC response
   assign core_resp_valid_o = 0;  
   assign core_resp_rd_o = 0;
   assign core_resp_data_o = 0;

  // Memory mode (Mem) signals
  // Memory request  
   assign mem_req_valid_o = 0;
   assign mem_req_addr_o = 0;
   assign mem_req_tag_o = 0;
   assign mem_req_cmd_o = 0;
   assign mem_req_typ_o = 0;
   assign mem_req_phys_o = 0;
   assign mem_req_data_o = 0;

  // Memory response

  // // rocc

  // typedef struct packed {
  //   logic  [6:0] inst_funct;
  //   logic  [4:0] inst_rs2;
  //   logic  [4:0] inst_rs1;
  //   logic        inst_xd;
  //   logic        inst_xs1;
  //   logic        inst_xs2;
  //   logic  [4:0] inst_rd;
  //   logic  [6:0] inst_opcode;
  //   logic [63:0] rs1;
  //   logic [63:0] rs2;
  // } bsg_rocc_cmd_pkt;

  // typedef struct packed {
  //   logic  [4:0] rd;
  //   logic [63:0] data;
  // } bsg_rocc_resp_pkt;

  // typedef struct packed {
  //   logic  [9:0] tag;
  //   logic  [4:0] cmd;
  //   logic  [2:0] typ;
  //   logic        phys;
  //   logic [39:0] addr;
  //   logic [63:0] data;
  // } bsg_rocc_mem_req_pkt;

  // typedef struct packed {
  //   logic [39:0] addr;
  //   logic  [9:0] tag;
  //   logic  [4:0] cmd;
  //   logic  [2:0] typ;
  //   logic [63:0] data;
  //   logic        nack;
  //   logic        replay;
  //   logic        has_data;
  //   logic [63:0] data_word_bypass;
  //   logic [63:0] store_data;
  // } bsg_rocc_mem_resp_pkt;

  // typedef struct packed {
  //   logic busy;
  //   logic interrupt;
  // } bsg_rocc_ctrl_in_pkt;

  // typedef struct packed {
  //   logic s;
  //   logic exception;
  //   logic host_id;
  // } bsg_rocc_ctrl_out_pkt;

/*
  `include "bsg_rocket_pkg.vh"
  import bsg_chip_pkg::*;
  
    //  out of rocket nodes (rocc cmd)
  wire [bsg_chip_pkg::rocc_num_gp-1:0] core_rocc_cmd_v;
  bsg_rocc_cmd_pkt core_rocc_cmd_data [bsg_chip_pkg::rocc_num_gp-1:0];
  wire [bsg_chip_pkg::rocc_num_gp-1:0] core_rocc_cmd_ready;

  // into rocket nodes (rocc resp)
  wire [bsg_chip_pkg::rocc_num_gp-1:0] core_rocc_resp_v;
  bsg_rocc_resp_pkt core_rocc_resp_data [bsg_chip_pkg::rocc_num_gp-1:0];
  wire [bsg_chip_pkg::rocc_num_gp-1:0] core_rocc_resp_ready;

  // into rocket nodes (rocc mem req)
  wire [bsg_chip_pkg::rocc_num_gp-1:0] core_rocc_mem_req_v;
  bsg_rocc_mem_req_pkt core_rocc_mem_req_data [bsg_chip_pkg::rocc_num_gp-1:0];
  wire [bsg_chip_pkg::rocc_num_gp-1:0] core_rocc_mem_req_ready;

  // out of rocket nodes (rocc mem resp)
  wire [bsg_chip_pkg::rocc_num_gp-1:0] core_rocc_mem_resp_v;
  bsg_rocc_mem_resp_pkt core_rocc_mem_resp_data [bsg_chip_pkg::rocc_num_gp-1:0];

  // into rocket nodes (rocc ctrl)
  bsg_rocc_ctrl_in_pkt core_rocc_ctrl_in [bsg_chip_pkg::rocc_num_gp-1:0] ;

  // out of rocket nodes (rocc ctrl)
  bsg_rocc_ctrl_out_pkt core_rocc_ctrl_out [bsg_chip_pkg::rocc_num_gp-1:0] ;

  assign core_rocc_cmd_v[0] =  core_cmd_valid_i;
  assign core_cmd_ready_o =  core_rocc_cmd_ready[0];
  assign core_rocc_cmd_data[0].inst_funct = core_cmd_inst_funct_i;
  assign core_rocc_cmd_data[0].inst_rs2 = core_cmd_inst_rs2_i;
  assign core_rocc_cmd_data[0].inst_rs1 = core_cmd_inst_rs1_i;
  assign core_rocc_cmd_data[0].inst_xd = core_cmd_inst_xd_i;
  assign core_rocc_cmd_data[0].inst_xs1 = core_cmd_inst_xs1_i;
  assign core_rocc_cmd_data[0].inst_xs2 = core_cmd_inst_xs2_i;
  assign core_rocc_cmd_data[0].inst_rd = core_cmd_inst_rd_i;
  assign core_rocc_cmd_data[0].inst_opcode = core_cmd_inst_opcode_i;
  assign core_rocc_cmd_data[0].inst_rs1 = core_cmd_rs1_i;
  assign core_rocc_cmd_data[0].inst_rs2 = core_cmd_rs2_i;

  assign core_rocc_resp_ready[0] = core_resp_ready_i;
  assign core_resp_valid_o = core_rocc_resp_v[0];
  assign core_rocc_resp_data[0].rd = core_resp_rd_o;
  assign core_rocc_resp_data[0].data = core_resp_data_o;

  assign core_rocc_mem_req_ready[0] = mem_req_ready_i;
  assign mem_req_valid_o = core_rocc_mem_req_v[0];
  assign mem_req_tag_o = core_rocc_mem_req_data[0].tag;
  assign mem_req_cmd_o = core_rocc_mem_req_data[0].cmd;
  assign mem_req_typ_o = core_rocc_mem_req_data[0].typ;
  assign mem_req_phys_o = core_rocc_mem_req_data[0].phys;
  assign mem_req_addr_o = core_rocc_mem_req_data[0].addr;

  assign core_rocc_mem_resp_v[0] = mem_resp_valid_i;
  assign core_rocc_mem_resp_data[0].addr = mem_resp_addr_i;
  assign core_rocc_mem_resp_data[0].tag = mem_resp_tag_i;
  assign core_rocc_mem_resp_data[0].cmd = mem_resp_cmd_i;
  assign core_rocc_mem_resp_data[0].typ = mem_resp_typ_i; 
  assign core_rocc_mem_resp_data[0].data = mem_resp_data_i;
  assign core_rocc_mem_resp_data[0].nack = mem_resp_nack_i;
  assign core_rocc_mem_resp_data[0].replay = mem_resp_replay_i;
  assign core_rocc_mem_resp_data[0].has_data = mem_resp_has_data_i;
  assign core_rocc_mem_resp_data[0].data_word_bypass = mem_resp_data_word_bypass_i;
  assign core_rocc_mem_resp_data[0].store_data = mem_resp_store_data_i;

  assign cc_busy_o = core_rocc_ctrl_in[0].busy;
  assign cc_interrupt_o = core_rocc_ctrl_in[0].interrupt;

  assign core_rocc_ctrl_out[0].s = cc_status_i;
  assign core_rocc_ctrl_out[0].exception = cc_exception_i;
  assign core_rocc_ctrl_out[0].host_id = cc_host_id_i;
*/
//   bsg_rocket_accelerator_array #(
//     .nodes_p(1),
//     .out_fifo_width_lp(64)
//   ) accelerator_inst (
//     .clk_i(clock),
//     .manycore_clk_i(clock),
//     .reset_i(reset),
//     .en_i(1),
    
//     // ROCC command interface
//     .rocc_cmd_v_i(core_rocc_cmd_v),
//     .rocc_cmd_data_i(core_rocc_cmd_data),
//     .rocc_cmd_ready_o(core_rocc_cmd_ready),
    
//     // ROCC response interface
//     .rocc_resp_v_o(core_rocc_resp_v),
//     .rocc_resp_data_o(core_rocc_resp_data),
//     .rocc_resp_ready_i(core_rocc_resp_ready),
    
//     // Memory request interface
//     .rocc_mem_req_v_o(core_rocc_mem_req_v),
//     .rocc_mem_req_data_o(core_rocc_mem_req_data),
//     .rocc_mem_req_ready_i(core_rocc_mem_req_ready),
    
//     // Memory response interface
//     .rocc_mem_resp_v_i(core_rocc_mem_resp_v),
//     .rocc_mem_resp_data_i(core_rocc_mem_resp_data),
    
//     // Control interfaces
//     .rocc_ctrl_o(core_rocc_ctrl_out),
//     .rocc_ctrl_i(core_rocc_ctrl_in)
//   );

endmodule
