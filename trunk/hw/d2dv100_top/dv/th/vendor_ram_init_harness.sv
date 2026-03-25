

`ifndef VENDOR_RAM_DEPOSIT_VALUE
    //`define VENDOR_RAM_DEPOSIT_VALUE $random
    `define VENDOR_RAM_DEPOSIT_VALUE 0
`endif

`define VENDOR_RAM_INIT_HARNESS_INITIAL_BEGIN_END_8byte(module_name) \
        begin \
            integer do_x; \
            integer LoopCount_Address; \
            LoopCount_Address = ``module_name``.Words-1; \
            $display("LoopCount_Address is %0d", LoopCount_Address); \
            while(LoopCount_Address >= 0) begin \
                ``module_name``.Memory_byte0[LoopCount_Address] = 0; \
                ``module_name``.Memory_byte1[LoopCount_Address] = 0; \
                ``module_name``.Memory_byte2[LoopCount_Address] = 0; \
                ``module_name``.Memory_byte3[LoopCount_Address] = 0; \
                ``module_name``.Memory_byte4[LoopCount_Address] = 0; \
                ``module_name``.Memory_byte5[LoopCount_Address] = 0; \
                ``module_name``.Memory_byte6[LoopCount_Address] = 0; \
                ``module_name``.Memory_byte7[LoopCount_Address] = 0; \
                LoopCount_Address--; \
            end \
            ``module_name``.DO_byte0_tmp = 0; \
            ``module_name``.DO_byte0_i = 0; \
            ``module_name``.DO_byte1_tmp = 0; \
            ``module_name``.DO_byte1_i = 0; \
            ``module_name``.DO_byte2_tmp = 0; \
            ``module_name``.DO_byte2_i = 0; \
            ``module_name``.DO_byte3_tmp = 0; \
            ``module_name``.DO_byte3_i = 0; \
            ``module_name``.DO_byte4_tmp = 0; \
            ``module_name``.DO_byte4_i = 0; \
            ``module_name``.DO_byte5_tmp = 0; \
            ``module_name``.DO_byte5_i = 0; \
            ``module_name``.DO_byte6_tmp = 0; \
            ``module_name``.DO_byte6_i = 0; \
            ``module_name``.DO_byte7_tmp = 0; \
            ``module_name``.DO_byte7_i = 0; \
        end

`define VENDOR_RAM_INIT_HARNESS_INITIAL_BEGIN_END_4byte(module_name) \
        begin \
            integer do_x; \
            integer LoopCount_Address; \
            LoopCount_Address = ``module_name``.Words-1; \
            while(LoopCount_Address >= 0) begin \
                ``module_name``.Memory_byte0[LoopCount_Address] = 0; \
                ``module_name``.Memory_byte1[LoopCount_Address] = 0; \
                ``module_name``.Memory_byte2[LoopCount_Address] = 0; \
                ``module_name``.Memory_byte3[LoopCount_Address] = 0; \
                LoopCount_Address--; \
            end \
        end
 
`define VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(module_name) \
module vendor_ram_init_harness_``module_name`` #( \
     parameter WIDTH_AWID   = 8 \
    ,parameter WIDTH_ARID   = 8 \
    )(); \
        initial begin \
            integer do_x; \
            integer LoopCount_Address; \
            #20us; \
            ``module_name``.all_core_zero; \
        end \
endmodule \
bind ``module_name`` vendor_ram_init_harness_``module_name`` u_vendor_ram_init_harness();


`define VENDOR_RAM_INIT_HARNESS_DEFINE_4_BANK(module_name) \
module vendor_ram_init_harness_``module_name`` #( \
     parameter WIDTH_AWID   = 8 \
    ,parameter WIDTH_ARID   = 8 \
    )(); \
        initial begin \
            integer do_x; \
            integer LoopCount_Address; \
            #20us; \
            ``module_name``.all_core_x(0,0); \
            ``module_name``.all_core_x(1,0); \
            ``module_name``.all_core_x(2,0); \
            ``module_name``.all_core_x(3,0); \
        end \
endmodule \
bind ``module_name`` vendor_ram_init_harness_``module_name`` u_vendor_ram_init_harness();

