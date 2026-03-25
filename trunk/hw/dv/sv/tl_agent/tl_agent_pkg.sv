// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//

package tl_agent_pkg;
  // dep packages
  import uvm_pkg::*;
  import bus_params_pkg::*;
  import tlul_pkg::*;
  import mem_model_pkg::*;
  import dv_lib_pkg::*;
  import dv_base_reg_pkg::*;

  // macro includes
  `include "uvm_macros.svh"
  `include "dv_macros.svh"

  parameter int AddrWidth   = bus_params_pkg::BUS_AW;
  parameter int DataWidth   = bus_params_pkg::BUS_DW;
  parameter int SizeWidth   = bus_params_pkg::BUS_SZW;
  parameter int MaskWidth   = bus_params_pkg::BUS_DBW;
  parameter int SourceWidth = bus_params_pkg::BUS_AIW;
  parameter int AUserWidth  = bus_params_pkg::BUS_AUW;
  parameter int DUserWidth  = bus_params_pkg::BUS_DUW;
  parameter int OpcodeWidth = 3;

  typedef class tl_seq_item;
  typedef class tl_agent_cfg;
  // reuse dv_base_driver as is with the right parameter set
  typedef dv_base_driver #(tl_seq_item, tl_agent_cfg) tl_base_driver;

  // TileLink conformance level
  typedef enum bit [1:0] {
    kTLUL,
    kTLUH,
    kTLC
  } tl_level_e;

  typedef enum {
    AddrChannel,
    DataChannel
  } tl_channels_e;

  function automatic void enable_logging(string file_name="tl_agent.log");
    int log_fd = $fopen(file_name,"w");
    `uvm_info("tl_agent_pkg", $sformatf("The TL agent transaction log will be saved to %0s",
                              file_name), UVM_LOW)
    uvm_top.set_report_id_verbosity_hier("tl_logging", UVM_HIGH);
    uvm_top.set_report_id_file_hier("tl_logging", log_fd);
    uvm_top.set_report_id_verbosity_hier("tl_logging", UVM_HIGH);
    // Always save in a separate log file and disable printing on the screen
    uvm_top.set_report_severity_id_action_hier(UVM_INFO, "tl_logging", UVM_LOG);
    uvm_top.set_report_severity_id_action_hier(UVM_WARNING,
                                               "tl_logging", UVM_DISPLAY | UVM_LOG);
    uvm_top.set_report_severity_id_action_hier(UVM_ERROR,
                                               "tl_logging", UVM_DISPLAY | UVM_LOG | UVM_COUNT);
    uvm_top.set_report_severity_id_action_hier(UVM_FATAL,
                                               "tl_logging", UVM_DISPLAY | UVM_LOG | UVM_EXIT);
  endfunction

  function automatic void judge_rsp_complete(tl_seq_item temp_rsp, int unsigned rsp_data_width, string print_str = "");
    automatic int unsigned max_single_beat_byte_cnt;
    max_single_beat_byte_cnt = rsp_data_width/8;
    case(rsp_data_width)
      64: begin
        if(temp_rsp.d_size <= 3) begin // donot modify rsp_completed
          temp_rsp.rsp_completed = 1;
          return ;
        end
      end
      32: begin
        if(temp_rsp.d_size <= 2) begin
          temp_rsp.rsp_completed = 1;
          return ;
        end
      end
      default: begin
        `uvm_error(print_str, $sformatf("cannot implement this data width 0d%0d", rsp_data_width))
      end
    endcase
    if((temp_rsp.remain_byte_cnt%max_single_beat_byte_cnt) != 0) begin
      `uvm_error(print_str, $sformatf("remain_byte_cnt 0d%0d is not allign with max_single_beat_byte_cnt 0d%0d", temp_rsp.remain_byte_cnt, max_single_beat_byte_cnt))
    end
    if(temp_rsp.remain_byte_cnt > max_single_beat_byte_cnt) begin
      if((temp_rsp.a_addr%max_single_beat_byte_cnt) != 0) begin  // only support allign, unallign todo
        `uvm_error(print_str, $sformatf("remain addr 0x%0h is not allign with max_single_beat_byte_cnt 0d%0d", temp_rsp.a_addr, max_single_beat_byte_cnt))
      end
      temp_rsp.a_addr += max_single_beat_byte_cnt;
      temp_rsp.remain_byte_cnt -= max_single_beat_byte_cnt;
      temp_rsp.rsp_completed = 0;
    end
    else begin
      temp_rsp.rsp_completed = 1;
    end
    `uvm_info(print_str, $sformatf("remain_byte_cnt 0d%0d is not allign with max_single_beat_byte_cnt 0d%0d, rsp_data_width is %0d, rsp_completed is %0b", temp_rsp.remain_byte_cnt, max_single_beat_byte_cnt, rsp_data_width, temp_rsp.rsp_completed), UVM_HIGH)
  endfunction

  `include "tl_seq_item.sv"
  `include "tl_agent_cfg.sv"
  `include "tl_agent_cov.sv"
  `include "tl_host_driver.sv"
  `include "tl_device_driver.sv"
  `include "tl_sequencer.sv"
  `include "tl_monitor.sv"
  `include "tl_agent.sv"
  `include "tl_reg_adapter.sv"
  `include "tl_seq_list.sv"

endpackage
