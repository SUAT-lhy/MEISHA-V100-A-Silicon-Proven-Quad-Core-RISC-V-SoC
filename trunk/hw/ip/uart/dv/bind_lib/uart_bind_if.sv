
interface uart_bind_if 
    #(
        realtime UartDefaultClkPeriodNs = 104166.667ns
    )(
     inout uart_tx
    ,inout uart_rx
    ,input force_en
    ,input is_mst
    ,input is_only_monitor
);

    uart_if #(UartDefaultClkPeriodNs) u_intf();

    task drive_vip();
        #1ns;
        if(force_en == 1'b1) begin
          if(is_only_monitor == 1'b1) begin
              force u_intf.uart_rx = uart_rx;
              force u_intf.uart_tx = uart_tx;
          end
          else if(is_mst == dv_utils_pkg::MST) begin  // vip is host mode
              force uart_rx = u_intf.uart_rx;
              force u_intf.uart_tx = uart_tx;
          end
          else begin 
              force u_intf.uart_rx = uart_rx;
              force uart_tx = u_intf.uart_tx;
          end
        end
    endtask
endinterface