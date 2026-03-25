// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class mem_model #(int AddrWidth = bus_params_pkg::BUS_AW,
                  int DataWidth = bus_params_pkg::BUS_DW,
                  int MaskWidth = bus_params_pkg::BUS_DBW) extends mem_model_base;


  `uvm_object_param_utils(mem_model#(AddrWidth, DataWidth))

  `uvm_object_new

  virtual function int get_written_bytes();
    return system_memory.size();
  endfunction

  virtual function bit [7:0] read_byte(mem_addr_t addr);
    bit [7:0] data;
    if (system_memory.exists(addr)) begin
      data = system_memory[addr];
      `uvm_info(`gfn, $sformatf("Read Mem  : Addr[0x%0h], Data[0x%0h]", addr, data), UVM_HIGH)
    end else begin
      `DV_CHECK_STD_RANDOMIZE_FATAL(data)
      `uvm_error(`gfn, $sformatf("read to uninitialzed addr 0x%0h", addr))
    end
    return data;
  endfunction

  virtual function void write_byte(mem_addr_t addr, bit [7:0] data);
   `uvm_info(`gfn, $sformatf("Write Mem : Addr[0x%0h], Data[0x%0h]", addr, data), UVM_HIGH)
    system_memory[addr] = data;
  endfunction


  virtual function void write_word(mem_addr_t addr, bit [31:0] data);
   `uvm_info(`gfn, $sformatf("Write word : Addr[0x%0h], Data[0x%0h]", addr, data), UVM_HIGH)
   assert(addr[1:0] == 2'b0);
    system_memory[addr + 0] = data[7:0];
    system_memory[addr + 1] = data[15:8];
    system_memory[addr + 2] = data[23:16];
    system_memory[addr + 3] = data[31:24];
  endfunction



  virtual function void write_dword(mem_addr_t addr, bit [63:0] data);
   `uvm_info(`gfn, $sformatf("Write dword : Addr[0x%0h], Data[0x%0h]", addr, data), UVM_DEBUG)
   assert(addr[2:0] == 3'b0);
    system_memory[addr + 0] = data[7:0];
    system_memory[addr + 1] = data[15:8];
    system_memory[addr + 2] = data[23:16];
    system_memory[addr + 3] = data[31:24];
    system_memory[addr + 4] = data[39:32];
    system_memory[addr + 5] = data[47:40];
    system_memory[addr + 6] = data[55:48];
    system_memory[addr + 7] = data[63:56];
  endfunction


  virtual function void compare_byte(mem_addr_t addr, bit [7:0] act_data);
   `uvm_info(`gfn, $sformatf("Compare Mem : Addr[0x%0h], Act Data[0x%0h], Exp Data[0x%0h]",
                             addr, act_data, system_memory[addr]), UVM_HIGH)
    system_memory[addr] = act_data;
    `DV_CHECK_EQ(act_data, system_memory[addr], $sformatf("addr 0x%0h read out mismatch", addr))
  endfunction

  virtual function void write(input mem_addr_t addr, mem_data_t data, mem_mask_t mask = '1);
    bit [7:0] byte_data;
    for (int i = 0; i < DataWidth / 8; i++) begin
      if (mask[0]) begin
        byte_data = data[7:0];
        write_byte(addr + i, byte_data);
      end
      data = data >> 8;
      mask = mask >> 1;
    end
  endfunction

  virtual function mem_data_t read(mem_addr_t addr, mem_mask_t mask = '1);
    mem_data_t data;
    for (int i = DataWidth / 8 - 1; i >= 0; i--) begin
      data = data << 8;
      if (mask[MaskWidth - 1]) data[7:0] = read_byte(addr + i);
      else                     data[7:0] = 0;
      mask = mask << 1;
    end
    return data;
  endfunction

  virtual function void compare(mem_addr_t addr, mem_data_t act_data, mem_mask_t mask = '1);
    bit [7:0] byte_data;
    for (int i = 0; i < DataWidth / 8; i++) begin
      byte_data = act_data[7:0];
      if (mask[0]) begin
        compare_byte(addr + i, byte_data);
      end else begin
        // Nothing to do here: since this byte wasn't selected by the mask, there are no
        // requirements about what data came back.
      end
      act_data = act_data>> 8;
      mask = mask >> 1;
    end
  endfunction

endclass
