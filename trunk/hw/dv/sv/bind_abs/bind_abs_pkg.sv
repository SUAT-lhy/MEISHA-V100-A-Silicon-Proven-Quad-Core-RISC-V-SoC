// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: bind_abs_pkg 
// Date Created: 2022.04.26 
// Version		: V1.0
// -------------------------------------------------------------------------------------------------
// File description	:
// -------------------------------------------------------------------------------------------------
// Revision History :
// *************************************************************************************************

//--------------------------------------------------------------------------------------------------
// module declaration
//--------------------------------------------------------------------------------------------------

interface apb_interface();
endinterface

interface uart_interface();
endinterface
package bind_abs_pkg;
    import uvm_pkg::*;

    // macro includes
    `include "uvm_macros.svh"

    `include "harness_api_abstract.sv"
    `include "base_intf_c.sv"
    `include "base_port_info.sv"

endpackage

    /* 
    `define INTERFACE_DEFINE_BEGIN_BAK(MODULE_NAME, INTF_ARRAY) \
        interface m_``MODULE_NAME``_bind_if; \
        import bind_abs_pkg::*; \
        static string inst_path = $sformatf("%m"); \
        class harness_api extends harness_api_abstract implements axi_intf_c, apb_intf_c, ``INTF_ARRAY``; \
            int port_name_index_map[string]; \
            static string inst_path_class = $sformatf("%m"); \
            apb_port_info m_apb_port_info[int]; \
            axi_port_info m_axi_port_info[int]; \
            static bit reg_sef = register_sef(); \
            static function string get_inst_path(); \
                int str_length = inst_path_class.len(); \
                for(int i = 0; i < str_length; i++) begin \
                    if(inst_path_class[i] == ".") begin \
                        inst_path_class[i] = "-"; \
                    end \
                end \
                return inst_path_class.substr(3, inst_path_class.len()-43); \
            endfunction \
            static function bit register_sef(); \
                harness_api self_api = new(); \
                harness_api_q[get_inst_path()] = self_api; \
                `uvm_info("harness_api", $sformatf("instance %s - %s register self for module name", inst_path_class, get_inst_path()), UVM_NONE); \
            endfunction \
            virtual function apb_port_info get_apb_info(int port_index); \
                return m_apb_port_info[port_index]; \
            endfunction \
            virtual function axi_port_info get_axi_info(int port_index); \
                return m_axi_port_info[port_index]; \
            endfunction

            */

    `define INTERFACE_DEFINE_BEGIN(MODULE_NAME_MACRO, PREFIX_NAME=m) \
        interface ``PREFIX_NAME``_``MODULE_NAME_MACRO``_bind_if; \
        import bind_abs_pkg::*; \
        static string inst_path = $sformatf("%m");
    `define POLY_CLASS_UTILS_DEFINE_BEGIN(INTFERCE_TYPE_MACRO, INTF_PORT_INFO_MACRO, INTF_CLASS_INFO_MACRO) \
        class harness_api_``INTFERCE_TYPE_MACRO`` extends harness_api_abstract implements base_intf_c, ``INTF_CLASS_INFO_MACRO``; \
            int port_name_index_map[string]; \
            string port_index_name_map[int]; \
            virtual ``INTFERCE_TYPE_MACRO`` port_interface_q[int]; \
            string bind_inst_path; \
            static string inst_path_class = $sformatf("%m"); \
            ``INTF_PORT_INFO_MACRO`` m_port_info[int]; \
            static bit reg_self = register_sef(); \
            static function bit register_sef(); \
                harness_api_``INTFERCE_TYPE_MACRO`` self_api = new(); \
                harness_api_q[get_inst_path()] = self_api; \
                `uvm_info("harness_api", $sformatf("instance %s -> %s  register self for module name", inst_path_class, get_inst_path()), UVM_NONE); \
            endfunction \
            virtual function int get_port_num(string port_type); \
                return port_name_index_map.size(); \
            endfunction \
            virtual function string get_port_name(string port_type, int port_index); \
                return port_index_name_map[port_index]; \
            endfunction \
            virtual function virtual ``INTFERCE_TYPE_MACRO`` get_if(int port_index); \
                return port_interface_q[port_index]; \
            endfunction \
            static function string get_inst_path(); \
                string if_type_string = $sformatf("harness_api_``INTFERCE_TYPE_MACRO``"); \
                int str_length = inst_path_class.len(); \
                int last_split_flat = 0; \
                string return_inst_path = ""; \
                for(int i = str_length - 1; i >= 0; i--) begin \
                    if(inst_path_class[i] == ".") begin \
                        last_split_flat = i; \
                        break; \
                    end \
                end \
                for(int i = 3; i < last_split_flat; i++) begin \
                    if(inst_path_class[i] == ".") begin \
                        inst_path_class[i] = "-"; \
                    end \
                    return_inst_path = $sformatf("%0s%0s", return_inst_path, inst_path_class[i]); \
                end \
                return return_inst_path; \
            endfunction \
            virtual function ``INTF_PORT_INFO_MACRO`` get_port_info(int port_index); \
                return m_port_info[port_index]; \
            endfunction



    `define INTERFACE_DEFINE_END(MODULE_NAME_MACRO, PREFIX_NAME=m) \
        endinterface: ``PREFIX_NAME``_``MODULE_NAME_MACRO``_bind_if \
        bind ``MODULE_NAME_MACRO`` ``PREFIX_NAME``_``MODULE_NAME_MACRO``_bind_if ``MODULE_NAME_MACRO``_``PREFIX_NAME``_bind_if_inst();



            

