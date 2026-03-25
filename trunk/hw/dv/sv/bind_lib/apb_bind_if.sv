
interface apb_bind_if 
    #(
        parameter WIDTH_UNUSED_CID   = 4
    )(
    input clk
    ,input rst_n
    ,input force_en
    ,input is_mst
    ,input is_only_monitor
);

    //axi_interface u_intf(clk, rst_n);


    function void drive_vip();
        //#1ns;
        if(force_en == 1'b1) begin
            if(is_mst == dv_utils_pkg::MST) begin
                
            end
            else begin 
                
            end
        end
        else if(is_only_monitor == 1'b1) begin
                
        end
    endfunction
endinterface