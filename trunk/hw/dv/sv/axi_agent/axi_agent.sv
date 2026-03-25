

class axi_agent extends uvm_agent;
    `uvm_component_utils(axi_agent)

    // Components
    axi_m_driver drv;
    axi_s_driver #(.REQ_T(axi_transaction)) s_drv;
    axi_s_monitor mon;
    axi_agent_cfg cfg;
    uvm_sequencer#(uvm_sequence_item) w_seqr;
    uvm_sequencer#(uvm_sequence_item) r_seqr;
    uvm_sequencer#(uvm_sequence_item) slv_seqr;
    uvm_analysis_port#(uvm_sequence_item) ap;

    // 
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction //new()

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
    //  Function: connect_phase
    extern function void connect_phase(uvm_phase phase);
    
endclass //axi_agent extends uvm_env

function void axi_agent::build_phase(uvm_phase phase);
    /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
    /*  For more information see UVM Cookbook v1800.2 p.503  */
    ap = new("ap", this);
    if((cfg.work_mode == dv_utils_pkg::ONLY_MONITOR)) begin
        mon = axi_s_monitor::type_id::create("mon", this);
    end
    else if((cfg.work_mode == dv_utils_pkg::MASTER)) begin
        drv = axi_m_driver::type_id::create("mst", this);
        mon = axi_s_monitor::type_id::create("mon", this);
        w_seqr = uvm_sequencer#(uvm_sequence_item)::type_id::create("w_seqr", this);
        r_seqr = uvm_sequencer#(uvm_sequence_item)::type_id::create("r_seqr", this);
        `uvm_info(get_type_name(), $sformatf("create driver and monitor, the work mode is %s", cfg.work_mode.name()), UVM_NONE);
    end
    else if((cfg.work_mode == dv_utils_pkg::SLAVE)) begin
        s_drv = axi_s_driver #(.REQ_T(axi_transaction))::type_id::create("slv", this);
        slv_seqr = uvm_sequencer#(uvm_sequence_item)::type_id::create("slv_seqr", this);
        mon = axi_s_monitor::type_id::create("mon", this);
    end
    else if(cfg.work_mode == dv_utils_pkg::MASTER_NO_MONITOR) begin
        drv = axi_m_driver::type_id::create("mst", this);
        w_seqr = uvm_sequencer#(uvm_sequence_item)::type_id::create("w_seqr", this);
        r_seqr = uvm_sequencer#(uvm_sequence_item)::type_id::create("r_seqr", this);
    end
    else if(cfg.work_mode == dv_utils_pkg::SLAVE_NO_MONITOR) begin
        s_drv = axi_s_driver #(.REQ_T(axi_transaction))::type_id::create("slv", this);
    end
    else begin
        `uvm_fatal(get_type_name(), $sformatf("the work mode %d is illegal", cfg.work_mode));
    end

    //scb   = axi_scoreboard::type_id::create("scb", this);
endfunction: build_phase

function void axi_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //`uvm_info(get_type_name(), $sformatf("create driver and monitor, the work mode is %s", cfg.work_mode.name()), UVM_NONE);
    //uvm_top.print_topology();
    if((cfg.work_mode == dv_utils_pkg::MASTER) || (cfg.work_mode == dv_utils_pkg::MASTER_NO_MONITOR)) begin
        drv.seq_item_port.connect(w_seqr.seq_item_export);
        drv.seq_item_port2.connect(r_seqr.seq_item_export);
    end
    ap = mon.ap;
endfunction: connect_phase

