// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: uart_xbar_bind 
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

`INTERFACE_DEFINE_BEGIN(uart) 
import uart_bind_lib_pkg::*;
import uvm_pkg::*;

`POLY_CLASS_UTILS_DEFINE_BEGIN(uart_if, uart_port_info, uart_intf_c)

    function new();
        port_index_name_map[0] = "uart_slv";
        port_interface_q[0] = bind_port_0.u_intf;
        foreach(port_index_name_map[i]) begin
            port_name_index_map[port_index_name_map[i]] = i;
        end
        bind_inst_path = inst_path;
    endfunction

        virtual function void set_vif_work_mode(bit switch, bit mst_slv, bit is_monitor, string port_name);
        //if(port_type == uart_intf_c::PORT_TYPE) begin
            `uvm_info("set_uart_vif_work_mode", $sformatf("instance %s set_vif_work_mode, port %s", inst_path, port_name), UVM_DEBUG);
            if(port_name_index_map.exists(port_name)) begin
                uart_if_port_en[port_name_index_map[port_name]] = switch;
                uart_if_is_mst[port_name_index_map[port_name]] = mst_slv;
                uart_if_only_monitor[port_name_index_map[port_name]] = is_monitor;
                `uvm_info("set_uart_vif_work_mode", $sformatf("instance %s set_vif_work_mode, find match port %s", inst_path, port_name), UVM_DEBUG);
            end
            else begin
                `uvm_error("set_uart_vif_work_mode", $sformatf("instance %s set_vif_work_mode error, cannot find match port %s", inst_path, port_name));
            end
        //end
        endfunction
    
    endclass
    
    localparam PORT_NUM = 1;
    bit uart_if_port_en[PORT_NUM];
    bit uart_if_is_mst[PORT_NUM];
    bit uart_if_only_monitor[PORT_NUM];

    
    initial begin
        //#1ns;
        bind_port_0.drive_vip();
    end

    uart_bind_if #(
        .UartDefaultClkPeriodNs(104166.667ns)
    )  bind_port_0 (
         .uart_tx(uart.cio_tx_o)
        ,.uart_rx(uart.cio_rx_i)
        ,.force_en(uart_if_port_en[0])
        ,.is_mst(uart_if_is_mst[0])
        ,.is_only_monitor(uart_if_only_monitor[0])
    );

`INTERFACE_DEFINE_END(uart)