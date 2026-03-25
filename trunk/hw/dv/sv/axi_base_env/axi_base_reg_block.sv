    class uart_reg_ctrl extends dv_base_reg;
    // fields
    rand dv_base_reg_field tx;
    rand dv_base_reg_field rx;
    rand dv_base_reg_field nf;
    rand dv_base_reg_field slpbk;
    rand dv_base_reg_field llpbk;
    rand dv_base_reg_field parity_en;
    rand dv_base_reg_field parity_odd;
    rand dv_base_reg_field rxblvl;
    rand dv_base_reg_field nco;

    `uvm_object_utils(uart_reg_ctrl)

    function new(string       name = "uart_reg_ctrl",
                 int unsigned n_bits = 32,
                 int          has_coverage = UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
    endfunction : new

    virtual function void build(csr_excl_item csr_excl = null);
      // create fields
      tx = (dv_base_reg_field::
            type_id::create("tx"));
      tx.configure(
        .parent(this),
        .size(1),
        .lsb_pos(0),
        .access("RW"),
        .volatile(0),
        .reset(32'h0),
        .has_reset(1),
        .is_rand(1),
        .individually_accessible(1));
      tx.set_original_access("RW");
      add_hdl_path_slice("u_reg.u_ctrl_tx.q",
                         0, 1, 0, "BkdrRegPathRtl");

      rx = (dv_base_reg_field::
            type_id::create("rx"));
      rx.configure(
        .parent(this),
        .size(1),
        .lsb_pos(1),
        .access("RW"),
        .volatile(0),
        .reset(32'h0),
        .has_reset(1),
        .is_rand(1),
        .individually_accessible(1));
      rx.set_original_access("RW");
      add_hdl_path_slice("u_reg.u_ctrl_rx.q",
                         1, 1, 0, "BkdrRegPathRtl");
      // create field tags
      csr_excl.add_excl(rx.get_full_name(), CsrExclWrite, CsrAllTests);

      nf = (dv_base_reg_field::
            type_id::create("nf"));
      nf.configure(
        .parent(this),
        .size(1),
        .lsb_pos(2),
        .access("RW"),
        .volatile(0),
        .reset(32'h0),
        .has_reset(1),
        .is_rand(1),
        .individually_accessible(1));
      nf.set_original_access("RW");
      add_hdl_path_slice("u_reg.u_ctrl_nf.q",
                         2, 1, 0, "BkdrRegPathRtl");

      slpbk = (dv_base_reg_field::
               type_id::create("slpbk"));
      slpbk.configure(
        .parent(this),
        .size(1),
        .lsb_pos(4),
        .access("RW"),
        .volatile(0),
        .reset(32'h0),
        .has_reset(1),
        .is_rand(1),
        .individually_accessible(1));
      slpbk.set_original_access("RW");
      add_hdl_path_slice("u_reg.u_ctrl_slpbk.q",
                         4, 1, 0, "BkdrRegPathRtl");

      llpbk = (dv_base_reg_field::
               type_id::create("llpbk"));
      llpbk.configure(
        .parent(this),
        .size(1),
        .lsb_pos(5),
        .access("RW"),
        .volatile(0),
        .reset(32'h0),
        .has_reset(1),
        .is_rand(1),
        .individually_accessible(1));
      llpbk.set_original_access("RW");
      add_hdl_path_slice("u_reg.u_ctrl_llpbk.q",
                         5, 1, 0, "BkdrRegPathRtl");

      parity_en = (dv_base_reg_field::
                   type_id::create("parity_en"));
      parity_en.configure(
        .parent(this),
        .size(1),
        .lsb_pos(6),
        .access("RW"),
        .volatile(0),
        .reset(32'h0),
        .has_reset(1),
        .is_rand(1),
        .individually_accessible(1));
      parity_en.set_original_access("RW");
      add_hdl_path_slice("u_reg.u_ctrl_parity_en.q",
                         6, 1, 0, "BkdrRegPathRtl");

      parity_odd = (dv_base_reg_field::
                    type_id::create("parity_odd"));
      parity_odd.configure(
        .parent(this),
        .size(1),
        .lsb_pos(7),
        .access("RW"),
        .volatile(0),
        .reset(32'h0),
        .has_reset(1),
        .is_rand(1),
        .individually_accessible(1));
      parity_odd.set_original_access("RW");
      add_hdl_path_slice("u_reg.u_ctrl_parity_odd.q",
                         7, 1, 0, "BkdrRegPathRtl");

      rxblvl = (dv_base_reg_field::
                type_id::create("rxblvl"));
      rxblvl.configure(
        .parent(this),
        .size(2),
        .lsb_pos(8),
        .access("RW"),
        .volatile(0),
        .reset(32'h0),
        .has_reset(1),
        .is_rand(1),
        .individually_accessible(1));
      rxblvl.set_original_access("RW");
      add_hdl_path_slice("u_reg.u_ctrl_rxblvl.q",
                         8, 2, 0, "BkdrRegPathRtl");

      nco = (dv_base_reg_field::
             type_id::create("nco"));
      nco.configure(
        .parent(this),
        .size(16),
        .lsb_pos(16),
        .access("RW"),
        .volatile(0),
        .reset(32'h0),
        .has_reset(1),
        .is_rand(1),
        .individually_accessible(1));
      nco.set_original_access("RW");
      add_hdl_path_slice("u_reg.u_ctrl_nco.q",
                         16, 16, 0, "BkdrRegPathRtl");

    endfunction : build
  endclass : uart_reg_ctrl
  
  class axi_base_reg_block extends dv_base_reg_block;
    // registers
    rand uart_reg_ctrl ctrl;

    `uvm_object_utils(axi_base_reg_block)

    function new(string name = "axi_base_reg_block",
                 int    has_coverage = UVM_NO_COVERAGE);
      super.new(name, has_coverage);
    endfunction : new

    virtual function void build(uvm_reg_addr_t base_addr,
                                csr_excl_item csr_excl = null);
      // create default map
      this.default_map = create_map(.name("default_map"),
                                    .base_addr(base_addr),
                                    .n_bytes(4),
                                    .endian(UVM_LITTLE_ENDIAN));
      if (csr_excl == null) begin
        csr_excl = csr_excl_item::type_id::create("csr_excl");
        this.csr_excl = csr_excl;
      end
      //set_hdl_path_root("tb.dut", "BkdrRegPathRtl");
      // create registers
      ctrl = (uart_reg_ctrl::
              type_id::create("ctrl"));
      ctrl.configure(.blk_parent(this));
      ctrl.build(csr_excl);
      default_map.add_reg(.rg(ctrl),
                          .offset(32'h10),
                          .rights("RW"));
    endfunction : build
  endclass : axi_base_reg_block
