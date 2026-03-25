class spi_csmode_reg_c extends uvm_reg;
    rand uvm_reg_field mode;
    // rand uvm_reg_field re;

    virtual function void build();
        mode = uvm_reg_field::type_id::create("mode"); // Chip Select Mode
        // csmode_re = uvm_reg_field::type_id::create("re"); // Reserved

        mode.configure(this, 2, 0, "RW", 0, 'h0, 1, 1, 1);
        // re.configure(this, 30, 2, "RW", 0, 'h0, 1, 1, 1);
    endfunction

    `uvm_object_utils(spi_csmode_reg_c)

    function new(string name = "spi_csmode_reg_c");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction
endclass