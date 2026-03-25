
interface tl_bind_if 
    #(
     parameter WIDTH_AWID   = 8
    ,parameter WIDTH_ARID   = 8
    ,parameter WIDTH_REQ_USER   = 1 // same with tlul_pkg
    ,parameter WIDTH_RSP_USER   = 1
    ,parameter WIDTH_REQ_SIZE   = 3
    ,parameter WIDTH_RSP_SIZE   = 3
    ,parameter WIDTH_REQ_SOURCE   = 8
    ,parameter WIDTH_RSP_SOURCE   = 8
    ,parameter WIDTH_REQ_PARAM   = 3
    ,parameter WIDTH_RSP_PARAM   = 3
    ,parameter WIDTH_REQ_MASK   = 16
    ,parameter WIDTH_REQ_ADDRESS   = 3
    ,parameter WIDTH_RSP_SINK   = 32
    ,parameter WIDTH_REQ_DATA   = 64
    ,parameter WIDTH_RSP_DATA   = 64
    )(
    input clk
    ,input rst_n
    ,input force_en
    ,input is_mst
    ,input is_only_monitor
    // req
    ,inout a_valid
    ,inout [3-1:0] a_opcode
    ,inout [WIDTH_REQ_PARAM-1:0] a_param
    ,inout [WIDTH_REQ_SIZE-1:0] a_size
    ,inout [WIDTH_REQ_SOURCE-1:0] a_source
    ,inout [WIDTH_REQ_ADDRESS-1:0] a_address
    ,inout [WIDTH_REQ_MASK-1:0] a_mask
    ,inout [WIDTH_REQ_DATA-1:0] a_data
    ,inout [WIDTH_REQ_USER-1:0] a_user
    ,inout d_ready
    // rsp
    ,inout d_valid
    ,inout [3-1:0] d_opcode
    ,inout [WIDTH_RSP_PARAM-1:0] d_param
    ,inout [WIDTH_RSP_SIZE-1:0] d_size
    ,inout [WIDTH_RSP_SOURCE-1:0] d_source
    ,inout [WIDTH_RSP_SINK-1:0] d_sink
    ,inout [WIDTH_RSP_DATA-1:0] d_data
    ,inout [WIDTH_RSP_USER-1:0] d_user
    ,inout d_error
    ,inout a_ready
);

    tl_if u_intf(clk, rst_n);

    function void drive_vip();
        if(force_en == 1'b1) begin
            if(is_only_monitor == 1'b1) begin
                force u_intf.h2d.a_valid = a_valid;
                force u_intf.h2d.a_opcode = tlul_pkg::tl_a_op_e'(a_opcode);
                force u_intf.h2d.a_param = a_param;
                force u_intf.h2d.a_size = a_size;
                force u_intf.h2d.a_source = a_source;
                force u_intf.h2d.a_address = a_address;
                force u_intf.h2d.a_mask = a_mask;
                force u_intf.h2d.a_data = a_data;
                force u_intf.h2d.a_user = a_user;
                force u_intf.d2h.a_ready = a_ready;

                force u_intf.d2h.d_valid = d_valid;
                force u_intf.d2h.d_opcode = tlul_pkg::tl_d_op_e'(d_opcode);
                force u_intf.d2h.d_param = d_param;
                force u_intf.d2h.d_size = d_size;
                force u_intf.d2h.d_source = d_source;
                force u_intf.d2h.d_sink = d_sink;
                force u_intf.d2h.d_data = d_data;
                force u_intf.d2h.d_user = d_user;
                force u_intf.d2h.d_error = d_error;
                force u_intf.h2d.d_ready = d_ready;
            end
            else if(is_mst == dv_utils_pkg::MST) begin
                force a_valid = u_intf.h2d.a_valid;
                force a_opcode = u_intf.h2d.a_opcode;
                force a_param = u_intf.h2d.a_param;
                force a_size = u_intf.h2d.a_size;
                force a_source = u_intf.h2d.a_source;
                force a_address = u_intf.h2d.a_address;
                force a_mask = u_intf.h2d.a_mask;
                force a_data = u_intf.h2d.a_data;
                force a_user = u_intf.h2d.a_user;
                force u_intf.d2h.a_ready = a_ready;

                force u_intf.d2h.d_valid = d_valid;
                force u_intf.d2h.d_opcode = tlul_pkg::tl_d_op_e'(d_opcode);
                force u_intf.d2h.d_param = d_param;
                force u_intf.d2h.d_size = d_size;
                force u_intf.d2h.d_source = d_source;
                force u_intf.d2h.d_sink = d_sink;
                force u_intf.d2h.d_data = d_data;
                force u_intf.d2h.d_user = d_user;
                force u_intf.d2h.d_error = d_error;
                force d_ready = u_intf.h2d.d_ready;
            end
            else begin 
                force u_intf.h2d.a_valid = a_valid;
                force u_intf.h2d.a_opcode = tlul_pkg::tl_a_op_e'(a_opcode);
                force u_intf.h2d.a_param = a_param;
                force u_intf.h2d.a_size = a_size;
                force u_intf.h2d.a_source = a_source;
                force u_intf.h2d.a_address = a_address;
                force u_intf.h2d.a_mask = a_mask;
                force u_intf.h2d.a_data = a_data;
                force u_intf.h2d.a_user = a_user;
                force a_ready = u_intf.d2h.a_ready;

                force d_valid = u_intf.d2h.d_valid;
                force d_opcode = u_intf.d2h.d_opcode;
                force d_param = u_intf.d2h.d_param;
                force d_size = u_intf.d2h.d_size;
                force d_source = u_intf.d2h.d_source;
                force d_sink = u_intf.d2h.d_sink;
                force d_data = u_intf.d2h.d_data;
                force d_user = u_intf.d2h.d_user;
                force d_error = u_intf.d2h.d_error;
                force u_intf.h2d.d_ready = d_ready;
            end
        end
    endfunction
endinterface