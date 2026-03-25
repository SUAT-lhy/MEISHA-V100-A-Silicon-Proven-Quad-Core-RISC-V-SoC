// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: axi_agent_cfg 
// Date Created: 2022.04.27 
// Version		: V1.0
// -------------------------------------------------------------------------------------------------
// File description	:
// -------------------------------------------------------------------------------------------------
// Revision History :
// *************************************************************************************************

//--------------------------------------------------------------------------------------------------
// module declaration
//--------------------------------------------------------------------------------------------------

class axi_agent_cfg extends uvm_object;

    
    int unsigned data_width;
    //----------------------------------------------------------------------------------------------
    // Parameter Define
    //----------------------------------------------------------------------------------------------
    dv_utils_pkg::work_mode_e work_mode;


    `uvm_object_utils_begin(axi_agent_cfg)
        `uvm_field_int (data_width, UVM_DEFAULT)
        `uvm_field_enum(dv_utils_pkg::work_mode_e, work_mode, UVM_DEFAULT)
    `uvm_object_utils_end
   


// Constructor: new
extern function new(string name = "axi_agent_cfg");

endclass: axi_agent_cfg

function axi_agent_cfg::new(string name = "axi_agent_cfg");
    super.new(name);
endfunction: new
