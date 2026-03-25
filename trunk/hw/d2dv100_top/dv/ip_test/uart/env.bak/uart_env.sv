// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class uart_env extends cip_base_env #(.CFG_T               (uart_env_cfg),
                                      .COV_T               (uart_env_cov),
                                      .VIRTUAL_SEQUENCER_T (uart_virtual_sequencer),
                                      .SCOREBOARD_T        (uart_scoreboard));
  `uvm_component_utils(uart_env)

  uart_agent              m_uart_agent;

  `uvm_component_new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    m_uart_agent = uart_agent::type_id::create("m_uart_agent", this);
    uvm_config_db#(uart_agent_cfg)::set(this, "m_uart_agent*", "cfg", cfg.m_uart_agent_cfg);
    cfg.m_uart_agent_cfg.en_cov = cfg.en_cov;
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (cfg.en_scb) begin
      m_uart_agent.monitor.tx_analysis_port.connect(scoreboard.uart_tx_fifo.analysis_export);
      m_uart_agent.monitor.rx_analysis_port.connect(scoreboard.uart_rx_fifo.analysis_export);
    end
    if (cfg.m_uart_agent_cfg.is_active) begin
      virtual_sequencer.uart_sequencer_h = m_uart_agent.sequencer;
    end
  endfunction

  // function void create_agent();
  //     int agent_num;
  //     CFG_T act_cfg;
  //     if($cast(act_cfg, cfg)) begin
  //         foreach(act_cfg.uart_agent_sw[i]) begin
  //             if(act_cfg.uart_agent_sw[i] == dv_utils_pkg::ON) begin
  //                 m_uart_agent[i] = uart_agent::type_id::create($sformatf("%s", i), this);
  //                 uvm_config_db#(uart_agent_cfg)::set(this, "m_uart_agent*", "cfg", cfg.m_uart_agent_cfg);
  //                 m_uart_agent[i].cfg = act_cfg.m_uart_agent_cfg[i];
  //                 agt_chk_fifo[i] = new($sformatf("m_agt_chk_fifo-%0d", agent_num), this);
  //                 `uvm_info(get_type_name(), $sformatf("create axi vip %s, work mode is %s", i, m_uart_agent[i].cfg.if_mode.name()), UVM_NONE);
  //                 // if(uvm_is_match("*mst*", i)) begin
  //                 //     scoreboard.exp_port[i] = new($sformatf("m_exp_port-%0d", agent_num), scoreboard);
  //                 // end
  //                 // else if(uvm_is_match("*slv*", i)) begin
  //                 //     scoreboard.act_port[i] = new($sformatf("m_act_port-%0d", agent_num), scoreboard);
  //                 // end
  //                 // else begin
  //                 //     `uvm_warning(get_type_name(), $sformatf("the agent %s not connect any scoreboard port", i));
  //                 // end
  //                 agent_num++;
  //             end
  //         end
  //     end
  //     else begin
  //         `uvm_error(get_type_name(), $sformatf("the cfg type %s is not consistant with act_cfg type %s", cfg.get_type_name(), act_cfg.get_type_name()));
  //     end
  // endfunction: create_agent


endclass
