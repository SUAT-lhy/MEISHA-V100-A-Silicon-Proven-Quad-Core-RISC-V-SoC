`define tc_name uart_base_test
`define tc_name_cfg uart_base_test_cfg

class `tc_name_cfg extends tlul_base_test_cfg;

    `uvm_object_utils(`tc_name_cfg)

    `uvm_object_new

  virtual function void initialize(bit [TL_AW-1:0] csr_base_addr = '1);
    //super.initialize(csr_base_addr);  // need override tlul_base_test config
    has_devmode = 0;
    en_devmode = 0;
    // list_of_alerts = tlul_base_env_pkg::LIST_OF_ALERTS;
    // initialize
    ral_model_names = {}; // 清空ral_model_names 不进行创建寄存器模型相关组件及相关检查
    is_initialized = 1'b1;
    foreach(this.tlul_agent_sw[i]) begin
        this.tlul_agent_sw[i] = dv_utils_pkg::ON;
        if(uvm_is_match("*_mst*", i)) begin
            this.tlul_agent_work_mode[i] = dv_utils_pkg::MASTER; 
        end
        else if(uvm_is_match("*chipLinkConverter*tl_slv*", i)) begin
			this.tlul_agent_sw[i] = dv_utils_pkg::OFF;
        end
        else if(uvm_is_match("*_slv*", i)) begin
            this.tlul_agent_work_mode[i] = dv_utils_pkg::SLAVE;
        end
        else begin
            this.tlul_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
        end
        `uvm_info(get_type_name(), $sformatf("set_vip_agent_work_mode for inst_path %s, work_mode %s", i, this.tlul_agent_work_mode[i].name()), UVM_DEBUG);
        //this.m_tlul_agent_cfg[i].if_mode = dv_utils_pkg::Host;  // donnot need add in here
    end
    `uvm_info(get_type_name(), $sformatf("this cfg is :\n%0s", this.sprint()), UVM_MEDIUM);
  endfunction

  function void pre_randomize();
    super.pre_randomize();
    
  endfunction

  function void post_randomize();
    super.post_randomize();
    
  endfunction

endclass



class `tc_name extends tlul_base_test;

    tl_device_seq     device_seq[string];

    `uvm_component_utils(`tc_name)
    
    // Components
    function new(string name, uvm_component parent);
        super.new(name, parent);
        set_type_override_by_type(dv_lib_pkg::dv_base_env_cfg#(tlul_base_env_pkg::tlul_base_reg_block)::get_type(), `tc_name_cfg::get_type());
        set_type_override_by_type(tlul_base_env_cfg::get_type(), `tc_name_cfg::get_type());
        cfg = `tc_name_cfg::type_id::create("test_cfg", this);
        set_type_override_by_type(dv_base_scoreboard#(dv_base_reg_pkg::dv_base_reg_block,dv_base_env_cfg,dv_base_env_cov)::get_type(), tlul_base_scoreboard::get_type());
    endfunction //new()

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
    //  Function: end_of_elaboration_phase
    extern function void end_of_elaboration_phase(uvm_phase phase);
    
    //  Function: run_phase
    extern task run_phase(uvm_phase phase);
    
    //  Function: main_phase
    extern task main_phase(uvm_phase phase);
    

virtual task trigger_env_clk_rst();
    if (!uvm_config_db#(virtual clk_rst_if)::get(this, "", "clk_rst_vif", cfg.clk_rst_vif)) begin
        `uvm_fatal(get_full_name(), "failed to get clk_rst_vif from uvm_config_db")
    end
    cfg.clk_freq_mhz = dv_utils_pkg::ClkFreq1000Mhz;
    cfg.clk_rst_vif.set_freq_mhz(cfg.clk_freq_mhz);
    cfg.clk_rst_vif.set_active();
endtask




endclass //extends uvm_test

function void `tc_name::build_phase(uvm_phase phase);
    super.build_phase(phase);
    env.cfg = cfg;
endfunction: build_phase

function void `tc_name::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
endfunction: end_of_elaboration_phase


task `tc_name::run_phase(uvm_phase phase);
    
    super.run_phase(phase); // donnot run super class start seq

endtask

task `tc_name::main_phase(uvm_phase phase);
    //super.run_phase(phase);
    phase.raise_objection(this);
    foreach(env.virtual_sequencer.sqr_q[i]) begin
        foreach(env.virtual_sequencer.sqr_q[i][j]) begin
            `uvm_info(get_type_name(), $sformatf("check sequencer type %0s for port_name %0s", i, j), UVM_NONE)
        end
    end
    fork 
        begin
            tl_agent_pkg::tl_host_single_seq seq;
            seq = new("seq");
            `DV_CHECK_RANDOMIZE_FATAL(seq)
            seq.addr = 32'h6400_0000;
            seq.size = 2;
            seq.mask = 'hf;
            seq.control_addr_alignment = 1;
            seq.control_rand_source = 1;
            seq.override_a_source_val = 1;
            seq.overridden_a_source_val = 2;
            repeat(100) begin
                seq.source = 2;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                seq.addr += 32'h10;
            end
        end
        /*
        begin
            tl_agent_pkg::tl_host_single_seq seq;
            seq = new("seq");
            `DV_CHECK_RANDOMIZE_FATAL(seq)
            seq.addr = 32'h4000_0000;
            seq.size = 2;
            seq.mask = 'hf;
            seq.control_addr_alignment = 1;
            seq.control_rand_source = 1;
            seq.override_a_source_val = 1;
            seq.overridden_a_source_val = 2;
            repeat(100) begin
                seq.source = 2;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile_1-RocketTile*tl_mem_mst"));
                seq.addr += 32'h10;
            end
        end
        begin
            tl_agent_pkg::tl_host_single_seq seq;
            seq = new("seq");
            `DV_CHECK_RANDOMIZE_FATAL(seq)
            seq.addr = 32'h8000_0000;
            seq.size = 2;
            seq.mask = 'hf;
            seq.control_addr_alignment = 1;
            seq.control_rand_source = 1;
            seq.override_a_source_val = 1;
            seq.overridden_a_source_val = 2;
            repeat(100) begin
                seq.source = 2;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile_2-RocketTile*tl_mem_mst"));
                seq.addr += 32'h10;
            end
        end
        begin
            tl_agent_pkg::tl_host_single_seq seq;
            seq = new("seq");
            `DV_CHECK_RANDOMIZE_FATAL(seq)
            seq.addr = 32'ha000_0000;
            seq.size = 2;
            seq.mask = 'hf;
            seq.control_addr_alignment = 1;
            seq.control_rand_source = 1;
            seq.override_a_source_val = 1;
            seq.overridden_a_source_val = 2;
            repeat(100) begin
                seq.source = 2;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile_3-RocketTile*tl_mem_mst"));
                seq.addr += 32'h10;
            end
        end
        */
        //seq.start(env.virtual_sequencer.sqr_q["tlul"]["u_VC707BaseShell-topDesign-topMod-tile_3-RocketTile_bind_if_inst-tl_mem_mst-sqr"]);
    join
    #1000ns;
    phase.drop_objection(this);
endtask: main_phase



`undef tc_name
`undef tc_name_cfg
