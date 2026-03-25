module nv_ram_rwsp_256x257 (
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
input   [8-1:0] ra;
input           re;
input           ore;
output  [257-1:0] dout;
input   [8-1:0] wa;
input           we;
input   [257-1:0] di;
input   [31:0] pwrbus_ram_pd;

// reg and wire
wire    [257-1:0] dout;
wire    [257-1:0] dout_ram;
wire      dout_ram_unused;
reg     [257-1:0] dout_r;

always @( posedge clk ) begin
   if (ore)
       dout_r <= dout_ram;
end

assign dout = dout_r;

// 实例化原始模块
SZLVTLB40_256X258X1CM1b1 ram_inst (
    .A(ra),
    .B(wa),
    .DO({dout_ram_unused, dout_ram[257-1:0]}),
    .DI({1'b0, di[257-1:0]}),
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
