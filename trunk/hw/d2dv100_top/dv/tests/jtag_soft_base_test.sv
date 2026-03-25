`define tc_name jtag_soft_base_test
`define tc_name_cfg jtag_soft_base_test_cfg

class `tc_name_cfg extends soft_base_test_cfg;

    `uvm_object_utils(`tc_name_cfg)

    `uvm_object_new

    ////virtual uart_if uart_if;

  virtual function void initialize(bit [TL_AW-1:0] csr_base_addr = '1);
    super.initialize(csr_base_addr);  // need override tlul_base_test config
  endfunction

  function void pre_randomize();
    super.pre_randomize();
    
  endfunction

  function void post_randomize();
    super.post_randomize();
    
  endfunction

endclass

`define DTM_IDLE_DELAY_CYCLE 5
`define DTM_ABITS 7

// typedef struct packed {
//     bit dmihardreset;
//     bit dmireset;
//     bit [2:0] idle;
//     bit [1:0] dmistat;
//     bit [5:0] abits;
//     bit [3:0] version;
// } dtmcs_stat_t;

class dtmcs_stat_t extends uvm_object;
    bit [13:0] rsv_31_18;
    bit dmihardreset;
    bit dmireset;
    bit rsv_15;
    bit [2:0] idle;
    bit [1:0] dmistat;
    bit [5:0] abits;
    bit [3:0] version;
  

  `uvm_object_utils_begin(dtmcs_stat_t)
    `uvm_field_int(rsv_31_18, UVM_DEFAULT)
    `uvm_field_int(dmihardreset, UVM_DEFAULT)
    `uvm_field_int(dmireset, UVM_DEFAULT)
    `uvm_field_int(rsv_15, UVM_DEFAULT)
    `uvm_field_int(idle, UVM_DEFAULT)
    `uvm_field_int(dmistat, UVM_DEFAULT)
    `uvm_field_int(abits, UVM_DEFAULT)
    `uvm_field_int(version, UVM_DEFAULT)
  `uvm_object_utils_end

  `uvm_object_new
endclass


class dmcontrol_t extends uvm_object;

    bit haltreq;
    bit resumereq;
    bit hartreset;
    bit ackhavereset;
    bit rsv_27;
    bit hasel;
    bit [9:0] hartsello;
    bit [9:0] hartselhi;
    bit [1:0] rsv_5_4;
    bit setresethaltreq;
    bit clrresethaltreq;
    bit ndmreset;
    bit dmactive;

  `uvm_object_utils_begin(dmcontrol_t)
    `uvm_field_int(haltreq, UVM_DEFAULT)
    `uvm_field_int(resumereq, UVM_DEFAULT)
    `uvm_field_int(hartreset, UVM_DEFAULT)
    `uvm_field_int(ackhavereset, UVM_DEFAULT)
    `uvm_field_int(rsv_27, UVM_DEFAULT)
    `uvm_field_int(hasel, UVM_DEFAULT)
    `uvm_field_int(hartsello, UVM_DEFAULT)
    `uvm_field_int(hartselhi, UVM_DEFAULT)
    `uvm_field_int(rsv_5_4, UVM_DEFAULT)
    `uvm_field_int(setresethaltreq, UVM_DEFAULT)
    `uvm_field_int(clrresethaltreq, UVM_DEFAULT)
    `uvm_field_int(ndmreset, UVM_DEFAULT)
    `uvm_field_int(dmactive, UVM_DEFAULT)
  `uvm_object_utils_end

  `uvm_object_new
endclass


class dmstatus_t extends uvm_object;

    bit [8:0] rsv_31_23;
    bit impebreak;
    bit [1:0] rsv_21_20;
    bit allhavereset;
    bit anyhavereset;
    bit allresumeack;
    bit anyresumeack;
    bit allnonexistent;
    bit anynonexistent;
    bit allunavail;
    bit anyunavail;
    bit allrunning;
    bit anyrunning;
    bit allhalted;
    bit anyhalted;
    bit authenticated;
    bit authbusy;
    bit hasresethaltreq;
    bit confstrptrvalid;
    bit [3:0] version;
    

  `uvm_object_utils_begin(dmstatus_t)
    `uvm_field_int(rsv_31_23, UVM_DEFAULT)
    `uvm_field_int(impebreak, UVM_DEFAULT)
    `uvm_field_int(rsv_21_20, UVM_DEFAULT)
    `uvm_field_int(allhavereset, UVM_DEFAULT)
    `uvm_field_int(anyhavereset, UVM_DEFAULT)
    `uvm_field_int(allresumeack, UVM_DEFAULT)
    `uvm_field_int(anyresumeack, UVM_DEFAULT)
    `uvm_field_int(allnonexistent, UVM_DEFAULT)
    `uvm_field_int(anynonexistent, UVM_DEFAULT)
    `uvm_field_int(allunavail, UVM_DEFAULT)
    `uvm_field_int(anyunavail, UVM_DEFAULT)
    `uvm_field_int(allrunning, UVM_DEFAULT)
    `uvm_field_int(anyrunning, UVM_DEFAULT)
    `uvm_field_int(allhalted, UVM_DEFAULT)
    `uvm_field_int(anyhalted, UVM_DEFAULT)
    `uvm_field_int(authenticated, UVM_DEFAULT)
    `uvm_field_int(authbusy, UVM_DEFAULT)
    `uvm_field_int(hasresethaltreq, UVM_DEFAULT)
    `uvm_field_int(confstrptrvalid, UVM_DEFAULT)
    `uvm_field_int(version, UVM_DEFAULT)

  `uvm_object_utils_end

  `uvm_object_new
endclass

class dmabstractcs_t extends uvm_object;

    bit [2:0] rsv_31_29;
    bit [4:0] progbufsize;
    bit [10:0] rsv_23_13;
    bit busy;
    bit rsv_11;
    bit [2:0] cmderr;
    bit [3:0] rsv_7_4;
    bit [3:0] datacount;    

  `uvm_object_utils_begin(dmabstractcs_t)
    `uvm_field_int(rsv_31_29, UVM_DEFAULT)
    `uvm_field_int(progbufsize, UVM_DEFAULT)
    `uvm_field_int(rsv_23_13, UVM_DEFAULT)
    `uvm_field_int(busy, UVM_DEFAULT)
    `uvm_field_int(rsv_11, UVM_DEFAULT)
    `uvm_field_int(cmderr, UVM_DEFAULT)
    `uvm_field_int(rsv_7_4, UVM_DEFAULT)
    `uvm_field_int(datacount, UVM_DEFAULT)
  `uvm_object_utils_end

  `uvm_object_new

endclass

typedef enum bit [`DTM_ABITS-1:0] {

    DM_ABS_DATA_0 = `DTM_ABITS'b00100,
    DM_ABS_DATA_1 = `DTM_ABITS'h05,
    DM_ABS_DATA_2 = `DTM_ABITS'h06,
    DM_ABS_DATA_3 = `DTM_ABITS'h07,
    DM_ABS_DATA_4 = `DTM_ABITS'h08,
    DM_ABS_DATA_5 = `DTM_ABITS'h09,
    DM_ABS_DATA_6 = `DTM_ABITS'h0a,
    DM_ABS_DATA_7 = `DTM_ABITS'h0b,
    DM_ABS_DATA_8 = `DTM_ABITS'h0c,
    DM_ABS_DATA_9 = `DTM_ABITS'h0d,
    DM_ABS_DATA_10 = `DTM_ABITS'h0e,
    DM_ABS_DATA_11 = `DTM_ABITS'h0f,

    DM_DMCONTROL = `DTM_ABITS'h10,
    DM_DMSTATUS = `DTM_ABITS'h11,
    DM_HARTINFO = `DTM_ABITS'h12,

    DM_ABS_CS = `DTM_ABITS'h16,
    DM_ABS_CMD = `DTM_ABITS'h17,
    
    DM_SBUS_CS = `DTM_ABITS'h38,
    
    DM_SBUS_ADDR_0 = `DTM_ABITS'h39,
    DM_SBUS_ADDR_1 = `DTM_ABITS'h3a,
    DM_SBUS_ADDR_2 = `DTM_ABITS'h3b,
    DM_SBUS_ADDR_3 = `DTM_ABITS'h37,
    
    DM_SBUS_DATA_0 = `DTM_ABITS'h3c,
    DM_SBUS_DATA_1 = `DTM_ABITS'h3d,
    DM_SBUS_DATA_2 = `DTM_ABITS'h3e,
    DM_SBUS_DATA_3 = `DTM_ABITS'h3f

} DM_REG_e;

 typedef enum bit [4:0] {
    DTM_IDCODE = 5'h01,
    DTM_DTMCS = 5'h10,
    DTM_DMI = 5'h11,
    DTM_BYPASS = 5'h1f
 } DTM_JTAG_REG_e;


class `tc_name extends soft_base_test;

    tl_device_seq     device_seq[];
    jtag_env_pkg::jtag_env jtag_base_env;
    jtag_agent_pkg::jtag_dr_seq dr_seq;
    dtmcs_stat_t dtmcs;
    dmcontrol_t dmcontrol;
    dmstatus_t dmstatus;
    dmabstractcs_t dmabstractcs;
    virtual interface jtag_if v_jtag_if;

    ////spi_reg_sckmode_c spi_reg_sckmode;

    `uvm_component_utils(`tc_name)
    
    // Components
    function new(string name, uvm_component parent);
        super.new(name, parent);
        set_type_override_by_type(dv_lib_pkg::dv_base_env_cfg#(tlul_base_env_pkg::tlul_base_reg_block)::get_type(), `tc_name_cfg::get_type());
        set_type_override_by_type(tlul_base_env_cfg::get_type(), `tc_name_cfg::get_type());
        cfg = `tc_name_cfg::type_id::create("test_cfg", this);
        jtag_base_env = jtag_env_pkg::jtag_env::type_id::create("jtag_base_env", this);
        dr_seq = new("dr_seq");
        dmstatus = new("dmstatus");
        dtmcs = new("dtmcs");
        dmcontrol = new("dmcontrol");        
        dmabstractcs = new("dmabstractcs");
        ////uart_base_env = uart_env::type_id::create("uart_base_env", this);
        ////set_type_override_by_type(dv_base_scoreboard#(dv_base_reg_pkg::dv_base_reg_block,dv_base_env_cfg,dv_base_env_cov)::get_type(), spi_scoreboard::get_type());
    endfunction //new()

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
    //  Function: end_of_elaboration_phase
    extern function void end_of_elaboration_phase(uvm_phase phase);
    
    //  Function:
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
    v_jtag_if = this.jtag_base_env.m_jtag_agent.sequencer.cfg.vif;
endtask




virtual task select_tap(input int device_cnt = 0);
    automatic int device_info[];
    automatic bit [31:0] tdo_out;
    // reset for next ir scan
    this.v_jtag_if.goto_reset_state();
    this.v_jtag_if.goto_shift_ir();
    do begin
        this.v_jtag_if.shift_tdi_tdo(1'b1, tdo_out[0]);
        this.dr_seq.send_ir(this.jtag_base_env.m_jtag_agent.sequencer, 1, 1'b1);  // all idcode decode to 'h01
        tdo_out[31:0] ={tdo_out[30:0], this.dr_seq.rsp.dout[0]};
        // judge jtag chain have device 
        if(tdo_out[1:0] != 2'b10) begin
            device_cnt++;
        end
    end while(tdo_out[1:0] != 2'b11);
    `uvm_info("scan_jtag_chain", $sformatf("device_cnt: 'd%0d", device_cnt), UVM_NONE)
    // reset for next dr scan
    this.v_jtag_if.goto_reset_state();
endtask

virtual task scan_jtag_chain();
    automatic int device_cnt = 0;
    automatic int device_info[];
    automatic bit [31:0] tdo_out;
    // reset for next ir scan
    this.v_jtag_if.goto_reset_state();
    this.v_jtag_if.goto_shift_ir();
    do begin
        this.v_jtag_if.shift_tdi_tdo(1'b1, tdo_out[0]);
        this.dr_seq.send_ir(this.jtag_base_env.m_jtag_agent.sequencer, 1, 1'b1);  // all idcode decode to 'h01
        tdo_out[31:0] ={tdo_out[30:0], this.dr_seq.rsp.dout[0]};
        // judge jtag chain have device 
        if(tdo_out[1:0] != 2'b10) begin
            device_cnt++;
        end
    end while(tdo_out[1:0] != 2'b11);
    `uvm_info("scan_jtag_chain", $sformatf("device_cnt: 'd%0d", device_cnt), UVM_NONE)
    // reset for next dr scan
    this.v_jtag_if.goto_reset_state();
endtask


virtual task read_id_code();
    this.dr_seq.send_ir(this.jtag_base_env.m_jtag_agent.sequencer, 5, DTM_IDCODE);
    this.dr_seq.send_dr(this.jtag_base_env.m_jtag_agent.sequencer, 32, {32'h0000_0000});  // randomize value  IDCODE WIDTH is 32
    if(32'h20000913 != this.dr_seq.rsp.dout[31:0]) begin
        `uvm_error("read_id_code", $sformatf("%h not expect", this.dr_seq.rsp.dout))
    end
endtask


virtual task write_dtmcs();
   
    this.dr_seq.send_ir(this.jtag_base_env.m_jtag_agent.sequencer, 5, DTM_DTMCS);
    this.dr_seq.send_dr(this.jtag_base_env.m_jtag_agent.sequencer, 32, {14'h0, this.dtmcs.dmihardreset, this.dtmcs.dmireset, 1'b0, this.dtmcs.idle, this.dtmcs.dmistat, this.dtmcs.abits, this.dtmcs.version});  // randomize value  IDCODE WIDTH is 32

endtask

virtual task read_dtmcs();

    automatic int unsigned data_array[];
    automatic bit [6:0] abits = `DTM_ABITS;
    automatic bit [2:0] idle = `DTM_IDLE_DELAY_CYCLE;
    this.dr_seq.send_ir(this.jtag_base_env.m_jtag_agent.sequencer, 5, DTM_DTMCS);
    this.dr_seq.send_dr(this.jtag_base_env.m_jtag_agent.sequencer, 32, {32'h0000_0000});  // randomize value  IDCODE WIDTH is 32
    if({14'h0, 1'b0, 1'b0, 1'b0, idle[2:0], 2'b0, abits[5:0], 4'b1} != this.dr_seq.rsp.dout[31:0]) begin
        `uvm_error("read_dtmcs", $sformatf("%h not expect", this.dr_seq.rsp.dout))
    end
    // data_array = new[4];
    // for ( int i = 0; i < 4; i++ ) begin
    //     data_array[i] = this.dr_seq.rsp.dout[(i*8)+:8];
    // end
    data_array = new[1];
    data_array[0] = this.dr_seq.rsp.dout[31:0];
    void'(this.dtmcs.unpack_ints(data_array));
    `uvm_info(`gfn, $sformatf("read_dtmcs:\n%0s", this.dtmcs.sprint()), UVM_LOW)
    // this.dtmcs.dmihardreset = this.dr_seq.rsp.dout[17];
    // this.dtmcs.dmireset = this.dr_seq.rsp.dout[16];
    // this.dtmcs.idle = this.dr_seq.rsp.dout[14:12];
    // this.dtmcs.dmistat = this.dr_seq.rsp.dout[11:10];
    // this.dtmcs.abits = this.dr_seq.rsp.dout[9:4];
    // this.dtmcs.version = this.dr_seq.rsp.dout[3:0];

endtask


virtual task dmi_write(bit [`DTM_ABITS-1:0] address, input bit [31:0] data);
    automatic int check_timeout = 0;
    // 执行DMI写操作
    this.dr_seq.send_ir(this.jtag_base_env.m_jtag_agent.sequencer, 5, DTM_DMI);
    this.dr_seq.send_dr(this.jtag_base_env.m_jtag_agent.sequencer, `DTM_ABITS + 34, {address[`DTM_ABITS-1:0], data[31:0], 2'h2});

    // 等待写操作完成并检查状态
    do begin
        if(check_timeout++ > 5) begin
            `uvm_fatal("dmi_write", $sformatf("timeout,address 'h%0h, data 'h%0h: dmistat %h not expect", address, data, this.dtmcs.dmistat))
        end
        this.read_dtmcs();
    end while(this.dtmcs.dmistat == 2'h3); // repeat try once

    if(this.dtmcs.dmistat != 2'h0) begin
        `uvm_error("dmi_write", $sformatf("address 'h%0h, data 'h%0h: dmistat %h not expect", address, data, this.dtmcs.dmistat))
        this.write_dtmcs();
    end
    else begin
        `uvm_info("dmi_write", $sformatf("address 'h%0h, data 'h%0h: success", address, data), UVM_LOW)
    end
endtask

virtual task dmi_read(bit [`DTM_ABITS-1:0] address, output bit [31:0] data);
    automatic int check_timeout = 0;
    // 执行DMI读操作
    this.dr_seq.send_ir(this.jtag_base_env.m_jtag_agent.sequencer, 5, DTM_DMI);
    // read dr more time , wait data flush complete
    this.dr_seq.send_dr(this.jtag_base_env.m_jtag_agent.sequencer, `DTM_ABITS + 34, {address[`DTM_ABITS-1:0], 32'h0, 2'h1});
    //data[31:0] = this.dr_seq.rsp.dout[33:2];
    this.dr_seq.send_dr(this.jtag_base_env.m_jtag_agent.sequencer, `DTM_ABITS + 34, {address[`DTM_ABITS-1:0], 32'h0, 2'h1});
    data[31:0] = this.dr_seq.rsp.dout[33:2];
    // this.dr_seq.send_dr(this.jtag_base_env.m_jtag_agent.sequencer, `DTM_ABITS + 34, {address[`DTM_ABITS-1:0], 32'h0, 2'h1});
    // data[31:0] = this.dr_seq.rsp.dout[33:2];
    // 等待读操作完成并检查状态
    do begin
        if(check_timeout++ > 5) begin
            `uvm_fatal("dmi_read", $sformatf("timeout,address 'h%0h, data 'h%0h: dmistat %h not expect", address, data, this.dtmcs.dmistat))
        end
        this.read_dtmcs();
    end while(this.dtmcs.dmistat == 2'h3); // repeat try once

    if(this.dtmcs.dmistat != 2'h0) begin
        `uvm_error("dmi_read", $sformatf("address 'h%0h, data 'h%0h: dmistat %h not expect", address, data, this.dtmcs.dmistat))
        // clear status
        this.dtmcs.dmireset = 1'b1;
        this.write_dtmcs();
    end
    else begin
        `uvm_info("dmi_read", $sformatf("address 'h%0h, data 'h%0h: success", address, data), UVM_LOW)
    end
endtask


virtual task read_dmabstractcs();
    automatic bit [31:0] data;
    automatic int unsigned data_array[];
    dmi_read(DM_ABS_CS, data);
    data_array = new[1];
    data_array[0] = data[31:0];
    void'(this.dmabstractcs.unpack_ints(data_array));
    
    `uvm_info(`gfn, $sformatf("dmabstractcs:\n%0s", this.dmabstractcs.sprint()), UVM_LOW)

endtask


virtual task write_dmabstract_cmd(bit [7:0] cmdtype, bit [23:0] control);
    automatic bit [31:0] data;
    automatic int unsigned data_array[];
    data_array = new[1];
    data_array[0] = {cmdtype, control};
    dmi_write(DM_ABS_CMD, data_array[0]);
    
    `uvm_info(`gfn, $sformatf("write_dmabstract_cmd: 'h%0h, 'h%0h", cmdtype, control), UVM_LOW)

endtask

virtual task access_hart_reg(bit [2:0] aarsize, bit aarpostincrement, bit postexec, bit transfer, bit write, bit [15:0] regno);

    write_dmabstract_cmd(8'h0, {1'b0, aarsize, aarpostincrement, postexec, transfer, write, regno});
    
    `uvm_info(`gfn, $sformatf("access_hart_reg: 'h%0h, 'h%0h, 'h%0h, 'h%0h, 'h%0h, 'h%0h", aarsize, aarpostincrement, postexec, transfer, write, regno), UVM_LOW)

endtask

virtual task access_hart_mem(bit aamvirtual, bit [2:0] aamsize, bit aampostincrement, bit write, bit [1:0] target_specific);

    write_dmabstract_cmd(8'h2, {aamvirtual, aamsize, aampostincrement, 2'b0, write, target_specific, 14'h0});
    
    `uvm_info(`gfn, $sformatf("access_hart_mem: 'h%0h, 'h%0h, 'h%0h, 'h%0h, 'h%0h", aamvirtual, aamsize, aampostincrement, write, target_specific), UVM_LOW)

endtask

virtual task execute_progbuf();

    write_dmabstract_cmd(8'h1, 24'h0);
    
    `uvm_info(`gfn, $sformatf("execute_progbuf"), UVM_LOW)

endtask


virtual task read_dmcontrol();
    automatic bit [31:0] data;
    automatic int unsigned data_array[];
    dmi_read(DM_DMCONTROL, data);
    data_array = new[1];
    data_array[0] = data[31:0];
    void'(this.dmcontrol.unpack_ints(data_array));
    
    `uvm_info(`gfn, $sformatf("read_dmcontrol:\n%0s", this.dmcontrol.sprint()), UVM_LOW)

endtask


virtual task write_dmcontrol();
    automatic int unsigned data_array[];
    data_array = new[1];
    void'(this.dmcontrol.pack_ints(data_array));
    dmi_write(DM_DMCONTROL, data_array[0]);
    
    `uvm_info(`gfn, $sformatf("write_dmcontrol:\n%0s", this.dmcontrol.sprint()), UVM_LOW)

endtask

virtual task read_dmstatus();
    automatic bit [31:0] data;
    automatic int unsigned data_array[];
    dmi_read(DM_DMSTATUS, data);
    // data_array = new[4];
    // for ( int i = 0; i < 4; i++ ) begin
    //     data_array[i] = data[(i*8)+:8];
    // end
    data_array = new[1];
    data_array[0] = data[31:0];
    void'(this.dmstatus.unpack_ints(data_array));
    `uvm_info(`gfn, $sformatf("read_dmstatus:\n%0s", this.dmstatus.sprint()), UVM_LOW)

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
    jtag_base_env.cfg.idle_delay_cycle = 5;  // for dtmcs
    uvm_top.print_topology();
endfunction: end_of_elaboration_phase


task `tc_name::run_phase(uvm_phase phase);
    
    super.run_phase(phase); // donnot delete for axi slave vip sequence run

endtask

task `tc_name::main_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    // wait dtm rst
    // wait cpu running 
    #3000ns;
    foreach(env.virtual_sequencer.sqr_q[i]) begin
        foreach(env.virtual_sequencer.sqr_q[i][j]) begin
            `uvm_info(get_type_name(), $sformatf("check sequencer type %0s for port_name %0s", i, j), UVM_NONE)
        end
    end

    begin
        scan_jtag_chain();
    end

    begin 
        read_id_code();
        //#5000ns;
        read_dtmcs();
        //#5000ns;
    end


    begin
        read_dmcontrol();
        //#5000ns;
        read_dmstatus();
        //#5000ns;
    end



    begin
        // halt all cpu
        this.dmcontrol.haltreq = 1'b1;
        this.dmcontrol.hasel = 1'b0;
        this.dmcontrol.hartsello = 10'b0;
        this.dmcontrol.dmactive = 1'b1; // must be 1 for debug
        this.write_dmcontrol();
        #5us;
        this.write_dmcontrol();
    end

    begin
        // test abstract cmd
        this.read_dmabstractcs();
        this.access_hart_reg(2/*aarsize*/, 1/*aarpostincrement*/, 0/*postexec*/, 1/*transfer*/, 1/*write*/, 0/*regno*/);
        this.access_hart_mem(0/*aamvirtual*/, 2/*aamsize*/, 1/*aampostincrement*/, 1/*write*/, 2'b0/*target_specific*/);
        this.execute_progbuf();
    end


    phase.drop_objection(this);
    //$finish;
endtask: main_phase


`undef tc_name
`undef tc_name_cfg
