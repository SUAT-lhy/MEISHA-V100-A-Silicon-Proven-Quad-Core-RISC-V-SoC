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
module SD_CMD_MASTER
			(
			input 						 CLK_PAD_IO,
			input 						 RST_PAD_I,
			input 						 New_CMD,
			input 						 data_write,
			input 						 data_read,
			input [31:0]			 ARG_REG,
			input [15:0]			 CMD_SET_REG,
			input [15:0] 			 TIMEOUT_REG,
			output reg [15:0]  STATUS_REG,
			output reg [31:0]  RESP_1_REG,
			output reg [4:0] 	 ERR_INT_REG,
			output reg [15:0]  NORMAL_INT_REG,
			input 						 ERR_INT_RST,
			input 						 NORMAL_INT_RST,
			output reg [15:0]  settings,
			output reg 				 go_idle_o,
			output reg  [39:0] cmd_out,
			output reg 				 req_out,
			output reg 				 ack_out,
			input 						 req_in,
			input 						 ack_in,
			input [39:0] 			 cmd_in,
			input [7:0] 			 serial_status
			);
////////////////////////////////////////////
`define dat_ava 		status[6]
`define crc_valid 	status[5]
`define small_rsp 	7'b0101000
`define big_rsp 		7'b1111111

`define CMDI 				CMD_SET_REG[13:8]						//command index
`define WORD_SELECT CMD_SET_REG[7:6]
`define CICE 				CMD_SET_REG[4]
`define CRCE 				CMD_SET_REG[3]
`define RTS 				CMD_SET_REG[1:0]
`define CTE 				ERR_INT_REG[0]
`define CCRCE 			ERR_INT_REG[1]
`define CIE  				ERR_INT_REG[3]
`define EI 					NORMAL_INT_REG[15]
`define CC  				NORMAL_INT_REG[0]
`define CICMD 			STATUS_REG[0]
//-----------Types---------------------------
reg 								CRC_check_enable;
reg 								index_check_enable;
reg [6:0]						response_size;
reg [7:0]						status;
reg [15:0]  				Watchdog_Cnt;
reg 								complete;
parameter 					SIZE = 3;
reg [SIZE-1:0]			state;
reg [SIZE-1:0]			next_state;
//-----------------------------------------
parameter 					IDLE   		=  3'b001;
parameter 					SETUP   	=  3'b010;
parameter 					EXECUTE  	=  3'b100;
//---------------Input ports---------------
reg 								ack_in_int;
reg 								ack_q;
reg 								req_q;
reg 								req_in_int;
///////////////////////////////////////////////////
always @ ( posedge CLK_PAD_IO or posedge RST_PAD_I )
begin
  	if ( RST_PAD_I )
  	begin
    		req_q 			<= 1'b0;
    		req_in_int 	<= 1'b0;
 		end
		else
		begin
  			req_q 			<= req_in;
  			req_in_int 	<= req_q;
		end
end
////////////////////////////////////////////////////
always @ (posedge CLK_PAD_IO or posedge RST_PAD_I   )
begin
  	if ( RST_PAD_I )
  	begin
    		ack_q 			<= 1'b0;
    		ack_in_int 	<= 1'b0;
 		end
		else
		begin
  			ack_q 			<= ack_in;
  			ack_in_int 	<= ack_q;
		end
end
//////////////////////////////////////////////////////////
always @ ( state or New_CMD
				or complete or ack_in_int
				)
begin : FSM_COMBO
    next_state = 0;
 		case( state )
 		IDLE:
 		begin
      	if ( New_CMD ) //triger signal from configure register
      	begin
          	next_state = SETUP;
      	end
      	else
      	begin
         		next_state = IDLE;
      	end
 		end
/////////////////////////////////////////////////////////
 		SETUP:
 		begin
    		if ( ack_in_int )
       		next_state = EXECUTE;
     		else
       		next_state = SETUP;
   	end
/////////////////////////////////////////////////////////
 		EXECUTE:
 		begin
       	if ( complete )
       	begin
          	next_state = IDLE;
      	end
      	else
      	begin
         		next_state = EXECUTE;
      	end
 		end
 		default : next_state  = IDLE;
		endcase

end
/////////////////////////////////////////////////////////
always @ (posedge CLK_PAD_IO or posedge RST_PAD_I   )
begin : FSM_SEQ
  	if (RST_PAD_I )
  	begin
    		state <= #1 IDLE;
 		end
 		else
 		begin
    		state <= #1 next_state;
 		end
end
////////////////////////////////////////////////////////////
always @ (posedge CLK_PAD_IO or posedge RST_PAD_I   )
begin
 		if ( RST_PAD_I )
 		begin
    		CRC_check_enable 		<= 1'b0;
    		complete 						<= 1'b0;
    		RESP_1_REG 					<= 32'b0;
    		ERR_INT_REG 				<= 5'b0;
    		NORMAL_INT_REG 			<= 16'b0;
    		STATUS_REG 					<= 16'b0;
    		status 							<= 8'b0;
    		cmd_out 						<= 40'b0;
    		settings 						<= 16'b0;
    		response_size 			<= 7'b0;
    		req_out 						<= 1'b0;
    		index_check_enable 	<= 1'b0;
    		ack_out 						<= 1'b0;
    		Watchdog_Cnt 				<= 16'b0;
    		`CCRCE 							<= 1'b0;
    		`EI 								<= 1'b0;
    		`CC 								<= 1'b0;
    		 go_idle_o 					<= 1'b0;
 		end
 		else
 		begin
 				complete <= 1'b0;
 				case( state )
 				IDLE:
 				begin
 				   	go_idle_o	<= 1'b0;
 				   	req_out 	<= 1'b0;
						ack_out 	<= 1'b0;
						`CICMD 		<= 1'b0;
 				   	if ( req_in_int == 1'b1 )
 				   	begin//Status change
 				       	status 						<= serial_status;
 				       	ack_out 					<= 1'b1;
 				       	STATUS_REG[15:12] <= serial_status[3:0];
 				   	end
 				end
 				SETUP:
 				begin
 				    NORMAL_INT_REG 			<= 16'b0;
 				    ERR_INT_REG 				<= 5'b0;
 				    STATUS_REG 					<= 16'b0;
 				    index_check_enable 	<= `CICE;
 				    CRC_check_enable 	 	<= `CRCE;
 				   	if (( `RTS  == 2'b10 ) || ( `RTS == 2'b11 ))
 				   	begin
 				     		response_size <= 7'd40;	//  7'b0101000;//40 bit
 				     		settings[6:0] <= 7'd40;
 				   	end
 				   	else if ( `RTS == 2'b01 )
 				   	begin
 				     		response_size <= 7'd127;	//7'b1111111;	//127
 				     		settings[6:0] <= 7'd127;
 				   	end
 				   	else
 				   	begin
 				      	response_size <= 7'd0;
								settings[6:0] <= 7'd0;
 				   	end
 						//
 				    cmd_out[39:38]  <= 2'b01;
 				    cmd_out[37:32]  <= `CMDI;  						//CMD_INDEX
 				    cmd_out[31:0]   <= ARG_REG;           //CMD_Argument
 				    settings[14:13] <= `WORD_SELECT;      //Reserved
 				    settings[12] 	  <= data_read; 				//Type of command
 				    settings[11] 	  <= data_write;
 				    settings[10:8]  <= 3'd7;            //Delay
 				    settings[7] 	  <= `CRCE;         		//CRC-check
 				    //settings[6:0]	  <= response_size;   	//response size have some issues
 				    Watchdog_Cnt 	  <= 16'b0;
 				   `CICMD 				  <= 1'b1;
 				end
////////////////////////////////////////////
 				EXECUTE:
 				begin
 				   	Watchdog_Cnt <= Watchdog_Cnt + 1'b1;
 				   	if ( Watchdog_Cnt > TIMEOUT_REG )
 				   	begin
 				     		`CTE <= 1'b1;
 				     		`EI  <=	1'b1;
 				     		if ( ack_in == 1'b1 )
 				     		begin
 				        		complete <= 1'b1;
 				     		end
 				     		go_idle_o <= 1'b1;
 				   	end
 				   	//Default
 				   	req_out <= 1'b0;
					 	ack_out <= 1'b0;

 				   //Start sending when serial module is ready
 				  	if ( ack_in_int == 1'b1 )
 				  	begin
					    	req_out <= 1'b1;
					  end
					   //Incoming New Status
					  else if ( req_in_int == 1'b1 )
					  begin
 				       	status						<=	serial_status;
 				       	STATUS_REG[15:12] <= serial_status[3:0];
 				       	ack_out 					<= 1'b1;
 				       	if ( `dat_ava )
 				       	begin //Data avaible
 				          	complete 	<= 1'b1;
 				           `EI 				<= 1'b0;
	 				          if (	CRC_check_enable & ~`crc_valid	)
	 				          begin
 				           			`CCRCE	<= 1'b1;
 				           			`EI 		<= 1'b1;
	 				          end
//////////////////////////////////////////////////////////////////////////////////////
 				          	if (index_check_enable & ( cmd_out[37:32] != cmd_in [37:32]))
 				          	begin
 				           			`CIE 		<= 1'b1;
 				           			`EI  		<= 1'b1;
	 				          end
 				            `CC 				<= 1'b1;
 				            if ( response_size != 7'b0 )
 					             RESP_1_REG <= cmd_in[31:0];
 						         // end
 				        end //Data avaible
 				    end //Status change
 				end //EXECUTE state
 				endcase
//-------------------------- 				
 				if (ERR_INT_RST)
 				  	ERR_INT_REG <= 5'b0;
////////////////////////////////////////////////////////
 				if (NORMAL_INT_RST)
 				  	NORMAL_INT_REG <= 16'b0;
 				end
end

endmodule
