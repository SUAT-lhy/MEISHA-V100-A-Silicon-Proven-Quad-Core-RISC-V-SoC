// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

package mem_model_pkg;

  import uvm_pkg::*;

  typedef bit [32-1:0] mem_addr_t;
  typedef bit [128-1:0] mem_data_t;
  typedef bit [16-1:0] mem_mask_t;


  `include "uvm_macros.svh"
  `include "mem_model_base.sv"
  `include "mem_model.sv"

endpackage
