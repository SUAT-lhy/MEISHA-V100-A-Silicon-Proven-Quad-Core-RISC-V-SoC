// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class dv_base_virtual_sequencer #(type CFG_T = dv_base_env_cfg,
                                  type COV_T = dv_base_env_cov) extends uvm_sequencer;
  `uvm_component_param_utils(dv_base_virtual_sequencer #(CFG_T, COV_T))

  CFG_T         cfg;
  COV_T         cov;
  uvm_sequencer_base sqr_q[string][string];
  uvm_sequencer_base slv_sqr_q[string][string];

  `uvm_component_new

  function void add_sqr(string port_type, string sqr_name, uvm_sequencer_base sqr, string sqr_type = "mst");
      if(sqr_type == "mst") begin
          sqr_q[port_type][sqr_name] = sqr;
      end
      else if(sqr_type == "slv") begin
          slv_sqr_q[port_type][sqr_name] = sqr;
      end
      else begin
          `uvm_error(get_type_name(), $sformatf("add sqr %s - %s, port_type %s, sqr_type %s, sqr_q ", sqr_name, sqr.get_full_name(), port_type, sqr_type));
      end
      `uvm_info(get_type_name(), $sformatf("add sqr %s - %s, port_type %s, sqr_type %s, sqr_q ", sqr_name, sqr.get_full_name(), port_type, sqr_type), UVM_LOW);
  endfunction
  
  virtual function uvm_sequencer_base match_sqr(string port_type, string sqr_name, string sqr_type = "mst");
    if(sqr_type == "mst") begin
      foreach(sqr_q[i]) begin
        if(uvm_is_match({"*", port_type,"*"}, i)) begin
          foreach(sqr_q[i][j]) begin
              `uvm_info(get_type_name(), $sformatf("check sequencer type %0s for port_name %0s", i, j), UVM_MEDIUM)
              if(uvm_is_match({"*", sqr_name,"*"}, j)) begin
                match_sqr = sqr_q[i][j];
                `uvm_info(get_type_name(), $sformatf("match sequencer type %0s-%0s for port_name %0s-%0s, to sqr_q %s", port_type, i, sqr_name, j, match_sqr.get_full_name()), UVM_LOW)
              end
          end
        end
      end
    end
    else if(sqr_type == "slv") begin
      foreach(slv_sqr_q[i]) begin
        if(uvm_is_match({"*", port_type,"*"}, i)) begin
          foreach(slv_sqr_q[i][j]) begin
              `uvm_info(get_type_name(), $sformatf("check sequencer type %0s for port_name %0s", i, j), UVM_MEDIUM)
              if(uvm_is_match({"*", sqr_name,"*"}, j)) begin
                match_sqr = slv_sqr_q[i][j];
                `uvm_info(get_type_name(), $sformatf("match sequencer type %0s-%0s for port_name %0s-%0s, to slv_sqr_q %s", port_type, i, sqr_name, j, match_sqr.get_full_name()), UVM_NONE)
              end
          end
        end
      end
    end
    else begin
        `uvm_error(get_type_name(), $sformatf("match_sqr: cannot find sqr_type, sqr_name: %s, port_type %s, sqr_type %s, sqr_q ", sqr_name, port_type, sqr_type));
    end
    if(match_sqr == null) begin
        `uvm_error(get_type_name(), $sformatf("match_sqr: cannot match sequencer type %0s for port_type %0s, sqr_type %s", port_type, sqr_name, sqr_type))
    end
  endfunction

endclass
