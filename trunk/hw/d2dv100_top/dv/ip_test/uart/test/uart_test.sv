`define tc_name uarta_base_test
`define tc_name_cfg uarta_base_test_cfg

class test_rand;
    rand int unsigned int_unsigned;
    int unsigned rand_value; // 用于存储预生成的随机值

    // 在生成随机数之前调用此方法
    function void pre_randomize();
        //super.pre_randomize();
        rand_value = $random();
    endfunction

    constraint variable_constraint {
        // 将低位和高位都设置为特定值
        int_unsigned[0] == 0;
        int_unsigned[31] == 0;

        // 使用预生成的随机值
        int_unsigned[30] == rand_value[8:1];

        // 将中间部分剩余的位设为0
        int_unsigned[30:9] == 0;
    }
endclass

class my_random_generator extends uvm_object;
    rand bit [31:0] random_number; // 32位随机数

    // 使用约束确保只有最高的8位是随机的，其他位为0
    constraint valid_bits {
        //random_number[31:24] inside {[0:255]}; // 最高8位可以是0到255之间的任意值
        random_number[7:0] inside {[0:255]};
        //random_number[23:0] == 0;             // 其他位都是0
        random_number[31:8] == 0;
    }

    // 构造函数
    function new(string name = "my_random_generator");
        super.new(name);
    endfunction

    // 打印生成的随机数
    virtual function void display();
        $display("Generated random number: %h", random_number);
    endfunction
endclass

class `tc_name_cfg extends tlul_base_env_cfg;

    `uvm_object_utils(`tc_name_cfg)

    `uvm_object_new

    ////virtual uart_if uart_if;

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

class tile_send_wrapper extends uvm_object;
  `uvm_object_utils(tile_send_wrapper)
  
  bit [31:0] tile_send;
  bit [31:0] tile_send_1;
  bit wr_bit_pointer;

  bit wr_bit_cnt;
  bit rd_bit_pointer;
  function new(string name = "tile_send_wrapper");
    super.new(name);
    wr_bit_cnt = 0;
    wr_bit_pointer = 0;

    rd_bit_pointer = 0;
  endfunction

  // 添加一个新方法来处理数组添加操作
  function void add_to_tile_send(bit [31:0] data);
    if (wr_bit_pointer == 0) begin
        tile_send = data;
        wr_bit_pointer = 1;
    end
    else begin
        tile_send_1 = data;
        wr_bit_pointer = 0;
    end
    wr_bit_cnt = wr_bit_cnt + 1;
  endfunction

  function bit[31:0] get_to_tile_send();
    if (rd_bit_pointer == 0) begin
        get_to_tile_send = tile_send;
        rd_bit_pointer = 1;
    end
    else begin
        get_to_tile_send = tile_send_1;
        rd_bit_pointer = 0;
    end
    wr_bit_cnt = wr_bit_cnt - 1;
  endfunction

endclass


class `tc_name extends  cip_base_pkg::cip_base_test #(.ENV_T(tlul_base_env), .CFG_T(tlul_base_env_cfg));

    tl_device_seq     device_seq[];
    uart_env uart_base_env;
    ////spi_reg_sckmode_c spi_reg_sckmode;

    `uvm_component_utils(`tc_name)
    tile_send_wrapper tile_send_obj;
    // Components
    function new(string name, uvm_component parent);
        super.new(name, parent);
        set_type_override_by_type(dv_lib_pkg::dv_base_env_cfg#(tlul_base_env_pkg::tlul_base_reg_block)::get_type(), `tc_name_cfg::get_type());
        set_type_override_by_type(tlul_base_env_cfg::get_type(), `tc_name_cfg::get_type());
        cfg = `tc_name_cfg::type_id::create("test_cfg", this);
        uart_base_env = uart_env::type_id::create("uart_base_env", this);
        tile_send_obj = tile_send_wrapper::type_id::create("tile_send_obj");
        uvm_config_db#(tile_send_wrapper)::set(this, "*", "tile_send_obj", tile_send_obj);
        ////set_type_override_by_type(dv_base_scoreboard#(dv_base_reg_pkg::dv_base_reg_block,dv_base_env_cfg,dv_base_env_cov)::get_type(), spi_scoreboard::get_type());
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
    // if (!uvm_config_db#(virtual uart_if)::get(this, "", "uart_if", uart.spi_if)) begin
    //     `uvm_fatal(get_full_name(), "failed to get uart_if from uvm_config_db")
    // end
    ////spi_reg_sckmode = new("spi_reg_sckmode");
    // spi_reg_sckmode.randomize();
    // `uvm_info("SPI_REG_RAND", $sformatf("spi_reg_sckmode has been randomized to %h and %h\n", spi_reg_sckmode.pol, spi_reg_sckmode.pha), UVM_MEDIUM )
    ////env.cfg = cfg;
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

            // configure uart div
            seq.addr = `UART_CTRL_ADDR + `UART_REG_DIV; 
            seq.data = 32'h8B;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            // configure txctrl
            seq.addr = `UART_CTRL_ADDR + `UART_REG_TXCTRL;
            seq.data = 32'h70003;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
            // // #1000ps;
            // configure rxctrl
            seq.addr = `UART_CTRL_ADDR + `UART_REG_RXCTRL;
            seq.data = 32'h70001;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));

            // configure uart ip
            seq.addr = `UART_CTRL_ADDR + `UART_REG_IP; 
            seq.data = 0;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
            // // #1000ps;

            // configure uart ie
            seq.addr = `UART_CTRL_ADDR + `UART_REG_IE; 
            seq.data = 0;
            seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));


            seq.addr = `UART_CTRL_ADDR + `UART_REG_TXFIFO; 
            $display("123456infotest");
            // send data
            repeat(5) begin
                my_random_generator ra = new();
                ra.randomize();
                $display("asdfg:%x",ra.random_number);
                seq.data = ra.random_number;
                //seq.data = 32'h55;
                tile_send_obj.add_to_tile_send(seq.data);
                seq.start(env.virtual_sequencer.match_sqr("tl", "tile-RocketTile*tl_mem_mst"));
                #100;
                //seq.data += 32'h4;
            end
        end

    join
    #1000ns;
    phase.drop_objection(this);
endtask: main_phase



`undef tc_name
`undef tc_name_cfg
