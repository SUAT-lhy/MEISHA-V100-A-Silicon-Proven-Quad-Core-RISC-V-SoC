`define VENDOR_RAM_EN
`define TRC_CHECK
//`define CHIPLINK_CONNECT_DIRECT_TL
`define MSTD_CELL_EN
`define RANDOM 1'b0
`define TRACK_12T
 // ddr 40M/4 = 10M chiplink 40M/8 = 5M main cpu
`define PLL_DEFAULT_VALUE_USE_WHICH_PLL_CLK {12'd0, 5'd0, 5'd0, 5'd0, 5'd0}
//`define PLL_DEFAULT_VALUE_USE_WHICH_PLL_CLK {12'd0, 5'd18, 5'd20, 5'd0, 5'd0}

`define PLL_DEFAULT_VALUE_dacpd 1
`define PLL_DEFAULT_VALUE_dsmpd 1
`define PLL_DEFAULT_VALUE_pd 1
`define PLL_DEFAULT_VALUE_cpi_bias 3
`define PLL_DEFAULT_VALUE_cpp_bias 2
`define PLL_DEFAULT_VALUE_gvco_bias 1
// vco: 1000M = 50M * 20 / 1    
`define PLL_DEFAULT_VALUE_frac 0
// `define PLL_DEFAULT_VALUE_fbdiv 20
`define PLL_DEFAULT_VALUE_fbdiv 50
// 0 1: 1, 2 - 31: 2 - 31
`define PLL_DEFAULT_VALUE_prediv 1

// clk_cpu: 500M, 2000M / 4 / 1    
`define PLL_DEFAULT_VALUE_postdiv0_0 3
`define PLL_DEFAULT_VALUE_postdiv1_0 0
//  clk_main: 250M, 2000M / 4 / 2  
`define PLL_DEFAULT_VALUE_postdiv0_1 3
`define PLL_DEFAULT_VALUE_postdiv1_1 1
// clk_chiplink: 100M, 2000M / 5 / 4     
`define PLL_DEFAULT_VALUE_postdiv0_2 4
`define PLL_DEFAULT_VALUE_postdiv1_2 3

`define SDRAM_DEFAULT_10M

`ifdef SDRAM_DEFAULT_50M

    `define SDRAM_DEFAULT_VALUE_sdram_start_delay 32'd5000
    `define SDRAM_DEFAULT_VALUE_sdram_refresh_cycles 32'd1561
    `define SDRAM_DEFAULT_VALUE_sdram_trcd_cycles 32'd2
    `define SDRAM_DEFAULT_VALUE_sdram_trp_cycles 32'd2
    `define SDRAM_DEFAULT_VALUE_sdram_trfc_cycles 32'd4
    

`elsif SDRAM_DEFAULT_10M

    `define SDRAM_DEFAULT_VALUE_sdram_start_delay 32'd1000
    `define SDRAM_DEFAULT_VALUE_sdram_refresh_cycles 32'd77
    `define SDRAM_DEFAULT_VALUE_sdram_trcd_cycles 32'd1
    `define SDRAM_DEFAULT_VALUE_sdram_trp_cycles 32'd1
    `define SDRAM_DEFAULT_VALUE_sdram_trfc_cycles 32'd1

`else

`endif
// for formality donot add
//`define RANDOMIZE_GARBAGE_ASSIGN

// for x2p and x2x
`define AMBA_APB3

// for nvdla sub
`define DISABLE_TESTPOINTS
`define NV_SYNTHESIS 
`define RAM_INTERFACE

// `define SYNTHESIS

// nvdla simulation
`define NVTOOLS_SYNC2D_GENERIC_CELL
`define XSDB_SLV_DIS
`define PRAND_OFF

`ifdef VENDOR_RAM_EN
    `define ROM_DUT_MEM_HIER tb.u_MEISHAV100_TOP.topDesign.topMod.maskROM.rom.U_ROM.Memory
`else
    `define ROM_DUT_MEM_HIER tb.u_MEISHAV100_TOP.topDesign.topMod.maskROM.rom.rom
`endif

// std cell name define 

`ifdef TRACK_7T
    `define CK_BUF_STD_CELL_DONT_TOUCH BUFCKLEHMX2
    `define CK_AND2_STD_CELL_DONT_TOUCH AN2CKLEHMX8
    //`define CK_DELAY_STD_CELL_DONT_TOUCH DLYN1LEHMX1
    `define CK_GATE_STD_CELL_DONT_TOUCH GCKESLEHMX2
    `define CK_INV_STD_CELL_DONT_TOUCH INVCKLEHMX2
    `define CK_MUX2_STD_CELL_DONT_TOUCH MUX2CKLEHMX2
    `define CK_OR2_STD_CELL_DONT_TOUCH OR2CKLEHMX2
    `define CK_XOR2_STD_CELL_DONT_TOUCH XOR2CKLEHMX2
    `define REG_ASYNC_RESET_ENABLE_DONT_TOUCH QDFERBNLEHMX0P4
`elsif TRACK_9T
    `define CK_BUF_STD_CELL_DONT_TOUCH BUFCKLBHMX2
    `define CK_AND2_STD_CELL_DONT_TOUCH AN2CKLBHMX8
    `define CK_DELAY_STD_CELL_DONT_TOUCH DLYN1LBHMX3
    `define CK_GATE_STD_CELL_DONT_TOUCH GCKESLBHMX2
    `define CK_INV_STD_CELL_DONT_TOUCH INVCKLBHMX2
    `define CK_MUX2_STD_CELL_DONT_TOUCH MUX2CKLBHMX2
    `define CK_OR2_STD_CELL_DONT_TOUCH OR2CKLBHMX2
    `define CK_XOR2_STD_CELL_DONT_TOUCH XOR2CKLBHMX2
    `define REG_ASYNC_RESET_ENABLE_DONT_TOUCH QDFERBNLBHMX0P4
`elsif TRACK_12T
    `define CK_BUF_STD_CELL_DONT_TOUCH BUFCKLHLMX8
    `define CK_AND2_STD_CELL_DONT_TOUCH AN2CKLHLMX8
    `define CK_DELAY_STD_CELL_DONT_TOUCH DLYN1LHLMX3
    `define CK_GATE_STD_CELL_DONT_TOUCH GCKESLHLMX8
    `define CK_INV_STD_CELL_DONT_TOUCH INVCKLHLMX8 
    `define CK_MUX2_STD_CELL_DONT_TOUCH MUX2CKLHLMX2
    `define CK_OR2_STD_CELL_DONT_TOUCH OR2CKLHLMX2
    `define CK_XOR2_STD_CELL_DONT_TOUCH XOR2CKLHLMX2
    `define REG_ASYNC_RESET_ENABLE_DONT_TOUCH QDFERBNLHLMX2
`else

`endif