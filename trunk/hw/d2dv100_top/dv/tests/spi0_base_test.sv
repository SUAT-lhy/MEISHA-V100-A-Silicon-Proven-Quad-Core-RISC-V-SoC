`define tc_name spi0_base_test
`define tc_name_cfg spi0_base_test_cfg

class `tc_name_cfg extends tlul_base_test_cfg;

    `uvm_object_utils(`tc_name_cfg)

    `uvm_object_new

    virtual spi_if spi_if;

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
    super.pre_randomize();
    
  endfunction

  function void post_randomize();
    super.post_randomize();
    
  endfunction

endclass


class `tc_name extends tlul_base_test;

    tl_device_seq     device_seq[string];
    spi_env spi_base_env;
    bit [7:0] wr_data = 0;
    bit [7:0] wr_addr = 0;

    `uvm_component_utils(`tc_name)
    
    // Components
    function new(string name, uvm_component parent);
        super.new(name, parent);
        spi_base_env = spi_env::type_id::create("spi_base_env", this);
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
    if (!uvm_config_db#(virtual spi_if)::get(this, "", "spi_if", cfg.spi_if)) begin
        `uvm_fatal(get_full_name(), "failed to get spi_if from uvm_config_db")
    end
    // spi_reg_sckmode = new("spi_reg_sckmode");
    // spi_reg_sckmode.randomize();
    // `uvm_info("SPI_REG_RAND", $sformatf("spi_reg_sckmode has been randomized to %h and %h\n", spi_reg_sckmode.pol, spi_reg_sckmode.pha), UVM_MEDIUM )
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
        
        
        // begin: spi read tests
        

        // spi_reg_sckmode_c spi_reg_sckmode;
        // spi_reg_sckmode = new("spi_reg_sckmode");
        // std::randomize(spi_csmode)with{spi_csmode.pol inside {0, 1};};

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


        // spi flash en off
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_FCTRL;
        seq.data = 32'h0;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // #1000ps;
        //  configure spi flash: {pad_code, cmd_code, reserved, data_proto, addr_proto, cmd_proto, pad_cnt, addr_len, cmd_len}
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_FFMT; 
        seq.data = {8'b0, 8'b1011, 2'b0, 2'b0, 2'b0, 2'b0, 4'b0, 3'b100, 1'b1};
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // #1000ps;
        // spi flash en on
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_FCTRL; 
        seq.data = 32'h1;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // #1000ps;
        // spi flash en off
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_FCTRL; 
        seq.data = 32'h0;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // #1000ps;
        // configure spi fmt reg: {reversed, len, reversed, dir, endian, proto}
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_FMT; 
        seq.data = {12'b0, 4'b1000, 12'b0, 1'b0, 1'b0, 2'b0};
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // #1000ps;


        // seq.addr = `SPI_CTRL_ADDR + `SPI_REG_SCKDIV; 
        // seq.data = 32'd2000;
        // seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

        /*
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
        seq.data = 32'h3;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

        repeat(1) begin
            seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
            seq.data = 8'h0;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
            #100ns;
        end

        // SPI Test
        
        repeat(256) begin
            wr_addr = $urandom_range(0, 255);
            `uvm_info("SPI WR Addr", $sformatf("spi w&r_addr is :%02h", wr_addr), UVM_NONE)
            // Write Address Operation
            seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
            seq.data = 32'h2;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            repeat(1) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = {4'b0, wr_addr[7:4]};
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #100ns;
            end

            repeat(1) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = {wr_addr[3:0], 4'b0};
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #100ns;
            end

            seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
            seq.data = 32'h3;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            repeat(1) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = 8'h0;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #1000ns;
            end

            // Write Data Operation
            seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
            seq.data = 32'h2;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            repeat(1) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = {4'h1, wr_data[7:4]};
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #100ns;
            end

            repeat(1) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = {wr_data[3:0], 4'h0};
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #100ns;
            end

            seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
            seq.data = 32'h3;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            repeat(1) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = 8'h0;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #1000ns;
            end

            // Read Address Operation
            seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
            seq.data = 32'h2;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            repeat(1) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = {4'h6, wr_addr[7:4]};
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #100ns;
            end

            repeat(1) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = {wr_addr[3:0], 4'h0};
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #100ns;
            end

            seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
            seq.data = 32'h3;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            repeat(1) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = 8'h0;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #1000ns;
            end

            // Read Data Operation
            seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
            seq.data = 32'h2;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            repeat(1) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = 8'h70;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #100ns;
            end

            repeat(2) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = 8'h00;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #100ns;
            end

            seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
            seq.data = 32'h3;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            repeat(1) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = 8'h00;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #1000ns;
            end

            // // TODO: Read Data from rx_fifo
            // seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
            // seq.data = 32'h2;
            // seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            // repeat(1) begin
            //     seq.addr = `SPI_CTRL_ADDR + `SPI_REG_RXFIFO; 
            //     seq.write = 0;
            //     seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
            //     #100ps;
            // end

            // seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
            // seq.data = 32'h3;
            // seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            // repeat(1) begin
            //     seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
            //     seq.data = 8'h00;
            //     seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
            //     #2000ps;
            // end
            wr_data += 1;
        end

        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
        seq.data = 32'h3;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

        repeat(1) begin
            seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
            seq.data = 8'h00;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
            #1000ps;
        end
        // #1000ps;
        // spi flash en on
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_FCTRL; 
        seq.data = 32'h1;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

        // #1000ps;
        // end: spi read tests 

        

        // configure spi csmode reg
        // seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
        // seq.data = 32'h2;
        // seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // #1000ps;
        // seq.addr = `SPI_CTRL_ADDR + `SPI_REG_SCKMODE; 
        // seq.data = {30'h0, spi_reg_sckmode.pol, spi_reg_sckmode.pha};
        // seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

        // seq.addr = `SPI_CTRL_ADDR + `SPI_REG_SCKDIV;
        // seq.data = 32'h7;
        // seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

        // spi_if.cs = 0;
        // #10ps;
        // spi_if.mosi = 0;
        // #10ps;
        // spi_if.mosi = 0;
        // #10ps;
        // spi_if.mosi = 0;
        // #10ps;

        // spi_reg_sckmode_c spi_reg_sckmode;
        // spi_reg_sckmode = new("spi_reg_sckmode");
        // std::randomize(spi_csmode)with{spi_csmode.pol inside {0, 1};};

        
        // begin: spi write tests
        tl_agent_pkg::tl_host_single_seq seq;
        seq = new("seq");
        `DV_CHECK_RANDOMIZE_FATAL(seq)
        seq.size = 2;
        seq.mask = 'hf;
        seq.control_addr_alignment = 1;
        seq.control_rand_source = 1;
        seq.override_a_source_val = 1;
        seq.overridden_a_source_val = 2;
        seq.source = 2;
        // spi flash en off
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_FCTRL;
        seq.data = 32'h0;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // #1000ps;
        //  configure spi flash: {pad_code, cmd_code, reserved, data_proto, addr_proto, cmd_proto, pad_cnt, addr_len, cmd_len}
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_FFMT; 
        seq.data = {8'b0, 8'b1011, 2'b0, 2'b0, 2'b0, 2'b0, 4'b0, 3'b100, 1'b1};
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // #1000ps;
        // spi flash en on
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_FCTRL; 
        seq.data = 32'h1;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // #1000ps;
        // spi flash en off
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_FCTRL; 
        seq.data = 32'h0;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // #1000ps;
        // configure spi fmt reg: {reversed, len, reversed, dir, endian, proto}
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_FMT; 
        seq.data = {12'b0, 4'b1000, 12'b0, 1'b1, 1'b0, 2'b0};
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // #1000ps;

        // configure spi csmode reg
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
        seq.data = 32'h2;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

        // for (int i = 0; i < 4; ++ i) begin 
        //     seq.data = (32'h8000_0000 >> i * 8) & 32'hff;
        //     seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // end

        // send data           
        seq.data = 32'h0;
        repeat(256) begin
            // spi_reg_sckmode.randomize();
            // `uvm_info("SPI_REG_RAND", $sformatf("spi_reg_sckmode has been randomized to %h and %h\n", spi_reg_sckmode.pol, spi_reg_sckmode.pha), UVM_MEDIUM )
            seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
            seq.data += 32'h1;
            #100ps;
        end

        #1000ps;
        // configure spi csmode reg
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
        seq.data = 32'h3;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

        // #1000ps;
        // spi flash en on
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_FCTRL; 
        seq.data = 32'h1;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        // #1000ps;

        // end: spi write tests
        */
        
    // end
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


    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
    seq.data = 32'h3;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    repeat(10) begin
        seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
        seq.data = 8'h00;
        seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
        #200ns;
    end

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
    seq.data = 32'h0;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
    seq.data = 32'h2;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
//cmd0
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h40;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h95;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #1000ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
    seq.data = 32'h0;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));


    // seq.addr = `SPI_CTRL_ADDR + `SPI_REG_RXFIFO; 
    // seq.data = 32'h0;
    // seq.write = 0;
    // seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
/*
//cmd8
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.write = 1;
    seq.data = 8'h48;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h01;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'haa;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h87;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    // #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    // #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_RXFIFO; 
    seq.data = 32'h0;
    seq.write = 0;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));


//cmd55
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.write = 1;
    seq.data = 8'h77;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    // #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_RXFIFO; 
    seq.data = 32'h0;
    seq.write = 0;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

//acmd41
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.write = 1;
    seq.data = 8'h69;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h80;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    // #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    // #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_RXFIFO; 
    seq.data = 32'h0;
    seq.write = 0;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));



//cmd58
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.write = 1;
    seq.data = 8'h7a;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h01;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    // #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    // #200ns;


    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    // #200ns;


//cmd17
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.write = 1;
    seq.data = 8'h51;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'h00;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    // #200ns;

    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
    seq.data = 8'hff;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
    // #200ns;




//end
    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_RXFIFO; 
    seq.data = 32'h0;
    seq.write = 0;
    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

*/
    #2000ns;
    end

    #1000ns;
    phase.drop_objection(this);
endtask: main_phase

task `tc_name::post_main_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("post_main_phase end"), UVM_NONE)
endtask: post_main_phase

`undef tc_name
`undef tc_name_cfg
