`timescale 1ns/1ps

module tb ();


import tlul_test_pkg::*;
import uvm_pkg::*;
import spi0_test_pkg::*;
//import mem_bkdr_util_pkg::mem_bkdr_util;

reg cpu_clock;
reg sys_clock;
wire sys_clock_wire;
wire jtag_jtag_TCK;
wire jtag_jtag_TMS;
wire jtag_jtag_TDI;
wire jtag_jtag_TDO;
wire uart_txd;
wire uart_rxd;
wire uart_rtsn;
wire sdio_sdio_clk;
wire sdio_sdio_cmd;
wire sdio_sdio_dat_0;
wire sdio_sdio_dat_1;
wire sdio_sdio_dat_2;
wire sdio_sdio_dat_3;
wire   led_ref_clk;
wire pwr_reset_n;
wire hard_reset_n;

  
  wire spi_master_clk;
  wire [3:0] spi_master_csn;
  wire [1:0] spi_master_mode;
  wire [3:0] spi_master_sdo;
  wire [3:0] spi_master_sdi;
  wire [3:0] spi_master_data;

  
  wire spi_clk;
  wire [3:0] spi_csn;
  wire [1:0] spi_mode;
  wire [3:0] spi_sdo;
  wire [3:0] spi_sdi;
  wire [3:0] spi_data;

  wire DEBUG_MODE_SEL;
  wire DEBUG_MODE_CONFIG;
  reg ddr_external_loopback_en;
  wire [15:0] DDR3_DQS;

  wire b2c_clk_delay;
  wire b2c_rst_delay;
  wire b2c_send_delay;
  wire [7:0] b2c_data_delay;
  wire c2b_clk_delay;
  wire c2b_rst_delay;
  wire c2b_send_delay;
  wire [7:0] c2b_data_delay;

MEISHAV100_TOP  u_MEISHAV100_TOP
(

    .DDR3_DQS(DDR3_DQS),

    .SYS_CLOCK_P(sys_clock_wire),
    //.SYS_CLOCK_N(),
    .DEBUG_SYSTEMJTAG_JTAG_TCK(jtag_jtag_TCK),
    .DEBUG_SYSTEMJTAG_JTAG_TMS(jtag_jtag_TMS),
    .DEBUG_SYSTEMJTAG_JTAG_TDI(jtag_jtag_TDI),
    .DEBUG_SYSTEMJTAG_JTAG_TDO(jtag_jtag_TDO),
    .AUTO_UART_SOURCE_OUT_TXD(uart_txd),
    .AUTO_UART_SOURCE_OUT_RXD(uart_rxd),
    
    .SPI_SCLK(spi_clk),
    .SPI_CS(spi_csn[0]),
    `ifndef IO_DEPRECIATE_UNSUPPORT
    .SPI_DATA(spi_data),
    `else
    .SPI_SDI3(spi_sdi[3]),
    .SPI_SDI2(spi_sdi[2]),
    .SPI_SDI1(spi_sdi[1]),
    .SPI_SDI0(spi_sdi[0]),
    .SPI_SDO3(spi_sdo[3]),
    .SPI_SDO2(spi_sdo[2]),
    .SPI_SDO1(spi_sdo[1]),
    .SPI_SDO0(spi_sdo[0]),
    `endif

    .DDR_IO_B2C_CLK(c2b_clk_delay),
    .DDR_IO_B2C_RST(c2b_rst_delay),
    .DDR_IO_B2C_SEND(c2b_send_delay),
    .DDR_IO_B2C_DATA(c2b_data_delay),
    .SPI_MASTER_CLK(spi_master_clk),
    .SPI_MASTER_CSN(spi_master_csn[0]),
    .SPI_MASTER_DATA(spi_master_data),
    // .SPI_MASTER_SDI(spi_master_sdi),
    // .SPI_MASTER_SDO(spi_master_sdo),

    .AUTO_SPI_SOURCE_OUT_SCK(sdio_sdio_clk),
    .AUTO_SPI_SOURCE_OUT_DQ_0_O(sdio_sdio_dat_3),
    .AUTO_SPI_SOURCE_OUT_DQ_1_I(sdio_sdio_dat_0),
    // .sdio_sdio_dat_1(sdio_sdio_dat_1),
    // .sdio_sdio_dat_2(sdio_sdio_dat_2),
    .AUTO_SPI_SOURCE_OUT_CS_0(sdio_sdio_cmd),
    .DEBUG_MODE_SEL(DEBUG_MODE_SEL),
    .DEBUG_MODE_CONFIG(DEBUG_MODE_CONFIG),
    .HARD_RESET_N(hard_reset_n),
    .PWR_RESET_N(pwr_reset_n)
);


  pulldown(spi_master_data[3]);
  pulldown(spi_master_data[2]);
  pulldown(spi_master_data[1]);
  pulldown(spi_master_data[0]);

  wire fpga_ddr_chiplink_clock;
  wire fpga_ddr_chiplink_reset_n;
  int fpga_pre_reset_time;
  int fpga_post_reset_time;
  
  clk_rst_if fpga_clk_rst_if(.clk(fpga_ddr_chiplink_clock), .rst_n(fpga_ddr_chiplink_reset_n));

  initial begin 
    fpga_clk_rst_if.set_active();
    fpga_pre_reset_time = $urandom_range(100, 20000);
    #(fpga_pre_reset_time*1ns);
    fpga_clk_rst_if.set_freq_mhz($urandom_range(20, 300));
    fpga_clk_rst_if.apply_reset();
  end

  initial begin
    // force fpga_ddr_chiplink_reset_n = 1'bx;
    // fpga_pre_reset_time = $urandom_range(0, 10000);
    // fpga_post_reset_time = $urandom_range(0, 10000);
    // #(fpga_pre_reset_time*1ns);
    // force fpga_ddr_chiplink_reset_n = 1'b0;
    // #(fpga_post_reset_time*1ns);
    // force fpga_ddr_chiplink_reset_n = 1'b1;
  end

  wire [15:0] in_sdram_write_data;
  wire [15:0] out_sdram_read_data;
  wire [15:0] out_sdram_read_data_unused_msb;

  
  // pulldown(DDR3_DQS[0]);
  // pulldown(DDR3_DQS[1]);
  // pulldown(DDR3_DQS[2]);
  // pulldown(DDR3_DQS[3]);
  // pulldown(DDR3_DQS[4]);
  // pulldown(DDR3_DQS[5]);
  // pulldown(DDR3_DQS[6]);
  // pulldown(DDR3_DQS[7]);
  // pulldown(DDR3_DQS[8]);
  // pulldown(DDR3_DQS[9]);
  // pulldown(DDR3_DQS[10]);
  // pulldown(DDR3_DQS[11]);
  // pulldown(DDR3_DQS[12]);
  // pulldown(DDR3_DQS[13]);
  // pulldown(DDR3_DQS[14]);
  // pulldown(DDR3_DQS[15]);

