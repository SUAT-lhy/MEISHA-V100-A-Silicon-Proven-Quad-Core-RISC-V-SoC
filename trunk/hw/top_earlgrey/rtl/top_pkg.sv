// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//

package top_pkg;

localparam int TL_AW=38;
localparam int TL_DW=64;    // = TL_DBW * 8; TL_DBW must be a power-of-two
localparam int TL_AIW=8;    // a_source, d_source
localparam int TL_DIW=1;    // d_sink
localparam int TL_AUW=21;   // a_user
localparam int TL_DUW=14;   // d_user
localparam int TL_DBW=(TL_DW>>3);
//localparam int TL_SZW=$clog2($clog2(TL_DBW)+1);
localparam int TL_SZW=3;


    parameter MAX_DATA_WIDTH = 64;  // for axi xbar data width, and vip, vip only support 64
    parameter MAX_ADDR_WIDTH = 32;
    parameter MAX_ID_WIDTH = 16;

    localparam int AXI_ADDR_WIDTH = MAX_ADDR_WIDTH;
    localparam int AXI_DATA_WIDTH = MAX_DATA_WIDTH;    // = AXI_DBW * 8; AXI_DBW must be a power-of-two
    localparam int AXI_LENGTH_WIDTH=4; 
    localparam int AXI_AWID_WIDTH = MAX_ID_WIDTH;    // 
    localparam int AXI_ARID_WIDTH = MAX_ID_WIDTH;    // 
    localparam int AXI_AWUSER_WIDTH=16;   // 
    localparam int AXI_ARUSER_WIDTH=16;   // 
    localparam int AXI_WUSER_WIDTH=16;   // 
    localparam int AXI_BUSER_WIDTH=16;   // 
    localparam int AXI_RUSER_WIDTH=16;   // 
    localparam int AXI_WSTRB_WIDTH=(AXI_DATA_WIDTH>>3);
    localparam int AXI_SZW=$clog2($clog2(AXI_WSTRB_WIDTH)+1);


    parameter WIDTH_CID   = 4 ;// Channel ID width in bits
    parameter WIDTH_ID    = 8 ; // ID width in bits
    parameter WIDTH_AD    = MAX_ADDR_WIDTH ; // address width
    parameter WIDTH_DA    = MAX_DATA_WIDTH ; // data width
    parameter WIDTH_DS    =(WIDTH_DA/8)  ; // data strobe width
    parameter WIDTH_SID   =(WIDTH_CID+WIDTH_ID); // ID for slave
                `ifdef AMBA_AXI_AWUSER
    parameter WIDTH_AWUSER= 1 ; // Write-address user path
                `endif
                `ifdef AMBA_AXI_WUSER
    parameter WIDTH_WUSER = 1 ; // Write-data user path
                `endif
                `ifdef AMBA_AXI_BUSER
    parameter WIDTH_BUSER = 1 ; // Write-response user path
                `endif
                `ifdef AMBA_AXI_ARUSER
    parameter WIDTH_ARUSER= 1 ; // read-address user path
                `endif
                `ifdef AMBA_AXI_RUSER
    parameter WIDTH_RUSER = 1 ; // read-data user path
                `endif
    parameter SLAVE_EN0   = 1 ; 
    parameter ADDR_BASE0  =32'h00000000 ;
    parameter ADDR_LENGTH0=12 ; // effective addre bits
    parameter SLAVE_EN1   = 1 ; 
    parameter ADDR_BASE1  =32'h00002000 ;
    parameter ADDR_LENGTH1=12 ; // effective addre bits
    parameter SLAVE_EN2   = 1 ; 
    parameter ADDR_BASE2  =32'h00004000 ;
    parameter ADDR_LENGTH2=12 ; // effective addre bits
    parameter NUM_MASTER  = 2  ; // should not be changed
    parameter NUM_SLAVE   = 3  ; // should not be changed


endpackage
