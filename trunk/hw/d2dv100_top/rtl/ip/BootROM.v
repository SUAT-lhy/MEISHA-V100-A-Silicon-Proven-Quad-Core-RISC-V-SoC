// This file created by ../../rocket-chip/scripts/vlsi_rom_gen

module BootROM(
  input clock,
  input oe,
  input me,
  input [10:0] address,
  output [31:0] q
);

`ifndef VENDOR_RAM_EN

  reg [31:0] out;
  reg [31:0] rom [0:2047];


  // 1024 is the maximum length of $readmemh filename supported by Cadence Incisive
  reg [1024 * 8 - 1:0] path;

  integer i;
  initial begin
`ifdef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    for (i = 0; i < 2048; i = i + 1) begin
      rom[i] = {1{$random}};
    end
  `endif
`endif
    if ($value$plusargs("maskromhex=%s", path)) begin
        path = "../../sw/sdboot/sdboot.hex";
        $readmemh(path, rom);
    end
    
  end


  always @(posedge clock) begin
    if (me) begin
      out <= rom[address];
    end
  end

  assign q = oe ? out : 32'bZ;


  `elsif USE_NO_BUS_IP

SPLB40_2048X32BM1A_top U_ROM (
      .CLK(clock),
      .CS((me&oe)),
      .Addr(address[10:0]),
      .DVSE(1'b0),
      .DVS(4'hf),
      .Data(q)
  );
  `else

SPLB40_2048X32BM1b1A U_ROM (
      .CK(clock),
      .CS((me&oe)),
      .A(address[10:0]),
      .DVSE(1'b0),
      .DVS(4'h0),
      .DO(q)
  );

  // rom_2048x32m16sr_svt U_B00TROM(
  //           .A(address[10:0]),
  //           .CEB(~(me&oe)),
  //           .CLK(clock),
  //           .SD(1'b0),  //( 1'b0), shutdown
  //           .PUDELAY(),
  //           .RTSEL(2'b01), 
  //           .PTSEL(2'b01), 
  //           .TRB(2'b01), 
  //           .TM(1'b0),
  //           .Q(q)
  // );

  `endif 
  

endmodule
