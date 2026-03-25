module SYLB40_512X8X4CM4_top // single port 512x32
(
    input   reg              CK,        // Clock signal for addresses, CSB, WEB, and DI
    input   reg     [8:0]    Addr,      // Address inputs
    input   reg     [31:0]   Data_in,   // Data inputs
    input   reg     [3:0]    WEB,       // Write enable, Active low
    input   reg              CSB,       // Chip selection, Active low, 1: Disable RAM, 0: Normal operation
    input   reg              DVSE,      // Enable the delay option, Active high
    input   reg     [3:0]    DVS,       // Delay option
    input   reg              NAP,       // Enable the NAP mode, Asynchronous, Active high
    output  wire    [31:0]   Data_out  // Data outputs
);
    // 实例化 SYLB40_512X8X4CM4 模块
    SYLB40_512X8X4CM4 u_SYLB40_512X8X4CM4 (

        .CK(CK),
        .CSB(CSB),
        .NAP(NAP),
        .WEB0(WEB[0]), .WEB1(WEB[1]), .WEB2(WEB[2]), .WEB3(WEB[3]),

        .DVSE(DVSE),
        .DVS0(DVS[0]), .DVS1(DVS[1]), .DVS2(DVS[2]), .DVS3(DVS[3]),

        .A0(Addr[0]), .A1(Addr[1]), .A2(Addr[2]), .A3(Addr[3]), .A4(Addr[4]),
        .A5(Addr[5]), .A6(Addr[6]), .A7(Addr[7]), .A8(Addr[8]),

        .DI0(Data_in[0]), .DI1(Data_in[1]), .DI2(Data_in[2]), .DI3(Data_in[3]),
        .DI4(Data_in[4]), .DI5(Data_in[5]), .DI6(Data_in[6]), .DI7(Data_in[7]),
        .DI8(Data_in[8]), .DI9(Data_in[9]), .DI10(Data_in[10]), .DI11(Data_in[11]),
        .DI12(Data_in[12]), .DI13(Data_in[13]), .DI14(Data_in[14]), .DI15(Data_in[15]),
        .DI16(Data_in[16]), .DI17(Data_in[17]), .DI18(Data_in[18]), .DI19(Data_in[19]),
        .DI20(Data_in[20]), .DI21(Data_in[21]), .DI22(Data_in[22]), .DI23(Data_in[23]),
        .DI24(Data_in[24]), .DI25(Data_in[25]), .DI26(Data_in[26]), .DI27(Data_in[27]),
        .DI28(Data_in[28]), .DI29(Data_in[29]), .DI30(Data_in[30]), .DI31(Data_in[31]),

        .DO0(Data_out[0]), .DO1(Data_out[1]), .DO2(Data_out[2]), .DO3(Data_out[3]),
        .DO4(Data_out[4]), .DO5(Data_out[5]), .DO6(Data_out[6]), .DO7(Data_out[7]),
        .DO8(Data_out[8]), .DO9(Data_out[9]), .DO10(Data_out[10]), .DO11(Data_out[11]),
        .DO12(Data_out[12]), .DO13(Data_out[13]), .DO14(Data_out[14]), .DO15(Data_out[15]),
        .DO16(Data_out[16]), .DO17(Data_out[17]), .DO18(Data_out[18]), .DO19(Data_out[19]),
        .DO20(Data_out[20]), .DO21(Data_out[21]), .DO22(Data_out[22]), .DO23(Data_out[23]),
        .DO24(Data_out[24]), .DO25(Data_out[25]), .DO26(Data_out[26]), .DO27(Data_out[27]),
        .DO28(Data_out[28]), .DO29(Data_out[29]), .DO30(Data_out[30]), .DO31(Data_out[31])

    );

endmodule
