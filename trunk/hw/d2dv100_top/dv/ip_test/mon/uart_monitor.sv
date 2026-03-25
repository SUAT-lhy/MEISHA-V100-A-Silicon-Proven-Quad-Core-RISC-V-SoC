
`ifndef UART_MONITOR_ST__SV
`define UART_MONITOR_ST__SV

static string SHUTDOWN_FLAG_STR = "ST Simulation Ended!";

module uart_monitor(
    input clk
    , input rst_n
    , input bit io_en
    , input bit tx_en
    , input bit [7:0] wdata
    );

    import uvm_pkg::*;
    
    bit monitor_en = 1;
    //reg [7:0] print_string[$][$];
    reg [7:0] print_temp_string[$];
    

    initial begin
        int SHUTDOWN_FLAG_STR_LEN;
        int uart_monitor_para=1;
        if ($value$plusargs("uart_monitor_para=%0d",uart_monitor_para)) begin
        end 
        else ;
        #100ns;
        SHUTDOWN_FLAG_STR_LEN = SHUTDOWN_FLAG_STR.len();
        if ((monitor_en==1)) begin
            automatic int char_c, str_c, line_c;
            char_c = 0;
            str_c = 0;
            line_c = 0;
            $display("%m: uart_monitor_para %0d defined", uart_monitor_para);
        `ifndef POSTSIM_EN
            forever begin
                @(posedge clk);
                if(io_en && tx_en)begin
                    $write("%0c", wdata[7:0]);   
                    //$display(" - hex: %0x", wdata[7:0]);
                    print_temp_string.push_back(wdata[7:0]);
                    if(wdata[7:0] == 8'h20) begin  // \0
                        str_c++;
                        char_c = 0;
                        //print_string.push_back(print_temp_string);
                    end
                    else if(wdata[7:0] == 8'h0a) begin  // \n
                        //$display("uart_string:");
                        //$display("%c - %c, str_len: %0d", print_temp_string[0], print_temp_string[1], print_temp_string.size());
                        if(print_temp_string.size() == SHUTDOWN_FLAG_STR_LEN + 1) begin
                            if((8'h53 /*"S"*/ == print_temp_string[0]) && (8'h21/*"!"*/ == print_temp_string[SHUTDOWN_FLAG_STR_LEN-1])) begin
                            end
                            //$display("%s, %c - %c", SHUTDOWN_FLAG_STR, print_temp_string[0], print_temp_string[SHUTDOWN_FLAG_STR_LEN-1]);
                            #1000ns;
                            $finish();
                        end                        
                        print_temp_string = {};
                        line_c++;
                    end
                    else begin  // \n
                        //print_temp_string[8*char_c+:8] = wdata[7:0];
                    end                                     
                    char_c++;                    
                end 
                else;
            end
        `endif
        end
        else begin
            $display("uart_monitor_en undefine");
        end
    end

endmodule


`endif