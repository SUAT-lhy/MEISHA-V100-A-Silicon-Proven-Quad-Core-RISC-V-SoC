`define tc_name tlul_mst_2_slv_cross_test
`define tc_name_cfg tlul_mst_2_slv_cross_test_cfg

class `tc_name_cfg extends tlul_base_test_cfg;

    `uvm_object_utils(`tc_name_cfg)

    `uvm_object_new

  virtual function void initialize(bit [TL_AW-1:0] csr_base_addr = '1);
    has_devmode = 0;
    en_devmode = 0;
    // list_of_alerts = tlul_base_env_pkg::LIST_OF_ALERTS;
    // initialize
    ral_model_names = {}; // 清空ral_model_names 不进行创建寄存器模型相关组件及相关检查
    is_initialized = 1'b1;
    // super.initialize(csr_base_addr);
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
        else if(uvm_is_match("*chipLinkConverter*tl_slv*", i)) begin
            this.tlul_agent_work_mode[i] = dv_utils_pkg::SLAVE;
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
        if(uvm_is_match("*mig*chipLinkConverter*master_mem_0_mst*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::MASTER;
            // use in addr process after chiplink master port
            //assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.island.blackbox.chipLinkConverter.master_mem_0_awaddr[28]", 0));
            //assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.island.blackbox.chipLinkConverter.master_mem_0_araddr[28]", 0));  // because master port send base_addr is 32'h1000_0000, for match backdoor access
        end
        else if(uvm_is_match("*mig*chipLinkConverter*slave_0_slv*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::SLAVE;
        end
        else if(uvm_is_match("*U_nvdla_small*m_axi_mst*", i)) begin // for qspi
            this.axi_agent_work_mode[i] = dv_utils_pkg::MASTER;
        end
        else if(uvm_is_match("*u_axi_spi_slave*m_axi_mst*", i)) begin // for qspi
            this.axi_agent_work_mode[i] = dv_utils_pkg::MASTER;
        end
		else if(uvm_is_match("*vc707axi_to_pcie_x1*m_axi_slv*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::MASTER;
        end
		else if(uvm_is_match("*vc707axi_to_pcie_x1*s_axi_mst*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::SLAVE;
        end
        else if(uvm_is_match("*default_axi_slv", i)) begin
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
    // super.pre_randomize(); // donnot use this because donnot need force valid ready after d2d master bus
    

  endfunction

  function void post_randomize();
    super.post_randomize();
  endfunction

endclass


class `tc_name extends tlul_base_test;

    `uvm_component_utils(`tc_name)
    
    // Components
    function new(string name, uvm_component parent);
        super.new(name, parent);
        
        set_type_override_by_type(dv_base_scoreboard#(dv_base_reg_pkg::dv_base_reg_block,dv_base_env_cfg,dv_base_env_cov)::get_type(), tlul_base_scoreboard::get_type());
		set_type_override_by_type(tlul_base_env_cfg::get_type(), `tc_name_cfg::get_type());
        cfg = `tc_name_cfg::type_id::create("test_cfg", this);
        
        this.mst_info_q["mig*chipLinkConverter*master_mem_0_mst"] = new("mig*chipLinkConverter*master_mem_0_mst");
        this.mst_info_q["u_axi_spi_slave*m_axi_mst"] = new("u_axi_spi_slave*m_axi_mst");
        

        this.mst_info_q["mig*chipLinkConverter*master_mem_0_mst"].port_type = "axi";
        this.mst_info_q["u_axi_spi_slave*m_axi_mst"].port_type = "axi";


        foreach(this.slv_info_q[i]) begin
            if( 0
               || uvm_is_match("*clint*", i.tolower())
               ) begin
                continue;
            end
            this.mst_info_q["mig*chipLinkConverter*master_mem_0_mst"].create_info(i);
            this.mst_info_q["u_axi_spi_slave*m_axi_mst"].create_info(i);
        end
        
        this.mst_info_q["nvdla_small*m_axi_mst"] = new("nvdla_small*m_axi_mst");
        this.mst_info_q["nvdla_small*m_axi_mst"].port_type = "axi";
        foreach(this.slv_info_q[i]) begin
            if(
                0
              || (uvm_is_match("*ON_CHIP_SRAM*", i))
              || (uvm_is_match("*soc_lsys*", i))
              || (uvm_is_match("*spi_1*", i))
              || (uvm_is_match("*serial*", i))
              || (uvm_is_match("*spi_0*", i))
              || (uvm_is_match("*gpio*", i))
              || (uvm_is_match("*DDR_CHIPLINK*", i))
            ) begin
                this.mst_info_q["nvdla_small*m_axi_mst"].create_info(i);
            end
        end


    endfunction //new()

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
    //  Function: end_of_elaboration_phase
    extern function void end_of_elaboration_phase(uvm_phase phase);
    
    //  Function: run_phase
    extern task run_phase(uvm_phase phase);
    
    //  Function: main_phase
    extern task main_phase(uvm_phase phase);
     
    //  Function: post_main_phase
    extern task post_main_phase(uvm_phase phase);   


endclass //extends uvm_test

function void `tc_name::build_phase(uvm_phase phase);
    super.build_phase(phase);
    env.cfg = cfg;
endfunction: build_phase

function void `tc_name::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
endfunction: end_of_elaboration_phase


task `tc_name::run_phase(uvm_phase phase);
    
    super.run_phase(phase); // donnot run super class start seq
    
    //phase.drop_objection(this);
endtask

task `tc_name::main_phase(uvm_phase phase);
    //super.run_phase(phase);
    phase.raise_objection(this);
    
    assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.d2d_sub.U_SOC_LSYS.mig_input_takeover_en_reg", 1'b0));
    // ddr: 100M 16.6M 250M 500M
    assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.d2d_sub.U_SOC_LSYS.use_which_clk", {5'h2, 5'h4, 5'h1, 5'h1}));
    assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.corePLL.u0.pd", 1'h0));

    foreach(env.virtual_sequencer.sqr_q[i]) begin
        foreach(env.virtual_sequencer.sqr_q[i][j]) begin
            `uvm_info(get_type_name(), $sformatf("check sequencer type %0s for port_name %0s", i, j), UVM_NONE)
        end
    end
    // wait all bus rst, mig and chiplink maybe reset before bus and core
    #20000ns;
    // wait sdram active
    //#400000ns;
    foreach(this.mst_info_q[i]) begin
        foreach(this.mst_info_q[i].slv_name_q[j]) begin
            if(this.mst_info_q[i].port_type == "tl") begin
                tl_write_read_test(i, this.mst_info_q[i].slv_name_q[j]);
            end
            else if(this.mst_info_q[i].port_type == "axi") begin
                axi_write_read_test(i, this.mst_info_q[i].slv_name_q[j]);
            end
            else begin
                `uvm_error(get_type_name(), $sformatf("port_type %0s undefine, for port_name %0s", this.mst_info_q[i].port_type, i))
            end
        end
    end

    #100ns;
    `uvm_info(get_type_name(), $sformatf("main_phase end"), UVM_NONE)
    phase.drop_objection(this);
endtask: main_phase

task `tc_name::post_main_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("post_main_phase end"), UVM_NONE)
endtask: post_main_phase


`undef tc_name
`undef tc_name_cfg
