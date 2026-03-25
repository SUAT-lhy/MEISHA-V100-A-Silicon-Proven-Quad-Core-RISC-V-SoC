class axi_m_driver extends uvm_driver#(uvm_sequence_item);
    `uvm_component_utils(axi_m_driver)
    
    // Components
    virtual axi_interface VIF;
    virtual axi_interface.MDRV vif;
    uvm_seq_item_pull_port#(uvm_sequence_item, uvm_sequence_item) seq_item_port2;

    // Variables
    axi_transaction w_trans, r_trans;
    uvm_sequence_item w_trans_temp, r_trans_temp;
    bit w_done, r_done;
    bit [256-1:0] temp [];
    bit [256/8-1:0] temp_data [];
    logic AWVALID;
    int unsigned no_bytes_by_data_width;

    uvm_sequence_item w_trans_q[$], r_trans_q[$];

    // Methods
    extern task drive_write();
    extern task drive_read();
    extern task send_write_address();
    extern task send_read_address();
    extern task send_write_data();
    extern function void data_shift(ref axi_transaction tr);

    // extern task send_read_data();

    function new(string name, uvm_component parent);
        super.new(name, parent);
        w_done = 1;
        r_done = 1;
        seq_item_port2 = new("seq_item_port2", this);
        
        no_bytes_by_data_width = MAX_DATA_WIDTH/8;
    endfunction //new()

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
    extern function void connect_phase(uvm_phase phase);

    //  Function: run_phase
    extern task run_phase(uvm_phase phase);
    
endclass //m_driver extends uvn_driver#(axu)

function void axi_m_driver::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    assert (uvm_config_db#(virtual axi_interface)::get(this, "", "vif", VIF)) begin
        `uvm_info(get_type_name(), "vif has been found in Config DB.", UVM_LOW);
        vif = VIF.MDRV;
    end else begin
        //`uvm_fatal(get_type_name(), "vif cannot be found in Config DB!");
    end

endfunction: connect_phase

function void axi_m_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);

endfunction: build_phase

task axi_m_driver::run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("DEBUG", "started master driver", UVM_HIGH);
    // temp 
    vif.m_drv_cb.BREADY <= 1;
    vif.m_drv_cb.RREADY <= 1;
    forever begin
        fork
            begin
                @(negedge vif.rstn);
                vif.m_drv_cb.AWVALID <= 0;
                vif.m_drv_cb.WVALID <= 0;
                vif.m_drv_cb.ARVALID <= 0;
                `uvm_info("DEBUG", "trigger reset progress", UVM_NONE);
                disable driver_write_process;
                disable driver_read_process;
            end

            begin:driver_write_process
                drive_write();
                #3ns;
            end
            begin:driver_read_process
                drive_read();
                #3ns;
            end
        join
    end
endtask: run_phase

task axi_m_driver::drive_write();
    `uvm_info("DEBUG", "started check seq_item_port", UVM_HIGH);
        begin
            //`uvm_info("DEBUG", $sformatf("w_addr(), w_done = %0d", w_done), UVM_DEBUG)
            forever begin
                //w_done = 0;
                seq_item_port.get_next_item(w_trans_temp);
                `uvm_info(get_name(), "Write Packet received in master driver", UVM_LOW);
                assert($cast(w_trans, w_trans_temp));
                //w_trans.print();
                fork
                    send_write_address();
                    send_write_data();
                join
                seq_item_port.item_done();
                //w_done = 1;
            end
        end
endtask: drive_write


task axi_m_driver::drive_read();
    `uvm_info("DEBUG", "started check seq_item_port", UVM_HIGH);
        begin
            //`uvm_info("DEBUG", $sformatf("r_addr(), r_done = %0d", r_done), UVM_DEBUG)
            forever begin
                //r_done = 0;
                seq_item_port2.get_next_item(r_trans_temp);
                `uvm_info(get_name(), "Read Packet received in master driver", UVM_LOW);
                assert($cast(r_trans, r_trans_temp));
                //r_trans.print();
                send_read_address();
                seq_item_port2.item_done();
                //r_done = 1;
            end
        end
endtask: drive_read

task axi_m_driver::send_write_address();
    `uvm_info("DEBUG", "Inside send_write_address()", UVM_HIGH)
    
    // Drive all the data
    @(vif.m_drv_cb);
    vif.m_drv_cb.AWID   <= w_trans.id;
    vif.m_drv_cb.AWADDR <= w_trans.addr;
    vif.m_drv_cb.AWLEN  <= w_trans.b_len;
    vif.m_drv_cb.AWSIZE <= w_trans.b_size;
    vif.m_drv_cb.AWBURST<= w_trans.b_type;
    `uvm_info("DEBUG", "Data Driven", UVM_HIGH)

    // Wait 1 cycle and drive AWVALID
    @(vif.m_drv_cb);
    AWVALID              = 1;
    vif.m_drv_cb.AWVALID<= AWVALID;
    `uvm_info("send_write_address", "Asserted AWVALID", UVM_HIGH)

    // Wait for AWREADY and deassert AWVALID
    @(vif.m_drv_cb);
    while(vif.m_drv_cb.AWREADY !== 1)begin
        @(vif.m_drv_cb);
    end
    AWVALID              = 0;
    vif.m_drv_cb.AWVALID<= AWVALID;
    `uvm_info("send_write_address", "Deasserted AWVALID", UVM_HIGH)

    // Wait for write data channel to complete transaction
    while(vif.m_drv_cb.BVALID !== 1)begin
        @(vif.m_drv_cb);
    end
    w_trans.b_resp = vif.m_drv_cb.BRESP;
    `uvm_info("send_write_address", "BVALID ASSERTED", UVM_HIGH);
