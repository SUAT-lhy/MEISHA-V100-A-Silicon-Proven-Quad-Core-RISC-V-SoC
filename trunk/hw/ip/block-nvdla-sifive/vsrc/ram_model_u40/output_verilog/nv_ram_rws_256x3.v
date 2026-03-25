module nv_ram_rws_256x3 (
    clk,
    ra,
    re,
    dout,
    wa,
    we,
    di,
    pwrbus_ram_pd
);


`ifndef AVOID_CONFLICT_USE_RAM

parameter FORCE_CONTENTION_ASSERTION_RESET_ACTIVE=1'b0;

// port list
input			clk;
input	[7:0]	ra;
input			re;
output	[2:0]	dout;
input	[7:0]	wa;
input			we;
input	[2:0]	di;
input	[31:0]	pwrbus_ram_pd;

//reg and wire list
reg		[7:0]	ra_d;
wire	[2:0]	dout;
reg		[2:0]	M	[255:0];

always @( posedge clk ) begin
    if (we)
       M[wa] <= di;
end
 
always @( posedge clk ) begin
    if (re) 
       ra_d <= ra;
end
assign  dout = M[ra_d];
`else

// 定义参数
parameter FORCE_CONTENTION_ASSERTION_RESET_ACTIVE=1'b0;

// 端口列表
input           clk;
input   [8-1:0] ra;
input           re;
output  [3-1:0] dout;
input   [8-1:0] wa;
input           we;
input   [3-1:0] di;
input   [31:0] pwrbus_ram_pd;

// reg and wire
wire    [3-1:0] dout;
wire    [3-1:0] dout_ram;

assign dout = dout_ram;

// 实例化原始模块
SZLVTLL40_256X3X1CM8b1 ram_inst (
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
