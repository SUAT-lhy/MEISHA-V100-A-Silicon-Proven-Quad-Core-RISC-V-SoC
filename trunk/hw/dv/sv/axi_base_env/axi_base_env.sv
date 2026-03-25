
class axi_base_env #(type CLASS_T = cip_base_env, 
                     type CFG_T = axi_base_env_cfg, 
                     type COV_T = axi_base_env_cov,
                     type VIRTUAL_SEQUENCER_T = axi_base_virtual_sequencer,
                     type SCOREBOARD_T = axi_base_scoreboard)
                     extends cip_base_env #(.CFG_T (CFG_T),
                                      .COV_T (COV_T),
                                      .VIRTUAL_SEQUENCER_T (VIRTUAL_SEQUENCER_T),
                                      .SCOREBOARD_T        (SCOREBOARD_T));

  `uvm_component_utils(axi_base_env)

  // Components
  axi_agent m_axi_agent[string];
//   axi_agent                                           m_axi_agents[string];
//   axi_reg_adapter #(axi_seq_item)                      m_axi_reg_adapters[string];
//   alert_esc_agent                                    m_alert_agent[string];
//   push_pull_agent#(.DeviceDataWidth(EDN_DATA_WIDTH)) m_edn_pull_agent;

  `uvm_component_new

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
    //  Function: connect_phase
    extern function void connect_phase(uvm_phase phase);

    extern function void create_agent();

    
endclass //axi_base_env extends uvm_env

function void axi_base_env::build_phase(uvm_phase phase);
    /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
    /*  For more information see UVM Cookbook v1800.2 p.503  */
    super.build_phase(phase);
endfunction: build_phase

function void axi_base_env::connect_phase(uvm_phase phase);
    int agent_num;
    super.connect_phase(phase);
    foreach(m_axi_agent[i]) begin
        m_axi_agent[i].ap.connect(agt_chk_fifo[i].analysis_export);
        // add sqr to virtual sequencer
        if((m_axi_agent[i].cfg.work_mode == dv_utils_pkg::MASTER) || (m_axi_agent[i].cfg.work_mode == dv_utils_pkg::MASTER_NO_MONITOR)) begin
            virtual_sequencer.add_sqr("axi", {i, "-wsqr"}, m_axi_agent[i].w_seqr, "mst");
            virtual_sequencer.add_sqr("axi", {i, "-rsqr"}, m_axi_agent[i].r_seqr, "mst");
        end
        else if((m_axi_agent[i].cfg.work_mode == dv_utils_pkg::SLAVE)) begin
            virtual_sequencer.add_sqr("axi", {i}, m_axi_agent[i].slv_seqr, "slv");  // only used for placeholder for search or record
        end
        agent_num++;
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

function void axi_base_env::create_agent();
    int agent_num;
    CFG_T act_cfg;
    super.create_agent();
    if($cast(act_cfg, cfg)) begin
        foreach(harness_api_abstract::harness_api_q[inst_path]) begin
            axi_intf_c axi_intf;
            string port_name, port_inst_path;
            if($cast(axi_intf, harness_api_abstract::harness_api_q[inst_path])) begin
                int port_num = axi_intf.get_port_num(axi_intf_c::PORT_TYPE); 
                for(int i = 0; i < port_num; i++) begin
                    port_name = axi_intf.get_port_name(axi_intf_c::PORT_TYPE, i);
                    port_inst_path = {inst_path, "-", port_name};
                    if(act_cfg.axi_agent_sw[port_inst_path] == dv_utils_pkg::ON) begin
                        if(act_cfg.m_axi_agent_cfg[port_inst_path] == null) begin
                            `uvm_error(`gfn, $sformatf("%0s m_axi_agent_cfg cannot be null", port_inst_path))
                            act_cfg.m_axi_agent_cfg[port_inst_path] = axi_agent_cfg::type_id::create($sformatf("m_axi_agent_cfg-%s", port_inst_path));
                        end
                        act_cfg.m_axi_agent_cfg[port_inst_path].work_mode = act_cfg.axi_agent_work_mode[port_inst_path];
                        uvm_config_db#(virtual axi_interface)::set(uvm_root::get(), {"*", port_inst_path, "*"}, "vif", axi_intf.get_if(i));
                        uvm_config_db#(axi_agent_cfg)::set(uvm_root::get(), {"*", port_inst_path, "*"}, "cfg", act_cfg.m_axi_agent_cfg[port_inst_path]);
                        `uvm_info(get_type_name(), $sformatf("get harness path %s, port_name %s, work_mode is %s, probably create vip", port_inst_path, port_name, act_cfg.axi_agent_work_mode[port_inst_path].name()), UVM_LOW);
                        axi_intf.set_vif_work_mode(act_cfg.axi_agent_sw[port_inst_path], act_cfg.axi_agent_work_mode[port_inst_path], port_name);
                        `uvm_info(get_type_name(), $sformatf("get harness path %s, port_name %s, probably create vip", inst_path, port_name), UVM_LOW);
                    end
                    agent_num++;
                end
                axi_intf.drive_vip();
            end
        end
    
        foreach(act_cfg.axi_agent_sw[i]) begin
            if(act_cfg.axi_agent_sw[i] == dv_utils_pkg::ON) begin
                m_axi_agent[i] = axi_agent::type_id::create($sformatf("%s", i), this);
                m_axi_agent[i].cfg = act_cfg.m_axi_agent_cfg[i];
                agt_chk_fifo[i] = new($sformatf("m_agt_chk_fifo-%0d-%0s", agent_num, i), this);
                `uvm_info(get_type_name(), $sformatf("create axi vip %s, work mode is %s", i, m_axi_agent[i].cfg.work_mode.name()), UVM_NONE);
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
