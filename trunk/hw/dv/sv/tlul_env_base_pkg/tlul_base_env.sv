
class tlul_base_env extends axi_base_env #(.CLASS_T(cip_base_env),
                                        .CFG_T           (tlul_base_env_cfg),
                                        .COV_T               (tlul_base_env_cov),
                                        .VIRTUAL_SEQUENCER_T (tlul_base_virtual_sequencer),
                                        .SCOREBOARD_T        (tlul_base_scoreboard));

  `uvm_component_utils(tlul_base_env)

  // Components
  tl_agent m_tlul_agent[string];
//   tl_agent                                           m_tl_agents[string];
//   tl_reg_adapter #(tl_seq_item)                      m_tl_reg_adapters[string];
//   alert_esc_agent                                    m_alert_agent[string];
//   push_pull_agent#(.DeviceDataWidth(EDN_DATA_WIDTH)) m_edn_pull_agent;

  `uvm_component_new

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
    //  Function: connect_phase
    extern function void connect_phase(uvm_phase phase);

    extern function void create_agent();

    
endclass //tlul_base_env extends uvm_env

function void tlul_base_env::build_phase(uvm_phase phase);
    /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
    /*  For more information see UVM Cookbook v1800.2 p.503  */
    super.build_phase(phase);
endfunction: build_phase

function void tlul_base_env::connect_phase(uvm_phase phase);
    int agent_num;
    super.connect_phase(phase);
    foreach(m_tlul_agent[i]) begin
        `uvm_info(get_type_name(), $sformatf("agent %s, agent full_name: %s, is_active %0d", i, m_tlul_agent[i].get_full_name(), m_tlul_agent[i].cfg.is_active), UVM_DEBUG);
        if(m_tlul_agent[i].cfg.is_active == 1) begin
            uvm_sequencer_base temp_sqr;
            `uvm_info(get_type_name(), $sformatf("agent %s, agent full_name: %s, if_mode %0s", i, m_tlul_agent[i].get_full_name(), m_tlul_agent[i].cfg.if_mode.name()), UVM_DEBUG);
            assert($cast(temp_sqr, m_tlul_agent[i].sequencer));
            //m_tlul_agent[i].ap.connect(agt_chk_fifo[i].analysis_export);
            // add sqr to virtual sequencer
            if((m_tlul_agent[i].cfg.if_mode == dv_utils_pkg::Host)) begin
                virtual_sequencer.add_sqr("tlul", {i, "-sqr"}, temp_sqr, "mst");
            end
            else if((m_tlul_agent[i].cfg.if_mode == dv_utils_pkg::Device)) begin
                virtual_sequencer.add_sqr("tlul", {i, "-sqr"}, temp_sqr, "slv");
            end
            agent_num++;
        end
        
    end
    foreach(scoreboard.exp_port[i]) begin
        scoreboard.exp_port[i].connect(agt_chk_fifo[i].blocking_get_export);
        `uvm_info(get_type_name(), $sformatf("agent fifo port %s, connect to checker exp port", i), UVM_DEBUG);
    end
    foreach(scoreboard.act_port[i]) begin
        scoreboard.act_port[i].connect(agt_chk_fifo[i].blocking_get_export);
        `uvm_info(get_type_name(), $sformatf("agent fifo port %s, connect to checker act port", i), UVM_DEBUG);
    end

endfunction: connect_phase

