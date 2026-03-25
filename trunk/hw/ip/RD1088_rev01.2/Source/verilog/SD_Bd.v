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
module SD_Bd
			(
			input 													clk,
			input 													rst,
			//input stb_m,
			input 													we_m,
			input [`RAM_MEM_WIDTH-1:0] 			dat_in_m,
			output reg [`BD_WIDTH-1 :0] 		free_bd,
			input  													re_s,
			output reg 											ack_o_s,
			input 													a_cmp,
			output reg[`RAM_MEM_WIDTH-1:0] 	dat_out_s
			);
///////////////////////////////////////
reg 			new_bw;
reg 			last_a_cmp;
`ifdef RAM_MEM_WIDTH_32
		`ifdef LATTICE
				reg [`RAM_MEM_WIDTH -1:0] bd_mem [`BD_SIZE -1 :0]; /* synthesis syn_ramstyle = "no_rw_check"*/
		`else
				reg [`RAM_MEM_WIDTH -1:0] bd_mem [`BD_SIZE -1 :0];	//16 width;32 depth
		`endif
`else 
`ifdef RAM_MEM_WIDTH_16
	 `ifdef LATTICE
			reg [`RAM_MEM_WIDTH -1:0] bd_mem [`BD_SIZE -1 :0];///*synthesis syn_ramstyle = "no_rw_check"*/;//* synthesis syn_ramstyle = "registers" */ ; //synthesis syn_ramstyle = "no_rw_check"
	`else
	 		reg [ `RAM_MEM_WIDTH -1:0] bd_mem [ `BD_SIZE -1 :0];
	 `endif		
`endif
`endif	

`ifdef RAM_MEM_WIDTH_32
		`ifdef LATTICE
				reg 									write_cnt;
				reg 									read_cnt;
				reg [`BD_WIDTH -1 :0] m_wr_pnt;
				reg [`BD_WIDTH -1 :0] s_rd_pnt;
				//generate
				//reg 									write_cnt;
				//reg 									read_cnt;
				//reg [`BD_WIDTH -1 :0] m_wr_pnt;
				//reg [`BD_WIDTH -1 :0] s_rd_pnt;
				//Main side read/write
				always @(posedge clk or posedge rst )
				begin
				   	//new_bw <=	1'b0;
				  	if ( rst )
				  	begin
				    		m_wr_pnt	<= 5'd0;
				    		write_cnt	<= 1'b0;
				    		new_bw 		<= 1'b0;
				  	end
				  	else if ( we_m )
				  	begin
				    		if ( free_bd > 5'd0 )
				    		begin
				      			write_cnt <= ~write_cnt;
				      			m_wr_pnt	<= m_wr_pnt + 1'b1;
				      			if ( !write_cnt )
				      			begin  //First write indicate source buffer addr
				        				bd_mem[m_wr_pnt]<=dat_in_m;
				      			end
				      			else
				      			begin        //Second write indicate SD card block addr
				        				bd_mem[m_wr_pnt]<=dat_in_m;
				        				new_bw =1;
				      			end
				     		end
				  	end
				end
//////////////////////////////////////////////////////
				always @(posedge clk or posedge rst)
				begin
	  				if (rst)
	  				begin
	  		  			free_bd <=(`BD_SIZE/2);
	  				end
	  				else if ( new_bw )
	  				begin
	  		  			free_bd <= free_bd - 1;
	  				end
	  				else if  (a_cmp)
	  				begin
	  		   			free_bd <= free_bd + 1;
	  				end
				end
				//Second side read
				always @(posedge clk or posedge rst)
				begin
	  				if (rst)
	  				begin
	  		  			s_rd_pnt <= 5'b0;
	  				end
	  				else if (re_s)
	  				begin
	  		  			s_rd_pnt<=s_rd_pnt+1;
	  		  			dat_out_s<= bd_mem[s_rd_pnt];
	  				end
				end
				//
				endgenerate
    		`endif
`else
`ifdef RAM_MEM_WIDTH_16
		`ifdef LATTICE
reg [1:0]	write_cnt;		// ZZP comment. Date:2010-03-14
//reg  write_cnt;
reg [1:0]	read_s_cnt;
reg 			read_cnt;
/////////////////////////////////////////////////
reg [`BD_WIDTH -1 :0] m_wr_pnt;
reg [`BD_WIDTH -1 :0] s_rd_pnt;	
//generate	
		
			//reg [1:0]	write_cnt;
			//reg [1:0]	read_s_cnt;
			//reg 			read_cnt;
			///////////////////////////////////////////////////
			//reg [`BD_WIDTH -1 :0] m_wr_pnt;
			//reg [`BD_WIDTH -1 :0] s_rd_pnt;
			//Main side read/write
			always @( posedge clk )
			begin
			   	//new_bw =0;
			  	if ( rst )
			  	begin
			    		m_wr_pnt	<= 	0;
			    		write_cnt	<= 	0;
			    		new_bw 		<= 	0;
			    		read_cnt	<=	0;
			  	end
			  	else if ( we_m )
			  	begin
			    		if ( free_bd >0 )
			    		begin
			      			write_cnt <= write_cnt+1;
			      			m_wr_pnt	<= m_wr_pnt+1;
			      			
			      			bd_mem[m_wr_pnt] <= dat_in_m;
			      			if ( !write_cnt[1] )
			      			begin      //First write indicate source buffer addr (2x16)
			        				//bd_mem[m_wr_pnt] <= dat_in_m;
			     	 			end
			      			else
			      			begin        //Second write indicate SD card block addr (2x16)
			        				//bd_mem[m_wr_pnt] <= dat_in_m;
			        				new_bw 					 <= write_cnt[0];      //Second 16 bytes writen, complete BD
			      			end
			     		end
			  	end
			  	else
			  	begin
			  	    new_bw 		<= 	0; 
			  	end
			end
/////////////////////////////
			always @(posedge clk or posedge rst)
			begin
			  	if ( rst )
			  	begin
			    		free_bd 		<=	(`BD_SIZE  /4);
			    		last_a_cmp	<=	1'b0;
			  	end
			  	else if ( new_bw )
			  	begin
			    		free_bd <= free_bd - 1'b1;
			  	end
			  	else if  ( a_cmp )
			  	begin
			    		last_a_cmp <=a_cmp;
			    		if ( !last_a_cmp )
			     				free_bd <= free_bd+1;
			  	end
			 		else
			  		 last_a_cmp <=a_cmp;
			end
			//Second side read
			always @(posedge clk or posedge rst)
			begin
			  	if ( rst )
			  	begin
			    		s_rd_pnt		<= 5'b0;
				  		read_s_cnt	<= 2'b0;
				  		ack_o_s			<= 1'b0;
			  	end
			  	else if ( re_s )
			  	begin
			    		read_s_cnt 	<=	read_s_cnt + 1'b1;
			    		s_rd_pnt		<=	s_rd_pnt + 1'b1;
			    		ack_o_s			<= 	1'b1;
			     		if ( !read_s_cnt[1] )//First read indicate source buffer addr (2x16)
			        		dat_out_s	<= bd_mem[s_rd_pnt];
			      	else //Second read indicate SD card block addr (2x16)
			        		dat_out_s	<= bd_mem[s_rd_pnt];
			  	end
			  	else
			    		ack_o_s	<=0;
			end
//endgenerate
								
				`endif
		`endif
`endif		
///////////////////////////////////////

//`else 
//		`ifdef RAM_MEM_WIDTH_16
//			`ifdef LATTICE
//					reg [ `RAM_MEM_WIDTH -1:0] bd_mem [ `BD_SIZE -1 :0];  //synthesis syn_ramstyle = "no_rw_check"
//			`else
//					reg [ `RAM_MEM_WIDTH -1:0] bd_mem [ `BD_SIZE -1 :0];
//			`endif
/////////////////////////////////////////////////

 		//	`endif
//`endif
endmodule

