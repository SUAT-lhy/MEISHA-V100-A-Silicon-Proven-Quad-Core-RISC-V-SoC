
module sdram_axi_pmem
      #(parameter 
                  WIDTH_ID    = 4 // ID width in bits
                , WIDTH_AD    = 32 // address width
                , WIDTH_DA    = 64 // data width
      )
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           axi_awvalid
    ,input  [ 31:0]  axi_awaddr
    ,input  [  3:0]  axi_awid
    ,input  [  2:0]  axi_awsize
    ,input  [  7:0]  axi_awlen
    ,input  [  1:0]  axi_awburst
    ,input           axi_wvalid
    ,input  [ WIDTH_DA-1:0]  axi_wdata
    ,input  [ WIDTH_DA/8-1:0]  axi_wstrb
    ,input           axi_wlast
    ,input           axi_bready
    ,input           axi_arvalid
    ,input  [ 31:0]  axi_araddr
    ,input  [  3:0]  axi_arid
    ,input  [  2:0]  axi_arsize
    ,input  [  7:0]  axi_arlen
    ,input  [  1:0]  axi_arburst
    ,input           axi_rready

    // Outputs
    ,output          axi_awready
    ,output          axi_wready
    ,output          axi_bvalid
    ,output [  1:0]  axi_bresp
    ,output [  3:0]  axi_bid
    ,output          axi_arready
    ,output          axi_rvalid
    ,output [ WIDTH_DA-1:0]  axi_rdata
    ,output [  1:0]  axi_rresp
    ,output [  3:0]  axi_rid
    ,output          axi_rlast
    
    ,input           ram_accept_i
    ,input           ram_ack_i
    ,input           ram_error_i
    ,input  [ 32-1:0]  ram_read_data_i
    ,output [  3:0]  ram_wr_o
    ,output          ram_rd_o
    //,output [  7:0]  ram_len_o
    ,output [ 31:0]  ram_addr_o
    ,output [ 31:0]  ram_write_data_o
);



//-------------------------------------------------------------
// calculate_addr_next
//-------------------------------------------------------------
function [31:0] calculate_addr_next;
    input [31:0] addr;
    input [1:0]  axtype;
    input [7:0]  axlen;

    reg [31:0]   mask;
begin
    mask = 0;

    case (axtype)
    2'd0: // AXI4_BURST_FIXED
    begin
        calculate_addr_next = addr;
    end
    2'd2: // AXI4_BURST_WRAP
    begin
        case (axlen)
        8'd0:      mask = 32'h03;
        8'd1:      mask = 32'h07;
        8'd3:      mask = 32'h0F;
        8'd7:      mask = 32'h1F;
        8'd15:     mask = 32'h3F;
        default:   mask = 32'h3F;
        endcase

        calculate_addr_next = (addr & ~mask) | ((addr + 4) & mask);
    end
    default: // AXI4_BURST_INCR
        calculate_addr_next = addr + 4;
    endcase
end
endfunction

//-----------------------------------------------------------------
// Registers / Wires
//-----------------------------------------------------------------
reg [7:0]   req_len_q;
reg [31:0]  req_addr_q;
reg         req_rd_q;
reg         req_wr_q;
reg [3:0]   req_id_q;
reg [1:0]   req_axburst_q;
reg [7:0]   req_axlen_q;
reg         req_prio_q;
reg         req_hold_rd_q;
reg         req_hold_wr_q;

wire        req_fifo_accept_w;

//-----------------------------------------------------------------
// Sequential
//-----------------------------------------------------------------
always @ (posedge clk_i or posedge rst_i)
if (rst_i)
begin
    req_len_q     <= 8'b0;
    req_addr_q    <= 32'b0;
    req_wr_q      <= 1'b0;
    req_rd_q      <= 1'b0;
    req_id_q      <= 4'b0;
    req_axburst_q <= 2'b0;
    req_axlen_q   <= 8'b0;
    req_prio_q    <= 1'b0;
