class axi_s_monitor extends uvm_monitor;
    `uvm_component_utils(axi_s_monitor)

    // Components
    uvm_analysis_port#(uvm_sequence_item) ap;
    virtual axi_interface VIF;
    virtual axi_interface.SMON vif;
    // variables
    axi_transaction w_trans, r_trans;
    bit w_done, r_done;
    int unsigned b_size;
    int unsigned no_bytes_by_data_width;
    
    // Methods
    extern task run_mon(uvm_phase phase);
    extern task write_monitor();
    extern task read_monitor();

    function new(string name, uvm_component parent);
        super.new(name, parent);
        w_done = 1;
        r_done = 1;
        
        no_bytes_by_data_width = MAX_DATA_WIDTH/8;
    endfunction //new()

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    //  Function: run_phase
    extern task run_phase(uvm_phase phase);
    
endclass //axi_s_monitor extends uvm_monitor

function void axi_s_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);
    ap = new("ap", this);
endfunction: build_phase

function void axi_s_monitor::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    assert (uvm_config_db#(virtual axi_interface)::get(this, "", "vif", VIF)) begin
        `uvm_info(get_type_name(), "vif has been found in ConfigDB.", UVM_LOW);
        vif = VIF.SMON;
    end else begin
        //`uvm_fatal(get_type_name(), "vif cannot be found in ConfigDB!");
    end
endfunction: connect_phase

task axi_s_monitor::run_phase(uvm_phase phase);
    forever begin
        run_mon(phase);
        @(vif.mon_cb);
    end
endtask: run_phase

task axi_s_monitor::run_mon(uvm_phase phase);
    fork
        if(w_done) begin
            //phase.raise_objection(this);
            w_done = 0;
            write_monitor();
            w_done = 1;
            //phase.drop_objection(this);
        end
        if(r_done) begin
            //phase.raise_objection(this);
            r_done = 0;
            read_monitor();
            r_done = 1;
            //phase.drop_objection(this);
        end
        
    join_none
endtask: run_mon

task axi_s_monitor::write_monitor();
    w_trans         = axi_transaction::type_id::create("w_trans");
    fork
        begin
            while((vif.mon_cb.AWVALID !== 1) || (vif.mon_cb.AWREADY !== 1))begin
                @(vif.mon_cb);
            end
            w_trans.addr=vif.mon_cb.AWADDR;
            w_trans.id      = vif.mon_cb.AWID;
            w_trans.b_size  = vif.mon_cb.AWSIZE;
            w_trans.b_len   = vif.mon_cb.AWLEN;
            w_trans.b_type  = axi_burst_type_e'(vif.mon_cb.AWBURST);
            w_trans.dir = axi_dec_pkg::Write;
        end

        begin
            //w_trans.data    = new [w_trans.b_len+1];
            for (int unsigned i=0; i<w_trans.b_len+1; i++) begin
                while((vif.mon_cb.WVALID !== 1) || (vif.mon_cb.WREADY !== 1))begin
                    @(vif.mon_cb);
                end
                w_trans.data[i] = new [no_bytes_by_data_width];
                w_trans.wstrb[i] = new [no_bytes_by_data_width];
                for (int unsigned j=0; j<no_bytes_by_data_width; j++) begin
                    w_trans.data[i][j]=vif.mon_cb.WDATA[8*j+:8];
                    w_trans.wstrb[i][j]=vif.mon_cb.WSTRB[j];
                end
                @(vif.mon_cb);
            end
        end
    join
    while(vif.mon_cb.BVALID !== 1)begin
        @(vif.mon_cb);
    end
    w_trans.b_resp = vif.mon_cb.BRESP;
    `uvm_info("SMON", $sformatf("WTRANS %s", w_trans.convert2string()), UVM_HIGH);
    ap.write(w_trans);
endtask: write_monitor

task axi_s_monitor::read_monitor();
    while((vif.mon_cb.ARVALID !== 1) || (vif.mon_cb.ARREADY !== 1))begin
        @(vif.mon_cb);
    end
        r_trans         = axi_transaction::type_id::create("r_trans");
        r_trans.addr    = vif.mon_cb.ARADDR;
        r_trans.id      = vif.mon_cb.ARID;
        r_trans.b_size  = vif.mon_cb.ARSIZE;
        r_trans.b_len   = vif.mon_cb.ARLEN;
        r_trans.b_type  = axi_burst_type_e'(vif.mon_cb.ARBURST);
        //r_trans.data    = new [r_trans.b_len+1];
        r_trans.r_resp  = new [r_trans.b_len+1];
        r_trans.dir = axi_dec_pkg::Read;
        for (int unsigned i=0; i<r_trans.b_len+1; i++) begin
            while((vif.mon_cb.RVALID !== 1) || (vif.mon_cb.RREADY !== 1))begin
                @(vif.mon_cb);
            end
            r_trans.data[i] = new [no_bytes_by_data_width];
            for (int unsigned j=0; j<no_bytes_by_data_width; j++) begin
                r_trans.data[i][j]=vif.mon_cb.RDATA[8*j+:8];
            end
            r_trans.r_resp[i] = vif.mon_cb.RRESP;
            @(vif.mon_cb);
        end
        ap.write(r_trans);
        `uvm_info("SMON", $sformatf("RTRANS %s", r_trans.convert2string()), UVM_HIGH)
endtask: read_monitor