`define VENDOR_RAM_INIT_HARNESS_DEFINE_8_BANK(module_name) \
module vendor_ram_init_harness_``module_name`` #( \
     parameter WIDTH_AWID   = 8 \
    ,parameter WIDTH_ARID   = 8 \
    )(); \
        initial begin \
            integer do_x; \
            integer LoopCount_Address; \
            #20us; \
            ``module_name``.all_core_x(0,0); \
            ``module_name``.all_core_x(1,0); \
            ``module_name``.all_core_x(2,0); \
            ``module_name``.all_core_x(3,0); \
            ``module_name``.all_core_x(4,0); \
            ``module_name``.all_core_x(5,0); \
            ``module_name``.all_core_x(6,0); \
            ``module_name``.all_core_x(7,0); \
        end \
endmodule \
bind ``module_name`` vendor_ram_init_harness_``module_name`` u_vendor_ram_init_harness();



`define VENDOR_RAM_INIT_HARNESS_DEFINE_DEPRECIATE(module_name) \
module vendor_ram_init_harness_``module_name`` #( \
     parameter WIDTH_AWID   = 8 \
    ,parameter WIDTH_ARID   = 8 \
    )(); \
        initial begin \
            integer do_x; \
            integer LoopCount_Address; \
            #20us; \
            for (integer byte_num = 0; byte_num < ``module_name``.Bytes; byte_num++) begin \
                LoopCount_Address = ``module_name``.Words-1; \
                case (byte_num) \
                    0 : begin \
                        while(LoopCount_Address >= 0) begin \
                            $deposit(``module_name``.Memory_byte0[LoopCount_Address], $random); \
                        end \
                    end \
                    1 : begin \
                        while(LoopCount_Address >= 0) begin \
                            $deposit(``module_name``.Memory_byte0[LoopCount_Address], $random); \
                        end \
                    end \
                    2 : begin \
                        while(LoopCount_Address >= 0) begin \
                            $deposit(``module_name``.Memory_byte0[LoopCount_Address], $random); \
                        end \
                    end \
                    3 : begin \
                        while(LoopCount_Address >= 0) begin \
                            $deposit(``module_name``.Memory_byte0[LoopCount_Address], $random); \
                        end \
                    end \
                    4 : begin \
                        while(LoopCount_Address >= 0) begin \
                            $deposit(``module_name``.Memory_byte0[LoopCount_Address], $random); \
                        end \
                    end \
                    5 : begin \
                        while(LoopCount_Address >= 0) begin \
                            $deposit(``module_name``.Memory_byte0[LoopCount_Address], $random); \
                        end \
                    end \
                    6 : begin \
                        while(LoopCount_Address >= 0) begin \
                            $deposit(``module_name``.Memory_byte0[LoopCount_Address], $random); \
                        end \
                    end \
                    7 : begin \
                        while(LoopCount_Address >= 0) begin \
                            $deposit(``module_name``.Memory_byte0[LoopCount_Address], $random); \
                        end \
                    end \
                endcase \
            end \
        end \
endmodule \
bind ``module_name`` vendor_ram_init_harness_``module_name`` u_vendor_ram_init_harness();

// wait all ram is reset
`VENDOR_RAM_INIT_HARNESS_DEFINE_8_BANK(SHLVTLB40_8192X8X8CM8b1)
`VENDOR_RAM_INIT_HARNESS_DEFINE_8_BANK(SQLVTLG40_512X8X8CM4b1)
`VENDOR_RAM_INIT_HARNESS_DEFINE_4_BANK(SQLVTLG40_64X21X4CM2b1)

// `VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(SZLVTLB40_16X256X1CM1b1)
// `VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(SZLVTLB40_16X272X1CM1b1)
// `VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(SZLVTLB40_16X64X1CM1b1)
// `VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(SZLVTLB40_16X66X1CM1b1)
// `VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(SZLVTLB40_8X66X1CM1b1)
// `VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(SZLVTLL40_128X11X1CM4b1)
// `VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(SZLVTLL40_128X18X1CM2b1)
// `VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(SZLVTLL40_128X6X1CM4b1)
// `VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(SZLVTLL40_16X14X1CM2b1)
// `VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(SZLVTLL40_16X16X1CM2b1)
// `VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(SZLVTLL40_256X64X1CM2b1)
// `VENDOR_RAM_INIT_HARNESS_DEFINE_SZL(SZLVTLL40_32X32X1CM2b1)


`undef VENDOR_RAM_DEPOSIT_VALUE