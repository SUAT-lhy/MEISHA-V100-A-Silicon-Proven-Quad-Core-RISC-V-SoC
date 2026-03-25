`define tc_name spi1_base_test
`define tc_name_cfg spi_base_test_cfg

class `tc_name_cfg extends tlul_base_test_cfg;

    `uvm_object_utils(`tc_name_cfg)

    `uvm_object_new

    virtual spi_slave_if spi_slave_if;

  virtual function void initialize(bit [TL_AW-1:0] csr_base_addr = '1);
    // super.initialize(csr_base_addr);  // need override tlul_base_test config
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
            this.tlul_agent_sw[i] = dv_utils_pkg::OFF;
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
            this.axi_agent_work_mode[i] = dv_utils_pkg::SLAVE;
            // use in addr process after chiplink master port
            //assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.island.blackbox.chipLinkConverter.master_mem_0_awaddr[28]", 0));
            //assert(uvm_hdl_force("tb.u_MEISHAV100_TOP.topDesign.topMod.mig.island.blackbox.chipLinkConverter.master_mem_0_araddr[28]", 0));  // because master port send base_addr is 325000_0000, for match backdoor access
        end
        else if(uvm_is_match("*mig*chipLinkConverter*slave_0_slv*", i)) begin
            this.axi_agent_work_mode[i] = dv_utils_pkg::SLAVE;
        end
        else if(uvm_is_match("*u_axi_spi_slave*m_axi_mst*", i)) begin // for qspi
            this.axi_agent_work_mode[i] = dv_utils_pkg::SLAVE;
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
    // super.pre_randomize();
    
  endfunction

  function void post_randomize();
    super.post_randomize();
    
  endfunction

endclass


class `tc_name extends tlul_base_test;

    tl_device_seq     device_seq[string];

    bit [31:0] write_data = 0;
    bit [31:0] rw_addr = 0;
    int qspi_mode = 1;

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
               || uvm_is_match("*clint*", i.tolower())
               || uvm_is_match("*clint*", i.tolower())
               || uvm_is_match("*clint*", i.tolower())
               ) begin
                continue;
            end
            this.mst_info_q["mig*chipLinkConverter*master_mem_0_mst"].create_info(i);
            this.mst_info_q["u_axi_spi_slave*m_axi_mst"].create_info(i);
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
    if (!uvm_config_db#(virtual spi_slave_if)::get(this, "", "spi_slave_if", cfg.spi_slave_if)) begin
        `uvm_fatal(get_full_name(), "failed to get spi_slave_if from uvm_config_db")
    end
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

    #20000ns;
    
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
            source == 2;
            write == 1;
        )

        // Initialize Mode and clock and data length, command and address length 

        // reset FIFO
        seq.addr = `SPI1_REG64_STATUS;
        seq.data = ('h1 << 4);
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));


        // set clock, spi_clk = axi_clk / (2 * (clk_div + 1))
        seq.addr = `SPI1_REG64_CLKDIV;
        seq.data = 32'h1;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

        // set data length and command to be 8 bits, address 0 bits
        seq.addr = `SPI1_REG64_SPILEN;
        seq.data = {16'h8, 2'h0, 6'h0, 2'h0, 6'h8};
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));


        // set write dummy cycles to be 0, read dummy cycles to be 33
        seq.addr = `SPI1_REG64_SPIDUM;
        seq.data = {16'h0, 16'h21};
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

        // disable interrupt
        // seq.addr = `SPI1_REG64_INTCFG;
        // seq.data = 32'h0;
        // seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

        // if transmit by qspi mode, need to set reg0 of qspi to 1 
        if (qspi_mode == 1) begin
            seq.addr = `SPI1_REG64_SPICMD;
            seq.data = 8'h01 << 24;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            seq.addr = `SPI1_REG64_STATUS;
            seq.data = 32'h0102;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            seq.addr = `SPI1_REG64_TXFIFO;
            seq.data = 8'h01 << 24;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        end
    
        // set data length and address to be 32 bits, command 8 bits
        seq.addr = `SPI1_REG64_SPILEN;
        seq.data = {16'h20, 2'h0, 6'h20, 2'h0, 6'h8};
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

        // set initial address and data
        rw_addr = 32'h8000_0000;
        write_data = 32'h1;

        repeat(100) begin
            `uvm_info(`gfn, $sformatf("spi_1 send data: %h", write_data), UVM_NONE)
            // write data to rw_addr
            seq.write = 1;
            seq.addr = `SPI1_REG64_SPICMD;
            seq.data = 32'h0200_0000;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            seq.addr = `SPI1_REG64_SPIADR;
            seq.data = rw_addr;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
  
            if (qspi_mode == 1) begin
                seq.addr = `SPI1_REG64_STATUS;
                seq.data = 32'h0108;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
            end
            else begin
                seq.addr = `SPI1_REG64_STATUS;
                seq.data = 32'h0102;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
            end

            seq.addr = `SPI1_REG64_TXFIFO;
            seq.data = write_data;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
            #1000ns;

            // read data from rw_addr, data will be stored in rxfifo
            seq.addr = `SPI1_REG64_SPICMD;
            seq.data = 32'h0b00_0000;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            seq.addr = `SPI1_REG64_SPIADR;
            seq.data = rw_addr;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            if (qspi_mode == 1) begin
                seq.addr = `SPI1_REG64_STATUS;
                seq.data = 32'h0104;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
            end
            else begin
                seq.addr = `SPI1_REG64_STATUS;
                seq.data = 32'h0101;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
            end
            #1000ns;

            // read data from spi_1 rxfifo
            seq.addr = `SPI1_REG64_RXFIFO;
            seq.write = 0;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            rw_addr += 32'h4;
            write_data += 32'h1;
        end
        
    end
    #1000ns;
    phase.drop_objection(this);
endtask: main_phase

task `tc_name::post_main_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("post_main_phase end"), UVM_NONE)
endtask: post_main_phase


`undef tc_name
`undef tc_name_cfg
