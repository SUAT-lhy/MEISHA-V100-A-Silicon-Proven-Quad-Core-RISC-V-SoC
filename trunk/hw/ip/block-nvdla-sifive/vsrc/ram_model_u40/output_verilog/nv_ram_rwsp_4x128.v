module nv_ram_rwsp_4x128 (
    clk,
    ra,
    re,
    ore,
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
input   [2-1:0] ra;
input           re;
input           ore;
output  [128-1:0] dout;
input   [2-1:0] wa;
input           we;
input   [128-1:0] di;
input   [31:0] pwrbus_ram_pd;

// reg and wire
wire    [128-1:0] dout;
wire    [128-1:0] dout_ram;
reg     [128-1:0] dout_r;

always @( posedge clk ) begin
   if (ore)
       dout_r <= dout_ram;
end

assign dout = dout_r;

// 实例化原始模块
SZLVTLB40_4X128X1CM1b1 ram_inst (
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
