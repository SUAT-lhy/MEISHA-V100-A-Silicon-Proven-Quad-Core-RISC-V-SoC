module RoccCommandRouter( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304914.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304915.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304916.4]
  output        io_in_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input         io_in_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input  [6:0]  io_in_bits_inst_funct, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input  [4:0]  io_in_bits_inst_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input  [4:0]  io_in_bits_inst_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input         io_in_bits_inst_xd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input         io_in_bits_inst_xs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input         io_in_bits_inst_xs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input  [4:0]  io_in_bits_inst_rd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input  [6:0]  io_in_bits_inst_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input  [63:0] io_in_bits_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input  [63:0] io_in_bits_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input  [1:0]  io_in_bits_status_prv, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  input         io_out_0_ready, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output        io_out_0_valid, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output [6:0]  io_out_0_bits_inst_funct, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output [4:0]  io_out_0_bits_inst_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output [4:0]  io_out_0_bits_inst_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output        io_out_0_bits_inst_xd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output        io_out_0_bits_inst_xs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output        io_out_0_bits_inst_xs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output [4:0]  io_out_0_bits_inst_rd, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output [6:0]  io_out_0_bits_inst_opcode, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output [63:0] io_out_0_bits_rs1, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output [63:0] io_out_0_bits_rs2, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output [1:0]  io_out_0_bits_status_prv, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
  output        io_busy // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304917.4]
);
  wire  cmd_clock; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire  cmd_reset; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire  cmd_io_enq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire  cmd_io_enq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [6:0] cmd_io_enq_bits_inst_funct; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [4:0] cmd_io_enq_bits_inst_rs2; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [4:0] cmd_io_enq_bits_inst_rs1; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire  cmd_io_enq_bits_inst_xd; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire  cmd_io_enq_bits_inst_xs1; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire  cmd_io_enq_bits_inst_xs2; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [4:0] cmd_io_enq_bits_inst_rd; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [6:0] cmd_io_enq_bits_inst_opcode; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [63:0] cmd_io_enq_bits_rs1; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [63:0] cmd_io_enq_bits_rs2; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [1:0] cmd_io_enq_bits_status_prv; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire  cmd_io_deq_ready; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire  cmd_io_deq_valid; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [6:0] cmd_io_deq_bits_inst_funct; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [4:0] cmd_io_deq_bits_inst_rs2; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [4:0] cmd_io_deq_bits_inst_rs1; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire  cmd_io_deq_bits_inst_xd; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire  cmd_io_deq_bits_inst_xs1; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire  cmd_io_deq_bits_inst_xs2; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [4:0] cmd_io_deq_bits_inst_rd; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [6:0] cmd_io_deq_bits_inst_opcode; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [63:0] cmd_io_deq_bits_rs1; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [63:0] cmd_io_deq_bits_rs2; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire [1:0] cmd_io_deq_bits_status_prv; // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
  wire  _T_20; // @[LazyRoCC.scala 333:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304966.4]
  wire  _T_21; // @[LazyRoCC.scala 333:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304967.4]
  wire  _T_22; // @[LazyRoCC.scala 333:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304968.4]
  Queue_23 cmd ( // @[Decoupled.scala 293:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304922.4]
    .clock(cmd_clock),
    .reset(cmd_reset),
    .io_enq_ready(cmd_io_enq_ready),
    .io_enq_valid(cmd_io_enq_valid),
    .io_enq_bits_inst_funct(cmd_io_enq_bits_inst_funct),
    .io_enq_bits_inst_rs2(cmd_io_enq_bits_inst_rs2),
    .io_enq_bits_inst_rs1(cmd_io_enq_bits_inst_rs1),
    .io_enq_bits_inst_xd(cmd_io_enq_bits_inst_xd),
    .io_enq_bits_inst_xs1(cmd_io_enq_bits_inst_xs1),
    .io_enq_bits_inst_xs2(cmd_io_enq_bits_inst_xs2),
    .io_enq_bits_inst_rd(cmd_io_enq_bits_inst_rd),
    .io_enq_bits_inst_opcode(cmd_io_enq_bits_inst_opcode),
    .io_enq_bits_rs1(cmd_io_enq_bits_rs1),
    .io_enq_bits_rs2(cmd_io_enq_bits_rs2),
    .io_enq_bits_status_prv(cmd_io_enq_bits_status_prv),
    .io_deq_ready(cmd_io_deq_ready),
    .io_deq_valid(cmd_io_deq_valid),
    .io_deq_bits_inst_funct(cmd_io_deq_bits_inst_funct),
    .io_deq_bits_inst_rs2(cmd_io_deq_bits_inst_rs2),
    .io_deq_bits_inst_rs1(cmd_io_deq_bits_inst_rs1),
    .io_deq_bits_inst_xd(cmd_io_deq_bits_inst_xd),
    .io_deq_bits_inst_xs1(cmd_io_deq_bits_inst_xs1),
    .io_deq_bits_inst_xs2(cmd_io_deq_bits_inst_xs2),
    .io_deq_bits_inst_rd(cmd_io_deq_bits_inst_rd),
    .io_deq_bits_inst_opcode(cmd_io_deq_bits_inst_opcode),
    .io_deq_bits_rs1(cmd_io_deq_bits_rs1),
    .io_deq_bits_rs2(cmd_io_deq_bits_rs2),
    .io_deq_bits_status_prv(cmd_io_deq_bits_status_prv)
  );
  assign _T_20 = 7'hb == cmd_io_deq_bits_inst_opcode; // @[LazyRoCC.scala 333:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304966.4]
  assign _T_21 = 7'h2b == cmd_io_deq_bits_inst_opcode; // @[LazyRoCC.scala 333:41:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304967.4]
  assign _T_22 = _T_20 | _T_21; // @[LazyRoCC.scala 333:58:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304968.4]
  assign io_in_ready = cmd_io_enq_ready; // @[Decoupled.scala 296:17:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304965.4]
  assign io_out_0_valid = cmd_io_deq_valid & _T_22; // @[LazyRoCC.scala 355:15:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304970.4]
  assign io_out_0_bits_inst_funct = cmd_io_deq_bits_inst_funct; // @[LazyRoCC.scala 356:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304971.4]
  assign io_out_0_bits_inst_rs2 = cmd_io_deq_bits_inst_rs2; // @[LazyRoCC.scala 356:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304971.4]
  assign io_out_0_bits_inst_rs1 = cmd_io_deq_bits_inst_rs1; // @[LazyRoCC.scala 356:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304971.4]
  assign io_out_0_bits_inst_xd = cmd_io_deq_bits_inst_xd; // @[LazyRoCC.scala 356:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304971.4]
  assign io_out_0_bits_inst_xs1 = cmd_io_deq_bits_inst_xs1; // @[LazyRoCC.scala 356:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304971.4]
  assign io_out_0_bits_inst_xs2 = cmd_io_deq_bits_inst_xs2; // @[LazyRoCC.scala 356:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304971.4]
  assign io_out_0_bits_inst_rd = cmd_io_deq_bits_inst_rd; // @[LazyRoCC.scala 356:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304971.4]
  assign io_out_0_bits_inst_opcode = cmd_io_deq_bits_inst_opcode; // @[LazyRoCC.scala 356:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304971.4]
  assign io_out_0_bits_rs1 = cmd_io_deq_bits_rs1; // @[LazyRoCC.scala 356:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304971.4]
  assign io_out_0_bits_rs2 = cmd_io_deq_bits_rs2; // @[LazyRoCC.scala 356:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304971.4]
  assign io_out_0_bits_status_prv = cmd_io_deq_bits_status_prv; // @[LazyRoCC.scala 356:14:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304971.4]
  assign io_busy = cmd_io_deq_valid; // @[LazyRoCC.scala 360:11:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304974.4]
  assign cmd_clock = clock; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304923.4]
  assign cmd_reset = reset; // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304924.4]
  assign cmd_io_enq_valid = io_in_valid; // @[Decoupled.scala 294:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304925.4]
  assign cmd_io_enq_bits_inst_funct = io_in_bits_inst_funct; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304964.4]
  assign cmd_io_enq_bits_inst_rs2 = io_in_bits_inst_rs2; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304963.4]
  assign cmd_io_enq_bits_inst_rs1 = io_in_bits_inst_rs1; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304962.4]
  assign cmd_io_enq_bits_inst_xd = io_in_bits_inst_xd; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304961.4]
  assign cmd_io_enq_bits_inst_xs1 = io_in_bits_inst_xs1; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304960.4]
  assign cmd_io_enq_bits_inst_xs2 = io_in_bits_inst_xs2; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304959.4]
  assign cmd_io_enq_bits_inst_rd = io_in_bits_inst_rd; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304958.4]
  assign cmd_io_enq_bits_inst_opcode = io_in_bits_inst_opcode; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304957.4]
  assign cmd_io_enq_bits_rs1 = io_in_bits_rs1; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304956.4]
  assign cmd_io_enq_bits_rs2 = io_in_bits_rs2; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304955.4]
  assign cmd_io_enq_bits_status_prv = io_in_bits_status_prv; // @[Decoupled.scala 295:21:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304951.4]
  assign cmd_io_deq_ready = io_out_0_ready & _T_22; // @[LazyRoCC.scala 359:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304973.4]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: Custom opcode matched for more than one accelerator\n    at LazyRoCC.scala:362 assert(PopCount(cmdReadys) <= UInt(1),\n"); // @[LazyRoCC.scala 362:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304980.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
          $fatal; // @[LazyRoCC.scala 362:9:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@304981.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule