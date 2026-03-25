// Vendor 		: 
// Author 		: ling
// Filename 	: bus_checker 
// Date Created: 2022.04.26 
// Version		: V1.0
// File description	:
// Revision History :

// This sequence assert reset randomly in between running timer

class axi_base_random_reset_vseq extends axi_base_random_vseq;
  `uvm_object_utils(axi_base_random_reset_vseq)
  `uvm_object_new

  // assert reset randomly
  constraint assert_reset_c {
    assert_reset dist {
      0  := 1,
      1  := 2
    };
  }

endclass : axi_base_random_reset_vseq
