// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: AMBA_XBAR_M2S2_bind 
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
    `define BIND_TO_DUT_TOP AMBA_XBAR_M2S2_2_2_4_32_64_1_29_1_29_20000000_00000000_0
`else
    `define BIND_TO_DUT_TOP AMBA_XBAR_M2S2
`endif


`INTERFACE_DEFINE_BEGIN(`BIND_TO_DUT_TOP)
import axi_bind_lib_pkg::*;
import uvm_pkg::*;
    
    localparam PORT_NUM = 5;
    bit axi_if_port_en[PORT_NUM];
    bit axi_if_is_mst[PORT_NUM];
    bit axi_if_only_monitor[PORT_NUM];

`POLY_CLASS_UTILS_DEFINE_BEGIN(axi_interface, axi_port_info, axi_intf_c)

    function new();
        port_index_name_map[0] = "m0_axi_mst";
        port_index_name_map[1] = "m1_axi_mst";
        port_index_name_map[2] = "s0_axi_slv";
        port_index_name_map[3] = "s1_axi_slv";
        port_index_name_map[4] = "default_axi_slv";
        port_interface_q[0] = axi_bind_port_0.u_intf;
        port_interface_q[1] = axi_bind_port_1.u_intf;
        port_interface_q[2] = axi_bind_port_2.u_intf;
        port_interface_q[3] = axi_bind_port_3.u_intf;
        port_interface_q[4] = axi_bind_port_5.u_intf;
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
            axi_bind_port_5.drive_vip();
        endfunction
    
    endclass

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
    )  axi_bind_port_0 (
         .clk(`BIND_TO_DUT_TOP.ACLK)
        ,.rst_n(`BIND_TO_DUT_TOP.ARESETn)
        ,.force_en(axi_if_port_en[0])
        ,.is_mst(axi_if_is_mst[0])
        ,.is_only_monitor(axi_if_only_monitor[0])
        ,.awid(`BIND_TO_DUT_TOP.M0_AWID)
        ,.awaddr(`BIND_TO_DUT_TOP.M0_AWADDR)
        ,.awlen(`BIND_TO_DUT_TOP.M0_AWLEN)
        ,.awlock(`BIND_TO_DUT_TOP.M0_AWLOCK)
        ,.awsize(`BIND_TO_DUT_TOP.M0_AWSIZE)
        ,.awburst(`BIND_TO_DUT_TOP.M0_AWBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.awcache(`BIND_TO_DUT_TOP.M0_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.awprot(`BIND_TO_DUT_TOP.M0_AWPROT)
        `endif
        ,.awvalid(`BIND_TO_DUT_TOP.M0_AWVALID)
        ,.awready(`BIND_TO_DUT_TOP.M0_AWREADY)
        `ifdef AMBA_AXI4
        ,.awqos(`BIND_TO_DUT_TOP.M0_AWQOS)
        ,.awregion(`BIND_TO_DUT_TOP.M0_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
        ,.awuser(`BIND_TO_DUT_TOP.M0_AWUSER)
        `endif

        ,.wid(`BIND_TO_DUT_TOP.M0_WID)
        ,.wdata(`BIND_TO_DUT_TOP.M0_WDATA)
        ,.wstrb(`BIND_TO_DUT_TOP.M0_WSTRB)
        ,.wlast(`BIND_TO_DUT_TOP.M0_WLAST)
        ,.wvalid(`BIND_TO_DUT_TOP.M0_WVALID)
        ,.wready(`BIND_TO_DUT_TOP.M0_WREADY)
        `ifdef AMBA_AXI_WUSER
        ,.wuser(`BIND_TO_DUT_TOP.M0_WUSER)
        `endif

        ,.bid(`BIND_TO_DUT_TOP.M0_BID)
        ,.bresp(`BIND_TO_DUT_TOP.M0_BRESP)
        ,.bvalid(`BIND_TO_DUT_TOP.M0_BVALID)
        ,.bready(`BIND_TO_DUT_TOP.M0_BREADY)
        `ifdef AMBA_AXI_BUSER
        ,.buser(`BIND_TO_DUT_TOP.M0_BUSER)
        `endif

        ,.arid(`BIND_TO_DUT_TOP.M0_ARID)
        ,.araddr(`BIND_TO_DUT_TOP.M0_ARADDR)
        ,.arlen(`BIND_TO_DUT_TOP.M0_ARLEN)
        ,.arlock(`BIND_TO_DUT_TOP.M0_ARLOCK)
        ,.arsize(`BIND_TO_DUT_TOP.M0_ARSIZE)
        ,.arburst(`BIND_TO_DUT_TOP.M0_ARBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.arcache(`BIND_TO_DUT_TOP.M0_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.arprot(`BIND_TO_DUT_TOP.M0_ARPROT)
        `endif
        ,.arvalid(`BIND_TO_DUT_TOP.M0_ARVALID)
        ,.arready(`BIND_TO_DUT_TOP.M0_ARREADY)
        `ifdef AMBA_AXI4
        ,.arqos(`BIND_TO_DUT_TOP.M0_ARQOS)
        ,.arregion(`BIND_TO_DUT_TOP.M0_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
        ,.aruser(`BIND_TO_DUT_TOP.M0_ARUSER)
        `endif

        ,.rid(`BIND_TO_DUT_TOP.M0_RID)
        ,.rresp(`BIND_TO_DUT_TOP.M0_RRESP)
        ,.rvalid(`BIND_TO_DUT_TOP.M0_RVALID)
        ,.rlast(`BIND_TO_DUT_TOP.M0_RLAST)
        ,.rdata(`BIND_TO_DUT_TOP.M0_RDATA)
        ,.rready(`BIND_TO_DUT_TOP.M0_RREADY)
        `ifdef AMBA_AXI_RUSER
        ,.ruser(`BIND_TO_DUT_TOP.M0_RUSER)
        `endif
    );

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
    )  axi_bind_port_1 (
         .clk(`BIND_TO_DUT_TOP.ACLK)
        ,.rst_n(`BIND_TO_DUT_TOP.ARESETn)
        ,.force_en(axi_if_port_en[1])
        ,.is_mst(axi_if_is_mst[1])
        ,.is_only_monitor(axi_if_only_monitor[1])
        ,.awid(`BIND_TO_DUT_TOP.M1_AWID)
        ,.awaddr(`BIND_TO_DUT_TOP.M1_AWADDR)
        ,.awlen(`BIND_TO_DUT_TOP.M1_AWLEN)
        ,.awlock(`BIND_TO_DUT_TOP.M1_AWLOCK)
        ,.awsize(`BIND_TO_DUT_TOP.M1_AWSIZE)
        ,.awburst(`BIND_TO_DUT_TOP.M1_AWBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.awcache(`BIND_TO_DUT_TOP.M1_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.awprot(`BIND_TO_DUT_TOP.M1_AWPROT)
        `endif
        ,.awvalid(`BIND_TO_DUT_TOP.M1_AWVALID)
        ,.awready(`BIND_TO_DUT_TOP.M1_AWREADY)
        `ifdef AMBA_AXI4
        ,.awqos(`BIND_TO_DUT_TOP.M1_AWQOS)
        ,.awregion(`BIND_TO_DUT_TOP.M1_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
        ,.awuser(`BIND_TO_DUT_TOP.M1_AWUSER)
        `endif

        ,.wid(`BIND_TO_DUT_TOP.M1_WID)
        ,.wdata(`BIND_TO_DUT_TOP.M1_WDATA)
        ,.wstrb(`BIND_TO_DUT_TOP.M1_WSTRB)
        ,.wlast(`BIND_TO_DUT_TOP.M1_WLAST)
        ,.wvalid(`BIND_TO_DUT_TOP.M1_WVALID)
        ,.wready(`BIND_TO_DUT_TOP.M1_WREADY)
        `ifdef AMBA_AXI_WUSER
        ,.wuser(`BIND_TO_DUT_TOP.M1_WUSER)
        `endif

        ,.bid(`BIND_TO_DUT_TOP.M1_BID)
        ,.bresp(`BIND_TO_DUT_TOP.M1_BRESP)
        ,.bvalid(`BIND_TO_DUT_TOP.M1_BVALID)
        ,.bready(`BIND_TO_DUT_TOP.M1_BREADY)
        `ifdef AMBA_AXI_BUSER
        ,.buser(`BIND_TO_DUT_TOP.M1_BUSER)
        `endif

        ,.arid(`BIND_TO_DUT_TOP.M1_ARID)
        ,.araddr(`BIND_TO_DUT_TOP.M1_ARADDR)
        ,.arlen(`BIND_TO_DUT_TOP.M1_ARLEN)
        ,.arlock(`BIND_TO_DUT_TOP.M1_ARLOCK)
        ,.arsize(`BIND_TO_DUT_TOP.M1_ARSIZE)
        ,.arburst(`BIND_TO_DUT_TOP.M1_ARBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.arcache(`BIND_TO_DUT_TOP.M1_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.arprot(`BIND_TO_DUT_TOP.M1_ARPROT)
        `endif
        ,.arvalid(`BIND_TO_DUT_TOP.M1_ARVALID)
        ,.arready(`BIND_TO_DUT_TOP.M1_ARREADY)
        `ifdef AMBA_AXI4
        ,.arqos(`BIND_TO_DUT_TOP.M1_ARQOS)
        ,.arregion(`BIND_TO_DUT_TOP.M1_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
        ,.aruser(`BIND_TO_DUT_TOP.M1_ARUSER)
        `endif

        ,.rid(`BIND_TO_DUT_TOP.M1_RID)
        ,.rresp(`BIND_TO_DUT_TOP.M1_RRESP)
        ,.rvalid(`BIND_TO_DUT_TOP.M1_RVALID)
        ,.rlast(`BIND_TO_DUT_TOP.M1_RLAST)
        ,.rdata(`BIND_TO_DUT_TOP.M1_RDATA)
        ,.rready(`BIND_TO_DUT_TOP.M1_RREADY)
        `ifdef AMBA_AXI_RUSER
        ,.ruser(`BIND_TO_DUT_TOP.M1_RUSER)
        `endif
    );

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
    )  axi_bind_port_2 (
         .clk(`BIND_TO_DUT_TOP.ACLK)
        ,.rst_n(`BIND_TO_DUT_TOP.ARESETn)
        ,.force_en(axi_if_port_en[2])
        ,.is_mst(axi_if_is_mst[2])
        ,.is_only_monitor(axi_if_only_monitor[2])
        ,.awid(`BIND_TO_DUT_TOP.S0_AWID)
        ,.awaddr(`BIND_TO_DUT_TOP.S0_AWADDR)
        ,.awlen(`BIND_TO_DUT_TOP.S0_AWLEN)
        ,.awlock(`BIND_TO_DUT_TOP.S0_AWLOCK)
        ,.awsize(`BIND_TO_DUT_TOP.S0_AWSIZE)
        ,.awburst(`BIND_TO_DUT_TOP.S0_AWBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.awcache(`BIND_TO_DUT_TOP.S0_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.awprot(`BIND_TO_DUT_TOP.S0_AWPROT)
        `endif
        ,.awvalid(`BIND_TO_DUT_TOP.S0_AWVALID)
        ,.awready(`BIND_TO_DUT_TOP.S0_AWREADY)
        `ifdef AMBA_AXI4
        ,.awqos(`BIND_TO_DUT_TOP.S0_AWQOS)
        ,.awregion(`BIND_TO_DUT_TOP.S0_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
        ,.awuser(`BIND_TO_DUT_TOP.S0_AWUSER)
        `endif

        ,.wid(`BIND_TO_DUT_TOP.S0_WID)
        ,.wdata(`BIND_TO_DUT_TOP.S0_WDATA)
        ,.wstrb(`BIND_TO_DUT_TOP.S0_WSTRB)
        ,.wlast(`BIND_TO_DUT_TOP.S0_WLAST)
        ,.wvalid(`BIND_TO_DUT_TOP.S0_WVALID)
        ,.wready(`BIND_TO_DUT_TOP.S0_WREADY)
        `ifdef AMBA_AXI_WUSER
        ,.wuser(`BIND_TO_DUT_TOP.S0_WUSER)
        `endif

        ,.bid(`BIND_TO_DUT_TOP.S0_BID)
        ,.bresp(`BIND_TO_DUT_TOP.S0_BRESP)
        ,.bvalid(`BIND_TO_DUT_TOP.S0_BVALID)
        ,.bready(`BIND_TO_DUT_TOP.S0_BREADY)
        `ifdef AMBA_AXI_BUSER
        ,.buser(`BIND_TO_DUT_TOP.S0_BUSER)
        `endif

        ,.arid(`BIND_TO_DUT_TOP.S0_ARID)
        ,.araddr(`BIND_TO_DUT_TOP.S0_ARADDR)
        ,.arlen(`BIND_TO_DUT_TOP.S0_ARLEN)
        ,.arlock(`BIND_TO_DUT_TOP.S0_ARLOCK)
        ,.arsize(`BIND_TO_DUT_TOP.S0_ARSIZE)
        ,.arburst(`BIND_TO_DUT_TOP.S0_ARBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.arcache(`BIND_TO_DUT_TOP.S0_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.arprot(`BIND_TO_DUT_TOP.S0_ARPROT)
        `endif
        ,.arvalid(`BIND_TO_DUT_TOP.S0_ARVALID)
        ,.arready(`BIND_TO_DUT_TOP.S0_ARREADY)
        `ifdef AMBA_AXI4
        ,.arqos(`BIND_TO_DUT_TOP.S0_ARQOS)
        ,.arregion(`BIND_TO_DUT_TOP.S0_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
        ,.aruser(`BIND_TO_DUT_TOP.S0_ARUSER)
        `endif

        ,.rid(`BIND_TO_DUT_TOP.S0_RID)
        ,.rresp(`BIND_TO_DUT_TOP.S0_RRESP)
        ,.rvalid(`BIND_TO_DUT_TOP.S0_RVALID)
        ,.rlast(`BIND_TO_DUT_TOP.S0_RLAST)
        ,.rdata(`BIND_TO_DUT_TOP.S0_RDATA)
        ,.rready(`BIND_TO_DUT_TOP.S0_RREADY)
        `ifdef AMBA_AXI_RUSER
        ,.ruser(`BIND_TO_DUT_TOP.S0_RUSER)
        `endif
    );

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
    )  axi_bind_port_3 (
         .clk(`BIND_TO_DUT_TOP.ACLK)
        ,.rst_n(`BIND_TO_DUT_TOP.ARESETn)
        ,.force_en(axi_if_port_en[3])
        ,.is_mst(axi_if_is_mst[3])
        ,.is_only_monitor(axi_if_only_monitor[3])
        ,.awid(`BIND_TO_DUT_TOP.S1_AWID)
        ,.awaddr(`BIND_TO_DUT_TOP.S1_AWADDR)
        ,.awlen(`BIND_TO_DUT_TOP.S1_AWLEN)
        ,.awlock(`BIND_TO_DUT_TOP.S1_AWLOCK)
        ,.awsize(`BIND_TO_DUT_TOP.S1_AWSIZE)
        ,.awburst(`BIND_TO_DUT_TOP.S1_AWBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.awcache(`BIND_TO_DUT_TOP.S1_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.awprot(`BIND_TO_DUT_TOP.S1_AWPROT)
        `endif
        ,.awvalid(`BIND_TO_DUT_TOP.S1_AWVALID)
        ,.awready(`BIND_TO_DUT_TOP.S1_AWREADY)
        `ifdef AMBA_AXI4
        ,.awqos(`BIND_TO_DUT_TOP.S1_AWQOS)
        ,.awregion(`BIND_TO_DUT_TOP.S1_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
        ,.awuser(`BIND_TO_DUT_TOP.S1_AWUSER)
        `endif

        ,.wid(`BIND_TO_DUT_TOP.S1_WID)
        ,.wdata(`BIND_TO_DUT_TOP.S1_WDATA)
        ,.wstrb(`BIND_TO_DUT_TOP.S1_WSTRB)
        ,.wlast(`BIND_TO_DUT_TOP.S1_WLAST)
        ,.wvalid(`BIND_TO_DUT_TOP.S1_WVALID)
        ,.wready(`BIND_TO_DUT_TOP.S1_WREADY)
        `ifdef AMBA_AXI_WUSER
        ,.wuser(`BIND_TO_DUT_TOP.S1_WUSER)
        `endif

        ,.bid(`BIND_TO_DUT_TOP.S1_BID)
        ,.bresp(`BIND_TO_DUT_TOP.S1_BRESP)
        ,.bvalid(`BIND_TO_DUT_TOP.S1_BVALID)
        ,.bready(`BIND_TO_DUT_TOP.S1_BREADY)
        `ifdef AMBA_AXI_BUSER
        ,.buser(`BIND_TO_DUT_TOP.S1_BUSER)
        `endif

        ,.arid(`BIND_TO_DUT_TOP.S1_ARID)
        ,.araddr(`BIND_TO_DUT_TOP.S1_ARADDR)
        ,.arlen(`BIND_TO_DUT_TOP.S1_ARLEN)
        ,.arlock(`BIND_TO_DUT_TOP.S1_ARLOCK)
        ,.arsize(`BIND_TO_DUT_TOP.S1_ARSIZE)
        ,.arburst(`BIND_TO_DUT_TOP.S1_ARBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.arcache(`BIND_TO_DUT_TOP.S1_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.arprot(`BIND_TO_DUT_TOP.S1_ARPROT)
        `endif
        ,.arvalid(`BIND_TO_DUT_TOP.S1_ARVALID)
        ,.arready(`BIND_TO_DUT_TOP.S1_ARREADY)
        `ifdef AMBA_AXI4
        ,.arqos(`BIND_TO_DUT_TOP.S1_ARQOS)
        ,.arregion(`BIND_TO_DUT_TOP.S1_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
        ,.aruser(`BIND_TO_DUT_TOP.S1_ARUSER)
        `endif

        ,.rid(`BIND_TO_DUT_TOP.S1_RID)
        ,.rresp(`BIND_TO_DUT_TOP.S1_RRESP)
        ,.rvalid(`BIND_TO_DUT_TOP.S1_RVALID)
        ,.rlast(`BIND_TO_DUT_TOP.S1_RLAST)
        ,.rdata(`BIND_TO_DUT_TOP.S1_RDATA)
        ,.rready(`BIND_TO_DUT_TOP.S1_RREADY)
        `ifdef AMBA_AXI_RUSER
        ,.ruser(`BIND_TO_DUT_TOP.S1_RUSER)
        `endif
    );

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
    )  axi_bind_port_5 (
         .clk(`BIND_TO_DUT_TOP.ACLK)
        ,.rst_n(`BIND_TO_DUT_TOP.ARESETn)
        ,.force_en(axi_if_port_en[5])
        ,.is_mst(axi_if_is_mst[5])
        ,.is_only_monitor(axi_if_only_monitor[5])
        ,.awid(`BIND_TO_DUT_TOP.SD_AWID)
        ,.awaddr(`BIND_TO_DUT_TOP.SD_AWADDR)
        ,.awlen(`BIND_TO_DUT_TOP.SD_AWLEN)
        ,.awlock(`BIND_TO_DUT_TOP.SD_AWLOCK)
        ,.awsize(`BIND_TO_DUT_TOP.SD_AWSIZE)
        ,.awburst(`BIND_TO_DUT_TOP.SD_AWBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.awcache(`BIND_TO_DUT_TOP.SD_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.awprot(`BIND_TO_DUT_TOP.SD_AWPROT)
        `endif
        ,.awvalid(`BIND_TO_DUT_TOP.SD_AWVALID)
        ,.awready(`BIND_TO_DUT_TOP.SD_AWREADY)
        `ifdef AMBA_AXI4
        ,.awqos(`BIND_TO_DUT_TOP.SD_AWQOS)
        ,.awregion(`BIND_TO_DUT_TOP.SD_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
        ,.awuser(`BIND_TO_DUT_TOP.SD_AWUSER)
        `endif

        ,.wid(`BIND_TO_DUT_TOP.SD_WID)
        ,.wdata(`BIND_TO_DUT_TOP.SD_WDATA)
        ,.wstrb(`BIND_TO_DUT_TOP.SD_WSTRB)
        ,.wlast(`BIND_TO_DUT_TOP.SD_WLAST)
        ,.wvalid(`BIND_TO_DUT_TOP.SD_WVALID)
        ,.wready(`BIND_TO_DUT_TOP.SD_WREADY)
        `ifdef AMBA_AXI_WUSER
        ,.wuser(`BIND_TO_DUT_TOP.SD_WUSER)
        `endif

        ,.bid(`BIND_TO_DUT_TOP.SD_BID)
        ,.bresp(`BIND_TO_DUT_TOP.SD_BRESP)
        ,.bvalid(`BIND_TO_DUT_TOP.SD_BVALID)
        ,.bready(`BIND_TO_DUT_TOP.SD_BREADY)
        `ifdef AMBA_AXI_BUSER
        ,.buser(`BIND_TO_DUT_TOP.SD_BUSER)
        `endif

        ,.arid(`BIND_TO_DUT_TOP.SD_ARID)
        ,.araddr(`BIND_TO_DUT_TOP.SD_ARADDR)
        ,.arlen(`BIND_TO_DUT_TOP.SD_ARLEN)
        ,.arlock(`BIND_TO_DUT_TOP.SD_ARLOCK)
        ,.arsize(`BIND_TO_DUT_TOP.SD_ARSIZE)
        ,.arburst(`BIND_TO_DUT_TOP.SD_ARBURST)
        `ifdef  AMBA_AXI_CACHE
        ,.arcache(`BIND_TO_DUT_TOP.SD_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
        ,.arprot(`BIND_TO_DUT_TOP.SD_ARPROT)
        `endif
        ,.arvalid(`BIND_TO_DUT_TOP.SD_ARVALID)
        ,.arready(`BIND_TO_DUT_TOP.SD_ARREADY)
        `ifdef AMBA_AXI4
        ,.arqos(`BIND_TO_DUT_TOP.SD_ARQOS)
        ,.arregion(`BIND_TO_DUT_TOP.SD_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
        ,.aruser(`BIND_TO_DUT_TOP.SD_ARUSER)
        `endif

        ,.rid(`BIND_TO_DUT_TOP.SD_RID)
        ,.rresp(`BIND_TO_DUT_TOP.SD_RRESP)
        ,.rvalid(`BIND_TO_DUT_TOP.SD_RVALID)
        ,.rlast(`BIND_TO_DUT_TOP.SD_RLAST)
        ,.rdata(`BIND_TO_DUT_TOP.SD_RDATA)
        ,.rready(`BIND_TO_DUT_TOP.SD_RREADY)
        `ifdef AMBA_AXI_RUSER
        ,.ruser(`BIND_TO_DUT_TOP.SD_RUSER)
        `endif
    );

`INTERFACE_DEFINE_END(`BIND_TO_DUT_TOP)


`undef BIND_TO_DUT_TOP