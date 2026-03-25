`define tc_name tlul_base_test
`define tc_name_cfg tlul_base_test_cfg

class `tc_name_cfg extends tlul_base_env_cfg;

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
        else if(uvm_is_match("*ROM*_slv*", i)) begin
            //this.tlul_agent_work_mode[i] = dv_utils_pkg::SLAVE;
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
            //assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.island.blackbox.chipLinkConverter.master_mem_0_araddr[28]", 0));  // because master port send base_addr is 325000_0000, for match backdoor access
        end
        else if(uvm_is_match("*mig*chipLinkConverter*slave_0_slv*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::SLAVE;
        end
        else if(uvm_is_match("*U_nvdla_small*m_axi_mst*", i)) begin // for qspi
            this.axi_agent_work_mode[i] = dv_utils_pkg::MASTER;
        end
        else if(uvm_is_match("*u_axi_spi_slave*m_axi_mst*", i)) begin // for qspi
            this.axi_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
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
    super.pre_randomize();
    
    // switch to default donot release core reset
    assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.DEBUG_MODE_SEL", 1'b1)); 

  endfunction

  function void post_randomize();
    super.post_randomize();
    foreach(this.tlul_agent_sw[i]) begin
        if(this.tlul_agent_sw[i] == dv_utils_pkg::ON) begin
            this.m_tlul_agent_cfg[i].max_outstanding_req = -1;  // do not check outstanding
            if(uvm_is_match("*tile*RocketTile*_mst*", i)) begin
                this.m_tlul_agent_cfg[i].rsp_data_width = 64;  
            end
            else if(uvm_is_match("*maskROM*_slv*", i)) begin
                this.m_tlul_agent_cfg[i].rsp_data_width = 32;  
            end
            else if(uvm_is_match("*XilinxVC707MIG*tl_mem_slv*", i)) begin
                this.m_tlul_agent_cfg[i].rsp_data_width = 64;
            end
            else if(uvm_is_match("*chipLinkConverter*tl_slv*", i)) begin
                this.m_tlul_agent_cfg[i].rsp_data_width = 64;
            end
            else if(uvm_is_match("*CHIPLINK_PREFIX_ChipLinkMaster*tl_slv*", i)) begin
                this.m_tlul_agent_cfg[i].rsp_data_width = 64;
            end
            else begin
                `uvm_fatal(get_type_name(), $sformatf("cannot find the tlul agent %s", i));
            end
            //this.m_tlul_agent_cfg[i].if_mode = dv_utils_pkg::Host;  // donnot need add in here
        end
    end
  endfunction

endclass


