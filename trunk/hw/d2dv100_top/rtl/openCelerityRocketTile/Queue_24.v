module Queue_24( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304984.2]
  input   clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304985.4]
  input   reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304986.4]
  output  io_enq_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304987.4]
  input   io_enq_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304987.4]
  input   io_enq_bits, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304987.4]
  input   io_deq_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304987.4]
  output  io_deq_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304987.4]
  output  io_deq_bits // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304987.4]
);
  reg  _T_35 [0:1]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304992.4]
  reg [31:0] _RAND_0;
  wire  _T_35__T_58_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304992.4]
  wire  _T_35__T_58_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304992.4]
  wire  _T_35__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304992.4]
  wire  _T_35__T_50_addr; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304992.4]
  wire  _T_35__T_50_mask; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304992.4]
  wire  _T_35__T_50_en; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304992.4]
  reg  value; // @[Counter.scala 26:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304993.4]
  reg [31:0] _RAND_1;
  reg  value_1; // @[Counter.scala 26:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304994.4]
  reg [31:0] _RAND_2;
  reg  _T_39; // @[Decoupled.scala 217:35:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304995.4]
  reg [31:0] _RAND_3;
  wire  _T_40; // @[Decoupled.scala 219:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304996.4]
  wire  _T_41; // @[Decoupled.scala 220:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304997.4]
  wire  _T_42; // @[Decoupled.scala 220:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304998.4]
  wire  _T_43; // @[Decoupled.scala 221:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304999.4]
  wire  _T_44; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305000.4]
  wire  _T_47; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305004.4]
  wire  _T_52; // @[Counter.scala 35:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305013.6]
  wire  _T_54; // @[Counter.scala 35:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305019.6]
  wire  _T_55; // @[Decoupled.scala 232:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305022.4]
  assign _T_35__T_58_addr = value_1;
  assign _T_35__T_58_data = _T_35[_T_35__T_58_addr]; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304992.4]
  assign _T_35__T_50_data = io_enq_bits;
  assign _T_35__T_50_addr = value;
  assign _T_35__T_50_mask = 1'h1;
  assign _T_35__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_40 = value == value_1; // @[Decoupled.scala 219:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304996.4]
  assign _T_41 = _T_39 == 1'h0; // @[Decoupled.scala 220:36:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304997.4]
  assign _T_42 = _T_40 & _T_41; // @[Decoupled.scala 220:33:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304998.4]
  assign _T_43 = _T_40 & _T_39; // @[Decoupled.scala 221:32:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304999.4]
  assign _T_44 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305000.4]
  assign _T_47 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305004.4]
  assign _T_52 = value + 1'h1; // @[Counter.scala 35:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305013.6]
  assign _T_54 = value_1 + 1'h1; // @[Counter.scala 35:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305019.6]
  assign _T_55 = _T_44 != _T_47; // @[Decoupled.scala 232:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305022.4]
  assign io_enq_ready = _T_43 == 1'h0; // @[Decoupled.scala 237:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305029.4]
  assign io_deq_valid = _T_42 == 1'h0; // @[Decoupled.scala 236:16:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305027.4]
  assign io_deq_bits = _T_35__T_58_data; // @[Decoupled.scala 238:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@305031.4]
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
    _T_35[initvar] = _RAND_0[0:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value_1 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_39 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35__T_50_en & _T_35__T_50_mask) begin
      _T_35[_T_35__T_50_addr] <= _T_35__T_50_data; // @[Decoupled.scala 214:24:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304992.4]
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