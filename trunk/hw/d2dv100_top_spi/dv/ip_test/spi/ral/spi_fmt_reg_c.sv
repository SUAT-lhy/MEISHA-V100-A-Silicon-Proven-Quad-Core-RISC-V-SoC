class spi_fmt_reg_c extends uvm_reg;
    rand uvm_reg_field proto;
    rand uvm_reg_field endian;
    rand uvm_reg_field dir;
    // rand uvm_reg_field re1;
    rand uvm_reg_field len;
    // rand uvm_reg_field re2;

    virtual function void void build();
        proto = uvm_reg_field::type_id::create("proto"); // SPI Protocol
        endian = uvm_reg_field::type_id::create("endian"); // SPI endinanness
        dir = uvm_reg_field::type_id::create("dir"); // SPI I/O direction
        // re1 = uvm_reg_field::type_id::create("re1"); // Reversed
        len = uvm_reg_field::type_id::create("len"); // Number of bits per frame
        // re2 = uvm_reg_field::type_id::create("re2"); // Reserved

        proto.configure(this, 2, 0, "RW", 0, 'h0, 1, 1, 1);
        endian.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 1);
        dir.configure(this, 1, 3, "RW", 0, 'h1, 1, 1, 1);
        // re1.configure(this, 12, 4, "RW", 0, 'h0, 1, 1, 1);
        len.configure(this, 4, 16, "RW", 0, 'h8, 1, 1, 1);
        // re2.configure(this, 12, 20, "RW", 0, 'h0, 1, 1, 1);
    endfunction

    `uvm_object_utils(spi_fmt_reg_c)

    function new(string name = "spi_fmt_reg_c");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction
endclass