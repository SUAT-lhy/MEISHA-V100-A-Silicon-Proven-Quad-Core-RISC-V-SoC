`define tc_name spi_slave_soft_base_test
`define tc_name_cfg spi_slave_soft_base_test_cfg

class `tc_name_cfg extends soft_base_test_cfg;

    `uvm_object_utils(`tc_name_cfg)

    `uvm_object_new

    virtual spi_slave_if spi_slave_if;

  virtual function void initialize(bit [TL_AW-1:0] csr_base_addr = '1);
    super.initialize(csr_base_addr);  // need override tlul_base_test config
    assert(uvm_hdl_force("tb.ddr_external_loopback_en", 0));
  endfunction

  function void pre_randomize();
    super.pre_randomize();
    
  endfunction

  function void post_randomize();
    super.post_randomize();
    
  endfunction

endclass

  `define SPI_STD     2'b00
  `define SPI_QUAD_TX 2'b01
  `define SPI_QUAD_RX 2'b10

  `define SPI_SEMIPERIOD      50ns    //10Mhz SPI CLK

  `define DELAY_BETWEEN_SPI   100ns


class `tc_name extends soft_base_test;

    tl_device_seq     device_seq[];
    logic [31:0] data = 0;
    logic [31:0] s_data;
    logic [63:0] stimuli [99:0];
    logic [31:0] addr;
    // spi_device_env_pkg::spi_device_env spi_slave_base_env;

    `uvm_component_utils(`tc_name)
    
    // Components
    function new(string name, uvm_component parent);
        super.new(name, parent);
        set_type_override_by_type(dv_lib_pkg::dv_base_env_cfg#(tlul_base_env_pkg::tlul_base_reg_block)::get_type(), `tc_name_cfg::get_type());
        set_type_override_by_type(tlul_base_env_cfg::get_type(), `tc_name_cfg::get_type());
        cfg = `tc_name_cfg::type_id::create("test_cfg", this);
        // spi_slave_base_env = spi_device_env_pkg::spi_device_env::type_id::create("spi_slave_base_env", this);
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


virtual task spi_send_cmd_addr(input use_qspi, input [7:0] command, input [31:0] addr);
    // send command
    if (use_qspi)
    begin
        for (int i = 2; i > 0; i--)
        begin
            cfg.spi_slave_if.spi_sdo[3] = command[4*i-1];
            cfg.spi_slave_if.spi_sdo[2] = command[4*i-2];
            cfg.spi_slave_if.spi_sdo[1] = command[4*i-3];
            cfg.spi_slave_if.spi_sdo[0] = command[4*i-4];
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
        end
    end
    else begin
        for (int i = 7; i >= 0; i--)
        begin
            cfg.spi_slave_if.spi_sdo[0] = command[i];
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
        end
    end

    // send address
    if (use_qspi)
    begin
        for (int i = 8; i > 0; i--) 
        begin
            cfg.spi_slave_if.spi_sdo[3] = addr[4*i-1];
            cfg.spi_slave_if.spi_sdo[2] = addr[4*i-2];
            cfg.spi_slave_if.spi_sdo[1] = addr[4*i-3];
            cfg.spi_slave_if.spi_sdo[0] = addr[4*i-4];
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
        end
    end
    else begin
        for (int i = 31; i >= 0; i--) 
        begin
            cfg.spi_slave_if.spi_sdo[0] = addr[i];
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
        end
    end
endtask

virtual task spi_send_data(input use_qspi, input [31:0] data);
    if (use_qspi)
    begin
        for (int i = 8; i > 0; i--)
        begin
            cfg.spi_slave_if.spi_sdo[3] = data[4*i-1];
            cfg.spi_slave_if.spi_sdo[2] = data[4*i-2];
            cfg.spi_slave_if.spi_sdo[1] = data[4*i-3];
            cfg.spi_slave_if.spi_sdo[0] = data[4*i-4];
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
        end
    end
    else begin
        for (int i = 31; i >= 0; i--) 
        begin
            cfg.spi_slave_if.spi_sdo[0] = data[i];
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
        end
    end
endtask

virtual task spi_recv_data(input use_qspi, output [31:0] data);
    if (use_qspi)
    begin
        for (int i = 8; i > 0; i--)
        begin           
            data[4*i-1] = cfg.spi_slave_if.spi_sdi[3];
            data[4*i-2] = cfg.spi_slave_if.spi_sdi[2];
            data[4*i-3] = cfg.spi_slave_if.spi_sdi[1];
            data[4*i-4] = cfg.spi_slave_if.spi_sdi[0];
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
        end
    end
    else begin
        for (int i = 31; i >= 0; i--)
        begin
            data[i] = cfg.spi_slave_if.spi_sdi[0];
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
        end
    end
endtask

virtual task spi_load(input use_qspi);
    int num_stim = 0;   // counters for statistics

    logic        more_stim = 1;
    logic [31:0] spi_data;
    logic [31:0] spi_data_recv;
    logic [31:0] spi_addr;
    logic [31:0] spi_addr_old;

    $readmemh("/home/autumn/test_new_meisha/spi_slave/MEISHAV100/trunk/hw/d2dv100_top/dv/ip_test/spi_slave/spi_stim.txt", stimuli);  //  read in the stimuli vectors  == address_value
    spi_addr = stimuli[num_stim][63:32]; // assign address
    spi_data = stimuli[num_stim][31:0];  // assign data

    $display("Runnig spi load");
    $display("[SPI] Loading Instruction RAM");
    cfg.spi_slave_if.spi_csn = 1'b0;
    #100 spi_send_cmd_addr(use_qspi, 8'h2, spi_addr);
    spi_addr_old = spi_addr - 32'h4;

    while (more_stim)
    begin
        spi_addr = stimuli[num_stim][63:32]; 
        spi_data = stimuli[num_stim][31:0];

        if (spi_addr != spi_addr_old + 32'h4)
        begin
            $display("[SPI] Prev address %h current address %h", spi_addr_old, spi_addr);
            $display("[SPI] Loading Data RAM");
            #100 cfg.spi_slave_if.spi_csn  = 1'b1;
            #`DELAY_BETWEEN_SPI;
            cfg.spi_slave_if.spi_csn  = 1'b0;
            #100  spi_send_cmd_addr(use_qspi, 8'h2, spi_addr);
        end

        spi_send_data(use_qspi, spi_data[31:0]);

        num_stim = num_stim + 1;
        spi_addr_old = spi_addr;
        if (num_stim > 99 | stimuli[num_stim] === 64'bx)
            more_stim = 0;
    end
    #100 cfg.spi_slave_if.spi_csn = 1'b1;
    #`DELAY_BETWEEN_SPI;
endtask

virtual task spi_check(input use_qspi);
    int num_stim = 0;   // counters for statistics

    logic        more_stim = 1;
    logic [31:0] spi_data;
    logic [31:0] spi_data_recv;
    logic [31:0] spi_addr;
    logic [31:0] spi_addr_old;
    
    spi_addr = stimuli[num_stim][63:32]; // assign address
    spi_data = stimuli[num_stim][31:0];  // assign data

    $display("Runnig spi check");
    $display("[SPI] Loading Instruction RAM");
    cfg.spi_slave_if.spi_csn = 1'b0;
    #100 spi_send_cmd_addr(use_qspi, 8'hB, spi_addr);
    spi_addr_old = spi_addr - 32'h4;

    // dummy cycles
    for (int i = 32; i >= 0; i--)
    begin
        #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
        #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
    end

    while (more_stim)
    begin
        spi_addr = stimuli[num_stim][63:32];
        spi_data = stimuli[num_stim][31:0];

        if (spi_addr != spi_addr_old + 32'h4)
        begin
            $display("[SPI] Prev address %h current address %h", spi_addr_old, spi_addr);
            $display("[SPI] Checking Data RAM");
            #100 cfg.spi_slave_if.spi_csn  = 1'b1;
            #`DELAY_BETWEEN_SPI;
            cfg.spi_slave_if.spi_csn  = 1'b0;
            #100  spi_send_cmd_addr(use_qspi, 8'hB, spi_addr);

            // dummy cycles
            for (int i = 32; i >= 0; i--)
            begin
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
            end
        end
        spi_recv_data(use_qspi, spi_data_recv[31:0]);

        if (spi_data_recv != spi_data)
            `uvm_error(`gfn, $sformatf("SPI read data is %h, but the actual data is %h", spi_data_recv, spi_data))
        
        num_stim = num_stim + 1;
        spi_addr_old = spi_addr;
        if (num_stim > 99 | stimuli[num_stim]===64'bx)
            more_stim = 0;
    end
    #100 cfg.spi_slave_if.spi_csn = 1'b1;
    #`DELAY_BETWEEN_SPI;
endtask

virtual task spi_write_reg(input use_qspi, input [7:0] command, input [7:0] reg_val);
    begin
        cfg.spi_slave_if.spi_csn = 1'b0;
        #100;
        // send command
        if (use_qspi)
        begin
            for (int i = 2; i > 0; i--)
            begin
                cfg.spi_slave_if.spi_sdo[3] = command[4*i-1];
                cfg.spi_slave_if.spi_sdo[2] = command[4*i-2];
                cfg.spi_slave_if.spi_sdo[1] = command[4*i-3];
                cfg.spi_slave_if.spi_sdo[0] = command[4*i-4];
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
            end
        end
        else begin
            for (int i = 7; i >= 0; i--)
            begin
                cfg.spi_slave_if.spi_sdo[0] = command[i];
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
            end
        end

        // send reg_val
        if (use_qspi)
        begin
            for (int i = 2; i > 0; i--)
            begin
                cfg.spi_slave_if.spi_sdo[3] = reg_val[4*i-1];
                cfg.spi_slave_if.spi_sdo[2] = reg_val[4*i-2];
                cfg.spi_slave_if.spi_sdo[1] = reg_val[4*i-3];
                cfg.spi_slave_if.spi_sdo[0] = reg_val[4*i-4];
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
            end
        end
        else begin
            for (int i = 7; i >= 0; i--) 
            begin
                cfg.spi_slave_if.spi_sdo[0] = reg_val[i];
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1;
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 0;
            end
        end
        #100 cfg.spi_slave_if.spi_csn = 1'b1;
        #`DELAY_BETWEEN_SPI;
    end
endtask

virtual task spi_write_word(input use_qspi, input [31:0] addr, input [31:0] data);
    cfg.spi_slave_if.spi_csn = 1'b0;
    #`DELAY_BETWEEN_SPI;
    spi_send_cmd_addr(use_qspi, 8'h2, addr);
    spi_send_data(use_qspi, data);
    #100 cfg.spi_slave_if.spi_csn = 1'b1;
    #`DELAY_BETWEEN_SPI;
endtask

virtual task spi_read_nword(input use_qspi, input [31:0] addr, input int n, inout [31:0] data[]);
    logic [7:0] command;

    command = 8'hB;
    cfg.spi_slave_if.spi_clk = 1'b0;
    #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
    #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
    cfg.spi_slave_if.spi_csn = 1'b0;
    #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
    #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
    // send command
    if (use_qspi)
    begin
        for (int i = 2 ; i > 0; i--)
        begin
            cfg.spi_slave_if.spi_sdo[3] = command[4*i-1];
            cfg.spi_slave_if.spi_sdo[2] = command[4*i-2];
            cfg.spi_slave_if.spi_sdo[1] = command[4*i-3];
            cfg.spi_slave_if.spi_sdo[0] = command[4*i-4];
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b1;
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
        end
    end
    else begin
        for (int i = 7; i >=0; i--)
        begin
            cfg.spi_slave_if.spi_sdo[0] = command[i];
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b1;
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
        end
    end

    // send addr
    if (use_qspi)
    begin
        for (int i = 8; i > 0; i--)
        begin
            cfg.spi_slave_if.spi_sdo[3] = addr[4*i-1];
            cfg.spi_slave_if.spi_sdo[2] = addr[4*i-2];
            cfg.spi_slave_if.spi_sdo[1] = addr[4*i-3];
            cfg.spi_slave_if.spi_sdo[0] = addr[4*i-4];
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b1;
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
        end
    end
    else begin
        for (int i = 31; i >= 0; i--) 
        begin
            cfg.spi_slave_if.spi_sdo[0] = addr[i];
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b1;
            #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
        end
    end

    for (int i = 32; i >= 0; i--)
    begin
        #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b1;
        #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
    end
    if (use_qspi)
    begin
        for (int j = 0; j < n; j++)
        begin
            for (int i = 8; i > 0; i--)
            begin
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b1;
                data[j][4*i-1] = cfg.spi_slave_if.spi_sdi[3];
                data[j][4*i-2] = cfg.spi_slave_if.spi_sdi[2];
                data[j][4*i-3] = cfg.spi_slave_if.spi_sdi[1];
                data[j][4*i-4] = cfg.spi_slave_if.spi_sdi[0];
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
            end
        end
    end
    else begin
        for (int j = 0; j < n; j++)
        begin
            for (int i = 31; i >= 0; i--)
            begin
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b1;
                data[j][i] = cfg.spi_slave_if.spi_sdi[0];
                #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
            end
        end
    end

    #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
    #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
    cfg.spi_slave_if.spi_csn = 1'b1;
    #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
    #`SPI_SEMIPERIOD cfg.spi_slave_if.spi_clk = 1'b0;
endtask

virtual task spi_read_word(input use_qspi, input [31:0] addr, output [31:0] data);
    logic [31:0] tmp[1];
    spi_read_nword(use_qspi, addr, 1, tmp);
    data = tmp[0];
endtask

virtual task spi_write_halfword(input use_qspi, input [31:0] addr, input [15:0] data);
    logic [31:0] tmp;
    spi_read_word(use_qspi, {addr[31:2], 2'b00}, tmp);

    case (addr[1])
        1'b0: tmp[15:0] = data[15:0];
        1'b1: tmp[31:16] = data[15:0];
    endcase

    spi_write_word(use_qspi, {addr[31:2], 2'b00}, tmp);
endtask

virtual task spi_write_byte(input use_qspi, input [31:0] addr, input [7:0] data);
    logic [31:0] tmp;

    spi_read_word(use_qspi, {addr[31:2], 2'b00}, tmp);

    case (addr[1:0])
        2'b00: tmp[7:0]   = data[7:0];
        2'b01: tmp[15:8]  = data[7:0];
        2'b10: tmp[23:16] = data[7:0];
        2'b11: tmp[31:24] = data[7:0];
    endcase

    spi_write_word(use_qspi, {addr[31:2], 2'b00}, tmp);
endtask

virtual task spi_read_halfword(input use_qspi, input [31:0] addr, output [15:0] data);
    logic [31:0] tmp;

    spi_read_word(use_qspi, {addr, 2'b00}, tmp);

    case (addr[1])
        1'b0: data[15:0]  = tmp[15:0];
        1'b1: data[15:0] = tmp[31:16]; 
    endcase
endtask 

virtual task spi_read_byte(input use_qspi, input [31:0] addr, output [7:0] data);
    logic [31:0] tmp;
    
    spi_read_word(use_qspi, {addr[31:2], 2'b00}, tmp);

    case (addr[1:0])
        2'b00: data[7:0] = tmp[7:0]; 
        2'b01: data[7:0] = tmp[15:8];
        2'b10: data[7:0] = tmp[23:16];
        2'b11: data[7:0] = tmp[31:24];
    endcase
endtask

virtual task spi_enable_qspi();
    $display("[SPI] Enabling QSPI mode");

    spi_write_reg(1'b0, 8'h1, 8'h1);
endtask

virtual task spi_check_return_codes(input use_qspi, output exit_code);
    logic [31:0] recv_data;

    spi_read_word(use_qspi, 32'h1A10_7014, recv_data);
    if (recv_data != '0) begin
        exit_code = 0;
        $display("[SPI] Test FAILED!");
    end
    else begin
        exit_code = 1;
        $display("[SPI] Test SUCCESS!");
    end
endtask

endclass //extends uvm_test

function void `tc_name::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual spi_slave_if)::get(this, "", "spi_slave_if", cfg.spi_slave_if)) begin
        `uvm_fatal(get_full_name(), "failed to get spi_slave_if from uvm_config_db")
    end
    ////env.cfg = cfg;
endfunction: build_phase

function void `tc_name::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
endfunction: end_of_elaboration_phase


task `tc_name::run_phase(uvm_phase phase);
    
    super.run_phase(phase); // donnot delete for axi slave vip sequence run

endtask

task `tc_name::main_phase(uvm_phase phase);
    //super.run_phase(phase);
    
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
        addr = 32'h0000_0000;
        spi_enable_qspi();
        
        // spi_load(1'b1);
        // spi_check(1'b1);
        for (int i = 0; i < 10; i++)
        begin
            s_data = $random;
            spi_write_word(1'b1, addr, s_data);
            spi_read_word(1'b1, addr, data);
            `uvm_info(`gfn, $sformatf("addr is: %h, except: %h, but read: %h", addr, s_data, data), UVM_NONE)
            if (data != s_data)
                `uvm_error(`gfn, $sformatf("except: %h, but read: %h", s_data, data))
            addr += 32'h4;
        end
        // spi_write_word(1'b1, 32'h8000_0000, 32'h7558_8251);
        // spi_read_word(1'b1, 32'h8000_0000, data);
        // spi_write_word(1'b1, 32'h8000_2000, 32'h2132_6258);
        // spi_read_word(1'b1, 32'h8000_2000, data);
        // $display("[SPI] read data is %h", data);
    end

    phase.drop_objection(this);
    //$finish;
endtask: main_phase


`undef tc_name
`undef tc_name_cfg
