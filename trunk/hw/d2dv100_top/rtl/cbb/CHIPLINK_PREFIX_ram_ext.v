module CHIPLINK_PREFIX_ram_ext(
  input W0_clk,
  input [4:0] W0_addr,
  input W0_en,
  input [31:0] W0_data,
  input R0_clk,
  input [4:0] R0_addr,
  input R0_en,
  output [31:0] R0_data
);


`ifdef VENDOR_RAM_EN

  parameter MAX_RAM_ARRAY_NUM = 1; // 64 * 21 * 4 

  wire [42:0] data_out_unused[MAX_RAM_ARRAY_NUM];

 
  genvar i, j, k;

  generate

    for(i = 0; i < MAX_RAM_ARRAY_NUM; i++) begin:ram_array_inst
        
        // UMC40lvt Dual Port SRAM, B port write, A port read
        // 实例化原始模块
        SZLVTLL40_32X32X1CM2b1 ram_inst (
            .A(R0_addr),
            .B(W0_addr),
            .DO(R0_data),
            .DI(W0_data),
            .CKA(R0_clk), 
            .CKB(W0_clk), 
            .CSAN(~R0_en), 
            .DVSE(1'b0), 
            .DVS(4'b0000),
            .WEB(~W0_en), 
            .CSBN(~W0_en), 
            .NAP(1'b0), 
            .SLP(1'b0),
            .RET(1'b0)
        );
    end

  endgenerate

`else

  reg reg_R0_ren;
  reg [4:0] reg_R0_addr;
  reg [31:0] ram [31:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
      for (initvar = 0; initvar < 32; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      ram[W0_addr][31:0] <= W0_data[31:0];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
      R0_random = {$random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[31:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

  `endif

endmodule