class `tc_name extends cip_base_pkg::cip_base_test #(.ENV_T(tlul_base_env), .CFG_T(tlul_base_env_cfg));

    tl_device_seq     device_seq[string];

    master_info mst_info_q[string];
    
    slave_info slv_info_q[string];

    mem_model_pkg::mem_model_base mem[string];
    string DDR_MEM_REGEX_NAME;
    bit [31:0] DDR_MEM_BASE_ADDR;

    `uvm_component_utils(`tc_name)
    
    // Components
    function new(string name, uvm_component parent);
        super.new(name, parent);
        this.DDR_MEM_REGEX_NAME = "topDesign*CHIPLINK_PREFIX_ChipLinkMaster*bind_if_inst-master_mem_0_mst";
        this.DDR_MEM_BASE_ADDR = 0;
        set_type_override_by_type(dv_lib_pkg::dv_base_env_cfg#(tlul_base_env_pkg::tlul_base_reg_block)::get_type(), `tc_name_cfg::get_type());
        set_type_override_by_type(tlul_base_env_cfg::get_type(), `tc_name_cfg::get_type());
        cfg = `tc_name_cfg::type_id::create("test_cfg", this);
        set_type_override_by_type(dv_base_scoreboard#(dv_base_reg_pkg::dv_base_reg_block,dv_base_env_cfg,dv_base_env_cov)::get_type(), tlul_base_scoreboard::get_type());
        

        // init memory map
        //  Base  | Size（B） | Attr.  | Description  | Notes
        // 0x0000_0000 | 4K |  | debug-controller | 
        // 0x0000_3000 | 4K |  | default-device | 
        // 0x0001_0000 | 8K | R X | Mask ROM (32 KiB) | 
        // 0x0200_0000 | 64K | RW A | CLINT | 
        // 0x0C00_0000 | 4M |  | PLIC | 
        // 0x20_0000_0000 | 512M |  | pci及pcie空间 | 
        // 0x6400_0000 | 4K |  | serial | 
        // 0x6400_1000 | 4K |  | spi_0 | 
        // 0x6400_2000 | 4K |  | gpio | 
        // 0x8000_0000 | 1G |  | DDR（CHIPLINK） | 
        // 0x5000_0000 | 512K |  | on chip sram | 
        // 0x5100_0000 | 4K |  | soc_lsys | 
        // 0x5100_1000 | 4K |  | spi_1 | 
        this.slv_info_q["debug-controller"] = new("debug-controller");
        this.slv_info_q["default-device"] = new("default-device");
        this.slv_info_q["MaskRom"] = new("MaskRom");
        this.slv_info_q["CLINT"] = new("CLINT");
        this.slv_info_q["PLIC"] = new("PLIC");
        this.slv_info_q["pci_host"] = new("pci_host");
        this.slv_info_q["serial"] = new("serial");
        this.slv_info_q["spi_0"] = new("spi_0");
        this.slv_info_q["gpio"] = new("gpio");
        this.slv_info_q["DDR_CHIPLINK_0"] = new("DDR_CHIPLINK_0");
        //this.slv_info_q["DDR_CHIPLINK_1"] = new("DDR_CHIPLINK_1");
        this.slv_info_q["ON_CHIP_SRAM"] = new("ON_CHIP_SRAM");
        this.slv_info_q["soc_lsys"] = new("soc_lsys");
        this.slv_info_q["spi_1"] = new("spi_1");
        this.slv_info_q["nvdla_small*apb_slv"] = new("nvdla_small*apb_slv");


        this.slv_info_q["debug-controller"].create_info(64'h0000_0000, 64'h0000_1000);
        this.slv_info_q["default-device"].create_info(64'h0000_3000, 64'h0000_4000);
        this.slv_info_q["MaskRom"].create_info(64'h0001_0000, 64'h0001_2000); // donnot check, write maybe timeout
        this.slv_info_q["CLINT"].create_info(64'h0200_0000, 64'h0201_0000);
        this.slv_info_q["PLIC"].create_info(64'h0C00_0000, 64'h0C40_0000);

        for(bit [63:0] i = 64'h5000_0000; i < 64'h6000_0000; i = i + 64'h0100_0000) begin
            this.slv_info_q["pci_host"].create_info(i, i + 64'h0100_0000);
        end
        this.slv_info_q["ON_CHIP_SRAM"].create_info(64'h5000_0000, 64'h0_5100_0000);
        this.slv_info_q["soc_lsys"].create_info(64'h0_5100_0000, 64'h0_5200_0000);
        this.slv_info_q["spi_1"].create_info(64'h0_5200_0000, 64'h0_5300_0000);
        this.slv_info_q["nvdla_small*apb_slv"].create_info(64'h0_5300_0000, 64'h0_5400_0000);

        this.slv_info_q["serial"].create_info(64'h6400_0000, 64'h6400_1000);
        this.slv_info_q["spi_0"].create_info(64'h6400_1000, 64'h6400_2000);
        this.slv_info_q["gpio"].create_info(64'h6400_2000, 64'h6400_3000);

        for(bit [63:0] i = 64'h800_0000; i < 64'hC000_0000; i = i + 64'h0_0100_0000) begin
            this.slv_info_q["DDR_CHIPLINK_0"].create_info(i, i + 64'h0_0100_0000);
        end

        //this.slv_info_q["DDR_CHIPLINK_1"].create_info(64'hC000_0000, 645_0000_0000);
        //for(bit [63:0] i = 64'h20_0000_0000; i < 64'h20_0800_0000; i = i + 64'h0_0100_0000) begin
            
        //end

        // this.slv_info_q["soc_lsys"].create_info(64'h20_0000_0000, 64'h20_0000_0000);
        // this.slv_info_q["spi_1"].create_info(64'h20_0000_0000, 64'h20_0000_0000);

        this.mst_info_q["tile-RocketTile*tl_mem_mst"] = new("tile-RocketTile*tl_mem_mst");
        this.mst_info_q["tile_1-RocketTile*tl_mem_mst"] = new("tile_1-RocketTile*tl_mem_mst");
        this.mst_info_q["tile_2-RocketTile*tl_mem_mst"] = new("tile_2-RocketTile*tl_mem_mst");
        this.mst_info_q["tile_3-RocketTile*tl_mem_mst"] = new("tile_3-RocketTile*tl_mem_mst");
        this.mst_info_q["nvdla_small*m_axi_mst"] = new("nvdla_small*m_axi_mst");
        this.mst_info_q["nvdla_small*m_axi_mst"].port_type = "axi";

        foreach(this.slv_info_q[i]) begin
            this.mst_info_q["tile-RocketTile*tl_mem_mst"].create_info(i);
            this.mst_info_q["tile_1-RocketTile*tl_mem_mst"].create_info(i);
            this.mst_info_q["tile_2-RocketTile*tl_mem_mst"].create_info(i);
            this.mst_info_q["tile_3-RocketTile*tl_mem_mst"].create_info(i);
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

    extern task start_slave_seq();

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
    //  Function: end_of_elaboration_phase
    extern function void end_of_elaboration_phase(uvm_phase phase);
    
    //  Function: run_phase
    extern task run_phase(uvm_phase phase);
    
    //  Function: main_phase
    extern task main_phase(uvm_phase phase);

    extern task pre_reset_phase(uvm_phase phase);
     
    //  Function: pre_main_phase
    extern task pre_main_phase(uvm_phase phase);   
    //  Function: post_main_phase
    extern task post_main_phase(uvm_phase phase);   

    virtual task trigger_env_clk_rst();
        if (!uvm_config_db#(virtual clk_rst_if)::get(this, "", "clk_rst_vif", cfg.clk_rst_vif)) begin
            `uvm_fatal(get_full_name(), "failed to get clk_rst_vif from uvm_config_db")
        end
        cfg.clk_freq_mhz = dv_utils_pkg::ClkFreq1000Mhz;
        cfg.clk_rst_vif.set_freq_mhz(cfg.clk_freq_mhz);
        cfg.clk_rst_vif.set_active();
    endtask


    virtual task wait_clk_rst();
        logic slice;
        #150000ns; // wait tile rst_n deassert
        `ifdef POSTSIM_EN
            #1000000ns;  // wait tile reset is release
            assert(uvm_hdl_read("tb.u_MEISHAV100_TOP.topDesign.topMod.tile.reset", slice));
            if(slice !== 1'b0) begin
                `uvm_error(get_type_name(), "Core release reset is not complete, access memory maybe hang up")
            end
        `endif
    endtask

    virtual task axi_write_read_test(string port_name, string slv_port_name); 
        begin
            bit [37:0] access_addr;
            axi_agent_pkg::axi_read_seq rd_seq;
            axi_agent_pkg::axi_write_seq wr_seq;
            uvm_sequencer_base mst_wr_sqr = env.virtual_sequencer.match_sqr("axi", {"*", port_name, "*wsqr"}); 
            uvm_sequencer_base mst_rd_sqr = env.virtual_sequencer.match_sqr("axi", {"*", port_name, "*rsqr"}); 
            wr_seq = new("wr_seq");
            rd_seq = new("rd_seq");
            `uvm_info(get_type_name(), $sformatf("%s access port_name %0s", port_name, slv_port_name), UVM_NONE)
            
                foreach(this.slv_info_q[slv_port_name].start_addr[j]) begin
                    // modify addr
                    //assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.d2d_sub.U_SOC_IRAM_LSYS_WRAPPER.u_soc_iram_lsys.qspi_axi_master_addr_msb_16[3:0]", this.slv_info_q[slv_port_name].start_addr[j][31:28])); 
                    assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.d2d_sub.U_SOC_LSYS.chiplink_master_addr_msb_16[15]", 1'b1)); 
                    assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.d2d_sub.U_SOC_LSYS.chiplink_master_addr_msb_16[3:0]", this.slv_info_q[slv_port_name].start_addr[j][31:28])); 
                    `uvm_info(get_type_name(), $sformatf("%s begin access ['h%0h:'h%0h] for port_name %0s", port_name, this.slv_info_q[slv_port_name].start_addr[j], this.slv_info_q[slv_port_name].end_addr[j], this.slv_info_q[slv_port_name].slv_name), UVM_NONE)

                    access_addr = this.slv_info_q[slv_port_name].start_addr[j];
                    if(!uvm_is_match("*rom*", slv_port_name.tolower())) begin
                        wr_seq.base_addr = access_addr;
                        wr_seq.incr_addr = 32'h000_1000;
                        wr_seq.no_of_trans = 1;
                        wr_seq.max_burst_size = 3;
                        wr_seq.start(mst_wr_sqr);
                    end
                    begin
                        rd_seq.base_addr = access_addr;
                        rd_seq.incr_addr = 32'h000_1000;
                        rd_seq.no_of_trans = 1;
                        rd_seq.max_burst_size = 3;
                        rd_seq.start(mst_rd_sqr);
                    end
                    if(!uvm_is_match("*rom*", slv_port_name.tolower())) begin
                    // judge data is compare ok
                    foreach(rd_seq.trans_q[i]) begin
                        foreach(wr_seq.trans_q[i].data[j]) begin
                            foreach(wr_seq.trans_q[i].data[j][k]) begin
                                if(wr_seq.trans_q[i].wstrb[j][k]) begin
                                    if(wr_seq.trans_q[i].data[j][k] != rd_seq.trans_q[i].data[j][k]) begin  // donnot check because vip is not complete
                                        //`uvm_error(get_full_name(), $sformatf("write_read check data 'h%0h != 'h%0h, addr = 'h%0h - 'h%0h", wr_seq.trans_q[i].data[j][k], rd_seq.trans_q[i].data[j][k], wr_seq.trans_q[i].addr, rd_seq.trans_q[i].addr));
                                    end
                                end
                            end
                        end
                    end
                    end
                    access_addr = this.slv_info_q[slv_port_name].end_addr[j] - 1;
                    access_addr[3:0] = 'b0;
                    if(!uvm_is_match("*rom*", slv_port_name.tolower())) begin
                        wr_seq.base_addr = access_addr;
                        wr_seq.incr_addr = 32'h000_1000;
                        wr_seq.no_of_trans = 1;
                        wr_seq.max_burst_size = 3;
                        wr_seq.start(mst_wr_sqr);
                    end
                    begin
                        rd_seq.base_addr = access_addr;
                        rd_seq.incr_addr = 32'h000_1000;
                        rd_seq.no_of_trans = 1;
                        rd_seq.max_burst_size = 3;
                        rd_seq.start(mst_rd_sqr);
                    end
                    if(!uvm_is_match("*rom*", slv_port_name.tolower())) begin
                    // judge data is compare ok
                    foreach(rd_seq.trans_q[i]) begin
                        foreach(wr_seq.trans_q[i].data[j]) begin
                            foreach(wr_seq.trans_q[i].data[j][k]) begin
                                if(wr_seq.trans_q[i].wstrb[j][k]) begin
                                    if(wr_seq.trans_q[i].data[j][k] != rd_seq.trans_q[i].data[j][k]) begin  // donnot check because vip is not complete
                                        //`uvm_error(get_full_name(), $sformatf("write_read check data 'h%0h != 'h%0h, addr = 'h%0h - 'h%0h", wr_seq.trans_q[i].data[j][k], rd_seq.trans_q[i].data[j][k], wr_seq.trans_q[i].addr, rd_seq.trans_q[i].addr));
                                    end
                                end
                            end
                        end
                    end
                    end
                end
                    
        end
    endtask

    virtual task tl_write_read_test(string port_name, string slv_port_name);
        begin // test all slave top and base addr
            tl_agent_pkg::tl_host_single_seq seq;
            bit [37:0] access_addr;
            uvm_sequencer_base mst_sqr = env.virtual_sequencer.match_sqr("tl", {"*", port_name, "*"}); 
            seq = new("seq");
            seq.control_addr_alignment = 1;
            seq.control_rand_source = 1;
            seq.control_rand_size = 1;
            seq.override_a_source_val = 1;
            seq.overridden_a_source_val = 2;
            `uvm_info(get_type_name(), $sformatf("%s access port_name %0s", port_name, slv_port_name), UVM_NONE)
                foreach(this.slv_info_q[slv_port_name].start_addr[j]) begin
                    `uvm_info(get_type_name(), $sformatf("%s begin access ['h%0h:'h%0h] for port_name %0s", port_name, this.slv_info_q[slv_port_name].start_addr[j], this.slv_info_q[slv_port_name].end_addr[j], this.slv_info_q[slv_port_name].slv_name), UVM_NONE)

                    access_addr = this.slv_info_q[slv_port_name].start_addr[j];
                    if(!uvm_is_match("*rom*", slv_port_name.tolower())) begin
                        `DV_CHECK_RANDOMIZE_WITH_FATAL(seq,
                            size             == 3;
                            mask             == 'hff;
                            addr == access_addr;
                            source == 2;
                            write == 1;
                        )
                        seq.start(mst_sqr);
                    end
                    `DV_CHECK_RANDOMIZE_WITH_FATAL(seq,
                        size             == 3;
                        mask             == 'hff;
                        addr == access_addr;
                        source == 2;
                        write == 0;
                    )
                    seq.start(mst_sqr);

                    access_addr = this.slv_info_q[slv_port_name].end_addr[j] - 1;
                    access_addr[3:0] = 'b0;
                    if(!uvm_is_match("*rom*", slv_port_name.tolower())) begin
                        `DV_CHECK_RANDOMIZE_WITH_FATAL(seq,
                            size             == 2;
                            mask             == 'hf;
                            addr == access_addr;
                            source == 2;
                            write == 1;
                        )
                        seq.start(mst_sqr);
                    end
                    `DV_CHECK_RANDOMIZE_WITH_FATAL(seq,
                        size             == 2;
                        mask             == 'hf;
                        addr == access_addr;
                        source == 2;
                        write == 0;
                    )
                    seq.start(mst_sqr);
                    #1000ns;
                    `uvm_info(get_type_name(), $sformatf("%0s end access ['h%0h:'h%0h] for port_name %0s", port_name, this.slv_info_q[slv_port_name].start_addr[j], this.slv_info_q[slv_port_name].end_addr[j], this.slv_info_q[slv_port_name].slv_name), UVM_NONE)
                end
        end
    endtask


endclass //extends uvm_test

function void `tc_name::build_phase(uvm_phase phase);
    super.build_phase(phase);
    env.cfg = cfg;
endfunction: build_phase

function void `tc_name::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    assert(uvm_hdl_release("tb.u_MEISHAV100_TOP.topDesign.topMod.d2d_sub.axi42tl_master_bus.auto_out_a_valid"));  // avoid spi slave master and chiplink master access fail
    assert(uvm_hdl_release("tb.u_MEISHAV100_TOP.topDesign.topMod.d2d_sub.axi42tl_master_bus.auto_out_a_ready")); 
    // release chiplink rst for access ok
    // move to bus_test
    // assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.d2d_sub.U_SOC_LSYS.mig_input_takeover_en_reg", 1'b0)); 
    // release nvdla rst for access ok
    assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.d2d_sub.U_SOC_LSYS.nvdla_cfg_reg[0]", 1'b0)); 
    assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.d2d_sub.U_SOC_LSYS.nvdla_cfg_reg[1]", 1'b0)); 
    uvm_top.print_topology();
    

endfunction: end_of_elaboration_phase



task `tc_name::start_slave_seq();
    
        begin
            foreach(env.virtual_sequencer.slv_sqr_q[tl_type, port_name]) begin
                automatic string i = tl_type;
                automatic string j = port_name;
                fork 
                    begin
                        if("tlul" == i) begin
                            mem_model_pkg::mem_model#(.AddrWidth(32), .DataWidth(64), .MaskWidth(8)) u_mem = mem_model_pkg::mem_model#(.AddrWidth(32), .DataWidth(64), .MaskWidth(8))::type_id::create($sformatf("%0s_mem", j)); 
                            device_seq[j] = tl_device_seq#()::type_id::create($sformatf("%0s_seq", j));
                            device_seq[j].mem = u_mem;
                            device_seq[j].out_of_order_rsp = 0;  // tlul xbar cannot support out of order_rsp
                            device_seq[j].d_error_pct = $urandom_range(0, 0);
                            device_seq[j].rsp_abort_pct = $urandom_range(0, 0);
                            `uvm_info(get_type_name(), $sformatf("start sequencer type %0s for port_name %0s", i, j), UVM_NONE)
                            device_seq[j].start(env.virtual_sequencer.slv_sqr_q[i][j]);
                        end
                        else if("axi" == i) begin
                            mem_model_pkg::mem_model#(.AddrWidth(30), .DataWidth(64), .MaskWidth(8)) u_mem = mem_model_pkg::mem_model#(.AddrWidth(30), .DataWidth(64), .MaskWidth(8))::type_id::create($sformatf("%0s_mem", j)); 
                            env.m_axi_agent[j].s_drv.mem = u_mem;
                            `uvm_info(get_type_name(), $sformatf("start sequencer type %0s for port_name %0s", i, j), UVM_NONE)
                            if(uvm_is_match({"*", this.DDR_MEM_REGEX_NAME.tolower(), "*"}, j.tolower())) begin
                                this.mem["ddr"] = this.env.m_axi_agent[j].s_drv.mem;
                                `uvm_info(get_type_name(), $sformatf("get ddr mem agent %0s for port_name %0s", j, this.DDR_MEM_REGEX_NAME), UVM_NONE)
                            end
                        end
                    end
                join_none
                #1ps;
            end
        end
    
endtask


task `tc_name::run_phase(uvm_phase phase);
    
    //super.run_phase(phase); // donnot run super class start seq
    //phase.raise_objection(this);
    `uvm_info(get_type_name(), "Enter run_phase.", UVM_NONE)
    
    //phase.drop_objection(this);
    
    `uvm_info(get_type_name(), "Exit run_phase.", UVM_NONE)


endtask

task `tc_name::main_phase(uvm_phase phase);
    //super.main_phase(phase);
    phase.raise_objection(this);
    foreach(env.virtual_sequencer.sqr_q[i]) begin
        foreach(env.virtual_sequencer.sqr_q[i][j]) begin
            `uvm_info(get_type_name(), $sformatf("check sequencer type %0s for port_name %0s", i, j), UVM_NONE)
        end
    end

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

task `tc_name::pre_main_phase(uvm_phase phase);

    super.pre_main_phase(phase);

    phase.raise_objection(this);

    phase.drop_objection(this);
    `uvm_info(get_type_name(), $sformatf("pre_main_phase end"), UVM_NONE)
endtask: pre_main_phase

task `tc_name::pre_reset_phase(uvm_phase phase);
    super.pre_reset_phase(phase);
    phase.raise_objection(this, $sformatf("%s objection raised", `gn));
    fork
        start_slave_seq();
    join_none
    #1ns;
    phase.drop_objection(this, $sformatf("%s objection dropped", `gn));
  endtask


task `tc_name::post_main_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("post_main_phase end"), UVM_NONE)
endtask: post_main_phase


`undef tc_name
`undef tc_name_cfg
