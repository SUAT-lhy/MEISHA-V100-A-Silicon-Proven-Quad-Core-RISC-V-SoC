


module tb;
    // dep packages
    import uvm_pkg::*;
  // import dv_utils_pkg::*;
  // import tl_agent_pkg::*;
    // import axi_agent_pkg::*;
    // import axi_env_pkg::*;
    import axi_test_pkg::*;

    // ******************** Global Parameters ******************
    // Please change the A_WIDTH & D_WIDTH with the respective width
    // of address and data bus
  // macro includes
    `include "uvm_macros.svh"

    `include "dut.sv"
    always #5 ACLK = ~ACLK;

    initial begin
      ARESETn = 0;
      ACLK = 0;
      #20ns ARESETn = 1;
    end

    wire clk, rst_n;

    clk_rst_if clk_rst_if(.clk(clk), .rst_n(rst_n));


    initial begin
        clk_rst_if.set_active();
        uvm_config_db#(virtual clk_rst_if)::set(null, "*", "clk_rst_vif", clk_rst_if);
        $timeformat(-12, 0, " ps", 12);
        run_test();
    end


    
endmodule




