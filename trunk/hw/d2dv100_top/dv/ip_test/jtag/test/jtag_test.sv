`define tc_name jtaga_base_test
`define tc_name_cfg jtag_base_test_cfg

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



class `tc_name extends  cip_base_pkg::cip_base_test #(.ENV_T(tlul_base_env), .CFG_T(tlul_base_env_cfg));

    tl_device_seq     device_seq[];
    jtag_env jtag_base_env;
    ////spi_reg_sckmode_c spi_reg_sckmode;

    `uvm_component_utils(`tc_name)
    
    // Components
    function new(string name, uvm_component parent);
        super.new(name, parent);
        set_type_override_by_type(dv_lib_pkg::dv_base_env_cfg#(tlul_base_env_pkg::tlul_base_reg_block)::get_type(), `tc_name_cfg::get_type());
        set_type_override_by_type(tlul_base_env_cfg::get_type(), `tc_name_cfg::get_type());
        cfg = `tc_name_cfg::type_id::create("test_cfg", this);
        jtag_base_env = jtag_env::type_id::create("jtag_base_env", this);
        ////uart_base_env = uart_env::type_id::create("uart_base_env", this);
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
            jtag_agent_pkg::jtag_ir_seq ir_seq;
            jtag_agent_pkg::jtag_dr_seq dr_seq;
            ir_seq = new("ir_seq");
            ir_seq.ir_len = 5;
            ir_seq.ir = 5'h10; // DMCONTROL
            ir_seq.start(this.jtag_base_env.m_jtag_agent.sequencer);

            #100ns
            // 执行DMI写操作
            dr_seq = new("dr_seq");
            dr_seq.dr_len = 'd34; // DR length should match the DMI format
            dr_seq.dr = {32'h8000_0001, 2'b10}; // Address and Data for write, with op=WRITE (2)
            dr_seq.start(this.jtag_base_env.m_jtag_agent.sequencer);
            #100ns
            // 等待写操作完成并检查状态
            ir_seq = new("ir_seq");
            ir_seq.ir_len = 6;
            ir_seq.ir = 6'h11; // DMCONTROL
            ir_seq.start(this.jtag_base_env.m_jtag_agent.sequencer);

            dr_seq = new("dr_seq");
            dr_seq.dr_len = 'd34;
            dr_seq.dr = {32'h8000_0001, 2'b01}; // Address f
            dr_seq.start(this.jtag_base_env.m_jtag_agent.sequencer);
        end 
    join

// task write 4byte(input bit [31:0] addr, input bit [31:0] data),
//     bit [JTAG_DRW-1:0] ir;
//     bit [JTAG_DRW-1:0] dr;
//     int len;

    
//     len = 32; 
//     ir = {addr, 8'h11}; 
//     drive_jtag_ir(len, ir);

//     len = 32; 
//     dr = data;
//     drive_jtag_dr(len, dr, dr); 
// endtask

// task read_4byte(input bit [31:0] addr, output bit [31:0] data);
//     bit [JTAG_DRW-1:0] ir;
//     bit [JTAG_DRW-1:0] dr;
//     int len;

//     len = 32; 
//     ir = {addr, 8'h11}; 
//     drive_jtag_ir(len, ir);

//     len = 32;
//     dr = '0;
//     drive_jtag_dr(len, dr, dr);
//     data = dr;
// endtask

    phase.drop_objection(this);
endtask: main_phase


`undef tc_name
`undef tc_name_cfg
