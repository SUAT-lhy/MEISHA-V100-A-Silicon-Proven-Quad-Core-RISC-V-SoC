
interface axi_bind_if 
    #(
     parameter WIDTH_AWID   = 8
    ,parameter WIDTH_ARID   = 8
    ,parameter WIDTH_AWLEN   = 8
    ,parameter WIDTH_ARLEN   = 8
    ,parameter WIDTH_AWADDR   = 32
    ,parameter WIDTH_ARADDR   = 32
    ,parameter WIDTH_AWPROT   = 3
    ,parameter WIDTH_ARPROT   = 3
    ,parameter WIDTH_AWLOCK   = 2
    ,parameter WIDTH_ARLOCK   = 2
    ,parameter WIDTH_WDATA   = 256
    ,parameter WIDTH_RDATA   = 256

    )(
    input clk,
    input rst_n,
    input force_en,
    input is_mst,
    input is_only_monitor,
    inout           [WIDTH_AWID-1:0]  awid,
    inout           [WIDTH_AWADDR-1:0]  awaddr,
    inout           [WIDTH_AWLEN-1:0] awlen,
    inout                 [WIDTH_AWLOCK-1:0]  awlock,
    inout                 [2:0]  awsize,
    inout                 [1:0]  awburst,
    inout                 [3:0]  awcache,
    inout                 [WIDTH_AWPROT-1:0]  awprot,
    inout                        awvalid,
    inout                        awready,
    inout                 [3:0]  awqos,
    inout                 [3:0]  awregion,
    //`ifdef AMBA_AXI_AWUSER
    inout  [top_pkg::AXI_AWUSER_WIDTH-1:0]  awuser,
    //`endif

    inout  [WIDTH_AWID-1:0]  wid,
    inout  [WIDTH_WDATA-1:0]  wdata,
    inout  [WIDTH_WDATA/8-1:0] wstrb,
    inout                        wlast,
    inout                        wvalid,
    inout                        wready,
    //`ifdef AMBA_AXI_WUSER
    inout  [top_pkg::AXI_AWUSER_WIDTH-1:0]  wuser,
    //`endif

    inout  [WIDTH_AWID-1:0]  bid,
    inout                 [1:0]  bresp,
    inout                        bvalid,
    inout                        bready,
    //`ifdef AMBA_AXI_BUSER
    inout  [top_pkg::AXI_BUSER_WIDTH-1:0] buser,
    //`endif

    inout                 [WIDTH_ARID-1:0]  arid,
    inout                 [WIDTH_ARADDR-1:0]  araddr,
    inout                 [WIDTH_ARLEN-1:0]  arlen,
    inout                 [WIDTH_ARLOCK-1:0]  arlock,
    inout [2:0]  arsize,
    inout [1:0]  arburst,
    inout                 [3:0]  arcache,
    inout                 [WIDTH_ARPROT-1:0]  arprot,
    inout                        arvalid,
    inout                       arready,
    inout                 [3:0]  arqos,
    inout                 [3:0]  arregion,
    //`ifdef AMBA_AXI_ARUSER
    inout                 [top_pkg::AXI_ARUSER_WIDTH-1:0]  aruser,
    //`endif

    inout  [WIDTH_ARID-1:0]  rid,
    inout [1:0]  rresp,
    inout                        rvalid,
    inout                        rlast,
    inout                        rready
    //`ifdef AMBA_AXI_RUSER
    ,inout [top_pkg::AXI_RUSER_WIDTH-1:0] ruser
    //`endif
    ,inout [WIDTH_RDATA-1:0]  rdata
);

    axi_interface u_intf(clk, rst_n);


    function void drive_vip();
        //#1ns;
        $display("axi_bind_if drive_vip : %m");
        if(force_en == 1'b1) begin
            if(is_only_monitor == 1'b1) begin
                force u_intf.AWID = awid;
                force u_intf.AWADDR = awaddr;
                force u_intf.AWLEN = awlen;
                force u_intf.AWSIZE = awsize;
                force u_intf.AWBURST = awburst;
                force u_intf.AWVALID = awvalid;
                force u_intf.AWREADY = awready;

                // Write Data
                force u_intf.WID = wid;
                force u_intf.WDATA = wdata;
                force u_intf.WSTRB = wstrb;
                force u_intf.WLAST = wlast;
                force u_intf.WVALID = wvalid; 
                force u_intf.WREADY = wready;

                // Write Response
                force u_intf.BID = bid;
                force u_intf.BRESP = bresp;
                force u_intf.BVALID = bvalid;
                force u_intf.BREADY = bready;

                // Read Address
                force u_intf.ARID = arid;
                force u_intf.ARADDR = araddr;
                force u_intf.ARLEN = arlen;
                force u_intf.ARSIZE = arsize;
                force u_intf.ARBURST = arburst;
                force u_intf.ARVALID = arvalid; 
                force u_intf.ARREADY = arready;

                // Read Data
                force u_intf.RID = rid;
                force u_intf.RDATA = rdata;
                force u_intf.RRESP = rresp;
                force u_intf.RLAST = rlast;
                force u_intf.RVALID = rvalid;
                force u_intf.RREADY = rready;
            end
            else if(is_mst == dv_utils_pkg::MST) begin
                force awid = u_intf.AWID;
                force awaddr = u_intf.AWADDR;
                force awlen = u_intf.AWLEN;
                force awsize = u_intf.AWSIZE;
                force awburst = u_intf.AWBURST;
                force awvalid = u_intf.AWVALID;
                force u_intf.AWREADY = awready;

                // Write Data
                force wid = u_intf.WID;
                force wdata = u_intf.WDATA;
                force wstrb = u_intf.WSTRB;
                force wlast = u_intf.WLAST;
                force wvalid = u_intf.WVALID;
                force u_intf.WREADY = wready;

                // Write Response
                force u_intf.BID = bid;
                force u_intf.BRESP = bresp;
                force u_intf.BVALID = bvalid;
                force bready = u_intf.BREADY;

                // Read Address
                force arid = u_intf.ARID;
                force araddr = u_intf.ARADDR;
                force arlen = u_intf.ARLEN;
                force arsize = u_intf.ARSIZE;
                force arburst = u_intf.ARBURST;
                force arvalid = u_intf.ARVALID;
                force u_intf.ARREADY = arready;

                // Read Data
                force u_intf.RID = rid;
                force u_intf.RDATA = rdata;
                force u_intf.RRESP = rresp;
                force u_intf.RLAST = rlast;
                force u_intf.RVALID = rvalid;
                force rready = u_intf.RREADY;
            end
            else begin 
                force u_intf.AWID = awid;
                force u_intf.AWADDR = awaddr;
                force u_intf.AWLEN = awlen;
                force u_intf.AWSIZE = awsize;
                force u_intf.AWBURST = awburst;
                force u_intf.AWVALID = awvalid;
                force awready = u_intf.AWREADY;

                // Write Data
                force u_intf.WID = wid;
                force u_intf.WDATA = wdata;
                force u_intf.WSTRB = wstrb;
                force u_intf.WLAST = wlast;
                force u_intf.WVALID = wvalid; 
                force wready = u_intf.WREADY;

                // Write Response
                force bid = u_intf.BID;
                force bresp = u_intf.BRESP;
                force bvalid = u_intf.BVALID;
                force u_intf.BREADY = bready;

                // Read Address
                force u_intf.ARID = arid;
                force u_intf.ARADDR = araddr;
                force u_intf.ARLEN = arlen;
                force u_intf.ARSIZE = arsize;
                force u_intf.ARBURST = arburst;
                force u_intf.ARVALID = arvalid; 
                force arready = u_intf.ARREADY;

                // Read Data
                force rid = u_intf.RID;
                force rdata = u_intf.RDATA;
                force rresp = u_intf.RRESP;
                force rlast = u_intf.RLAST;
                force rvalid = u_intf.RVALID;
                force u_intf.RREADY = rready;
            end
        end
    endfunction
endinterface