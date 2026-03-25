
package spi_agent_pkg;
  // dep packages
  import uvm_pkg::*;
  import dv_utils_pkg::*;
  import dv_lib_pkg::*;

  // macro includes
  `include "uvm_macros.svh"
  `include "dv_macros.svh"

  // spi csmode
  typedef enum {
    Auto = 0,
    Hold = 2,
    Off = 3
  } spi_csmode_e;

  // sck edge type - used by driver and monitor
  // to wait for the right edge based on CPOL / CPHA
  typedef enum {
    LeadingEdge,
    DrivingEdge,
    SamplingEdge
  } sck_edge_type_e;
  
  // spi mode
  typedef enum {
    Single = 0,  // 
    Dual   = 1,  // Half duplex, tx and rx: sio[1:0]
    Quad   = 2   // Half duplex, tx and rx: sio[3:0]
  } spi_mode_e;

  typedef enum {
    SpiWrite,    // Spi write
    SpiRead  // Spi read
  } spi_trans_type_e;

  typedef enum {
    IDLE,
    CHK_CMD,
    WRITE,
    READ_ADD,
    READ_DATA
  } slave_spi_states_e;
  // spi config
      // spi config
  // typedef struct {
  //   rand bit [29:0] re;
  //   rand bit        pol;
  //   rand bit        pha;
  // } spi_reg_sckmode;
  // typedef struct {
  //   rand bit [29:0] re;
  //   rand bit        pol;
  //   rand bit        pha;
  // } spi_reg_sckmode;

  typedef struct {
    rand bit [31:0] csid;
  } spi_reg_csid;

  typedef struct {
    rand bit [31:0] csdef;
  } spi_reg_csdef;

  typedef struct {
    rand bit [29:0] re;
    rand bit [1:0]  mode;
  } spi_reg_csmode;

  // typedef struct {
  //   rand bit []
  // }
  // typedef struct {
  //   // CONTROL register field
  //   rand bit [8:0]  tx_watermark;
  //   rand bit [6:0]  rx_watermark;
  //   // CONFIGOPTS register field
  //   rand bit        cpol;
  //   rand bit        cpha;
  //   rand bit        fullcyc;
  //   rand bit        csaat;
  //   rand bit [3:0]  csnlead;
  //   rand bit [3:0]  csntrail;
  //   rand bit [3:0]  csnidle;
  //   rand bit [15:0] clkdiv;
  //   // COMMAND register field
  //   rand bit        fulldplx;
  //   rand bit        highz;
  //   rand bit        speed;
  //   rand bit [3:0]  tx1_cnt;
  //   rand bit [8:0]  txn_cnt;
  //   rand bit [8:0]  rx_cnt;
  //   rand bit [3:0]  dummy_cycles;
  // } spi_regs_t;
  // forward declare classes to allow typedefs below
  typedef class spi_item;
  // typedef class spi_agent_cfg;

  // package sources
  `include "spi_agent_cfg.sv"
  `include "spi_agent_cov.sv"
  `include "spi_item.sv"
  `include "spi_monitor.sv"
  // `include "spi_driver.sv"
  // `include "spi_host_driver.sv"
  // `include "spi_device_driver.sv"
  // `include "spi_sequencer.sv"
  `include "spi_agent.sv"
  // `include "seq_lib/spi_seq_list.sv"
  `include "spi_reg_sckmode_c.sv"

endpackage: spi_agent_pkg
