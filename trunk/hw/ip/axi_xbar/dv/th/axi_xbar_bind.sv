// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: axi_xbar_bind 
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

`INTERFACE_DEFINE_BEGIN(amba_axi_m2s3)
import axi_bind_lib_pkg::*;
import uvm_pkg::*;

`POLY_CLASS_UTILS_DEFINE_BEGIN(axi_interface, axi_port_info, axi_intf_c)

    function new();
        port_index_name_map[0] = "m0_axi_mst";
        port_index_name_map[1] = "m1_axi_mst";
        port_index_name_map[2] = "s0_axi_slv";
        port_index_name_map[3] = "s1_axi_slv";
        port_index_name_map[4] = "s2_axi_slv";
        port_index_name_map[5] = "default_axi_slv";
        port_interface_q[0] = axi_bind_port_0.u_intf;
        port_interface_q[1] = axi_bind_port_1.u_intf;
        port_interface_q[2] = axi_bind_port_2.u_intf;
        port_interface_q[3] = axi_bind_port_3.u_intf;
        port_interface_q[4] = axi_bind_port_4.u_intf;
        port_interface_q[5] = axi_bind_port_5.u_intf;
        foreach(port_index_name_map[i]) begin
            port_name_index_map[port_index_name_map[i]] = i;
        end
        bind_inst_path = inst_path;
    endfunction

        virtual function void set_vif_work_mode(bit switch, bit [3:0] work_mode, string port_name);
        //if(port_type == axi_intf_c::PORT_TYPE) begin
            `uvm_info("set_axi_vif_work_mode", $sformatf("instance %s set_vif_work_mode, port %s", inst_path, port_name), UVM_DEBUG);
            if(port_name_index_map.exists(port_name)) begin
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
                axi_if_port_en[port_name_index_map[port_name]] = switch;
                // axi_if_is_mst[port_name_index_map[port_name]] = mst_slv;
                // axi_if_only_monitor[port_name_index_map[port_name]] = is_monitor;
                `uvm_info("set_axi_vif_work_mode", $sformatf("instance %s set_vif_work_mode, find match port %s, switch = %0d, mst_slv = %0d, is_monitor = %0d", inst_path, port_name, axi_if_port_en[port_name_index_map[port_name]], axi_if_is_mst[port_name_index_map[port_name]], axi_if_only_monitor[port_name_index_map[port_name]]), UVM_MEDIUM);
            end
            else begin
                `uvm_error("set_axi_vif_work_mode", $sformatf("instance %s set_vif_work_mode error, cannot find match port %s", inst_path, port_name));
            end
        //end
        endfunction

        
        virtual function void drive_vip();
            axi_bind_port_0.drive_vip();
            axi_bind_port_1.drive_vip();
            axi_bind_port_2.drive_vip();
            axi_bind_port_3.drive_vip();
            axi_bind_port_4.drive_vip();
            axi_bind_port_5.drive_vip();
        endfunction
    
    endclass
    
    localparam PORT_NUM = 6;
    bit axi_if_port_en[PORT_NUM];
    bit axi_if_is_mst[PORT_NUM];
    bit axi_if_only_monitor[PORT_NUM];

    
    // initial begin
    //     //#1ns;
    //     axi_bind_port_0.drive_vip();
    //     axi_bind_port_1.drive_vip();
    //     axi_bind_port_2.drive_vip();
    //     axi_bind_port_3.drive_vip();
    //     axi_bind_port_4.drive_vip();
    //     axi_bind_port_5.drive_vip();
    // end

    axi_bind_if #(
        .WIDTH_AWID(8)
        ,.WIDTH_ARID(8)
        ,.WIDTH_AWLEN(4)
        ,.WIDTH_ARLEN(4)
        ,.WIDTH_WDATA(64)
        ,.WIDTH_RDATA(64)
    )  axi_bind_port_0 (
         .clk(amba_axi_m2s3.ACLK)
        ,.rst_n(amba_axi_m2s3.ARESETn)
        ,.force_en(axi_if_port_en[0])
        ,.is_mst(axi_if_is_mst[0])
        ,.is_only_monitor(axi_if_only_monitor[0])
        ,.awid(amba_axi_m2s3.M0_AWID)
        ,.awaddr(amba_axi_m2s3.M0_AWADDR)
        ,.awlen(amba_axi_m2s3.M0_AWLEN)
        ,.awlock(amba_axi_m2s3.M0_AWLOCK)
        ,.awsize(amba_axi_m2s3.M0_AWSIZE)
        ,.awburst(amba_axi_m2s3.M0_AWBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.awcache(amba_axi_m2s3.M0_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.awprot(amba_axi_m2s3.M0_AWPROT)
        `endif
        ,.awvalid(amba_axi_m2s3.M0_AWVALID)
        ,.awready(amba_axi_m2s3.M0_AWREADY)
        `ifdef AMBA_AXI4
        ,.awqos(amba_axi_m2s3.M0_AWQOS)
        ,.awregion(amba_axi_m2s3.M0_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
        ,.awuser(amba_axi_m2s3.M0_AWUSER)
        `endif

        ,.wid(amba_axi_m2s3.M0_WID)
        ,.wdata(amba_axi_m2s3.M0_WDATA)
        ,.wstrb(amba_axi_m2s3.M0_WSTRB)
        ,.wlast(amba_axi_m2s3.M0_WLAST)
        ,.wvalid(amba_axi_m2s3.M0_WVALID)
        ,.wready(amba_axi_m2s3.M0_WREADY)
        `ifdef AMBA_AXI_WUSER
        ,.wuser(amba_axi_m2s3.M0_WUSER)
        `endif

        ,.bid(amba_axi_m2s3.M0_BID)
        ,.bresp(amba_axi_m2s3.M0_BRESP)
        ,.bvalid(amba_axi_m2s3.M0_BVALID)
        ,.bready(amba_axi_m2s3.M0_BREADY)
        `ifdef AMBA_AXI_BUSER
        ,.buser(amba_axi_m2s3.M0_BUSER)
        `endif

        ,.arid(amba_axi_m2s3.M0_ARID)
        ,.araddr(amba_axi_m2s3.M0_ARADDR)
        ,.arlen(amba_axi_m2s3.M0_ARLEN)
        ,.arlock(amba_axi_m2s3.M0_ARLOCK)
        ,.arsize(amba_axi_m2s3.M0_ARSIZE)
        ,.arburst(amba_axi_m2s3.M0_ARBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.arcache(amba_axi_m2s3.M0_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.arprot(amba_axi_m2s3.M0_ARPROT)
        `endif
        ,.arvalid(amba_axi_m2s3.M0_ARVALID)
        ,.arready(amba_axi_m2s3.M0_ARREADY)
        `ifdef AMBA_AXI4
        ,.arqos(amba_axi_m2s3.M0_ARQOS)
        ,.arregion(amba_axi_m2s3.M0_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
        ,.aruser(amba_axi_m2s3.M0_ARUSER)
        `endif

        ,.rid(amba_axi_m2s3.M0_RID)
        ,.rresp(amba_axi_m2s3.M0_RRESP)
        ,.rvalid(amba_axi_m2s3.M0_RVALID)
        ,.rlast(amba_axi_m2s3.M0_RLAST)
        ,.rdata(amba_axi_m2s3.M0_RDATA)
        ,.rready(amba_axi_m2s3.M0_RREADY)
        `ifdef AMBA_AXI_RUSER
        ,.ruser(amba_axi_m2s3.M0_RUSER)
        `endif
    );

    axi_bind_if #(
        .WIDTH_AWID(8)
        ,.WIDTH_ARID(8)
        ,.WIDTH_AWLEN(4)
        ,.WIDTH_ARLEN(4)
        ,.WIDTH_WDATA(64)
        ,.WIDTH_RDATA(64)
    )  axi_bind_port_1 (
         .clk(amba_axi_m2s3.ACLK)
        ,.rst_n(amba_axi_m2s3.ARESETn)
        ,.force_en(axi_if_port_en[1])
        ,.is_mst(axi_if_is_mst[1])
        ,.is_only_monitor(axi_if_only_monitor[1])
        ,.awid(amba_axi_m2s3.M1_AWID)
        ,.awaddr(amba_axi_m2s3.M1_AWADDR)
        ,.awlen(amba_axi_m2s3.M1_AWLEN)
        ,.awlock(amba_axi_m2s3.M1_AWLOCK)
        ,.awsize(amba_axi_m2s3.M1_AWSIZE)
        ,.awburst(amba_axi_m2s3.M1_AWBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.awcache(amba_axi_m2s3.M1_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.awprot(amba_axi_m2s3.M1_AWPROT)
        `endif
        ,.awvalid(amba_axi_m2s3.M1_AWVALID)
        ,.awready(amba_axi_m2s3.M1_AWREADY)
        `ifdef AMBA_AXI4
        ,.awqos(amba_axi_m2s3.M1_AWQOS)
        ,.awregion(amba_axi_m2s3.M1_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
        ,.awuser(amba_axi_m2s3.M1_AWUSER)
        `endif

        ,.wid(amba_axi_m2s3.M1_WID)
        ,.wdata(amba_axi_m2s3.M1_WDATA)
        ,.wstrb(amba_axi_m2s3.M1_WSTRB)
        ,.wlast(amba_axi_m2s3.M1_WLAST)
        ,.wvalid(amba_axi_m2s3.M1_WVALID)
        ,.wready(amba_axi_m2s3.M1_WREADY)
        `ifdef AMBA_AXI_WUSER
        ,.wuser(amba_axi_m2s3.M1_WUSER)
        `endif

        ,.bid(amba_axi_m2s3.M1_BID)
        ,.bresp(amba_axi_m2s3.M1_BRESP)
        ,.bvalid(amba_axi_m2s3.M1_BVALID)
        ,.bready(amba_axi_m2s3.M1_BREADY)
        `ifdef AMBA_AXI_BUSER
        ,.buser(amba_axi_m2s3.M1_BUSER)
        `endif

        ,.arid(amba_axi_m2s3.M1_ARID)
        ,.araddr(amba_axi_m2s3.M1_ARADDR)
        ,.arlen(amba_axi_m2s3.M1_ARLEN)
        ,.arlock(amba_axi_m2s3.M1_ARLOCK)
        ,.arsize(amba_axi_m2s3.M1_ARSIZE)
        ,.arburst(amba_axi_m2s3.M1_ARBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.arcache(amba_axi_m2s3.M1_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.arprot(amba_axi_m2s3.M1_ARPROT)
        `endif
        ,.arvalid(amba_axi_m2s3.M1_ARVALID)
        ,.arready(amba_axi_m2s3.M1_ARREADY)
        `ifdef AMBA_AXI4
        ,.arqos(amba_axi_m2s3.M1_ARQOS)
        ,.arregion(amba_axi_m2s3.M1_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
        ,.aruser(amba_axi_m2s3.M1_ARUSER)
        `endif

        ,.rid(amba_axi_m2s3.M1_RID)
        ,.rresp(amba_axi_m2s3.M1_RRESP)
        ,.rvalid(amba_axi_m2s3.M1_RVALID)
        ,.rlast(amba_axi_m2s3.M1_RLAST)
        ,.rdata(amba_axi_m2s3.M1_RDATA)
        ,.rready(amba_axi_m2s3.M1_RREADY)
        `ifdef AMBA_AXI_RUSER
        ,.ruser(amba_axi_m2s3.M1_RUSER)
        `endif
    );

    axi_bind_if #(
        .WIDTH_AWID(12)
        ,.WIDTH_ARID(12)
        ,.WIDTH_AWLEN(4)
        ,.WIDTH_ARLEN(4)
        ,.WIDTH_WDATA(64)
        ,.WIDTH_RDATA(64)
    )  axi_bind_port_2 (
         .clk(amba_axi_m2s3.ACLK)
        ,.rst_n(amba_axi_m2s3.ARESETn)
        ,.force_en(axi_if_port_en[2])
        ,.is_mst(axi_if_is_mst[2])
        ,.is_only_monitor(axi_if_only_monitor[2])
        ,.awid(amba_axi_m2s3.S0_AWID)
        ,.awaddr(amba_axi_m2s3.S0_AWADDR)
        ,.awlen(amba_axi_m2s3.S0_AWLEN)
        ,.awlock(amba_axi_m2s3.S0_AWLOCK)
        ,.awsize(amba_axi_m2s3.S0_AWSIZE)
        ,.awburst(amba_axi_m2s3.S0_AWBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.awcache(amba_axi_m2s3.S0_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.awprot(amba_axi_m2s3.S0_AWPROT)
        `endif
        ,.awvalid(amba_axi_m2s3.S0_AWVALID)
        ,.awready(amba_axi_m2s3.S0_AWREADY)
        `ifdef AMBA_AXI4
        ,.awqos(amba_axi_m2s3.S0_AWQOS)
        ,.awregion(amba_axi_m2s3.S0_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
        ,.awuser(amba_axi_m2s3.S0_AWUSER)
        `endif

        ,.wid(amba_axi_m2s3.S0_WID)
        ,.wdata(amba_axi_m2s3.S0_WDATA)
        ,.wstrb(amba_axi_m2s3.S0_WSTRB)
        ,.wlast(amba_axi_m2s3.S0_WLAST)
        ,.wvalid(amba_axi_m2s3.S0_WVALID)
        ,.wready(amba_axi_m2s3.S0_WREADY)
        `ifdef AMBA_AXI_WUSER
        ,.wuser(amba_axi_m2s3.S0_WUSER)
        `endif

        ,.bid(amba_axi_m2s3.S0_BID)
        ,.bresp(amba_axi_m2s3.S0_BRESP)
        ,.bvalid(amba_axi_m2s3.S0_BVALID)
        ,.bready(amba_axi_m2s3.S0_BREADY)
        `ifdef AMBA_AXI_BUSER
        ,.buser(amba_axi_m2s3.S0_BUSER)
        `endif

        ,.arid(amba_axi_m2s3.S0_ARID)
        ,.araddr(amba_axi_m2s3.S0_ARADDR)
        ,.arlen(amba_axi_m2s3.S0_ARLEN)
        ,.arlock(amba_axi_m2s3.S0_ARLOCK)
        ,.arsize(amba_axi_m2s3.S0_ARSIZE)
        ,.arburst(amba_axi_m2s3.S0_ARBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.arcache(amba_axi_m2s3.S0_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.arprot(amba_axi_m2s3.S0_ARPROT)
        `endif
        ,.arvalid(amba_axi_m2s3.S0_ARVALID)
        ,.arready(amba_axi_m2s3.S0_ARREADY)
        `ifdef AMBA_AXI4
        ,.arqos(amba_axi_m2s3.S0_ARQOS)
        ,.arregion(amba_axi_m2s3.S0_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
        ,.aruser(amba_axi_m2s3.S0_ARUSER)
        `endif

        ,.rid(amba_axi_m2s3.S0_RID)
        ,.rresp(amba_axi_m2s3.S0_RRESP)
        ,.rvalid(amba_axi_m2s3.S0_RVALID)
        ,.rlast(amba_axi_m2s3.S0_RLAST)
        ,.rdata(amba_axi_m2s3.S0_RDATA)
        ,.rready(amba_axi_m2s3.S0_RREADY)
        `ifdef AMBA_AXI_RUSER
        ,.ruser(amba_axi_m2s3.S0_RUSER)
        `endif
    );

    axi_bind_if #(
        .WIDTH_AWID(12)
        ,.WIDTH_ARID(12)
        ,.WIDTH_AWLEN(4)
        ,.WIDTH_ARLEN(4)
        ,.WIDTH_WDATA(64)
        ,.WIDTH_RDATA(64)
    )  axi_bind_port_3 (
         .clk(amba_axi_m2s3.ACLK)
        ,.rst_n(amba_axi_m2s3.ARESETn)
        ,.force_en(axi_if_port_en[3])
        ,.is_mst(axi_if_is_mst[3])
        ,.is_only_monitor(axi_if_only_monitor[3])
        ,.awid(amba_axi_m2s3.S1_AWID)
        ,.awaddr(amba_axi_m2s3.S1_AWADDR)
        ,.awlen(amba_axi_m2s3.S1_AWLEN)
        ,.awlock(amba_axi_m2s3.S1_AWLOCK)
        ,.awsize(amba_axi_m2s3.S1_AWSIZE)
        ,.awburst(amba_axi_m2s3.S1_AWBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.awcache(amba_axi_m2s3.S1_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.awprot(amba_axi_m2s3.S1_AWPROT)
        `endif
        ,.awvalid(amba_axi_m2s3.S1_AWVALID)
        ,.awready(amba_axi_m2s3.S1_AWREADY)
        `ifdef AMBA_AXI4
        ,.awqos(amba_axi_m2s3.S1_AWQOS)
        ,.awregion(amba_axi_m2s3.S1_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
        ,.awuser(amba_axi_m2s3.S1_AWUSER)
        `endif

        ,.wid(amba_axi_m2s3.S1_WID)
        ,.wdata(amba_axi_m2s3.S1_WDATA)
        ,.wstrb(amba_axi_m2s3.S1_WSTRB)
        ,.wlast(amba_axi_m2s3.S1_WLAST)
        ,.wvalid(amba_axi_m2s3.S1_WVALID)
        ,.wready(amba_axi_m2s3.S1_WREADY)
        `ifdef AMBA_AXI_WUSER
        ,.wuser(amba_axi_m2s3.S1_WUSER)
        `endif

        ,.bid(amba_axi_m2s3.S1_BID)
        ,.bresp(amba_axi_m2s3.S1_BRESP)
        ,.bvalid(amba_axi_m2s3.S1_BVALID)
        ,.bready(amba_axi_m2s3.S1_BREADY)
        `ifdef AMBA_AXI_BUSER
        ,.buser(amba_axi_m2s3.S1_BUSER)
        `endif

        ,.arid(amba_axi_m2s3.S1_ARID)
        ,.araddr(amba_axi_m2s3.S1_ARADDR)
        ,.arlen(amba_axi_m2s3.S1_ARLEN)
        ,.arlock(amba_axi_m2s3.S1_ARLOCK)
        ,.arsize(amba_axi_m2s3.S1_ARSIZE)
        ,.arburst(amba_axi_m2s3.S1_ARBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.arcache(amba_axi_m2s3.S1_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.arprot(amba_axi_m2s3.S1_ARPROT)
        `endif
        ,.arvalid(amba_axi_m2s3.S1_ARVALID)
        ,.arready(amba_axi_m2s3.S1_ARREADY)
        `ifdef AMBA_AXI4
        ,.arqos(amba_axi_m2s3.S1_ARQOS)
        ,.arregion(amba_axi_m2s3.S1_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
        ,.aruser(amba_axi_m2s3.S1_ARUSER)
        `endif

        ,.rid(amba_axi_m2s3.S1_RID)
        ,.rresp(amba_axi_m2s3.S1_RRESP)
        ,.rvalid(amba_axi_m2s3.S1_RVALID)
        ,.rlast(amba_axi_m2s3.S1_RLAST)
        ,.rdata(amba_axi_m2s3.S1_RDATA)
        ,.rready(amba_axi_m2s3.S1_RREADY)
        `ifdef AMBA_AXI_RUSER
        ,.ruser(amba_axi_m2s3.S1_RUSER)
        `endif
    );

    axi_bind_if #(
        .WIDTH_AWID(12)
        ,.WIDTH_ARID(12)
        ,.WIDTH_AWLEN(4)
        ,.WIDTH_ARLEN(4)
        ,.WIDTH_WDATA(64)
        ,.WIDTH_RDATA(64)
    )  axi_bind_port_4 (
         .clk(amba_axi_m2s3.ACLK)
        ,.rst_n(amba_axi_m2s3.ARESETn)
        ,.force_en(axi_if_port_en[4])
        ,.is_mst(axi_if_is_mst[4])
        ,.is_only_monitor(axi_if_only_monitor[4])
        ,.awid(amba_axi_m2s3.S2_AWID)
        ,.awaddr(amba_axi_m2s3.S2_AWADDR)
        ,.awlen(amba_axi_m2s3.S2_AWLEN)
        ,.awlock(amba_axi_m2s3.S2_AWLOCK)
        ,.awsize(amba_axi_m2s3.S2_AWSIZE)
        ,.awburst(amba_axi_m2s3.S2_AWBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.awcache(amba_axi_m2s3.S2_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.awprot(amba_axi_m2s3.S2_AWPROT)
        `endif
        ,.awvalid(amba_axi_m2s3.S2_AWVALID)
        ,.awready(amba_axi_m2s3.S2_AWREADY)
        `ifdef AMBA_AXI4
        ,.awqos(amba_axi_m2s3.S2_AWQOS)
        ,.awregion(amba_axi_m2s3.S2_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
        ,.awuser(amba_axi_m2s3.S2_AWUSER)
        `endif

        ,.wid(amba_axi_m2s3.S2_WID)
        ,.wdata(amba_axi_m2s3.S2_WDATA)
        ,.wstrb(amba_axi_m2s3.S2_WSTRB)
        ,.wlast(amba_axi_m2s3.S2_WLAST)
        ,.wvalid(amba_axi_m2s3.S2_WVALID)
        ,.wready(amba_axi_m2s3.S2_WREADY)
        `ifdef AMBA_AXI_WUSER
        ,.wuser(amba_axi_m2s3.S2_WUSER)
        `endif

        ,.bid(amba_axi_m2s3.S2_BID)
        ,.bresp(amba_axi_m2s3.S2_BRESP)
        ,.bvalid(amba_axi_m2s3.S2_BVALID)
        ,.bready(amba_axi_m2s3.S2_BREADY)
        `ifdef AMBA_AXI_BUSER
        ,.buser(amba_axi_m2s3.S2_BUSER)
        `endif

        ,.arid(amba_axi_m2s3.S2_ARID)
        ,.araddr(amba_axi_m2s3.S2_ARADDR)
        ,.arlen(amba_axi_m2s3.S2_ARLEN)
        ,.arlock(amba_axi_m2s3.S2_ARLOCK)
        ,.arsize(amba_axi_m2s3.S2_ARSIZE)
        ,.arburst(amba_axi_m2s3.S2_ARBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.arcache(amba_axi_m2s3.S2_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.arprot(amba_axi_m2s3.S2_ARPROT)
        `endif
        ,.arvalid(amba_axi_m2s3.S2_ARVALID)
        ,.arready(amba_axi_m2s3.S2_ARREADY)
        `ifdef AMBA_AXI4
        ,.arqos(amba_axi_m2s3.S2_ARQOS)
        ,.arregion(amba_axi_m2s3.S2_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
        ,.aruser(amba_axi_m2s3.S2_ARUSER)
        `endif

        ,.rid(amba_axi_m2s3.S2_RID)
        ,.rresp(amba_axi_m2s3.S2_RRESP)
        ,.rvalid(amba_axi_m2s3.S2_RVALID)
        ,.rlast(amba_axi_m2s3.S2_RLAST)
        ,.rdata(amba_axi_m2s3.S2_RDATA)
        ,.rready(amba_axi_m2s3.S2_RREADY)
        `ifdef AMBA_AXI_RUSER
        ,.ruser(amba_axi_m2s3.S2_RUSER)
        `endif
    );

    axi_bind_if #(
        .WIDTH_AWID(12)
        ,.WIDTH_ARID(12)
        ,.WIDTH_AWLEN(4)
        ,.WIDTH_ARLEN(4)
        ,.WIDTH_WDATA(64)
        ,.WIDTH_RDATA(64)
    )  axi_bind_port_5 (
         .clk(amba_axi_m2s3.ACLK)
        ,.rst_n(amba_axi_m2s3.ARESETn)
        ,.force_en(axi_if_port_en[5])
        ,.is_mst(axi_if_is_mst[5])
        ,.is_only_monitor(axi_if_only_monitor[5])
        ,.awid(amba_axi_m2s3.SD_AWID)
        ,.awaddr(amba_axi_m2s3.SD_AWADDR)
        ,.awlen(amba_axi_m2s3.SD_AWLEN)
        ,.awlock(amba_axi_m2s3.SD_AWLOCK)
        ,.awsize(amba_axi_m2s3.SD_AWSIZE)
        ,.awburst(amba_axi_m2s3.SD_AWBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.awcache(amba_axi_m2s3.SD_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.awprot(amba_axi_m2s3.SD_AWPROT)
        `endif
        ,.awvalid(amba_axi_m2s3.SD_AWVALID)
        ,.awready(amba_axi_m2s3.SD_AWREADY)
        `ifdef AMBA_AXI4
        ,.awqos(amba_axi_m2s3.SD_AWQOS)
        ,.awregion(amba_axi_m2s3.SD_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
        ,.awuser(amba_axi_m2s3.SD_AWUSER)
        `endif

        ,.wid(amba_axi_m2s3.SD_WID)
        ,.wdata(amba_axi_m2s3.SD_WDATA)
        ,.wstrb(amba_axi_m2s3.SD_WSTRB)
        ,.wlast(amba_axi_m2s3.SD_WLAST)
        ,.wvalid(amba_axi_m2s3.SD_WVALID)
        ,.wready(amba_axi_m2s3.SD_WREADY)
        `ifdef AMBA_AXI_WUSER
        ,.wuser(amba_axi_m2s3.SD_WUSER)
        `endif

        ,.bid(amba_axi_m2s3.SD_BID)
        ,.bresp(amba_axi_m2s3.SD_BRESP)
        ,.bvalid(amba_axi_m2s3.SD_BVALID)
        ,.bready(amba_axi_m2s3.SD_BREADY)
        `ifdef AMBA_AXI_BUSER
        ,.buser(amba_axi_m2s3.SD_BUSER)
        `endif

        ,.arid(amba_axi_m2s3.SD_ARID)
        ,.araddr(amba_axi_m2s3.SD_ARADDR)
        ,.arlen(amba_axi_m2s3.SD_ARLEN)
        ,.arlock(amba_axi_m2s3.SD_ARLOCK)
        ,.arsize(amba_axi_m2s3.SD_ARSIZE)
        ,.arburst(amba_axi_m2s3.SD_ARBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.arcache(amba_axi_m2s3.SD_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.arprot(amba_axi_m2s3.SD_ARPROT)
        `endif
        ,.arvalid(amba_axi_m2s3.SD_ARVALID)
        ,.arready(amba_axi_m2s3.SD_ARREADY)
        `ifdef AMBA_AXI4
        ,.arqos(amba_axi_m2s3.SD_ARQOS)
        ,.arregion(amba_axi_m2s3.SD_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
        ,.aruser(amba_axi_m2s3.SD_ARUSER)
        `endif

        ,.rid(amba_axi_m2s3.SD_RID)
        ,.rresp(amba_axi_m2s3.SD_RRESP)
        ,.rvalid(amba_axi_m2s3.SD_RVALID)
        ,.rlast(amba_axi_m2s3.SD_RLAST)
        ,.rdata(amba_axi_m2s3.SD_RDATA)
        ,.rready(amba_axi_m2s3.SD_RREADY)
        `ifdef AMBA_AXI_RUSER
        ,.ruser(amba_axi_m2s3.SD_RUSER)
        `endif
    );

`INTERFACE_DEFINE_END(amba_axi_m2s3)