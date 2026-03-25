// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: axi_base_env_cfg 
// Date Created : 2022.04.27 
// Version		: V1.0
// -------------------------------------------------------------------------------------------------
// File description	:
// -------------------------------------------------------------------------------------------------
// Revision History :
// *************************************************************************************************

//--------------------------------------------------------------------------------------------------
// module declaration
//--------------------------------------------------------------------------------------------------

class axi_base_env_cfg #(type RAL_T = axi_base_reg_block) extends cip_base_env_cfg #(.RAL_T(RAL_T));

    dv_utils_pkg::switch_e    axi_agent_sw[string];
    dv_utils_pkg::work_mode_e axi_agent_work_mode[string];
    axi_agent_cfg             m_axi_agent_cfg[string];    
    //----------------------------------------------------------------------------------------------
    // Parameter Define
    //----------------------------------------------------------------------------------------------
    `uvm_object_utils_begin(axi_base_env_cfg)
      //`uvm_field_aa_int_string(axi_agent_sw,  UVM_DEFAULT)
      //`uvm_field_aa_int_string(axi_agent_work_mode,  UVM_DEFAULT)
      `uvm_field_aa_object_string(m_axi_agent_cfg,  UVM_DEFAULT)
    `uvm_object_utils_end

    `uvm_object_new


    extern function void create_vip();

  virtual function void initialize(bit [TL_AW-1:0] csr_base_addr = '1);
    has_devmode = 0;
    en_devmode = 0;
    // list_of_alerts = axi_base_env_pkg::LIST_OF_ALERTS;
    // 不要使用父类的initialize
    ral_model_names = {}; // 清空ral_model_names 不进行创建寄存器模型相关组件及相关检查
    is_initialized = 1'b1;
    // super.initialize(csr_base_addr);
    // // create axi_base agent config obj
    // m_axi_base_agent_cfg = axi_base_agent_cfg::type_id::create("m_axi_base_agent_cfg");
    // // set num_interrupts & num_alerts which will be used to create coverage and more
    // num_interrupts = ral.intr_state.get_n_used_bits();
    // // only support 1 outstanding TL item
    // m_tl_agent_cfg.max_outstanding_req = 1;
  endfunction
  
endclass: axi_base_env_cfg

function void axi_base_env_cfg::create_vip();
    string port_name;
    string port_inst_path;
    int agent_num;
    super.create_vip();
    foreach(harness_api_abstract::harness_api_q[inst_path]) begin
        axi_intf_c axi_intf;
        if($cast(axi_intf, harness_api_abstract::harness_api_q[inst_path])) begin
            int port_num = axi_intf.get_port_num(axi_intf_c::PORT_TYPE); 
            for(int i = 0; i < port_num; i++) begin
                port_name = axi_intf.get_port_name(axi_intf_c::PORT_TYPE, i);
                port_inst_path = {inst_path, "-", port_name};
                this.axi_agent_sw[port_inst_path] = dv_utils_pkg::OFF;
                begin
                    if(this.m_axi_agent_cfg[port_inst_path] == null) begin
                        this.m_axi_agent_cfg[port_inst_path] = axi_agent_cfg::type_id::create($sformatf("m_axi_agent_cfg-%s", port_inst_path));
                    end
                    `uvm_info(get_type_name(), $sformatf("get harness path %s, port_name %s, probably create vip", inst_path, port_name), UVM_LOW);
                end
                agent_num++;
            end
        end
    end
    
    
endfunction: create_vip

