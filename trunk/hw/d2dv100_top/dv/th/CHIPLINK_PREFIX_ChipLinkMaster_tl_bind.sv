// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: RocketTile_bind 
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
`ifdef CHIPLINK_CONNECT_DIRECT_TL
`define BIND_TO_DUT_TOP CHIPLINK_PREFIX_ChipLinkMaster

`INTERFACE_DEFINE_BEGIN(`BIND_TO_DUT_TOP,tl)
import tl_bind_lib_pkg::*;
import uvm_pkg::*;

    localparam PORT_NUM = 1;
    bit tl_if_port_en[PORT_NUM];
    bit tl_if_is_mst[PORT_NUM];
    bit tl_if_only_monitor[PORT_NUM];

`POLY_CLASS_UTILS_DEFINE_BEGIN(tl_if, tl_port_info, tl_intf_c)

    function new();
        port_index_name_map[0] = "tl_slv";
        port_interface_q[0] = tl_bind_port_slv.u_intf;
        foreach(port_index_name_map[i]) begin
            port_name_index_map[port_index_name_map[i]] = i;
            tl_if_port_en[i] = 0;
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
            tl_bind_port_slv.drive_vip();
        endfunction
    
    endclass
    


    
    wire [0:0] tl_bind_port_slv_a_user_unused;
    assign tl_bind_port_slv_a_user_unused = 0;
    wire [0:0] tl_bind_port_slv_a_param_unused;
    assign tl_bind_port_slv_a_param_unused = 0;
    
    wire [0:0] tl_bind_port_slv_d_user_unused;
    assign tl_bind_port_slv_d_user_unused = 0;
    wire [0:0] tl_bind_port_slv_d_param_unused;
    assign tl_bind_port_slv_d_param_unused = 0;
    wire [0:0] tl_bind_port_slv_d_sink_unused;
    assign tl_bind_port_slv_d_sink_unused = 0;

    tl_bind_if #(
         .WIDTH_REQ_USER(1)
        ,.WIDTH_RSP_USER(1)
        ,.WIDTH_REQ_SIZE(3)
        ,.WIDTH_RSP_SIZE(3)
        ,.WIDTH_REQ_SOURCE(4)
        ,.WIDTH_RSP_SOURCE(4)
        ,.WIDTH_REQ_PARAM(1)
        ,.WIDTH_RSP_PARAM(1)
        ,.WIDTH_REQ_MASK(8)
        ,.WIDTH_REQ_ADDRESS(32)
        ,.WIDTH_RSP_SINK(1)
        ,.WIDTH_REQ_DATA(64)
        ,.WIDTH_RSP_DATA(64)
    )  tl_bind_port_slv (
         .clk(`BIND_TO_DUT_TOP.clock)
        ,.rst_n(~`BIND_TO_DUT_TOP.reset)
        ,.force_en(tl_if_port_en[0])
        ,.is_mst(tl_if_is_mst[0])
        ,.is_only_monitor(tl_if_only_monitor[0])
        ,.a_valid(`BIND_TO_DUT_TOP.widget_auto_in_a_valid)
        ,.a_user(tl_bind_port_slv_a_user_unused)
        ,.a_opcode(`BIND_TO_DUT_TOP.widget_auto_in_a_bits_opcode)
        ,.a_param(tl_bind_port_slv_a_param_unused)
        ,.a_size(`BIND_TO_DUT_TOP.widget_auto_in_a_bits_size)
        ,.a_source(`BIND_TO_DUT_TOP.widget_auto_in_a_bits_source)
        ,.a_address(`BIND_TO_DUT_TOP.widget_auto_in_a_bits_address)
        ,.a_mask(`BIND_TO_DUT_TOP.widget_auto_in_a_bits_mask)
        ,.a_data(`BIND_TO_DUT_TOP.widget_auto_in_a_bits_data)
        ,.a_ready(`BIND_TO_DUT_TOP.widget_auto_in_a_ready)
        

        ,.d_valid(`BIND_TO_DUT_TOP.widget_auto_in_d_valid)
        ,.d_user(tl_bind_port_slv_d_user_unused)
        ,.d_opcode(`BIND_TO_DUT_TOP.widget_auto_in_d_bits_opcode)
        ,.d_param(tl_bind_port_slv_d_param_unused)
        ,.d_size(`BIND_TO_DUT_TOP.widget_auto_in_d_bits_size)
        ,.d_source(`BIND_TO_DUT_TOP.widget_auto_in_d_bits_source)
        ,.d_sink(tl_bind_port_slv_d_sink_unused)
        ,.d_data(`BIND_TO_DUT_TOP.widget_auto_in_d_bits_data)
        ,.d_error(`BIND_TO_DUT_TOP.widget_auto_in_d_bits_denied)
        ,.d_ready(`BIND_TO_DUT_TOP.widget_auto_in_d_ready)
    );


`INTERFACE_DEFINE_END(`BIND_TO_DUT_TOP,tl)

`undef BIND_TO_DUT_TOP

`endif