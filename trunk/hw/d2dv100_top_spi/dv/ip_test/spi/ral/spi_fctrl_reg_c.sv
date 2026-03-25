class spi_fctrl_reg_c extends uvm_reg;
    rand uvm_reg_field en;
    // rand uvm_reg_field re;

    virtual function void build();
        en = uvm_reg_field::type_id::create("en"); // SPI Flash Mode Select
        re = uvm_reg_field::type_id::create("re"); // Reserved

        en.configure(this, 1, 0, "RW", 0, 'h1, 1, 1, 1);
        // re.configure(this, 31, 1, "RW", 0, 'h0, 1, 1, 1);
    endfunction

    `uvm_object_utils(spi_fctrl_reg_c)

    function new(string name = "spi_fctrl_reg_c");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction
endclass