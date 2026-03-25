
class axi_s_driver #(type REQ_T = axi_transaction) extends uvm_driver;
    `uvm_component_utils(axi_s_driver)
    
    // Components
    virtual axi_interface VIF;
    virtual axi_interface.SDRV vif;
    // Variables
    REQ_T s_wtrans_q[$], s_rtrans_q[$];
    semaphore wtrans_q_sem, rtrans_q_sem;
    //bit [7:0] mem [bit[MAX_ADDR_WIDTH-1:0]];
    mem_model_pkg::mem_model_base mem;
    bit [MAX_ADDR_WIDTH-1:0] w_addr, r_addr;
    bit w_done, r_done;
    int unsigned no_bytes_by_data_width;
    
    // Methods
    extern task drive();
    extern task read_write_address();
    extern task read_read_address();
    extern task read_write_data();
    extern task send_read_data();

    function new(string name, uvm_component parent);
        super.new(name, parent);
        w_done = 1;
        r_done = 1;
        wtrans_q_sem = new(1);
        rtrans_q_sem = new(1);
        no_bytes_by_data_width = MAX_DATA_WIDTH/8;
    endfunction //new()

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    //  Function: run_phase
    extern task run_phase(uvm_phase phase);
    
    // todo 
/* 
  virtual function void update_mem(REQ_T rsp);
    if (mem != null) begin
      if (rsp.dir inside {Write}) begin
        if
        bit [tl_agent_pkg::DataWidth-1:0] data;
        data = rsp.a_data;
        for (int unsigned i = 0; i < $bits(rsp.a_mask); i++) begin
          if (rsp.a_mask[i]) begin
            mem.write_byte(rsp.a_addr + i, data[7:0]);
          end
          data = data >> 8;
        end
      end else begin
        for (int unsigned i = 2**rsp.a_size - 1; i >= 0; i--) begin
          rsp.d_data = rsp.d_data << 8;
          rsp.d_data[7:0] = mem.read_byte(rsp.a_addr+i);
        end
      end
    end
  endfunction

  */



endclass //axi_s_driver extends uvm_driver

function void axi_s_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);
    //s_wtrans = new("s_wtrans");
    //s_rtrans = new("s_rtrans");
endfunction: build_phase

function void axi_s_driver::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    assert (uvm_config_db#(virtual axi_interface)::get(this, "", "vif", VIF)) begin
        `uvm_info(get_type_name(), "vif has been found in ConfigDB.", UVM_LOW);
        vif = VIF.SDRV;
    end else begin
        //`uvm_fatal(get_type_name(), "vif cannot be found in ConfigDB!");
    end
endfunction: connect_phase

task axi_s_driver::run_phase(uvm_phase phase);
    vif.s_drv_cb.AWREADY    <= 1;
    vif.s_drv_cb.ARREADY    <= 1;
    vif.s_drv_cb.WREADY     <= 1;
    vif.s_drv_cb.BVALID     <= 0;
    vif.s_drv_cb.RLAST      <= 0;
    vif.s_drv_cb.RVALID     <= 0;
    vif.s_drv_cb.RDATA      <= 'b0;
    begin
        @(vif.s_drv_cb);
        if(!vif.rstn) begin
            vif.s_drv_cb.BVALID <= 0;
            // Initial signals
            vif.s_drv_cb.RLAST  <= 0;
            vif.s_drv_cb.RVALID <=0;
            vif.s_drv_cb.RID    <= 0;
        end
        drive();
    end
endtask: run_phase

task axi_s_driver::drive();
    
    fork
        // forever begin
        //     // `uvm_info("DEBUG_S", $sformatf("w_addr(), w_done = 'h%0h", w_done), UVM_HIGH)
        //     if(w_done) begin
        //         w_done = 0;
        //         read_write_address();
        //         read_write_data();
        //         w_done = 1;
        //     end
        // end
        forever begin
            @(vif.s_drv_cb);
            read_write_address();
        end
        forever begin
            @(vif.s_drv_cb);
            read_write_data();
        end
        forever begin
            @(vif.s_drv_cb);
            read_read_address();
        end
        forever begin
            @(vif.s_drv_cb);
            send_read_data();
        end
        // begin
        //     `uvm_info("DEBUG_S", $sformatf("r_addr(), r_done = 'h%0h", r_done), UVM_HIGH)
        //     if(r_done) begin
        //         r_done = 0;
        //         r_done = 1;
        //     end
        // end
    join
endtask: drive

task axi_s_driver::read_write_address();
    REQ_T s_wtrans;
    `uvm_info("DEBUG_S", "Inside read_write_address", UVM_HIGH)

    while(vif.s_drv_cb.AWVALID !== 1)begin
        @(vif.s_drv_cb);
    end
    `uvm_info("DEBUG_S", $sformatf("Inside read_write_address, get addr 'h%0h", vif.s_drv_cb.AWADDR), UVM_HIGH)
    //wait(vif.s_drv_cb.AWVALID === 1'b1);
    s_wtrans = new("s_wtrans");
    s_wtrans.id     = vif.s_drv_cb.AWID;
    s_wtrans.addr   = vif.s_drv_cb.AWADDR;
    s_wtrans.b_size = vif.s_drv_cb.AWSIZE;
    s_wtrans.b_type = axi_burst_type_e'(vif.s_drv_cb.AWBURST);
    s_wtrans.b_len  = vif.s_drv_cb.AWLEN;
    wtrans_q_sem.get();
    s_wtrans_q.push_back(s_wtrans);
    wtrans_q_sem.put();
    //s_wtrans.print();
    `uvm_info("DEBUG_S", $sformatf("read_read_address push trans to queue: %0s", s_wtrans.sprint()), UVM_HIGH)
endtask: read_write_address

task axi_s_driver::read_write_data();
    REQ_T s_wtrans;
    int unsigned addr_1, addr_n, addr_align;
    int unsigned lower_byte_lane, upper_byte_lane, upper_wrap_boundary, lower_wrap_boundary;
    int unsigned no_bytes, total_bytes;
    bit isAligned;
    int unsigned c;
    bit err, align_err;
    bit [7:0] write_byte_data;
    `uvm_info("DEBUG_S", "Inside read_write_data", UVM_HIGH)
    vif.s_drv_cb.BVALID     <= 0;
    while(s_wtrans_q.size() == 0)begin
        @(vif.s_drv_cb);
    end
    //wait(s_wtrans_q.size() > 0);
    wtrans_q_sem.get();
    s_wtrans = s_wtrans_q.pop_front();
    wtrans_q_sem.put();    
    // Initial values and calculations
    addr_1 = s_wtrans.addr;
    no_bytes = 2**s_wtrans.b_size;
    total_bytes = no_bytes * (s_wtrans.b_len+1);
    addr_align = (int'(addr_1/no_bytes))*no_bytes;
    `uvm_info("DEBUG_S", $sformatf("Calculated aligned addr 'h%0h", addr_align), UVM_HIGH)
    isAligned = addr_1 == addr_align;

    // Calculate boundaries for Wrap Burst
    if(s_wtrans.b_type == Wrap) begin
        lower_wrap_boundary = (int'(addr_1/total_bytes))*total_bytes;
        upper_wrap_boundary = lower_wrap_boundary + total_bytes;
        `uvm_info("DEBUG_S", $sformatf("Calculated Lower Wrap Boundary: 'h%0h", lower_wrap_boundary), UVM_HIGH)
        `uvm_info("DEBUG_S", $sformatf("Calculated Upper Wrap Boundary: 'h%0h", upper_wrap_boundary), UVM_HIGH)
    end

    // check whether the wrap burst is alligned or not
    if(s_wtrans.b_type == Wrap && !isAligned) begin
        align_err = 1;
        `uvm_error("DEBUG_S", $sformatf("burst_type 'h%0h illegal, and isAligned %0b", s_wtrans.b_type, isAligned));
            
    end

    // Store data
    err = 0;
    `uvm_info("DEBUG_S", $sformatf("s_wtrans.b_len: 'h%0h", s_wtrans.b_len), UVM_HIGH)
    for (int unsigned i=0; i<s_wtrans.b_len+1; i++) begin
        `uvm_info("DEBUG_S", $sformatf("Inside read_data_loop i = %d", i), UVM_HIGH)
        // addr_n = addr_align + i*no_bytes;
        
        // Lane selection for the first transfer. In case of unaligned transfer the bytes b/w the 
        // start address and aligned address is not transferred. Thus for an unaligned burst, the
        // first transfer has less bytes and the actual burst size;
        // 'c' is a variable which stores which byte lane to select. In AXI, valid byte lane is used and
        // selected dynamically using lower_byte_lane and upper_byte_lane, but we for simplicity, we are
        // sending the data starting from WDATA[0:8*2**b_size], thus c converts the lower_byte_lane to 
        // such that it always select the data lines within the valid byte lanes, i.e. [0:8*2**b_size]
        // This can be changed in future to match with proper AXI protocol
        if(i==0 || s_wtrans.b_type == Fixed) begin
            lower_byte_lane = addr_1-(int'(addr_1/no_bytes_by_data_width))*no_bytes_by_data_width;
            upper_byte_lane = addr_align+no_bytes-1-(int'(addr_1/no_bytes_by_data_width))*no_bytes_by_data_width;
            addr_n = addr_1;
            c = isAligned ? 0 : lower_byte_lane;
            while (c>=no_bytes) begin
                c -= no_bytes;
            end
        end
        // For 2nd and all other transfers the address is always alligned and thus can read the entire 
        // valid byte lane, i.e, [0:8*2**b_size]; and thus c always start with 0
        else begin
            lower_byte_lane = addr_n-(int'(addr_n/no_bytes_by_data_width))*no_bytes_by_data_width;
            upper_byte_lane = lower_byte_lane + no_bytes-1;
            c = 0;
        end


        `uvm_info("DEBUG_S", $sformatf("lower_byte_lane is 'h%0h", lower_byte_lane), UVM_HIGH)
        `uvm_info("DEBUG_S", $sformatf("upper_byte_lane is 'h%0h", upper_byte_lane), UVM_HIGH)
        `uvm_info("DEBUG_S", $sformatf("addr_n is 'h%0h", addr_n), UVM_HIGH)
        while (vif.s_drv_cb.WVALID == 0) begin
            @(vif.s_drv_cb);
        end
        // Follows little endian
        err = 0;
        for (int unsigned j=lower_byte_lane; j<=upper_byte_lane; j++) begin
            `uvm_info("DEBUG_S", $sformatf("c is 'h%0h, addr is 'h%0h, stored value is %h", c, addr_n+j-lower_byte_lane, vif.s_drv_cb.WDATA[8*c+:8]), UVM_HIGH);
            // if(addr_n+j-lower_byte_lane >= (2**MAX_ADDR_WIDTH)) begin
            //     err = 1;
            //     `uvm_warning("DEBUG_S", $sformatf("c is 'h%0h, addr is 'h%0h - 'h%0d, stored value is %h, maybe return error", c, addr_n+j-lower_byte_lane, 2**MAX_ADDR_WIDTH, vif.s_drv_cb.WDATA[8*c+:8]));
            
            // end
            if(err || align_err)
                continue;
            mem.write_byte(addr_n+j-lower_byte_lane, vif.s_drv_cb.WDATA[8*c+:8]);
            //`uvm_info("DEBUG_S", $sformatf("c is 'h%0h, addr is 'h%0h, stored value is %h", c, addr_n+j-lower_byte_lane, vif.s_drv_cb.WDATA[8*c+:8]), UVM_HIGH);
            c++;
            c = c>=no_bytes ? 0:c;
        end

        // Update address
        if(s_wtrans.b_type != Fixed) begin
            if(isAligned) begin
                addr_n = addr_n+no_bytes;
                if(s_wtrans.b_type == Wrap) begin
                    `uvm_info("DEBUG_S", $sformatf("Updated addrn before boundary check: 'h%0h", addr_n), UVM_HIGH)
                    addr_n = addr_n>=upper_wrap_boundary ? lower_wrap_boundary : addr_n;
                    `uvm_info("DEBUG_S", $sformatf("Updated addrn after boundary check: 'h%0h", addr_n), UVM_HIGH)
                end
            end
            else begin
                addr_n = addr_align + no_bytes;
                isAligned = 1;
            end
        end
        @(vif.s_drv_cb);
    end
    vif.s_drv_cb.BID        <= s_wtrans.id;
    if(err || align_err)
        vif.s_drv_cb.BRESP  <= 2'b10;
    else
        vif.s_drv_cb.BRESP  <= 2'b00;

    vif.s_drv_cb.BVALID <= 1;

    @(vif.s_drv_cb);
    while(vif.s_drv_cb.BREADY !== 1'b1)begin
        @(vif.s_drv_cb);
    end
    vif.s_drv_cb.BVALID <= 0;
endtask: read_write_data

task axi_s_driver::read_read_address();
    REQ_T s_rtrans;
    `uvm_info("DEBUG_S", "Inside read_read_address", UVM_HIGH)
    while(vif.s_drv_cb.ARVALID !== 1'b1)begin
        @(vif.s_drv_cb);
    end
    //wait(vif.s_drv_cb.ARVALID === 1'b1);
    s_rtrans = new("s_rtrans");
    s_rtrans.id     = vif.s_drv_cb.ARID;
    s_rtrans.addr   = vif.s_drv_cb.ARADDR;
    s_rtrans.b_size = vif.s_drv_cb.ARSIZE;
    s_rtrans.b_type = axi_burst_type_e'(vif.s_drv_cb.ARBURST);
    s_rtrans.b_len  = vif.s_drv_cb.ARLEN;
    rtrans_q_sem.get();
    s_rtrans_q.push_back(s_rtrans);
    rtrans_q_sem.put();
    `uvm_info("DEBUG_S", $sformatf("read_read_address push trans to queue: %0s", s_rtrans.sprint()), UVM_HIGH)
endtask: read_read_address

task axi_s_driver::send_read_data();
    automatic REQ_T s_rtrans; 
    int unsigned addr_1, addr_n, addr_align, addr_align_to_datawidth;
    int unsigned lower_byte_lane, upper_byte_lane, upper_wrap_boundary, lower_wrap_boundary;
    int unsigned no_bytes, total_bytes;
    bit isAligned;
    bit isDataWidthAligned;
    int unsigned c;
    bit err;
    bit [7:0] read_byte_data;
    `uvm_info("send_read_data", "Inside send_read_data", UVM_HIGH)
    while(s_rtrans_q.size() == 0)begin
        @(vif.s_drv_cb);
    end
    //wait(s_rtrans_q.size() > 0);
    rtrans_q_sem.get();
    s_rtrans = s_rtrans_q.pop_front();
    rtrans_q_sem.put();
    addr_1 = s_rtrans.addr;
    no_bytes = 2**s_rtrans.b_size;
    total_bytes = no_bytes * (s_rtrans.b_len+1);

    // Calculate align address
    addr_align = (int'(addr_1/no_bytes))*no_bytes;
    addr_align_to_datawidth = (int'(addr_1/no_bytes_by_data_width))*no_bytes_by_data_width;
    
    isAligned = (addr_1 == addr_align);
    isDataWidthAligned = (addr_1 == addr_align_to_datawidth);
    `uvm_info("send_read_data", $sformatf("Calculated aligned addr %0h - %0h - %0h, isAligned: %0d, isDataWidthAligned: %0d", addr_align, addr_align_to_datawidth, addr_1, isAligned, isDataWidthAligned), UVM_MEDIUM)

    // If Wrap Burst then calculate the wrap boundary
    if(s_rtrans.b_type == Wrap) begin
        lower_wrap_boundary = (int'(addr_1/total_bytes))*total_bytes;
        upper_wrap_boundary = lower_wrap_boundary + total_bytes;
        `uvm_info("send_read_data", $sformatf("Calculated Lower Wrap Boundary: %0h, Upper Wrap Boundary: %0h", lower_wrap_boundary, upper_wrap_boundary), UVM_HIGH)
    end

    vif.s_drv_cb.RID    <= s_rtrans.id;
    // Store data
    for (int unsigned i=0; i<s_rtrans.b_len+1; i++) begin
        `uvm_info("send_read_data", "Inside send_data_loop", UVM_HIGH)
        // addr_n = addr_align + i*no_bytes;
        
        // Lane selection for the first transfer. In case of unaligned transfer the bytes b/w the 
        // start address and aligned address is not transferred. Thus for an unaligned burst, the
        // first transfer has less bytes and the actual burst size;
        // 'c' is a variable which stores which byte lane to select. In AXI, valid byte lane is used and
        // selected dynamically using lower_byte_lane and upper_byte_lane, but we for simplicity, we are
        // sending the data starting from WDATA[0:8*2**b_size], thus c converts the lower_byte_lane to 
        // such that it always select the data lines within the valid byte lanes, i.e. [0:8*2**b_size]
        // This can be changed in future to match with proper AXI protocol
        if(i==0 || s_rtrans.b_type == Fixed) begin
            lower_byte_lane = addr_1-(int'(addr_1/no_bytes_by_data_width))*no_bytes_by_data_width;
            upper_byte_lane = addr_align+no_bytes-1-(int'(addr_1/no_bytes_by_data_width))*no_bytes_by_data_width;
            addr_n = addr_1;
            c = isDataWidthAligned ? 0 : lower_byte_lane;
            while (c>=no_bytes_by_data_width) begin
                c -= no_bytes_by_data_width;
            end
        end
        // For 2nd and all other transfers the address is always alligned and thus can read the entire 
        // valid byte lane, i.e, [0:8*2**b_size]; and thus c always start with 0
        else begin
            lower_byte_lane = addr_n-(int'(addr_n/no_bytes_by_data_width))*no_bytes_by_data_width;
            upper_byte_lane = lower_byte_lane + no_bytes-1;
            c = 0;
        end

        // @(vif.s_drv_cb);
        `uvm_info("send_read_data", $sformatf("lower_byte_lane is %0h, upper_byte_lane is %0h, addr_1 is %0h, addr_n is %0h, %0h - %0h - %0h - %0h", lower_byte_lane, upper_byte_lane, addr_1, addr_n, i, (int'(addr_1/no_bytes_by_data_width)), ((addr_1/no_bytes_by_data_width)), no_bytes_by_data_width), UVM_HIGH);
        // Follows little endian
        err = 0;
        for (int unsigned j=lower_byte_lane; j<=upper_byte_lane; j++) begin
            if(!mem.system_memory.exists(addr_n+j-lower_byte_lane)) begin
                err = 1;
                vif.s_drv_cb.RDATA[8*c+:8] <= 'b0;
                `uvm_info("send_read_data", $sformatf("c is %0h, addr is %0h, No data in location", c, addr_n+j-lower_byte_lane), UVM_HIGH)
            end
            else begin
                read_byte_data = mem.read_byte(addr_n+j-lower_byte_lane);
                vif.s_drv_cb.RDATA[8*c+:8] <= read_byte_data;
                `uvm_info("send_read_data", $sformatf("c is %0h, addr is %0h, stored value is %h", c, addr_n+j-lower_byte_lane, read_byte_data), UVM_HIGH)
            end
            c++;
            c = c>=no_bytes_by_data_width ? 0:c;
        end

        if(i == s_rtrans.b_len) begin
            vif.s_drv_cb.RLAST <= 1;
        end
        else begin
            vif.s_drv_cb.RLAST <= 0;
        end
            

        if(err)
            vif.s_drv_cb.RRESP <= 2'b00;
        else
            vif.s_drv_cb.RRESP <= 2'b00;
        
        @(vif.s_drv_cb);
        vif.s_drv_cb.RVALID <= 1;

        // Update address
        if(s_rtrans.b_type != Fixed) begin
            if(isAligned) begin
                addr_n = addr_n+no_bytes;
                if(s_rtrans.b_type == Wrap) begin
                    `uvm_info("send_read_data", $sformatf("Updated addrn before boundary check: %0h", addr_n), UVM_HIGH)
                    addr_n = addr_n>=upper_wrap_boundary ? lower_wrap_boundary : addr_n;
                    `uvm_info("send_read_data", $sformatf("Updated addrn after boundary check: %0h", addr_n), UVM_HIGH)
                end
            end
            else begin
                addr_n = addr_align + no_bytes;
                isAligned = 1;
            end
        end
        `uvm_info("send_read_data", $sformatf("Begin check ready"), UVM_HIGH);
        do begin
            @(vif.s_drv_cb);
        end while(vif.s_drv_cb.RREADY !== 1'b1);
        `uvm_info("send_read_data", $sformatf("End check ready"), UVM_HIGH);
        vif.s_drv_cb.RVALID <= 0;
    end
endtask: send_read_data
