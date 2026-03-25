`timescale 1ps/1ps

module tb ();


import tlul_test_pkg::*;
import uvm_pkg::*;
import spi_test_pkg::*;
//import mem_bkdr_util_pkg::mem_bkdr_util;

reg sys_clock;
reg jtag_jtag_TCK;
reg jtag_jtag_TMS;
reg jtag_jtag_TDI;
wire jtag_jtag_TDO;
wire uart_txd;
reg uart_rxd;
wire uart_rtsn;
reg uart_ctsn;
wire sdio_sdio_clk;
wire sdio_sdio_cmd;
reg sdio_sdio_dat_0;
wire sdio_sdio_dat_1;
wire sdio_sdio_dat_2;
wire sdio_sdio_dat_3;
wire [13:0]ddr_ddr3_addr;
wire [2:0]ddr_ddr3_ba;
wire ddr_ddr3_ras_n;
wire ddr_ddr3_cas_n;
wire ddr_ddr3_we_n;
wire ddr_ddr3_reset_n;
wire ddr_ddr3_ck_p;
wire ddr_ddr3_ck_n;
wire ddr_ddr3_cke;
wire ddr_ddr3_cs_n;
wire [7:0]ddr_ddr3_dm;
wire ddr_ddr3_odt;
wire [63:0]ddr_ddr3_dq;
wire [7:0]ddr_ddr3_dqs_n;
wire [7:0]ddr_ddr3_dqs_p;
wire [7:0]led;
reg sys_reset;


VC707BaseShell  u_VC707BaseShell
(
    .sys_clock(sys_clock),
    .jtag_jtag_TCK(jtag_jtag_TCK),
    .jtag_jtag_TMS(jtag_jtag_TMS),
    .jtag_jtag_TDI(jtag_jtag_TDI),
    .jtag_jtag_TDO(jtag_jtag_TDO),
    .uart_txd(uart_txd),
    .uart_rxd(uart_rxd),
    .uart_rtsn(uart_rtsn),
    .uart_ctsn(uart_ctsn),
    .sdio_sdio_clk(sdio_sdio_clk),
    .sdio_sdio_cmd(sdio_sdio_cmd),
    .sdio_sdio_dat_0(sdio_sdio_dat_0),
    .sdio_sdio_dat_1(sdio_sdio_dat_1),
    .sdio_sdio_dat_2(sdio_sdio_dat_2),
    .sdio_sdio_dat_3(sdio_sdio_dat_3),
    .ddr_ddr3_addr(ddr_ddr3_addr),
    .ddr_ddr3_ba(ddr_ddr3_ba),
    .ddr_ddr3_ras_n(ddr_ddr3_ras_n),
    .ddr_ddr3_cas_n(ddr_ddr3_cas_n),
    .ddr_ddr3_we_n(ddr_ddr3_we_n),
    .ddr_ddr3_reset_n(ddr_ddr3_reset_n),
    .ddr_ddr3_ck_p(ddr_ddr3_ck_p),
    .ddr_ddr3_ck_n(ddr_ddr3_ck_n),
    .ddr_ddr3_cke(ddr_ddr3_cke),
    .ddr_ddr3_cs_n(ddr_ddr3_cs_n),
    .ddr_ddr3_dm(ddr_ddr3_dm),
    .ddr_ddr3_odt(ddr_ddr3_odt),
    .ddr_ddr3_dq(ddr_ddr3_dq),
    .ddr_ddr3_dqs_n(ddr_ddr3_dqs_n),
    .ddr_ddr3_dqs_p(ddr_ddr3_dqs_p),
    .led(led),
    .sys_reset(sys_reset)
);

`define ROM_MEM_HIER tb.u_VC707BaseShell.topDesign.topMod.maskROM.rom

    initial begin
        sys_clock <= 1'b0;
        sys_reset <= 1'b1;
        jtag_jtag_TCK <= 1'b0;
        jtag_jtag_TMS <= 1'b1;
        jtag_jtag_TDI <= 1'b0;
        uart_rxd <= 1'b1;
        uart_ctsn <= 1'b0;
        // sdio_sdio_dat_0 <= 1'b0;
        # 40
        sys_reset <= 1'b0;
        # 200000;
    end

    initial begin
        string boot_rom_hex_file;
	    string out_sram_hex_file;
        force tb.u_VC707BaseShell.fpga_power_on.power_on_reset = 1;

        #200ns;
        force tb.u_VC707BaseShell.fpga_power_on.power_on_reset = 0;
        if ($value$plusargs("BOOT_ROM_HEX_FILE=%s",boot_rom_hex_file)) begin
            $display("boot_rom_hex_file = %s\n",boot_rom_hex_file);
            // bootrom max depth: 'h200_0000 * 4byte - exact: 'h1_0000 * 4byte
            $readmemh(boot_rom_hex_file, `ROM_MEM_HIER);
            // for(rom_depth_idx = 0;rom_depth_idx <= `BOOTROM_DEPTH-1;rom_depth_idx++)
            // begin 
            //     uvm_hdl_force($sformatf("%0s.rom[%0d]", `DV_STRINGIFY(`BOOTROM_HIR), rom_depth_idx), ) = rom_content[rom_depth_idx]);		
            // end
        end
        
    end
    always #1 sys_clock <= ~sys_clock;
    
    wire clk, rst_n;

    clk_rst_if clk_rst_if(.clk(), .rst_n());


reg  MOSI, SS_n, spi_clk, spi_rst_n;
wire MISO;

spi_if2 spi_if2(.rst_n(sys_reset));