endtask: send_write_address

function void axi_m_driver::data_shift(ref axi_transaction tr);
    // data >> data_shift
    // case(no_bytes_by_data_width)
    //     4:start_bit=tr.addr[1:0]; 2*2^i=2^(i+1)=x  i=$clog2(x)-1
    //     8:start_bit=tr.addr[2:0]; 
    //     16:start_bit=tr.addr[3:0];
    //     32:start_bit=tr.addr[4:0];
    //     64:start_bit=tr.addr[5:0];
    // endcase

    int unsigned start_bit;
    int unsigned end_bit;

    for(int unsigned i=0;i<=tr.b_len;i++)begin// transfers

        if(tr.b_type == 2'b00) begin  // fixed   
            start_bit = tr.addr[3-1:0];   
        end

        else if(tr.b_type == 2'b01) begin  // increments 
            if(i==0)begin    
                start_bit=tr.addr[3-1:0];             //    $clog2(no_bytes_by_data_width)
            end

            else if(end_bit < no_bytes_by_data_width) begin
                start_bit = end_bit+1;
            end

            else begin
                start_bit=0;
            end

        end    


        if((start_bit + 2^tr.b_size-1)<(no_bytes_by_data_width-1))begin
            end_bit=start_bit + 2^tr.b_size-1;
        end
        else begin
            end_bit=no_bytes_by_data_width-1;
        end         

        // depreciate
        // for(int unsigned j=0,q=start_bit;q<=end_bit;j++,q++)begin
        //     tr.data_shift[i][8*j+:8]=tr.data[i][q];
        // end

        foreach(tr.data[i][q])begin
            tr.data_shift[i][8*q+:8]=tr.data[i][q];
            `uvm_info("DEBUG", $sformatf("Inside data_shift() tr.data[%0d][%0d] is 'h%0h" , i, q, tr.data[i][q]),UVM_HIGH);
        end
        `uvm_info("DEBUG", $sformatf("Inside data_shift() tr.data_shift[%0d] is 'h%0h" , i, tr.data_shift[i]),UVM_HIGH);

        
        
    end

    // else if(tr.b_type == 2'b10) begin  // wrapper       
    //     // bit end_bit=tr.addr[0]*8+tr.b_size-1;
    //     //  tr.data_shift=data[start_bit,end_bit];
    // end
endfunction

task axi_m_driver::send_write_data();
    int unsigned len = w_trans.b_len + 1;
    this.temp = new[len];
    this.temp_data = new[len];
    `uvm_info("DEBUG", "Inside send_write_data()", UVM_HIGH)
    this.data_shift(w_trans);
    foreach ( this.temp[i] ) begin
        this.temp[i] = w_trans.data_shift[i];
    end

    foreach ( this.temp[i] ) begin
        foreach ( w_trans.wstrb[i][j] ) begin
            `uvm_info("DEBUG", $sformatf("Inside send_write_data() w_trans.wstrb[%0d][%0d] is 'h%0h" , i, j, w_trans.wstrb[i][j]),UVM_HIGH);
        end
    end
    foreach ( temp_data[i] ) begin
        `uvm_info("DEBUG", $sformatf("Inside send_write_data() temp_data[%0d] is 'h%0h", i, temp_data[i] ), UVM_HIGH);
    end
    foreach ( temp[i] ) begin
        `uvm_info("DEBUG", $sformatf("Inside send_write_data() temp[%0d] is 'h%0h", i,temp[i] ), UVM_HIGH);
    end
    foreach ( temp_data[i,j] ) begin
        temp_data[i][j] = w_trans.wstrb[i][j];
    end
    while(vif.m_drv_cb.AWREADY !== 1)begin
        @(vif.m_drv_cb);
    end

    `uvm_info("DEBUG", "packed data", UVM_HIGH)
    for (int unsigned i=0; i<len; i++) begin
        `uvm_info("DEBUG", $sformatf("Inside loop: iter %0d", i), UVM_HIGH)
        @(vif.m_drv_cb);
        vif.m_drv_cb.WID    <= w_trans.id;
        vif.m_drv_cb.WDATA  <= temp[i];
        vif.m_drv_cb.WSTRB  <= temp_data[i];
        vif.m_drv_cb.WLAST  <= (i == len-1) ? 1:0;

        // Assert WVALID
        @(vif.m_drv_cb);
        vif.m_drv_cb.WVALID <= 1;

        // Wait for WREADY and deassert WVALID
        #1;

        while(vif.m_drv_cb.WREADY !== 1)begin
            @(vif.m_drv_cb);
        end

        vif.m_drv_cb.WVALID <= 0;
        vif.m_drv_cb.WLAST  <= 0;
    end

    while(vif.m_drv_cb.BVALID !== 1)begin
        @(vif.m_drv_cb);
    end


endtask: send_write_data


task axi_m_driver::send_read_address();
    // Send the read address and control signals
    @(vif.m_drv_cb);
    vif.m_drv_cb.ARID   <= r_trans.id;
    vif.m_drv_cb.ARADDR <= r_trans.addr;
    vif.m_drv_cb.ARLEN  <= r_trans.b_len;
    vif.m_drv_cb.ARSIZE <= r_trans.b_size;
    vif.m_drv_cb.ARBURST<= r_trans.b_type;

    // Assert ARVALID after one clock cycle
    @(vif.m_drv_cb);
    vif.m_drv_cb.ARVALID<= 1;

    // Wait for AWREADY and deassert AWVALID
    @(vif.m_drv_cb);
    
    while(vif.m_drv_cb.ARREADY !== 1)begin
        @(vif.m_drv_cb);
    end
    vif.m_drv_cb.ARVALID<= 0;

    // Wait for RLAST signal before sending next address
    // while((vif.m_drv_cb.RLAST !== 1) || (vif.m_drv_cb.RVALID !== 1))begin
    //     @(vif.m_drv_cb);
    // end

    //r_trans.data    = new [r_trans.b_len+1];
        r_trans.r_resp  = new [r_trans.b_len+1];
        r_trans.dir = axi_dec_pkg::Read;
        for (int unsigned i=0; i<r_trans.b_len+1; i++) begin
            while((VIF.mon_cb.RVALID !== 1) || (VIF.mon_cb.RREADY !== 1))begin
                @(VIF.mon_cb);
            end
            r_trans.data[i] = new [no_bytes_by_data_width];
            for (int unsigned j=0; j<no_bytes_by_data_width; j++) begin
                r_trans.data[i][j]=vif.m_drv_cb.RDATA[8*j+:8];
            end
            r_trans.r_resp[i] = vif.m_drv_cb.RRESP;
            @(vif.m_drv_cb);
        end
endtask: send_read_address