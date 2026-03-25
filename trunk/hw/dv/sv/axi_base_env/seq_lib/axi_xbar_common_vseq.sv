// Vendor 		: 
// Author 		: ling
// Filename 	: bus_checker 
// Date Created: 2022.04.26 
// Version		: V1.0
// File description	:
// Revision History :

class axi_base_common_vseq extends axi_base_base_vseq;
  `uvm_object_utils(axi_base_common_vseq)
  `uvm_object_new

  constraint num_trans_c {
    num_trans inside {[1:3]};
  }

  virtual task body();
    run_common_vseq_wrapper(num_trans);
  endtask : body

endclass
