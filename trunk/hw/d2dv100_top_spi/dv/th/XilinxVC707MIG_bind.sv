// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: XilinxVC707MIG_bind 
// Date Created: 2022.04.28 
// Version		: V1.0
// -------------------------------------------------------------------------------------------------
// File description	:
// -------------------------------------------------------------------------------------------------
// Revision History :
// *************************************************************************************************

//--------------------------------------------------------------------------------------------------
// module declaration
//--------------------------------------------------------------------------------------------------

//VC707BaseShell

import uvm_pkg::*;
`define BIND_TO_DUT_TOP XilinxVC707MIG

`INTERFACE_DEFINE_BEGIN(`BIND_TO_DUT_TOP)
import tl_bind_lib_pkg::*;
import uvm_pkg::*;

`POLY_CLASS_UTILS_DEFINE_BEGIN(tl_if, tl_port_info, tl_intf_c)

    localparam PORT_NUM = 1;
    bit tl_if_port_en[PORT_NUM];
    bit tl_if_is_mst[PORT_NUM];
    bit tl_if_only_monitor[PORT_NUM];

    function new();
        port_index_name_map[0] = "tl_mem_slv";
        port_interface_q[0] = tl_bind_port_mem.u_intf;
        foreach(port_index_name_map[i]) begin
            port_name_index_map[port_index_name_map[i]] = i;
        end
        bind_inst_path = inst_path;
    endfunction

        virtual function void set_vif_work_mode(bit switch, bit [3:0] work_mode, string port_name);
        //if(port_type == tl_intf_c::PORT_TYPE) begin
            `uvm_info("set_tl_vif_work_mode", $sformatf("instance %s set_vif_work_mode %0d, port %s", inst_path, work_mode, port_name), UVM_DEBUG);
            if(port_name_index_map.exists(port_name)) begin
                tl_if_port_en[port_name_index_map[port_name]] = switch;
                if(0
                  || (work_mode == dv_utils_pkg::MASTER)
                  || (work_mode == dv_utils_pkg::MASTER_NO_MONITOR)
                 ) begin
                    tl_if_is_mst[port_name_index_map[port_name]] = dv_utils_pkg::MST;
                    tl_if_only_monitor[port_name_index_map[port_name]] = 0;
                end
                else if(0
                  || (work_mode == dv_utils_pkg::ONLY_MONITOR)
                 ) begin
                    tl_if_is_mst[port_name_index_map[port_name]] = dv_utils_pkg::MST;
                    tl_if_only_monitor[port_name_index_map[port_name]] = 1;
                end
                else begin
                    tl_if_is_mst[port_name_index_map[port_name]] = dv_utils_pkg::SLV;
                    tl_if_only_monitor[port_name_index_map[port_name]] = 0;
                end
                `uvm_info("set_tl_vif_work_mode", $sformatf("instance %s set_vif_work_mode, find match port %s, switch = %0d, mst_slv = %0d, is_monitor = %0d", inst_path, port_name, tl_if_port_en[port_name_index_map[port_name]], tl_if_is_mst[port_name_index_map[port_name]], tl_if_only_monitor[port_name_index_map[port_name]]), UVM_MEDIUM);
            end
            else begin
                `uvm_error("set_tl_vif_work_mode", $sformatf("instance %s set_vif_work_mode error, cannot find match port %s", inst_path, port_name));
            end
        //end
        endfunction

        virtual function void drive_vip();
            tl_bind_port_mem.drive_vip();
        endfunction
    
    endclass
    
    
    // initial begin
    //     //#1ns;
    //     tl_bind_port_mem.drive_vip();
    // end

    tl_bind_if #(
        .WIDTH_AWID(8)
        ,.WIDTH_ARID(8)
        ,.WIDTH_REQ_USER(1)
        ,.WIDTH_RSP_USER(1)
        ,.WIDTH_REQ_SIZE(3)
        ,.WIDTH_RSP_SIZE(3)
        ,.WIDTH_REQ_SOURCE(6)
        ,.WIDTH_RSP_SOURCE(6)
        ,.WIDTH_REQ_PARAM(3)
        ,.WIDTH_RSP_PARAM(2)
        ,.WIDTH_REQ_MASK(8)
        ,.WIDTH_REQ_ADDRESS(32)
        ,.WIDTH_RSP_SINK(1)
        ,.WIDTH_REQ_DATA(64)
        ,.WIDTH_RSP_DATA(64)
    )  tl_bind_port_mem (
         .clk(`BIND_TO_DUT_TOP.clock)
        ,.rst_n(~`BIND_TO_DUT_TOP.reset)
        ,.force_en(tl_if_port_en[0])
        ,.is_mst(tl_if_is_mst[0])
        ,.is_only_monitor(tl_if_only_monitor[0])
        ,.a_valid(`BIND_TO_DUT_TOP.auto_buffer_in_a_valid)
        ,.a_ready(`BIND_TO_DUT_TOP.auto_buffer_in_a_ready)
        ,.a_opcode(`BIND_TO_DUT_TOP.auto_buffer_in_a_bits_opcode)
        ,.a_param(`BIND_TO_DUT_TOP.auto_buffer_in_a_bits_param)
        ,.a_size(`BIND_TO_DUT_TOP.auto_buffer_in_a_bits_size)
        ,.a_source(`BIND_TO_DUT_TOP.auto_buffer_in_a_bits_source)
        ,.a_address(`BIND_TO_DUT_TOP.auto_buffer_in_a_bits_address)
        ,.a_mask(`BIND_TO_DUT_TOP.auto_buffer_in_a_bits_mask)
        ,.a_data(`BIND_TO_DUT_TOP.auto_buffer_in_a_bits_data)
        ,.a_user(`BIND_TO_DUT_TOP.auto_buffer_in_a_bits_corrupt)

        ,.d_ready(`BIND_TO_DUT_TOP.auto_buffer_in_d_ready)
        ,.d_valid(`BIND_TO_DUT_TOP.auto_buffer_in_d_valid)
        ,.d_opcode(`BIND_TO_DUT_TOP.auto_buffer_in_d_bits_opcode)
        ,.d_param(`BIND_TO_DUT_TOP.auto_buffer_in_d_bits_param)
        ,.d_size(`BIND_TO_DUT_TOP.auto_buffer_in_d_bits_size)
        ,.d_source(`BIND_TO_DUT_TOP.auto_buffer_in_d_bits_source)
        ,.d_sink(`BIND_TO_DUT_TOP.auto_buffer_in_d_bits_sink)
        ,.d_data(`BIND_TO_DUT_TOP.auto_buffer_in_d_bits_data)
        ,.d_error(`BIND_TO_DUT_TOP.auto_buffer_in_d_bits_denied)
        ,.d_user(`BIND_TO_DUT_TOP.auto_buffer_in_d_bits_corrupt)
        
    );

`INTERFACE_DEFINE_END(`BIND_TO_DUT_TOP)

`undef BIND_TO_DUT_TOP















