`define tc_name linux_soft_base_test
`define tc_name_cfg linux_soft_base_test_cfg


`define BOOTROM_HIR_str "u_MEISHAV100_TOP-topDesign-topMod-maskROM-TLMaskROM_bind_if_inst-tl_slv-sqr"
`define BOOTROM_HIR device_seq[`BOOTROM_HIR_str].mem
`define BOOTROM_DEPTH 32'h1_0000
`define BOOTROM_WIDTH 32
`define BOOTROM_BYTE_DEPTH 32'h20_0000
`define BOOTROM_BASE_ADDR 32'h0001_0000


//`define DDR_MEM_HIR device_seq["u_MEISHAV100_TOP-topDesign-topMod-mig-XilinxVC707MIG_bind_if_inst-tl_mem_slv-sqr"].mem
//`define DDR_MEM_HIR env.m_axi_agent["u_MEISHAV100_TOP-topDesign-topMod-mig-island-blackbox-chipLinkConverter-CHIPLINK_PREFIX_ChipLinkMaster_bind_if_inst-master_mem_0_mst"].s_drv.mem
//`define DDR_MEM_HIR env.m_axi_agent["u_MEISHAV100_TOP-topDesign-topMod-mig-island-blackbox-vc707mig1gb_chiplink_bind_if_inst-s_axi_slv"].s_drv.mem  // for axi connect
 // for tl-u direct connect
//`define DDR_MEM_HIR env.m_axi_agent["u_MEISHAV100_TOP-topDesign-topMod-mig-island-blackbox-chipLinkConverter-CHIPLINK_PREFIX_ChipLinkMaster_m_bind_if_inst-master_mem_0_mst"].s_drv.mem
`define DDR_MEM_DEPTH 32'h4_0000
`define DDR_MEM_WIDTH 64
`define DDR_MEM_BYTE_DEPTH 32'h30_0000
//`define DDR_MEM_BASE_ADDR 32'h8000_0000  // mig axi slv port addr is begin from 0
`define DDR_MEM_BASE_ADDR 32'h1000_0000


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
		//this.tlul_agent_sw[i] = dv_utils_pkg::OFF;
        `uvm_info(get_type_name(), $sformatf("set_vip_agent_work_mode for inst_path %s, work_mode %s", i, this.tlul_agent_work_mode[i].name()), UVM_DEBUG);
        //this.m_tlul_agent_cfg[i].if_mode = dv_utils_pkg::Host;  // donnot need add in here
    end

	foreach(this.axi_agent_sw[i]) begin 
        this.axi_agent_sw[i] = dv_utils_pkg::ON;
        if(uvm_is_match("*vc707mig1gb*s_axi_slv*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
        end
        else if(uvm_is_match("*u_fpga_ddr_chiplink*master_mem_0_mst*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::SLAVE;
            assert(uvm_hdl_force("tb.ddr_external_loopback_en", 0));
            // assert(uvm_hdl_force("tb.u_fpga_ddr_chiplink.CHIPLINK_PREFIX_ChipLinkMaster_m_bind_if_inst.axi_bind_port_mst.u_intf.AWADDR[31:28]", 4'b0));               // for netlist bug, actual is ok
            // assert(uvm_hdl_force("tb.u_fpga_ddr_chiplink.CHIPLINK_PREFIX_ChipLinkMaster_m_bind_if_inst.axi_bind_port_mst.u_intf.ARADDR[31:28]", 4'b0));
        end
        else if(uvm_is_match("*mig*slave_0_slv*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
            // use in addr process after chiplink master port
            // assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.island.blackbox.chipLinkConverter.master_mem_0_awaddr[28]", 0));
            // assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.island.blackbox.chipLinkConverter.master_mem_0_araddr[28]", 0));  // because master port send base_addr is 32'h1000_0000, for match backdoor access
        end
        else if(uvm_is_match("*u_axi_spi_slave*m_axi_mst*", i)) begin // for qspi
            this.axi_agent_work_mode[i] = dv_utils_pkg::SLAVE;
        end
		else if(uvm_is_match("*vc707axi_to_pcie_x1*m_axi_slv*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::ONLY_MONITOR;
        end
		else if(uvm_is_match("*vc707axi_to_pcie_x1*s_axi_mst*", i)) begin
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
        // RTL BUG , do not use master vip, need use slave vip, cannot use 512MB space in loopback
        this.DDR_MEM_REGEX_NAME = "*fpga_ddr_chiplink*bind_if_inst-master_mem_0_mst";
        this.DDR_MEM_BASE_ADDR = 32'h1000_0000;
    endfunction //new()

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
    //  Function: end_of_elaboration_phase
    extern function void end_of_elaboration_phase(uvm_phase phase);
    
    //  Function:
    extern virtual task backdoor_load_data(bit [31:0] ddr_mem_base_addr);
    
    //  Function: main_phase
    extern task main_phase(uvm_phase phase);
    
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



endclass //`tc_name extends uvm_test

function void `tc_name::build_phase(uvm_phase phase);
    super.build_phase(phase);    
    env.cfg = cfg;
endfunction: build_phase

function void `tc_name::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
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
        #1s;  // wait core done
        //seq.start(env.virtual_sequencer.sqr_q["tlul"]["u_VC707BaseShell-topDesign-topMod-tile_3-RocketTile_bind_if_inst-tl_mem_mst-sqr"]);
    join
    #1000ns;
    phase.drop_objection(this);
endtask: main_phase



task `tc_name::post_main_phase(uvm_phase phase);
    //super.post_main_phase(phase);
    phase.raise_objection(this);
    #10000ms;  // wait core done
    phase.drop_objection(this);
endtask: post_main_phase


task  `tc_name::backdoor_load_data(bit [31:0] ddr_mem_base_addr);

	bit [`BOOTROM_WIDTH - 1:0] rom_content[`BOOTROM_DEPTH];
	
	bit [`DDR_MEM_WIDTH - 1:0] mem_content[`DDR_MEM_BYTE_DEPTH];

	int fd;
    int ddr_mem_line_count;
    // 定义用于存储每行数据的字符串变量 
    string line;

	string BOOT_ROM_HEX_FILE;
	string OUT_SRAM_HEX_FILE;

    `uvm_info(get_type_name(), "backdoor_load_data.",UVM_NONE)
	if(device_seq.exists(`BOOTROM_HIR_str)) begin
		if ($value$plusargs("BOOT_ROM_HEX_FILE=%s", BOOT_ROM_HEX_FILE)) begin
			`uvm_info(get_type_name(), $sformatf("BOOT_ROM_HEX_FILE=%s", BOOT_ROM_HEX_FILE), UVM_NONE)
			// Check wheather the hex  exist
			if(!$fopen(BOOT_ROM_HEX_FILE, "r"))
				$fatal();
		end

		$readmemh(BOOT_ROM_HEX_FILE, rom_content);

		if(`BOOTROM_WIDTH == 64) begin
			for(int ram_depth_idx = 0; ram_depth_idx < `BOOTROM_BYTE_DEPTH; ram_depth_idx++) begin
				`BOOTROM_HIR.write_dword(`BOOTROM_BASE_ADDR + ram_depth_idx * 8, rom_content[ram_depth_idx]);
				//`uvm_info(get_type_name(), $sformatf("load mem_content[%x]=%x", ram_depth_idx, mem_content[ram_depth_idx]), UVM_MEDIUM)
			end
		end
		else if(`BOOTROM_WIDTH == 32) begin
			for(int ram_depth_idx = 0; ram_depth_idx < `BOOTROM_BYTE_DEPTH; ram_depth_idx++) begin
				`BOOTROM_HIR.write_word(`BOOTROM_BASE_ADDR + ram_depth_idx * 4, rom_content[ram_depth_idx]);
				//`uvm_info(get_type_name(), $sformatf("load mem_content[%x]=%x", ram_depth_idx, mem_content[ram_depth_idx]), UVM_MEDIUM)
			end
		end
		else begin
			`uvm_error(get_type_name(), $sformatf("load mem_content error, the mem_width %0d is undefined", `BOOTROM_WIDTH))
		end
	end

//////////////////////////////////////////////////////////////////////
///  Write SRAM  @0x8000_0000
/////////////////////////////////////////////////////////////////////


	if ($value$plusargs("OUT_SRAM_HEX_FILE=%s", OUT_SRAM_HEX_FILE)) begin
		`uvm_info(get_type_name(), $sformatf("OUT_SRAM_HEX_FILE=%s", OUT_SRAM_HEX_FILE), UVM_NONE)
		// Check wheather the hex  exist
		if(!$fopen(OUT_SRAM_HEX_FILE, "r"))
			$fatal();
	end

	$readmemh(OUT_SRAM_HEX_FILE, mem_content);
    // 打开文件 
    fd = $fopen(OUT_SRAM_HEX_FILE, "r"); 
    if (fd) begin 
        // 逐行读取文件并计数行数 
        while (!$feof(fd)) begin 
            void'($fgets(line, fd)); 
            ddr_mem_line_count++; 
        end 
        $fclose(fd); 
        `uvm_info(get_type_name(), $sformatf("文件行数: %d", ddr_mem_line_count), UVM_NONE); 
    end 
    else begin 
        `uvm_error(get_type_name(), $sformatf("无法打开文件: %s", OUT_SRAM_HEX_FILE));
    end

	if(`DDR_MEM_WIDTH == 64) begin
		for(int ram_depth_idx = 0; ram_depth_idx < `DDR_MEM_BYTE_DEPTH; ram_depth_idx++) begin
			this.mem["ddr"].write_dword(`DDR_MEM_BASE_ADDR + ram_depth_idx * 8, mem_content[ram_depth_idx]);
			`uvm_info(get_type_name(), $sformatf("load mem_content[%x]=%x", ram_depth_idx, mem_content[ram_depth_idx]), UVM_MEDIUM)
		end
	end
	else if(`DDR_MEM_WIDTH == 32) begin
		for(int ram_depth_idx = 0; ram_depth_idx < `DDR_MEM_BYTE_DEPTH; ram_depth_idx++) begin
			this.mem["ddr"].write_word(`DDR_MEM_BASE_ADDR + ram_depth_idx * 4, mem_content[ram_depth_idx]);
			`uvm_info(get_type_name(), $sformatf("load mem_content[%x]=%x", ram_depth_idx, mem_content[ram_depth_idx]), UVM_MEDIUM)
		end
	end
	else begin
		`uvm_error(get_type_name(), $sformatf("load mem_content error, the mem_width %0d is undefined", `DDR_MEM_WIDTH))
	end

endtask


`undef BOOTROM_HIR_str
`undef BOOTROM_HIR
`undef BOOTROM_DEPTH
`undef BOOTROM_WIDTH
`undef BOOTROM_BYTE_DEPTH
`undef BOOTROM_BASE_ADDR

//`undef DDR_MEM_HIR
`undef DDR_MEM_DEPTH
`undef DDR_MEM_WIDTH
`undef DDR_MEM_BYTE_DEPTH
`undef DDR_MEM_BASE_ADDR

`undef tc_name
`undef tc_name_cfg
