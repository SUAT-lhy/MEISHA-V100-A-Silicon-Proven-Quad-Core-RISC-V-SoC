module scr (
    output reg [63:0] SCR,
    output reg [3:0] SCR_STRUCT,
    output reg [3:0] SD_SPEC,
    output reg DATA_STAT_AFTER_ERASE,
    output reg [2:0] SD_SECURITY,
    output reg [3:0] SD_BUS_WIDTHS,
    output reg SD_SPEC3,
    output reg [3:0] EX_SECURITY,
    output reg SD_SPEC4,
    output reg [5:0] RESERVED,
    output reg [3:0] CMD_SUPPORT,
    output reg [31:0] RESERVED_MANUFACTURER
);

    // 设置初始值
    initial begin
        // 设置各字段值
        SCR_STRUCT = 4'b0000;                  // SCR_STRUCT: 4 bits
        SD_SPEC = 4'b0010;                     // SD_SPEC: 4 bits
        DATA_STAT_AFTER_ERASE = 1'b0;         // DATA_STAT_AFTER_ERASE: 1 bit
        SD_SECURITY = 3'b011;                  // SD_SECURITY: 3 bits
        SD_BUS_WIDTHS = 4'b0101;               // SD_BUS_WIDTHS: 4 bits
        SD_SPEC3 = 1'b1;                       // SD_SPEC3: 1 bit
        EX_SECURITY = 4'b0000;                 // EX_SECURITY: 4 bits
        SD_SPEC4 = 1'b0;                       // SD_SPEC4: 1 bit
        RESERVED = 6'b000000;                  // 保留区域: 6 bits
        CMD_SUPPORT = 4'b0010;                 // CMD_SUPPORT: 4 bits
        RESERVED_MANUFACTURER = 32'h01000000;  // Reserved for Manufacturer Usage: 32 bits

        // 组合成 scr_data
        SCR = {SCR_STRUCT, SD_SPEC, DATA_STAT_AFTER_ERASE, SD_SECURITY,
                     SD_BUS_WIDTHS, SD_SPEC3, EX_SECURITY, SD_SPEC4,
                     RESERVED, CMD_SUPPORT, RESERVED_MANUFACTURER};
    end

endmodule
