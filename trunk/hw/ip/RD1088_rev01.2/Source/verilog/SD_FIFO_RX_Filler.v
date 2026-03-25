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
module SD_FIFO_RX_FILLER
( 
input 								clk,
input 								rst,
//WB Signals    			
output[31:0]  				m_wb_adr_o,
                    	
output reg        		m_wb_we_o,
                    	
output reg[31:0]  		m_wb_dat_o,
output reg      			m_wb_cyc_o,
output reg       			m_wb_stb_o,
input           			m_wb_ack_i,
//output  	[2:0] m_wb_cti_o,
//output	[1:0]	 m_wb_bte_o,

//Data Master Control signals
input 								en,
input [31:0] 					adr,

//Data Serial signals 
input 								sd_clk,
input [`SD_BUS_W-1:0] dat_i, 
input 								wr,
output 								full
//
);
wire [31:0] 					dat_o;
wire 									empty;
reg 									rd;
reg 									reset_rx_fifo;
sd_rx_fifo Rx_Fifo 
					(
					.d 				( dat_i 							),
					.wr  			( wr 									),
					.wclk  		(	sd_clk							),
					.q 				( dat_o								),
					.rd 			(	rd									),
					.full 		(	full								),
					.empty 		(	empty								),
					.mem_empt (											),
					.rclk 		(	clk									),
					.rst  		(	rst | reset_rx_fifo	)
					);

//reg [31:0] tmp_dat;
reg [8:0] offset;
assign  	m_wb_adr_o = adr+offset;
//assign  m_wb_dat_o = dat_o;

reg 			wb_free;
always @( posedge clk or posedge rst )
begin
 		if ( rst ) 
 		begin
  			offset				<=	0;
  			//m_wb_we_o 		<=	0;
				//m_wb_cyc_o 		<= 	0;
				//m_wb_stb_o 		<= 	0;
				wb_free				<=	1;
				//m_wb_dat_o		<=	0;
				rd						<=	0;
				reset_rx_fifo	<=	1;
 		end
 		else if ( en )  
 		begin//Start filling the RX buffer
    		rd						<=	0;
    		reset_rx_fifo	<=	0;
  			if (!empty & wb_free) 
  			begin
    				rd					<=		1;    
    				//m_wb_dat_o	<=#1 	dat_o;
    				//m_wb_we_o 	<=#1 	1;
						//m_wb_cyc_o 	<=#1 	1;
						//m_wb_stb_o 	<=#1 	1; 
    				wb_free			<=		0;   
  			end
//---------------------------------  
  			if( !wb_free & m_wb_ack_i ) 
  			begin
    				//m_wb_we_o 	<=	0;
						//m_wb_cyc_o 	<= 	0;
						//m_wb_stb_o 	<= 	0;
						offset			<=	offset+`MEM_OFFSET;
						wb_free			<=	1;
				end	 
		end
		else 
		begin
   			reset_rx_fifo	<=	1;
    		rd						<=	0;
   			offset				<=	0;
    		//m_wb_cyc_o 		<= 	0;
				//m_wb_stb_o 		<= 	0; 
				//m_wb_we_o 		<=	0; 
				wb_free				<=	1;
  	end
end  
//--------------------------------------
reg rd_reg;
always@( posedge clk or posedge rst)
begin
		if( rst )
		begin
				rd_reg <= 1'b0; 
		end
		else
		begin
				rd_reg <= rd;
		end
end
always @( posedge clk or posedge rst )
begin
		if( rst )
		begin
		   	//offset				<=	0; 
				m_wb_we_o 		<=	0; 
				m_wb_cyc_o 		<= 	0; 
				m_wb_stb_o 		<= 	0; 
				m_wb_dat_o		<=	0;
		end
		else
		begin
				if( rd_reg )
				begin
				    m_wb_dat_o	<=#1 	dat_o;
						m_wb_we_o 	<=#1 	1;    
						m_wb_cyc_o 	<=#1 	1;    
						m_wb_stb_o 	<=#1 	1;    
				end
				else if  ( !wb_free & m_wb_ack_i & en)
				begin
						m_wb_we_o 	<=	0;                 
						m_wb_cyc_o 	<= 	0;                 
						m_wb_stb_o 	<= 	0;                 
						//offset			<=	offset+`MEM_OFFSET;
				end
				else
				begin
				    // offset				<=	0; 
m_wb_cyc_o 		<= 	0; 
m_wb_stb_o 		<= 	0; 
m_wb_we_o 		<=	0; 

				end
		end
end
endmodule


