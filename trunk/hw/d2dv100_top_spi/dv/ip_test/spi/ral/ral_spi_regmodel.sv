class ral_spi_reg_model extends uvm_reg_block;
    rand spi_csmode_reg_c spi_csmode_reg;
    rand spi_ffmt_reg_c spi_ffmt_reg;
    rand spi_fmt_reg_c spi_fmt_reg;
    rand spi_fctrl_reg_c spi_fctrl_reg;
    rand spi_txfifo_reg_c spi_txfifo_reg;
    rand spi_rxfifo_reg_c spi_rxfifo_reg;

    virtual function void build();
        spi_csmode_reg = spi_csmode_reg_c::type_id::create("spi_csmode_reg", , `gfn);
        spi_csmode_reg.configure(this, null, "");
        spi_csmode_reg.build();

        spi_ffmt_reg = spi_ffmt_reg_c::type_id::create("spi_ffmt_reg", , `gfn);
        spi_ffmt_reg.configure(this, null, "");
        spi_ffmt_reg.build();

        spi_fmt_reg = spi_fmt_reg_c::type_id::create("spi_fmt_reg", , `gfn);
        spi_fmt_reg.configure(this, null, "");
        spi_fmt_reg.build();

        spi_fctrl_reg = spi_fctrl_reg_c::type_id::create("spi_fctrl_reg", , `gfn);
        spi_fctrl_reg.configure(this, null, "");
        spi_fctrl_reg.build();

        spi_txfifo_reg = spi_txfifo_reg_c::type_id::create("spi_txfifo_reg", , `gfn);
        spi_txfifo_reg.configure(this, null, "");
        spi_txfifo_reg.build();

        spi_rxfifo_reg = spi_rxfifo_reg_c::type_id::create("spi_rxfifo_reg", , `gfn);
        spi_rxfifo_reg.configure(this, null, "");
        spi_rxfifo_reg.build();

        default_map =  create_map("default_map", `SPI_CTRL_ADDR, 4, UVM_LITTLE_ENDIAN);
        default_map.add_reg(spi_csmode_reg, `SPI_REG_CSMODE, "RW");
        default_map.add_reg(spi_ffmt_reg, `SPI_REG_FFMT, "RW");
        default_map.add_reg(spi_fmt_reg, `SPI_REG_FMT, "RW");
        default_map.add_reg(spi_fctrl_reg, `SPI_REG_FCTRL, "RW");
        default_map.add_reg(spi_txfifo_reg, `SPI_REG_TXFIFO, "RW");
        default_map.add_reg(spi_rxfifo_reg, `SPI_REG_RXFIFO, "RO");

        `uvm_object_utils(ral_spi_reg_model);

        function new(string name =="ral_spi_reg_model");
            spuer.new(name, UVM_NO_COVERAGE);
        endfunction
    endfunction
endclass