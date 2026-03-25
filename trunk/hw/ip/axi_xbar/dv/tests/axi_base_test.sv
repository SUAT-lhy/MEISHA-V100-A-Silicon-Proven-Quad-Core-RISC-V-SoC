`define tc_name axi_base_test
`define tc_name_cfg axi_base_test_cfg

class `tc_name_cfg extends axi_base_env_cfg;

    `uvm_object_utils(`tc_name_cfg)

    `uvm_object_new

  virtual function void initialize(bit [TL_AW-1:0] csr_base_addr = '1);
    has_devmode = 0;
    en_devmode = 0;
    // list_of_alerts = axi_base_env_pkg::LIST_OF_ALERTS;
    // initialize
    ral_model_names = {}; // 清空ral_model_names 不进行创建寄存器模型相关组件及相关检查
    is_initialized = 1'b1;
    // super.initialize(csr_base_addr);
    // // create axi_base agent config obj
    // m_axi_base_agent_cfg = axi_base_agent_cfg::type_id::create("m_axi_base_agent_cfg");
    // // set num_interrupts & num_alerts which will be used to create coverage and more
    // num_interrupts = ral.intr_state.get_n_used_bits();
    // // only support 1 outstanding TL item
    // m_tl_agent_cfg.max_outstanding_req = 1;
    foreach(this.axi_agent_sw[i]) begin
        this.axi_agent_sw[i] = dv_utils_pkg::ON;
        if(uvm_is_match("*_axi_mst", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::MASTER; 
        end
        else if(uvm_is_match("*default_axi_slv", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
        end
        else if(uvm_is_match("*_axi_slv", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::SLAVE;
        end
        else begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
        end
        `uvm_info(get_type_name(), $sformatf("set_vip_agent_work_mode for inst_path %s, work_mode %s", i, this.axi_agent_work_mode[i].name()), UVM_DEBUG);
        //this.m_axi_agent_cfg[i].if_mode = dv_utils_pkg::Host;  // donnot need add in here
    end
    `uvm_info(get_type_name(), $sformatf("this cfg is :\n%0s", this.sprint()), UVM_MEDIUM);
  endfunction

  function void pre_randomize();
    super.pre_randomize();
    
  endfunction

  function void post_randomize();
    super.post_randomize();
    foreach(this.axi_agent_sw[i]) begin
        if(this.axi_agent_sw[i] == dv_utils_pkg::ON) begin
            // this.m_axi_agent_cfg[i].max_outstanding_req = -1;  // do not check outstanding
            // if(uvm_is_match("*tile*RocketTile*_mst*", i)) begin
            //     this.m_axi_agent_cfg[i].rsp_data_width = 64;  
            // end
            // else if(uvm_is_match("*maskROM*_slv*", i)) begin
            //     this.m_axi_agent_cfg[i].rsp_data_width = 32;  
            // end
            // else if(uvm_is_match("*XilinxVC707MIG*tl_mem_slv*", i)) begin
            //     this.m_axi_agent_cfg[i].rsp_data_width = 64;
                
            // end
            // else begin
            //     `uvm_error(get_type_name(), $sformatf("cannot find the axi agent %s", i));
            // end
            //this.m_axi_agent_cfg[i].if_mode = dv_utils_pkg::Host;  // donnot need add in here
        end
    end
  endfunction

endclass


class `tc_name extends cip_base_pkg::cip_base_test #(.ENV_T(axi_base_env), .CFG_T(axi_base_env_cfg));
    `uvm_component_utils(`tc_name)
    
    // Components
    axi_write_seq wr_seq;
    axi_read_seq rd_seq;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        set_type_override_by_type(dv_lib_pkg::dv_base_env_cfg#(axi_base_env_pkg::axi_base_reg_block)::get_type(), `tc_name_cfg::get_type());
        set_type_override_by_type(axi_base_env_cfg#(axi_base_env_pkg::axi_base_reg_block)::get_type(), `tc_name_cfg::get_type());
        cfg = `tc_name_cfg::type_id::create("test_cfg", this);
        set_type_override_by_type(dv_base_scoreboard#(dv_base_reg_pkg::dv_base_reg_block,dv_base_env_cfg,dv_base_env_cov)::get_type(), axi_base_scoreboard::get_type());
    endfunction //new()

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
    //  Function: end_of_elaboration_phase
    extern function void end_of_elaboration_phase(uvm_phase phase);
    
    //  Function: run_phase
    extern task run_phase(uvm_phase phase);

    
    virtual task trigger_env_clk_rst();
        if (!uvm_config_db#(virtual clk_rst_if)::get(this, "", "clk_rst_vif", cfg.clk_rst_vif)) begin
            `uvm_fatal(get_full_name(), "failed to get clk_rst_vif from uvm_config_db")
        end
        cfg.clk_freq_mhz = dv_utils_pkg::ClkFreq1000Mhz;
        cfg.clk_rst_vif.set_freq_mhz(cfg.clk_freq_mhz);
        cfg.clk_rst_vif.set_active();
    endtask


    virtual task wait_clk_rst();
        #400ns; // wait soc rst_n deassert
    endtask

    
endclass //`tc_name extends uvm_test

function void `tc_name::build_phase(uvm_phase phase);
    super.build_phase(phase);
    wr_seq = new("wr_seq");
    rd_seq = new("rd_seq");
    env.cfg = cfg;
endfunction: build_phase

function void `tc_name::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
endfunction: end_of_elaboration_phase

task `tc_name::run_phase(uvm_phase phase);
    //super.run_phase(phase);
    phase.raise_objection(this);
    fork
        wr_seq.start(env.virtual_sequencer.match_sqr("axi", "amba_axi_m2s3*m0_axi_mst*wsqr"));
        begin
            rd_seq.start(env.virtual_sequencer.match_sqr("axi", "amba_axi_m2s3*m0_axi_mst*rsqr"));
        end
    join
    #1000ns;
    phase.drop_objection(this);
endtask: run_phase


// ****************************************************************************************
//                          Directed Test Cases
// ****************************************************************************************
class axi_write_test extends `tc_name;
    `uvm_component_utils(axi_write_test)
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);  
    endfunction: build_phase

    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
    endfunction: end_of_elaboration_phase
    
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        wr_seq.start(env.m_axi_agent["a"].w_seqr);
        phase.drop_objection(this);
    endtask: run_phase
endclass //write_test extends `tc_name

class axi_read_test extends `tc_name;
    `uvm_component_utils(axi_read_test)
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);  
    endfunction: build_phase

    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
    endfunction: end_of_elaboration_phase
    
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        wr_seq.start(env.m_axi_agent["a"].w_seqr);
        rd_seq.start(env.m_axi_agent["a"].r_seqr);
        phase.drop_objection(this);
    endtask: run_phase
endclass //read_test extends `tc_name

class axi_fixed_test extends `tc_name;
    `uvm_component_utils(axi_fixed_test)
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        
        wr_seq = new("wr_seq");
        rd_seq = new("rd_seq");
    endfunction: build_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
    endtask: run_phase
endclass //axi_fixed_test extends `tc_name

class axi_incr_test extends `tc_name;
    `uvm_component_utils(axi_incr_test)
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        
        wr_seq = new("wr_seq");
        rd_seq = new("rd_seq");
    endfunction: build_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
    endtask: run_phase
endclass //axi_incr_test extends `tc_name

class axi_wrap_test extends `tc_name;
    `uvm_component_utils(axi_wrap_test)
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        
        wr_seq = new("wr_seq");
        rd_seq = new("rd_seq");
    endfunction: build_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
    endtask: run_phase
endclass //axi_wrap_test extends `tc_name
