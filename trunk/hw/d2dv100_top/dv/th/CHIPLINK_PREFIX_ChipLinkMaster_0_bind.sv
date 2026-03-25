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
`ifdef POSTSIM_EN_MEISHA
    `define BIND_TO_DUT_TOP CHIPLINK_PREFIX_ChipLinkMaster_0

`INTERFACE_DEFINE_BEGIN(`BIND_TO_DUT_TOP)
import axi_bind_lib_pkg::*;
import uvm_pkg::*;
    
    `ifndef CHIPLINK_CONNECT_DIRECT_TL
    localparam PORT_NUM = 2;
    `else
    localparam PORT_NUM = 1;
    `endif
    bit axi_if_port_en[PORT_NUM];
    bit axi_if_is_mst[PORT_NUM];
    bit axi_if_only_monitor[PORT_NUM];

    initial begin
        #10ns;
        `ifdef POSTSIM_EN
            //force axi_bind_port_mst.awaddr[31:28] = 4'b0;  // for this netlist is bug error
            force axi_bind_port_mst.araddr[31:28] = 4'h0;  // for this netlist is bug error, match backdoor
            force axi_bind_port_mst.awlen[7:4] = 4'b0;
            force axi_bind_port_mst.arlen[7:4] = 4'b0;
            force axi_bind_port_mst.awsize[2] = 1'b0;
            force axi_bind_port_mst.arsize[2] = 1'b0;
            force axi_bind_port_mst.awburst[1:0] = 2'b10;
            force axi_bind_port_mst.arburst[1:0] = 2'b10;

            force axi_bind_port_slv.awaddr[31:30] = 2'h0;
            force axi_bind_port_slv.araddr[31:30] = 2'h0;
            force axi_bind_port_slv.bid[4:3] = 2'b0;
            force axi_bind_port_slv.bresp[0] = 1'b0;
            force axi_bind_port_slv.rid[4:3] = 2'b0;
            force axi_bind_port_slv.rresp[0] = 1'b0;

        `endif
    end

`POLY_CLASS_UTILS_DEFINE_BEGIN(axi_interface, axi_port_info, axi_intf_c)

    function new();
        port_index_name_map[0] = "master_mem_0_mst";
        port_interface_q[0] = axi_bind_port_mst.u_intf;
        `ifndef CHIPLINK_CONNECT_DIRECT_TL
        port_index_name_map[1] = "slave_0_slv";
        port_interface_q[1] = axi_bind_port_slv.u_intf;
        `endif
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
        `ifndef CHIPLINK_CONNECT_DIRECT_TL
            axi_bind_port_slv.drive_vip();
        `endif
            axi_bind_port_mst.drive_vip();
        endfunction
    
    endclass

    `ifndef CHIPLINK_CONNECT_DIRECT_TL
    wire [0:0] axi_bind_port_slv_awid_unused;
    assign axi_bind_port_slv_awid_unused = 0;

    wire [0:0] axi_bind_port_slv_arid_unused;
    assign axi_bind_port_slv_arid_unused = 0;

    wire [4:0] axi_bind_port_slv_wid_unused;
    assign axi_bind_port_slv_wid_unused = 0;

    wire [0:0] axi_bind_port_slv_bid_unused;
    assign axi_bind_port_slv_bid_unused = 0;

    wire [0:0] axi_bind_port_slv_rid_unused;
    assign axi_bind_port_slv_rid_unused = 0;


    wire [3:0] axi_bind_port_slv_awqos_unused;
    assign axi_bind_port_slv_awqos_unused = 0;
    wire [3:0] axi_bind_port_slv_arqos_unused;
    assign axi_bind_port_slv_arqos_unused = 0;

    wire [2:0] axi_bind_port_slv_awprot_unused;
    assign axi_bind_port_slv_awprot_unused = 0;
    wire [2:0] axi_bind_port_slv_arprot_unused;
    assign axi_bind_port_slv_arprot_unused = 0;

    wire [3:0] axi_bind_port_slv_awcache_unused;
    assign axi_bind_port_slv_awcache_unused = 0;
    wire [3:0] axi_bind_port_slv_arcache_unused;
    assign axi_bind_port_slv_arcache_unused = 0;

    wire [0:0] axi_bind_port_slv_awlock_unused;
    assign axi_bind_port_slv_awlock_unused = 0;
    wire [0:0] axi_bind_port_slv_arlock_unused;
    assign axi_bind_port_slv_arlock_unused = 0;

    axi_bind_if #(
        .WIDTH_AWID(5)
        ,.WIDTH_ARID(5)
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
         .clk(`BIND_TO_DUT_TOP.clock)
        ,.rst_n(~`BIND_TO_DUT_TOP.reset)
        ,.force_en(axi_if_port_en[1])
        ,.is_mst(axi_if_is_mst[1])
        ,.is_only_monitor(axi_if_only_monitor[1])
        ,.awid(`BIND_TO_DUT_TOP.slave_0_awid)
        ,.awaddr(`BIND_TO_DUT_TOP.slave_0_awaddr)
        ,.awlen(`BIND_TO_DUT_TOP.slave_0_awlen)
        ,.awlock(axi_bind_port_slv_awlock_unused)
        ,.awsize(`BIND_TO_DUT_TOP.slave_0_awsize)
        ,.awburst(`BIND_TO_DUT_TOP.slave_0_awburst)
        ,.awcache(axi_bind_port_slv_awcache_unused)
        ,.awprot(axi_bind_port_slv_awprot_unused)
        ,.awvalid(`BIND_TO_DUT_TOP.slave_0_awvalid)
        ,.awready(`BIND_TO_DUT_TOP.slave_0_awready)
        ,.awqos(axi_bind_port_slv_awqos_unused)
        //,.awregion(`BIND_TO_DUT_TOP.slave_0_awregion)
        //,.awuser(`BIND_TO_DUT_TOP.slave_0_awuser)

        ,.wid(axi_bind_port_slv_wid_unused)
        ,.wdata(`BIND_TO_DUT_TOP.slave_0_wdata)
        ,.wstrb(`BIND_TO_DUT_TOP.slave_0_wstrb)
        ,.wlast(`BIND_TO_DUT_TOP.slave_0_wlast)
        ,.wvalid(`BIND_TO_DUT_TOP.slave_0_wvalid)
        ,.wready(`BIND_TO_DUT_TOP.slave_0_wready)
        //,.wuser(`BIND_TO_DUT_TOP.slave_0_wuser)

        ,.bid(`BIND_TO_DUT_TOP.slave_0_bid)
        ,.bresp(`BIND_TO_DUT_TOP.slave_0_bresp)
        ,.bvalid(`BIND_TO_DUT_TOP.slave_0_bvalid)
        ,.bready(`BIND_TO_DUT_TOP.slave_0_bready)
        //,.buser(`BIND_TO_DUT_TOP.slave_0_buser)

        ,.arid(`BIND_TO_DUT_TOP.slave_0_arid)
        ,.araddr(`BIND_TO_DUT_TOP.slave_0_araddr)
        ,.arlen(`BIND_TO_DUT_TOP.slave_0_arlen)
        ,.arlock(axi_bind_port_slv_arlock_unused)
        ,.arsize(`BIND_TO_DUT_TOP.slave_0_arsize)
        ,.arburst(`BIND_TO_DUT_TOP.slave_0_arburst)
        ,.arcache(axi_bind_port_slv_arcache_unused)
        ,.arprot(axi_bind_port_slv_arprot_unused)
        ,.arvalid(`BIND_TO_DUT_TOP.slave_0_arvalid)
        ,.arready(`BIND_TO_DUT_TOP.slave_0_arready)
        ,.arqos(axi_bind_port_slv_arqos_unused)
        //,.arregion(`BIND_TO_DUT_TOP.slave_0_arregion)
        //,.aruser(`BIND_TO_DUT_TOP.slave_0_aruser)

        ,.rid(`BIND_TO_DUT_TOP.slave_0_rid)
        ,.rresp(`BIND_TO_DUT_TOP.slave_0_rresp)
        ,.rvalid(`BIND_TO_DUT_TOP.slave_0_rvalid)
        ,.rlast(`BIND_TO_DUT_TOP.slave_0_rlast)
        ,.rdata(`BIND_TO_DUT_TOP.slave_0_rdata)
        ,.rready(`BIND_TO_DUT_TOP.slave_0_rready)
        //,.ruser(`BIND_TO_DUT_TOP.slave_0_ruser)
    );
