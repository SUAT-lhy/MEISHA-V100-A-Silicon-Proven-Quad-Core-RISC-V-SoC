module nv_ram_rwsthp_60x21 (
    clk,
    ra,
    re,
    ore,
    dout,
    wa,
    we,
    di,
    byp_sel,
    dbyp,
    pwrbus_ram_pd
);


`ifndef AVOID_CONFLICT_USE_RAM


parameter FORCE_CONTENTION_ASSERTION_RESET_ACTIVE=1'b0;

// port list
input			clk;
input	[5:0]	ra;
input			re;
input			ore;
output	[20:0]	dout;
input	[5:0]	wa;
input			we;
input	[20:0]	di;
input			byp_sel;
input	[20:0]	dbyp;
input	[31:0]	pwrbus_ram_pd;

//reg and wire list
reg		[5:0]	ra_d;
wire	[20:0]	dout;
reg		[20:0]	M	[59:0];

always @( posedge clk ) begin
    if (we)
       M[wa] <= di;
end
 
always @( posedge clk ) begin
    if (re) 
       ra_d <= ra;
end

wire	[20:0]	dout_ram = M[ra_d];

wire	[20:0]	fbypass_dout_ram = (byp_sel ? dbyp : dout_ram);

reg		[20:0]	dout_r;
always @( posedge clk ) begin
   if (ore)
       dout_r <= fbypass_dout_ram;
end

assign dout = dout_r;


`else
// 定义参数
parameter FORCE_CONTENTION_ASSERTION_RESET_ACTIVE=1'b0;

// 端口列表
input           clk;
input   [6-1:0] ra;
input           re;
input           ore;
output  [21-1:0] dout;
input   [6-1:0] wa;
input           we;
input   [21-1:0] di;
input           byp_sel;
input   [21-1:0] dbyp;
input   [31:0] pwrbus_ram_pd;

// reg and wire
wire    [21-1:0] dout;
wire    [21-1:0] dout_ram;
wire    [21-1:0] fbypass_dout_ram = (byp_sel ? dbyp : dout_ram);
reg     [21-1:0] dout_r;

always @( posedge clk ) begin
   if (ore)
       dout_r <= fbypass_dout_ram;
end

assign dout = dout_r;

// 实例化原始模块
SZLVTLL40_64X21X1CM4b1 ram_inst (
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
`endif


endmodule
