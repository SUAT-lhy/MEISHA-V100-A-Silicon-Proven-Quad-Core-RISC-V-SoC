`define tc_name spi_base_test
`define tc_name_cfg spi_base_test_cfg

class `tc_name_cfg extends tlul_base_env_cfg;

    `uvm_object_utils(`tc_name_cfg)

    `uvm_object_new

    virtual spi_if spi_if;

  virtual function void initialize(bit [TL_AW-1:0] csr_base_addr = '1);
    super.initialize(csr_base_addr);  // need override tlul_base_test config
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



class `tc_name extends  cip_base_pkg::cip_base_test #(.ENV_T(tlul_base_env), .CFG_T(tlul_base_env_cfg));

    tl_device_seq     device_seq[];
    spi_env spi_base_env;
    // spi_reg_sckmode_c spi_reg_sckmode;

    `uvm_component_utils(`tc_name)
    
    // Components
    function new(string name, uvm_component parent);
        super.new(name, parent);
        set_type_override_by_type(dv_lib_pkg::dv_base_env_cfg#(tlul_base_env_pkg::tlul_base_reg_block)::get_type(), `tc_name_cfg::get_type());
        set_type_override_by_type(tlul_base_env_cfg::get_type(), `tc_name_cfg::get_type());
        cfg = `tc_name_cfg::type_id::create("test_cfg", this);
        spi_base_env = spi_env::type_id::create("spi_base_env", this);
        set_type_override_by_type(dv_base_scoreboard#(dv_base_reg_pkg::dv_base_reg_block,dv_base_env_cfg,dv_base_env_cov)::get_type(), spi_scoreboard::get_type());
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


virtual task wait_clk_rst();
    #400ns; // wait soc rst_n deassert
endtask


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
    
    // super.run_phase(phase); // donnot run super class start seq
    device_seq = new[1];
    foreach(device_seq[i]) begin
        mem_model_pkg::mem_model#(.AddrWidth(32), .DataWidth(64), .MaskWidth(8)) u_mem = mem_model_pkg::mem_model#(.AddrWidth(32), .DataWidth(64), .MaskWidth(8))::type_id::create($sformatf("%0s_mem", "tl_slv")); 
        device_seq[i] = tl_device_seq#()::type_id::create($sformatf("%0s_seq", "tl_slv"));
        device_seq[i].mem = u_mem;
        device_seq[i].out_of_order_rsp = 1;
        device_seq[i].d_error_pct = $urandom_range(0, 0);
        device_seq[i].rsp_abort_pct = $urandom_range(0, 0);
        device_seq[i].start(env.virtual_sequencer.match_sqr("tl", "XilinxVC707MIG*tl_mem_slv"));
    end

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
            
            
            // begin: spi read tests
            bit [7:0] wr_data = 0;

            // spi_reg_sckmode_c spi_reg_sckmode;
            // spi_reg_sckmode = new("spi_reg_sckmode");
            // std::randomize(spi_csmode)with{spi_csmode.pol inside {0, 1};};

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

            seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
            seq.data = 32'h3;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            repeat(1) begin
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                seq.data = 8'h0;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #1000ps;
            end

            // SPI Test
            
            repeat(256) begin
                bit [7:0] wr_addr = $urandom_range(0, 255);
                `uvm_info("SPI WR Addr", $sformatf("spi w&r_addr is :%02h", wr_addr), UVM_MEDIUM)
                // Write Address Operation
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
                seq.data = 32'h2;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

                repeat(1) begin
                    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                    seq.data = {4'b0, wr_addr[7:4]};
                    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                    #100ps;
                end

                repeat(1) begin
                    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                    seq.data = {wr_addr[3:0], 4'b0};
                    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                    #100ps;
                end

                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
                seq.data = 32'h3;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

                repeat(1) begin
                    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                    seq.data = 8'h0;
                    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                    #1000ps;
                end

                // Write Data Operation
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
                seq.data = 32'h2;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

                repeat(1) begin
                    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                    seq.data = {4'h1, wr_data[7:4]};
                    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                    #100ps;
                end

                repeat(1) begin
                    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                    seq.data = {wr_data[3:0], 4'h0};
                    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                    #100ps;
                end

                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
                seq.data = 32'h3;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

                repeat(1) begin
                    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                    seq.data = 8'h0;
                    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                    #1000ps;
                end

                // Read Address Operation
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
                seq.data = 32'h2;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

                repeat(1) begin
                    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                    seq.data = {4'h6, wr_addr[7:4]};
                    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                    #100ps;
                end

                repeat(1) begin
                    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                    seq.data = {wr_addr[3:0], 4'h0};
                    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                    #100ps;
                end

                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
                seq.data = 32'h3;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

                repeat(1) begin
                    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                    seq.data = 8'h0;
                    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                    #1000ps;
                end

                // Read Data Operation
                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
                seq.data = 32'h2;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

                repeat(1) begin
                    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                    seq.data = 8'h70;
                    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                    #100ps;
                end

                repeat(2) begin
                    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                    seq.data = 8'h00;
                    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                    #100ps;
                end

                seq.addr = `SPI_CTRL_ADDR + `SPI_REG_CSMODE; 
                seq.data = 32'h3;
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

                repeat(1) begin
                    seq.addr = `SPI_CTRL_ADDR + `SPI_REG_TXFIFO; 
                    seq.data = 8'h00;
                    seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                    #2000ps;
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

            /*
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
