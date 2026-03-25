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
module SD_FIFO_TX_FILLER
			(
			input 					clk,
			input 					rst,
			//WB Signals
			output  [31:0]  m_wb_adr_o,
			output  reg     m_wb_we_o,
			input   [31:0]  m_wb_dat_i,
			output  reg     m_wb_cyc_o,
			output  reg     m_wb_stb_o,
			input           m_wb_ack_i,
			//output  	[2:0] m_wb_cti_o,
			//output	[1:0]	 m_wb_bte_o,

			//Data Master Control signals
			input 					en,
			input [31:0] 		adr,


			//Data Serial signals
			input 					sd_clk,
			output [31:0] 	dat_o,
			input 					rd,
			output 					empty,
			output 					fe
			//
			);
reg 									reset_tx_fifo;
reg [31:0] 						din;
reg 									wr_tx;
reg [8:0] 						we;
reg [8:0] 						offset;
wire [5:0]						mem_empt;
/////////////////////////
sd_tx_fifo 	Tx_Fifo
						(
						.d 				( din ),
						.wr  			( wr_tx ),
						.wclk  		(	clk	),
						.q 				( dat_o ),
						.rd 			(	rd ),
						.full 		(	fe ),
						.empty 		(	empty ),
						.mem_empt ( mem_empt ),
						.rclk 		( sd_clk ),
						.rst  		( rst | reset_tx_fifo )
						);
//////////////////////////////////
assign  m_wb_adr_o = adr + offset;
reg 		first;
reg 		ackd;
reg 		delay;
/////////////////////////////////////
always @(posedge clk or posedge rst )
begin
 		if (rst)
 		begin
     		offset 				<= 9'b0;
	  		we 						<= 9'h1;
	  		m_wb_we_o 		<= 1'b0;
				m_wb_cyc_o 		<= 1'b0;
				m_wb_stb_o 		<= 1'b0;
				wr_tx					<= 1'b0;
    		ackd 					<= 1'b1;
    		delay					<= 1'b0;
				reset_tx_fifo	<= 1'b1;
				first					<= 1;
				din						<= 32'b0;
 		end
 		else if ( en )
 		begin //Start filling the TX buffer
    		reset_tx_fifo <= 1'b0;
	  		if ( m_wb_ack_i )
	  		begin
		  			wr_tx <= 1'b1;
		  			din 	<= m_wb_dat_i;
		  			m_wb_cyc_o <= 1'b0;
		  			m_wb_stb_o <= 1'b0;
		  			delay <= ~delay;
				end
				else
				begin
						wr_tx <=0;
				end
/////////////////////////
	  		if ( delay )
	  		begin
	     			offset <= offset+`MEM_OFFSET;  //4 for SYN, 1 for SIM
	     			ackd	<= ~ackd;
	     			delay <= ~delay;
	     			wr_tx <= 1'b0;
	  		end
////////////////////
				if ( !m_wb_ack_i & !fe & ackd  ) //FIFO non full
				begin //If not full And no Ack
		  			m_wb_we_o <= 1'b0;  //? comment by ZPZHOU
						m_wb_cyc_o <= 1'b1;
						m_wb_stb_o <= 1'b1;
						ackd <= 1'b0;
				end
 		end
 		else
 		begin
   			offset <= 9'b0;
   			reset_tx_fifo<= 1'b1;
   			m_wb_cyc_o <= 1'b0;
   			m_wb_stb_o <= 1'b0;
   			m_wb_we_o <= 1'b0;
 		end
end
////////////////////////////////
endmodule


