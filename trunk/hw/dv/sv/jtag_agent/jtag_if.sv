// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// jtag interface with default 50MHz tck
interface jtag_if #(time JtagDefaultTckPeriodNs = 20ns) ();

  // interface pins
  logic tck;
  logic trst_n;
  logic  tms;
  logic  tdi;
  logic  tdo;

  // generate local tck
  logic   tck_en;
  time  tck_period_ns = JtagDefaultTckPeriodNs;

  clocking host_cb @(posedge tck);
    output  tms;
    output  tdi;
    input   tdo;
  endclocking
  modport host_mp(clocking host_cb, output trst_n);

  clocking device_cb @(posedge tck);
    input  tms;
    input  tdi;
    output tdo;
  endclocking
  modport device_mp(clocking device_cb, input trst_n);

  clocking mon_cb @(posedge tck);
    input tms;
    input tdi;
    input tdo;
  endclocking
  modport mon_mp (clocking mon_cb, input trst_n);

  // debug signals

  // task to wait for tck cycles
  task automatic wait_tck(int cycles);
    repeat (cycles) @(posedge tck);
  endtask

  // task to issue trst_n
  task automatic do_trst_n(int cycles);
    trst_n <= 1'b0;
    if (tck_en) wait_tck(cycles);
    else        #(tck_period_ns * cycles * 1ns);
    trst_n <= 1'b1;
  endtask

  task ports_reset();
    #1ns;
    tck_en = 1'b1;
    tdi = 0;
    tms = 0;
    @(posedge tck);
    tck_en = 1'b0;
  endtask

  task wait_unreset_state();
    #1ns;
    tdi = 0;
    tms = 0;
    wait(trst_n);
  endtask

  task goto_reset_state();
    tck_en = 1'b1;
    tms = 1;
    repeat (5) @(posedge tck);
    tck_en = 1'b0;
  endtask

  task goto_shift_ir();
    tck_en = 1'b1;
    tms = 0;
    repeat (1) @(posedge tck);
    tms = 1;
    repeat (1) @(posedge tck);
    tms = 1;
    repeat (1) @(posedge tck);
    tms = 0;
    repeat (1) @(posedge tck); // capture-ir
    tms = 0;
    repeat (1) @(posedge tck);  // shift-IR
    tck_en = 1'b0;
  endtask

  task shift_tdi_tdo(input bit temp_tdi, output bit temp_tdo);
    tck_en = 1'b1;
    tdi = temp_tdi;
    repeat (1) @(posedge tck);
    @(negedge tck);
    // tdo is updated at negedge clock
    temp_tdo = tdo;
    tck_en = 1'b0;
  endtask
  
  task goto_run_test_idle(int idle_cycle = 5);
    tck_en = 1'b1;
    tms = 0;
    repeat (idle_cycle) @(posedge tck);
    tck_en = 1'b0;
  endtask


  // Generate the tck, with UartDefaultClkPeriodNs period as default
  initial begin
    tck = 1'b1;
    //do_trst_n($urandom_range(1, 10));
    forever begin
      if (tck_en) begin
        #(tck_period_ns / 2);
        tck = ~tck;
        #(tck_period_ns / 2);
        tck = ~tck;
      end else begin
        @(tck_en);
      end
    end
  end

endinterface
