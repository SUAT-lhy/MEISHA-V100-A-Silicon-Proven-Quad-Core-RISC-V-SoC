`define tc_name ddr_c2c_base_test
`define tc_name_cfg ddr_c2c_base_test_cfg


class `tc_name_cfg extends soft_base_test_cfg;

    `uvm_object_utils_begin(`tc_name_cfg)
		//`uvm_field_int(ping_delay_max,  UVM_DEFAULT)
	`uvm_object_utils_end

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
        
        if(uvm_is_match("*tile*RocketTile*_mst*", i)) begin
            this.tlul_agent_sw[i] = dv_utils_pkg::ON;
            this.tlul_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
			//this.m_tlul_agent_cfg[i].en_check = dv_utils_pkg::OFF;  // disable core monitor for cmd match resp, because bootrom TLFragmeter_3
        end
		// else if(uvm_is_match("*maskROM*_slv*", i)) begin
        //     this.tlul_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
        // end
        // else if(uvm_is_match("*XilinxVC707MIG*tl_mem_slv*", i)) begin
        //     this.tlul_agent_work_mode[i] = dv_utils_pkg::SLAVE;
        // end
        else if(uvm_is_match("*chipLinkConverter*tl_slv*", i)) begin
			this.tlul_agent_sw[i] = dv_utils_pkg::OFF;
        end
        else begin
			this.tlul_agent_sw[i] = dv_utils_pkg::ON;
            this.tlul_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
        end
        `uvm_info(get_type_name(), $sformatf("set_vip_agent_work_mode for inst_path %s, work_mode %s", i, this.tlul_agent_work_mode[i].name()), UVM_DEBUG);
        //this.m_tlul_agent_cfg[i].if_mode = dv_utils_pkg::Host;  // donnot need add in here
    end
	foreach(this.axi_agent_sw[i]) begin
        this.axi_agent_sw[i] = dv_utils_pkg::ON;
        if(uvm_is_match("*u_fpga_ddr_chiplink*master_mem_0_mst*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::SLAVE;
            assert(uvm_hdl_force("tb.ddr_external_loopback_en", 0));
            //assert(uvm_hdl_force("tb.u_fpga_ddr_chiplink.CHIPLINK_PREFIX_ChipLinkMaster_m_bind_if_inst.axi_bind_port_mst.u_intf.AWADDR[31:28]", 4'b0));               // for netlist bug, actual is ok
            //assert(uvm_hdl_force("tb.u_fpga_ddr_chiplink.CHIPLINK_PREFIX_ChipLinkMaster_m_bind_if_inst.axi_bind_port_mst.u_intf.ARADDR[31:28]", 4'b0));
        end
        else if(uvm_is_match("*mig*master_mem_0_mst*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
            // use in addr process after chiplink master port
            // assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.island.blackbox.chipLinkConverter.master_mem_0_awaddr[28]", 0));
            // assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.island.blackbox.chipLinkConverter.master_mem_0_araddr[28]", 0));  // because master port send base_addr is 32'h1000_0000, for match backdoor access
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



class `tc_name extends soft_base_test;
    `uvm_component_utils(`tc_name)
    
    // Components
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
        set_type_override_by_type(dv_base_scoreboard#(dv_base_reg_pkg::dv_base_reg_block,dv_base_env_cfg,dv_base_env_cov)::get_type(), tlul_base_scoreboard::get_type());
		set_type_override_by_type(tlul_base_env_cfg::get_type(), `tc_name_cfg::get_type());
        cfg = `tc_name_cfg::type_id::create("test_cfg", this);
    endfunction //new()

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
    //  Function: end_of_elaboration_phase
    extern function void end_of_elaboration_phase(uvm_phase phase);
    
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


endclass //`tc_name extends uvm_test

function void `tc_name::build_phase(uvm_phase phase);
    super.build_phase(phase);    
    env.cfg = cfg;
    this.DDR_MEM_REGEX_NAME = "*fpga_ddr_chiplink*bind_if_inst-master_mem_0_mst";
    this.DDR_MEM_BASE_ADDR = 32'h1000_0000;
endfunction: build_phase

function void `tc_name::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
endfunction: end_of_elaboration_phase


task `tc_name::main_phase(uvm_phase phase);
    //super.main_phase(phase);
    phase.raise_objection(this);
    foreach(env.virtual_sequencer.sqr_q[i]) begin
        foreach(env.virtual_sequencer.sqr_q[i][j]) begin
            `uvm_info(get_type_name(), $sformatf("check sequencer type %0s for port_name %0s", i, j), UVM_NONE)
        end
    end
    fork 
        #10ms;  // wait core done
        //seq.start(env.virtual_sequencer.sqr_q["tlul"]["u_VC707BaseShell-topDesign-topMod-tile_3-RocketTile_bind_if_inst-tl_mem_mst-sqr"]);
    join
    #1000ns;
    phase.drop_objection(this);
endtask: main_phase


`undef tc_name
`undef tc_name_cfg
