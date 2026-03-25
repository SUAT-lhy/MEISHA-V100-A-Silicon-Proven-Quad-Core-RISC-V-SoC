`timescale 1ns/1ps
module test_top ();
reg     refclk;
reg     pd;
reg[4:0]    prediv =  5'h1;
reg[11:0]   fbdiv  = 12'ha6;
reg[23:0]   frac   = 24'haaaaab;

reg[ 3:0]   postdiv0_0 = 4'h4;
reg[ 3:0]   postdiv1_0 = 4'd0;

reg[ 3:0]   postdiv0_1 = 4'h7;
reg[ 3:0]   postdiv1_1 = 4'h0;

reg[ 3:0]   postdiv0_2 = 4'd2;
reg[ 3:0]   postdiv1_2 = 4'd2;

reg[ 3:0]   postdiv0_3 = 4'd1;
reg[ 3:0]   postdiv1_3 = 4'd1;


initial
  begin
    pd = 1'b1; 
    repeat (500) @ (posedge refclk); #1;
    pd = 1'b0;

    // prediv =  5'h1f;
    // fbdiv  = 12'h014;
    // frac   = 24'h07_1000;
    repeat(4000) @ (refclk); #1;
    pd = 1'b1;
    repeat(4000) @ (refclk); #1;
    pd = 1'b0;
    //prediv = 6'b00_z000;
    //prediv = 6'bx0_0001;
    //fbdiv = 12'b0z00_0110_0100;
    //fbdiv = 12'b0000_011x_0100;
    //frac = 24'b1x00_0000_0000_0000_0000_0000;
    //frac = 24'b1000_0000_0000_0000_0000_00z0;
    repeat(4000) @ (refclk); #1;
    $display("test finish !!!");
    $finish;
  end

// generate refclk
parameter  REFCLK_FREQ = 24.000;// MHz
real  REFCLK_PERIOD_HALF = (1000.0/REFCLK_FREQ/2.0);

always
  begin: gen_ref_clk
    refclk = 1'b0; #REFCLK_PERIOD_HALF;
    refclk = 1'b1; #REFCLK_PERIOD_HALF;
  end


INNO_FNPLL_TOP #(
    // .REFCLK_FREQ                        (REFCLK_FREQ)
    ) u0 (
    //// Inputs
    .refclk                             (refclk),
    .pd                                 (pd),
    .prediv                             (prediv),
    .fbdiv                              (fbdiv),
    .postdiv0_0                         (postdiv0_0),
    .postdiv1_0                         (postdiv1_0),
    .postdiv0_1                         (postdiv0_1),
    .postdiv1_1                         (postdiv1_1),
    .postdiv0_2                         (postdiv0_2),
    .postdiv1_2                         (postdiv1_2),
    .frac                               (frac),
    .dacpd                              (1'b0),
    .dsmpd                              (1'b0),
    .testen                             (1'b1),
    .testsel                            (2'b0)
    );


// ==================== wave save  ========================= //
initial
  begin
    $fsdbAutoSwitchDumpfile(1000,"sim.fsdb",20,"fsdb.log");
    $fsdbDumpvars();
    $fsdbDumpflush();
  end


endmodule
