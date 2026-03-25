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
    `define BIND_TO_DUT_TOP nvdla_small_0
`else
    `define BIND_TO_DUT_TOP nvdla_small
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

    wire [7:0] axi_bind_port_mst_wid_unused;
    assign axi_bind_port_mst_wid_unused = 0;

    axi_bind_if #(
        .WIDTH_AWID(8)
        ,.WIDTH_ARID(8)
        ,.WIDTH_AWLEN(4)
        ,.WIDTH_ARLEN(4)
        ,.WIDTH_AWADDR(32)
        ,.WIDTH_ARADDR(32)
        ,.WIDTH_AWPROT(3)
        ,.WIDTH_ARPROT(3)
        ,.WIDTH_AWLOCK(1)
        ,.WIDTH_ARLOCK(1)
        ,.WIDTH_WDATA(64)
        ,.WIDTH_RDATA(64)
    )  axi_bind_port_mst (
         .clk(`BIND_TO_DUT_TOP.core_clk)
        ,.rst_n(`BIND_TO_DUT_TOP.rstn)
        ,.force_en(axi_if_port_en[0])
        ,.is_mst(axi_if_is_mst[0])
        ,.is_only_monitor(axi_if_only_monitor[0])
        ,.awid(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awid)
        ,.awaddr(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awaddr)
        ,.awlen(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awlen)
        //,.awlock(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awlock)
        //,.awsize(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awsize)
        //,.awburst(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awburst)
        //,.awcache(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awcache)
        //,.awprot(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awprot)
        ,.awvalid(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awvalid)
        ,.awready(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awready)
        //,.awqos(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awqos)
        //,.awregion(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awregion)
        //,.awuser(`BIND_TO_DUT_TOP.nvdla_core2dbb_aw_awuser)

        ,.wid(axi_bind_port_mst_wid_unused)
        ,.wdata(`BIND_TO_DUT_TOP.nvdla_core2dbb_w_wdata)
        ,.wstrb(`BIND_TO_DUT_TOP.nvdla_core2dbb_w_wstrb)
        ,.wlast(`BIND_TO_DUT_TOP.nvdla_core2dbb_w_wlast)
        ,.wvalid(`BIND_TO_DUT_TOP.nvdla_core2dbb_w_wvalid)
        ,.wready(`BIND_TO_DUT_TOP.nvdla_core2dbb_w_wready)
        //,.wuser(`BIND_TO_DUT_TOP.nvdla_core2dbb_w_wuser)

        ,.bid(`BIND_TO_DUT_TOP.nvdla_core2dbb_b_bid)
        //,.bresp(`BIND_TO_DUT_TOP.nvdla_core2dbb_b_bresp)
        ,.bvalid(`BIND_TO_DUT_TOP.nvdla_core2dbb_b_bvalid)
        ,.bready(`BIND_TO_DUT_TOP.nvdla_core2dbb_b_bready)
        //,.buser(`BIND_TO_DUT_TOP.nvdla_core2dbb_b_buser)

        ,.arid(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_arid)
        ,.araddr(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_araddr)
        ,.arlen(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_arlen)
        //,.arlock(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_arlock)
        //,.arsize(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_arsize)
        //,.arburst(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_arburst)
        //,.arcache(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_arcache)
        //,.arprot(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_arprot)
        ,.arvalid(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_arvalid)
        ,.arready(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_arready)
        //,.arqos(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_arqos)
        //,.arregion(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_arregion)
        //,.aruser(`BIND_TO_DUT_TOP.nvdla_core2dbb_ar_aruser)

        ,.rid(`BIND_TO_DUT_TOP.nvdla_core2dbb_r_rid)
        //,.rresp(`BIND_TO_DUT_TOP.nvdla_core2dbb_r_rresp)
        ,.rvalid(`BIND_TO_DUT_TOP.nvdla_core2dbb_r_rvalid)
        ,.rlast(`BIND_TO_DUT_TOP.nvdla_core2dbb_r_rlast)
        ,.rdata(`BIND_TO_DUT_TOP.nvdla_core2dbb_r_rdata)
        ,.rready(`BIND_TO_DUT_TOP.nvdla_core2dbb_r_rready)
        //,.ruser(`BIND_TO_DUT_TOP.nvdla_core2dbb_r_ruser)
    );


`INTERFACE_DEFINE_END(`BIND_TO_DUT_TOP)


`undef BIND_TO_DUT_TOP
