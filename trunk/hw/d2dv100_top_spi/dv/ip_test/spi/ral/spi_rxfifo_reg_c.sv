class spi_rxfifo_reg_c extends uvm_reg;
    rand uvm_reg_field data;
    // rand uvm_reg_field re;
    rand uvm_reg_field empty;

    virtual function void build();
        data = uvm_reg_field::type_id::create("data"); // Received Data
        // re = uvm_reg_field::type_id::create("re"); // Reversed
        empty = uvm_reg_field::type_id::create("empty"); // FIFO empty flag

        data.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 1);
        // re.configure(this, 23, 8, "RO", 0, 'h0, 1, 1, 1);
        empty.configure(this, 1, 31, "RO", 0, 'h1, 1, 1, 1);
    endfunction

    `uvm_object_utils(spi_rxfifo_reg_c)

    function new(string name = "spi_rxfifo_reg_c");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction
endclass