SPI_Wrapper spi_wrapper(
    .MOSI(MOSI),
    .SS_n(SS_n), 
    .clk(spi_clk), 
    .rst_n(spi_rst_n),
    .MISO(MISO),
    // .status(spi_if2.status),
    // .S_done(spi_if2.StoP_done),
    // .P_done(spi_if2.PtoS_done),
    // .ttx_valid(spi_if2.tx_valid)
    .MISO_valid(spi_if2.miso_valid)
);

assign MOSI            = sdio_sdio_cmd;
assign SS_n            = sdio_sdio_dat_3;
assign spi_clk         = sdio_sdio_clk;
assign spi_rst_n       = ~sys_reset;
assign sdio_sdio_dat_0 = MISO;

// initial begin
//     MISO <= 1'b0;
// end
/*
    parameter CLK_PERIOD = 10;

    reg [7:0] wr_add, rd_add; 
    reg [7:0] wr_data, rd_data;

    always #(CLK_PERIOD/2) spi_clk = ~spi_clk ;

    initial begin

        spi_clk = 0;
        spi_rst_n = 0;
        SS_n = 1;
        MOSI = 0;
        wr_add = 0;
        rd_add = 0;
        wr_data = 0;
        rd_data = 0;
        #(CLK_PERIOD);

        spi_rst_n = 1;
        repeat(10) begin 
            $display("              TEST CASE 1: Write Address Operation");

            SS_n = 0;
            #(CLK_PERIOD)

            MOSI = 0;
            #(CLK_PERIOD);

            MOSI = 0;
            #(CLK_PERIOD);

            MOSI = 0;
            #(CLK_PERIOD);

            repeat(8)begin
                MOSI = $random;
                wr_add = {wr_add[6:0], MOSI};
                #(CLK_PERIOD);
            end

            SS_n = 1;
            #(CLK_PERIOD)
            if(spi_wrapper.RAM.wr_addr == wr_add)
                $display ("no error in address of writing");
            else 
                $display ("error in address of writing");

            #(CLK_PERIOD);

            $display("              TEST CASE 2: Write Data Operation");

            SS_n = 0;
            #(CLK_PERIOD)

            MOSI = 0;
            #(CLK_PERIOD);

            MOSI = 0;
            #(CLK_PERIOD);

            MOSI = 1;
            #(CLK_PERIOD);

            repeat(8)begin
                MOSI = $random;
                wr_data = {wr_data[6:0], MOSI};
                #(CLK_PERIOD);
            end
            SS_n = 1;

            #(CLK_PERIOD)
            if(spi_wrapper.RAM.mem[wr_add] == wr_data)
                $display ("no error in writing data");
            else 
                $display ("error in writing data");

            #(CLK_PERIOD)

            $display("              TEST CASE 3: Read Address Operation");

            SS_n = 0;
            #(CLK_PERIOD)

            MOSI = 1;
            #(CLK_PERIOD);

            MOSI = 1;
            #(CLK_PERIOD);

            MOSI = 0;
            #(CLK_PERIOD);

            repeat(8)begin
                MOSI = $random;
                rd_add = {rd_add[6:0], MOSI};
                #(CLK_PERIOD);
            end
            SS_n = 1;

            #(CLK_PERIOD)
            if(spi_wrapper.RAM.rd_addr == rd_add)
                $display ("no error in address of read");
            else 
                $display ("error in address of read");

            #(CLK_PERIOD)

                $display("              TEST CASE 4: Read Data Operation");

            SS_n = 0;
            #(CLK_PERIOD)

            MOSI = 1;
            #(CLK_PERIOD);

            MOSI = 1;
            #(CLK_PERIOD);

            MOSI = 1;
            #(CLK_PERIOD);


            repeat(8)begin
                MOSI = $random;
                #(CLK_PERIOD);
            end

            #(CLK_PERIOD);

            repeat(8)begin
                #(CLK_PERIOD);
                rd_data = {rd_data[6:0], MISO};
            end
            SS_n = 1;
            
            #(CLK_PERIOD);
            if(spi_wrapper.RAM.mem[rd_add] == rd_data)
                $display ("no error in reading data");
            else 
                $display ("error in reading data");

            #(CLK_PERIOD*2);
        end 

        // $stop;

        // end
    end
*/

// initial begin
//     $readmemh("data.dat", spi_wrapper.RAM.mem);
// end

// spi_base_test
    spi_if spi_if(.rst_n(sys_reset));
    assign spi_if.sclk = sdio_sdio_clk;
    assign spi_if.cs = sdio_sdio_dat_3;
    assign spi_if.mosi = sdio_sdio_cmd;
    assign spi_if.miso = sdio_sdio_dat_0;

    initial begin
        spi_if.trans_done = 1'b0;
    end 

    initial begin
        clk_rst_if.set_active();
        uvm_config_db#(virtual clk_rst_if)::set(null, "*", "clk_rst_vif", clk_rst_if);
        uvm_config_db#(virtual spi_if)::set(null, "*", "spi_if", spi_if);
        uvm_config_db#(virtual spi_if2)::set(null, "*", "spi_if2", spi_if2);
        $timeformat(-12, 0, " ps", 12);
        run_test();
    end

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
                                 .path  (`DV_STRINGIFY(`ROM_MEM_HIER)),
                                 .depth ($size(`ROM_MEM_HIER)),
                                 .n_bits($bits(`ROM_MEM_HIER)),
                                 .err_detection_scheme(mem_bkdr_util_pkg::Ecc_39_32));
      `MEM_BKDR_UTIL_FILE_OP(m_mem_bkdr_util[Rom], `ROM_MEM_HIER)

      for (chip_mem_e mem = mem.first(), int i = 0; i < mem.num(); mem = mem.next(), i++) begin
        uvm_config_db#(mem_bkdr_util)::set(
            null, "*.env", m_mem_bkdr_util[mem].get_name(), m_mem_bkdr_util[mem]);
      end
    end
  end
*/


endmodule
