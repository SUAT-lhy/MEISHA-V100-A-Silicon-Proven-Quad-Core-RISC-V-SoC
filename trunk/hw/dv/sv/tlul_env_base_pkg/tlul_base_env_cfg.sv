// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: tlul_base_env_cfg 
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

class tlul_base_env_cfg extends axi_base_env_cfg #(.RAL_T(tlul_base_reg_block));

    dv_utils_pkg::switch_e    tlul_agent_sw[string];
    dv_utils_pkg::work_mode_e tlul_agent_work_mode[string];
    tl_agent_cfg              m_tlul_agent_cfg[string];
    
    //----------------------------------------------------------------------------------------------
    // Parameter Define
    //----------------------------------------------------------------------------------------------

    `uvm_object_utils_begin(tlul_base_env_cfg)
		  //`uvm_field_aa_int_string(tlul_agent_sw,  UVM_DEFAULT)
      //`uvm_field_aa_int_string(tlul_agent_work_mode,  UVM_DEFAULT)
      `uvm_field_aa_object_string(m_tlul_agent_cfg,  UVM_DEFAULT)
	  `uvm_object_utils_end


    `uvm_object_new
    virtual spi_if spi_if;
    virtual spi_slave_if spi_slave_if;

  function void pre_randomize();
    super.pre_randomize();

  endfunction



    extern function void create_vip();

  virtual function void initialize(bit [TL_AW-1:0] csr_base_addr = '1);
    has_devmode = 0;
    en_devmode = 0;
    // list_of_alerts = tlul_base_env_pkg::LIST_OF_ALERTS;
    // initialize
    ral_model_names = {}; // 清空ral_model_names 不进行创建寄存器模型相关组件及相关检查
    is_initialized = 1'b1;
    // super.initialize(csr_base_addr);
    // // create tlul_base agent config obj
    // m_tlul_base_agent_cfg = tlul_base_agent_cfg::type_id::create("m_tlul_base_agent_cfg");
    // // set num_interrupts & num_alerts which will be used to create coverage and more
    // num_interrupts = ral.intr_state.get_n_used_bits();
    // // only support 1 outstanding TL item
    // m_tl_agent_cfg.max_outstanding_req = 1;
  endfunction
  
endclass: tlul_base_env_cfg

function void tlul_base_env_cfg::create_vip();
    string port_name;
    string port_inst_path;
    int agent_num;
    super.create_vip();
    foreach(harness_api_abstract::harness_api_q[inst_path]) begin
        tl_intf_c tlul_intf;
        if($cast(tlul_intf, harness_api_abstract::harness_api_q[inst_path])) begin
            int port_num = tlul_intf.get_port_num(tl_intf_c::PORT_TYPE); 
            for(int i = 0; i < port_num; i++) begin
                port_name = tlul_intf.get_port_name(tl_intf_c::PORT_TYPE, i);
                port_inst_path = {inst_path, "-", port_name};
                this.tlul_agent_sw[port_inst_path] = dv_utils_pkg::OFF;
                begin
                    //this.tlul_agent_work_mode[port_inst_path] = dv_utils_pkg::MASTER;
                    if(this.m_tlul_agent_cfg[port_inst_path] == null) begin
                        //`uvm_warning(`gfn, $sformatf("need set testcase in top"))
                        this.m_tlul_agent_cfg[port_inst_path] = tl_agent_cfg::type_id::create($sformatf("m_tlul_agent_cfg-%s", port_inst_path));
                    end
                    `uvm_info(get_type_name(), $sformatf("get harness path %s, port_name %s, probably create vip", inst_path, port_name), UVM_LOW);
                end
                agent_num++;
            end
        end
    end
    
    
endfunction: create_vip

