// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: vc707mig1gb_chiplink_bind 
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

`define BIND_TO_DUT_TOP vc707axi_to_pcie_x1


`INTERFACE_DEFINE_BEGIN(`BIND_TO_DUT_TOP)
import axi_bind_lib_pkg::*;
import uvm_pkg::*;
    
    localparam PORT_NUM = 2;
    bit axi_if_port_en[PORT_NUM];
    bit axi_if_is_mst[PORT_NUM];
    bit axi_if_only_monitor[PORT_NUM];

`POLY_CLASS_UTILS_DEFINE_BEGIN(axi_interface, axi_port_info, axi_intf_c)

    function new();
        port_index_name_map[0] = "m_axi_slv";
        port_interface_q[0] = axi_bind_port_slv.u_intf;
        port_index_name_map[1] = "s_axi_mst";
        port_interface_q[1] = axi_bind_port_mst.u_intf;
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
            axi_bind_port_slv.drive_vip();
            axi_bind_port_mst.drive_vip();
        endfunction
    
    endclass

    wire [0:0] axi_bind_port_slv_awid_unused;
    assign axi_bind_port_slv_awid_unused = 0;

    wire [0:0] axi_bind_port_slv_arid_unused;
    assign axi_bind_port_slv_arid_unused = 0;

    wire [0:0] axi_bind_port_slv_wid_unused;
    assign axi_bind_port_slv_wid_unused = 0;

    wire [0:0] axi_bind_port_slv_bid_unused;
    assign axi_bind_port_slv_bid_unused = 0;

    wire [0:0] axi_bind_port_slv_rid_unused;
    assign axi_bind_port_slv_rid_unused = 0;


    wire [3:0] axi_bind_port_slv_awqos_unused;
    assign axi_bind_port_slv_awqos_unused = 0;
    wire [3:0] axi_bind_port_slv_arqos_unused;
    assign axi_bind_port_slv_arqos_unused = 0;


    axi_bind_if #(
        .WIDTH_AWID(1)
        ,.WIDTH_ARID(1)
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
    )  axi_bind_port_slv (
         .clk(`BIND_TO_DUT_TOP.axi_aclk_out)
        ,.rst_n(`BIND_TO_DUT_TOP.axi_aresetn)
        ,.force_en(axi_if_port_en[0])
        ,.is_mst(axi_if_is_mst[0])
        ,.is_only_monitor(axi_if_only_monitor[0])
        ,.awid(axi_bind_port_slv_awid_unused)
        ,.awaddr(`BIND_TO_DUT_TOP.m_axi_awaddr)
        ,.awlen(`BIND_TO_DUT_TOP.m_axi_awlen)
        ,.awlock(`BIND_TO_DUT_TOP.m_axi_awlock)
        ,.awsize(`BIND_TO_DUT_TOP.m_axi_awsize)
        ,.awburst(`BIND_TO_DUT_TOP.m_axi_awburst)
        ,.awcache(`BIND_TO_DUT_TOP.m_axi_awcache)
        ,.awprot(`BIND_TO_DUT_TOP.m_axi_awprot)
        ,.awvalid(`BIND_TO_DUT_TOP.m_axi_awvalid)
        ,.awready(`BIND_TO_DUT_TOP.m_axi_awready)
        ,.awqos(axi_bind_port_slv_awqos_unused)
        //,.awregion(`BIND_TO_DUT_TOP.m_axi_awregion)
        //,.awuser(`BIND_TO_DUT_TOP.m_axi_awuser)

        ,.wid(axi_bind_port_slv_wid_unused)
        ,.wdata(`BIND_TO_DUT_TOP.m_axi_wdata)
        ,.wstrb(`BIND_TO_DUT_TOP.m_axi_wstrb)
        ,.wlast(`BIND_TO_DUT_TOP.m_axi_wlast)
        ,.wvalid(`BIND_TO_DUT_TOP.m_axi_wvalid)
        ,.wready(`BIND_TO_DUT_TOP.m_axi_wready)
        //,.wuser(`BIND_TO_DUT_TOP.m_axi_wuser)

        ,.bid(axi_bind_port_slv_bid_unused)
        ,.bresp(`BIND_TO_DUT_TOP.m_axi_bresp)
        ,.bvalid(`BIND_TO_DUT_TOP.m_axi_bvalid)
        ,.bready(`BIND_TO_DUT_TOP.m_axi_bready)
        //,.buser(`BIND_TO_DUT_TOP.m_axi_buser)

        ,.arid(axi_bind_port_slv_arid_unused)
        ,.araddr(`BIND_TO_DUT_TOP.m_axi_araddr)
        ,.arlen(`BIND_TO_DUT_TOP.m_axi_arlen)
        ,.arlock(`BIND_TO_DUT_TOP.m_axi_arlock)
        ,.arsize(`BIND_TO_DUT_TOP.m_axi_arsize)
        ,.arburst(`BIND_TO_DUT_TOP.m_axi_arburst)
        ,.arcache(`BIND_TO_DUT_TOP.m_axi_arcache)
        ,.arprot(`BIND_TO_DUT_TOP.m_axi_arprot)
        ,.arvalid(`BIND_TO_DUT_TOP.m_axi_arvalid)
        ,.arready(`BIND_TO_DUT_TOP.m_axi_arready)
        ,.arqos(axi_bind_port_slv_arqos_unused)
        //,.arregion(`BIND_TO_DUT_TOP.m_axi_arregion)
        //,.aruser(`BIND_TO_DUT_TOP.m_axi_aruser)

        ,.rid(axi_bind_port_slv_rid_unused)
        ,.rresp(`BIND_TO_DUT_TOP.m_axi_rresp)
        ,.rvalid(`BIND_TO_DUT_TOP.m_axi_rvalid)
        ,.rlast(`BIND_TO_DUT_TOP.m_axi_rlast)
        ,.rdata(`BIND_TO_DUT_TOP.m_axi_rdata)
        ,.rready(`BIND_TO_DUT_TOP.m_axi_rready)
        //,.ruser(`BIND_TO_DUT_TOP.m_axi_ruser)
    );


    wire [3:0] axi_bind_port_mst_wid_unused;
    assign axi_bind_port_mst_wid_unused = 0;

    wire [2:0] axi_bind_port_mst_awprot_unused;
    assign axi_bind_port_mst_awprot_unused = 0;
    wire [2:0] axi_bind_port_mst_arprot_unused;
    assign axi_bind_port_mst_arprot_unused = 0;

    wire [3:0] axi_bind_port_mst_awcache_unused;
    assign axi_bind_port_mst_awcache_unused = 0;
    wire [3:0] axi_bind_port_mst_arcache_unused;
    assign axi_bind_port_mst_arcache_unused = 0;

    wire [3:0] axi_bind_port_mst_awqos_unused;
    assign axi_bind_port_mst_awqos_unused = 0;
    wire [3:0] axi_bind_port_mst_arqos_unused;
    assign axi_bind_port_mst_arqos_unused = 0;

    wire [0:0] axi_bind_port_mst_awlock_unused;
    assign axi_bind_port_mst_awlock_unused = 0;
    wire [0:0] axi_bind_port_mst_arlock_unused;
    assign axi_bind_port_mst_arlock_unused = 0;

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
         .clk(`BIND_TO_DUT_TOP.axi_aclk_out)
        ,.rst_n(`BIND_TO_DUT_TOP.axi_aresetn)
        ,.force_en(axi_if_port_en[1])
        ,.is_mst(axi_if_is_mst[1])
        ,.is_only_monitor(axi_if_only_monitor[1])
        ,.awid(`BIND_TO_DUT_TOP.s_axi_awid)
        ,.awaddr(`BIND_TO_DUT_TOP.s_axi_awaddr)
        ,.awlen(`BIND_TO_DUT_TOP.s_axi_awlen)
        ,.awlock(axi_bind_port_mst_awlock_unused)
        ,.awsize(`BIND_TO_DUT_TOP.s_axi_awsize)
        ,.awburst(`BIND_TO_DUT_TOP.s_axi_awburst)
        ,.awcache(axi_bind_port_mst_awcache_unused)
        ,.awprot(axi_bind_port_mst_awprot_unused)
        ,.awvalid(`BIND_TO_DUT_TOP.s_axi_awvalid)
        ,.awready(`BIND_TO_DUT_TOP.s_axi_awready)
        ,.awqos(axi_bind_port_mst_awqos_unused)
        ,.awregion(`BIND_TO_DUT_TOP.s_axi_awregion)
        //,.awuser(`BIND_TO_DUT_TOP.s_axi_awuser)

        ,.wid(axi_bind_port_mst_wid_unused)
        ,.wdata(`BIND_TO_DUT_TOP.s_axi_wdata)
        ,.wstrb(`BIND_TO_DUT_TOP.s_axi_wstrb)
        ,.wlast(`BIND_TO_DUT_TOP.s_axi_wlast)
        ,.wvalid(`BIND_TO_DUT_TOP.s_axi_wvalid)
        ,.wready(`BIND_TO_DUT_TOP.s_axi_wready)
        //,.wuser(`BIND_TO_DUT_TOP.s_axi_wuser)

        ,.bid(`BIND_TO_DUT_TOP.s_axi_bid)
        ,.bresp(`BIND_TO_DUT_TOP.s_axi_bresp)
        ,.bvalid(`BIND_TO_DUT_TOP.s_axi_bvalid)
        ,.bready(`BIND_TO_DUT_TOP.s_axi_bready)
        //,.buser(`BIND_TO_DUT_TOP.s_axi_buser)

        ,.arid(`BIND_TO_DUT_TOP.s_axi_arid)
        ,.araddr(`BIND_TO_DUT_TOP.s_axi_araddr)
        ,.arlen(`BIND_TO_DUT_TOP.s_axi_arlen)
        ,.arlock(axi_bind_port_mst_arlock_unused)
        ,.arsize(`BIND_TO_DUT_TOP.s_axi_arsize)
        ,.arburst(`BIND_TO_DUT_TOP.s_axi_arburst)
        ,.arcache(axi_bind_port_mst_arcache_unused)
        ,.arprot(axi_bind_port_mst_arprot_unused)
        ,.arvalid(`BIND_TO_DUT_TOP.s_axi_arvalid)
        ,.arready(`BIND_TO_DUT_TOP.s_axi_arready)
        ,.arqos(axi_bind_port_mst_arqos_unused)
        ,.arregion(`BIND_TO_DUT_TOP.s_axi_arregion)
        //,.aruser(`BIND_TO_DUT_TOP.s_axi_aruser)

        ,.rid(`BIND_TO_DUT_TOP.s_axi_rid)
        ,.rresp(`BIND_TO_DUT_TOP.s_axi_rresp)
        ,.rvalid(`BIND_TO_DUT_TOP.s_axi_rvalid)
        ,.rlast(`BIND_TO_DUT_TOP.s_axi_rlast)
        ,.rdata(`BIND_TO_DUT_TOP.s_axi_rdata)
        ,.rready(`BIND_TO_DUT_TOP.s_axi_rready)
        //,.ruser(`BIND_TO_DUT_TOP.s_axi_ruser)
    );


`INTERFACE_DEFINE_END(`BIND_TO_DUT_TOP)


`undef BIND_TO_DUT_TOP
