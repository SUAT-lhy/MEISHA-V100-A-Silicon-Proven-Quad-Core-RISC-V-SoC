module Queue_25( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305233.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305234.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305235.4]
  output        io_enq_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305236.4]
  input         io_enq_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305236.4]
  input  [4:0]  io_enq_bits_rd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305236.4]
  input  [63:0] io_enq_bits_data, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305236.4]
  input         io_deq_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305236.4]
  output        io_deq_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305236.4]
  output [4:0]  io_deq_bits_rd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305236.4]
  output [63:0] io_deq_bits_data // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305236.4]
);
  reg [4:0] _T_35_rd [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  reg [31:0] _RAND_0;
  wire [4:0] _T_35_rd__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  wire  _T_35_rd__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  wire [4:0] _T_35_rd__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  wire  _T_35_rd__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  wire  _T_35_rd__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  wire  _T_35_rd__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  reg [63:0] _T_35_data [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  reg [63:0] _RAND_1;
  wire [63:0] _T_35_data__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  wire  _T_35_data__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  wire [63:0] _T_35_data__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  wire  _T_35_data__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  wire  _T_35_data__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  wire  _T_35_data__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  reg  value; // @[Counter.scala 26:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305239.4]
  reg [31:0] _RAND_2;
  reg  value_1; // @[Counter.scala 26:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305240.4]
  reg [31:0] _RAND_3;
  reg  _T_39; // @[Decoupled.scala 217:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305241.4]
  reg [31:0] _RAND_4;
  wire  _T_40; // @[Decoupled.scala 219:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305242.4]
  wire  _T_41; // @[Decoupled.scala 220:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305243.4]
  wire  _T_42; // @[Decoupled.scala 220:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305244.4]
  wire  _T_43; // @[Decoupled.scala 221:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305245.4]
  wire  _T_44; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305246.4]
  wire  _T_47; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305249.4]
  wire  _T_52; // @[Counter.scala 35:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305258.6]
  wire  _T_54; // @[Counter.scala 35:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305264.6]
  wire  _T_55; // @[Decoupled.scala 232:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305267.4]
  assign _T_35_rd__T_58_addr = value_1;
  assign _T_35_rd__T_58_data = _T_35_rd[_T_35_rd__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  assign _T_35_rd__T_50_data = io_enq_bits_rd;
  assign _T_35_rd__T_50_addr = value;
  assign _T_35_rd__T_50_mask = 1'h1;
  assign _T_35_rd__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_data__T_58_addr = value_1;
  assign _T_35_data__T_58_data = _T_35_data[_T_35_data__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
  assign _T_35_data__T_50_data = io_enq_bits_data;
  assign _T_35_data__T_50_addr = value;
  assign _T_35_data__T_50_mask = 1'h1;
  assign _T_35_data__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_40 = value == value_1; // @[Decoupled.scala 219:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305242.4]
  assign _T_41 = _T_39 == 1'h0; // @[Decoupled.scala 220:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305243.4]
  assign _T_42 = _T_40 & _T_41; // @[Decoupled.scala 220:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305244.4]
  assign _T_43 = _T_40 & _T_39; // @[Decoupled.scala 221:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305245.4]
  assign _T_44 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305246.4]
  assign _T_47 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305249.4]
  assign _T_52 = value + 1'h1; // @[Counter.scala 35:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305258.6]
  assign _T_54 = value_1 + 1'h1; // @[Counter.scala 35:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305264.6]
  assign _T_55 = _T_44 != _T_47; // @[Decoupled.scala 232:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305267.4]
  assign io_enq_ready = _T_43 == 1'h0; // @[Decoupled.scala 237:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305274.4]
  assign io_deq_valid = _T_42 == 1'h0; // @[Decoupled.scala 236:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305272.4]
  assign io_deq_bits_rd = _T_35_rd__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305277.4]
  assign io_deq_bits_data = _T_35_data__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305276.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_rd[initvar] = _RAND_0[4:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_data[initvar] = _RAND_1[63:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  value_1 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_39 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_rd__T_50_en & _T_35_rd__T_50_mask) begin
      _T_35_rd[_T_35_rd__T_50_addr] <= _T_35_rd__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
    end
    if(_T_35_data__T_50_en & _T_35_data__T_50_mask) begin
      _T_35_data[_T_35_data__T_50_addr] <= _T_35_data__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305238.4]
    end
    if (reset) begin
      value <= 1'h0;
    end else begin
      if (_T_44) begin
        value <= _T_52;
      end
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else begin
      if (_T_47) begin
        value_1 <= _T_54;
      end
    end
    if (reset) begin
      _T_39 <= 1'h0;
    end else begin
      if (_T_55) begin
        _T_39 <= _T_44;
      end
    end
  end
endmodule