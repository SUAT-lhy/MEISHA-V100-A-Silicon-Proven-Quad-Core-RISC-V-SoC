/*
* 真双端口ram，宽度默认为1，深度为2(地址线自动计算)，
 */

module dp_sram_wrapper #(
  parameter p_data_nbits  = 1,
  parameter p_num_entries = 2,

  // Local constants not meant to be set from outside the module
  parameter c_addr_nbits  = $clog2(p_num_entries),
  parameter c_data_nbytes = (p_data_nbits+7)/8 // $ceil(p_data_nbits/8)
) (
  input wr_clk,
  input rd_clk,
  input  wire [c_addr_nbits-1:0]   wr_addr, // address
  input  wire [c_addr_nbits-1:0]   rd_addr, // address
  `ifdef USE_BYTE_EN
  input  wire [c_data_nbytes-1:0]  byteen,  // byte en
  `else
  input  wire [p_data_nbits-1:0]   biten,  // bit en
  `endif
  input  wire [p_data_nbits-1:0]   din,  // write data
  output wire [p_data_nbits-1:0]   dout  // read data
	input wr_en,
	input rd_en
);
	reg [p_data_nbits-1:0] mem[p_num_entries-1:0];
    reg [p_data_nbits-1:0] rd_data;

	//写
	always@(posedge wr_clk) begin
        if(wr_en)
            mem[wr_addr] <= din;
        else
            mem[wr_addr] <= mem[wr_addr];
	end

	//读
	always @(posedge rd_clk) begin
        if(rd_en)
            rd_data <= mem[rd_addr];
        else
            rd_data <= rd_data;
	end

    assign dout = rd_data;

endmodule


