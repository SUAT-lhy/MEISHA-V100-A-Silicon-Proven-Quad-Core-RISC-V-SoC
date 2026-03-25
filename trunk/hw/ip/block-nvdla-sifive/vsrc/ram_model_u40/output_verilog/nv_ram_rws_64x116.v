module nv_ram_rws_64x116 (
    clk,
    ra,
    re,
    dout,
    wa,
    we,
    di,
    pwrbus_ram_pd
);

// 定义参数
parameter FORCE_CONTENTION_ASSERTION_RESET_ACTIVE=1'b0;

// 端口列表
input           clk;
input   [6-1:0] ra;
input           re;
output  [116-1:0] dout;
input   [6-1:0] wa;
input           we;
input   [116-1:0] di;
input   [31:0] pwrbus_ram_pd;

// reg and wire
wire    [116-1:0] dout;
wire    [116-1:0] dout_ram;

assign dout = dout_ram;

// 实例化原始模块
SZLVTLB40_64X116X1CM1b1 ram_inst (
    .A(ra),
    .B(wa),
    .DO(dout_ram),
    .DI(di),
    .CKA(clk), 
    .CKB(clk), 
    .CSAN(~re), 
    .DVSE(1'b0), 
    .DVS(4'b0000),
    .WEB(~we), 
    .CSBN(~we), 
    .NAP(1'b0)
);

endmodule
