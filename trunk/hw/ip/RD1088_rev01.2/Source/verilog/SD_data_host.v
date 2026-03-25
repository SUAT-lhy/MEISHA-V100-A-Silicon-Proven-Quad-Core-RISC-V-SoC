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
`timescale 1ns/1ps
`include "SD_defines.v"
module SD_DATA_SERIAL_HOST
			(
			input 										sd_clk,
			input 										rst,
			//Tx Fifo
			input [31:0] 							data_in,
			output reg 								rd,
			//Rx Fifo
			output reg[`SD_BUS_W-1:0] data_out,		//4bit
			output reg 								we,
			//tristate data
			output reg 								DAT_oe_o,
			output reg[`SD_BUS_W-1:0] DAT_dat_o,
			input  [`SD_BUS_W-1:0] 		DAT_dat_i,
			//Controll signals
			input [1:0] 							start_dat,
			input 										ack_transfer,
			output reg 								busy_n,
			output reg 								transm_complete,
			output reg 								crc_ok
			);
//CRC16
reg [`SD_BUS_W-1:0] 						crc_in;
reg 														crc_en;
reg 														crc_rst;
wire [15:0] 										crc_out [`SD_BUS_W-1:0];
reg  [`SD_BUS_W-1:0] 						temp_in;
reg [10:0] 											transf_cnt;
parameter 											SIZE = 6;
reg [SIZE-1:0] 									state;
reg [SIZE-1:0] 									next_state;
//////////////////////////////////////////////////////////////
parameter 											IDLE        = 6'h01;
parameter 											WRITE_DAT   = 6'h02;
parameter 											WRITE_CRC   = 6'h04;
parameter 											WRITE_BUSY  = 6'h08;
parameter 											READ_WAIT   = 6'h10;
parameter 											READ_DAT    = 6'h20;
//////////////////////////////////////////////////////////////
reg [2:0] 											crc_status;
reg 														busy_int;
genvar i;
generate
			for(i=0; i<`SD_BUS_W; i=i+1)
			begin:CRC_16_gen
  				SD_CRC_16 CRC_16_i
  									(
  									crc_in[i],
  									crc_en,
  									sd_clk,
  									crc_rst,
  									crc_out[i]
  									);
			end
endgenerate
/////////////////////////////////////////////////
reg 		ack_transfer_int;
reg 		ack_q;
always @ (posedge sd_clk or posedge rst   )
begin: ACK_SYNC
		if ( rst )
		begin
  			ack_transfer_int <= 1'b0;
  			ack_q						 <= 1'b0;
  	end
		else
		begin
  			ack_q						 <=	ack_transfer;
  			ack_transfer_int <=	ack_q;
  	end
end
/////////////////////////////////////////////////
reg 		q_start_bit;
always @ ( state or start_dat or q_start_bit
				or DAT_dat_i[0] or transf_cnt
				or crc_status or busy_int
				or DAT_dat_i or ack_transfer_int
				)
begin : FSM_COMBO
 		next_state <= 6'd0;
		case( state )
  	IDLE:
  	begin
   			if( start_dat == 2'b01 )
      			next_state	<= WRITE_DAT;
    		else if(start_dat == 2'b10)
      			next_state	<= READ_WAIT;
    		else
      			next_state 	<= IDLE;
    end
  	WRITE_DAT:
  	begin
    		if ( transf_cnt >= `BIT_BLOCK - 1 )
       			next_state	<= WRITE_CRC;
   			else if ( start_dat == 2'b11 )		// stop command received
        		next_state	<= IDLE;
    		else
       			next_state	<= WRITE_DAT;
  	end
	  WRITE_CRC:
	  begin
    		if ( crc_status == 3'd0 )
       			next_state	<= WRITE_BUSY;
    		else
       			next_state	<=	WRITE_CRC;
  	end
  	WRITE_BUSY:
  	begin
      	if (( busy_int == 1'b1 ) & ack_transfer_int )
       			next_state	<= IDLE;
    		else
       			next_state  <= WRITE_BUSY;
  	end
  	READ_WAIT:
  	begin
    		if (	DAT_dat_i[0]	== 1'b0 )
       			next_state	<= 	READ_DAT;
    		else
       			next_state	<=	READ_WAIT;
  	end
  	READ_DAT:
  	begin
    		if ( ack_transfer_int )  //Startbit consumed...
       			next_state <= IDLE;
    		else if (	start_dat == 2'b11 )
        		next_state <= IDLE;
    		else
       			next_state <= READ_DAT;
    end
 		endcase
end
//////////////////////////////////////////////////////////////
always @ ( posedge sd_clk or posedge rst )
begin :START_SYNC
  	if ( rst )
  	begin
    		q_start_bit	<=	1'b1;
 		end
 		else
 		begin
    		q_start_bit <= DAT_dat_i[0];
 		end
end
//----------------Seq logic------------
always @ ( posedge sd_clk )//or posedge rst )	//delete
begin : FSM_SEQ
  	if ( rst )
  	begin
    		state <= #1 IDLE;
 		end
 		else
 		begin
    		state <= #1 next_state;
 		end
end
//---------------------------------
reg [4:0] 		crc_c;
reg [3:0] 		last_din;
reg [2:0] 		crc_s ;
reg [31:0] 		write_buf_0,write_buf_1, sd_data_out;
reg 					out_buff_ptr,in_buff_ptr;
reg [2:0] 		data_send_index;
//-----------------------------------------
always @ ( posedge sd_clk )//or posedge rst )	//from negedge to posedge
begin  : FSM_OUT
 		if( rst )
 		begin
				write_buf_0			<= 32'd0;
				write_buf_1			<= 32'd0;
				sd_data_out			<= 32'd0;
   			DAT_oe_o				<=	1'b0;
   			crc_en					<=	1'b0;
   			crc_rst					<=	1'b1;
   			transf_cnt			<= 11'b0;
   			crc_c						<= 5'd15;	//?
   			rd							<=	1'b0;
   			last_din				<=  4'd0;
   			//crc_c<=0;
   			crc_in					<=  4'd0;
   			DAT_dat_o				<=  4'd0;
   			crc_status			<=  3'd7;
   			crc_s						<=  3'd0;
   			transm_complete	<=  1'b0;
   			busy_n					<=  1'b1;
   			we							<=  1'b0;
   			data_out				<=  4'd0;
   			crc_ok					<=  1'b0;
   			busy_int				<=  1'b0;
     		data_send_index	<=  3'd0;
        out_buff_ptr		<=  1'b0;
        in_buff_ptr			<=  1'b0;
 		end
 		else
 		begin
 				case( state )
   			IDLE:
   			begin
      			DAT_oe_o				<=	1'b0;
      			DAT_dat_o				<=	4'b1111;
      			crc_en					<=	1'b0;
      			crc_rst					<=	1'b1;
      			transf_cnt			<=	11'b0;
      			crc_c						<=	5'd16;
      			crc_status			<=	3'd7;
      			crc_s						<=	3'd0;
      			we				  		<=	1'b0;
      			rd				  		<=	1'b0;
      			busy_n					<=	1'b1;
        		data_send_index	<=	3'd0;
        		out_buff_ptr		<=	1'b0;
        		in_buff_ptr			<=	1'b0;
   			end
   			WRITE_DAT:
   			begin
      			transm_complete <=#1 1'b0;
      			busy_n					<=#1 1'b0;
      			crc_ok					<=#1 1'b0;
      			transf_cnt 			<=#1 transf_cnt + 1'b1;
       			rd				 			<=#1 1'b0;
//-----------------------------------------------------------------------------------
      			if (( transf_cnt[3:0] == 4'b0 | transf_cnt[3:0] == 4'h8) &&( transf_cnt <= 10'd1023 ))
      			begin
        				rd <=#1 1'b1;
     				end
     				else
     				begin
     						rd	<=#1 1'b0;
     				end
//---------------------------
						sd_data_out <=#1  data_in;
//--------------------------
		        if ( transf_cnt == 11'b1 )
		        begin
          			crc_rst					<=#1	1'b0;
          			DAT_oe_o				<=#1	1'b1;
          			DAT_dat_o				<=#1	4'b0;
			          data_send_index	<=#1 	3'd0;
        		end
        		else if(( transf_cnt >= 11'd2 ) && ( transf_cnt <= `BIT_BLOCK - `CRC_OFF )) //2 to 1025
        		begin
        				data_send_index <=#1 data_send_index + 1;
        				if( transf_cnt == `BIT_BLOCK - `CRC_OFF )
        				begin crc_en					<=#1 1'b0; end
        				else begin crc_en					<=#1 1'b1;end
        				//
        				case( data_send_index )
        		    3'd0:begin DAT_dat_o <=#1 data_in[31:28];crc_in	<=#1 data_in[31:28];  end
        		    3'd1:begin DAT_dat_o <=#1 data_in[27:24];crc_in	<=#1 data_in[27:24];  end
        		    3'd2:begin DAT_dat_o <=#1 data_in[23:20];crc_in	<=#1 data_in[23:20];  end
        		    3'd3:begin DAT_dat_o <=#1 data_in[19:16];crc_in	<=#1 data_in[19:16];  end
        		    3'd4:begin DAT_dat_o <=#1 data_in[15:12];crc_in	<=#1 data_in[15:12];  end
        		    3'd5:begin DAT_dat_o <=#1 data_in[11:8]; crc_in	<=#1 data_in[11:8];   end
        		    3'd6:begin DAT_dat_o <=#1 data_in[7:4];  crc_in	<=#1 data_in[7:4];    end
        		    3'd7:begin DAT_dat_o <=#1 data_in[3:0];  crc_in	<=#1 data_in[3:0];    end
        		    endcase
        		end
        		//-----------------------
       			else if(( transf_cnt > `BIT_BLOCK-`CRC_OFF)&& ( crc_c!= 0 ))
       			begin
        				rd					 <=#1	1'b0;
         				crc_en			 <=#1	1'b0;
         				crc_c				 <=#1	crc_c	-	1'b1;
         				DAT_oe_o		 <=#1	1'b1;
         				DAT_dat_o[0] <=#1 crc_out[0][ crc_c - 1 ];
         				DAT_dat_o[1] <=#1 crc_out[1][ crc_c - 1 ];
         				DAT_dat_o[2] <=#1 crc_out[2][ crc_c - 1 ];
         				DAT_dat_o[3] <=#1 crc_out[3][ crc_c - 1 ];
       			end
       			else if ( transf_cnt == `BIT_BLOCK - 2 )
       			begin
          			DAT_oe_o	<=#1	1'b1;
          			DAT_dat_o	<=#1	4'b1111;
           			rd				<=#1	1'b0;
      			end
       			else if ( transf_cnt !=0 )
       			begin
         				DAT_oe_o	<=#1	1'b0;
         				rd				<=#1	1'b0;
         		end
   		  end
   			WRITE_CRC :
   			begin
      			rd				 <=	1'b0;
      			DAT_oe_o	 <=	1'b0;
      			crc_status <= crc_status - 1'b1;
      			if(( crc_status <= 3'd3) && ( crc_status >= 3'd1))
      					crc_s[crc_status-2] <= DAT_dat_i[0];
   			end
   			WRITE_BUSY :
   			begin
       			transm_complete <=	1'b1;
     				if (	crc_s == 3'b010 )
       					crc_ok	<=	1'b1;
     				else
       					crc_ok	<=	1'b0;
       			busy_int<=DAT_dat_i[0];
		  	end
   			READ_WAIT :
   			begin
      			DAT_oe_o				<=	1'b0;
      			crc_rst					<=	1'b0;
      			crc_in					<=	4'd0;
      			crc_c						<=	5'd15;// end
      			busy_n					<=	1'b0;
      			transm_complete	<=	1'b0;
   			end
   			READ_DAT:
   			begin
     				if (transf_cnt <= `BIT_BLOCK_REC  )
     				begin


       					data_out 				<= DAT_dat_i;
       					crc_in	 				<= DAT_dat_i;
       					crc_ok	 				<= 1'b1;
       					transf_cnt			<=	transf_cnt	+	1'b1;
       					if( transf_cnt >= `BIT_BLOCK_REC - 1 )
       					begin
       							crc_en					<=	1'b0;
       					end
       					else
       					begin
       							crc_en					<=	1'b1;
       					end
       				if( transf_cnt == `BIT_BLOCK_REC  )
       				begin
       						we			 		<=	1'b0;
       						last_din 		<=	DAT_dat_i;
       				end
       				else
       				begin
       						we			 				<=	1'b1;
       				end

     				end
     				else if( transf_cnt <= (`BIT_BLOCK_REC +`BIT_CRC_CYCLE ))
     				begin
       					transf_cnt	<=	transf_cnt	+	1'b1;
       					crc_en			<=	1'b0;
       					last_din 		<=	DAT_dat_i;
       					if( transf_cnt > `BIT_BLOCK_REC )
       					begin
        						crc_c		<=	crc_c	-	1'b1;
          					we			<=	1'b0;
        						`ifdef SD_BUS_WIDTH_1
         							if  ( crc_out[0][crc_status] == last_din[0] )
           							crc_ok	<=	1'b0;
        						`endif

       							`ifdef SD_BUS_WIDTH_4
       							  if  (crc_out[0][crc_c] != last_din[0])
       							    	crc_ok	<=	1'b0;
       							  if  (crc_out[1][crc_c] != last_din[1])
       							    	crc_ok	<= 1'b0;
       							  if  (crc_out[2][crc_c] != last_din[2])
       							    	crc_ok	<= 1'b0;
       							  if  (crc_out[3][crc_c] != last_din[3])
       							  	  crc_ok	<= 1'b0;
						        `endif
         						`ifdef SIM
          						crc_ok	<=	1;
       							`endif
         						if ( crc_c	== 5'd0 )
         						begin
          							transm_complete <= 1'b1;
          							busy_n					<= 1'b0;
           							we							<= 1'b0;
         						end
      					end
    				end
  			end
 				endcase
		end
end
//Sync
endmodule




