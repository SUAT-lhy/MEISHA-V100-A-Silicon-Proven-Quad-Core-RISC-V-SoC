module nv_ram_rwsp_16x14 (
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
input   [4-1:0] ra;
input           re;
input           ore;
output  [14-1:0] dout;
input   [4-1:0] wa;
input           we;
input   [14-1:0] di;
input   [31:0] pwrbus_ram_pd;

// reg and wire
wire    [14-1:0] dout;
wire    [14-1:0] dout_ram;
reg     [14-1:0] dout_r;

always @( posedge clk ) begin
   if (ore)
       dout_r <= dout_ram;
end

assign dout = dout_r;

// 实例化原始模块
SZLVTLL40_16X14X1CM2b1 ram_inst (
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