end
else
begin
    // Burst continuation
    if ((ram_wr_o != 4'b0 || ram_rd_o) && ram_accept_i)
    begin
        if (req_len_q == 8'd0)
        begin
            req_rd_q   <= 1'b0;
            req_wr_q   <= 1'b0;
        end
        else
        begin
            req_addr_q <= calculate_addr_next(req_addr_q, req_axburst_q, req_axlen_q);
            req_len_q  <= req_len_q - 8'd1;
        end
    end

    // Write command accepted
    if (axi_awvalid && axi_awready)
    begin
        // Data ready?
        if (axi_wvalid && axi_wready)
        begin
            req_wr_q      <= !axi_wlast;
            req_len_q     <= axi_awlen - 8'd1;
            req_id_q      <= axi_awid;
            req_axburst_q <= axi_awburst;
            req_axlen_q   <= axi_awlen;
            req_addr_q    <= calculate_addr_next(axi_awaddr, axi_awburst, axi_awlen);
        end
        // Data not ready
        else
        begin
            req_wr_q      <= 1'b1;
            req_len_q     <= axi_awlen;
            req_id_q      <= axi_awid;
            req_axburst_q <= axi_awburst;
            req_axlen_q   <= axi_awlen;
            req_addr_q    <= axi_awaddr;
        end
        req_prio_q    <= !req_prio_q;
    end
    // Read command accepted
    else if (axi_arvalid && axi_arready)
    begin
        req_rd_q      <= (axi_arlen != 0);
        req_len_q     <= axi_arlen - 8'd1;
        req_addr_q    <= calculate_addr_next(axi_araddr, axi_arburst, axi_arlen);
        req_id_q      <= axi_arid;
        req_axburst_q <= axi_arburst;
        req_axlen_q   <= axi_arlen;
        req_prio_q    <= !req_prio_q;
    end
end

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
begin
    req_hold_rd_q   <= 1'b0;
    req_hold_wr_q   <= 1'b0;
end
else
begin
    if (ram_rd_o && !ram_accept_i)
        req_hold_rd_q   <= 1'b1;
    else if (ram_accept_i)
        req_hold_rd_q   <= 1'b0;

    if ((|ram_wr_o) && !ram_accept_i)
        req_hold_wr_q   <= 1'b1;
    else if (ram_accept_i)
        req_hold_wr_q   <= 1'b0;
end

//-----------------------------------------------------------------
// Request tracking
//-----------------------------------------------------------------
wire       req_push_w = (ram_rd_o || (ram_wr_o != 4'b0)) && ram_accept_i;
reg [5:0]  req_in_r;

wire       req_out_valid_w;
wire [5:0] req_out_w;
wire       resp_accept_w;


always @ *
begin
    req_in_r = 6'b0;

    // First cycle of read burst
    if (axi_arvalid && axi_arready)
        req_in_r = {1'b1, (axi_arlen == 8'd0), axi_arid};
    // First cycle of write burst
    else if (axi_awvalid && axi_awready)
        req_in_r = {1'b0, (axi_awlen == 8'd0), axi_awid};
    // In burst
    else
        req_in_r = {ram_rd_o, (req_len_q == 8'd0), req_id_q};
end

sdram_axi_pmem_fifo2
#( .WIDTH(1 + 1 + WIDTH_ID) )
u_requests
(
    .clk_i(clk_i),
    .rst_i(rst_i),

    // Input
    .data_in_i(req_in_r),
    .push_i(req_push_w),
    .accept_o(req_fifo_accept_w),

    // Output
    .pop_i(resp_accept_w),
    .data_out_o(req_out_w),
    .valid_o(req_out_valid_w)
);

wire resp_is_write_w = req_out_valid_w ? ~req_out_w[5] : 1'b0;
wire resp_is_read_w  = req_out_valid_w ? req_out_w[5]  : 1'b0;
wire resp_is_last_w  = req_out_w[4];
wire [3:0] resp_id_w = req_out_w[3:0];

//-----------------------------------------------------------------
// Response buffering
//-----------------------------------------------------------------
wire resp_valid_w;

/*
	async_fifo #(
		.LGFIFO(LGFIFO),
		.WIDTH(WIDTH_PAYLOAD)
	) u_async_fifo (
		// {{{
		.i_wclk(S_CLK),		
		.i_wr_reset_n(S_ARESETN),
		.i_wr((S_VALID)),
		.i_wr_data({
			`ifdef AXI_HAVE_USER
			s_user, 
			`endif
			s_len, s_size, s_burst, s_id, s_address}),
		.o_wr_full(w_full),
		//
		.i_rclk(M_CLK),		
		.i_rd_reset_n(M_ARESETN),
		.i_rd(M_READY),
		.o_rd_data({
			`ifdef AXI_HAVE_USER
			m_user, 
			`endif
			m_len, m_size, m_burst, m_id, m_address}),
		.o_rd_empty(w_empty)
		// }}}
	);
    */

sdram_axi_pmem_fifo2
#( .WIDTH(32) )
u_response
(
    .clk_i(clk_i),
    .rst_i(rst_i),

    // Input
    .data_in_i(ram_read_data_i),
    .push_i(ram_ack_i),
    .accept_o(),

    // Output
    .pop_i(resp_accept_w),
    .data_out_o(axi_rdata[31:0]),
    .valid_o(resp_valid_w)
);

//-----------------------------------------------------------------
// RAM Request
//-----------------------------------------------------------------

// Round robin priority between read and write
wire write_prio_w   = ((req_prio_q  & !req_hold_rd_q) | req_hold_wr_q);
wire read_prio_w    = ((!req_prio_q & !req_hold_wr_q) | req_hold_rd_q);

wire write_active_w  = (axi_awvalid || req_wr_q) && !req_rd_q && req_fifo_accept_w && (write_prio_w || req_wr_q || !axi_arvalid);
wire read_active_w   = (axi_arvalid || req_rd_q) && !req_wr_q && req_fifo_accept_w && (read_prio_w || req_rd_q || !axi_awvalid);

assign axi_awready = write_active_w && !req_wr_q && ram_accept_i && req_fifo_accept_w;
assign axi_wready  = write_active_w &&              ram_accept_i && req_fifo_accept_w;
assign axi_arready = read_active_w  && !req_rd_q && ram_accept_i && req_fifo_accept_w;

wire [31:0] addr_w   = ((req_wr_q || req_rd_q) ? req_addr_q:
                        write_active_w ? axi_awaddr : axi_araddr);

wire wr_w    = write_active_w && axi_wvalid;
wire rd_w    = read_active_w;

// RAM if
assign ram_addr_o       = addr_w;
assign ram_write_data_o = axi_wdata;
assign ram_rd_o         = rd_w;
assign ram_wr_o         = wr_w ? axi_wstrb : 4'b0;
//assign ram_len_o        = axi_awvalid ? axi_awlen: (axi_arvalid ? axi_arlen : 8'b0);

//-----------------------------------------------------------------
// Response
//-----------------------------------------------------------------
assign axi_bvalid  = resp_valid_w & resp_is_write_w & resp_is_last_w;
assign axi_bresp   = 2'b0;
assign axi_bid     = resp_id_w;

assign axi_rvalid  = resp_valid_w & resp_is_read_w;
assign axi_rresp   = 2'b0;
assign axi_rid     = resp_id_w;
assign axi_rlast   = resp_valid_w & resp_is_read_w & resp_is_last_w;

assign resp_accept_w    = (axi_rvalid & axi_rready) | 
                          (axi_bvalid & axi_bready) |
                          (resp_valid_w & resp_is_write_w & !resp_is_last_w); // Ignore write resps mid burst

endmodule

//-----------------------------------------------------------------
// FIFO
//-----------------------------------------------------------------
module sdram_axi_pmem_fifo2

//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
    parameter WIDTH   = 8,
    parameter DEPTH   = 4,
    parameter ADDR_W  = 2
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // Inputs
     input               clk_i
    ,input               rst_i
    ,input  [WIDTH-1:0]  data_in_i
    ,input               push_i
    ,input               pop_i

    // Outputs
    ,output [WIDTH-1:0]  data_out_o
    ,output              accept_o
    ,output              valid_o
);

//-----------------------------------------------------------------
// Local Params
//-----------------------------------------------------------------
localparam COUNT_W = ADDR_W + 1;

//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------
reg [WIDTH-1:0]         ram [DEPTH-1:0];
reg [ADDR_W-1:0]        rd_ptr;
reg [ADDR_W-1:0]        wr_ptr;
reg [COUNT_W-1:0]       count;

//-----------------------------------------------------------------
// Sequential
//-----------------------------------------------------------------
always @ (posedge clk_i or posedge rst_i)
if (rst_i)
begin
    count   <= {(COUNT_W) {1'b0}};
    rd_ptr  <= {(ADDR_W) {1'b0}};
    wr_ptr  <= {(ADDR_W) {1'b0}};
end
else
begin
    // Push
    if (push_i & accept_o)
    begin
        ram[wr_ptr] <= data_in_i;
        wr_ptr      <= wr_ptr + 1;
    end

    // Pop
    if (pop_i & valid_o)
        rd_ptr      <= rd_ptr + 1;

    // Count up
    if ((push_i & accept_o) & ~(pop_i & valid_o))
        count <= count + 1;
    // Count down
    else if (~(push_i & accept_o) & (pop_i & valid_o))
        count <= count - 1;
end

//-------------------------------------------------------------------
// Combinatorial
//-------------------------------------------------------------------
/* verilator lint_off WIDTH */
assign accept_o   = (count != DEPTH);
assign valid_o    = (count != 0);
/* verilator lint_on WIDTH */

assign data_out_o = ram[rd_ptr];



endmodule
