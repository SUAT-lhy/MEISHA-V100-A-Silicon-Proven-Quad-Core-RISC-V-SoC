`define tc_name chiplink_base_test
`define tc_name_cfg chiplink_base_test_cfg

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
    // // create tlul_base agent config obj
    // m_tlul_base_agent_cfg = tlul_base_agent_cfg::type_id::create("m_tlul_base_agent_cfg");
    // // set num_interrupts & num_alerts which will be used to create coverage and more
    // num_interrupts = ral.intr_state.get_n_used_bits();
    // // only support 1 outstanding TL item
    // m_tl_agent_cfg.max_outstanding_req = 1;
    foreach(this.tlul_agent_sw[i]) begin
        this.tlul_agent_sw[i] = dv_utils_pkg::ON;
        if(uvm_is_match("*_mst*", i)) begin
            this.tlul_agent_work_mode[i] = dv_utils_pkg::MASTER; 
        end
        else if(uvm_is_match("*_slv*", i)) begin
            this.tlul_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
        end
        else begin
            this.tlul_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
        end
        `uvm_info(get_type_name(), $sformatf("set_vip_agent_work_mode for inst_path %s, work_mode %s", i, this.tlul_agent_work_mode[i].name()), UVM_DEBUG);
        //this.m_tlul_agent_cfg[i].if_mode = dv_utils_pkg::Host;  // donnot need add in here
    end
    foreach(this.axi_agent_sw[i]) begin
        this.axi_agent_sw[i] = dv_utils_pkg::ON;
        if(uvm_is_match("*mig*master_mem_0_mst*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::SLAVE;
        end
        else if(uvm_is_match("*mig*slave_0_slv*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::MASTER;
        end
		else if(uvm_is_match("*vc707axi_to_pcie_x1*m_axi_slv*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
        end
		else if(uvm_is_match("*vc707axi_to_pcie_x1*s_axi_mst*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
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
        begin : axi_write_read_test
            axi_agent_pkg::axi_read_seq rd_seq;
            axi_agent_pkg::axi_write_seq wr_seq;
            wr_seq = new("wr_seq");
            rd_seq = new("rd_seq");
            begin
                assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.toaxi4.reset", 0));
                assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.toaxi4.clock", 0));
                assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.yank.auto_out_b_valid", 0));
                assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.yank.auto_out_r_valid", 0));
                assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.yank.reset", 0));  // avoid monitor fatal errorm because vip force
            end
            fork
                begin
                    // test addr 32'h1000_0000 - 32'he000_0000
                    wr_seq.base_addr = 32'h1000_0000;
                    wr_seq.incr_addr = 32'h100_0000;
                    wr_seq.no_of_trans = 'h100 - 'h30;
                    wr_seq.max_burst_size = 3;
                    wr_seq.start(env.virtual_sequencer.match_sqr("axi", "*mig*slave_0_slv*wsqr"));
                end
                begin
                    rd_seq.base_addr = 32'h1000_0000;
                    rd_seq.incr_addr = 32'h100_0000;
                    rd_seq.no_of_trans = 'h100 - 'h30;
                    rd_seq.max_burst_size = 3;
                    // wait write complete
                    #1000ns;
                    rd_seq.start(env.virtual_sequencer.match_sqr("axi", "*mig*slave_0_slv*rsqr"));
                end
            join
            // judge data is compare ok
            foreach(rd_seq.trans_q[i]) begin
                foreach(wr_seq.trans_q[i].data[j]) begin
                    foreach(wr_seq.trans_q[i].data[j][k]) begin
                        if(wr_seq.trans_q[i].wstrb[j][k]) begin
                            if(wr_seq.trans_q[i].data[j][k] != rd_seq.trans_q[i].data[j][k]) begin  // donnot check because vip is not complete
                                `uvm_error(get_full_name(), $sformatf("write_read check data 'h%0h != 'h%0h, addr = 'h%0h - 'h%0h", wr_seq.trans_q[i].data[j][k], rd_seq.trans_q[i].data[j][k], wr_seq.trans_q[i].addr, rd_seq.trans_q[i].addr));
                            end
                        end
                    end
                end
            end
        end
        /*
        begin
            tl_agent_pkg::tl_host_single_seq seq;
            seq = new("seq");
            seq.control_addr_alignment = 1;
            seq.control_rand_source = 1;
            seq.control_rand_size = 1;
            seq.override_a_source_val = 1;
            seq.overridden_a_source_val = 2;
            `DV_CHECK_RANDOMIZE_WITH_FATAL(seq,
                size             == 2;
                mask             == 'hf;
                addr == 38'h0000_0000;
                source == 2;
            )
            repeat(1000) begin
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                seq.addr += 38'h100_0000;
            end
        end
        
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
