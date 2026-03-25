//////////////////////////////////////////////////////////////////////////////////////////////
////                                                              ////
////  sd_controller_top_tb.v                                      ////
////                                                              ////
////  This file is part of the SD IP core project                 ////
//// http://www.opencores.org/?do=project&who=sdcard_mass_storage_controller                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Adam Edvardsson, adam@opencores.org                   ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//// WB Model, ideas and task borrowed from:                    ////
//// http://www.opencores.org/projects/ethmac/                    ////
////  Author(s):                                                  ////
////      - Tadej Markovic, tadej@opencores.org                   ////
////      - Igor Mohor,     igorM@opencores.org                   ////
//////////////////////////////////////////////////////////////////////
////
                                            ////
//// Copyright (C) 2001, 2002 Authors                             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//`define TX_ERROR_TEST
//---------------------------------------------------------------------
// Copyright (c) 2010 by Lattice Semiconductor Corporation
//---------------------------------------------------------------------
// Disclaimer:
//
// This VHDL or Verilog source code is intended as a design reference
// which illustrates how these types of functions can be implemented.
// It is the user's responsibility to verify their design for
// consistency and functionality through the use of formal
// verification methods. Lattice Semiconductor provides no warranty
// regarding the use or functionality of this code.
//
// --------------------------------------------------------------------
//
// Lattice Semiconductor Corporation
// 5555 NE Moore Court
// Hillsboro, OR 97214
// U.S.A
//
// TEL: 1-800-Lattice (USA and Canada)
// 503-268-8001 (other locations)
//
// web: http://www.latticesemi.com/
// email: techsupport@latticesemi.com
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Ver: | Author     |Mod. Date |Changes Made:
// V1.0 | Peter.Zhou |03/16/10  |
//
// --------------------------------------------------------------------
//------------------------------------
`include "SD_defines.v"
`timescale 1ns/1ps
module sd_tx_fifo
  (
   input [32-1:0] 	d,
   input 						wr,
   input 						wclk,
   output reg[32-1:0] 	q,
   input 						rd,
   output 					full,
   output 					empty,
   output [5:0] 		mem_empt,
   input 						rclk,
   input 						rst
   );
////////////////////////////////////////////
reg [32-1:0] 	ram [0:`FIFO_TX_MEM_DEPTH-1];
reg [`FIFO_TX_MEM_ADR_SIZE-1:0] adr_i, adr_o;
wire 					ram_we;
wire [32-1:0] ram_din;
////////////////////////////////////////////
assign ram_we = wr & ~full;	//fifo non-full and write enable
assign ram_din = d;
////////////////////////////////////////////
always @ ( posedge wclk )
     if (ram_we)
       ram[adr_i[`FIFO_TX_MEM_ADR_SIZE-2:0]] <= ram_din;
////////////////////////////////////////////
always @ (posedge wclk or posedge rst)
     if (rst)
       adr_i <= `FIFO_TX_MEM_ADR_SIZE'h0;
     else
       if (ram_we)
      	 	if (adr_i == `FIFO_TX_MEM_DEPTH-1) 
      	 	begin
	        		adr_i[`FIFO_TX_MEM_ADR_SIZE-2:0] <=0;
	        		adr_i[`FIFO_TX_MEM_ADR_SIZE-1]<=~adr_i[`FIFO_TX_MEM_ADR_SIZE-1];
	    		end
	     		else
	      			adr_i <= adr_i + `FIFO_TX_MEM_ADR_SIZE'h1;
/////////////////////////////////////
always @ (posedge rclk or posedge rst)
     if (rst)
       adr_o <= `FIFO_TX_MEM_ADR_SIZE'h0;
     else
       if (!empty & rd) 
       begin
	 				 //if (adr_o == `FIFO_TX_MEM_DEPTH-1) 
	 				 //begin
	    		 //		adr_o[`FIFO_TX_MEM_ADR_SIZE-2:0] <=0;
	    		 //		adr_o[`FIFO_TX_MEM_ADR_SIZE-1] 	 <= ~adr_o[`FIFO_TX_MEM_ADR_SIZE-1];
	 				 //end
	 				 //else
	   			 adr_o <= adr_o + `FIFO_TX_MEM_ADR_SIZE'h1; 
	   			 q = ram[adr_o[`FIFO_TX_MEM_ADR_SIZE-2:0]];  
	   			 
	 		 end
//------------------------------------------------------------------
// Simplified version of the three necessary full-tests:
// assign wfull_val=((wgnext[ADDRSIZE] !=wq2_rptr[ADDRSIZE] ) &&
// (wgnext[ADDRSIZE-1] !=wq2_rptr[ADDRSIZE-1]) &&
// (wgnext[ADDRSIZE-2:0]==wq2_rptr[ADDRSIZE-2:0]));
//------------------------------------------------------------------


   assign full=  ( adr_i[`FIFO_TX_MEM_ADR_SIZE-2:0] == adr_o[`FIFO_TX_MEM_ADR_SIZE-2:0] ) &  (adr_i[`FIFO_TX_MEM_ADR_SIZE-1] ^ adr_o[`FIFO_TX_MEM_ADR_SIZE-1]) ;
   assign empty = (adr_i == adr_o) ;

   assign mem_empt = ( adr_i-adr_o);
   //assign q = ram[adr_o[`FIFO_TX_MEM_ADR_SIZE-2:0]];
endmodule

