// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class mem_model_base extends uvm_object;


  bit [7:0] system_memory[mem_addr_t];

  `uvm_object_param_utils(mem_model_base)

  `uvm_object_new

  virtual function int get_written_bytes();
    `uvm_error(`gfn, $sformatf("get_written_bytes is not implement"))
  endfunction

  virtual function bit [7:0] read_byte(mem_addr_t addr);
    `uvm_error(`gfn, $sformatf("read_byte is not implement"))
  endfunction

  virtual function void write_byte(mem_addr_t addr, bit [7:0] data);
    `uvm_error(`gfn, $sformatf("write_byte is not implement"))
  endfunction


  virtual function void write_word(mem_addr_t addr, bit [31:0] data);
    `uvm_error(`gfn, $sformatf("write_word is not implement"))
  endfunction



  virtual function void write_dword(mem_addr_t addr, bit [63:0] data);
    `uvm_error(`gfn, $sformatf("write_dword is not implement"))
  endfunction


  virtual function void compare_byte(mem_addr_t addr, bit [7:0] act_data);
    `uvm_error(`gfn, $sformatf("compare_byte is not implement"))
  endfunction

  virtual function void write(input mem_addr_t addr, mem_data_t data, mem_mask_t mask = '1);
    `uvm_error(`gfn, $sformatf("write is not implement"))
  endfunction

  virtual function mem_data_t read(mem_addr_t addr, mem_mask_t mask = '1);
    `uvm_error(`gfn, $sformatf("read is not implement"))
  endfunction

  virtual function void compare(mem_addr_t addr, mem_data_t act_data, mem_mask_t mask = '1);
    `uvm_error(`gfn, $sformatf("compare is not implement"))
  endfunction

endclass