wire [15:0] ddr3_dq_delay;
wire [12:0] ddr3_addr_delay;
wire [1:0] ddr3_ba_delay;
wire ddr3_ck_p_delay;
wire ddr3_cke_delay;
wire ddr3_ras_n_delay;
wire ddr3_cas_n_delay;
wire ddr3_we_n_delay;
wire [1:0] ddr3_dm_delay;

// 100mhz
`define SETUP_HOLD_TIME #0ns
assign `SETUP_HOLD_TIME ddr3_dq_delay = u_MEISHAV100_TOP.DDR3_DQS;
assign `SETUP_HOLD_TIME ddr3_addr_delay = u_MEISHAV100_TOP.DDR3_ADDR;
assign `SETUP_HOLD_TIME ddr3_ba_delay = u_MEISHAV100_TOP.DDR3_BA;
assign ddr3_ck_p_delay = u_MEISHAV100_TOP.DDR3_CK_P;
assign `SETUP_HOLD_TIME ddr3_cke_delay = u_MEISHAV100_TOP.DDR3_CKE;
assign `SETUP_HOLD_TIME ddr3_ras_n_delay = u_MEISHAV100_TOP.DDR3_RAS_N;
assign `SETUP_HOLD_TIME ddr3_cas_n_delay = u_MEISHAV100_TOP.DDR3_CAS_N;
assign `SETUP_HOLD_TIME ddr3_we_n_delay = u_MEISHAV100_TOP.DDR3_WE_N;
assign `SETUP_HOLD_TIME ddr3_dm_delay = u_MEISHAV100_TOP.DDR3_DM;

// 在Testbench中实例化
sdram_monitor sdram_monitor_if (ddr3_ck_p_delay);

assign sdram_monitor_if.sdram_ras_0 = ddr3_ras_n_delay;            // 行地址选通
assign sdram_monitor_if.sdram_cas_0 = ddr3_cas_n_delay;            // 列地址选通
assign  sdram_monitor_if.sdram_we_0 = ddr3_we_n_delay;             // 写使能
assign  sdram_monitor_if.sdram_ba_0 = ddr3_ba_delay;             // Bank地址
assign  sdram_monitor_if.sdram_addr_0 = ddr3_addr_delay;           // 地址总线
assign  sdram_monitor_if.sdram_data = ddr3_dq_delay;             // 双向数据总线（图中sdram_data_output_o/input_i合并）
assign  sdram_monitor_if.sdram_dqm_0 = ddr3_dm_delay;            // 数据掩码

`ifdef SDRAM_MODEL_DEPRECIATE
  assign `SETUP_HOLD_TIME DDR3_DQS = u_MEISHAV100_TOP.io_port_ddr3_dqs_o_en?16'hz:out_sdram_read_data ;

  sdram_model u0_sdram_model (
    // SDRAM MODEL INTERFACE
    .in_CLK(ddr3_ck_p_delay),
    .in_CS(1'b0),              // CHIP SELECT
    .in_write_en(ddr3_we_n_delay),
    .in_CAS(ddr3_ras_n_delay),             //COLUMN ADRESS STROBE
    .in_RAS(ddr3_cas_n_delay),             //ROW ADRESS STROBE
    .in_bank_select(ddr3_ba_delay),     // BANK SELECTION BITS
    .in_sdram_addr({1'b0, ddr3_addr_delay}),      
    .in_sdram_write_data({16'h0, ddr3_dq_delay[15:0]}),

    .out_sdram_read_data({out_sdram_read_data_unused_msb[15:0], out_sdram_read_data[15:0]})
    // SDRAM MODEL INTERFACE END
  );

`else

  mt48lc16m16a2 u_mt48lc16m16a2 (
    .Dq(u_MEISHAV100_TOP.DDR3_DQS),   // direct connect to DQS for avoid x state
    .Addr(ddr3_addr_delay), 
    .Ba(ddr3_ba_delay), 
    .Clk(ddr3_ck_p_delay), 
    .Cke(ddr3_cke_delay), 
    .Cs_n(1'b0), 
    .Ras_n(ddr3_ras_n_delay), 
    .Cas_n(ddr3_cas_n_delay), 
    .We_n(ddr3_we_n_delay), 
    .Dqm(ddr3_dm_delay)
  );


`endif




  CHIPLINK_PREFIX_ChipLinkMaster u_fpga_ddr_chiplink (
    .clock(fpga_ddr_chiplink_clock),
    .reset(~fpga_ddr_chiplink_reset_n),
    .mig_input_takeover_en(1'b0),
  `ifdef CHIPLINK_CONNECT_DIRECT_TL
    .widget_auto_in_a_ready(),
    .widget_auto_in_a_valid(1'b0),
    .widget_auto_in_a_bits_opcode(3'b0),
    //.widget_auto_in_a_bits_param('b0),
    .widget_auto_in_a_bits_size(3'b0),
    .widget_auto_in_a_bits_source(4'b0),
    .widget_auto_in_a_bits_address(32'b0),
    .widget_auto_in_a_bits_mask(8'b0),
    .widget_auto_in_a_bits_data(64'b0),
    //.widget_auto_in_a_bits_corrupt('b0),
    .widget_auto_in_d_ready(1'b0),
    .widget_auto_in_d_valid(),
    .widget_auto_in_d_bits_opcode(),
    .widget_auto_in_d_bits_size(),
    .widget_auto_in_d_bits_source(),
    .widget_auto_in_d_bits_denied(),
    .widget_auto_in_d_bits_data(),
    .widget_auto_in_d_bits_corrupt(),
  `else
    .slave_0_awready(),
    .slave_0_awvalid(1'b0),
    .slave_0_awid(5'b0),
    .slave_0_awaddr(32'b0),
    .slave_0_awlen(8'b0),
    .slave_0_awsize(3'b0),
    .slave_0_awburst(2'b0),
    .slave_0_wready(),
    .slave_0_wvalid(1'b0),
    .slave_0_wdata(64'b0),
    .slave_0_wstrb(8'b0),
    .slave_0_wlast(1'b0),
    .slave_0_bready(1'b0),
    .slave_0_bvalid(),
    .slave_0_bid(),
    .slave_0_bresp(),
    .slave_0_arready(),
    .slave_0_arvalid(1'b0),
    .slave_0_arid(5'b0),
    .slave_0_araddr(32'b0),
    .slave_0_arlen(8'b0),
    .slave_0_arsize(3'b0),
    .slave_0_arburst(2'b0),
    .slave_0_rready(1'b0),
    .slave_0_rvalid(),
    .slave_0_rid(),
    .slave_0_rdata(),
    .slave_0_rresp(),
    .slave_0_rlast(),
  `endif
    .master_mem_0_awready(1'b0),
    .master_mem_0_awvalid(),
    .master_mem_0_awid(),
    .master_mem_0_awaddr(),
    .master_mem_0_awlen(),
    .master_mem_0_awsize(),
    .master_mem_0_awburst(),
    .master_mem_0_wready(1'b0),
    .master_mem_0_wvalid(),
    .master_mem_0_wdata(),
    .master_mem_0_wstrb(),
    .master_mem_0_wlast(),
    .master_mem_0_bready(),
    .master_mem_0_bvalid(1'b0),
    .master_mem_0_bid(4'b0),
    .master_mem_0_bresp(2'b0),
    .master_mem_0_arready(1'b0),
    .master_mem_0_arvalid(),
    .master_mem_0_arid(),
    .master_mem_0_araddr(),
    .master_mem_0_arlen(),
    .master_mem_0_arsize(),
    .master_mem_0_arburst(),
    .master_mem_0_rready(),
    .master_mem_0_rvalid(1'b0),
    .master_mem_0_rid(4'b0),
    .master_mem_0_rdata(64'b0),
    .master_mem_0_rresp(2'b0),
    .master_mem_0_rlast(1'b0),
    .fpga_io_c2b_clk(),
    .fpga_io_c2b_rst(),
    .fpga_io_c2b_send(),
    .fpga_io_c2b_data(),
    .fpga_io_b2c_clk(b2c_clk_delay),
    .fpga_io_b2c_rst(b2c_rst_delay),
    .fpga_io_b2c_send(b2c_send_delay),
    .fpga_io_b2c_data(b2c_data_delay)
  );

  // for postsim clk conflict sample, for ddr 100mhz
  assign b2c_clk_delay = ddr_external_loopback_en ? 1'b0 : u_MEISHAV100_TOP.DDR_IO_C2B_CLK;
  assign #1ns b2c_rst_delay = ddr_external_loopback_en ? 1'b0 : u_MEISHAV100_TOP.DDR_IO_C2B_RST;
  assign #1ns b2c_send_delay = ddr_external_loopback_en ? 1'b0 : u_MEISHAV100_TOP.DDR_IO_C2B_SEND;
  assign #1ns b2c_data_delay = ddr_external_loopback_en ? 1'b0 : u_MEISHAV100_TOP.DDR_IO_C2B_DATA;

  assign c2b_clk_delay = ddr_external_loopback_en ? u_MEISHAV100_TOP.DDR_IO_C2B_CLK : u_fpga_ddr_chiplink.fpga_io_c2b_clk;
  assign #1ns c2b_rst_delay = ddr_external_loopback_en ? u_MEISHAV100_TOP.DDR_IO_C2B_RST : u_fpga_ddr_chiplink.fpga_io_c2b_rst;
  assign #1ns c2b_send_delay = ddr_external_loopback_en ? u_MEISHAV100_TOP.DDR_IO_C2B_SEND : u_fpga_ddr_chiplink.fpga_io_c2b_send;
  assign #1ns c2b_data_delay = ddr_external_loopback_en ? u_MEISHAV100_TOP.DDR_IO_C2B_DATA : u_fpga_ddr_chiplink.fpga_io_c2b_data;

  initial begin
      //force u_MEISHAV100_TOP.topDesign.topMod.sbus.control_bus.coupler_to_slave_named_MaskROM.fragmenter.Repeater.io_repeat = 0;
      //force tb.u_MEISHAV100_TOP.topDesign.topMod.clint.auto_int_out_0_1 = 0;
      //force tb.u_MEISHAV100_TOP.topDesign.topMod.clint.auto_int_out_1_1 = 0;
      //force tb.u_MEISHAV100_TOP.topDesign.topMod.clint.auto_int_out_2_1 = 0;
      //force tb.u_MEISHAV100_TOP.topDesign.topMod.clint.auto_int_out_3_1 = 0;
      //force tb.u_MEISHAV100_TOP.sdio_sdio_dat_0 = tb.u_MEISHAV100_TOP.u_sdspi_model.spiDataOut;  // need use this format avoid x state
  end

  initial begin
      #1ns;
      // force pcie_pci_exp_rxp = pcie_pci_exp_txp;
      // force pcie_pci_exp_rxn = pcie_pci_exp_txn;
      // force pcie_REFCLK_rxp = sys_clock;
      // force pcie_REFCLK_rxn = ~sys_clock;
      force led_ref_clk = $urandom_range(0, 1);
      
      repeat(100) @(posedge tb.u_MEISHAV100_TOP.topDesign.wrangler.in_ref_always_on_clk);
      
      // force tb.u_MEISHAV100_TOP.topDesign.wrangler.debounce_io_q[12:0] = 13'h1370; // need less than 1388
      repeat(2) @(posedge tb.u_MEISHAV100_TOP.topDesign.wrangler.in_ref_always_on_clk);
      // release tb.u_MEISHAV100_TOP.topDesign.wrangler.debounce_io_q;
  end

    assign uart_rxd = 1'b1;

    initial begin
        sys_clock = 1'b0;
        cpu_clock = 1'b1;
        force u_MEISHAV100_TOP.SYS_CLOCK_P = sys_clock;
    end
    initial begin
        force hard_reset_n = 1'bx;
        #40ns;
        force hard_reset_n = 1'b0;
        #40ns;
        // speed rst
        force hard_reset_n = 1'b1;
        #200000ns;
    end
    // // dump vcd 
    // string testcase_name;

    // initial begin
    //     if(!$value$plusargs("UVM_TESTNAME=%0s", testcase_name)) begin
    //       testcase_name = "default_case_name";
    //       //`uvm_error("tb", $sformatf("check UVM_TESTNAME is defined"))
    //     end
    //     testcase_name = "waves";
    //     $dumpfile($sformatf("%0s.vcd", testcase_name));
    //     $dumpvars(0, tb);
    // end

    initial begin
        force DEBUG_MODE_CONFIG = 1'bx;
        force pwr_reset_n = 1'bx;
        force DEBUG_MODE_SEL = 1'bx;
        #200ns;
        force DEBUG_MODE_SEL = 1'b0;
        force DEBUG_MODE_CONFIG = $urandom_range(0, 1);
        force DEBUG_MODE_CONFIG = 0;
        force pwr_reset_n = 0;
        #200ns;
        force pwr_reset_n = 1;
        #1000ns;
        // force u_MEISHAV100_TOP.tile_clock = ~cpu_clock;
        // force u_MEISHAV100_TOP.tile_1_clock = ~cpu_clock;
        // force u_MEISHAV100_TOP.tile_2_clock = ~cpu_clock;
        // // force u_MEISHAV100_TOP.tile_3_clock = ~cpu_clock;
        // force u_MEISHAV100_TOP.topDesign.topMod.tile.frontend_io_reset_vector = 32'h8000_0000;
        // force u_MEISHAV100_TOP.topDesign.topMod.tile_1.frontend_io_reset_vector = 32'h8000_0000;
        // force u_MEISHAV100_TOP.topDesign.topMod.tile_2.frontend_io_reset_vector = 32'h8000_0000;
        // force u_MEISHAV100_TOP.topDesign.topMod.tile_3.frontend_io_reset_vector = 32'h8000_0000;

    end



    initial begin : pcie_d2d_connect
    `ifdef USE_C2C_FOR_PCIE
        force u_MEISHAV100_TOP.io_b2c_clk = u_MEISHAV100_TOP.io_c2b_clk;
        force u_MEISHAV100_TOP.io_b2c_rst = u_MEISHAV100_TOP.io_c2b_rst;
        force u_MEISHAV100_TOP.io_b2c_send = u_MEISHAV100_TOP.io_c2b_send;
        force u_MEISHAV100_TOP.io_b2c_data = u_MEISHAV100_TOP.io_c2b_data;
    `else
        // force u_MEISHAV100_TOP.spi_sclk = 1'b0;
        // force u_MEISHAV100_TOP.spi_cs = 1'b0;
        // force u_MEISHAV100_TOP.spi_mode = 1'b0;
        // force u_MEISHAV100_TOP.spi_sdi0 = 1'b0;
        // force u_MEISHAV100_TOP.spi_sdi1 = 1'b0;
        // force u_MEISHAV100_TOP.spi_sdi2 = 1'b0;
        // force u_MEISHAV100_TOP.spi_sdi3 = 1'b0;
        // force u_MEISHAV100_TOP.spi_sdo0 = 1'b0;
        // force u_MEISHAV100_TOP.spi_sdo1 = 1'b0;
        // force u_MEISHAV100_TOP.spi_sdo2 = 1'b0;
        // force u_MEISHAV100_TOP.spi_sdo3 = 1'b0;
    `endif
    end

    initial begin : ddr_connect
        #1000ns;
        if(ddr_external_loopback_en) begin
          $display("ddr_external_loopback_en : 1");
        end
        else begin
          $display("ddr_external_loopback_en : 0");
        end
    end

        
    initial begin
        ddr_external_loopback_en = 1'b1;
        // force spi_master_sdi = 4'b0;        
    end

    initial begin
        string boot_rom_hex_file;
	      string out_sram_hex_file;
        `ifndef POSTSIM_EN
        force u_MEISHAV100_TOP.topDesign.topMod.uart_0.txm.print_uart = 0;
        `endif
        #1ns; // wait randomize complete
        if ($value$plusargs("BOOT_ROM_HEX_FILE=%s",boot_rom_hex_file)) begin
            $display("boot_rom_hex_file = %s\n",boot_rom_hex_file);
            // bootrom max depth: 'h200_0000 * 4byte - exact: 'h1_0000 * 4byte
            $readmemh(boot_rom_hex_file, `ROM_DUT_MEM_HIER);
            // for(rom_depth_idx = 0;rom_depth_idx <= `BOOTROM_DEPTH-1;rom_depth_idx++)
            // begin 
            //     uvm_hdl_force($sformatf("%0s.rom[%0d]", `DV_STRINGIFY(`BOOTROM_HIR), rom_depth_idx), ) = rom_content[rom_depth_idx]);		
            // end
        end
        
    end

    //always #1ns cpu_clock <= ~cpu_clock;

    always #12.5ns sys_clock <= ~sys_clock;  // 1GHz  40M
    
    wire clk, rst_n;

    clk_rst_if clk_rst_if(.clk(clk), .rst_n(rst_n));


spi_if2 spi_if2(.rst_n(~pwr_reset_n));

reg  MOSI, SS_n, spi_sd_clk, spi_rst_n;
wire MISO;

// SPI_Wrapper spi_wrapper(
//     .MOSI(MOSI),
//     .SS_n(SS_n), 
//     .clk(spi_clk), 
//     .rst_n(spi_rst_n),
//     .MISO(MISO),
//     .MISO_valid(spi_if2.miso_valid)
// );

sd_spi_model u_sd_spi_model (
    .rstn(spi_rst_n),
    .ncs(SS_n),
    .sclk(spi_sd_clk),
    .mosi(MOSI),
    .miso(MISO)
);

// linux_soft_base_test
    assign #1ns MOSI      = sdio_sdio_dat_3;
    assign #1ns SS_n      = sdio_sdio_cmd;
    assign  spi_sd_clk   = sdio_sdio_clk;
    assign #1ns spi_rst_n = pwr_reset_n;
    assign #1ns sdio_sdio_dat_0  = MISO;

// spi_base_test
spi_if spi_if(.rst_n(~pwr_reset_n));
    assign spi_if.sclk = sdio_sdio_clk;
    assign #1ns spi_if.cs = sdio_sdio_cmd;
    assign #1ns spi_if.mosi = sdio_sdio_dat_3;
    assign #1ns spi_if.miso = sdio_sdio_dat_0;

// uart_base_test
uart_if uart_if();
    assign #1ns  uart_if.uart_tx = uart_txd;
    assign #1ns  uart_if.uart_rx = uart_rxd;

// jtag_base_test
jtag_if jtag_if();
  assign jtag_jtag_TCK = jtag_if.tck;
  assign #1ns jtag_jtag_TMS = jtag_if.tms;
  assign #1ns jtag_jtag_TDI = jtag_if.tdi;
  assign #1ns jtag_if.tdo = jtag_jtag_TDO;
  assign #1ns jtag_if.trst_n = ~u_MEISHAV100_TOP.topDesign.topMod.dtm.io_jtag_reset;

  
  // wire spi_clk;
  // wire [3:0] spi_csn;
  // wire [1:0] spi_mode;
  // wire [3:0] spi_sdo;
  // wire [3:0] spi_sdi;
  // wire [3:0] spi_data;

// spi-slave base_test
spi_slave_if spi_slave_if();

  `ifndef USE_C2C_FOR_PCIE
    assign spi_clk = spi_slave_if.spi_clk;
    assign #1ns spi_csn[0] = spi_slave_if.spi_csn;
    assign #1ns spi_slave_if.padmode = u_MEISHAV100_TOP.topDesign.topMod.d2d_sub.U_QSPI_SPI_WRAPPER.u_axi_spi_slave.spi_mode;
    `ifndef IO_DEPRECIATE_UNSUPPORT
    assign #1ns spi_data[3] = u_MEISHAV100_TOP.spi_sdo_oen[3] ? spi_slave_if.spi_sdo[3] : 1'bz;
    assign #1ns spi_data[2] = u_MEISHAV100_TOP.spi_sdo_oen[2] ? spi_slave_if.spi_sdo[2] : 1'bz;
    assign #1ns spi_data[1] = u_MEISHAV100_TOP.spi_sdo_oen[1] ? spi_slave_if.spi_sdo[1] : 1'bz;
    assign #1ns spi_data[0] = u_MEISHAV100_TOP.spi_sdo_oen[0] ? spi_slave_if.spi_sdo[0] : 1'bz;
    
    assign #1ns spi_slave_if.spi_sdi[0] = spi_data[0];
    assign #1ns spi_slave_if.spi_sdi[1] = spi_data[1];
    assign #1ns spi_slave_if.spi_sdi[2] = spi_data[2];
    assign #1ns spi_slave_if.spi_sdi[3] = spi_data[3];

    `else
    assign #1ns spi_sdi[3] = spi_slave_if.spi_sdo[3];
    assign #1ns spi_sdi[2] = spi_slave_if.spi_sdo[2];
    assign #1ns spi_sdi[1] = spi_slave_if.spi_sdo[1];
    assign #1ns spi_sdi[0] = spi_slave_if.spi_sdo[0];
    
    assign #1ns spi_slave_if.spi_sdi[0] = spi_sdo[0];
    assign #1ns spi_slave_if.spi_sdi[1] = spi_sdo[1];
    assign #1ns spi_slave_if.spi_sdi[2] = spi_sdo[2];
    assign #1ns spi_slave_if.spi_sdi[3] = spi_sdo[3];
    `endif

  `endif 


initial begin
  spi_slave_if.spi_csn = 1'b1;
  spi_slave_if.spi_clk = 1'b0;
  spi_slave_if.spi_sdo = 4'h0;
  #100ns;
end


// // spi_1 test

initial begin
//   force spi_slave_if.spi_sdo         =   spi_master_sdo;
//   force spi_master_sdi               =   spi_slave_if.spi_sdi;
//   force spi_slave_if.spi_clk         =   spi_master_clk;
//   force spi_slave_if.spi_csn         =   spi_master_csn[0];
end


// test 

// init all vendor ram and reg
initial begin
    `ifndef VCS
    force u_MEISHAV100_TOP.topDesign.corePLL.pll_cfg_reg_postdiv[29:18] = 12'd20; // avoid pll fatal error,for reg init
    `endif
    #1ps;

end

    // initial begin
    //     uart_if.uart_tx_clk = 0;
    // end
    // always #1 uart_if.uart_tx_clk = ~uart_if.uart_tx_clk;
    //always #1 uart_if.uart_tx_clk = 0;


    initial begin
        clk_rst_if.set_active();
        uvm_config_db#(virtual clk_rst_if)::set(null, "*", "clk_rst_vif", clk_rst_if);
        uvm_config_db#(virtual spi_if)::set(null, "*", "spi_if", spi_if);
        uvm_config_db#(virtual spi_if2)::set(null, "*", "spi_if2", spi_if2);
        uvm_config_db#(virtual uart_if)::set(null, "*", "uart_if", uart_if);
        uvm_config_db#(virtual jtag_if)::set(null, "*", "jtag_if", jtag_if);
        uvm_config_db#(virtual spi_slave_if)::set(null, "*", "spi_slave_if", spi_slave_if);
        $timeformat(-12, 0, " ps", 12);
        run_test();
    end
    // pullup (MEISHAV100_TOP.sdio_sdio_dat_3);
    // pullup (MEISHAV100_TOP.sdio_sdio_dat_2);
    // pullup (MEISHAV100_TOP.sdio_sdio_dat_1);
    // pullup (MEISHAV100_TOP.sdio_sdio_dat_0);
/*
    
  // Instantitate the memory backdoor util instances.
  if (`PRIM_DEFAULT_IMPL == prim_pkg::ImplGeneric) begin : gen_generic
    initial begin
      mem_bkdr_util m_mem_bkdr_util[chip_mem_e];

      m_mem_bkdr_util[RamMain] = new(.name  ("mem_bkdr_util[RamMain]"),
                                     .path  (`DV_STRINGIFY(`RAM_MAIN_MEM_HIER)),
                                     .depth ($size(`RAM_MAIN_MEM_HIER)),
                                     .n_bits($bits(`RAM_MAIN_MEM_HIER)),
                                     .err_detection_scheme(mem_bkdr_util_pkg::ParityOdd));
      `MEM_BKDR_UTIL_FILE_OP(m_mem_bkdr_util[RamMain], `RAM_MAIN_MEM_HIER)

      m_mem_bkdr_util[RamRet] = new(.name  ("mem_bkdr_util[RamRet]"),
                                    .path  (`DV_STRINGIFY(`RAM_RET_MEM_HIER)),
                                    .depth ($size(`RAM_RET_MEM_HIER)),
                                    .n_bits($bits(`RAM_RET_MEM_HIER)),
                                    .err_detection_scheme(mem_bkdr_util_pkg::ParityOdd));
      `MEM_BKDR_UTIL_FILE_OP(m_mem_bkdr_util[RamRet], `RAM_RET_MEM_HIER)

      m_mem_bkdr_util[Rom] = new(.name  ("mem_bkdr_util[Rom]"),
                                 .path  (`DV_STRINGIFY(`ROM_DUT_MEM_HIER)),
                                 .depth ($size(`ROM_DUT_MEM_HIER)),
                                 .n_bits($bits(`ROM_DUT_MEM_HIER)),
                                 .err_detection_scheme(mem_bkdr_util_pkg::Ecc_39_32));
      `MEM_BKDR_UTIL_FILE_OP(m_mem_bkdr_util[Rom], `ROM_DUT_MEM_HIER)

      for (chip_mem_e mem = mem.first(), int i = 0; i < mem.num(); mem = mem.next(), i++) begin
        uvm_config_db#(mem_bkdr_util)::set(
            null, "*.env", m_mem_bkdr_util[mem].get_name(), m_mem_bkdr_util[mem]);
      end
    end
  end
*/

`undef ROM_DUT_MEM_HIER
  //test_judge u_test_judge();

endmodule


module test_judge;  

  reg [63:0] q_address;


  wire [63:0] _exists_T = q_address ^ 64'h10000000; 
  wire [64:0] _exists_T_1 = {1'b0,$signed(_exists_T)}; 
  wire [64:0] _exists_T_3 = $signed(_exists_T_1) & -65'sh10000000; 
  wire  _exists_T_4 = $signed(_exists_T_3) == 65'sh0; 


initial begin
   q_address = 0;

   forever begin
     q_address = q_address + 32'h08000000;
     #1;
     if(_exists_T_4 == 1) begin
       $display("q_address is 'h%0h, judge result is 1", q_address);
     end
     else begin
       //$display("q_address is 'h%0h, judge result is 0", q_address);
     end
   end
end

endmodule

bind MEISHAV100_TOP uart_monitor u_uart_monitor(
      .clk(MEISHAV100_TOP.topDesign.topMod.uart_0.txm.clock)
    , .rst_n(~MEISHAV100_TOP.topDesign.topMod.uart_0.reset)
    , .io_en(MEISHAV100_TOP.topDesign.topMod.uart_0.txm.io_en)
    , .tx_en(MEISHAV100_TOP.topDesign.topMod.uart_0.txm.io_in_ready & MEISHAV100_TOP.topDesign.topMod.uart_0.txm.io_in_valid & (MEISHAV100_TOP.topDesign.topMod.uart_0.reset == 1'b0))
    , .wdata(MEISHAV100_TOP.topDesign.topMod.uart_0.txm.io_in_bits)
    ); 


// bind MEISHAV100_TOP sdModel u_sdModel
// 				(
// 				.sdClk 	( MEISHAV100_TOP.sdio_sdio_clk 	),
// 				.sd_cmd_oe(1),
// 				.cmd 		( MEISHAV100_TOP.sdio_sdio_cmd 				),
// 				.sd_dat_oe(sd_dat_oe),
// 				.dat 		( {MEISHAV100_TOP.sdio_sdio_dat_3, MEISHAV100_TOP.sdio_sdio_dat_2, MEISHAV100_TOP.sdio_sdio_dat_1, MEISHAV100_TOP.sdio_sdio_dat_0} )
// 				); 

// bind MEISHAV100_TOP mdl_sdio u_sdcard (
// 		.sd_clk(MEISHAV100_TOP.sdio_sdio_clk)
//     , .sd_cmd(MEISHAV100_TOP.sdio_sdio_cmd)
//     , .sd_dat({MEISHAV100_TOP.sdio_sdio_dat_3, MEISHAV100_TOP.sdio_sdio_dat_2, MEISHAV100_TOP.sdio_sdio_dat_1, MEISHAV100_TOP.sdio_sdio_dat_0})
// 	);


//bind MEISHAV100_TOP sdspi_model u_sdspi_model(
//  .spiClk(MEISHAV100_TOP.sdio_sdio_clk),
//  .spiDataIn(MEISHAV100_TOP.sdio_sdio_cmd),
//  .spiDataOut(MEISHAV100_TOP.sdio_sdio_dat_0),
//  .spiCS_n(MEISHAV100_TOP.sdio_sdio_dat_3)
//);

