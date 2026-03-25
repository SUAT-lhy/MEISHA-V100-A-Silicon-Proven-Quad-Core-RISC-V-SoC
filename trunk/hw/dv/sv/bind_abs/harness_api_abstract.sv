
    virtual class harness_api_abstract;

        static harness_api_abstract harness_api_q[string];
        function new();
        endfunction
    

    endclass
//, type INTF_CLASS = axi_intf_c
// class harness_api #(type INTFERCE_TYPE = axi_interface, type INTF_PORT_INFO = axi_port_info) extends harness_api_abstract implements base_intf_c;
//     int port_name_index_map[string];
//     string port_index_name_map[int];
//     virtual INTFERCE_TYPE port_interface_q[int];
//     string bind_inst_path;
//     const static string inst_path_class = $sformatf("%m");
//     INTF_PORT_INFO m_port_info[int];
//     //static bit reg_sef = register_sef();

//     function new(string port_name_q[$], string port_if_q[$], string inst_path);
//         int cnt = 0;
//         if(port_name_q.size() != port_if_q.size()) begin
//             `uvm_error("harness_api", $sformatf("path: %s , function: new the port_name_q size %0d is not equal with port_if_q size %0d", inst_path, port_name_q.size(), port_if_q.size()));
//         end
//         foreach(port_name_q[i]) begin
//             port_index_name_map[cnt] = i;
//             port_interface_q[cnt] = port_if_q[i];
//             port_name_index_map[i] = cnt++;
//             cnt++;            
//         end
//         bind_inst_path = inst_path;
//         register_sef();
//     endfunction

//     virtual function int get_port_num(string port_type);
//         return port_name_index_map.size();
//     endfunction

//     virtual function string get_port_name(string port_type, int port_index);
//         return port_index_name_map[port_index];
//     endfunction

//     virtual function virtual axi_interface get_if(int port_index);
//         return port_interface_q[port_index];
//     endfunction


//     static function string get_inst_path();
//         int str_length = inst_path_class.len();
//         for(int i = 0; i < str_length; i++) begin
//             if(inst_path_class[i] == ".") begin
//                 inst_path_class[i] = "-";
//             end
//         end
//         return inst_path_class.substr(3, inst_path_class.len()-43);
//     endfunction

//     static function bit register_sef();
//         harness_api #(.INTFERCE_TYPE(INTFERCE_TYPE), .INTF_PORT_INFO(INTF_PORT_INFO)) self_api = new();
//         harness_api_q[get_inst_path()] = self_api;
//         `uvm_info("harness_api", $sformatf("instance %s register self for module name", get_inst_path()), UVM_NONE);
//     endfunction

//     virtual function INTF_PORT_INFO get_port_info(int port_index);
//         return m_port_info[port_index];
//     endfunction

// endclass


