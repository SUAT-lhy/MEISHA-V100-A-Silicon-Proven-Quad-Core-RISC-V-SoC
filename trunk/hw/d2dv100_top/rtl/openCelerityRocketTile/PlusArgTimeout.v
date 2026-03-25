module PlusArgTimeout( // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312099.2]
  input         clock, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312100.4]
  input         reset, // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312101.4]
  input  [31:0] io_count // @[:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312102.4]
);
  wire [31:0] plusarg_reader_out; // @[PlusArg.scala 25:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312107.4]
  wire  _T_5; // @[PlusArg.scala 27:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312109.4]
  wire  _T_6; // @[PlusArg.scala 28:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312111.6]
  wire  _T_8; // @[PlusArg.scala 28:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312113.6]
  wire  _T_9; // @[PlusArg.scala 28:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312114.6]
  plusarg_reader #(.FORMAT("max_core_cycles=%d"), .DEFAULT(0)) plusarg_reader ( // @[PlusArg.scala 25:19:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312107.4]
    .out(plusarg_reader_out)
  );
  assign _T_5 = plusarg_reader_out > 32'h0; // @[PlusArg.scala 27:13:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312109.4]
  assign _T_6 = io_count < plusarg_reader_out; // @[PlusArg.scala 28:22:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312111.6]
  assign _T_8 = _T_6 | reset; // @[PlusArg.scala 28:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312113.6]
  assign _T_9 = _T_8 == 1'h0; // @[PlusArg.scala 28:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312114.6]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_5 & _T_9) begin
          $fwrite(32'h80000002,"Assertion failed: Timeout exceeded: Kill the emulation after INT rdtime cycles. Off if 0.\n    at PlusArg.scala:28 assert (io.count < max, s\"Timeout exceeded: $docstring\")\n"); // @[PlusArg.scala 28:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312116.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_5 & _T_9) begin
          $fatal; // @[PlusArg.scala 28:12:sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz.fir@312117.8]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule