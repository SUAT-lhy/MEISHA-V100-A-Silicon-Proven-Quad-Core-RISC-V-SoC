class spi_ffmt_reg_c extends uvm_reg;
    rand uvm_reg_field cmd_en;
    rand uvm_reg_field addr_len;
    rand uvm_reg_field pad_cnt;
    rand uvm_reg_field cmd_proto;
    rand uvm_reg_field addr_proto;
    rand uvm_reg_field data_proto;
    // rand uvm_reg_field re;
    rand uvm_reg_field cmd_code;
    rand uvm_reg_field pad_code;

    virtual function void build();
        cmd_en = uvm_reg_field::type_id::create("cmd_en"); // Enable sending of command
        addr_len = uvm_reg_field::type_id::create("addr_len"); // Number of address bytes(0 to 4)
        pad_cnt = uvm_reg_field::type_id::create("pad_cnt"); // Number of dummy cycles
        cmd_proto = uvm_reg_field::type_id::create("cmd_proto"); // Protocol for transmitting command
        addr_proto = uvm_reg_field::type_id::create("addr_proto"); // Protocol for transmitting address and padding
        data_proto = uvm_reg_field::type_id::create("data_proto"); // Protocol or receiving data bytes
        // re = uvm_reg_field::type_id::create("re"); // Reserved
        cmd_code = uvm_reg_field::type_id::create("cmd_code"); // Value of command byte
        pad_code = uvm_reg_field::type_id::create("pad_code"); // first 8 bits to transmit during dummy cycles

        cmd_en.configure(this, 1, 0, "RW", 0, 'h1, 1, 1, 1);
        addr_len.configure(this, 3, 1, "RW", 0, 'h3, 1, 1, 1);
        pad_cnt.configure(this, 4, 4, "RW", 0, 'h0, 1, 1, 1);
        cmd_proto.configure(this, 2, 8, "RW", 0, 'h0, 1, 1, 1);
        addr_proto.configure(this, 2, 10, "RW", 0, 'h0, 1, 1, 1);
        data_proto.configure(this, 2, 12, "RW", 0, 'h0, 1, 1, 1);
        // re.configure(this, 2, 14, "RW", 0, 'h0, 1, 1, 1);
        cmd_code.configure(this, 8, 16, "RW", 0, 'h3, 1, 1, 1);
        pad_code.configure(this, 8, 24, "RW", 0, 'h3, 1, 1, 1);
    endfunction

    `uvm_object_utils(spi_ffmt_reg_c)

    function new(string name = "spi_ffmt_reg_c");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction
endclass