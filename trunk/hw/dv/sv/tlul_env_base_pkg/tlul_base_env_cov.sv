// Vendor 		: 
// Author 		: ling
// Filename 	: bus_checker 
// Date Created: 2022.04.26 
// Version		: V1.0
// File description	:
// Revision History :

// We are enclosing covergroups inside class so that we can
// take avoid tool limitation of not allowing arrays of covergroup
// Refer to Issue#375 for more details
// class for wrapping timer config covergroup

class tlul_base_env_cov extends cip_base_env_cov #(.CFG_T(tlul_base_env_cfg));
  `uvm_component_utils(tlul_base_env_cov)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

endclass