function void tlul_base_env::create_agent();
    int agent_num;
    CFG_T act_cfg;
    super.create_agent();
    //`uvm_info(`gfn, $sformatf("check %s: \n%0s", cfg.get_type_name(), cfg.sprint()), UVM_MEDIUM)
    if($cast(act_cfg, cfg)) begin
        `uvm_info(`gfn, $sformatf("check %s: harness_api_abstract::harness_api_q size is %0d", act_cfg.get_type_name(), harness_api_abstract::harness_api_q.size()), UVM_MEDIUM)
        foreach(harness_api_abstract::harness_api_q[inst_path]) begin
            tl_intf_c tlul_intf;
            string port_name, port_inst_path;
            `uvm_info(`gfn, $sformatf("check inst_path: %s", inst_path), UVM_MEDIUM)
            if($cast(tlul_intf, harness_api_abstract::harness_api_q[inst_path])) begin
                int port_num = tlul_intf.get_port_num(tl_intf_c::PORT_TYPE); 
                `uvm_info(`gfn, $sformatf("check inst_path: %s, port_num is %0d", inst_path, port_num), UVM_MEDIUM)
                for(int i = 0; i < port_num; i++) begin
                    port_name = tlul_intf.get_port_name(tl_intf_c::PORT_TYPE, i);
                    port_inst_path = {inst_path, "-", port_name};
                    if(act_cfg.tlul_agent_sw[port_inst_path] == dv_utils_pkg::ON) begin
                        //act_cfg.tlul_agent_work_mode[port_inst_path] = dv_utils_pkg::MASTER;
                        if(act_cfg.m_tlul_agent_cfg[port_inst_path] == null) begin
                            `uvm_error(`gfn, $sformatf("need set testcase in top"))
                            act_cfg.m_tlul_agent_cfg[port_inst_path] = tl_agent_cfg::type_id::create($sformatf("m_tlul_agent_cfg-%s", port_inst_path));
                        end
                        if(act_cfg.tlul_agent_work_mode[port_inst_path] == dv_utils_pkg::MASTER) begin
                            act_cfg.m_tlul_agent_cfg[port_inst_path].if_mode = dv_utils_pkg::Host;
                            act_cfg.m_tlul_agent_cfg[port_inst_path].is_active = 1;
                        end
                        else if(act_cfg.tlul_agent_work_mode[port_inst_path] == dv_utils_pkg::SLAVE) begin
                            act_cfg.m_tlul_agent_cfg[port_inst_path].if_mode = dv_utils_pkg::Device;
                            act_cfg.m_tlul_agent_cfg[port_inst_path].is_active = 1;
                        end
                        else if(act_cfg.tlul_agent_work_mode[port_inst_path] == dv_utils_pkg::ONLY_MONITOR) begin
                            act_cfg.m_tlul_agent_cfg[port_inst_path].if_mode = dv_utils_pkg::Device;
                            act_cfg.m_tlul_agent_cfg[port_inst_path].is_active = 0;
                        end
                        uvm_config_db#(virtual tl_if)::set(uvm_root::get(), {"*", port_inst_path, "*"}, "vif", tlul_intf.get_if(i));
                        uvm_config_db#(tl_agent_cfg)::set(uvm_root::get(), {"*", port_inst_path, "*"}, "cfg", act_cfg.m_tlul_agent_cfg[port_inst_path]);
                        `uvm_info(get_type_name(), $sformatf("get harness path %s, port_name %s, work_mode is %s, probably create vip", port_inst_path, port_name, act_cfg.tlul_agent_work_mode[port_inst_path].name()), UVM_LOW);
                        tlul_intf.set_vif_work_mode(act_cfg.tlul_agent_sw[port_inst_path], act_cfg.tlul_agent_work_mode[port_inst_path], port_name);
                    end
                    agent_num++;
                end
                tlul_intf.drive_vip();
            end
        end
        foreach(act_cfg.tlul_agent_sw[i]) begin
            if(act_cfg.tlul_agent_sw[i] == dv_utils_pkg::ON) begin
                m_tlul_agent[i] = tl_agent::type_id::create($sformatf("%s", i), this);
                m_tlul_agent[i].cfg = act_cfg.m_tlul_agent_cfg[i];
                agt_chk_fifo[i] = new($sformatf("m_agt_chk_fifo-%0d-%0s", agent_num, i), this);
                `uvm_info(get_type_name(), $sformatf("create tlul vip %s, if mode is %s, is_active is %0d", i, m_tlul_agent[i].cfg.if_mode.name(), m_tlul_agent[i].cfg.is_active), UVM_NONE);
                if(uvm_is_match("*mst*", i)) begin
                    scoreboard.exp_port[i] = new($sformatf("m_exp_port-%0d-%0s", agent_num, i), scoreboard);
                end
                else if(uvm_is_match("*slv*", i)) begin
                    scoreboard.act_port[i] = new($sformatf("m_act_port-%0d-%0s", agent_num, i), scoreboard);
                end
                else begin
                    `uvm_warning(get_type_name(), $sformatf("the agent %s not connect any scoreboard port", i));
                end
                agent_num++;
            end
        end
    end
    else begin
        `uvm_error(get_type_name(), $sformatf("the cfg type %s is not consistant with act_cfg type %s", cfg.get_type_name(), act_cfg.get_type_name()));
    end
endfunction: create_agent
