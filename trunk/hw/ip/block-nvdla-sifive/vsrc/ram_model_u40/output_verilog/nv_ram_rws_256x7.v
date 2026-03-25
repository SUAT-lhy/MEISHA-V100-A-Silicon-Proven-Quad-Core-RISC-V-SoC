module nv_ram_rws_256x7 (
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
input   [8-1:0] ra;
input           re;
output  [7-1:0] dout;
input   [8-1:0] wa;
input           we;
input   [7-1:0] di;
input   [31:0] pwrbus_ram_pd;

// reg and wire
wire    [7-1:0] dout;
wire    [7-1:0] dout_ram;

assign dout = dout_ram;

// 实例化原始模块
SZLVTLL40_256X7X1CM4b1 ram_inst (
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
    .NAP(1'b0), 
    .SLP(1'b0),
    .RET(1'b0)
);

endmodule
