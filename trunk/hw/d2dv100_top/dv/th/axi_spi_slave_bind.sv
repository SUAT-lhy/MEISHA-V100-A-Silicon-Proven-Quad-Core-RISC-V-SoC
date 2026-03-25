// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: axi_spi_slave_bind 
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
`ifdef POSTSIM_EN_MEISHA
    `define BIND_TO_DUT_TOP axi_spi_slave_32_64_1_4_32_0
`else
    `define BIND_TO_DUT_TOP axi_spi_slave
`endif

`INTERFACE_DEFINE_BEGIN(`BIND_TO_DUT_TOP)
import axi_bind_lib_pkg::*;
import uvm_pkg::*;
    
    localparam PORT_NUM = 1;
    bit axi_if_port_en[PORT_NUM];
    bit axi_if_is_mst[PORT_NUM];
    bit axi_if_only_monitor[PORT_NUM];

`POLY_CLASS_UTILS_DEFINE_BEGIN(axi_interface, axi_port_info, axi_intf_c)

    function new();
        port_index_name_map[0] = "m_axi_mst";
        port_interface_q[0] = axi_bind_port_mst.u_intf;
        foreach(port_index_name_map[i]) begin
            port_name_index_map[port_index_name_map[i]] = i;
            
            axi_if_port_en[i] = 0;  
        end
        bind_inst_path = inst_path;
    endfunction

        virtual function void set_vif_work_mode(bit switch, bit [3:0] work_mode, string port_name);
        //if(port_type == axi_intf_c::PORT_TYPE) begin
            `uvm_info("set_axi_vif_work_mode", $sformatf("instance %s set_vif_work_mode, port %s", inst_path, port_name), UVM_DEBUG);
            if(port_name_index_map.exists(port_name)) begin
                axi_if_port_en[port_name_index_map[port_name]] = switch;
                if(0
                  || (work_mode == dv_utils_pkg::MASTER)
                  || (work_mode == dv_utils_pkg::MASTER_NO_MONITOR)
                 ) begin
                    axi_if_is_mst[port_name_index_map[port_name]] = dv_utils_pkg::MST;
                    axi_if_only_monitor[port_name_index_map[port_name]] = 0;
                end
                else if(0
                  || (work_mode == dv_utils_pkg::ONLY_MONITOR)
                 ) begin
                    axi_if_is_mst[port_name_index_map[port_name]] = dv_utils_pkg::MST;
                    axi_if_only_monitor[port_name_index_map[port_name]] = 1;
                end
                else begin
                    axi_if_is_mst[port_name_index_map[port_name]] = dv_utils_pkg::SLV;
                    axi_if_only_monitor[port_name_index_map[port_name]] = 0;
                end
                `uvm_info("set_axi_vif_work_mode", $sformatf("instance %s set_vif_work_mode, find match port %s", inst_path, port_name), UVM_DEBUG);
            end
            else begin
                `uvm_error("set_axi_vif_work_mode", $sformatf("instance %s set_vif_work_mode error, cannot find match port %s", inst_path, port_name));
            end
        //end
        endfunction

        
        virtual function void drive_vip();
            axi_bind_port_mst.drive_vip();
        endfunction
    
    endclass

    wire [3:0] axi_bind_port_mst_wid_unused;
    assign axi_bind_port_mst_wid_unused = 0;

    axi_bind_if #(
        .WIDTH_AWID(4)
        ,.WIDTH_ARID(4)
        ,.WIDTH_AWLEN(8)
        ,.WIDTH_ARLEN(8)
        ,.WIDTH_AWADDR(32)
        ,.WIDTH_ARADDR(32)
        ,.WIDTH_AWPROT(3)
        ,.WIDTH_ARPROT(3)
        ,.WIDTH_AWLOCK(1)
        ,.WIDTH_ARLOCK(1)
        ,.WIDTH_WDATA(64)
        ,.WIDTH_RDATA(64)
    )  axi_bind_port_mst (
         .clk(`BIND_TO_DUT_TOP.axi_aclk)
        ,.rst_n(`BIND_TO_DUT_TOP.axi_aresetn)
        ,.force_en(axi_if_port_en[0])
        ,.is_mst(axi_if_is_mst[0])
        ,.is_only_monitor(axi_if_only_monitor[0])
        ,.awid(`BIND_TO_DUT_TOP.axi_master_aw_id)
        ,.awaddr(`BIND_TO_DUT_TOP.axi_master_aw_addr)
        ,.awlen(`BIND_TO_DUT_TOP.axi_master_aw_len)
        ,.awlock(`BIND_TO_DUT_TOP.axi_master_aw_lock)
        ,.awsize(`BIND_TO_DUT_TOP.axi_master_aw_size)
        ,.awburst(`BIND_TO_DUT_TOP.axi_master_aw_burst)
        ,.awcache(`BIND_TO_DUT_TOP.axi_master_aw_cache)
        ,.awprot(`BIND_TO_DUT_TOP.axi_master_aw_prot)
        ,.awvalid(`BIND_TO_DUT_TOP.axi_master_aw_valid)
        ,.awready(`BIND_TO_DUT_TOP.axi_master_aw_ready)
        ,.awqos(`BIND_TO_DUT_TOP.axi_master_aw_qos)
        ,.awregion(`BIND_TO_DUT_TOP.axi_master_aw_region)
        //,.awuser(`BIND_TO_DUT_TOP.axi_master_aw_user)

        ,.wid(axi_bind_port_mst_wid_unused)
        ,.wdata(`BIND_TO_DUT_TOP.axi_master_w_data)
        ,.wstrb(`BIND_TO_DUT_TOP.axi_master_w_strb)
        ,.wlast(`BIND_TO_DUT_TOP.axi_master_w_last)
        ,.wvalid(`BIND_TO_DUT_TOP.axi_master_w_valid)
        ,.wready(`BIND_TO_DUT_TOP.axi_master_w_ready)
        //,.wuser(`BIND_TO_DUT_TOP.axi_master_w_user)

        ,.bid(`BIND_TO_DUT_TOP.axi_master_b_id)
        ,.bresp(`BIND_TO_DUT_TOP.axi_master_b_resp)
        ,.bvalid(`BIND_TO_DUT_TOP.axi_master_b_valid)
        ,.bready(`BIND_TO_DUT_TOP.axi_master_b_ready)
        //,.buser(`BIND_TO_DUT_TOP.axi_master_b_user)

        ,.arid(`BIND_TO_DUT_TOP.axi_master_ar_id)
        ,.araddr(`BIND_TO_DUT_TOP.axi_master_ar_addr)
        ,.arlen(`BIND_TO_DUT_TOP.axi_master_ar_len)
        ,.arlock(`BIND_TO_DUT_TOP.axi_master_ar_lock)
        ,.arsize(`BIND_TO_DUT_TOP.axi_master_ar_size)
        ,.arburst(`BIND_TO_DUT_TOP.axi_master_ar_burst)
        ,.arcache(`BIND_TO_DUT_TOP.axi_master_ar_cache)
        ,.arprot(`BIND_TO_DUT_TOP.axi_master_ar_prot)
        ,.arvalid(`BIND_TO_DUT_TOP.axi_master_ar_valid)
        ,.arready(`BIND_TO_DUT_TOP.axi_master_ar_ready)
        ,.arqos(`BIND_TO_DUT_TOP.axi_master_ar_qos)
        ,.arregion(`BIND_TO_DUT_TOP.axi_master_ar_region)
        //,.aruser(`BIND_TO_DUT_TOP.axi_master_ar_user)

        ,.rid(`BIND_TO_DUT_TOP.axi_master_r_id)
        ,.rresp(`BIND_TO_DUT_TOP.axi_master_r_resp)
        ,.rvalid(`BIND_TO_DUT_TOP.axi_master_r_valid)
        ,.rlast(`BIND_TO_DUT_TOP.axi_master_r_last)
        ,.rdata(`BIND_TO_DUT_TOP.axi_master_r_data)
        ,.rready(`BIND_TO_DUT_TOP.axi_master_r_ready)
        //,.ruser(`BIND_TO_DUT_TOP.axi_master_r_user)
    );


`INTERFACE_DEFINE_END(`BIND_TO_DUT_TOP)


`undef BIND_TO_DUT_TOP
