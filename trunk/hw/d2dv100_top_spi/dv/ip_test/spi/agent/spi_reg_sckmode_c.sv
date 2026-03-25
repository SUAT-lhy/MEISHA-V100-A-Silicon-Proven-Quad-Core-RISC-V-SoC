class spi_reg_sckmode_c extends uvm_object;
    rand bit [29:0] re;
    rand bit        pol;
    rand bit        pha;
    constraint c_sckmode {
        pol inside {0, 1};
        pha inside {0, 1};
    }
    bit [31:0] val = {re, pol, pha};

    `uvm_object_utils_begin(spi_reg_sckmode_c)
        `uvm_field_int(pol, UVM_ALL_ON)
        `uvm_field_int(pha, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "spi_reg_sckmode_c");
        super.new(name);
    endfunction
endclass