`endif

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
         .clk(`BIND_TO_DUT_TOP.clock)
        ,.rst_n(~`BIND_TO_DUT_TOP.reset)
        ,.force_en(axi_if_port_en[0])
        ,.is_mst(axi_if_is_mst[0])
        ,.is_only_monitor(axi_if_only_monitor[0])
        ,.awid(`BIND_TO_DUT_TOP.master_mem_0_awid)
        ,.awaddr(`BIND_TO_DUT_TOP.master_mem_0_awaddr)
        ,.awlen(`BIND_TO_DUT_TOP.master_mem_0_awlen)
        ,.awlock(axi_bind_port_mst_awlock_unused)
        ,.awsize(`BIND_TO_DUT_TOP.master_mem_0_awsize)
        ,.awburst(`BIND_TO_DUT_TOP.master_mem_0_awburst)
        ,.awcache(axi_bind_port_mst_awcache_unused)
        ,.awprot(axi_bind_port_mst_awprot_unused)
        ,.awvalid(`BIND_TO_DUT_TOP.master_mem_0_awvalid)
        ,.awready(`BIND_TO_DUT_TOP.master_mem_0_awready)
        ,.awqos(axi_bind_port_mst_awqos_unused)
        //,.awregion(`BIND_TO_DUT_TOP.master_mem_0_awregion)
        //,.awuser(`BIND_TO_DUT_TOP.master_mem_0_awuser)

        ,.wid(axi_bind_port_mst_wid_unused)
        ,.wdata(`BIND_TO_DUT_TOP.master_mem_0_wdata)
        ,.wstrb(`BIND_TO_DUT_TOP.master_mem_0_wstrb)
        ,.wlast(`BIND_TO_DUT_TOP.master_mem_0_wlast)
        ,.wvalid(`BIND_TO_DUT_TOP.master_mem_0_wvalid)
        ,.wready(`BIND_TO_DUT_TOP.master_mem_0_wready)
        //,.wuser(`BIND_TO_DUT_TOP.master_mem_0_wuser)

        ,.bid(`BIND_TO_DUT_TOP.master_mem_0_bid)
        ,.bresp(`BIND_TO_DUT_TOP.master_mem_0_bresp)
        ,.bvalid(`BIND_TO_DUT_TOP.master_mem_0_bvalid)
        ,.bready(`BIND_TO_DUT_TOP.master_mem_0_bready)
        //,.buser(`BIND_TO_DUT_TOP.master_mem_0_buser)

        ,.arid(`BIND_TO_DUT_TOP.master_mem_0_arid)
        ,.araddr(`BIND_TO_DUT_TOP.master_mem_0_araddr)
        ,.arlen(`BIND_TO_DUT_TOP.master_mem_0_arlen)
        ,.arlock(axi_bind_port_mst_arlock_unused)
        ,.arsize(`BIND_TO_DUT_TOP.master_mem_0_arsize)
        ,.arburst(`BIND_TO_DUT_TOP.master_mem_0_arburst)
        ,.arcache(axi_bind_port_mst_arcache_unused)
        ,.arprot(axi_bind_port_mst_arprot_unused)
        ,.arvalid(`BIND_TO_DUT_TOP.master_mem_0_arvalid)
        ,.arready(`BIND_TO_DUT_TOP.master_mem_0_arready)
        ,.arqos(axi_bind_port_mst_arqos_unused)
        //,.arregion(`BIND_TO_DUT_TOP.master_mem_0_arregion)
        //,.aruser(`BIND_TO_DUT_TOP.master_mem_0_aruser)

        ,.rid(`BIND_TO_DUT_TOP.master_mem_0_rid)
        ,.rresp(`BIND_TO_DUT_TOP.master_mem_0_rresp)
        ,.rvalid(`BIND_TO_DUT_TOP.master_mem_0_rvalid)
        ,.rlast(`BIND_TO_DUT_TOP.master_mem_0_rlast)
        ,.rdata(`BIND_TO_DUT_TOP.master_mem_0_rdata)
        ,.rready(`BIND_TO_DUT_TOP.master_mem_0_rready)
        //,.ruser(`BIND_TO_DUT_TOP.master_mem_0_ruser)
    );


`INTERFACE_DEFINE_END(`BIND_TO_DUT_TOP)


`undef BIND_TO_DUT_TOP
`endif
