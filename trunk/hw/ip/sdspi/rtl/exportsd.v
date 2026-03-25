////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	sdio_top.v
// {{{
// Project:	SDIO SD-Card controller
//
// Purpose:	A top level file for both eMMC and SDIO controllers.  This
//		file references both architecture specific modules in
//	sdfrontend.v, and non-architecture specific logic via sdio.v.
//	Otherwise, the top level (non-architecture specific) module would be
//	sdio.v.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2016-2023, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`timescale 1ns/1ps
`default_nettype none
// }}}
module sdio_top #(
		// {{{
		parameter	LGFIFO = 12, NUMIO=4, MW=32,
		parameter [0:0]	OPT_EMMC=1,
		parameter [0:0]	OPT_SERDES=0,
		parameter [0:0]	OPT_DDR=1,
		parameter [0:0]	OPT_DS=OPT_SERDES && OPT_EMMC,
		parameter [0:0]	OPT_CARD_DETECT=!OPT_EMMC,
		parameter [0:0]	OPT_1P8V=1,
		parameter	LGTIMEOUT = 23
		// }}}
	) (
		// {{{
		input	wire			i_clk, i_reset, i_hsclk,
		// Control (Wishbone) interface
		// {{{
		input	wire		i_wb_cyc, i_wb_stb, i_wb_we,
		input	wire	[2:0]	i_wb_addr,
		input	wire [MW-1:0]	i_wb_data,
		input	wire [MW/8-1:0]	i_wb_sel,
		//
		output	wire		o_wb_stall, o_wb_ack,
		output	wire [MW-1:0]	o_wb_data,
		// }}}
		// IO interface
		// {{{
		output	wire			o_ck,
		input	wire			i_ds,
`ifdef	VERILATOR
		output	wire			io_cmd_tristate,
		output	wire			o_cmd,
		input	wire			i_cmd,
		//
		output	wire	[NUMIO-1:0]	io_dat_tristate,
		output	wire	[NUMIO-1:0]	o_dat,
		input	wire	[NUMIO-1:0]	i_dat,
`else
		inout	wire			io_cmd,
		inout	wire	[NUMIO-1:0]	io_dat,
`endif
		// }}}
		input	wire		i_card_detect,
		output	wire		o_1p8v,
		output	wire		o_int,
		output	wire	[31:0]	o_debug
		// }}}
	);

	// Local declarations
	// {{{
	wire		cfg_ddr, cfg_ds, cfg_dscmd;
	wire	[4:0]	cfg_sample_shift;
	wire	[7:0]	sdclk;
		//
	wire		cmd_en, pp_cmd;
	wire	[1:0]	cmd_data;
		//
	wire		data_en, pp_data, rx_en;
	wire	[31:0]	tx_data;
		//
	wire	[1:0]	rply_strb, rply_data;
	wire		card_busy;
	wire	[1:0]	rx_strb;
	wire	[15:0]	rx_data;
		//
	wire		AC_VALID;
	wire	[1:0]	AC_DATA;
	wire		AD_VALID;
	wire	[31:0]	AD_DATA;
	// }}}

	sdio #(
		// {{{
		.LGFIFO(LGFIFO), .NUMIO(NUMIO), .MW(MW),
		.OPT_DDR(OPT_DDR), .OPT_SERDES(OPT_SERDES),
		.OPT_DS(OPT_DS),
		.OPT_CARD_DETECT(OPT_CARD_DETECT),
		.OPT_EMMC(OPT_EMMC),
		.OPT_1P8V(OPT_1P8V),
		.LGTIMEOUT(LGTIMEOUT)
		// }}}
	) u_sdio (
		// {{{
		.i_clk(i_clk), .i_reset(i_reset),
		// Control (Wishbone) interface
		// {{{
		.i_wb_cyc(i_wb_cyc), .i_wb_stb(i_wb_stb), .i_wb_we(i_wb_we),
		.i_wb_addr(i_wb_addr),.i_wb_data(i_wb_data),.i_wb_sel(i_wb_sel),
		//
		.o_wb_stall(o_wb_stall), .o_wb_ack(o_wb_ack),
		.o_wb_data(o_wb_data),
		// }}}
		.i_card_detect(i_card_detect),
		.o_1p8v(o_1p8v),
		.o_int(o_int),
		// Interface to PHY
		// {{{
		.o_cfg_ddr(cfg_ddr), .o_cfg_ds(cfg_ds), .o_cfg_dscmd(cfg_dscmd),
		.o_cfg_sample_shift(cfg_sample_shift),
		.o_sdclk(sdclk),
		//
		.o_cmd_en(cmd_en), .o_pp_cmd(pp_cmd),
		.o_cmd_data(cmd_data),
		//
		.o_data_en(data_en), .o_rx_en(rx_en), .o_pp_data(pp_data),
		.o_tx_data(tx_data),
		//
		.i_cmd_strb(rply_strb), .i_cmd_data(rply_data),
		.i_card_busy(card_busy),
		.i_rx_strb(rx_strb),
		.i_rx_data(rx_data),
		//
		.S_AC_VALID(AC_VALID), .S_AC_DATA(AC_DATA),
		.S_AD_VALID(AD_VALID), .S_AD_DATA(AD_DATA)
		// }}}
		// }}}
	);

	sdfrontend #(
		.OPT_SERDES(OPT_SERDES), .OPT_DDR(OPT_DDR), .NUMIO(NUMIO),
		.OPT_DS(OPT_DS)
	) u_sdfrontend (
		// {{{
		.i_clk(i_clk), .i_hsclk(i_hsclk), .i_reset(i_reset),
		.i_cfg_ddr(cfg_ddr), .i_cfg_ds(cfg_ds), .i_cfg_dscmd(cfg_dscmd),
		.i_sample_shift(cfg_sample_shift),
		// Tx path
		// {{{
		// MSB "first" incoming data.
		.i_sdclk(sdclk),
		//
		.i_cmd_en(cmd_en), .i_pp_cmd(pp_cmd), .i_cmd_data(cmd_data),				.o_data_busy(card_busy),
		//
		.i_data_en(data_en), .i_pp_data(pp_data), .i_tx_data(tx_data),
		// }}}
		// Synchronous Rx path
		// {{{
		.i_rx_en(rx_en),
		.o_cmd_strb(rply_strb),
		.o_cmd_data(rply_data),
		//
		.o_rx_strb(rx_strb),
		.o_rx_data(rx_data),
		// }}}
		// Async Rx path
		// {{{
		.MAC_VALID(AC_VALID), .MAC_DATA(AC_DATA),
		.MAD_VALID(AD_VALID), .MAD_DATA(AD_DATA),
		// }}}
		// I/O ports
		// {{{
		.o_ck(o_ck), .i_ds(i_ds),
`ifdef	VERILATOR
		.io_cmd_tristate(io_cmd_tristate),
		.o_cmd(o_cmd), .i_cmd(i_cmd),
		//
		.io_dat_tristate(io_dat_tristate),
		.o_dat(o_dat), .i_dat(i_dat),
`else
		.io_cmd(io_cmd),
		.io_dat(io_dat),
`endif
		// }}}
		.o_debug(o_debug)
		// }}}
	);

endmodule
////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	sdfrontend.v
// {{{
// Project:	SDIO SD-Card controller
//
// Purpose:	This is the "front-end" for the SDIO controller.  It's designed
//		to support all modes up to HS400 if OPT_SERDES is enabled,
//	or just the backwards compatibility modes (up to 50MHz) if not.
//
// Status:
//	OPT_DDR=0	(Without IDDR and ODDR hardware elements)
//		Verified in H/W for 1, 4, and 8b.  (Not yet for DDR)
//		No support for data strobe.
//	OPT_DDR=1	(With IDDR/ODDR hardware elements, but no SERDES)
//		Verified in H/W for 1 and 4b.  (Not yet for DDR, not yet for 8b)
//		No support for data strobe.
//	OPT_SERDES=1
//		NOT YET VERIFIED IN H/W
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2023, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`timescale		1ns / 1ps
`default_nettype	none
// }}}
module	sdfrontend #(
		// {{{
		parameter [0:0]	OPT_SERDES = 1'b0,
		parameter [0:0]	OPT_DDR = 1'b0,
		parameter [0:0]	OPT_DS = OPT_SERDES,
		parameter	NUMIO = 8
		// }}}
	) (
		// {{{
		input	wire		i_clk, i_hsclk,
		// Configuration
		input	wire		i_reset,
		input	wire		i_cfg_ddr,
		input	wire		i_cfg_ds, i_cfg_dscmd,
		input	wire	[4:0]	i_sample_shift,
		// Control signals
		// Tx path
		// {{{
		// MSB "first" incoming data.
		input	wire	[7:0]	i_sdclk,
		// Verilator lint_off SYNCASYNCNET
		input	wire		i_cmd_en,
		// Verilator lint_on  SYNCASYNCNET
		input	wire		i_pp_cmd,	// Push/pull cmd lines
		input	wire	[1:0]	i_cmd_data,
		//
		input	wire		i_data_en, i_rx_en,
		input	wire		i_pp_data,	// Push/pull data lines
		input	wire	[31:0]	i_tx_data,
		// }}}
		output	wire		o_data_busy,
		// Synchronous Rx path
		// {{{
		output	wire	[1:0]	o_cmd_strb,
		output	wire	[1:0]	o_cmd_data,
		//
		output	wire	[1:0]	o_rx_strb,
		output	wire	[15:0]	o_rx_data,
		// }}}
		// Async Rx path
		// {{{
		output	wire		MAC_VALID,
		output	wire	[1:0]	MAC_DATA,
		output	wire		MAD_VALID,
		output	wire	[31:0]	MAD_DATA,
		// output	wire		MAD_LAST,
		// }}}
		// I/O ports
		// {{{
		output	wire			o_ck,
		input	wire			i_ds,
		//
`ifdef	VERILATOR
		output	wire			io_cmd_tristate,
		output	wire			o_cmd,
		input	wire			i_cmd,
		//
		output	wire	[NUMIO-1:0]	io_dat_tristate,
		output	wire	[NUMIO-1:0]	o_dat,
		input	wire	[NUMIO-1:0]	i_dat,
`else
		inout	wire			io_cmd,
		inout	wire	[NUMIO-1:0]	io_dat,
`endif
		// }}}
		output	wire	[31:0]	o_debug
		// }}}
	);

	// Local declarations
	// {{{
	genvar		gk;
	reg		dat0_busy, wait_for_busy;
	wire		raw_cmd;
	wire	[NUMIO-1:0]	raw_iodat;
`ifndef	VERILATOR
	wire			io_cmd_tristate, i_cmd, o_cmd;
	wire	[NUMIO-1:0]	io_dat_tristate, i_dat, o_dat;
`endif
	// }}}
	generate if (!OPT_SERDES && !OPT_DDR)
	begin : GEN_NO_SERDES
		// {{{
		// This is sort of the "No-PHY" option.  Maximum speed, when
		// using this option, is the incoming clock speed/2.  Without
		// SERDES support, there's no support for the DS (data strobe)
		// pin either.  Think of this as a compatibility mode.
		//
		// Fastest clock supported = incoming clock speed / 2
		//
		wire		next_pedge, next_dedge;
		reg		resp_started, io_started, last_ck;
		reg		r_cmd_data, r_cmd_strb, r_rx_strb;
		reg	[7:0]	r_rx_data;
		reg	[1:0]	ck_sreg, pck_sreg, ck_psreg;
		reg		sample_ck, cmd_sample_ck, sample_pck;

		assign	o_ck = i_sdclk[7];

		assign	io_cmd_tristate
				= !(i_cmd_en && (i_pp_cmd || !i_cmd_data[1]));
		assign	o_cmd = i_cmd_data[1];
		assign	raw_cmd = i_cmd;

		// assign	io_cmd = (io_cmd_tristate) ? i_cmd : o_cmd;


		assign	o_dat = i_tx_data[24 +: NUMIO];

		for(gk=0; gk<NUMIO; gk=gk+1)
		begin : FOREACH_IO
			assign	io_dat_tristate[gk] = !(i_data_en
					&& (i_pp_data || !i_tx_data[24+gk]));
		end

		// assign	io_dat = (o_dat & ~io_dat_tristate)
		//		| (i_dat & io_dat_tristate);

		assign	next_pedge = !last_ck && i_sdclk[7];
		assign	next_dedge = next_pedge || (i_cfg_ddr
					&& last_ck && !i_sdclk[7]);

		always @(posedge i_clk)
			last_ck <= i_sdclk[7];

		// sample_ck
		// {{{
		initial	ck_sreg = 0;
		always @(posedge i_clk)
		if (i_reset || i_data_en)
			ck_sreg <= 0;
		else
			ck_sreg <= { ck_sreg[0], next_dedge };

		initial	sample_ck = 0;
		always @(*)
		if (i_data_en)
			sample_ck = 0;
		else
			// Verilator lint_off WIDTH
			sample_ck = { ck_sreg[1:0], next_dedge } >> i_sample_shift[4:3];
			// Verilator lint_on  WIDTH
		// }}}

		// sample_pck
		// {{{
		initial	ck_sreg = 0;
		always @(posedge i_clk)
		if (i_reset || i_data_en)
			ck_psreg <= 0;
		else
			ck_psreg <= { ck_sreg[0], next_pedge };

		initial	sample_ck = 0;
		always @(*)
		if (i_data_en)
			sample_pck = 0;
		else
			// Verilator lint_off WIDTH
			sample_pck = { ck_psreg[1:0],next_pedge } >> i_sample_shift[4:3];
			// Verilator lint_on  WIDTH
		// }}}

		// cmd_sample_ck: When do we sample the command line?
		// {{{
		always @(posedge i_clk)
		if (i_reset || i_cmd_en || i_cfg_dscmd)
			pck_sreg <= 0;
		else
			pck_sreg <= { pck_sreg[0], next_pedge };

		always @(*)
		if (i_cmd_en)
			cmd_sample_ck = 0;
		else
			// Verilator lint_off WIDTH
			cmd_sample_ck = { pck_sreg[1:0], next_pedge } >> i_sample_shift;
			// Verilator lint_on  WIDTH
		// }}}

		assign	raw_iodat = i_dat;

		always @(posedge i_clk)
		if (i_reset || i_cmd_en || i_cfg_dscmd)
			resp_started <= 1'b0;
		else if (!i_cmd && cmd_sample_ck)
			resp_started <= 1'b1;

		always @(posedge i_clk)
		if (i_reset || i_data_en || !i_rx_en || i_cfg_ds)
			io_started <= 1'b0;
		else if (!i_dat[0] && sample_pck)
			io_started <= 1'b1;

		// dat0_busy, wait_for_busy
		// {{{
		initial	{ dat0_busy, wait_for_busy } = 2'b01;
		always @(posedge i_clk)
		if (i_reset || i_cmd_en || i_data_en)
		begin
			dat0_busy <= 1'b0;
			wait_for_busy <= 1'b1;
		end else if (wait_for_busy && !i_dat[0])
		begin
			dat0_busy <= 1'b1;
			wait_for_busy <= 1'b0;
		end else if (!wait_for_busy && i_dat[0])
			dat0_busy <= 1'b0;

		assign	o_data_busy = dat0_busy;
		// }}}

		initial	last_ck = 1'b0;
		always @(posedge i_clk)
		begin
			last_ck <= i_sdclk[7];

			if (i_cmd_en || !cmd_sample_ck || i_cfg_dscmd)
				r_cmd_strb <= 1'b0;
			else if (!i_cmd || resp_started)
				r_cmd_strb <= 1'b1;
			else
				r_cmd_strb <= 1'b0;

			if (i_data_en || sample_ck == 0 || i_cfg_ds)
				r_rx_strb <= 1'b0;
			else if (io_started)
				r_rx_strb <= 1'b1;
			else
				r_rx_strb <= 1'b0;

			if (cmd_sample_ck)
				r_cmd_data <= i_cmd;
			if (sample_ck)
			begin
				r_rx_data <= 0;
				r_rx_data[NUMIO-1:0] <= i_dat;
			end
		end

		assign	o_cmd_strb = { r_cmd_strb, 1'b0 };
		assign	o_cmd_data = { r_cmd_data, 1'b0 };
		assign	o_rx_strb  = { r_rx_strb, 1'b0 };
		assign	o_rx_data  = { r_rx_data, 8'h0 };

		reg	[7:0]	w_out;
		always @(*)
		begin
			w_out = 0;
			w_out[NUMIO-1:0] = i_dat;
		end

		assign	o_debug = {
				i_cmd_en || i_data_en,
				5'h0,
				i_sdclk[7], 1'b0,
				i_cmd_en, i_cmd_data[1], i_cmd,
					(io_cmd_tristate) ? i_cmd: o_cmd,//w_cmd
					r_cmd_strb, r_cmd_data,		// 2b
				i_data_en, r_rx_strb, r_rx_data,	// 10b
				//
				((i_data_en) ? i_tx_data[31:24] : w_out) // 8b
				};

		// Keep Verilator happy
		// {{{
		// Verilator coverage_off
		// Verilator lint_off UNUSED
		wire	unused_no_serdes;
		assign	unused_no_serdes = &{ 1'b0,
				i_cfg_ds, i_ds,
				i_sdclk[6:0], i_tx_data[23:0],
				i_cmd_data[0], i_hsclk,i_sample_shift
				};
		// Verilator lint_on  UNUSED
		// Verilator coverage_on
		// }}}
		// }}}
	end else if (!OPT_SERDES && OPT_DDR)
	begin : GEN_IODDR_IO
		// {{{
		// Notes:
		// {{{
		// The idea is, if we only have DDR elements and no SERDES
		// elements, can we do better than with just IOs?
		//
		// The answer is, Yes.  Even though we aren't going to run at
		// 2x the clock speed w/o OPT_SERDES, we can output a DDR clk,
		// and we can also access sub-sample timing via IDDR elements.
		// Even in DDR mode, however, there will be no possibility of
		// two outputs per clock.
		//
		// Fastest clock supported = incoming clock speed
		//	Practically, you won't be likely to achieve this unless
		//	you get really lucky, but it is technically the fastest
		//	speed this version supports.
		// A more realistic speed will be the incoming clock speed / 2,
		//	and done with more reliability than the non-DDR mode.
		// }}}

		// Local declarations
		// {{{
		wire	[1:0]	w_cmd;
		wire		pre_dat	[15:0];
		reg	[15:0]	w_dat;
		wire	[1:0]	next_pedge, next_dedge;

		reg	[5:0]	ck_sreg, pck_sreg, ck_psreg;
		reg	[1:0]	sample_ck, cmd_sample_ck, sample_pck;
		reg		resp_started, last_ck, r_last_cmd_enabled,
				r_cmd_strb, r_cmd_data, r_rx_strb;
		reg	[1:0]	io_started;
		reg	[7:0]	r_rx_data;
		// Verilator lint_off UNUSED
		wire		io_clk_tristate, ign_clk;
		assign		ign_clk = o_ck;
		// Verilator lint_on  UNUSED
		// }}}

		// Clock
		// {{{
		xsdddr #(.OPT_BIDIR(1'b0))
		u_clk_oddr(
			.i_clk(i_clk), .i_en(1'b1),
			.i_data({ i_sdclk[7], i_sdclk[3] }),
			.io_pin_tristate(io_clk_tristate),
			.o_pin(o_ck),
			.i_pin(ign_clk),
			// Verilator lint_off PINCONNECTEMPTY
			.o_wide()
			// Verilator lint_on  PINCONNECTEMPTY
		);
		// }}}

		// CMD
		// {{{
		always @(posedge i_clk)
			r_last_cmd_enabled <= i_cmd_en && i_pp_cmd;

		xsdddr #(.OPT_BIDIR(1'b1))
		u_cmd_ddr(
			.i_clk(i_clk),
			.i_en(i_reset || r_last_cmd_enabled || (i_cmd_en && (i_pp_cmd || !i_cmd_data[1]))),
			.i_data({(2){ i_reset || i_cmd_data[1] }}),
			.io_pin_tristate(io_cmd_tristate),
			.o_pin(o_cmd),
			.i_pin(i_cmd),
			.o_wide(w_cmd)
		);

		assign	raw_cmd = i_cmd;
		// }}}

		// DATA
		// {{{
		for(gk=0; gk<NUMIO; gk=gk+1)
		begin : DRIVE_DDR_IO
			wire	enable;

			assign	enable = i_reset || (i_data_en && (i_pp_data
						|| !i_tx_data[24+gk]));
			xsdddr #(.OPT_BIDIR(1'b1))
			u_dat_ddr(
				.i_clk(i_clk),
				.i_en(enable),
				.i_data({(2){ i_reset || i_tx_data[24+gk] }}),
				.io_pin_tristate(io_dat_tristate[gk]),
				.o_pin(o_dat[gk]),
				.i_pin(i_dat[gk]),
				.o_wide({ pre_dat[gk+8], pre_dat[gk] })
			);

			assign	raw_iodat[gk] = i_dat[gk];

		end for(gk=NUMIO; gk<8; gk=gk+1)
		begin : NO_DDR_IO
			assign	{ pre_dat[8+gk], pre_dat[gk] } = 2'b00;
		end


		integer	ipre;
		always @(*)
		begin
			for(ipre=0; ipre<16; ipre=ipre+1)
				w_dat[ipre] = pre_dat[ipre];
		end
		// }}}

		assign	next_pedge = { !last_ck && i_sdclk[7],
				!i_sdclk[7] && i_sdclk[3] };
		assign	next_dedge = next_pedge | (!i_cfg_ddr ? 2'b00
			: {last_ck && !i_sdclk[7], i_sdclk[7] && !i_sdclk[3]});

		// sample_ck
		// {{{
		initial	ck_sreg = 0;
		always @(posedge i_clk)
		if (i_data_en || i_cfg_ds)
			ck_sreg <= 0;
		else
			ck_sreg <= { ck_sreg[3:0], next_dedge };

		initial	sample_ck = 0;
		always @(*)
		if (i_data_en || !i_rx_en || i_cfg_ds)
			sample_ck = 0;
		else
			// Verilator lint_off WIDTH
			sample_ck = { ck_sreg[5:0], next_dedge } >> i_sample_shift[4:2];
			// Verilator lint_on  WIDTH
		// }}}

		// sample_pck -- positive edge data sampl clock
		// {{{
		initial	ck_sreg = 0;
		always @(posedge i_clk)
		if (i_data_en || i_cfg_ds)
			ck_psreg <= 0;
		else
			ck_psreg <= { ck_psreg[3:0], next_pedge };

		initial	sample_ck = 0;
		always @(*)
		if (i_data_en || !i_rx_en || i_cfg_ds)
			sample_pck = 0;
		else
			// Verilator lint_off WIDTH
			sample_pck = { ck_psreg[5:0], next_pedge } >> i_sample_shift[4:2];
			// Verilator lint_on  WIDTH
		// }}}

		// cmd_sample_ck: When do we sample the command line?
		// {{{
		always @(posedge i_clk)
		if (i_reset || i_cmd_en || r_last_cmd_enabled || i_cfg_dscmd)
			pck_sreg <= 0;
		else
			pck_sreg <= { pck_sreg[3:0], next_pedge };

		always @(*)
		if (i_cmd_en || r_last_cmd_enabled || i_cfg_dscmd)
			cmd_sample_ck = 0;
		else
			// Verilator lint_off WIDTH
			cmd_sample_ck = { pck_sreg[5:0], next_pedge } >> i_sample_shift[4:2];
			// Verilator lint_on  WIDTH
		// }}}

		always @(posedge i_clk)
		if (i_reset || i_cmd_en || r_last_cmd_enabled || i_cfg_dscmd)
			resp_started <= 1'b0;
		else if ((cmd_sample_ck != 0) && (cmd_sample_ck & w_cmd)==0)
			resp_started <= 1'b1;

		always @(posedge i_clk)
		if (i_reset || i_data_en || !i_rx_en || i_cfg_ds)
			io_started <= 2'b0;
		else if (sample_pck != 0
				&& ((sample_pck & { w_dat[8], w_dat[0] }) == 0))
		begin
			io_started[0] <= 1'b1;
			if (!i_cfg_ddr)
				io_started[1] <= 1'b1;
			else if (sample_pck[1] && sample_ck[0])
				io_started[1] <= 1'b1;
		end else if (io_started == 2'b01 && sample_ck != 0)
			io_started <= 2'b11;

		// dat0_busy, wait_for_busy
		// {{{
		initial	{ dat0_busy, wait_for_busy } = 2'b01;
		always @(posedge i_clk)
		if (i_cmd_en || i_data_en)
		begin
			dat0_busy <= 1'b0;
			wait_for_busy <= 1'b1;
		end else if (wait_for_busy && (cmd_sample_ck != 0)
				&& (cmd_sample_ck & {w_dat[8],w_dat[0]})==2'b0)
		begin
			dat0_busy <= 1'b1;
			wait_for_busy <= 1'b0;
		end else if (!wait_for_busy && (cmd_sample_ck != 0)
				&& (cmd_sample_ck & {w_dat[8],w_dat[0]})!=2'b0)
			dat0_busy <= 1'b0;

		assign	o_data_busy = dat0_busy;
		// }}}

		initial	last_ck = 1'b0;
		always @(posedge i_clk)
		begin
			last_ck <= i_sdclk[3];

			// The command response
			// {{{
			if (i_reset || i_cmd_en || cmd_sample_ck == 0 || i_cfg_dscmd)
			begin
				r_cmd_strb <= 1'b0;
				// r_cmd_data <= r_cmd_data;
			end else if (resp_started)
			begin
				r_cmd_strb <= 1'b1;
				r_cmd_data <= |(cmd_sample_ck & w_cmd);
			end else if ((cmd_sample_ck[1] && !w_cmd[1])
					||(cmd_sample_ck[0] && !w_cmd[0]))
			begin
				r_cmd_strb <= 1'b1;
				r_cmd_data <= 1'b0;
			end else
				r_cmd_strb <= 1'b0;
			// }}}

			// The data response
			// {{{
			if (i_data_en || sample_ck == 0 || i_cfg_ds)
				r_rx_strb <= 1'b0;
			else if (io_started[1])
				r_rx_strb <= 1'b1;
			else
				r_rx_strb <= 1'b0;
			// }}}

			if (sample_ck[1])
				r_rx_data <= w_dat[15:8];
			else
				r_rx_data <= w_dat[7:0];
		end

		assign	o_cmd_strb = { r_cmd_strb, 1'b0 };
		assign	o_cmd_data = { r_cmd_data, 1'b0 };
		assign	o_rx_strb  = { r_rx_strb, 1'b0 };
		assign	o_rx_data  = { r_rx_data, 8'h0 };

		reg	[7:0]	w_out;
		always @(*)
		begin
			w_out = 0;
			w_out[NUMIO-1:0] = w_dat[8 +: NUMIO]& w_dat[0 +: NUMIO];
		end

		assign	o_debug = {
				i_cmd_en || i_data_en, 2'h0, i_rx_en,
				sample_ck, i_sdclk[7], i_sdclk[3],
				i_cmd_en, i_cmd_data[1:0],
					(&w_cmd), r_cmd_strb, r_cmd_data,
				i_data_en, r_rx_strb, r_rx_data,
				//
				((i_data_en) ? i_tx_data[31:24] : w_out)
				};


		// Keep Verilator happy
		// {{{
		// Verilator coverage_off
		// Verilator lint_off UNUSED
		wire	unused_ddr;
		assign	unused_ddr = &{ 1'b0, i_hsclk,
				i_cfg_ds, i_ds, i_tx_data[23:0],
				i_sdclk[6:4], i_sdclk[2:0],
				i_sample_shift[1:0] };
		// Verilator lint_on  UNUSED
		// Verilator coverage_on
		// }}}
		// }}}
	end else begin : GEN_WIDE_IO
		// {{{
		// Generic PHY handler, designed to support up to HS400.
		// Outputs 4 data periods per incoming clock, and 8 clock values
		// per incoming clock--hence the outgoing clock may have a
		// 90 degree shift from the data.  When dealing with non-DS
		// data, the clock edge is detected on output, and a sample
		// controller decides when to sample it on input.
		//
		// Fastest clock supported = incoming clock speed * 2

		// Local declarations
		// {{{
		reg		r_last_cmd_enabled, r_last_enabled;
		reg	[1:0]	w_cmd_data;
		reg	[15:0]	r_rx_data;
		wire	[15:0]	w_rx_data;
		reg		last_ck;
		wire	[7:0]	next_ck_sreg, next_ck_psreg;
		reg	[23:0]	ck_sreg, ck_psreg;
		wire	[7:0]	next_pedge, next_nedge, wide_cmd_data;
		reg	[7:0]	sample_ck, sample_pck;
		reg	[1:0]	r_cmd_data;
		reg		busy_strb, busy_data;
		reg	[1:0]	r_rx_strb;
		reg	[1:0]	start_io;
		reg	[1:0]	io_started;
		reg		resp_started;
		reg	[1:0]	r_cmd_strb;
		reg	[23:0]	pck_sreg;
		reg	[7:0]	cmd_sample_ck;
		// }}}

		// Clock
		// {{{
		// Verilator lint_off UNUSED
		wire		io_clk_tristate;
		// Verilator lint_on  UNUSED

		xsdserdes8x #(.OPT_BIDIR(1'b0))
		u_clk_oserdes(
			.i_clk(i_clk),
			.i_hsclk(i_hsclk),
			.i_en(1'b1),
			.i_data(i_sdclk),
			.io_tristate(io_clk_tristate),
			.o_pin(o_ck),
			.i_pin(1'b0),
			// Verilator lint_off PINCONNECTEMPTY
			.o_raw(), .o_wide()
			// Verilator lint_on  PINCONNECTEMPTY
		);
		// }}}

		assign	next_pedge = { ~{last_ck, i_sdclk[7:1] } &  i_sdclk[7:0] };
		assign	next_nedge = i_cfg_ddr ? {  {last_ck, i_sdclk[7:1] } & ~i_sdclk[7:0] } : 8'h0;

		assign	next_ck_sreg = (i_data_en) ? 8'h0
				: { next_pedge | next_nedge };
		assign	next_ck_psreg = (i_data_en) ? 8'h0 : next_pedge;

		initial	last_ck = 0;
		always @(posedge i_clk)
			last_ck <= i_sdclk[0];

		// sample_ck
		// {{{
		// We use this for busy detection, as well as reception
		always @(posedge i_clk)
		if (i_reset || i_data_en
				|| (!wait_for_busy && (!i_rx_en || i_cfg_ds)))
			ck_sreg <= 0;
		else
			ck_sreg <= { ck_sreg[15:0], next_ck_sreg };

		initial	sample_ck = 0;
		always @(posedge i_clk)
		if (i_reset || i_data_en
				|| (!wait_for_busy && (!i_rx_en || i_cfg_ds)))
			sample_ck <= 0;
		else
			// Verilator lint_off WIDTH
			sample_ck <= { ck_sreg[23:0], next_ck_sreg } >> i_sample_shift;
			// Verilator lint_on  WIDTH
		// }}}

		// sample_pck
		// {{{
		always @(posedge i_clk)
		if (i_reset || !i_rx_en || i_data_en || i_cfg_ds)
			ck_psreg <= 0;
		else
			ck_psreg <= { ck_psreg[15:0], next_ck_psreg };

		initial	sample_pck = 0;
		always @(posedge i_clk)
		if (i_reset || !i_rx_en || i_data_en || i_cfg_ds)
			sample_pck <= 0;
		else
			// Verilator lint_off WIDTH
			sample_pck <= { ck_psreg[23:0], next_ck_psreg } >> i_sample_shift;
			// Verilator lint_on  WIDTH
		// }}}

		always @(posedge i_clk)
			r_last_enabled <= i_data_en && i_pp_data;

		for(gk=0; gk<NUMIO; gk=gk+1)
		begin : GEN_WIDE_DATIO
			// {{{
			wire		out_en;
			reg	[7:0]	out_pin;
			wire	[7:0]	in_pin;
			integer		ik;
			reg	[1:0]	lcl_data;

			always @(*)
			for(ik=0; ik<4; ik=ik+1)
				out_pin[ik*2 +: 2] = {(2){i_tx_data[ik*8+gk]}};

			assign	out_en=(i_data_en &&(i_pp_data || !out_pin[3]))
					|| r_last_enabled;

			xsdserdes8x #(
				.OPT_BIDIR(1'b1)
			) io_serdes(
				.i_clk(i_clk),
				.i_hsclk(i_hsclk),
				.i_en(out_en),
				.i_data(out_pin),
				.io_tristate(io_dat_tristate[gk]),
				.o_pin(o_dat[gk]),
				.i_pin(i_dat[gk]),
				.o_raw(raw_iodat[gk]), .o_wide(in_pin)
			);

			if (gk == 0)
			begin : GEN_START_SIGNAL
				always @(*)
				begin
					start_io[1] = (|sample_pck[7:4])
						&&(0 == (sample_pck[7:4]&in_pin[7:4]));
					start_io[0] = (|sample_pck[3:0])
						&&(0 == (sample_pck[3:0]&in_pin[3:0]));
				end
			end

			always @(*)
			begin
				lcl_data[1] = |(sample_ck[7:4]&in_pin[7:4]);
				lcl_data[0] = |(sample_ck[3:0]&in_pin[3:0]);
			end

			assign	w_rx_data[8+gk] = lcl_data[1];
			assign	w_rx_data[  gk] = lcl_data[0];
			// }}}
		end

		for(gk=NUMIO; gk<8; gk=gk+1)
		begin : NULL_DATIO
			// {{{
			assign	w_rx_data[8+gk] = 1'b1;
			assign	w_rx_data[  gk] = 1'b1;

			// Keep Verilator happy
			// {{{
			// Verilator coverage_off
			// Verilator lint_off UNUSED
			wire	unused_outputs;
			assign	unused_outputs = &{ 1'b0 }; // , out_pin };
			// Verilator lint_on  UNUSED
			// Verilator coverage_on
			// }}}
			// }}}
		end

		// o_rx_strb, o_rx_data
		// {{{
		always @(posedge i_clk)
		if (i_reset || i_data_en || !i_rx_en || i_cfg_ds)
			io_started <= 2'b0;
		else if (!io_started[1])
		begin
			if (start_io[1] && (|sample_ck[3:0]))
				io_started <= 2'b11;
			else if (io_started[0])
				io_started[1] <= |sample_ck;
			else begin // if (!io_started[0] && start_io[0])
				io_started[0] <= |start_io;
				if (!i_cfg_ddr)
					io_started[1] <= |start_io;
			end
		end

		always @(posedge i_clk)
		if (i_reset || i_cfg_ds || !i_rx_en || i_data_en)
			r_rx_strb <= 2'b0;
		else if (sample_ck == 0)
			r_rx_strb <= 2'b0;
		else if (io_started[1])
		begin
			r_rx_strb[1] <= (|sample_ck);
			r_rx_strb[0] <= (|sample_ck[7:4]) && (|sample_ck[3:0]);
		end else if (io_started[0]&& (|sample_ck[7:4]))
		begin
			r_rx_strb[1] <= (|sample_ck[3:0]);
			r_rx_strb[0] <= 1'b0;
		end else
			r_rx_strb <= 2'b0;

		always @(posedge i_clk)
		if (i_reset || i_cfg_ds)
			r_rx_data <= 16'h0;
		else begin
			if (io_started[1])
				r_rx_data[15:8] <= w_rx_data[15:8];
			else
				r_rx_data[15:8] <= w_rx_data[ 7:0];

			r_rx_data[7:0] <= w_rx_data[7:0];
		end

		assign	o_rx_strb = r_rx_strb;
		assign	o_rx_data = r_rx_data;
		// }}}

		// busy_strb, busy_data
		// {{{
		always @(*)
		begin
			busy_strb = (|sample_ck);
			if (|sample_ck[3:0] && !w_rx_data[0])
				busy_data = 1'b0;
			else if (|sample_ck[7:4] && !w_rx_data[8])
				busy_data = 1'b0;
			else
				busy_data = 1'b1;
		end
		// }}}

		// o_data_busy, dat0_busy, wait_for_busy
		// {{{
		initial	{ dat0_busy, wait_for_busy } = 2'b01;
		always @(posedge i_clk)
		if (i_cmd_en || i_data_en)
		begin
			dat0_busy <= 1'b0;
			wait_for_busy <= 1'b1;
		end else if (wait_for_busy)
		begin
			if (busy_strb && !busy_data)
			begin
				dat0_busy <= !w_rx_data[0];
				wait_for_busy <= 1'b0;
			end
		end else if (busy_strb && busy_data)
			dat0_busy <= 1'b0;

		assign	o_data_busy = dat0_busy;
		// }}}

		////////////////////////////////////////////////////////////////
		//
		// CMD
		// {{{

		always @(posedge i_clk)
		if (i_reset || i_cfg_dscmd || i_cmd_en)
			pck_sreg <= 0;
		else
			pck_sreg <= { pck_sreg[15:0], next_pedge };

		always @(posedge i_clk)
		if (i_reset || i_cfg_dscmd || i_cmd_en || r_last_cmd_enabled)
			cmd_sample_ck <= 0;
		else
			// Verilator lint_off WIDTH
			cmd_sample_ck <= { pck_sreg[23:0], next_pedge } >> i_sample_shift;
			// Verilator lint_on  WIDTH

		always @(posedge i_clk)
			r_last_cmd_enabled <= i_cmd_en && i_pp_cmd;

		xsdserdes8x #(
			.OPT_BIDIR(1'b1)
		) cmd_serdes(
			.i_clk(i_clk),
			.i_hsclk(i_hsclk),
			.i_en(r_last_cmd_enabled
				||(i_cmd_en && (i_pp_cmd || !i_cmd_data[1]))),
			.i_data({ {(4){i_cmd_data[1]}}, {(4){i_cmd_data[0]}} }),
			.io_tristate(io_cmd_tristate),
			.o_pin(o_cmd),
			.i_pin(i_cmd),
			.o_raw(raw_cmd), .o_wide(wide_cmd_data)
		);

		// resp_started
		// {{{
		always @(posedge i_clk)
		if (i_reset || i_cmd_en || i_cfg_dscmd)
			resp_started <= 1'b0;
		else if (((|cmd_sample_ck[7:4])&&((cmd_sample_ck[7:4] & wide_cmd_data[7:4])==0))
			||((|cmd_sample_ck[3:0])&&((cmd_sample_ck[3:0] & wide_cmd_data[3:0])==0)))
			resp_started <= 1'b1;
		// }}}

		// o_cmd_strb
		// {{{
		always @(posedge i_clk)
		if (i_reset || i_cmd_en || i_cfg_dscmd)
			r_cmd_strb <= 2'b00;
		else if (resp_started)
		begin
			r_cmd_strb[1] <= (|cmd_sample_ck);
			r_cmd_strb[0] <= (|cmd_sample_ck[7:4])
						&&(|cmd_sample_ck[3:0]);
		end else begin
			r_cmd_strb[1] <= (((|cmd_sample_ck[7:4])&&((cmd_sample_ck[7:4] & wide_cmd_data[7:4])==0))
				||((|cmd_sample_ck[3:0])&&((cmd_sample_ck[3:0] & wide_cmd_data[3:0])==0)));
			r_cmd_strb[0] <= (|cmd_sample_ck[7:4])
				&& ((cmd_sample_ck[7:4] & wide_cmd_data[7:4])==0)
				&& (|cmd_sample_ck[3:0]);
		end

		assign	o_cmd_strb = r_cmd_strb;
		// }}}

		// o_cmd_data
		// {{{
		always @(*)
		begin
			if (resp_started)
			begin
				if (|cmd_sample_ck[7:4])
					w_cmd_data[1] = |(cmd_sample_ck[7:4] & wide_cmd_data[7:4]);
				else
					w_cmd_data[1] = |(cmd_sample_ck[3:0] & wide_cmd_data[3:0]);
			end else begin // if (!resp_started)
				w_cmd_data[1] = 1'b0;
			end

			w_cmd_data[0] = |(cmd_sample_ck[3:0]
						& wide_cmd_data[3:0]);
		end

		always @(posedge i_clk)
			r_cmd_data <= w_cmd_data;

		assign	o_cmd_data = r_cmd_data;
		// }}}

		// }}}
		assign	o_debug = 32'h0;

		// Keep Verilator happy
		// {{{
		// Verilator lint_off UNUSED
		wire	unused_serdes;
		assign	unused_serdes = &{ 1'b0,
				w_rx_data[15:9], w_rx_data[7:1] };
		// Verilator lint_on  UNUSED
		// }}}
		// }}}
	end endgenerate
	////////////////////////////////////////////////////////////////////////
	//
	// Datastrobe support
	// {{{
	////////////////////////////////////////////////////////////////////////
	//

	generate if (OPT_DS && NUMIO == 8)
	begin : GEN_DATASTROBE
		// Notes
		// {{{
		// This *SHOULD* work with OPT_DDR.  However, I have no evidence
		// that the IDDR element can be bypassed, which would be
		// required by the logic below.  If it cannot be bypassed,
		// this logic then makes no sense.
		//
		// Also: The DS (data strobe) needs to be delayed by a quarter
		// clock before entering this module.  Since the clock frequency
		// isn't fully known until run time, it should instead be
		// delayed by a quarter of the maximum clock period that will
		// be used.
		//
		// When working with DS based outputs, an asynchronous FIFO is
		// used to clock incoming data.  Further, when using the
		// asynchronous FIFO, the start of any incoming data is quietly
		// stripped off, guaranteeing that all data will be aligned on
		// the left/MSB sample.
		// }}}

		// Local declarations
		// {{{
		wire	afifo_reset_n;
		wire	cmd_ds_en;
		reg		af_started_p, af_started_n, acmd_started;
		reg		af_count_p, af_count_n, acmd_count;
		wire	[3:0]	ign_afifo_full, afifo_empty;
		wire	[31:0]	af_data;
		wire	[1:0]	acmd_empty, ign_acmd_full;
		wire	[1:0]	af_cmd;
		// }}}

		assign	afifo_reset_n = i_cfg_ds && !i_data_en && i_rx_en;
		assign	cmd_ds_en = i_cfg_dscmd && !i_cmd_en;

		// Async command port
		// {{{
		// The rule here is that only the positive edges of the
		// data strobe will qualify the CMD pin;
		always @(posedge i_ds or posedge cmd_ds_en)
		if (!cmd_ds_en)
			acmd_started <= 0;
		else if (!raw_cmd)
			acmd_started <= 1;

		always @(posedge i_ds or posedge cmd_ds_en)
		if (!cmd_ds_en)
			acmd_count <= 0;
		else if (acmd_started || !raw_cmd)
			acmd_count <= acmd_count + 1;

		afifo #(
			.LGFIFO(4), .WIDTH(1), .WRITE_ON_POSEDGE(1'b1)
		) u_pcmd_fifo_0 (
			// {{{
			.i_wclk(i_ds), .i_wr_reset_n(!cmd_ds_en),
			.i_wr((acmd_started || !raw_cmd)&& acmd_count == 1'b0),
				.i_wr_data(raw_cmd),
			.o_wr_full(ign_acmd_full[0]),
			//
			.i_rclk(i_clk), .i_rd_reset_n(!cmd_ds_en),
			.i_rd(acmd_empty == 2'b0), .o_rd_data(af_cmd[1]),
			.o_rd_empty(acmd_empty[0])
			// }}}
		);

		afifo #(
			.LGFIFO(4), .WIDTH(1), .WRITE_ON_POSEDGE(1'b1)
		) u_pcmd_fifo_1 (
			// {{{
			.i_wclk(i_ds), .i_wr_reset_n(cmd_ds_en),
			.i_wr(acmd_count), .i_wr_data(raw_cmd),
			.o_wr_full(ign_acmd_full[1]),
			//
			.i_rclk(i_clk), .i_rd_reset_n(i_cmd_en),
			.i_rd(acmd_empty == 2'b0), .o_rd_data(af_cmd[0]),
			.o_rd_empty(acmd_empty[1])
			// }}}
		);

		assign	MAC_VALID = (acmd_empty == 2'h0);
		assign	MAC_DATA  = af_cmd;
		// }}}

		// af_started_*, af_count_*
		// {{{
		always @(posedge i_ds or negedge afifo_reset_n)
		if (!afifo_reset_n)
			af_started_p <= 0;
		else if (raw_iodat[0] == 0)
			af_started_p <= 1;

		always @(posedge i_ds or negedge afifo_reset_n)
		if (!afifo_reset_n)
			af_count_p <= 0;
		else if (af_started_p)
			af_count_p <= af_count_p + 1;

		always @(negedge i_ds or negedge afifo_reset_n)
		if (!afifo_reset_n)
			af_started_n <= 0;
		else if (af_started_p)
			af_started_n <= 1;

		always @(negedge i_ds or negedge afifo_reset_n)
		if (!afifo_reset_n)
			af_count_n <= 0;
		else if (af_started_n)
			af_count_n <= af_count_n + 1;
		// }}}


		afifo #(
			.LGFIFO(4), .WIDTH(NUMIO), .WRITE_ON_POSEDGE(1'b1)
		) u_pedge_fifo_0 (
			// {{{
			.i_wclk(i_ds), .i_wr_reset_n(afifo_reset_n),
			.i_wr(af_started_p && af_count_p == 1'b0),
				.i_wr_data(raw_iodat),
			.o_wr_full(ign_afifo_full[0]),
			//
			.i_rclk(i_clk), .i_rd_reset_n(afifo_reset_n),
			.i_rd(MAD_VALID), .o_rd_data(af_data[24 +: NUMIO]),
			.o_rd_empty(afifo_empty[0])
			// }}}
		);

		afifo #(
			.LGFIFO(4), .WIDTH(NUMIO), .WRITE_ON_POSEDGE(1'b0)
		) u_nedge_fifo_1 (
			// {{{
			.i_wclk(i_ds), .i_wr_reset_n(afifo_reset_n),
			.i_wr(af_started_n && af_count_n == 1'b0),
				.i_wr_data(raw_iodat),
			.o_wr_full(ign_afifo_full[1]),
			//
			.i_rclk(i_clk), .i_rd_reset_n(afifo_reset_n),
			.i_rd(MAD_VALID), .o_rd_data(af_data[16 +: NUMIO]),
			.o_rd_empty(afifo_empty[1])
			// }}}
		);

		afifo #(
			.LGFIFO(4), .WIDTH(NUMIO), .WRITE_ON_POSEDGE(1'b1)
		) u_pedge_fifo_2 (
			// {{{
			.i_wclk(i_ds), .i_wr_reset_n(afifo_reset_n),
			.i_wr(af_count_p == 1'b1),
				.i_wr_data(raw_iodat),
			.o_wr_full(ign_afifo_full[2]),
			//
			.i_rclk(i_clk), .i_rd_reset_n(afifo_reset_n),
			.i_rd(MAD_VALID), .o_rd_data(af_data[8 +: NUMIO]),
			.o_rd_empty(afifo_empty[2])
			// }}}
		);

		afifo #(
			.LGFIFO(4), .WIDTH(NUMIO), .WRITE_ON_POSEDGE(1'b0)
		) u_nedge_fifo_3 (
			// {{{
			.i_wclk(i_ds), .i_wr_reset_n(afifo_reset_n),
			.i_wr(af_count_n == 1'b1),
				.i_wr_data(raw_iodat),
			.o_wr_full(ign_afifo_full[3]),
			//
			.i_rclk(i_clk), .i_rd_reset_n(afifo_reset_n),
			.i_rd(MAD_VALID), .o_rd_data(af_data[0 +: NUMIO]),
			.o_rd_empty(afifo_empty[3])
			// }}}
		);

		for(gk=NUMIO; gk<8; gk=gk+1)
		begin : ASSIGN_UNUSED_DATA
			// {{{
			// Technically, the data strobe is only permitted
			// if/when we are using all 8 IOs.  Still, there's no
			// reason why we can't build the front end to use
			// however many IOs we have.  Of course ... the rest
			// of the design assumes 8 IOs whenever the ASYNC
			// interface is active, so ... defining these here
			// doesn't mean these will work with the rest of the
			// design.
			//
			assign	af_data[     gk] = 1'b0;
			assign	af_data[ 8 + gk] = 1'b0;
			assign	af_data[16 + gk] = 1'b0;
			assign	af_data[24 + gk] = 1'b0;
			// }}}
		end

		assign	MAD_VALID = (afifo_empty == 4'h0); // af_flush && !afifo_empty[0]
		assign	MAD_DATA  = af_data;

		// Keep Verilator happy
		// {{{
		// Verilator lint_off UNUSED
		wire	unused_ds;
		assign	unused_ds = &{ 1'b0,
				ign_afifo_full, ign_acmd_full
				};
		// Verilator lint_on  UNUSED
		// }}}
	end else begin : NO_DATASTROBE
		assign	MAC_VALID = 1'b0;
		assign	MAC_DATA  = 2'b0;
		assign	MAD_VALID = 1'b0;
		assign	MAD_DATA  = 32'h0;

		// Keep Verilator happy
		// {{{
		// Verilator lint_off UNUSED
		wire	unused_ds;
		assign	unused_ds = &{ 1'b0, raw_cmd, raw_iodat,
				i_cfg_ds, i_cfg_dscmd
				};
		// Verilator lint_on  UNUSED
		// }}}
	end endgenerate

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// IO buffers --- if not using Verilator
	// {{{
`ifndef	VERILATOR

	IOBUF
	u_cmdbuf( .T(io_cmd_tristate), .I(o_cmd), .IO(io_cmd), .O(i_cmd));

	generate for(gk=0; gk<NUMIO; gk=gk+1)
	begin : GEN_IOBUF
		IOBUF
		u_datbuf(
			.T(io_dat_tristate[gk]),
			.I(o_dat[gk]),
			.IO(io_dat[gk]),
			.O(i_dat[gk])
		);
	end endgenerate
`endif
	// }}}
endmodule
////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	sdio.v
// {{{
// Project:	SDIO SD-Card controller
//
// Purpose:	Top level module (minus the front end) for the SDIO controller.
//		Contains submodules, but very little logic.
//
// Submodules:
//	sdwb:		Wishbone bus handler.  Also includes FIFO memory.
//	sdckgen:	Digital clock divider
//	sdcmd:		Request commands, process responses
//	sdrxframe:	Process receive frames into memory writes
//	sdtxframe:	Process memory reads into frames to transmit
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2018-2023, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`timescale 1ns/1ps
`default_nettype	none
// }}}
module	sdio #(
		// {{{
		parameter	LGFIFO = 15,//	= log_2(FIFO size in bytes)
				NUMIO=4,
		parameter	MW = 32,
		// parameter [0:0]	OPT_LITTLE_ENDIAN = 1'b0,
		// The DMA isn't (yet) implemented
		// localparam [0:0]	OPT_DMA = 1'b0,
		// To support more than one bit of IO per clock, we need
		//  serdes support.  Setting OPT_SERDES to zero will disable
		//  that support, effectively limiting our operation to 50MHz
		//  from a 100MHz clock.
		parameter [0:0]	OPT_SERDES = 1'b0,
		parameter [0:0]	OPT_DDR = 1'b0,
		parameter [0:0]	OPT_DS  = OPT_SERDES,
		parameter [0:0]	OPT_1P8V= 1'b0,
		parameter [0:0]	OPT_EMMC = 1'b1,
		parameter [0:0]	OPT_CARD_DETECT = !OPT_EMMC,
		parameter	LGTIMEOUT = 23
		// }}}
	) (
		// {{{
		input	wire		i_clk, i_reset,
		// Control (Wishbone) interface
		// {{{
		input	wire		i_wb_cyc, i_wb_stb, i_wb_we,
		input	wire	[2:0]	i_wb_addr,
		input	wire [MW-1:0]	i_wb_data,
		input	wire [MW/8-1:0]	i_wb_sel,
		//
		output	wire		o_wb_stall, o_wb_ack,
		output	wire [MW-1:0]	o_wb_data,
		// }}}
		input	wire		i_card_detect,
		output	wire		o_1p8v,
		output	wire		o_int,
		// Interface to PHY
		// {{{
		// Not these wires--those will be the connections handled by
		// the PHY
		// inout	wire		io_cmd,
		// inout	wire		io_ds,
		// inout wire [NUMIO-1:0]	io_dat,
		// But these ones ...
		output	wire		o_cfg_ddr, o_cfg_ds, o_cfg_dscmd,
		output	wire	[4:0]	o_cfg_sample_shift,
		output	reg	[7:0]	o_sdclk,
		//
		output	wire		o_cmd_en, o_pp_cmd,
		output	wire	[1:0]	o_cmd_data,
		//
		output	wire		o_data_en, o_pp_data, o_rx_en,
		output	wire	[31:0]	o_tx_data,
		//
		input	wire	[1:0]	i_cmd_strb, i_cmd_data,
		input	wire		i_card_busy,
		input	wire	[1:0]	i_rx_strb,
		input	wire	[15:0]	i_rx_data,
		//
		input	wire		S_AC_VALID,
		input	wire	[1:0]	S_AC_DATA,
		input	wire		S_AD_VALID,
		input	wire	[31:0]	S_AD_DATA
		// }}}
		// (Future / optional) DMA interface
		// {{{
		/*
		output	wire		o_dma_cyc, o_dma_stb, o_dma_we,
		output	wire	[2:0]	o_dma_addr,
		output	wire [MW-1:0]	o_dma_data,
		output	wire [MW/8-1:0]	o_dma_sel,
		//
		input	wire		i_dma_stall, i_dma_ack,
		input	wire [MW-1:0]	i_dma_data,
		input	wire		i_dma_err
		*/
		// }}}
		// }}}
	);

	// Local declarations
	// {{{
	wire			soft_reset;

	wire			cfg_clk90, cfg_clk_shutdown;
	wire	[7:0]		cfg_ckspeed;
	wire	[1:0]		cfg_width;

	wire			clk_stb, clk_half;
	wire	[7:0]		w_sdclk, clk_ckspd;

	wire			cmd_request, cmd_err, cmd_busy, cmd_done;
	wire			cmd_selfreply;
	wire	[1:0]		cmd_type, cmd_ercode;
	wire			rsp_stb;
	wire	[6:0]		cmd_id;
	wire	[5:0]		rsp_id;
	wire	[31:0]		cmd_arg, rsp_arg;
	wire			cmd_mem_valid;
	wire	[MW/8-1:0]	cmd_mem_strb;
	wire	[LGFIFO-$clog2(MW/8)-1:0]	cmd_mem_addr;
	wire	[MW-1:0]	cmd_mem_data;

	wire			tx_en, tx_mem_valid, tx_mem_ready, tx_mem_last;
	wire	[31:0]		tx_mem_data;

	wire			crc_en;
	wire	[LGFIFO:0]	rx_length;
	wire			rx_mem_valid;
	wire	[LGFIFO-$clog2(MW/8)-1:0]	rx_mem_addr;
	wire	[MW/8-1:0]	rx_mem_strb;
	wire	[MW-1:0]	rx_mem_data;
	wire			rx_done, rx_err, rx_ercode, rx_active, rx_en;
	// }}}

	sdwb #(
		// {{{
		.LGFIFO(LGFIFO), .NUMIO(NUMIO),
		.OPT_SERDES(OPT_SERDES),
		.OPT_DDR(OPT_DDR),
		.OPT_DS(OPT_DS),
		.OPT_CARD_DETECT(OPT_CARD_DETECT),
		.OPT_1P8V(OPT_1P8V),
		// .OPT_LITTLE_ENDIAN(OPT_LITTLE_ENDIAN)
		// .OPT_DMA(OPT_DMA)
		.OPT_EMMC(OPT_EMMC),
		.MW(MW)
		// }}}
	) u_control (
		// {{{
		.i_clk(i_clk), .i_reset(i_reset),
		// Wishbone slave
		// {{{
		.i_wb_cyc(i_wb_cyc), .i_wb_stb(i_wb_stb),
		.i_wb_we(i_wb_we), .i_wb_addr(i_wb_addr),
		.i_wb_data(i_wb_data), .i_wb_sel(i_wb_sel),
		//
		.o_wb_stall(o_wb_stall), .o_wb_ack(o_wb_ack),
			.o_wb_data(o_wb_data),
		// }}}
		// Configuration options
		// {{{
		.o_cfg_clk90(cfg_clk90), .o_cfg_ckspeed(cfg_ckspeed),
		.o_cfg_shutdown(cfg_clk_shutdown),
		.o_cfg_width(cfg_width), .o_cfg_ds(o_cfg_ds),
			.o_cfg_dscmd(o_cfg_dscmd), .o_cfg_ddr(o_cfg_ddr),
		.o_pp_cmd(o_pp_cmd), .o_pp_data(o_pp_data),
		.o_cfg_sample_shift(o_cfg_sample_shift),
		.i_ckspd(clk_ckspd),
		// }}}
		.o_soft_reset(soft_reset),
		// CMD control interface
		// {{{
		.o_cmd_request(cmd_request), .o_cmd_type(cmd_type),
		.o_cmd_selfreply(cmd_selfreply),
		.o_cmd_id(cmd_id), .o_arg(cmd_arg),
		//
		.i_cmd_busy(cmd_busy), .i_cmd_done(cmd_done),
			.i_cmd_err(cmd_err), .i_cmd_ercode(cmd_ercode),
		//
		.i_cmd_response(rsp_stb), .i_resp(rsp_id),
			.i_arg(rsp_arg),
		//
		.i_cmd_mem_valid(cmd_mem_valid), .i_cmd_mem_strb(cmd_mem_strb),
			.i_cmd_mem_addr(cmd_mem_addr),
			.i_cmd_mem_data(cmd_mem_data),
		// }}}
		// TX interface
		// {{{
		.o_tx_en(tx_en),
		//
		.o_tx_mem_valid(tx_mem_valid),
			.i_tx_mem_ready(tx_mem_ready && tx_en),
		.o_tx_mem_data(tx_mem_data), .o_tx_mem_last(tx_mem_last),
		.i_tx_busy(o_data_en),
		// }}}
		// RX interface
		// {{{
		.o_rx_en(rx_en), .o_crc_en(crc_en), .o_length(rx_length),
		//
		.i_rx_mem_valid(rx_mem_valid), .i_rx_mem_strb(rx_mem_strb),
			.i_rx_mem_addr(rx_mem_addr),.i_rx_mem_data(rx_mem_data),
		//
		.i_rx_done(rx_done), .i_rx_err(rx_err), .i_rx_ercode(rx_ercode),
		// }}}
		.i_card_detect(i_card_detect),
		.i_card_busy(i_card_busy),
		.o_1p8v(o_1p8v),
		.o_int(o_int)
		// }}}
	);

	assign	o_rx_en = rx_en && rx_active;

	sdckgen
	u_clkgen (
		// {{{
		.i_clk(i_clk), .i_reset(i_reset),
		//
		.i_cfg_clk90(cfg_clk90), .i_cfg_ckspd(cfg_ckspeed),
		.i_cfg_shutdown(cfg_clk_shutdown && !rx_active),

		.o_ckstb(clk_stb), .o_hlfck(clk_half), .o_ckwide(w_sdclk),
		.o_ckspd(clk_ckspd)
		// }}}
	);

	sdcmd #(
		.OPT_DS(OPT_DS),
		.OPT_EMMC(OPT_EMMC),
		.MW(MW),
		.LGLEN(LGFIFO-$clog2(MW/8))
	) u_sdcmd (
		// {{{
		.i_clk(i_clk), .i_reset(i_reset || soft_reset),
		//
		.i_cfg_ds(o_cfg_dscmd), .i_cfg_dbl(cfg_ckspeed == 0),
		.i_ckstb(clk_stb),
		//
		.i_cmd_request(cmd_request), .i_cmd_type(cmd_type),
		.i_cmd_selfreply(cmd_selfreply),
		.i_cmd(cmd_id), .i_arg(cmd_arg),
		//
		.o_busy(cmd_busy), .o_done(cmd_done), .o_err(cmd_err),
			.o_ercode(cmd_ercode),
		//
		.o_cmd_en(o_cmd_en), .o_cmd_data(o_cmd_data),
		.i_cmd_strb(i_cmd_strb), .i_cmd_data(i_cmd_data),
		.S_ASYNC_VALID(S_AC_VALID), .S_ASYNC_DATA(S_AC_DATA),
		//
		.o_cmd_response(rsp_stb), .o_resp(rsp_id),
			.o_arg(rsp_arg),
		//
		.o_mem_valid(cmd_mem_valid), .o_mem_strb(cmd_mem_strb),
			.o_mem_addr(cmd_mem_addr), .o_mem_data(cmd_mem_data)
		// }}}
	);

	sdtxframe #(
		.OPT_SERDES(OPT_SERDES || OPT_DDR)
		// .MW(MW)
	) u_txframe (
		// {{{
		.i_clk(i_clk), .i_reset(i_reset || soft_reset),
		//
		.i_cfg_spd(cfg_ckspeed),
		.i_cfg_width(cfg_width),
		.i_cfg_ddr(o_cfg_ddr),
		//
		.i_en(tx_en), .i_ckstb(clk_stb), .i_hlfck(clk_half),
		//
		.S_VALID(tx_en && tx_mem_valid), .S_READY(tx_mem_ready),
		.S_DATA(tx_mem_data), .S_LAST(tx_mem_last),
		//
		.tx_valid(o_data_en), .tx_data(o_tx_data)
		// }}}
	);

	sdrxframe #(
		// {{{
		.OPT_DS(OPT_SERDES),
		.LGLEN(LGFIFO),
		.MW(MW),
		.LGTIMEOUT(LGTIMEOUT)
		// }}}
	) u_rxframe (
		// {{{
		.i_clk(i_clk), .i_reset(i_reset || soft_reset),
		//
		.i_cfg_ddr(o_cfg_ddr),
		.i_cfg_ds(o_cfg_ds), .i_cfg_width(cfg_width),
		.i_rx_en(rx_en), .i_crc_en(crc_en), .i_length(rx_length),
		//
		.i_rx_strb(i_rx_strb), .i_rx_data(i_rx_data),
		.S_ASYNC_VALID(S_AD_VALID), .S_ASYNC_DATA(S_AD_DATA),
		//
		.o_mem_valid(rx_mem_valid), .o_mem_strb(rx_mem_strb),
			.o_mem_addr(rx_mem_addr), .o_mem_data(rx_mem_data),
		//
		.o_done(rx_done), .o_err(rx_err), .o_ercode(rx_ercode),
		.o_active(rx_active)
		// }}}
	);

	always @(posedge i_clk)
		o_sdclk <= w_sdclk;

	//
	// Make verilator happy
	// {{{
	// verilator coverage_off
	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0 };
	// verilator lint_on  UNUSED
	// verilator coverage_on
	// }}}
endmodule

////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	sdwb.v
// {{{
// Project:	SDIO SD-Card controller
//
// Purpose:	Bus handler.  Accepts and responds to Wishbone bus requests.
//		Configures clock division, and IO speed and parameters.
//	Issues commands to the command handler, TX and RX handlers.
//
//
//	Basic command types:
//		0x0040	Broadcast command, no response expected
//		0x0140	Standard command, R1 expected response
//		0x0240	Command expecting an R2 return
//		0x0940	Read request, read data to follow
//		0x0d40	Write request, data to follow
//		0x0800	Continues a data read into a second sector
//		0x0c00	Continues a data write into a second sector
//		0x0168	(CMD40) GO_IRQ_STATE eMMC command (open drain response)
//	   How to break an interrupt?
//		0x0028 (Also requires open-drain mode)
//		0x0040	(GO_IDLE, expects no response)
//	   How to reset an error without doing anything?
//		0x8080
//	   How to reset the FIFO pointer without doing anything?
//		0x0080
//	   How to keep the command controller from timing out while
//			waiting for an interrupt?  Send a GO_IRQ_STATE command
//			The command processor will need to know how to handle
//			this internally.
//		0x0168
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2023, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`timescale 1ns/1ps
`default_nettype	none
// }}}
module	sdwb #(
		// {{{
		parameter	LGFIFO = 15,	// FIFO size in bytes
		parameter	NUMIO=4,
		parameter	MW = 32,
		// parameter [0:0]	OPT_LITTLE_ENDIAN = 1'b0,
		parameter [0:0]	OPT_SERDES = 1'b0,
		parameter [0:0]	OPT_DS = OPT_SERDES,
		parameter [0:0]	OPT_DDR = 1'b0,
		parameter [0:0]	OPT_CARD_DETECT = 1'b1,
		parameter [0:0]	OPT_EMMC = 1'b1,
		localparam	LGFIFOW=LGFIFO-$clog2(MW/8),
		parameter [0:0]	OPT_DMA = 1'b0,
		parameter [0:0]	OPT_1P8V= 1'b0,	// 1.8V voltage switch capable?
		// OPT_R1B, if set, adds logic to the controller to only expect
		// a card busy signal following an R1B command.  This insures
		// the card busy status is set until the card has an opportunity
		// to set it.  Any potential card busy returns from the PHY,
		// for other reasons (data?) will be will be ignored otherwise
		// except following an R1B command.  If not set, then anytime
		// DAT[0] goes low following a command (and neither actively
		// transmitting or receiving), then the card busy will be set
		// until it returns high again.  This will catch all reasons
		// the card may be busy, and actually provide a direct wire
		// for reading the card busy bit from the card itself via the
		// PHY.
		parameter [0:0]	OPT_R1B = 1'b1,
		// If OPT_R1B is set, then we'll want to wait at least two
		// device clocks waiting for busy.  Each clock can be as long
		// as 1k system clock cycles.  Hence, we'll wait for up to 4095
		// clock cycles before timing out while waiting for busy.
		// Perhaps that's too long, but it's just a backup timeout.
		// If the device actually indicates a busy (like it's supposed
		// to), then we'll be busy until the device releases.
		parameter	LGCARDBUSY = 12
		// }}}
	) (
		// {{{
		input	wire			i_clk, i_reset,
		// Wishbone interface
		// {{{
		input	wire			i_wb_cyc, i_wb_stb, i_wb_we,
		input	wire	[2:0]		i_wb_addr,
		input	wire	[32-1:0]	i_wb_data,
		input	wire	[32/8-1:0]	i_wb_sel,
		output	wire			o_wb_stall,
		output	reg			o_wb_ack,
		output	reg	[32-1:0]	o_wb_data,
		// }}}
		// Configuration options
		// {{{
		output	reg			o_cfg_clk90,
		output	wire	[7:0]		o_cfg_ckspeed,
		output	reg			o_cfg_shutdown,
		output	wire	[1:0]		o_cfg_width,
		output	reg			o_cfg_ds, o_cfg_dscmd,o_cfg_ddr,
		output	reg			o_pp_cmd, o_pp_data,
		output	reg	[4:0]		o_cfg_sample_shift,
		input	wire	[7:0]		i_ckspd,

		output	reg			o_soft_reset,
		// }}}
		// CMD interface
		// {{{
		output	wire			o_cmd_selfreply,
		output	reg			o_cmd_request,
		output	reg	[1:0]		o_cmd_type,
		output	wire	[6:0]		o_cmd_id,
		output	wire	[31:0]		o_arg,
		//
		input	wire			i_cmd_busy, i_cmd_done,
						i_cmd_err,
		input	wire	[1:0]		i_cmd_ercode,
		//
		input	wire			i_cmd_response,
		input	wire	[5:0]		i_resp,
		input	wire	[31:0]		i_arg,
		//
		input	wire			i_cmd_mem_valid,
		input	wire	[MW/8-1:0]	i_cmd_mem_strb,
		input	wire	[LGFIFOW-1:0]	i_cmd_mem_addr,
		input	wire	[MW-1:0]	i_cmd_mem_data,
		// }}}
		// TX interface
		// {{{
		output	reg			o_tx_en,
		//
		output	reg			o_tx_mem_valid,
		input	wire			i_tx_mem_ready,
		output	reg	[31:0]		o_tx_mem_data,
		output	reg			o_tx_mem_last,
		input	wire			i_tx_busy,
		// }}}
		// RX interface
		// {{{
		output	reg			o_rx_en,
		output	wire			o_crc_en,
		output	wire	[LGFIFO:0]	o_length,
		//
		input	wire			i_rx_mem_valid,
		input	wire	[MW/8-1:0]	i_rx_mem_strb,
		input	wire	[LGFIFOW-1:0]	i_rx_mem_addr,
		input	wire	[MW-1:0]	i_rx_mem_data,
		//
		input	wire			i_rx_done, i_rx_err,i_rx_ercode,
		// }}}
		input	wire			i_card_detect,
		input	wire			i_card_busy,
		output	wire			o_1p8v,
		output	reg			o_int
		// }}}
	);

	// Local declarations
	// {{{
	localparam	LGFIFO32 = LGFIFO - $clog2(32/8);

	localparam	[2:0]	ADDR_CMD = 0,
				ADDR_ARG = 1,
				ADDR_FIFOA = 2,
				ADDR_FIFOB = 3,
				ADDR_PHY   = 4;

	localparam	[1:0]	CMD_PREFIX = 2'b01,
				NUL_PREFIX = 2'b00;
	localparam	[1:0]	RNO_REPLY = 2'b00,
				R2_REPLY = 2'b10,
				R1B_REPLY = 2'b11;
	localparam		CARD_REMOVED_BIT = 18,
				// ERR_BIT       = 15,
				USE_DMA_BIT      = 13,
				FIFO_ID_BIT      = 12,
				USE_FIFO_BIT     = 11,
				FIFO_WRITE_BIT   = 10;

	localparam	[1:0]	WIDTH_1W = 2'b00,
				WIDTH_4W = 2'b01,
				WIDTH_8W = 2'b10;
	// localparam	[15:0]	CMD_SELFREPLY = 16'h0028;

	reg	cmd_busy, new_cmd_request, new_data_request, new_tx_request;
	reg	w_selfreply_request, r_clk_shutdown;

	wire		wb_cmd_stb, wb_phy_stb;
	reg	[6:0]	r_cmd;
	reg		r_tx_request, r_rx_request, r_tx_sent;
	reg		r_fifo, r_cmd_err, r_rx_err, r_rx_ecode;
	reg	[1:0]	r_cmd_ecode;
	reg	[31:0]	r_arg;
	reg	[3:0]	lgblk;
	reg	[1:0]	r_width;
	reg	[7:0]	r_ckspeed;
	reg	[31:0]	w_cmd_word, w_phy_ctrl;
	reg	[15:0]	blk_words;

	integer	ika, ikb;
	localparam	NFIFOW = (1<<LGFIFO) / (MW/8);
	reg	[MW-1:0]	fifo_a	[0:NFIFOW-1];
	reg	[MW-1:0]	fifo_b	[0:NFIFOW-1];
	reg	[MW-1:0]	tx_fifo_a, tx_fifo_b;
	wire	[(($clog2(MW/32) > 0) ? ($clog2(MW/32)-1):0):0] tx_shift;
	reg	[LGFIFOW-1:0]	fif_wraddr, fif_rdaddr;
	reg	[LGFIFOW-1:0]	fif_a_rdaddr, fif_b_rdaddr;
	reg	[LGFIFO32-1:0]	tx_mem_addr;
	reg	[MW-1:0]	next_tx_mem;
	reg			tx_fifo_last, pre_tx_last,
				tx_pipe_valid;

	wire			card_present, card_removed;

	reg			pre_ack;
	reg	[1:0]		pre_sel;
	reg	[31:0]		pre_data;

	reg	[LGFIFOW-1:0]	mem_wr_addr_a, mem_wr_addr_b;
	reg	[MW/8-1:0]	mem_wr_strb_a, mem_wr_strb_b;
	reg	[MW-1:0]	mem_wr_data_a, mem_wr_data_b;

	wire			mem_busy;
	wire			w_card_busy;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Registers
	// {{{

	// CMD/control register
	// {{{
	assign	wb_cmd_stb = i_wb_stb && i_wb_addr == ADDR_CMD && i_wb_we
			&&((!r_cmd_err && !r_rx_err)
					|| (i_wb_sel[1] && i_wb_data[15]));

	// o_soft_reset
	// {{{
	initial	o_soft_reset = 1'b1;
	always @(posedge i_clk)
	if (i_reset || !card_present)
		o_soft_reset <= 1'b1;
	else
		o_soft_reset <= (wb_cmd_stb)&&(&i_wb_sel[3:0])
					&&(i_wb_data==32'h52_00_00_00);
	// }}}

	assign	mem_busy = (o_tx_en || r_tx_request || o_rx_en || r_rx_request)
			||(cmd_busy && o_cmd_type == R2_REPLY);

	// o_cmd_request
	// {{{
	always @(*)
	begin
		w_selfreply_request = !o_cmd_request && wb_cmd_stb
			&& (&i_wb_sel[1:0])
			&&((!i_wb_data[USE_DMA_BIT] || !OPT_DMA)
					&& !i_wb_data[USE_FIFO_BIT])
			&& (i_wb_data[9:8] == RNO_REPLY)
			&& ((i_wb_data[7:6] ==  NUL_PREFIX
					&& i_wb_data[5:0] != 6'h0) //IRQ Reply
			  ||(i_wb_data[7:6] ==  CMD_PREFIX
					&& i_wb_data[5:0] == 6'h0)); // GO_IDLE

		if (i_reset || o_soft_reset || !OPT_EMMC)
			w_selfreply_request = 1'b0;
	end

	always @(*)
	begin
		new_cmd_request = wb_cmd_stb && (&i_wb_sel[1:0])
			&& ((!cmd_busy && i_wb_data[7:6] == CMD_PREFIX)
				|| (w_selfreply_request));

		new_data_request = wb_cmd_stb && (&i_wb_sel[1:0])
			&& ((!cmd_busy && i_wb_data[7:6] == CMD_PREFIX)
						|| i_wb_data[7:6] == NUL_PREFIX)
			&& ((i_wb_data[USE_DMA_BIT] && OPT_DMA)
					|| i_wb_data[USE_FIFO_BIT]
				||(!cmd_busy && i_wb_data[7:6] == CMD_PREFIX
						&& i_wb_data[9:8] == R2_REPLY));
		if (i_cmd_err)
			new_data_request = 1'b0;

		// If the FIFO is already in use, then we can't accept any
		// new command which would require the FIFO
		// {{{
		if (mem_busy)
			new_data_request = 1'b0;

		// If we want an R2 reply, then the data channels need to be
		// clear.
		if (mem_busy &&((i_wb_data[9:8] == R2_REPLY)
					||(i_wb_data[USE_DMA_BIT] && OPT_DMA)
					|| i_wb_data[USE_FIFO_BIT]))
			new_cmd_request = 1'b0;
		// }}}

		if (i_reset || o_soft_reset)
			{ new_data_request, new_cmd_request } = 2'b0;
	end

	initial	o_cmd_request = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		o_cmd_request <= 1'b0;
	else if (new_cmd_request)
	begin
		o_cmd_request <= 1'b1;
	end else if (!i_cmd_busy)
		o_cmd_request <= 1'b0;
	// }}}

	// o_cmd_selfreply -- send a command even if busy waiting on a reply
	// {{{
	generate if (OPT_EMMC)
	begin : GEN_SELFREPLY
		reg	r_cmd_selfreply;

		initial	r_cmd_selfreply = 1'b0;
		always @(posedge i_clk)
		if (i_reset || o_soft_reset)
			r_cmd_selfreply <= 1'b0;
		else if (w_selfreply_request)
			r_cmd_selfreply <= 1'b1;
		else if (!i_cmd_busy)
			r_cmd_selfreply <= 1'b0;

		assign	o_cmd_selfreply = r_cmd_selfreply;
	end else begin : NO_SELFREPLY

		assign	o_cmd_selfreply = 1'b0;
	end endgenerate
	// }}}

	// cmd_busy: Are we waiting on a command to complete?
	// {{{
	initial	cmd_busy = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		cmd_busy <= 1'b0;
	else if (new_cmd_request)
		cmd_busy <= 1'b1;
	else if (i_cmd_done)
		cmd_busy <= 1'b0;
`ifdef	FORMAL
	always @(*)
	if (i_reset && o_cmd_request)
		assert(cmd_busy);
`endif
	// }}}

	// o_cmd_id: What command are we issuing?
	// {{{
	initial	r_cmd = 7'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		r_cmd <= 7'b0;
	else if (new_cmd_request)
		r_cmd <= i_wb_data[6:0];
	else if (i_cmd_response)
		r_cmd <= { 1'b0, i_resp };

	assign	o_cmd_id = r_cmd[6:0];
	// }}}

	// o_cmd_type: What response to expect?  None, R1, R2, or R1b
	// {{{
	initial	o_cmd_type = 2'b00;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		o_cmd_type <= 2'b00;
	else if (new_cmd_request)
		o_cmd_type <= i_wb_data[9:8];
	// }}}

	// r_expect_busy, r_card_busy
	// {{{
	generate if (OPT_R1B)
	begin : GEN_R1B
		// We want to wait at least two device clocks waiting for busy.
		// Each clock can be as long as 1k system clock cycles.  Hence,
		// we'll wait for up to 4095 clock cycles here.  Perhaps that's
		// too long, but it's just a timeout.  If the device actually
		// indicates a busy (like it's supposed to), then we'll be
		// busy until the device releases.
		reg	[LGCARDBUSY-1:0]	r_busy_counter;
		reg		r_expect_busy, r_card_busy;

		initial	r_expect_busy = 1'b0;
		always @(posedge i_clk)
		if (i_reset || o_soft_reset)
			r_expect_busy <= 1'b0;
		else if (o_tx_en)
			r_expect_busy <= 1'b1;
		else if (new_cmd_request)
			r_expect_busy <= (i_wb_data[9:8] == R1B_REPLY);
		else if (!cmd_busy && (i_card_busy || r_busy_counter == 0))
			r_expect_busy <= 1'b0;

		initial	r_card_busy = 1'b0;
		always @(posedge i_clk)
		if (i_reset || o_soft_reset)
			r_card_busy <= 1'b0;
		else if (o_tx_en)
			r_card_busy <= 1'b1;
		else if (new_cmd_request)
			r_card_busy <= (i_wb_data[9:8] == R1B_REPLY);
		else if (!i_card_busy && !r_expect_busy && !cmd_busy)
			r_card_busy <= 1'b0;

		initial	r_busy_counter = 0;
		always @(posedge i_clk)
		if (i_reset || o_soft_reset)
			r_busy_counter <= 0;
		else if (o_rx_en || i_card_busy
				|| (cmd_busy && !r_expect_busy && !o_tx_en))
			r_busy_counter <= 0;
		else if ((cmd_busy && r_expect_busy) || o_tx_en)
		begin
			r_busy_counter <= -1;

			if (r_ckspeed < 4)
				r_busy_counter <= 16;
			else if (r_ckspeed < 8)
				r_busy_counter <= 72;
			else if (r_ckspeed < 16)
				r_busy_counter <= 192;
			else if (r_ckspeed < 32)
				r_busy_counter <= 3*128;
		end else if (r_busy_counter != 0)
			r_busy_counter <= r_busy_counter - 1;

		assign	w_card_busy = r_card_busy;
`ifdef	FORMAL
		// We need to stay officially busy as long as we are waiting
		// for a response from the card
		always @(*)
		if (!i_reset && r_expect_busy)
			assert(r_card_busy);

		// We only check timeouts while we expect a busy signal, and
		// before it takes place
		always @(*)
		if (!i_reset && !r_expect_busy && !cmd_busy)
			assert(r_busy_counter == 0);
`endif
	end else begin : DIRECT_CARD_BUSY
		assign	w_card_busy = i_card_busy;

		// Keep Verilator happy
		// {{{
		// Verilator coverage_off
		// Verilator lint_off UNUSED
		wire	unused_r1b;
		assign	unused_r1b = &{ 1'b0, LGCARDBUSY };
		// Verilator lint_on  UNUSED
		// Verilator coverage_on
		// }}}
	end endgenerate
	// }}}

	// o_tx_en, r_tx_request, r_tx_sent
	// {{{
	always @(*)
	begin
		new_tx_request = new_data_request && i_wb_data[FIFO_WRITE_BIT];
		if (i_wb_data[9:8] == R2_REPLY
				&& i_wb_data[7:6] == CMD_PREFIX)
			new_tx_request = 1'b0;
		if (i_reset || o_soft_reset)
			new_tx_request = 1'b0;
	end

	initial	r_tx_request = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset || i_cmd_err)
		r_tx_request <= 1'b0;
	else if (new_tx_request)
		r_tx_request <= 1'b1;
	else if (!cmd_busy && !o_cmd_request && !o_tx_en && !w_card_busy)
		r_tx_request <= 1'b0;

	initial	r_tx_sent = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset || !o_tx_en)
		r_tx_sent <= 1'b0;
	else if (o_tx_mem_valid && i_tx_mem_ready && o_tx_mem_last)
		r_tx_sent <= 1'b1;

	initial	o_tx_en = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset || (i_cmd_err && !o_tx_en))
		o_tx_en <= 1'b0;
	else if (o_tx_en && r_tx_sent && !i_tx_busy)
		o_tx_en <= 1'b0;
	else if (!cmd_busy && !o_cmd_request && !o_tx_en && !w_card_busy
				&& r_tx_request)
		o_tx_en <= r_tx_request;
`ifdef	FORMAL
	always @(*)
	if (!i_reset && !o_soft_reset)
		assert(!r_tx_request || !o_tx_en);

	always @(posedge i_clk)
	if (!i_reset && $past(!i_reset && !o_soft_reset
					&& r_tx_request && !i_cmd_err))
		assert(r_tx_request || o_tx_en);

	always @(posedge i_clk)
	if (!i_reset && $past(!i_reset && !o_soft_reset && new_data_request))
		assert(r_tx_request || r_rx_request
			||(o_cmd_request && o_cmd_type == R2_REPLY));
`endif
	// }}}

	// o_rx_en, r_rx_request
	// {{{
	initial	r_rx_request = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset || i_cmd_err)
		r_rx_request <= 1'b0;
	else if (new_data_request && !i_wb_data[FIFO_WRITE_BIT]
			&& (i_wb_data[9:8] != R2_REPLY
					|| i_wb_data[7:6] == NUL_PREFIX))
		r_rx_request <= 1'b1;
	else if (!o_cmd_request)
		r_rx_request <= 1'b0;

	initial	o_rx_en = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset || (i_cmd_err && !o_rx_en))
		o_rx_en <= 1'b0;
	else if (o_rx_en && i_rx_done)
		o_rx_en <= 1'b0;
	else if (!o_cmd_request && r_rx_request)
		o_rx_en <= 1'b1;
`ifdef	FORMAL
	always @(*)
	if (!i_reset && !o_soft_reset)
		assert(!r_rx_request || !o_rx_en);
	always @(posedge i_clk)
	if (!i_reset && $past(!i_reset && !o_soft_reset && (r_rx_request && !i_cmd_err)))
		assert(r_rx_request || o_rx_en);
`endif
	// }}}

	// r_fifo: Control which FIFO this command uses
	// {{{
	initial	r_fifo = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		r_fifo <= 1'b0;
	else if (!cmd_busy && !o_tx_en && !o_rx_en
			&& !r_tx_request && !r_rx_request
			&& wb_cmd_stb && i_wb_sel[FIFO_ID_BIT/8])
		r_fifo <= i_wb_data[FIFO_ID_BIT];
	// }}}

	// always @(posedge i_clk)
	// if (i_reset || !OPT_DMA)
	//	r_dma <= 1'b0;
	// else if (!i_cmd_busy && i_wb_stb && i_wb_addr == 0 && i_wb_sel[1:0])
	//	r_dma <= i_wb_data[USE_DMA_BIT];

	// r_cmd_err
	// {{{
	initial	r_cmd_err = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		r_cmd_err <= 1'b0;
	// else if (new_cmd_request)
	else if (i_cmd_err) //  || (o_rx_en && i_rx_err))
		r_cmd_err <= 1'b1;
	else if (wb_cmd_stb)
		r_cmd_err <= 1'b0;

	initial	r_cmd_ecode = 2'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		r_cmd_ecode <= 2'b0;
	else if (new_cmd_request)
		r_cmd_ecode <= 2'b0;
	else if (!r_cmd_err && i_cmd_done)
		r_cmd_ecode <= i_cmd_ercode;
	// }}}

	// r_rx_err
	// {{{
	initial	r_rx_err = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		r_rx_err <= 1'b0;
	// else if (new_cmd_request)
	else if (o_rx_en && i_rx_err)
		r_rx_err <= 1'b1;
	else if (wb_cmd_stb)
		r_rx_err <= 1'b0;

	initial	r_rx_ecode = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		r_rx_ecode <= 1'b0;
	else if (new_cmd_request)
		r_rx_ecode <= 1'b0;
	else if (!r_rx_err && i_rx_err)
		r_rx_ecode <= i_rx_ercode;
	// }}}

	always @(*)
	begin
		w_cmd_word = 32'h0;
		w_cmd_word[23] = r_rx_ecode;
		w_cmd_word[22] = r_rx_err;
		w_cmd_word[21] = r_cmd_err;
		w_cmd_word[20] = w_card_busy;
		w_cmd_word[19] = !card_present;
		w_cmd_word[18] =  card_removed;
		w_cmd_word[17:16] = r_cmd_ecode;
		w_cmd_word[15] = r_cmd_err || r_rx_err;
		w_cmd_word[14] = cmd_busy;
		w_cmd_word[13] = 1'b0; // (== r_dma && OPT_DMA)
		w_cmd_word[12] = r_fifo;
		w_cmd_word[11] = mem_busy;
		w_cmd_word[10] = (o_tx_en || r_tx_request);
		w_cmd_word[9:8] = o_cmd_type;
		w_cmd_word[6:0] = r_cmd;
	end
	// }}}

	// Command argument register
	// {{{
	initial	r_arg = 32'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		r_arg <= 0;
	// else if (o_cmd_request && !i_cmd_busy)
	//	r_arg <= 0;
	else if (i_cmd_response)
		r_arg <= i_arg;
	else if (!cmd_busy && i_wb_stb && !o_wb_stall && i_wb_we && i_wb_addr == ADDR_ARG)
	begin
		if (i_wb_sel[0])
			r_arg[ 7: 0] <= i_wb_data[ 7: 0];
		if (i_wb_sel[1])
			r_arg[15: 8] <= i_wb_data[15: 8];
		if (i_wb_sel[2])
			r_arg[23:16] <= i_wb_data[23:16];
		if (i_wb_sel[3])
			r_arg[31:24] <= i_wb_data[31:24];
	end

	assign	o_arg = r_arg;
	// }}}

	// PHY control register
	// {{{
	assign	wb_phy_stb = i_wb_stb && !o_wb_stall && i_wb_addr == ADDR_PHY && i_wb_we;

	// o_length, lgblk
	// {{{
	initial	lgblk = 4'h9;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		lgblk <= 4'h9;
	else if (!o_tx_en && !o_rx_en && !r_tx_request && !r_rx_request
			&& wb_phy_stb && i_wb_sel[3])
	begin
		lgblk <= i_wb_data[27:24];
		if (i_wb_data[27:24] >= LGFIFO)
			lgblk <= LGFIFO;
		else if (i_wb_data[27:24] <= 2)
			lgblk <= 2;
	end

	assign	o_length = 1<<lgblk;
	// }}}

	// o_1p8v: Set to true to enable the hardware to operate at 1.8V
	// {{{
	generate if (OPT_1P8V)
	begin : GEN_1P8V
		reg	r_1p8v;

		// Chips always start up at 3.3V, so we need to disable 1.8V
		// on startup.  Once they switch to 1.8V, they cannot switch
		// back.  Hence, any 1.8V hardware *MUST* also force the card
		// to reset (i.e. power down the card) any time the FPGA reloads
		// its configuration--else we'll be operating at 3.3V when the
		// card is configured for 1.8V.
		//
		// Note that there is *no* way to test this bit.  We're either
		// in 1.8V, or not, and we can't come back.  Hence, the PHY
		// supports bit[23] = OPT_1P8V, so the user can know that
		// the 1.8V option exists.  If the option exists, the user can
		// then query the card to know if the card supports 1.8V, and
		// then switch the card and other hardware confidently.
		//
		initial	r_1p8v = 1'b0;
		always @(posedge i_clk)
		if (i_reset || !card_present)
			r_1p8v <= 1'b0;
		else if (wb_phy_stb && i_wb_sel[2])
			r_1p8v <= r_1p8v || i_wb_data[22];

		assign	o_1p8v = r_1p8v;

	end else begin : NO_1P8V
		assign	o_1p8v = 1'b0;
	end endgenerate
	// }}}

	// o_cfg_sample_shift: Control when we sample data returning from card
	// {{{
	initial	o_cfg_sample_shift = 5'h18;
	always @(posedge i_clk)
	begin
		if (i_reset || o_soft_reset)
			o_cfg_sample_shift <= 5'h18;
		else if (wb_phy_stb && i_wb_sel[2])
			o_cfg_sample_shift <= i_wb_data[20:16];

		if(!OPT_SERDES)
			o_cfg_sample_shift[1:0] <= 2'h0;
		if(!OPT_SERDES && !OPT_DDR)
			o_cfg_sample_shift[2] <= 1'h0;
	end
	// }}}

	// o_cfg_shutdown: Shutdown the SD Card clock when not in use
	// o_cfg_clk90: Use a clock that's 90 degrees offset from the data,
	// {{{
	//	vs allowing the data to align with the negative edge of the
	//	clock.  o_cfg_clk90 is required for all DDR modes, but may not
	//	be required for SDR modes.
	initial	{ r_clk_shutdown, o_cfg_clk90 } = 2'b00;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		{ r_clk_shutdown, o_cfg_clk90 } <= 2'b00;
	else if (wb_phy_stb && i_wb_sel[1])
	begin
		{ r_clk_shutdown, o_cfg_clk90 } <= i_wb_data[15:14];
		if (i_wb_data[8])
			o_cfg_clk90 <= 1'b1;
	end

	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		o_cfg_shutdown <= 1'b0;
	else if (wb_phy_stb && i_wb_sel[1] && !i_wb_data[15])
	begin
		o_cfg_shutdown <= 1'b0;
	end else if (r_clk_shutdown
			|| (wb_phy_stb && i_wb_sel[1] && i_wb_data[15]))
	begin
		o_cfg_shutdown <= 1'b1;
		if (w_card_busy)
			o_cfg_shutdown <= 1'b0;
		if (r_tx_request || r_rx_request)
			o_cfg_shutdown <= 1'b0;
		if (o_tx_en && (!r_tx_sent || i_tx_busy))
			o_cfg_shutdown <= 1'b0;

		// No checks for RX shutdown--that needs to be done from the
		// receiver itself.

		if (o_cmd_request || (cmd_busy && !i_cmd_done))
			o_cfg_shutdown <= 1'b0;
	end
`ifdef	FORMAL
	always @(posedge i_clk)
	if (!i_reset)
	begin
		if (!r_clk_shutdown)
			assert(!o_cfg_shutdown);
		if ((cmd_busy && !o_cmd_request) || o_tx_en
						|| (w_card_busy && !cmd_busy))
			assert(!o_cfg_shutdown);
	end
`endif
	// }}}

	// o_pp_cmd, o_pp_data: If set, configure cmd/data to push-pull modes
	// {{{
	// If clear, the cmd/data lines will be left in their original
	// open-drain modes.  The SD spec requires that the card start in
	// open-drain, and then switch to push-pull modes when speeding up
	// the clock to higher speeds.  o_pp_cmd controls whether or not the
	// command wire is operated in push-pull mode, whereas o_pp_data
	// controls whether or not the data lines are operated in push-pull
	// mode.
	initial	{ o_pp_cmd, o_pp_data } = 2'b00;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		{ o_pp_cmd, o_pp_data } <= 2'b00;
	else if (wb_phy_stb && i_wb_sel[1])
		{ o_pp_cmd, o_pp_data } <= i_wb_data[13:12];
	// }}}

	// o_cfg_ds: Enable return data strobe support
	// {{{
	initial	o_cfg_ds = 1'b0;
	always @(posedge i_clk)
	if (i_reset || !OPT_DS || !OPT_EMMC || o_soft_reset)
		o_cfg_ds <= 1'b0;
	else if (wb_phy_stb && i_wb_sel[1])
		o_cfg_ds <= (&i_wb_data[9:8]);

	initial	o_cfg_dscmd = 1'b0;
	always @(posedge i_clk)
	if (i_reset || !OPT_DS || !OPT_EMMC || o_soft_reset)
		o_cfg_dscmd <= 1'b0;
	else if (wb_phy_stb)
	begin
		case(i_wb_sel[2:1])
		2'b00: begin end
		2'b10: o_cfg_dscmd <= i_wb_data[21] && o_cfg_ds;
		2'b01: o_cfg_dscmd <= o_cfg_dscmd   && (&i_wb_data[9:8]);
		2'b11: o_cfg_dscmd <= i_wb_data[21] && (&i_wb_data[9:8]);
		endcase
	end
`ifdef	FORMAL
	always @(*)
	if (!i_reset && !o_cfg_clk90)
		assert(!o_cfg_ddr);
	always @(*)
	if (!i_reset && (!o_cfg_ddr || !OPT_DS || !OPT_EMMC))
		assert(!o_cfg_ds);
	always @(*)
	if (!i_reset && !o_cfg_ds)
		assert(!o_cfg_dscmd);
`endif
	// }}}

	// o_cfg_ddr: Transmit data on both edges of the clock
	// {{{
	//	Note: this requires o_cfg_clk90 support
	initial	o_cfg_ddr = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		o_cfg_ddr <= 1'b0;
	else if (wb_phy_stb && i_wb_sel[1])
		o_cfg_ddr <= i_wb_data[8];
	// }}}

	// o_cfg_width: Control the number of data bits, whether 1, 4, or 8
	// {{{
	//	SDIO uses either 1 or 4 data bits.
	//	eMMC can use 1, 4, or 8 data bits.
	initial	r_width = WIDTH_1W;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		r_width <= WIDTH_1W;
	else if (wb_phy_stb && i_wb_sel[1])
	begin
		case(i_wb_data[11:10])
		2'b00: r_width <= WIDTH_1W;
		2'b01: if (NUMIO < 4) r_width <= WIDTH_1W;
			else r_width <= WIDTH_4W;
		2'b10: if (NUMIO >= 8) r_width <= WIDTH_8W;
		2'b11: if (NUMIO >= 8) r_width <= WIDTH_8W;
			else if (NUMIO >= 4)	r_width <= WIDTH_4W;
			else			r_width <= WIDTH_1W;
		default: begin end
		endcase
	end

	assign	o_cfg_width = r_width;
	// }}}

	// o_cfg_ckspeed: Clock speed control
	// {{{
	initial	r_ckspeed = 252;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		r_ckspeed <= 252;
	else if (wb_phy_stb && i_wb_sel[0])
	begin
		r_ckspeed <= i_wb_data[7:0];
		if (!OPT_SERDES && !OPT_DDR && i_wb_data[7:0] < 2)
			r_ckspeed <= 8'h2;
		else if (!OPT_SERDES && i_wb_data[7:0] == 0)
			r_ckspeed <= 8'h1;
	end

	assign	o_cfg_ckspeed = r_ckspeed;
`ifdef	FORMAL
	always @(*)
	if (!i_reset && !OPT_SERDES && !OPT_DDR)
		assert(o_cfg_ckspeed >= 2);

	always @(*)
	if (!i_reset && !OPT_SERDES)
		assert(o_cfg_ckspeed >= 1);
`endif
	// }}}

	always @(*)
	begin
		w_phy_ctrl = 0;
		w_phy_ctrl[31:28] = LGFIFO; // Can also set lgblk=15, & read MAX
		w_phy_ctrl[27:24] = lgblk;
		w_phy_ctrl[23]    = OPT_1P8V;
		w_phy_ctrl[22]    = o_1p8v;
		w_phy_ctrl[21]    = o_cfg_dscmd;
		w_phy_ctrl[20:16] = o_cfg_sample_shift;
		w_phy_ctrl[15]    = r_clk_shutdown;
		w_phy_ctrl[14]    = o_cfg_clk90;
		w_phy_ctrl[13]    = o_pp_cmd;	// Push-pull CMD line
		w_phy_ctrl[12]    = o_pp_data;	// Push-pull DAT line(s)
		w_phy_ctrl[11:10] = r_width;
		w_phy_ctrl[9:8]   = { o_cfg_ds, o_cfg_ddr };
		w_phy_ctrl[7:0]   = i_ckspd; // r_ckspeed;
	end
	// }}}

	assign	o_crc_en = 1'b1;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Card detection
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// Depends upon the i_card_detect signal.  Set this signal to 1'b1 if
	// you your device doesn't have it.
	//
	//
	generate if (OPT_CARD_DETECT)
	begin : GEN_CARD_DETECT
		reg	[2:0]	raw_card_present;
		reg	[9:0]	card_detect_counter;
		reg		r_card_removed, r_card_present;

		// 3FF cross clock domains: i_card_detect->raw_card_present
		// {{{
		initial	raw_card_present = 0;
		always @(posedge i_clk)
		if (i_reset)
			raw_card_present <= 0;
		else
			raw_card_present <= { raw_card_present[1:0], i_card_detect };
		// }}}

		// card_removed: If the card is ever not present, then it has
		// {{{
		// been removed.  Set the removed flag so the user can see the
		// card has been removed, even if they come back to it later
		// and there's a card present.
		initial	r_card_removed = 1'b1;
		always @(posedge i_clk)
		if (i_reset)
			r_card_removed <= 1'b1;
		else if (!card_present)
			r_card_removed <= 1'b1;
		else if (wb_cmd_stb && i_wb_data[CARD_REMOVED_BIT]
					&& i_wb_sel[CARD_REMOVED_BIT/8])
			r_card_removed <= 1'b0;

		assign	card_removed = r_card_removed;
		// }}}

		// card_present: Require a card to be inserted for a period
		// {{{
		// of time before declaring it to be present.  This helps
		// to unbounce any card detection logic.
		initial	card_detect_counter = 0;
		always @(posedge i_clk)
		if (i_reset || !raw_card_present[2])
			card_detect_counter <= 0;
		else if (!(&card_detect_counter))
			card_detect_counter <= card_detect_counter + 1;

		initial r_card_present = 1'b0;
		always @(posedge i_clk)
		if (i_reset || !raw_card_present[2])
			r_card_present <= 1'b0;
		else if (&card_detect_counter)
			r_card_present <= 1'b1;

		assign	card_present = r_card_present;
		// }}}

	end else begin : NO_CARD_DETECT_SIGNAL

		assign	card_present = 1'b1;
		assign	card_removed = 1'b0;

		// Keep Verilator happy
		// {{{
		// Verilator coverage_off
		// Verilator lint_off UNUSED
		wire	unused_card_detect;
		assign	unused_card_detect = &{ 1'b0, i_card_detect };
		// Verilator lint_on  UNUSED
		// Verilator coverage_on
		// }}}
	end endgenerate

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Interrupt generation
	// {{{

	initial	o_int = 0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		o_int <= 1'b0;
	else begin
		o_int <= 1'b0;
		// 3 Types of interrupts:
		//
		case({ (o_tx_en || r_tx_request), (o_rx_en || r_rx_request)})
		// A) Command operation is complete, response is ready
		2'b00: if (i_cmd_done && cmd_busy) o_int <= 1'b1;
		//
		// B) Transmit to card operation is complete, and is now ready
		//	for another command (if desired)
		2'b10: if (o_tx_en && r_tx_sent && !i_tx_busy) o_int <= 1'b1;
		//
		// C) A block has been received.  We are now ready to receive
		//	another block (if desired)
		2'b01: if (o_rx_en && i_rx_done) o_int <= 1'b1;
		default: begin end
		endcase
		//
		if (i_cmd_done && i_cmd_err) o_int <= 1'b1;
		//
		// D) A card has been removed or inserted, and yet not
		// akcnowledged.
		if (OPT_CARD_DETECT && !card_present && !card_removed)
			o_int <= 1'b1;
		if (OPT_CARD_DETECT && card_present && card_removed)
			o_int <= 1'b1;
	end

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// FIFO / Memory handling
	// {{{

	// User write pointer
	// {{{
	initial	fif_wraddr = 0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		fif_wraddr <= 0;
	else if (wb_cmd_stb && ((i_wb_sel[1]
			&& (i_wb_data[USE_FIFO_BIT]
				|| i_wb_data[9:8] == R2_REPLY
				|| r_fifo != i_wb_data[FIFO_ID_BIT]))
			|| (i_wb_sel[0] && i_wb_data[7])))
		fif_wraddr <= 0;
	else if (i_wb_stb && !o_wb_stall && i_wb_we && i_wb_sel[0]
					&& (i_wb_addr == ADDR_FIFOA || i_wb_addr == ADDR_FIFOB))
		fif_wraddr <= fif_wraddr + 1;
	// }}}

	// User read pointer
	// {{{
	initial	fif_rdaddr = 0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		fif_rdaddr <= 0;
	else if (wb_cmd_stb && ((i_wb_sel[1]
			&& (i_wb_data[USE_FIFO_BIT]
				|| i_wb_data[9:8] == R2_REPLY
				|| r_fifo != i_wb_data[FIFO_ID_BIT]))
			|| (i_wb_sel[0] && i_wb_data[7])))
		fif_rdaddr <= 0;
	else if (i_wb_stb && !i_wb_we && i_wb_sel[0]
					&& (i_wb_addr == ADDR_FIFOA || i_wb_addr == ADDR_FIFOB))
		fif_rdaddr <= fif_rdaddr + 1;
	// }}}

	// TX

	// o_tx_mem_valid
	// {{{
	initial	o_tx_mem_valid = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_soft_reset)
		o_tx_mem_valid <= 0;
	else if (!o_tx_en || r_tx_sent
			|| (o_tx_mem_valid && i_tx_mem_ready && o_tx_mem_last))
		{ o_tx_mem_valid, tx_pipe_valid } <= 0;
	else if (!o_tx_mem_valid || i_tx_mem_ready || !tx_pipe_valid)
		{ o_tx_mem_valid, tx_pipe_valid } <= { tx_pipe_valid, 1'b1 };
	// }}}

	// tx_mem_addr
	// {{{
	always @(posedge i_clk)
	if (i_reset || !o_tx_en || o_soft_reset)
		tx_mem_addr <= 0;
	else if (!o_tx_mem_valid || i_tx_mem_ready || !tx_pipe_valid)
		tx_mem_addr <= tx_mem_addr + 1;
	// }}}

	always @(*)
		fif_a_rdaddr = (o_tx_en && !r_fifo) ? tx_mem_addr[LGFIFO32-1:$clog2(MW/32)] : fif_rdaddr;

	always @(*)
		fif_b_rdaddr = (o_tx_en &&  r_fifo) ? tx_mem_addr[LGFIFO32-1:$clog2(MW/32)] : fif_rdaddr;

	always @(*)
		blk_words = (1<<(lgblk-2))-1;

	// Verilator lint_off WIDTH
	always @(*)
		pre_tx_last = o_tx_en && (tx_mem_addr[LGFIFO32-1:$clog2(MW/32)] >= blk_words);
	// Verilator lint_on  WIDTH

	always @(posedge i_clk)
	if (!o_tx_mem_valid || i_tx_mem_ready || r_fifo)
		tx_fifo_a <= fifo_a[fif_a_rdaddr];

	always @(posedge i_clk)
	if (!o_tx_mem_valid || i_tx_mem_ready || !r_fifo)
		tx_fifo_b <= fifo_b[fif_b_rdaddr];

	always @(posedge i_clk)
	if (!o_tx_mem_valid || i_tx_mem_ready)
		tx_fifo_last <= pre_tx_last;

	// o_tx_mem_data
	// {{{
	generate if (MW <= 32)
	begin : NO_TX_SHIFT
		assign	tx_shift = 0;
	end else begin : GEN_TX_SHIFT
		reg	[$clog2(MW/32)-1:0]	r_tx_shift;

		always @(posedge i_clk)
		if (!o_tx_mem_valid || i_tx_mem_ready)
			r_tx_shift <= tx_mem_addr[$clog2(MW/32)-1:0];

		assign	tx_shift = r_tx_shift;
	end endgenerate

	always @(*)
	begin
		next_tx_mem = (r_fifo) ? tx_fifo_b : tx_fifo_a;
		next_tx_mem = next_tx_mem >> (32*tx_shift);
	end

	always @(posedge i_clk)
	if (!o_tx_mem_valid || i_tx_mem_ready)
		o_tx_mem_data <= next_tx_mem[31:0];
	// }}}

	// o_tx_mem_last
	// {{{
	always @(posedge i_clk)
	if (!o_tx_mem_valid || i_tx_mem_ready)
		o_tx_mem_last <= tx_fifo_last;
	// }}}

	// Writing to memory

	// Take a clock to arbitrate writes
	// {{{
	// WARNING: This isn't a proper arbiter.  There is no ability to stall
	// at present if multiple sources attempt to write to the FIFO at the
	// same time.  Hence always make sure to write to the FIFO that isn't
	// currently in use.  It is the software's responsibility to ping-pong.
	// Failing to ping pong may result in corruption.
	//

	// mem_wr_[strb|addr|data]_a: Arbitrate writes to FIFO A
	// {{{
	initial	mem_wr_strb_a = 0;
	always @(posedge i_clk)
	begin
		mem_wr_strb_a <= 0;

		if (i_wb_stb && i_wb_we && i_wb_addr == ADDR_FIFOA
				&& (|i_wb_sel))
		begin
			mem_wr_addr_a <= fif_wraddr;
			mem_wr_strb_a <= i_wb_sel;
			mem_wr_data_a <= i_wb_data;
		end

		if (!r_fifo && i_cmd_mem_valid)
		begin
			mem_wr_addr_a <= i_cmd_mem_addr;
			mem_wr_strb_a <= i_cmd_mem_strb;
			mem_wr_data_a <= i_cmd_mem_data;
		end

		if (!r_fifo && i_rx_mem_valid)
		begin
			mem_wr_addr_a <= i_rx_mem_addr;
			mem_wr_strb_a <= i_rx_mem_strb;
			mem_wr_data_a <= i_rx_mem_data;
		end

		if (i_reset || o_soft_reset)
			mem_wr_strb_a <= 0;
	end
	// }}}

	// mem_wr_[strb|addr|data]_b: Arbitrate writes to FIFO B
	// {{{
	initial	mem_wr_strb_b = 0;
	always @(posedge i_clk)
	begin
		mem_wr_strb_b <= 0;

		if (i_wb_stb && i_wb_we && i_wb_addr == ADDR_FIFOB
				&& (|i_wb_sel))
		begin
			mem_wr_addr_b <= fif_wraddr;
			mem_wr_strb_b <= i_wb_sel;
			mem_wr_data_b <= i_wb_data;
		end

		if (r_fifo && i_cmd_mem_valid)
		begin
			mem_wr_addr_b <= i_cmd_mem_addr;
			mem_wr_strb_b <= i_cmd_mem_strb;
			mem_wr_data_b <= i_cmd_mem_data;
		end

		if (r_fifo && i_rx_mem_valid)
		begin
			mem_wr_addr_b <= i_rx_mem_addr;
			mem_wr_strb_b <= i_rx_mem_strb;
			mem_wr_data_b <= i_rx_mem_data;
		end

		if (i_reset || o_soft_reset)
			mem_wr_strb_b <= 0;
	end
	// }}}

`ifdef	FORMAL
	always @(*)
	if (!i_reset)
		assert(!i_cmd_mem_valid || !i_rx_mem_valid);
`endif
	// }}}

	// Actually write to the memories
	// {{{
	always @(posedge i_clk)
	for(ika=0; ika<MW/8; ika=ika+1)
	if (mem_wr_strb_a[ika])
		fifo_a[mem_wr_addr_a[LGFIFOW-1:0]][ika*8 +: 8] <= mem_wr_data_a[ika*8 +: 8];


	always @(posedge i_clk)
	for(ikb=0; ikb<MW/8; ikb=ikb+1)
	if (mem_wr_strb_b[ikb])
		fifo_b[mem_wr_addr_b[LGFIFOW-1:0]][ikb*8 +: 8] <= mem_wr_data_b[ikb*8 +: 8];
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Wishbone Return handling
	// {{{

	always @(posedge i_clk)
	begin
		pre_data <= 0;

		case(i_wb_addr)
		ADDR_CMD: pre_data[31:0] <= w_cmd_word;
		ADDR_ARG: pre_data[31:0] <= r_arg;
		ADDR_PHY: pre_data[31:0] <= w_phy_ctrl;
		// 3'h3: pre_data <= w_ffta_word;
		// 3'h4: pre_data <= w_fftb_word;
		// 3'h5: DMA address (high, if !OPT_LITTLE_ENDIAN)
		// 3'h6: DMA address (low, if !OPT_LITTLE_ENDIAN)
		// 3'h7: DMA transfer length
		default: begin end
		endcase

		if (!i_wb_stb || i_wb_we)
			pre_data <= 0;

		pre_sel <= 0;
		if (i_wb_stb && !i_wb_we)
		begin
			if (i_wb_addr == ADDR_FIFOA)
				pre_sel <= 1;
			else if (i_wb_addr == ADDR_FIFOB)
				pre_sel <= 2;
		end
	end

	always @(posedge i_clk)
	begin
		o_wb_data <= 0;
		case(pre_sel)
		2'h0: o_wb_data[31:0] <= pre_data;
		2'h1: o_wb_data <= tx_fifo_a;
		2'h2: o_wb_data <= tx_fifo_b;
		default: begin end
		endcase
	end

	assign	o_wb_stall = 1'b0;

	initial	{ o_wb_ack, pre_ack } = 2'b00;
	always @(posedge i_clk)
	if (i_reset || !i_wb_cyc)
		{ o_wb_ack, pre_ack } <= 2'b00;
	else
		{ o_wb_ack, pre_ack } <= { pre_ack, i_wb_stb && !o_wb_stall };
	// }}}

	// Keep Verilator happy
	// {{{
	wire	unused;
	assign	unused = &{ 1'b0, next_tx_mem };
	// }}}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal properties
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
	reg	f_past_valid;

	initial	f_past_valid = 0;
	always @(posedge i_clk)
		f_past_valid <= 1'b1;

	always @(*)
	if (!f_past_valid)
		assume(i_reset);

	////////////////////////////////////////////////////////////////////////
	//
	// Wishbone interface
	// {{{
	localparam	F_LGDEPTH=3;
	wire	[F_LGDEPTH-1:0]	fwb_nacks, fwb_nreqs, fwb_outstanding;

	fwb_slave #(
		.AW(3), .DW(32),
		.F_LGDEPTH(3)
	) fwb (
		// {{{
		.i_clk(i_clk), .i_reset(i_reset),
		.i_wb_cyc(i_wb_cyc), .i_wb_stb(i_wb_stb), .i_wb_we(i_wb_we),
		.i_wb_addr(i_wb_addr), .i_wb_data(i_wb_data),
				.i_wb_sel(i_wb_sel),
		.i_wb_ack(o_wb_ack), .i_wb_stall(o_wb_stall),
			.i_wb_idata(o_wb_data), .i_wb_err(1'b0),
		.f_nreqs(fwb_nreqs), .f_nacks(fwb_nacks),
			.f_outstanding(fwb_outstanding)
		// }}}
	);

	always @(posedge i_clk)
	if (f_past_valid && i_wb_cyc)
	begin
		assert(fwb_outstanding == (pre_ack ? 1:0) + (o_wb_ack ? 1:0));
	end

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Command processing
	// {{{

	always @(*)
	if (!i_reset && o_cmd_request)
		assert(cmd_busy);

	always @(posedge i_clk)
	if (f_past_valid && $past(i_reset || (i_cmd_done && !w_selfreply_request)))
		assert(!cmd_busy);

	always @(posedge i_clk)
	if (f_past_valid && cmd_busy && !o_cmd_request)
		assume(i_cmd_busy);

	always @(posedge i_clk)
	if (f_past_valid && (!cmd_busy || o_cmd_request))
		assume(!i_cmd_done && !i_cmd_err && !i_cmd_mem_valid
					&& !i_cmd_response);

	always @(*)
	if (!cmd_busy || o_cmd_request || o_cmd_type != R2_REPLY)
		assume(!i_cmd_mem_valid);


	always @(posedge i_clk)
	if (f_past_valid && $past(!i_reset && o_cmd_request && !i_cmd_busy))
	begin
		assume(i_cmd_ercode == 2'b00);

		assert(!o_cmd_request);
	end

	always @(posedge i_clk)
	if (!f_past_valid || $past(i_reset || o_soft_reset))
		assert(!o_cmd_request);
	else if ($past(o_cmd_request && i_cmd_busy))
	begin
		assert(o_cmd_request);
		assert($stable(o_cmd_selfreply));
		assert($stable(o_cmd_type));
		assert($stable(o_cmd_id));
		assert($stable(o_arg));
	end

	// Self reply can only be set if o_cmd_request is also set
	always @(*)
	if (!i_reset)
	begin
		if (o_cmd_selfreply)
		begin
			assert(o_cmd_request && o_cmd_type == RNO_REPLY);
		end
	end

	// Only one interface should ever have access to the FIFO at a time
	always @(*)
	if (!i_reset)
	begin
		if (o_tx_en || r_tx_request)
		begin
			assert(!o_rx_en && !r_rx_request);
			assert(!cmd_busy || o_cmd_type != R2_REPLY);
		end else if (o_rx_en || r_rx_request)
		begin
			assert(!cmd_busy || o_cmd_type != R2_REPLY);
		end
	end

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Contract commands (listed at the top)
	// {{{
	reg	f_mem_request;

	always @(*)
	begin
		f_mem_request = wb_cmd_stb && (&i_wb_sel[1:0])
			&& ((i_wb_data[9:8] == R2_REPLY)
				|| (i_wb_data[USE_DMA_BIT] && OPT_DMA)
				|| i_wb_data[USE_FIFO_BIT]);
	end

	always @(posedge i_clk)
	if (f_past_valid && !$past(i_reset || o_soft_reset)
		&& !$past(o_cmd_request)
		&& !$past(cmd_busy)
		&& $past(wb_cmd_stb))
	begin
		if ($past(i_wb_sel[1:0] != 2'b11))
		begin
			assert(!o_cmd_request);
		end else if ($past(mem_busy && f_mem_request))
		begin
			// Can't start a command that would use memory, if the
			// memory is already in use
			assert(!o_cmd_request);
		end else begin
			if ($past(i_wb_data[7]))
			begin
				assert(!o_cmd_request);
			end else if ($past(i_wb_data[7:6] == 2'b01))
			begin
				assert(o_cmd_request);
			end else if ($past(i_wb_data[9:6] == 4'b00
					&&  i_wb_data[5:0] != 6'h0
					&& !(i_wb_data[USE_DMA_BIT] && OPT_DMA)
					&& !i_wb_data[USE_FIFO_BIT]))
			begin
				assert(o_cmd_request && o_cmd_selfreply);
			end else
				assert(!o_cmd_request);
		end

		if (o_cmd_request)
		begin
			assert(o_cmd_type == $past(i_wb_data[9:8]));
			assert(o_cmd_id   == $past(i_wb_data[6:0]));
			assert(o_arg      == $past(r_arg));
			assert(cmd_busy);
		end
	end

	always @(posedge i_clk)
	if (f_past_valid && !$past(i_reset || o_soft_reset) && !$past(mem_busy)
		&& !$past(r_cmd_err)
		&& !$past(cmd_busy)
		&& $past(wb_cmd_stb) && $past(&i_wb_sel[1:0]))
	begin
		if ($past(i_wb_data == 16'h0240))
		begin
			assert(o_cmd_request);
			assert(mem_busy);
		end

		if ($past(i_wb_data) == 16'h0940)
		begin
			assert(o_cmd_request);
			assert(r_rx_request);
		end

		if ($past(i_wb_data) == 16'h0d40)
		begin
			assert(o_cmd_request);
			assert(r_tx_request);
		end

		if ($past(i_wb_data) == 16'h0800)
		begin
			assert(!o_cmd_request);
			assert(r_rx_request);
		end

		if ($past(i_wb_data) == 16'h0c00)
		begin
			assert(!o_cmd_request);
			assert(r_tx_request);
		end
	end

	always @(posedge i_clk)
	if (f_past_valid && $past(wb_cmd_stb)
		&&(($past(i_wb_sel[1:0])==2'b11 && $past(i_wb_data == 16'h080))
		  || $past(i_wb_sel[1] && i_wb_data[FIFO_ID_BIT] != r_fifo)
		  || $past(i_wb_sel[1] && i_wb_data[USE_FIFO_BIT])
		  || $past(i_wb_sel[0] && i_wb_data[7])
		  ||($past(!o_cmd_request)&&(o_cmd_request
				&& o_cmd_type == R2_REPLY))))
	begin
		assert(fif_wraddr == 0);
		assert(fif_rdaddr == 0);
		if ($past(i_wb_sel[0] && i_wb_data[7]))
		begin
			assert(!$rose(o_cmd_request));
			assert(!$rose(mem_busy));
		end
	end

	always @(posedge i_clk)
	if (f_past_valid && !$past(i_reset || o_soft_reset)
		&& !$past(o_cmd_request)
		&& $past(wb_cmd_stb) && $past(&i_wb_sel[1:0]))
	begin
		if ($past(i_wb_data[15:0] == 16'h0028
			|| i_wb_data[15:0] == 16'h0040))
		begin
			assert(o_cmd_request);
			assert(o_cmd_selfreply);
			assert(o_cmd_type == RNO_REPLY);
			assert(o_cmd_id == $past(i_wb_data[6:0]));
		end
	end

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// TX Handling
	// {{{
	always @(*)
	if (!o_tx_en)
		assert(!o_tx_mem_valid);

	always @(posedge i_clk)
	if (!f_past_valid || $past(i_reset || o_soft_reset))
		assert(!o_tx_en);
	else if ($past(o_tx_mem_valid && !i_tx_mem_ready))
	begin
		assert(o_tx_mem_valid);
		assert($stable(o_tx_mem_data));
		assert($stable(o_tx_mem_last));
	end

	always @(*)
	if (!i_reset && o_tx_en)
		assert(!r_tx_request);

	// always @(posedge i_clk)
	//	assert(!o_tx_en || !o_rx_en);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// RX Handling
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(*)
	if (!o_rx_en)
		assume(!i_rx_mem_valid);

	always @(*)
	if (!i_reset)
		assert(!r_rx_request || !o_rx_en);

	always @(*)
	if (!i_reset)
		assert(!(r_rx_request || o_rx_en)|| !(r_tx_request || o_tx_en));

	always @(*)
	if (!i_reset)
		assert(!(cmd_busy && o_cmd_type == R2_REPLY)
			|| !(r_rx_request || o_rx_en));

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// FIFO check
	// {{{
	integer	fk;
	(* anyconst *)	reg	[LGFIFO32:0]	fc_addr;
	reg	[31:0]		f_word, f_mem;
	reg	[LGFIFO32:0]	f_txaddr;
	wire	[LGFIFOW:0]	fcwaddr;

	assign	fcwaddr = fc_addr[LGFIFO32:$clog2(MW/32)];

	initial	begin
		for(fk=0; fk<LGFIFOW; fk=fk+1)
		begin
			fifo_a[fk] = 0;
			fifo_b[fk] = 0;
		end
	end

	always @(*)
	if (!fc_addr[LGFIFO32])
		f_mem = fifo_a[fcwaddr[LGFIFOW-1:0]];
	else
		f_mem = fifo_b[fcwaddr[LGFIFOW-1:0]];

	always @(posedge i_clk)
	if (i_reset)
	begin
		assume(f_mem == 0);
		assume(f_word == 0);
	end else begin
		assert(f_word == f_mem);
	end

	initial	f_word = 0;
	always @(posedge i_clk)
	if (!fc_addr[LGFIFO32] && mem_wr_addr_a[LGFIFOW-1:0]
					== fc_addr[LGFIFO32-1:$clog2(MW/32)])
	begin
		for(fk=0; fk<MW/8; fk=fk+1)
		if (mem_wr_strb_a[fk])
			f_word[fk*8 +: 8] <= mem_wr_data_a[fk*8 +: 8];
	end else if (fc_addr[LGFIFO32] && mem_wr_addr_b[LGFIFOW-1:0]
					== fc_addr[LGFIFO32-1:$clog2(MW/32)])
	begin
		for(fk=0; fk<MW/8; fk=fk+1)
		if (mem_wr_strb_b[fk])
			f_word[fk*8 +: 8] <= mem_wr_data_b[fk*8 +: 8];
	end

	always @(posedge i_clk)
	if (i_reset || (o_tx_mem_valid && i_tx_mem_ready && o_tx_mem_last))
		f_txaddr <= 0;
	else if (r_tx_request)
		f_txaddr <= { r_fifo, {(LGFIFO32){1'b0}} };
	else if (o_tx_mem_valid && i_tx_mem_ready)
		f_txaddr <= f_txaddr + 1;

	always @(posedge i_clk)
	if (!i_reset && o_tx_mem_valid && f_txaddr == fc_addr)
		assert(o_tx_mem_data == f_word);

	always @(posedge i_clk)
	if (!i_reset && o_tx_mem_valid)
	begin
		assert(f_txaddr[LGFIFO32-1:0] < (1<<(lgblk-2)));
		assert(tx_mem_addr[LGFIFO32-1:0] < (1<<(lgblk-2))+2);
		assert(o_tx_mem_last == (f_txaddr[LGFIFO32-1:0] == (1<<(lgblk-2))-1));
	end

	// Need to relate f_txaddr to tx_mem_addr
	always @(*)
	if (!i_reset && o_tx_en && !r_tx_sent)
	begin
		assert(r_fifo == f_txaddr[LGFIFO32]);
		assert(tx_mem_addr[LGFIFO32-1:0] == f_txaddr[LGFIFO32-1:0]
			+ (o_tx_mem_valid ? 1:0) + (tx_pipe_valid ? 1:0));
		if (o_tx_mem_valid)
		begin
			assert(tx_pipe_valid);
		end

		if (o_tx_mem_valid && tx_pipe_valid && r_fifo == fc_addr[LGFIFO32]
			&& f_txaddr[LGFIFO32-1:0]+1 == fc_addr[LGFIFO32-1:0])
		begin
			assert(next_tx_mem == f_word);
		end

		if (o_tx_mem_valid && tx_pipe_valid)
		begin
			assert(tx_fifo_last == (f_txaddr[LGFIFO32-1:0]+1 >= (1<<(lgblk-2))-1));
		end

		if (!tx_pipe_valid)
		begin
			assert(tx_mem_addr == 0);
		end else if (!o_tx_mem_valid)
			assert(tx_mem_addr == 1);
	end

	always @(*)
	if (!i_reset && o_tx_en && r_tx_sent)
		assert(!tx_pipe_valid && !o_tx_mem_valid);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Register checking
	// {{{

	reg	f_past_soft;
	always @(posedge i_clk)
		f_past_soft <= o_soft_reset;

	// PHY register
	// {{{
	fwb_register #(
		.AW(3), .DW(MW), .ADDR(ADDR_PHY),
		.MASK(32'h0018_b100
			| (OPT_1P8V   ? 32'h0040_0000 : 32'h00)
			| (OPT_SERDES ? 32'h001f_0000 : 32'h00)
			| (OPT_DDR    ? 32'h0018_0000 : 32'h00)),
		.FIXED_BIT_MASK(32'hf080_0000
			| (OPT_1P8V   ? 32'h00: 32'h0040_0000)
			| (OPT_SERDES ? 32'h00
			:  OPT_DDR    ? 32'h0023_0200
			:               32'h0024_0200))
	) fwb_phy (
		// {{{
		.i_clk(i_clk), .i_reset(i_reset || o_soft_reset),
		.i_wb_stb(i_wb_stb), .i_wb_we(i_wb_we),
		.i_wb_addr(i_wb_addr), .i_wb_data(i_wb_data),
				.i_wb_sel(i_wb_sel),
		.i_wb_ack(pre_ack && !f_past_soft),
			.i_wb_return(pre_data),
		.i_register(w_phy_ctrl)
		// }}}
	);

	always @(*)
	if (!i_reset)
	begin
		assert(r_width != 2'b11);
		if (NUMIO < 4)
			assert(r_width == WIDTH_1W);
		else if (NUMIO < 8)
			assert(r_width == WIDTH_1W || r_width == WIDTH_4W);
	end

	always @(*)
	if (!i_reset && o_cfg_ds)
		assert(o_cfg_ddr);

	always @(*)
	if (!i_reset)
	begin
		assert(lgblk <= LGFIFO);
		assert(lgblk >= 2);
	end

	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Careless assumptions
	// {{{

	always @(*)
	if (o_rx_en || o_tx_en)
		assume(lgblk < 15);	// Assume no overflow ... for now

	// Assume the user won't do something dumb, like write to the same FIFO
	// we're reading from, or either read or write from the same FIFO we
	// are writing to
	// {{{
	always @(*)
	if (o_tx_en || r_tx_request)
		assume(!i_wb_stb || !i_wb_we
				|| i_wb_addr != ADDR_FIFOA + r_fifo);

	always @(*)
	if (cmd_busy && o_cmd_type == R2_REPLY)
		assume(!i_wb_stb || i_wb_addr != ADDR_FIFOA + r_fifo);

	always @(*)
	if (o_rx_en || r_rx_request)
		assume(!i_wb_stb || i_wb_addr != ADDR_FIFOA + r_fifo);
	// }}}
	// }}}
`endif	// FORMAL
// }}}
endmodule

////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	sdckgen.v
// {{{
// Project:	SDIO SD-Card controller
//
// Purpose:	Generate a digitally divided pre-serdes clock.  The serdes this
//		will feed is an 8:1 serdes.  Hence, we generate 8 outputs per
//	clock period.  This allows us to generate a clock with a 90 degree
//	offset, without needing to actually offset the clock by 90 degrees.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2018-2023, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`timescale	1ns/1ps
`default_nettype	none
// }}}
module	sdckgen #(
		// {{{
		// To hit 100kHz from a 100MHz clock, we'll need to divide by
		// 4, and then by another 250.  Hence, we'll need Lg(256)-2
		// bits.  (The first three are special)
		localparam	LGMAXDIV = 8
		// }}}
	) (
		// {{{
		input	wire			i_clk, i_reset,
		//
		input	wire			i_cfg_clk90,
		input	wire	[LGMAXDIV-1:0]	i_cfg_ckspd,
		input	wire			i_cfg_shutdown,
		//
		output	reg			o_ckstb,
		output	reg			o_hlfck,
		output	reg	[7:0]		o_ckwide,
		output	reg	[LGMAXDIV-1:0]	o_ckspd
		// }}}
	);

	// Local declarations
	// {{{
	localparam		NCTR = LGMAXDIV+2;
	reg			nxt_stb, nxt_clk;
	reg	[NCTR-1:0]	nxt_counter, counter;
	reg			clk90;
	reg	[LGMAXDIV-1:0]	ckspd;
	wire			w_clk90;
	wire	[LGMAXDIV-1:0]	w_ckspd;
	// }}}

	// nxt_stb, nxt_clk, nxt_counter
	// {{{
	always @(*)
	begin
		nxt_stb = 1'b0;
		nxt_clk = 1'b0;
		nxt_counter = counter;

		{ nxt_stb, nxt_counter[NCTR-3:0] } = counter[NCTR-3:0] - 1;

		if (nxt_stb)
		begin
			// Advance the top two bits
			{ nxt_clk, nxt_counter[NCTR-1:NCTR-2] }
						= nxt_counter[NCTR-1:NCTR-2] +1;

			if (ckspd <= 1)
			begin
				nxt_clk = 1;
				nxt_counter[NCTR-3:0] = 0;
			end else if (ckspd == 2)
			begin
				nxt_clk = counter[NCTR-1];
				nxt_counter[NCTR-3:0] = 0;
			end else
				nxt_counter[NCTR-3:0] = ckspd-3;
		end

		if (nxt_clk)
		begin
			if (i_cfg_ckspd <= 1)
				nxt_counter = {2'b11, {(NCTR-2){1'b0}} };
			else if (i_cfg_ckspd == 2)
				nxt_counter = { 2'b01, {(NCTR-2){1'b0}} };
			else
				nxt_counter[NCTR-3:0] = i_cfg_ckspd-3;
		end
	end

	always @(posedge i_clk)
	if (i_reset)
		counter <= 0;
	else if (nxt_clk && i_cfg_shutdown)
		counter <= { 2'b11, {(NCTR-2){1'b0}} };
	else
		counter <= nxt_counter;
	// }}}

	// w_clk90, w_ckspd: Register the requested clock speed
	// {{{
	always @(posedge i_clk)
	if (i_reset)
		clk90 <= 0;
	else
		clk90 <= w_clk90;

	always @(posedge i_clk)
	if (i_reset)
		ckspd <= 0;
	else
		ckspd <= w_ckspd;


	assign	w_clk90 = (nxt_clk) ? i_cfg_clk90 : clk90;
	assign	w_ckspd = (nxt_clk) ? i_cfg_ckspd : ckspd;
	// }}}

	// o_ckstb, o_ckwide
	// {{{
	initial	o_ckstb  = 1;
	initial	o_hlfck  = 1;
	initial	o_ckwide = 0;
	always @(posedge i_clk)
	if (i_reset)
	begin
		o_ckstb  <= 1;
		o_hlfck  <= 1;
		o_ckwide <= 0;
	end else if ((nxt_clk && i_cfg_shutdown) || (w_ckspd == 0))
	begin
		o_ckstb  <= 1'b1;	// Or should this be !i_cfg_shutdown?
		o_hlfck  <= 1'b1;
		o_ckwide <= (i_cfg_shutdown) ? 8'h00
				: (i_cfg_clk90) ? 8'h66 : 8'h33;
	end else if (w_ckspd == 1)
	begin
		o_ckstb  <= 1'b1;
		o_hlfck  <= 1'b1;
		o_ckwide <= (w_clk90) ? 8'h3c : 8'h0f;
	end else if (w_ckspd == 2)
	begin
		{ o_ckstb, o_hlfck } <= (!nxt_counter[NCTR-1]) ? 2'b10 : 2'b01;
		if (w_clk90)
			o_ckwide <= (!nxt_counter[NCTR-1]) ? 8'h0f : 8'hf0;
		else
			o_ckwide <= (!nxt_counter[NCTR-1]) ? 8'h00 : 8'hff;
	end else begin
		o_ckstb <= nxt_clk;
		o_hlfck <= (counter == {2'b01, {(NCTR-2){1'b0}} });
		if (w_clk90)
			o_ckwide <= {(8){nxt_counter[NCTR-1]
						^ nxt_counter[NCTR-2]}};
		else
			o_ckwide <= {(8){nxt_counter[NCTR-1]}};
	end
	// }}}

	always @(posedge i_clk)
		o_ckspd <= w_ckspd;
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal properties
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
	reg	f_past_valid;

	initial	f_past_valid = 1'b0;
	always @(posedge i_clk)
		f_past_valid <= 1'b1;

	always @(*)
	if (!f_past_valid)
		assume(i_reset);

	always @(*)
	if (i_cfg_ckspd == 0)
		assume(i_cfg_clk90);

	always @(posedge i_clk)
	if (f_past_valid)
	begin
		if (ckspd == 0)
		begin
			assert(o_ckstb);
			assert(counter == 0
				||counter == {2'b11,{(NCTR-2){1'b0}} });
		end
		if (ckspd == 1)
			assert(counter == {2'b11,{(NCTR-2){1'b0}} });
		if (ckspd == 2)
			assert(counter == 0
				|| counter == {2'b01,{(NCTR-2){1'b0}} }
				|| counter == {2'b10,{(NCTR-2){1'b0}} }
				|| counter == {2'b11,{(NCTR-2){1'b0}} });
		if (ckspd >= 3)
			assert(counter[NCTR-3:0] <= (ckspd-3));
	end

	always @(*)
	if (!i_reset && o_ckstb && o_hlfck)
		assert(ckspd <= 1 || (o_ckwide == 0 && nxt_clk));

	always @(*)
	if (!i_reset)
	case(o_ckwide)
	8'h00: if (nxt_clk)
		begin
			assert(counter == {2'b11,{(NCTR-2){1'b0}} } || ckspd == 0);
		end else if(!clk90)
		begin
			assert(counter[NCTR-1] == 1'b0);
		end else if(clk90)
		begin
			assert(counter[NCTR-1:NCTR-2] == 2'b00
				||counter[NCTR-1:NCTR-2] == 2'b11);
		end
	8'h0f: assert((!clk90 && ckspd == 1 && o_ckstb && o_hlfck)
			||(clk90 && ckspd == 2 && o_ckstb));
	8'hf0: assert(clk90 && ckspd == 2 && !o_ckstb && o_hlfck);
	8'hff: if(!clk90) assert(counter[NCTR-1] == 1'b1);
		else
			assert(counter[NCTR-1:NCTR-2] == 2'b01
				|| counter[NCTR-1:NCTR-2] == 2'b10);
	8'h3c: assert( clk90 && ckspd == 1 && o_ckstb && o_hlfck);
	8'h33: assert(!clk90 && ckspd == 0 && o_ckstb && o_hlfck);
	8'h66: assert( clk90 && ckspd == 0 && o_ckstb && o_hlfck);
	default: assert(0);
	endcase
`endif	// FORMAL
// }}}
endmodule

////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	sdcmd.v
// {{{
// Project:	SDIO SD-Card controller
//
// Purpose:	Bi-directional command line processor.  This generates the
//		command line inputs to the PHY, and receives its outputs.
//	Commands are requested from the CPU, and responses gathered and
//	returned to the register set.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2023, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`timescale	1ns/1ps
`default_nettype	none
// }}}
module	sdcmd #(
		// {{{
		// parameter	MW = 32,
		parameter [0:0]	OPT_DS = 1'b0,
		// parameter [0:0]	OPT_LITTLE_ENDIAN = 1'b0,
		parameter [0:0]	OPT_EMMC = 1'b1,
		parameter	LGTIMEOUT = 26,	// 500ms expected
		parameter	LGLEN = 9,
		parameter	MW = 32
		// }}}
	) (
		// {{{
		input	wire			i_clk, i_reset,
		// Configuration bits
		input	wire			i_cfg_ds,	// Use ASYNC
		input	wire			i_cfg_dbl,	// 2Bits/Clk
		input	wire			i_ckstb,
		// Controller interface
		// {{{
		input	wire			i_cmd_request,
		input	wire			i_cmd_selfreply,
		input	wire	[1:0]		i_cmd_type,
		input	wire	[6:0]		i_cmd,
		input	wire	[31:0]		i_arg,

		output	wire			o_busy,
		output	reg			o_done,
		output	reg			o_err,
		output	reg	[1:0]		o_ercode,
		// }}}
		// Send to the front end
		// {{{
		output	wire			o_cmd_en,
		// output	wire		o_pp_cmd,	// From CFG reg
		output	wire	[1:0]		o_cmd_data,
		// }}}
		// Receive from the front end
		// {{{
		input	wire	[1:0]		i_cmd_strb,
		input	wire	[1:0]		i_cmd_data,
		// input	wire		i_dat_busy,

		input	wire			S_ASYNC_VALID,
		input	wire	[1:0]		S_ASYNC_DATA,
		// }}}
		// Return the result
		output	reg			o_cmd_response,
		output	reg	[5:0]		o_resp,
		output	reg	[31:0]		o_arg,
		// Writes to memory
		// {{{
		output	reg			o_mem_valid,
		output	wire	[MW/8-1:0]	o_mem_strb,
		output	wire	[LGLEN-1:0]	o_mem_addr,	// Word address
		output	reg	[MW-1:0]	o_mem_data	// Outgoing data
		// }}}
		// }}}
	);

	// Local declarations
	// {{{
	localparam [1:0]	R_NONE = 2'b00,
				R_R1   = 2'b01,
				R_R2   = 2'b10;
				// R_R1b  = 2'b11;

	localparam [1:0]	ECODE_TIMEOUT = 2'b00,
				ECODE_OKAY    = 2'b01,
				ECODE_BADCRC  = 2'b10,
				ECODE_FRAMEERR= 2'b11;

	localparam	[6:0]	CRC_POLYNOMIAL = 7'h09;

	reg		active;
	reg	[5:0]	srcount;
	reg	[47:0]	tx_sreg;

	reg		waiting_on_response, cfg_ds, cfg_dbl, r_frame_err,
			response_active;
	wire		self_request;
	wire		lcl_accept;
	reg	[1:0]	cmd_type;
	reg	[7:0]	resp_count;
	wire		frame_err, w_done, crc_err, w_no_response;
	reg	[LGLEN+$clog2(MW/32)-1:0]	mem_addr;
	reg	[39:0]	rx_sreg;

	reg			rx_timeout;
	wire			no_timeout;
	reg	[LGTIMEOUT-1:0]	rx_timeout_counter;

	reg	[6:0]	crc_fill;
	reg		r_busy, new_data;

	reg		r_done;

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Send 48b command to card
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	initial { active, srcount } = 0;
	always @(posedge i_clk)
	if (i_reset)
	begin
		active <= 0;
		srcount <= 0;
	end else if (lcl_accept)
	begin
		srcount <= 48;
		active  <= 1;
		// sreg <= { i_cmd, i_arg, CMDCRC({ i_cmd, i_arg }), 1'b1 };
	end else if (i_ckstb && srcount != 0)
	begin
		if (cfg_dbl)
		begin
			// sreg <= { sreg[45:0], 2'b11 };
			active <= (srcount > 2);
			srcount <= srcount - 2;
		end else begin
			// sreg <= { sreg[46:0], 2'b1 };
			active <= (srcount > 1);
			srcount <= srcount - 1;
		end
	end
	
	always @(posedge i_clk)
	if (i_reset)
		tx_sreg <= 48'hffff_ffff_ffff;
	else if (lcl_accept)
		tx_sreg <= { 1'b0, i_cmd, i_arg,
				CMDCRC({ 1'b0, i_cmd, i_arg }), 1'b1 };
	else if (i_ckstb)
	begin
		if (cfg_dbl)
			tx_sreg <= { tx_sreg[45:0], 2'b11 };
		else
			tx_sreg <= { tx_sreg[46:0], 1'b1 };
	end

	assign	o_cmd_en = active;
	assign	o_cmd_data = (cfg_dbl) ? tx_sreg[47:46] : {(2){tx_sreg[47]}};

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Receive response from card
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// waiting_on_response
	// {{{
	initial	waiting_on_response = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		waiting_on_response <= 1'b0;
	else if (lcl_accept)
		waiting_on_response <= (i_cmd_type != R_NONE);
	else if (o_done)
		waiting_on_response <= 1'b0;
	// }}}

	// cfg_ds, cfg_dbl, cmd_type
	// {{{
	always @(posedge i_clk)
	if (i_reset)
		{ cfg_ds, cfg_dbl, cmd_type } <= 4'b0;
	else if (lcl_accept)
		{ cfg_ds, cfg_dbl, cmd_type } <= { (i_cfg_ds && OPT_DS), i_cfg_dbl, i_cmd_type };
	// }}}

	// new_data
	// {{{
	always @(posedge i_clk)
	if (i_reset || !waiting_on_response || active)
		new_data <= 0;
	else if (OPT_DS && cfg_ds)
		new_data <= S_ASYNC_VALID;
	else
		new_data <= |i_cmd_strb;
	// }}}

	// resp_count
	// {{{
	always @(posedge i_clk)
	if (i_reset || !waiting_on_response || active || lcl_accept)
		resp_count <= 0;
	else if (resp_count < 192)
	begin
		if (OPT_DS && cfg_ds)
		begin
			if (S_ASYNC_VALID)
				resp_count <= resp_count + 2;
		end else if (cmd_type[0])
		begin
			if (resp_count + (i_cmd_strb[1] ? 1:0)
					+ (i_cmd_strb[0] ? 1:0) >= 48)
			begin
				resp_count <= 48;
			end else begin
				resp_count <= resp_count + (i_cmd_strb[1] ? 1:0)
						+ (i_cmd_strb[0] ? 1:0);
			end
		end else if (resp_count + (i_cmd_strb[1] ? 1:0)
						+ (i_cmd_strb[0] ? 1:0) >= 136)
		begin
			resp_count <= 136;
		end else
			resp_count <= resp_count + (i_cmd_strb[1] ? 1:0)
							+ (i_cmd_strb[0] ? 1:0);
	end

	always @(posedge i_clk)
	if (i_reset || !waiting_on_response || active || lcl_accept)
		response_active <= 0;
	else if (OPT_DS && cfg_ds)
	begin
		if (S_ASYNC_VALID)
			response_active <= 1;
	end else if (i_cmd_strb[1])
		response_active <= 1;
`ifdef	FORMAL
	always @(*)
	if (!i_reset)
		assert(response_active == (resp_count != 0));
`endif
	// }}}

	// rx_sreg
	// {{{
	always @(posedge i_clk)
	if (i_reset || !waiting_on_response || active)
		rx_sreg <= 0;
	else if (OPT_DS && cfg_ds)
	begin
		if (S_ASYNC_VALID)
			rx_sreg <= { rx_sreg[37:0], S_ASYNC_DATA[1:0] };
	end else if (cmd_type[0])
	begin
		if (resp_count < 47 && i_cmd_strb[1])
		begin
			if (i_cmd_strb[0])
				rx_sreg <= { rx_sreg[37:0], i_cmd_data[1:0] };
			else
				rx_sreg <= { rx_sreg[38:0], i_cmd_data[1] };
		end else if (resp_count < 48 && i_cmd_strb[1])
			rx_sreg <= { rx_sreg[38:0], i_cmd_data[1] };
	end else begin
		if (resp_count < 135 && i_cmd_strb[1])
		begin
			if (i_cmd_strb[0])
				rx_sreg <= { rx_sreg[37:0], i_cmd_data[1:0] };
			else
				rx_sreg <= { rx_sreg[38:0], i_cmd_data[1] };
		end else if (resp_count < 136 && i_cmd_strb[1])
			rx_sreg <= { rx_sreg[38:0], i_cmd_data[1] };
	end
	// }}}

	assign	w_done = waiting_on_response
			&&((cmd_type == R_R2 && o_mem_valid && o_mem_addr >= 3)
			|| (cmd_type[0] && resp_count == 48));

	assign	w_no_response = (active && cmd_type == R_NONE && i_ckstb
						// Verilator lint_off WIDTH
						&& (srcount == 1 + cfg_dbl));
						// Verilator lint_on  WIDTH

	// o_cmd_response
	// {{{
	initial	o_cmd_response = 1'b0;
	always @(posedge i_clk)
	if (i_reset || !waiting_on_response || cmd_type == R_NONE || o_cmd_response)
		o_cmd_response <= 1'b0;
	else if (!cmd_type[1])
		o_cmd_response <= (resp_count == 48) && !r_done;
	else // if (cmd_type == R_R2)
		o_cmd_response <= (resp_count == 136) && !r_done;
	// }}}

	// o_resp, o_arg
	// {{{
	initial	o_resp = 6'h0;
	always @(posedge i_clk)
	if (i_reset || !waiting_on_response)
		o_resp <= 6'b0;
	else if (resp_count == 8)
		o_resp <= rx_sreg[5:0];

	initial	o_arg = 32'h0;
	always @(posedge i_clk)
	if (i_reset || !waiting_on_response)
		o_arg <= 32'b0;
	else if (cmd_type == R_R2)
	begin
		o_arg  <= 32'h0;
	end else if (resp_count == 47)
		o_arg <= rx_sreg[7 +: 32];
	else if (resp_count == 46)
		o_arg <= rx_sreg[6 +: 32];
	// }}}

	//////////
	//
	// Writes to memory
	//

	// o_mem_valid
	// {{{
	initial	o_mem_valid = 1'b0;
	always @(posedge i_clk)
	if (i_reset || cmd_type != R_R2 || !waiting_on_response
						|| rx_timeout || mem_addr >= 4)
		o_mem_valid <= 1'b0;
	else
		o_mem_valid <= !o_mem_valid && new_data
			&& (resp_count[4:0] == 8 && resp_count[7:5] != 0);
	// }}}

	// o_mem_strb
	// {{{
	generate if (MW==32)
	begin : GEN_FULL_STRB
		assign	o_mem_strb = 4'hf;
	end else begin : GEN_SUBSTRB
		reg	[MW/8-1:0]	r_mem_strb;

		initial	r_mem_strb = 0;
		always @(posedge i_clk)
		if (i_reset || cmd_type != R_R2 || !waiting_on_response)
			r_mem_strb <= { 4'hf, {(MW/8-1){1'b0}} };
		else if (o_mem_valid)
			r_mem_strb<= { r_mem_strb[3:0], r_mem_strb[MW/32-1:4] };

		assign	o_mem_strb = r_mem_strb;
	end endgenerate
	// }}}

	// o_mem_addr
	// {{{
	initial	mem_addr = 0;
	always @(posedge i_clk)
	if (i_reset || cmd_type != R_R2 || !waiting_on_response || lcl_accept)
		mem_addr <= 0;
	else if (o_mem_valid)
		mem_addr <= mem_addr + 1;

	assign	o_mem_addr = mem_addr[LGLEN-1:$clog2(MW/32)];
	// }}}

	// o_mem_data
	// {{{
	always @(posedge i_clk)
	if (resp_count[4:0] == 8 && resp_count[7:5] != 0)
		o_mem_data <= {(MW/32){rx_sreg[31:0]}};
	// }}}

	// Frame error detection
	// {{{
	initial	r_frame_err = 1'b0;
	always @(posedge i_clk)
	if (i_reset || !waiting_on_response)
		r_frame_err <= 1'b0;
	else if (lcl_accept)
		r_frame_err <= 1'b0;
	else if (resp_count == 2 && rx_sreg[1:0] != 2'b00)
		r_frame_err <= 1'b1;
	
	assign	frame_err = r_frame_err || (waiting_on_response
			&&((cmd_type[1] && !rx_sreg[0] && resp_count == 48)
			||((cmd_type==R_R2&& !rx_sreg[0] && resp_count == 136))));
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// IRQ handling
	// {{{

	generate if (OPT_EMMC)
	begin : GEN_IRQ_SUPPORT
		reg	r_self_request, r_no_timeout;

		// Trust eMMC to make things difficult.
		//
		// If it weren't for the EMMC GO_IRQ_STATE command, every
		// command would receive a reply and no command/reply pairs
		// could be interrupted.  Further, we'd know that if a response
		// didn't come back within our timeout window that no response
		// would be available.
		//
		// The eMMC GO_IRQ_STATE command changes this.
		//
		// Following a GO_IRQ_STATE command, we're not allowed to
		// timeout here.  GO_IRQ_STATE is followed by a wait for the
		// card to generate an interrupt.  So, our first change to this
		// paradigm, is that we have to wait for this interrupt--not any
		// timeout.  Second, if the eMMC chip doesn't generate an
		// interrupt then the CPU is allowed to generate one.  This
		// leads to our second change: the controller will be busy,
		// waiting on the IRQ response, but yet it now needs to
		// interrupt that wait to send a command that looks like a
		// reply.  (i.e. the first two bits are not 2'b01, but rather
		// 2'b00)
		//
		// We'll use i_cmd_selfreply for this purpose.
		//
		// When i_cmd_selfreply is true, we'll need to drop o_busy
		// but only when we aren't already transmitting--i.e. when
		// !active--even if we don't accept the command.  (We won't
		// accept the command if a response has already begun ...)
		//	We need to drop on a self request even if
		//	resp_count != 0.  Therefore, we'll accept the command
		//	if we are not active, and the slave hasn't started
		//	replying (yet)
		//

		// self_request
		// {{{
		always @(posedge i_clk)
		if (i_reset)
			r_self_request <= 0;
		else if (!o_busy || active)
			r_self_request <= 0;
		else if (i_cmd_selfreply)
			r_self_request <= 1;
		// }}}

		// no_timeout
		// {{{
		always @(posedge i_clk)
		if (i_reset)
			r_no_timeout <= 0;
		else if (lcl_accept)
			// No timeouts for GO_IRQ_STATE commands in eMMC mode
			r_no_timeout <= (i_cmd == 7'h68);
		else if (response_active)
			// Once a response starts, we need the timeout--lest
			// DS only show up for some bits and not others.
			r_no_timeout <= 1'b0;
		// }}}

		assign	lcl_accept = i_cmd_request && !o_busy
			&& (o_done || !r_busy || (self_request
					&& (!response_active || rx_timeout)));
		assign	self_request = r_self_request;
		assign	no_timeout = r_no_timeout;
`ifdef	FORMAL
		always @(posedge i_clk)
		if (!i_reset && !i_cmd_selfreply)
			assert(!r_self_request);
`endif
	end else begin : NO_IRQ_SUPPORT

		assign	self_request = 0;
		assign	no_timeout   = 0;

		assign	lcl_accept = i_cmd_request && !o_busy;

		// Keep Verilator happy
		// {{{
		// Verilator lint_off UNUSED
		wire	unused_emmc;
		assign	unused_emmc = &{ 1'b0, i_cmd_selfreply, response_active };
		// Verilator lint_on  UNUSED
		// }}}
	end endgenerate

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// RX Timeout handling
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	initial	rx_timeout = 0;
	initial	rx_timeout_counter = -1;
	always @(posedge i_clk)
	if (i_reset || !waiting_on_response || active || r_done || no_timeout
			|| lcl_accept)
	begin
		rx_timeout <= 0;
		rx_timeout_counter <= -1;
	end else if (!rx_timeout && (
			(OPT_DS && i_cfg_ds && S_ASYNC_VALID)
			|| ((!OPT_DS || !i_cfg_ds) && i_cmd_strb != 0)))
	begin
		// Recommended timeout is 500ms
		rx_timeout <= 0;
		rx_timeout_counter <= -1;
	end else // if (i_ckstb)	// Counter is in ms, not clock ticks
	begin
		if (rx_timeout_counter != 0)
			rx_timeout_counter <= rx_timeout_counter - 1;
		if (rx_timeout_counter <= 1)
			rx_timeout <= 1;
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// CRC handling
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(posedge i_clk)
	if (i_reset || !waiting_on_response || o_cmd_en)
		crc_fill <= 0;
	else if (cmd_type[0] || resp_count > 7)
	begin
		if (OPT_DS && cfg_ds && S_ASYNC_VALID)
			crc_fill <= STEPCRC(STEPCRC(crc_fill,
					S_ASYNC_DATA[1]), S_ASYNC_DATA[0]);
		else if ((!OPT_DS || !cfg_ds) && i_cmd_strb == 2'b11
				&& (resp_count < 47
					|| (!cmd_type[0] && resp_count < 135)))
			crc_fill <= STEPCRC(STEPCRC(crc_fill,
					i_cmd_data[1]), i_cmd_data[0]);
		else if ((!OPT_DS || !cfg_ds) && i_cmd_strb[1]
				&&(resp_count < 48
					|| (!cmd_type[0] && resp_count < 136)))
			crc_fill <= STEPCRC(crc_fill, i_cmd_data[1]);
	end else if ((!OPT_DS || !cfg_ds) && resp_count > 6
					&& i_cmd_strb == 2'b11)
		crc_fill <= STEPCRC(crc_fill, i_cmd_data[0]);

	assign	crc_err = w_done && (crc_fill != CRC_POLYNOMIAL);


	function automatic [6:0] STEPCRC(input [6:0] fill, input i_bit);
		// {{{
	begin
		if (fill[6] ^ i_bit)
			STEPCRC = { fill[5:0], 1'b0 } ^ CRC_POLYNOMIAL;
		else
			STEPCRC = { fill[5:0], 1'b0 };
	end endfunction
	// }}}

	function automatic [6:0] CMDCRC(input [39:0] cmd);
		// {{{
		reg	[6:0]	fill;
		integer		icrc;
	begin
		fill = 0;

		for(icrc=0; icrc<8+32; icrc=icrc+1)
			fill = STEPCRC(fill, cmd[39-icrc]);

		CMDCRC = fill;
	end endfunction
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// ERR handling
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	initial { o_err, o_ercode } = 3'h0;
	always @(posedge i_clk)
	if (i_reset || o_done || w_no_response || lcl_accept)
		o_err <= 1'b0;
	else if (rx_timeout && !r_done)
		o_err <= 1'b1;
	else if (r_done && i_ckstb)
		o_err <= (o_ercode != ECODE_OKAY);

	initial o_ercode = 2'h0;
	always @(posedge i_clk)
	if (i_reset || active || lcl_accept || w_no_response || o_done)
		o_ercode <= 2'b00;
	else if (!r_done)
	begin
		if (w_done)
		begin
			o_ercode <= ECODE_OKAY;
			if (frame_err)
				o_ercode <= ECODE_FRAMEERR;
			if (crc_err)
				o_ercode <= ECODE_BADCRC;
		end else if (rx_timeout)
			o_ercode <= ECODE_TIMEOUT;
	end
	// }}}

	initial	r_done = 1'b0;
	always @(posedge i_clk)
	if (i_reset || w_no_response || o_done || lcl_accept)
		r_done <= 1'b0;
	else if (w_done || rx_timeout)
		r_done <= 1'b1;
	// else // if (i_ckstb)
	//	r_done <= 1'b0;

	initial	o_done = 1'b0;
	always @(posedge i_clk)
	if (i_reset || o_done || lcl_accept)
		o_done <= 1'b0;
	else
		o_done <= (rx_timeout || w_no_response
					|| (r_done && i_ckstb));

	// r_busy is true if we are unable to accept a command
	initial	r_busy = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		r_busy <= 1'b0;
	else if (lcl_accept)
		r_busy <= 1'b1;
	else if (o_done)
		r_busy <= 1'b0;

	assign	o_busy = (r_busy && !self_request) || !i_ckstb;

	//
	// Make verilator happy
	// {{{
	// verilator coverage_off
	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, R_R1, rx_sreg[39] };
	// verilator lint_on  UNUSED
	// verilator coverage_on
	// }}}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal properties
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
	(* anyconst *) reg f_nvr_request;
	reg	f_past_valid, f_busy;
	reg	[7:0]	f_last_resp_count;
	reg	[47:0]	f_tx_reg, f_tx_now;
	wire	[5:0]	f_txshift;


	initial	f_past_valid = 0;
	always @(posedge i_clk)
		f_past_valid <= 1;

	always @(*)
	if (!f_past_valid)
		assume(i_reset);

	always @(*)
	if (!i_reset && f_nvr_request)
	begin
		assume(!i_cmd_request);
		assert(!active);
	end
	////////////////////////////////////////////////////////////////////////
	//
	// Command requests
	// {{{
	always @(posedge i_clk)
	if (!f_past_valid || $past(i_reset))
		assume(!i_cmd_request);
	else if ($past(i_cmd_request && o_busy))
	begin
		assume(i_cmd_request);
		assume($stable(i_cmd_selfreply));
		assume($stable(i_cmd));
		assume($stable(i_arg));
		assume($stable(i_cmd_type));
	end

	initial	f_busy = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		f_busy <= 1'b0;
	else if (i_cmd_request && !o_busy)
		f_busy <= 1'b1;
	else if (o_done)
		f_busy <= 1'b0;


	always @(*)
	if (!i_reset && i_cmd_selfreply)
	begin
		assume(i_cmd_request);
		assume(i_cmd_type == R_NONE);
	end

	always @(posedge i_clk)
	if (!i_reset && f_busy)
	begin
		assume($stable(i_cfg_ds));
		assume($stable(i_cfg_dbl));
	end

	always @(posedge i_clk)
	if (!f_past_valid || $past(i_reset))
	begin
		assert(!f_busy);
		assert(!r_busy);
		assert(!o_done);
	end else begin
		if (!f_busy)
			assert(!r_busy);
		if (!r_busy)
			assert(!active);
		if ($past(o_done && !lcl_accept))
		begin
			assert(!r_busy);
			assert(!f_busy);
		end
	end

	always @(posedge i_clk)
	if (!i_reset && r_busy && !r_done && cmd_type != R_R2)
		assert(!o_err && o_ercode == 2'b00);

	always @(*)
	if (!i_reset && o_err)
		assert(o_done);

	always @(*)
	if (!i_reset && !r_done)
		assert(o_ercode == ECODE_TIMEOUT);

	always @(posedge i_clk)
	if (!i_reset && $past(o_cmd_response))
		assert(!o_cmd_response);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// IO
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(posedge i_clk)
	if (f_past_valid && !$past(i_reset) && !$past(i_ckstb))
	begin
		assert($stable(o_cmd_en));
		assert($stable(o_cmd_data));
	end

	always @(posedge i_clk)
	if ($past(i_reset || o_cmd_en))
		assume(!S_ASYNC_VALID && i_cmd_strb == 0);

	always @(*)
	if (!i_cmd_strb[1] || !cfg_dbl)
		assume(!i_cmd_strb[0]);

	always @(*)
	if (!i_reset && !OPT_DS)
		assert(!cfg_ds);

	always @(*)
	if (!i_reset && (!OPT_DS || !cfg_ds))
		assume(!S_ASYNC_VALID);
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Contract
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(posedge i_clk)
	if (i_cmd_request && !o_busy)
		f_tx_reg <= { 1'b0, i_cmd, i_arg, CMDCRC({ 1'b0, i_cmd, i_arg }), 1'b1 };

	assign	f_txshift = 48 - srcount;

	integer	f_txcs;
	always @(*)
	begin
		f_tx_now = f_tx_reg;
		for(f_txcs=0; f_txcs<48; f_txcs=f_txcs+1)
		if (f_txcs < f_txshift)
			f_tx_now = { f_tx_now[46:0], 1'b1 };
	end

	always @(*)
	if (f_past_valid)
	begin
		if (!active)
		begin
			assert(&tx_sreg);
			assert(!o_cmd_en);
			assert(o_cmd_data == 2'b11);
		end else begin
			assert(o_cmd_en);
			assert(tx_sreg == f_tx_now);
		end
	end


	// }}}
	always @(posedge i_clk)
		f_last_resp_count <= resp_count;

	always @(*)
	if (!i_reset && (cfg_ds && OPT_DS))
		assert(!resp_count[0]);

	always @(*)
	if (!i_reset && (!cfg_dbl || resp_count[0]))
		assume(i_cmd_strb != 2'b11);

	always @(*)
	if (!i_reset && active)
		assert(waiting_on_response == (cmd_type != R_NONE));

	always @(*)
	if (!i_reset && (active || waiting_on_response))
		assert(r_busy);

	always @(*)
	if (!i_reset)
	begin
		if (active || !waiting_on_response || cmd_type != R_R2)
			assert(!o_mem_valid);

		if (active)
			assert(resp_count == 0);

		if (resp_count < 8+32 || cmd_type != R_R2 || active)
		begin
			assert(mem_addr == 0);
		end else if (r_done && !rx_timeout)
		begin
			assert(mem_addr == 4);
		end else if (waiting_on_response && !rx_timeout)
		begin
			assert(mem_addr + o_mem_valid == ((f_last_resp_count-8)>>5));
		end

		if (cmd_type == R_NONE)
		begin
			assert(resp_count == 0);
		end

		if (cmd_type[0] && resp_count == 48 && r_busy)
		begin
			assert(w_done || r_done);
		end

		if (cmd_type[0] && resp_count > 48 && r_busy)
		begin
			assert(w_done || r_done);
		end

		if (resp_count > 50 && !r_done && r_busy)
		begin
			assert(cmd_type == R_R2);
		end

		if (!r_busy)
			assert(!waiting_on_response);
		if (!active && r_busy && !o_done)
			assert(waiting_on_response);

		if (r_busy && (resp_count > (8+128)))
		begin
			assert(w_done || r_done);
		end

		if (r_busy && !r_done)
		begin
			assert(o_mem_addr <= 3);
		end

	end

	always @(*)
		assert(srcount <= 48);
	always @(*)
		assert(active == (srcount != 0));
	always @(*)
	if (active && !i_reset && cfg_dbl)
		assert(srcount[0] == 1'b0);

	always @(*)
	if (!i_reset && cmd_type == R_NONE)
		assert(!waiting_on_response);

	always @(*)
		assert(rx_timeout == (rx_timeout_counter == 0));

	always @(*)
	if (!i_reset && !r_busy)
		assert(!rx_timeout);

	always @(*)
	if (!i_reset && active)
		assert(!o_err && o_ercode == 2'b00);

	always @(*)
	if (!i_reset)
	begin
		if (!r_busy)
		begin
			assert(!r_done);
		end
		if (active)
		begin
			assert(!r_done);
		end

		if (!rx_timeout)
		begin
			if (cmd_type[0] && resp_count < 48)
			begin
				assert(!r_done);
			end

			if (cmd_type == R_R2 && resp_count < 136)
			begin
				assert(!r_done);
			end
		end
		if (cmd_type == R_NONE)
		begin
			assert(!waiting_on_response);
		end
	end

	always @(*)
	if (!i_reset)
	begin
		assert(r_busy == (active || waiting_on_response ||o_done));
		if (o_done)
			assert(r_busy);
	end

	always @(*)
	if (!i_reset && !f_busy)
		assert(!o_done);

	// always @(*) if (!i_reset && r_done) assert(!r_busy || o_done);

	always @(*)
	if (!i_reset)
		assert(f_busy == r_busy);

	always @(*)
	if (!i_reset && o_err)
		assert(o_ercode != ECODE_OKAY);
	////////////////////////////////////////////////////////////////////////
	//
	// Coverage
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//


	always @(posedge i_clk)
	if (!i_reset && o_done)
		cover(i_cmd_type == R_NONE);

	always @(posedge i_clk)
	if (!i_reset && o_done)
	begin
		cover(i_cmd_type == R_R1 && !o_err);
		cover(i_cmd_type == R_R1 && o_err && o_ercode == ECODE_BADCRC);
		cover(i_cmd_type == R_R1 && o_err && o_ercode== ECODE_FRAMEERR);

		// Caution!  These will take at least 136+49+2 clocks!
		cover(i_cmd_type == R_R2 && !o_err);
		cover(i_cmd_type == R_R2 && o_err && o_ercode == ECODE_BADCRC);
		cover(i_cmd_type == R_R2 && o_err && o_ercode== ECODE_FRAMEERR);
	end

	always @(posedge i_clk)
	if (!i_reset && r_busy && i_cmd_selfreply)
		cover(!o_busy);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Careless assumptions
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// always @(*) if (r_busy && cfg_dbl)
	//	assume(i_cmd_strb[1] == i_cmd_strb[0]);


	// }}}
`endif	// FORMAL
// }}}
endmodule

////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	sdrxframe.v
// {{{
// Project:	SDIO SD-Card controller
//
// Purpose:	Process incoming data from the front end.  Data will come in
//		on (potentially) every edge of DS.  We need to turn it here
//	into one data stream for each IO pin, check the CRC on each data
//	stream, and then compose the results into (up to) 32-bits per clock
//	cycle to be written to the SRAM on an outgoing stream.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2018-2023, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`timescale 1ns/1ps
`default_nettype	none
// }}}
module	sdrxframe #(
		// {{{
		parameter	LGLEN = 15, NUMIO=4,
		parameter	MW = 32,
		localparam	LGLENW = LGLEN-$clog2(MW/8),
		parameter [0:0]	OPT_LITTLE_ENDIAN = 1'b0,
		parameter [0:0]	OPT_DS = 1'b0,
		parameter [0:0]	OPT_LOWPOWER = 1'b0,
		parameter	LGTIMEOUT = 23	// 8 of slowest clock cycle
		// }}}
	) (
		// {{{
		input	wire			i_clk, i_reset,
		//
		input	wire			i_cfg_ds, i_cfg_ddr,
		input	wire	[1:0]		i_cfg_width,
		//
		input	wire			i_rx_en,
		input	wire			i_crc_en,
		input	wire	[LGLEN:0]	i_length,	// In bytes
		//
		input	wire	[1:0]		i_rx_strb,
		input	wire	[15:0]		i_rx_data,

		input	wire			S_ASYNC_VALID,
		input	wire	[31:0]		S_ASYNC_DATA,

		output	wire			o_mem_valid,
		output	wire	[MW/8-1:0]	o_mem_strb,
		output	wire	[LGLENW-1:0]	o_mem_addr,	// Word address
		output	wire	[MW-1:0]	o_mem_data,	// Outgoing data

		output	reg			o_active,
		output	reg			o_done,
		output	reg			o_err,
		output	reg			o_ercode
		// }}}
	);

	// Local declarations
	// {{{
	localparam	[1:0]	WIDTH_1W = 2'b00,
				WIDTH_4W = 2'b01,
				// Verilator lint_off UNUSED
				WIDTH_8W = 2'b10;
				// Verilator lint_on  UNUSED

	localparam	NCRC = 16;
	localparam	[NCRC-1:0]	CRC_POLYNOMIAL = 16'h1021;
	genvar	gk;

	reg	[4:0]	sync_fill;
	reg	[19:0]	sync_sreg;

	reg		s2_valid;
	reg	[1:0]	s2_fill;
	reg	[15:0]	s2_data;

	reg				mem_valid, mem_full, rnxt_strb;
	reg	[MW/8-1:0]		mem_strb;
	reg	[MW-1:0]		mem_data;
	reg	[LGLENW-1:0]		mem_addr;
	reg	[$clog2(MW/8)-1:0]	subaddr, next_subaddr;
	reg	[7:0]			rnxt_data;

	reg			busy, data_phase, load_crc, pending_crc;
	reg	[LGLEN+4-1:0]	rail_count;

	wire	[NUMIO*2-1:0]	err;

	reg	[LGTIMEOUT-1:0]	r_timeout;
	reg			r_watchdog;

	reg	last_strb;
	reg	w_done;

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Notes:
	// {{{
	// Two channels of processing:
	//	 Sync processing: (No data strobe)
	//	0. The PHY will sample data a fixed distance from each clk edge
	//		That means it will always be sampling, whether or not
	//		we're expecting something.
	//	1. Wait for the enable
	//	2. Wait for the start bit: (S_VALID && S_DATA != 8'hff)
	//	3. Capture every S_VALID, and realign incoming bits
	//	4. Move to stage #2
	//
	//	Async processing: (w/ data strobe)
	//	0. The PHY will detect DS edges for us, and provide data
	//		VALID, (READY *MUST* be true), DATA, STRB
	//	1. Pack data into M_VALID, 32bits of M_DATA, M_LAST
	//	2. Move to stage #2
	//
	// Stage #2
	//	1. Calculate CRC on each of the 8 channels
	//	2. Generate error on failed CRC, failed start, or failed stop
	//	3. Drop unused data paths
	//
	// Potential errors:
	//	Start bits not aligned
	//	Stop bits not aligned, or not at the right place
	//	Failed CRC on a data bit we are using
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Synchronous (no DS) data path
	// {{{

	// Step #1: Bit sync
	// {{{
	always @(posedge i_clk)
	if (i_reset || !i_rx_en || (i_cfg_ds && OPT_DS) || !data_phase)
		sync_fill <= 0;
	else if (i_rx_strb == 0)
	begin
		sync_fill[4:3] <= 2'b0;
	// Verilator lint_off WIDTH
	end else case(i_cfg_width)
	WIDTH_1W: sync_fill <= sync_fill[2:0] + (i_rx_strb[1] ? 1:0)
						+ (i_rx_strb[0] ? 1:0);
	WIDTH_4W: sync_fill <= sync_fill[2:0] + (i_rx_strb[1] ? 4:0)
						+ (i_rx_strb[0] ? 4:0);
	default:  sync_fill <= sync_fill[2:0] + (i_rx_strb[1] ? 8:0)
						+ (i_rx_strb[0] ? 8:0);
	endcase
	// Verilator lint_on  WIDTH

	always @(posedge i_clk)
	if (!i_rx_en)
		sync_sreg <= 0;
	else if (i_rx_strb != 0)
	begin
		case(i_cfg_width)
		WIDTH_1W: if (i_rx_strb == 2'b11)
			sync_sreg <= { sync_sreg[17:0], i_rx_data[8], i_rx_data[0] };
			else if (i_rx_strb[1])
				sync_sreg <= { sync_sreg[18:0], i_rx_data[8] };
			else
				sync_sreg <= { sync_sreg[18:0], i_rx_data[0] };
		WIDTH_4W: if (i_rx_strb == 2'b11)
			sync_sreg <= { sync_sreg[11:0], i_rx_data[11:8], i_rx_data[3:0] };
			else if (i_rx_strb[1])
				sync_sreg <= { sync_sreg[15:0], i_rx_data[11:8] };
			else
				sync_sreg <= { sync_sreg[15:0], i_rx_data[3:0] };
		default: if (i_rx_strb == 2'b11)
			sync_sreg <= { sync_sreg[3:0], i_rx_data[15:8], i_rx_data[7:0] };
			else if (i_rx_strb[1])
				sync_sreg <= { sync_sreg[11:0], i_rx_data[15:8] };
			else
				sync_sreg <= { sync_sreg[11:0], i_rx_data[7:0] };
		endcase
	end
	// }}}

	// Step #2: Byte sync: s2_valid, s2_fill (byte count), and s2_data
	// {{{
	// We assume this register gets fully and completely emptied on every
	// cycle, so we only have to capture what spills out from the sync_*
	// registers.
	always @(posedge i_clk)
	if (i_reset || !i_rx_en || (i_cfg_ds && OPT_DS))
		// If RX is not enabled, or
		//   or we haven't seen the sync bit(s)
		//   or we are using the async path,
		// Then keep s2 disabled
		s2_valid <= 0;
	else
		s2_valid <= (sync_fill >= 8);

	always @(posedge i_clk)
	if (i_reset || !i_rx_en || (i_cfg_ds && OPT_DS))
		s2_fill <= 0;
	else
		s2_fill <= sync_fill[4:3];

	// Verilator lint_off WIDTH
	always @(posedge i_clk)
	if (OPT_LOWPOWER && (!i_rx_en || (i_cfg_ds && OPT_DS)))
		s2_data <= 0;
	else if (sync_fill[4])
		s2_data <= sync_sreg >> sync_fill[2:0];
	else if (sync_fill[3])
		s2_data <= {sync_sreg, 8'h0} >> sync_fill[2:0];
	// Verilator lint_on  WIDTH
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Asynchronous (w/ DS) data path
	// {{{

	// Nothing really more needs to be done.  The async path comes in at
	// 4bytes at a times, all four valid (presently), and needs to be
	// synchronized to a 4-byte stream w/ all four valid.  Of course, this
	// will only work as long as the DS strobe signals only ever arrive
	// in pairs of pulses.

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Align, and write to (external) memory
	// {{{
	// (Memory is just external to this module, not necessarily to the chip)
	////////////////////////////////////////////////////////////////////////
	//
	//

	// o_mem_valid
	// {{{
	always @(posedge i_clk)
	if (i_reset || !i_rx_en || mem_full || r_watchdog
			|| (mem_valid && (&mem_addr) && mem_strb[0]))
		mem_valid <= 0;
	else if (!i_cfg_ds || !OPT_DS)
	begin
		mem_valid <= s2_valid || rnxt_strb;
	end else begin
		mem_valid <= S_ASYNC_VALID && data_phase;
	end

	always @(posedge i_clk)
	if (i_reset || !i_rx_en)
		mem_full <= 0;
	else if (mem_valid && (&mem_addr) && mem_strb[0])
		mem_full <= 1;

	assign	o_mem_valid = mem_valid;
	// }}}

	// o_mem_addr
	// {{{
	always @(posedge i_clk)
	if (i_reset || !i_rx_en || mem_full
			|| (mem_valid && (&mem_addr) && mem_strb[0]))
		next_subaddr <= 0;
	else if (!i_cfg_ds || !OPT_DS)
		next_subaddr <= next_subaddr + s2_fill;
	// else if (S_ASYNC_VALID)
	//	next_subaddr <= next_subaddr + 4;
	else
		next_subaddr <= subaddr;

	always @(posedge i_clk)
	if (i_reset || !i_rx_en)
		{ mem_addr, subaddr } <= 0;
	else if (o_mem_valid)
	begin
		// Verilator lint_off WIDTH
		{ mem_addr, subaddr } <= { mem_addr, subaddr } + COUNTONES(o_mem_strb);
		// Verilator lint_on  WIDTH
	end

	assign	o_mem_addr  = mem_addr;
	// }}}

	// o_mem_data, o_mem_strb
	// {{{
	always @(posedge i_clk)
	if (i_reset || !i_rx_en || mem_full)
	begin
		mem_data <= 0;
		mem_strb <= 0;
		rnxt_data <= 0;
		rnxt_strb <= 0;
	end else if (!i_cfg_ds || !OPT_DS)
	begin

		if (s2_fill[1])
		begin
			{ mem_data, rnxt_data } <= { rnxt_data, {(MW){1'b0}} }
				|({ s2_data[15:0], {(MW-8){1'b0}} } >> (next_subaddr*8));
			{ mem_strb, rnxt_strb } <= { rnxt_strb, {(MW/8){1'b0}} }
				|({ 2'b11, {(MW/8-1){1'b0}} } >> (next_subaddr));
		end else if (s2_fill[0])
		begin
			{ mem_data, rnxt_data } <= {rnxt_data, {(MW){1'b0}} }
				|({ s2_data[15:8], {(MW){1'b0}} } >> (next_subaddr*8));
			{ mem_strb, rnxt_strb } <= { rnxt_strb, {(MW/8){1'b0}} }
				|({ s2_fill[0],{(MW/8){1'b0}} }>> next_subaddr);
		end else begin
			{ mem_data, rnxt_data } <= {rnxt_data,{(MW  ){1'b0}} };
			{ mem_strb, rnxt_strb } <= {rnxt_strb,{(MW/8){1'b0}} };
		end
	end else begin
		rnxt_data <= 0;
		rnxt_strb <= 0;
		mem_strb <= 0;

		if (S_ASYNC_VALID)
		begin
			mem_data <= { S_ASYNC_DATA, {(MW-32){1'b0}} } >> (next_subaddr*8);
			mem_strb <= { 4'hf, {(MW/8-4){1'b0}} } >> (next_subaddr);
		end
	end

	generate if (OPT_LITTLE_ENDIAN)
	begin : GEN_LIL_ENDIAN_SWAP
		reg	[MW/8-1:0]	swap_strb;
		reg	[MW-1:0]	swap_data;
		integer			ik;

		always @(*)
		for(ik=0; ik<MW/8; ik=ik+1)
		begin
			swap_strb[ik] = mem_strb[MW/8-1-ik];
			swap_data[ik*8 +: 8] = mem_strb[MW-ik*8 +: 8];
		end

		assign	o_mem_strb  = swap_strb;
		assign	o_mem_data  = swap_data;
	end else begin : NO_ENDIAN_SWAP
		assign	o_mem_strb  = mem_strb;
		assign	o_mem_data  = mem_data;
	end endgenerate
`ifdef	FORMAL
	always @(posedge i_clk)
	if (!i_reset && i_rx_en)
	begin
		if (i_cfg_ds && OPT_DS)
		begin
			assert(rnxt_strb == 0);
			assert(rnxt_data == 0);
		end else if (rnxt_strb)
		begin
			assert(next_subaddr == 1);
		end else
			assert(rnxt_data == 0);
	end
`endif
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Are we done?  Have we received a full packet?
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	always @(posedge i_clk)
	if (i_reset || o_done || !i_rx_en)
	begin
		rail_count <= 0;
		load_crc   <= 0;
		data_phase <= 0;
		last_strb  <= 0;
	end else if (!busy && i_rx_en)
	begin
		// {{{
		// Verilator lint_off WIDTH
		last_strb  <= (!i_crc_en && i_cfg_width == WIDTH_8W && i_length == 1);
		if (i_cfg_ds)
			rail_count <= i_length + (i_crc_en ? (16 + (i_cfg_ddr ? 16 : 0)) : 0);
		else case(i_cfg_width)
		WIDTH_1W: rail_count <= (i_length << 3) + (i_crc_en ? (16 + (i_cfg_ddr ? 16:0)):0);
		WIDTH_4W: rail_count <= (i_length << 1) + (i_crc_en ? (16 + (i_cfg_ddr ? 16:0)):0);
		default:  rail_count <= i_length + (i_crc_en ? (16 + (i_cfg_ddr ? 16:0)):0);
		endcase
		// Verilator lint_on  WIDTH

		data_phase <= 1;
		load_crc   <= 0;
		// }}}
	end else if (!i_cfg_ds || !OPT_DS)
	begin
		if (i_rx_strb == 2'b11)
		begin
			// {{{
			rail_count <= rail_count - 2;
			last_strb  <= (rail_count == 3);
			if (!i_crc_en)
			begin
				data_phase <= (rail_count > 2);
				load_crc   <= 1'b0;
			end else if (i_cfg_ddr)
			begin
				data_phase <= (rail_count > 16*2+2);
				load_crc   <= (rail_count <= 16*2+2)&&(rail_count > 2) && i_crc_en;
			end else begin
				data_phase <= (rail_count > 18);
				load_crc   <= (rail_count <= 18)&&(rail_count > 2) && i_crc_en;
			end

			if (rail_count < 2)
				rail_count <= 0;
			// }}}
		end else if (i_rx_strb[1])
		begin
			// {{{
			rail_count <= rail_count - 1;
			last_strb  <= (rail_count == 2);

			if (!i_crc_en)
			begin
				data_phase <= (rail_count > 1);
				load_crc   <= 1'b0;
			end else if (i_cfg_ddr)
			begin
				data_phase <= (rail_count >  16*2+1);
				load_crc   <= (rail_count <= 16*2+1)&&(rail_count > 1);
			end else begin
				data_phase <= (rail_count >  17);
				load_crc   <= (rail_count <= 17)&&(rail_count > 1);
			end

			if (rail_count < 1)
				rail_count <= 0;
			// }}}
		end
	end else if (S_ASYNC_VALID)
	begin
		// {{{
		rail_count <= rail_count - 4;
		last_strb  <= 0;

		if (!i_crc_en)
		begin
			data_phase <= (rail_count > 4);
			load_crc   <= 1'b0;
		end else if (i_cfg_ddr)
		begin
			data_phase <= (rail_count >  32+4);
			load_crc   <= (rail_count <= 32+4)&&(rail_count > 4);
		end else begin
			data_phase <= (rail_count >  16+4);
			load_crc   <= (rail_count <= 16+4)&&(rail_count > 4);
		end

		if ((rail_count < 4)||(i_cfg_ddr && rail_count < 8))
			rail_count <= 0;
		// }}}
	end

	always @(posedge i_clk)
	if (i_reset || o_done || !i_rx_en || !i_crc_en)
	begin
		pending_crc <= 1'b0;
	end else if ((i_rx_en && !busy) || load_crc || data_phase)
		pending_crc <= 1'b1;
	else if (!load_crc)
		pending_crc <= 1'b0;

	always @(*)
	begin
		w_done = !(data_phase || pending_crc || s2_valid
				|| sync_fill[4:3] != 2'b00 || mem_valid);
		if (r_watchdog)
			w_done = 1'b1;
		if (!busy)
			w_done = 1'b0;
	end

	always @(posedge i_clk)
	if (i_reset)
		busy <= 0;
	else if (!busy)
		busy <= i_rx_en && i_length > 0 && !o_done;
	else if (w_done)
		busy <= 1'b0;

	always @(posedge i_clk)
	if (i_reset)
		o_active <= 1'b0;
	else if (!busy)
		o_active <= i_rx_en && i_length > 0 && !o_done;
	else if (!i_cfg_ds || !OPT_DS)
		o_active <= (rail_count > (i_rx_strb[0] ? 1:0) + (i_rx_strb[1] ? 1:0));
	else
		o_active <= (rail_count > (S_ASYNC_VALID ? 4:0));
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// CRC checking
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	generate for(gk=0; gk<NUMIO; gk=gk+1)
	begin : GEN_RAIL_CRC
		reg	[15:0]		pedge_crc,
					nedge_crc;
		reg	[1:0]		lcl_err;

		// pedge_crc: POSEDGE Calculate the CRC for each rail
		// {{{
		initial	pedge_crc = 0;
		always @(posedge i_clk)
		if (i_reset || !i_rx_en || !i_crc_en ||(!data_phase&&!load_crc))
			pedge_crc <= 0;
		else if ((gk >= 1 && i_cfg_width == WIDTH_1W)
				|| (gk >= 4 && i_cfg_width == WIDTH_4W))
			pedge_crc <= 0;
		else if (!i_cfg_ds || !OPT_DS)
		begin // CRC based upon synchronous inputs
			// {{{
			if (i_rx_strb == 2'b11 && !i_cfg_ddr && !last_strb)
				pedge_crc <= STEPCRC(STEPCRC(pedge_crc,
					i_rx_data[8+gk]),
					i_rx_data[  gk]);
			else if (i_rx_strb[1] && (!i_cfg_ddr || !rail_count[0]))
				pedge_crc <= STEPCRC(pedge_crc,i_rx_data[8+gk]);
			else if (i_rx_strb[0] &&  rail_count[0] && i_cfg_ddr)
				pedge_crc <= STEPCRC(pedge_crc,i_rx_data[0+gk]);
			// }}}
		end else if (S_ASYNC_VALID)
		begin // Asynchronous CRC generation
			// {{{
			// Note that in ASYNC mode, all rails are used
			if (i_cfg_ddr)
			begin
				pedge_crc <= STEPCRC( STEPCRC(pedge_crc,
					S_ASYNC_DATA[gk+24]),
					S_ASYNC_DATA[gk+ 8]);
			end else begin
				pedge_crc <= STEPCRC( STEPCRC(
					STEPCRC( STEPCRC(pedge_crc,
						S_ASYNC_DATA[gk+24]),
						S_ASYNC_DATA[gk+16]),
						S_ASYNC_DATA[gk+ 8]),
						S_ASYNC_DATA[gk   ]);
			end
			// }}}
		end
		// }}}

		// nedge_crc: NEGEDGE Calculate the CRC for each rail
		// {{{
		initial	nedge_crc = 0;
		always @(posedge i_clk)
		if (i_reset || !i_rx_en || !i_crc_en || (!data_phase&&!load_crc)
								|| !i_cfg_ddr)
			nedge_crc <= 0;
		else if ((gk >= 1 && i_cfg_width == WIDTH_1W)
				|| (gk >= 4 && i_cfg_width == WIDTH_4W))
			// Zero out any unused rails
			nedge_crc <= 0;
		else if (!i_cfg_ds || !OPT_DS)
		begin // CRC based upon synchronous inputs
			// {{{
			if (i_rx_strb[1] && rail_count[0])
				nedge_crc <= STEPCRC(nedge_crc, i_rx_data[8+gk]);
			else if (i_rx_strb[0] && !rail_count[0])
				nedge_crc <= STEPCRC(nedge_crc, i_rx_data[0+gk]);
			// }}}
		end else if (S_ASYNC_VALID)
		begin // Asynchronous CRC generation
			// {{{
			// Note that in ASYNC mode, all rails are used (IIRC)
			nedge_crc <= STEPCRC( STEPCRC(nedge_crc,
						S_ASYNC_DATA[gk+16]),
						S_ASYNC_DATA[gk   ]);
			// }}}
		end
		// }}}

		always @(posedge i_clk)
		if (i_reset || !i_rx_en || !i_crc_en || data_phase || load_crc)
		begin
			lcl_err <= 2'b00;
		end else begin
			lcl_err[0] <= (pedge_crc != 0);

			lcl_err[1] <= (nedge_crc != 0) && i_cfg_ddr;
		end

		assign	err[gk] = lcl_err[0];
		assign	err[gk+NUMIO] = lcl_err[1];
	end endgenerate

	initial	o_done = 0;
	always @(posedge i_clk)
	if (i_reset || !i_rx_en || o_done || !busy)
		{ o_ercode, o_done, o_err } <= 0;
	else if (w_done)
	begin
		o_done <= 1'b1;
		o_err  <= (|err) || r_watchdog;
		o_ercode <= !r_watchdog;
	end

	function automatic [NCRC-1:0]	STEPCRC(reg[NCRC-1:0] prior,
						input i_crc_data);
	begin
		if (prior[NCRC-1] ^ i_crc_data)
			STEPCRC = { prior[NCRC-2:0], 1'b0 } ^ CRC_POLYNOMIAL;
		else
			STEPCRC = { prior[NCRC-2:0], 1'b0 };
	end endfunction

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Watchdog timeout
	// {{{

	always @(posedge i_clk)
	if (i_reset || !i_rx_en || (!r_watchdog &&
			(((!OPT_DS || !i_cfg_ds) && i_rx_strb != 0)
			|| (OPT_DS && i_cfg_ds && S_ASYNC_VALID))))
	begin
		r_watchdog <= 0;
		r_timeout  <= -1;
	end else if (r_timeout != 0)
	begin
		r_watchdog <= (r_timeout <= 1);
		r_timeout  <= r_timeout - 1;
	end
	// }}}

	function automatic [$clog2(MW/8):0] COUNTONES(input [MW/8-1:0] set);
		integer ik;
	begin
		COUNTONES=0;
		for(ik=0; ik<MW/8; ik=ik+1)
		if (set[ik])
			COUNTONES=COUNTONES+1;
	end endfunction

	//
	// Make verilator happy
	// verilator lint_off UNUSED
	// wire	unused;
	// assign	unused = i_wb_cyc;
	// verilator lint_on  UNUSED
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal properties
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
	reg	[LGLEN+3:0]		f_count;
	reg				f_past_valid, f_state;
	reg	[LGLEN:0]		fmem_count, f_recount;
	(* anyconst *)	reg	[LGLEN:0]	fc_posn;
	(* anyconst *)	reg	[7:0]		fc_data;
	reg	[MW-1:0]		fmem_data;
	reg	[MW/8-1:0]		fmem_strb;
	reg	[$clog2(MW/8)-1:0]	f_next_subaddr;

	initial	f_past_valid = 0;
	always @(posedge i_clk)
		f_past_valid <= 1'b1;

	always @(*)
	if (!f_past_valid)
		assume(i_reset);

	////////////////////////////////////////////////////////////////////////
	//
	// Configuration validation
	// {{{

	always @(*)
	if (!OPT_DS)
		assume(!i_cfg_ds);

	always @(posedge i_clk)
	if (!i_reset && $past(i_reset))
		assume(!i_rx_en);
	else if ($past(i_rx_en && o_done))
		assume(!i_rx_en);
	else if ($past(i_rx_en))
		assume(i_rx_en);

	always @(posedge i_clk)
	if (i_rx_en)
	begin
		assume($stable(i_crc_en));
		assume($stable(i_length));
		assume($stable(i_cfg_ds));
		assume($stable(i_cfg_ddr));
		assume($stable(i_cfg_width));

		assume(i_length > 0);
		if (i_cfg_ds)
		begin
			assume(i_length[1:0] == 2'b00);
		end else if (i_cfg_ddr && i_cfg_width >= WIDTH_8W)
			assume(i_length[0] == 1'b0);
	end

	always @(*)
	if (i_cfg_ds) assume(i_cfg_width == WIDTH_8W && i_cfg_ddr);

	always @(*)
	if (!i_reset)
	begin
		assume(i_cfg_width != 2'b11);
		assume(i_length <= 16'h8000);
	end

	always @(posedge i_clk)
	if (i_reset)
		f_state <= 1'b0;
	else if (o_done)
		f_state <= 1'b0;
	else if (i_rx_en)
		f_state <= 1'b1;

	always @(posedge i_clk)
	if (!i_reset && !r_watchdog)
	begin
		if (busy || data_phase || load_crc || o_done
				|| s2_valid || o_mem_valid)
		begin
			assert(f_state);
		end else begin
			assert(!f_state || $past(o_mem_valid));
		end

		if (load_crc || data_phase)
			assert(busy || r_watchdog);
	end

	always @(posedge i_clk)
	if (!i_reset && o_err)
		assert(o_done && (i_crc_en || r_watchdog));

	(* anyconst *) reg fnvr_watchdog;
	always @(*)
	if (fnvr_watchdog)
		assume(!r_watchdog);

	always @(*)
	if (!i_reset && o_err && fnvr_watchdog)
		assume(o_ercode);
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// PHY assumptions
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(posedge i_clk)
	if (!i_reset && $past(!i_rx_en))
	begin
		assume(i_rx_strb == 0);
		assume(S_ASYNC_VALID == 0);
	end

	always @(*)
	if (!i_rx_strb[1])
		assume(!i_rx_strb[0]);

	always @(*)
	if (!OPT_DS)
		assume(!S_ASYNC_VALID);
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Counting
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// f_count: count received bits
	// {{{
	initial	f_count = 0;
	always @(posedge i_clk)
	if (i_reset || !i_rx_en)
		f_count <= 0;
	else if (data_phase || load_crc)
	begin
		if (i_cfg_ds)
		begin
			if (S_ASYNC_VALID)
				f_count <= f_count + 32;
		end else case(i_cfg_width)
		WIDTH_1W: f_count <= f_count + (i_rx_strb[1] ? 1:0)
							+ (i_rx_strb[0] ? 1:0);
		WIDTH_4W: f_count <= f_count + (i_rx_strb[1] ? 4:0)
							+ (i_rx_strb[0] ? 4:0);
		default:  f_count <= f_count + (i_rx_strb[1] ? 8:0)
							+ (i_rx_strb[0] ? 8:0);
		endcase
	end

	always @(posedge i_clk)
	if (!i_reset && i_rx_en)
	begin
		if (i_cfg_ds)
		begin
			assert(f_count[4:0] == 0);
		end else case(i_cfg_width)
		WIDTH_1W: begin end
		WIDTH_4W: assert(f_count[1:0] == 2'b0);
		WIDTH_8W: assert(f_count[2:0] == 3'b0);
		endcase

		if (!i_cfg_ds && data_phase)
			assert(f_count[2:0] == sync_fill[2:0]);
	end
	// }}}

	// fmem_count
	// {{{
	always @(posedge i_clk)
	if (!i_rx_en)
		fmem_count <= 0;
	else if (o_mem_valid)
		fmem_count <= fmem_count + $countones(o_mem_strb);
	// }}}

	always @(posedge i_clk)
	if (!i_reset)
		assert(s2_valid == (s2_fill != 0));

	always @(posedge i_clk)
	if (!i_reset && i_rx_en && (i_cfg_ds && OPT_DS))
		assert(!s2_valid);

	always @(posedge i_clk)
	if (i_reset || !i_rx_en)
	begin end
	else if (!$past(i_rx_en))
		assert(sync_fill == 0);
	else case(i_cfg_width)
	WIDTH_1W: assert(sync_fill <= 5'd9);
	WIDTH_4W: assert(sync_fill[1:0] == 2'b00 && sync_fill <= 5'd12);
	WIDTH_8W: assert(sync_fill[2:0] == 3'b00 && sync_fill <= 5'd16);
	default: assert(0);
	endcase

	always @(*)
	begin
		// Relate the two counts together
		// fmem_count
		//	+ (o_mem_valid ? $countones(o_mem_strb)
		//	+ (s2_valid ? s2_fill
		//	+ sync_fill[4:3]
		//	======================
		//	f_count

		f_recount = fmem_count;
		if (o_mem_valid)
			f_recount = f_recount + $countones(o_mem_strb);
		if (rnxt_strb)
			f_recount = f_recount + 1;
		if (!i_cfg_ds || !OPT_DS)
		begin
			if (s2_valid)
				f_recount = f_recount + s2_fill;
			f_recount = f_recount + sync_fill[4:3];
		end
	end

	always @(posedge i_clk)
	if (!i_reset && i_rx_en && data_phase && !r_watchdog)
	begin
		// reg	[LGLEN:0]	fmem_count, f_recount;
		assert(f_count[LGLEN+3:3] == f_recount);
	end

	always @(posedge i_clk)
	if (!i_reset && i_rx_en && o_mem_valid)
	begin
		if (i_cfg_ds)
		begin
			assert($countones(o_mem_strb) == 4);
		end else case(i_cfg_width)
		WIDTH_1W: assert($countones(o_mem_strb) == 1);
		WIDTH_4W: assert($countones(o_mem_strb) == 1);
		WIDTH_8W: begin end // assert($countones(o_mem_strb) <= 2 + ($past(rnxt_strb) ? 1:0));
		default: assert(0);
		endcase
	end

	// Relate the rail_count to f_count
	// {{{
	always @(posedge i_clk)
	if (!i_reset && i_rx_en)
	begin
		case(i_cfg_width)
		WIDTH_1W: if (!i_crc_en)
			begin
				assert(rail_count <= (i_length*8));
			end else if (i_cfg_ddr)
			begin
				assert(rail_count <= (i_length*8) + 32);
			end else
				assert(rail_count <= (i_length*8) + 16);
		WIDTH_4W: if (!i_crc_en)
			begin
				assert(rail_count <= (i_length*2));
			end else if (i_cfg_ddr)
			begin
				assert(rail_count <= (i_length*2 + 32));
			end else
				assert(rail_count <= (i_length*2 + 16));
		WIDTH_8W: if (!i_crc_en)
			begin
				assert(rail_count <= i_length);
			end else if (i_cfg_ddr)
			begin
				assert(rail_count <= (i_length + 32));
			end else
				assert(rail_count <= (i_length + 16));
		default: assert(0);
		endcase

		if (!i_crc_en)
		begin
			assert(!load_crc);
			assert(!pending_crc);
			assert(data_phase == (rail_count > 0));
		end  else if (i_cfg_ddr)
		begin
			assert(data_phase == (rail_count > 32));
			assert(load_crc   == (rail_count <= 32 && rail_count>0));
		end else begin
			assert(data_phase == (rail_count > 16));
			assert(load_crc   == (rail_count <= 16 && rail_count>0));
		end

		if (i_crc_en && (load_crc || data_phase))
			assert(pending_crc);
		assert(last_strb == (rail_count == 1));
	end

	always @(posedge i_clk)
	if (!i_reset && i_rx_en && busy && (data_phase || load_crc))
	begin
		casez({ i_crc_en, i_cfg_ddr, i_cfg_width })
		{ 1'b0, 1'b?, WIDTH_1W }: begin
				assert(rail_count + f_count == i_length*8);
				assert(f_count <= i_length*8);
				assert(rail_count <= i_length*8);
				end
		{ 2'b10, WIDTH_1W }: begin
				assert(rail_count + f_count == i_length*8+16);
				assert(f_count <= i_length*8+16);
				assert(rail_count <= i_length*8+16);
				end
		{ 2'b11, WIDTH_1W }: begin
				assert(rail_count + f_count == i_length*8+32);
				assert(f_count <= i_length*8+32);
				assert(rail_count <= i_length*8+32);
				end
		{ 1'b0, 1'b?, WIDTH_4W }: begin
				assert(rail_count + (f_count>>2) == i_length*2);
				assert((f_count>>2) <= i_length*2);
				assert(rail_count <= i_length*2);
				end
		{ 2'b10, WIDTH_4W }: begin
				assert(rail_count + (f_count>>2) == i_length*2+16);
				assert((f_count>>2) <= i_length*2+16);
				assert(rail_count <= i_length*2+16);
				end
		{ 2'b11, WIDTH_4W }: begin
				assert(rail_count + (f_count>>2) == i_length*2+32);
				assert((f_count>>2) <= i_length*2+32);
				assert(rail_count <= i_length*2+32);
				end
		{ 1'b0, 1'b?, WIDTH_8W }: begin
				assert(rail_count + (f_count>>3) == i_length);
				assert((f_count>>3) <= i_length);
				assert(rail_count <= i_length);
				end
		{ 2'b10, WIDTH_8W }: begin
				assert(rail_count + (f_count>>3) == i_length+16);
				assert((f_count>>3) <= i_length+16);
				assert(rail_count <= i_length+16);
				end
		{ 2'b11, WIDTH_8W }: begin
				assert(rail_count+(f_count>>3) == i_length+32);
				assert((f_count>>3) <= i_length+32);
				assert(rail_count <= i_length+32);
				end
		default: assert(0);
		endcase
	end
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Memory interface
	// {{{

	always @(posedge i_clk)
	if (!i_reset && i_rx_en && fmem_count == 0)
		assert(!mem_full);

	always @(*)
	if (o_mem_valid)
		f_next_subaddr = subaddr + $countones(o_mem_strb)
					+ (rnxt_strb ? 1:0);
	else
		f_next_subaddr = subaddr;

	always @(posedge i_clk)
	if (i_reset)
	begin end else
		assert(f_next_subaddr == next_subaddr);

	always @(posedge i_clk)
	if (!i_reset && rnxt_strb)
		assert(o_mem_valid);

	always @(posedge i_clk)
	if (!i_reset && i_rx_en && mem_full)
		assert({ mem_addr, subaddr } == 0);

	always @(*)
	if (!i_reset && i_rx_en)
		assert({ mem_full, o_mem_addr, subaddr } == fmem_count);

	always @(posedge i_clk)
	if (!i_reset && !i_rx_en)
		assert(!o_mem_valid);
	else if (!i_reset && o_mem_valid)
		assert(o_mem_strb != 0);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Contract
	// {{{

	// Assume the known receive value
	// {{{
	always @(posedge i_clk)
	if (i_rx_en && f_count[LGLEN+3:5] == fc_posn[LGLEN:2]
			&& i_cfg_ds && S_ASYNC_VALID)
	begin
		case(fc_posn[1:0])
		2'b00: assume(S_ASYNC_DATA[31:24] == fc_data);
		2'b01: assume(S_ASYNC_DATA[23:16] == fc_data);
		2'b10: assume(S_ASYNC_DATA[15: 8] == fc_data);
		2'b11: assume(S_ASYNC_DATA[ 7: 0] == fc_data);
		endcase
	end

	always @(posedge i_clk)
	if (i_rx_en && !i_cfg_ds && i_cfg_width == WIDTH_1W)
	begin
		// {{{
		if (i_rx_strb[1] && f_count == { fc_posn, 3'd0 })
			assume(i_rx_data[8] == fc_data[7]);
		if (i_rx_strb[1] && f_count == { fc_posn, 3'd1 })
			assume(i_rx_data[8] == fc_data[6]);
		if (i_rx_strb[1] && f_count == { fc_posn, 3'd2 })
			assume(i_rx_data[8] == fc_data[5]);
		if (i_rx_strb[1] && f_count == { fc_posn, 3'd3 })
			assume(i_rx_data[8] == fc_data[4]);
		if (i_rx_strb[1] && f_count == { fc_posn, 3'd4 })
			assume(i_rx_data[8] == fc_data[3]);
		if (i_rx_strb[1] && f_count == { fc_posn, 3'd5 })
			assume(i_rx_data[8] == fc_data[2]);
		if (i_rx_strb[1] && f_count == { fc_posn, 3'd6 })
			assume(i_rx_data[8] == fc_data[1]);
		if (i_rx_strb[1] && f_count == { fc_posn, 3'd7 })
			assume(i_rx_data[8] == fc_data[0]);

		if (i_rx_strb[0] && f_count + 1 == { fc_posn, 3'd0 })
			assume(i_rx_data[0] == fc_data[7]);
		if (i_rx_strb[0] && f_count + 1 == { fc_posn, 3'd1 })
			assume(i_rx_data[0] == fc_data[6]);
		if (i_rx_strb[0] && f_count + 1 == { fc_posn, 3'd2 })
			assume(i_rx_data[0] == fc_data[5]);
		if (i_rx_strb[0] && f_count + 1 == { fc_posn, 3'd3 })
			assume(i_rx_data[0] == fc_data[4]);
		if (i_rx_strb[0] && f_count + 1 == { fc_posn, 3'd4 })
			assume(i_rx_data[0] == fc_data[3]);
		if (i_rx_strb[0] && f_count + 1 == { fc_posn, 3'd5 })
			assume(i_rx_data[0] == fc_data[2]);
		if (i_rx_strb[0] && f_count + 1 == { fc_posn, 3'd6 })
			assume(i_rx_data[0] == fc_data[1]);
		if (i_rx_strb[0] && f_count + 1 == { fc_posn, 3'd7 })
			assume(i_rx_data[0] == fc_data[0]);
		// }}}
	end

	always @(posedge i_clk)
	if (i_rx_en && !i_cfg_ds && i_cfg_width == WIDTH_4W)
	begin
		// {{{
		if (f_count == { fc_posn, 3'd0 } && i_rx_strb[1])
			assume(i_rx_data[11:8] == fc_data[7:4]);
		if (f_count == { fc_posn, 3'd4 } && i_rx_strb[1])
			assume(i_rx_data[11:8] == fc_data[3:0]);

		if (f_count +4 == { fc_posn, 3'd0 } && i_rx_strb[0])
			assume(i_rx_data[ 3: 0] == fc_data[7:4]);
		if (f_count +4 == { fc_posn, 3'd4 } && i_rx_strb[0])
			assume(i_rx_data[ 3: 0] == fc_data[3:0]);
		// }}}
	end

	always @(posedge i_clk)
	if (i_rx_en && !i_cfg_ds && i_cfg_width == WIDTH_8W)
	begin
		if (f_count == { fc_posn, 3'b0 } && i_rx_strb[1])
			assume(i_rx_data[15:8] == fc_data);
		if (f_count + 8 == { fc_posn, 3'b0 } && i_rx_strb[0])
			assume(i_rx_data[ 7:0] == fc_data);
	end
	// }}}

	// Assert the value if it's in our pipeline, perhaps stalled somewhere
	// {{{
	always @(*)
	if (!i_reset && i_rx_en && !i_cfg_ds && sync_fill != 0
		&& i_cfg_width == WIDTH_1W && f_count[LGLEN+3:3] == fc_posn)
	begin
		case(sync_fill[2:0])
		3'd0: begin end // Nothing loaded, nothing to assert
		3'd1: assert(sync_sreg[0:0] == fc_data[7:7]);
		3'd2: assert(sync_sreg[1:0] == fc_data[7:6]);
		3'd3: assert(sync_sreg[2:0] == fc_data[7:5]);
		3'd4: assert(sync_sreg[3:0] == fc_data[7:4]);
		3'd5: assert(sync_sreg[4:0] == fc_data[7:3]);
		3'd6: assert(sync_sreg[5:0] == fc_data[7:2]);
		3'd7: assert(sync_sreg[6:0] == fc_data[7:1]);
		endcase
	end

	always @(*)
	if (!i_reset && i_rx_en && !i_cfg_ds && sync_fill != 0
		&& i_cfg_width == WIDTH_4W && f_count == { fc_posn, 3'd4 })
	begin
		assert(sync_sreg[3:0] == fc_data[7:4]);
	end
	// }}}

	// Assert the known value out
	// {{{
	always @(*)
	begin
		fmem_data = mem_data << (8*fc_posn[$clog2(MW/8)-1:0]);
		fmem_strb = mem_strb << (fc_posn[$clog2(MW/8)-1:0]);
	end

	always @(posedge i_clk)
	if (!i_reset && i_rx_en && o_mem_valid)
	begin
		if ((o_mem_addr == fc_posn[LGLEN:$clog2(MW/8)])
				&& mem_strb[(MW/8-1)-fc_posn[$clog2(MW/8)-1:0]])
		begin
			// Assume big-endian ordering
			assert(fmem_data[MW-1:MW-8] == fc_data);
			assert(fmem_strb);
		end
	end
	// }}}
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Cover checks
	// {{{
	always @(posedge i_clk)
	if (!i_reset && i_rx_en && o_done)
	begin
		case({ i_cfg_ds, i_cfg_ddr, i_cfg_width })
		4'b0000: begin
				cover(!i_crc_en);
				cover(o_err);		// !!!
				cover(i_crc_en && !o_err);
				end
		4'b0001: begin
				cover(!i_crc_en);
cover(fc_posn == 0 && fc_data == 8'hff);
cover(fc_posn == 0 && fc_data == 8'ha5);
cover(fc_posn == 0 && fc_data == 8'h5a);
cover(fc_posn == 0 && fc_data == 8'h7e);
				cover(o_err);		// !!!
				cover(i_crc_en && !o_err);
				end
		4'b0010: begin
				cover(!i_crc_en);
				cover(o_err);		// !!!
				cover(i_crc_en && !o_err);
				end
		4'b0100: begin
				cover(!i_crc_en);
				cover(o_err);		// !!!
				cover(i_crc_en && !o_err);
				end
		4'b0101: begin
				cover(!i_crc_en);
				cover(o_err);		// !!!
				cover(i_crc_en && !o_err);
				end
		4'b0110: begin
				cover(!i_crc_en);
				cover(o_err);		// !!!
				cover(i_crc_en && !o_err);
				end
		// 4'b1110: cover(1);
		default: begin end
		endcase
	end

	generate if (OPT_DS)
	begin : CVR_DATA_STROBE
		always @(posedge i_clk)
		if (!i_reset && i_rx_en && o_done)
		begin
			case({ i_cfg_ds, i_cfg_ddr, i_cfg_width })
			// 4'b0000: cover(1);
			// 4'b0001: cover(1);
			// 4'b0010: cover(1);
			// 4'b0100: cover(1);
			// 4'b0101: cover(1);
			// 4'b0110: cover(1);
			4'b1110: begin
				cover(!i_crc_en);
				cover(o_err);
				cover(i_crc_en && !o_err);
				end
			default: begin end
			endcase
		end

	end endgenerate

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Careless assumptions
	// {{{

	// always @(*) assume(!r_watchdog);
	// }}}
`endif	// FORMAL
// }}}
endmodule
////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	sdtxframe.v
// {{{
// Project:	SDIO SD-Card controller
//
// Purpose:	Given a frame of data from memory, formats it for sending to
//		the front end.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2018-2023, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`timescale 1ns/1ps
`default_nettype	none
// }}}
module	sdtxframe #(
		parameter		NCRC = 16,
		parameter [0:0]		OPT_SERDES = 1'b1,
		parameter [NCRC-1:0]	CRC_POLYNOMIAL  = 16'h1021
	) (
		// {{{
		input	wire			i_clk, i_reset,
		//
		input	wire	[7:0]		i_cfg_spd,
		input	wire	[1:0]		i_cfg_width,
		input	wire			i_cfg_ddr,
		//
		input	wire			i_en, i_ckstb, i_hlfck,
		//
		input	wire			S_VALID,
		output	wire			S_READY,
		input	wire	[31:0]		S_DATA,
		input	wire			S_LAST,
		//
		output	wire			tx_valid,
		// input wire			tx_ready,
		output	wire	[31:0]		tx_data
		// }}}
	);

	// Local declarations
	// {{{
	localparam	[1:0]	P_IDLE = 2'b00,
				P_DATA = 2'b01,
				P_CRC  = 2'b10,
				P_LAST = 2'b11;

	localparam [1:0]	WIDTH_1W = 2'b00,
				WIDTH_4W = 2'b01,
				WIDTH_8W = 2'b10;

	localparam [1:0]	P_1D = 2'b00,
				P_2D = 2'b01,
				P_4D = 2'b10;

	reg		cfg_ddr;
	reg	[1:0]	cfg_width, cfg_period;


	wire		start_packet;
	reg		pre_valid;
	reg	[1:0]	pstate;
	wire		pre_ready;
	reg	[31:0]	pre_data;
	reg	[3:0]	pre_count;


	integer		ik, jk;
	reg	[NCRC- 1:0]	crc_1w_reg;
	reg	[NCRC* 2-1:0]	di_crc_2w, nxt_crc_2w, new_crc_2w, crc_2w_reg;
	reg	[NCRC* 4-1:0]	di_crc_4w, nxt_crc_4w, new_crc_4w, crc_4w_reg;
	reg	[NCRC* 8-1:0]	di_crc_8w, nxt_crc_8w, new_crc_8w, crc_8w_reg;
	reg	[NCRC*16-1:0]	di_crc_8d, nxt_crc_8d, new_crc_8d, crc_8d_reg;

	reg		ck_valid;
	reg	[4:0]	ck_counts;
	reg	[31:0]	ck_data, ck_sreg;
	// }}}
	// Steps: #1, Packetizer: breaks incoming signal into wires
	// 	#2, add CRC
	//	#3, split across clocks
	//
	////////////////////////////////////////////////////////////////////////
	//
	// Configuration
	// {{{
	initial	cfg_period = 2'b00;
	always @(posedge i_clk)
	if (i_reset || !OPT_SERDES)
		cfg_period <= P_1D;
	else if (pstate == P_IDLE)
	begin
		if (i_cfg_ddr && i_cfg_spd == 0)
			cfg_period <= P_4D;	// Four data periods / clk
		else if ((i_cfg_ddr && i_cfg_spd == 1)
			||(!i_cfg_ddr && i_cfg_spd == 0))
			cfg_period <= P_2D;	// Two data periods / clk
		else
			cfg_period <= P_1D;	// One data period / clk
	end

	always @(posedge i_clk)
	if (i_reset)
		cfg_width <= WIDTH_1W;
	else if (pstate == P_IDLE)
		cfg_width <= i_cfg_width;

	always @(posedge i_clk)
	if (i_reset)
		cfg_ddr <= 1'b0;
	else if (pstate == P_IDLE)
		cfg_ddr <= i_cfg_ddr;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Packetizer: Add CRC(s) to the packet
	// {{{

	assign	start_packet = i_en && S_VALID && i_ckstb && !tx_valid && !ck_valid;
	initial	pstate    = P_IDLE;
	initial	pre_valid = 1'b0;
	initial	pre_data  = {(32){1'b1}};
	always @(posedge i_clk)
	if (i_reset)
	begin
		// {{{
		pstate    <= P_IDLE;
		pre_valid <= 1'b0;
		pre_data  <= {(32){1'b1}};
		// }}}
	end else case(pstate)
	P_IDLE: begin
		// {{{
		pstate <= P_IDLE;
		pre_valid <= 0;
		pre_data <= (S_VALID) ? S_DATA : {(32){1'b1}};
		if (start_packet)
		begin
			pstate    <= (S_LAST) ? P_CRC : P_DATA;
			pre_valid <= 1;
		end end
		// }}}
	P_DATA: if (S_VALID && S_READY)
		// {{{
		begin
			pstate <= P_DATA;
			pre_valid <= 1;
			pre_data <= S_DATA;

			if (S_LAST)
				pstate <= P_CRC;
		end
		// }}}
	P_CRC: if (pre_ready)
		// {{{
		begin
			pre_valid <= 1'b1;
			if (pre_count == 0)
				pstate <= P_LAST;

			case(cfg_width)
			WIDTH_1W: if (cfg_ddr)
					pre_data <= crc_2w_reg[NCRC*2-1:0];
				else
				pre_data <= { crc_1w_reg[NCRC-1:0], 16'hffff };
			WIDTH_4W: if (cfg_ddr)
				pre_data <= crc_8w_reg[8*NCRC-1:8*NCRC-32];
				else
				pre_data <= crc_4w_reg[4*NCRC-1:4*NCRC-32];
			WIDTH_8W: if (cfg_ddr)
				pre_data <= crc_8d_reg[16*NCRC-1:16*NCRC-32];
				else
				pre_data <= crc_8w_reg[8*NCRC-1:8*NCRC-32];
			default: pre_data  <= crc_8w_reg[8*NCRC-1:8*NCRC-32];
			endcase
		end
		// }}}
	P_LAST: begin
		if (pre_ready)
		begin
			pre_valid <= 0;
			pre_data <= {(32){1'b1}};
		end

		if (!tx_valid)
			pstate <= P_IDLE;
		end
	endcase

	initial	pre_count = 0;
	always @(posedge i_clk)
	if (i_reset)
		pre_count <= 0;
	else if (pstate == P_DATA || pstate == P_IDLE)
	begin
		// pre_count =
		//	(SDR)	16bits / wire / 32
		//	(DDR)	32bits / wire / 32
		case(cfg_width)
		WIDTH_1W: pre_count <= 0;
		WIDTH_4W: pre_count <= (cfg_ddr) ? 3 : 1;
		default: // WIDTH_8W
			pre_count <= (cfg_ddr) ? 7:3;
		endcase
	end else if (pre_ready && pre_count != 0)
		pre_count <= pre_count - 1;

	assign	S_READY = pre_ready && (pstate == P_DATA || pstate == P_IDLE);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// CRC calculation
	// {{{

	// di_crc*, new_crc*, next_crc*: Advance CRC calculations combinatorialy
	// {{{
	always @(*)
	begin
		// Notes:
		// {{{
		// Why the following monstrosity?  So we can read data out
		// directly into the shift register(s).  However, the shift
		// register(s) are not sorted by rail, hence all the work
		// below to first sort them by rail, adjust the CRC, then
		// sort them back, etc.
		//
		// The good news is that, inspite of all the tortured pain
		// below, it's primarily just wire assignments and
		// rearrangements.  The logic itself is either a shift, or
		// (for 1-4 bits per CRC per step), a XOR reduction of up
		// to 20 incoming bits.
		// }}}

		// Pre-load the CRC fills
		// {{{
		for(ik=0; ik<NCRC; ik=ik+1)
		begin
			for(jk=0; jk<2; jk=jk+1)
				di_crc_2w[jk*NCRC+ik] = crc_2w_reg[ik*2+jk];

			for(jk=0; jk<4; jk=jk+1)
				di_crc_4w[jk*NCRC+ik] = crc_4w_reg[ik*4+jk];

			for(jk=0; jk<8; jk=jk+1)
				di_crc_8w[jk*NCRC+ik] = crc_8w_reg[ik*8+jk];

			for(jk=0; jk<16; jk=jk+1)
				di_crc_8d[jk*NCRC+ik] = crc_8d_reg[ik*16+jk];
		end
		// }}}

		// Advance the CRCs based on S_DATA
		// {{{
		for(ik=0; ik<2; ik=ik+1)
		begin
			new_crc_2w[ik*NCRC +: NCRC] =
				APPLYCRC16(di_crc_2w[ik*NCRC +: NCRC],
			  		{ S_DATA[30+ik],S_DATA[28+ik],
						S_DATA[26+ik],S_DATA[24+ik],
						S_DATA[22+ik],S_DATA[20+ik],
						S_DATA[18+ik],S_DATA[16+ik],
						S_DATA[14+ik],S_DATA[12+ik],
						S_DATA[10+ik],S_DATA[ 8+ik],
						S_DATA[ 6+ik],S_DATA[ 4+ik],
						S_DATA[ 2+ik],S_DATA[   ik] });
		end

		for(ik=0; ik<4; ik=ik+1)
		begin
			new_crc_4w[ik*NCRC +: NCRC] =
				APPLYCRC8(di_crc_4w[ik*NCRC +: NCRC],
			  		{ S_DATA[28+ik],S_DATA[24+ik],
						S_DATA[20+ik],S_DATA[16+ik],
						S_DATA[12+ik],S_DATA[ 8+ik],
						S_DATA[ 4+ik],S_DATA[   ik] });
		end

		for(ik=0; ik<8; ik=ik+1)
		begin
			new_crc_8w[ik*NCRC +: NCRC] =
				APPLYCRC4(di_crc_8w[ik*NCRC +: NCRC],
			  		{ S_DATA[24+ik], S_DATA[16+ik],
						S_DATA[8+ik], S_DATA[ik] });
		end

		for(ik=0; ik<16; ik=ik+1)
		begin
			new_crc_8d[ik*NCRC +: NCRC] =
				APPLYCRC2(di_crc_8d[ik*NCRC +: NCRC],
			  		{ S_DATA[16+ik], S_DATA[ik] });
		end
		// }}}

		// Order the bits to place the results back in line
		// {{{
		for(ik=0; ik<NCRC; ik=ik+1)
		begin
			for(jk=0; jk<2; jk=jk+1)
				nxt_crc_2w[ik*2+jk] = new_crc_2w[jk*NCRC+ik];
			for(jk=0; jk<4; jk=jk+1)
				nxt_crc_4w[ik*4+jk] = new_crc_4w[jk*NCRC+ik];
			for(jk=0; jk<8; jk=jk+1)
				nxt_crc_8w[ik*8+jk] = new_crc_8w[jk*NCRC+ik];
			for(jk=0; jk<16; jk=jk+1)
				nxt_crc_8d[ik*16+jk] = new_crc_8d[jk*NCRC+ik];
		end
		// }}}
	end
	// }}}

	// crc_*_reg: Advance CRC calculations sequentially w/ new data
	// {{{
	always @(posedge i_clk)
	if (i_reset || (!i_en && !tx_valid))
	begin
		crc_1w_reg <= 0;
		crc_2w_reg <= 0;
		crc_4w_reg <= 0;
		crc_8w_reg <= 0;
		crc_8d_reg <= 0;
	end else if (S_VALID && S_READY)
	begin
		crc_1w_reg <= {(NCRC   ){1'b1}};
		crc_2w_reg <= {(NCRC* 2){1'b1}};
		crc_4w_reg <= {(NCRC* 4){1'b1}};
		crc_8w_reg <= {(NCRC* 8){1'b1}};
		crc_8d_reg <= {(NCRC*16){1'b1}};

		case(cfg_width)
		WIDTH_1W: if (cfg_ddr)
				crc_2w_reg <= nxt_crc_2w;
			else
				crc_1w_reg <= APPLYCRC32(crc_1w_reg, S_DATA);
		WIDTH_4W: if (cfg_ddr)
				crc_8w_reg <= nxt_crc_8w;
			else
				crc_4w_reg <= nxt_crc_4w;
		WIDTH_8W: if (cfg_ddr)
				crc_8d_reg <= nxt_crc_8d;
			else
				crc_8w_reg <= nxt_crc_8w;
		default: begin end
		endcase
	end else if (i_ckstb && pstate != P_IDLE && pstate != P_DATA && ck_counts == 0)
	begin
		crc_1w_reg <= {(NCRC){1'b1}};
		crc_2w_reg <= {(2*NCRC){1'b1}};
		crc_4w_reg <= { crc_4w_reg[ 4*NCRC-32-1:0], 32'hffff_ffff };
		crc_8w_reg <= { crc_8w_reg[ 8*NCRC-32-1:0], 32'hffff_ffff };
		crc_8d_reg <= { crc_8d_reg[16*NCRC-32-1:0], 32'hffff_ffff };
	end
	// }}}

	function automatic [NCRC-1:0] STEPCRC(reg [NCRC-1:0] prior,
		// {{{
				input i_bit);
	begin
		if (prior[NCRC-1] ^ i_bit)
			STEPCRC = { prior[NCRC-2:0], 1'b0 } ^ CRC_POLYNOMIAL;
		else
			STEPCRC = { prior[NCRC-2:0], 1'b0 };
	end endfunction
	// }}}

	function automatic [NCRC-1:0] APPLYCRC32(reg [NCRC-1:0] prior,
		// {{{
			input [31:0] i_crc_data);
		integer		ck;
		reg	[NCRC-1:0]	fill;
	begin
		fill = prior;
		for(ck=0; ck<32; ck=ck+1)
			fill = STEPCRC(fill, i_crc_data[31-ck]);

		APPLYCRC32 = fill;
	end endfunction
	// }}}

	function automatic [NCRC-1:0] APPLYCRC16(input [NCRC-1:0] prior,
		// {{{
			input [15:0] i_crc_data);
		integer		ck;
		reg	[NCRC-1:0]	fill;
	begin
		fill = prior;
		for(ck=0; ck<16; ck=ck+1)
			fill = STEPCRC(fill, i_crc_data[15-ck]);
		APPLYCRC16 = fill;
	end endfunction
	// }}}

	function automatic [NCRC-1:0] APPLYCRC8(reg [NCRC-1:0] prior,
		// {{{
			input [7:0] i_crc_data);
		integer		ck;
		reg	[NCRC-1:0]	fill;
	begin
		fill = prior;
		for(ck=0; ck<8; ck=ck+1)
			fill = STEPCRC(fill, i_crc_data[7-ck]);
		APPLYCRC8 = fill;
	end endfunction
	// }}}

	function automatic [NCRC-1:0] APPLYCRC4(reg [NCRC-1:0] prior,
		// {{{
			input [3:0] i_crc_data);
		integer		ck;
		reg	[NCRC-1:0]	fill;
	begin
		fill = prior;
		for(ck=0; ck<4; ck=ck+1)
			fill = STEPCRC(fill, i_crc_data[3-ck]);
		APPLYCRC4 = fill;
	end endfunction
	// }}}

	function automatic [NCRC-1:0] APPLYCRC2(reg [NCRC-1:0] prior,
		// {{{
			input [1:0] i_crc_data);
		integer		ck;
		reg	[NCRC-1:0]	fill;
	begin
		fill = prior;
		for(ck=0; ck<2; ck=ck+1)
			fill = STEPCRC(fill, i_crc_data[1-ck]);
		APPLYCRC2 = fill;
	end endfunction
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Clock divider, data shift register
	// {{{

	reg	ck_stop_bit;

	// ck_valid
	// {{{
	initial	ck_valid = 0;
	initial	ck_stop_bit = 0;
	always @(posedge i_clk)
	if (i_reset)
	begin
		ck_valid <= 0;
		ck_stop_bit <= 1'b0;
	end else if (start_packet)
	begin
		// Start us one clock cycle early with a single start bit
		ck_valid <= 1;
		ck_stop_bit <= 1'b1;	// Need a stop bit
	end else if (i_ckstb && ck_counts == 0)
	begin
		ck_valid    <= pre_valid || ck_stop_bit;
		ck_stop_bit <= pre_valid;
	end
`ifdef	FORMAL
	always @(*)
	if (!i_reset && (ck_stop_bit || pre_valid))
		assert(ck_valid);
`endif
	// }}}

	initial	ck_counts = 0;
	initial	ck_sreg = -1;
	initial	ck_data = -1;
	always @(posedge i_clk)
	if (i_reset) // pstate == P_IDLE)
	begin
		// {{{
		ck_sreg  <= {(32){1'b1}};
		ck_data  <= {(32){1'b1}};
		ck_counts<= 0;
		// }}}
	end else if (i_ckstb && pre_valid && ck_counts == 0) // && tx_ready
	begin // Load the shift registers
		case(cfg_period)
		P_1D: begin // One clock period of data
			// {{{
			case(cfg_width)
			WIDTH_1W: begin
				ck_sreg <= { pre_data[30: 0], 1'b1 };
				ck_data <= { (4){7'h7f, pre_data[31] } };
				// In the case of the 1b CRC, we only need
				// 16 clock cycles, not 32.
				ck_counts <= (!cfg_ddr && pstate == P_LAST) ? 15: 31;
				end
			WIDTH_4W: begin
				ck_sreg <= { pre_data[27: 0], 4'hf };
				ck_data <= { (4){ 4'hf, pre_data[31:28] } };
				ck_counts <= 7;
				end
			default: begin // WIDTH_8W
				ck_sreg <= { pre_data[23: 0], 8'hff };
				ck_data <= { (4){pre_data[31:24] } };
				ck_counts <= 3;
				end
			endcase end
			// }}}
		P_2D: begin // Two clock periods of data
			// {{{
			case(cfg_width)
			WIDTH_1W: begin
				ck_sreg <= { pre_data[29: 0], 2'b11 };
				ck_data <= { {(2){7'h7f, pre_data[31] }},
						{(2){7'h7f, pre_data[30] }} };
				ck_counts <= 15;
				end
			WIDTH_4W: begin
				ck_sreg <= { pre_data[23: 0], 8'hff };
				ck_data <= { {(2){4'hf, pre_data[31:28] }},
						{(2){4'hf, pre_data[27:24] }} };
				ck_counts <= 3;
				end
			default: begin // WIDTH_8W
				ck_sreg <= { pre_data[15: 0], 16'hffff };
				ck_data <= { {(2){pre_data[31:24] }},
						{(2){pre_data[23:16]}} };
				ck_counts <= 1;
				end
			endcase end
			// }}}
		default: begin // Four clock periods of data
			// {{{
			case(cfg_width)
			WIDTH_1W: begin
				ck_sreg <= { pre_data[27: 0], 4'hf };
				ck_data <= { 7'h7f, pre_data[31],
						7'h7f, pre_data[30],
						7'h7f, pre_data[29],
						7'h7f, pre_data[28] };
				ck_counts <= 7;
				end
			WIDTH_4W: begin
				ck_sreg <= { pre_data[15: 0], 16'hffff };
				ck_data <= { 4'hf, pre_data[31:28],
					4'hf, pre_data[27:24],
					4'hf, pre_data[23:20],
					4'hf, pre_data[19:16] };
				ck_counts <= 1;
				end
			default: begin // WIDTH_8W
				ck_sreg <= {(32){1'b1}};
				ck_data <= pre_data;
				ck_counts <= 0;
				end
			endcase end
			// }}}
		endcase
	end else if ((i_ckstb || (i_hlfck && cfg_ddr)) && ck_counts > 0)
	begin // Drain the shift registers
		ck_counts <= ck_counts - 1;
		case(cfg_period)
		P_1D: begin // One clock period of data
			// {{{
			case(cfg_width)
			WIDTH_1W: begin
				ck_sreg <= { ck_sreg[30: 0], 1'b1 };
				ck_data <= { (4){7'h7f, ck_sreg[31] }};
				end
			WIDTH_4W: begin
				ck_sreg <= { ck_sreg[27: 0], 4'hf };
				ck_data <= { (4){4'hf, ck_sreg[31:28] } };
				end
			default: begin // WIDTH_8W
				ck_sreg <= { ck_sreg[23: 0], 8'hff };
				ck_data <= { (4){ck_sreg[31:24] } };
				end
			endcase end
			// }}}
		P_2D: begin // Two clock periods of data
			// {{{
			case(cfg_width)
			WIDTH_1W: begin
				ck_sreg <= { ck_sreg[29: 0], 2'b11 };
				ck_data <= { {(2){7'h7f, ck_sreg[31] }},
						{(2){7'h7f, ck_sreg[30] }} };
				end
			WIDTH_4W: begin
				ck_sreg <= { ck_sreg[23: 0], 8'hff };
				ck_data <= { {(2){4'hf, ck_sreg[31:28] }},
						{(2){4'hf, ck_sreg[27:24] }} };
				end
			default: begin // WIDTH_8W
				ck_sreg <= { ck_sreg[15: 0], 16'hffff };
				ck_data <= { {(2){ck_sreg[31:24] }},
						{(2){ck_sreg[23:16]}} };
				end
			endcase end
			// }}}
		default: begin // Four clock periods of data
			// {{{
			case(cfg_width)
			WIDTH_1W: begin
				ck_sreg <= { ck_sreg[27: 0], 4'hf };
				ck_data <= { 7'h7f, ck_sreg[31],
						7'h7f, ck_sreg[30],
						7'h7f, ck_sreg[29],
						7'h7f, ck_sreg[28] };
				end
			WIDTH_4W: begin
				ck_sreg <= { ck_sreg[15: 0], 16'hffff };
				ck_data <= { 4'hf, ck_sreg[31:28],
					4'hf, ck_sreg[27:24],
					4'hf, ck_sreg[23:20],
					4'hf, ck_sreg[19:16] };
				end
			default: begin // WIDTH_8W
				ck_sreg <= {(32){1'b1}};
				ck_data <= ck_sreg;
				end
			endcase end
			// }}}
		endcase
	end else if (i_ckstb && ck_counts == 0)
	begin
		// Fully idle
		ck_data  <= -1;
		ck_sreg  <= -1;

		ck_counts <= (start_packet && i_cfg_ddr && !i_hlfck) ? 1:0;

		if (start_packet)	// Implies i_ckstb
		case(cfg_period)
		2'b00: begin // One data period / clock
			case(cfg_width)
			WIDTH_1W: ck_data  <= {(4){ 8'hfe }};
			WIDTH_4W: ck_data  <= {(4){ 8'hf0 }};
			default:  ck_data  <= {(4){ 8'h00 }};
			endcase end
		2'b01: begin // Two data periods / clock
			// {{{
			if (cfg_ddr)
			begin
				// One pedge, one negedge
				case(cfg_width)
				WIDTH_1W: ck_data  <= {(4){ 8'hfe }};
				WIDTH_4W: ck_data  <= {(4){ 8'hf0 }};
				default:  ck_data  <= {(4){ 8'h00 }};
				endcase
			end else begin
				// Two posedges, so only the second gets the
				// start bits
				case(cfg_width)
				WIDTH_1W: ck_data  <= { {(2){8'hff}}, {(2){8'hfe}} };
				WIDTH_4W: ck_data  <= { {(2){8'hff}}, {(2){8'hf0}} };
				default:  ck_data  <= { {(2){8'hff}}, {(2){8'h00}} };
				endcase
			end end
			// }}}
		default: begin // 4 data periods / clock, DDR
			// pedge, nedge, pedge, nedge, so the last two
			// get the start bit
			case(cfg_width)
			WIDTH_1W: ck_data  <= { {(2){8'hff}}, {(2){8'hfe}} };
			WIDTH_4W: ck_data  <= { {(2){8'hff}}, {(2){8'hf0}} };
			default:  ck_data  <= { {(2){8'hff}}, {(2){8'h00}} };
			endcase end
		endcase
	end

	assign	pre_ready = (ck_counts == 0) && i_ckstb; // && tx_ready;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Final outputs
	// {{{
	assign	tx_valid = ck_valid;
	// assign ck_ready = (i_ckstb || (i_hlfck && cfg_ddr)); // && tx_ready;
	assign	tx_data  = ck_data;
	// }}}

	//
	// Make verilator happy
	// {{{
	// verilator coverage_off
	// verilator lint_off UNUSED
	// wire	unused;
	// assign	unused = i_wb_cyc;
	// verilator lint_on  UNUSED
	// verilator coverage_on
	// }}}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal properties
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
	// Verilator lint_off UNUSED
	reg	f_ckstb, f_hlfck;
	(* keep *)	reg	[9+5:0]	fb_count, fd_offset, fd_count,
					f_loaded_count;
	(* keep *)	reg	[9:0]	fs_count;
			reg	[10:0]	fcrc_count;
	(* keep *)	reg		fs_last;
	wire		f_step, fload_xtra;
	// Verilator lint_on  UNUSED

	assign	f_step = f_ckstb || (cfg_ddr && f_hlfck);
	assign	fload_xtra = tx_valid && f_step; // || fb_count == fd_offset);

	always @(*)
	begin
		// Verilator lint_off WIDTH
		if (fb_count < fd_offset)
			f_loaded_count = 0;
		else if (!tx_valid)
			f_loaded_count = fb_count - fd_offset;
		else case(cfg_period)
		P_1D: case(cfg_width)
			// {{{
			WIDTH_1W: f_loaded_count = fd_count + ck_counts + (fload_xtra ? 1:0);
			WIDTH_4W: f_loaded_count = fd_count + (ck_counts*4) + (fload_xtra ? 4:0);
			WIDTH_8W: f_loaded_count = fd_count + (ck_counts*8) + (fload_xtra ? 8:0);
			default: begin end
			endcase
			// }}}
		P_2D: case(cfg_width)
			// {{{
			WIDTH_1W: f_loaded_count = fd_count + ck_counts*2 + (fload_xtra ? 2:0);
			WIDTH_4W: f_loaded_count = fd_count + ck_counts*8 + (fload_xtra ? 8:0);
			WIDTH_8W: f_loaded_count = fd_count + ck_counts*16 + (fload_xtra ? 16:0);
			default: begin end
			endcase
			// }}}
		P_4D: case(cfg_width)
			// {{{
			WIDTH_1W: f_loaded_count = fd_count + ck_counts*4 + (fload_xtra ? 4:0);
			WIDTH_4W: f_loaded_count = fd_count + ck_counts*16 + (fload_xtra ? 16:0);
			WIDTH_8W: f_loaded_count = fd_count + ck_counts*32 + (fload_xtra ? 32:0);
			default: begin end
			endcase
			// }}}
		default: begin end
		endcase
		// Verilator lint_on  WIDTH
	end

	always @(posedge i_clk)
	if (i_reset)
		{ f_ckstb, f_hlfck } <= 2'b00;
	else
		{ f_ckstb, f_hlfck } <= { i_ckstb, i_hlfck };

	// fb_count -- count bits sent, including starting word
	// {{{
	always @(posedge i_clk)
	if (i_reset || !tx_valid)
		fb_count <= 0;
	else if (f_ckstb || (cfg_ddr && f_hlfck)) case(cfg_width)
	WIDTH_1W: begin
		case(cfg_period)
		P_1D: fb_count <= fb_count + 1;
		P_2D: fb_count <= fb_count + 2;
		default: fb_count <= fb_count + 4;
		endcase end
	WIDTH_4W: begin
		case(cfg_period)
		P_1D: fb_count <= fb_count + 4;
		P_2D: fb_count <= fb_count + 8;
		default: fb_count <= fb_count + 16;
		endcase end
	default: begin
		case(cfg_period)
		P_1D: fb_count <= fb_count + 8;
		P_2D: fb_count <= fb_count + 16;
		default: fb_count <= fb_count + 32;
		endcase end
	endcase
	// }}}

	initial	fs_last = 0;
	always @(posedge i_clk)
	if (i_reset || !i_en || (pstate == P_LAST && !tx_valid))
	begin
		fs_count <= 0;
		fs_last  <= 0;
		fcrc_count <= 0;
	end else if (S_VALID && S_READY)
	begin
		fs_count <= fs_count + 1;
		fcrc_count <= fs_count + 1;
		fs_last  <= S_LAST;
	end else if (pre_valid && pre_ready)
		fcrc_count <= fcrc_count + 1;

	// fd_offset, fd_count: bit count, not including the starting word
	// {{{
	always @(*)
	begin
		fd_offset = 1;
		case(cfg_width)
		WIDTH_1W: begin
			case(cfg_period)
			P_1D: fd_offset = (cfg_ddr ? 2:1);
			P_2D: fd_offset = 2;
			default: fd_offset = 4;
			endcase end
		WIDTH_4W: begin
			case(cfg_period)
			P_1D: fd_offset = (cfg_ddr ?  8: 4);
			P_2D: fd_offset = 8;
			default: fd_offset = 16;
			endcase end
		default: begin
			case(cfg_period)
			P_1D: fd_offset = (cfg_ddr ? 16: 8);
			P_2D: fd_offset = 16;
			default: fd_offset= 32;
			endcase end
		endcase
	end

	always @(*)
	if (fb_count > fd_offset)
		fd_count = fb_count - fd_offset;
	else
		fd_count = 0;
	// }}}

`ifdef	FORMAL
	reg	f_past_valid, f_pending_half;
	(* anyconst *)	reg	[9:0]	fc_posn;
	(* anyconst *)	reg	[31:0]	fc_data;
	wire	[9:0]	fp_count;


	initial	f_past_valid = 0;
	always @(posedge i_clk)
		f_past_valid <= 1'b1;

	always @(*)
	if (!f_past_valid)
		assume(i_reset);
	////////////////////////////////////////////////////////////////////////
	//
	// Configuraion interface
	// {{{

	always @(*)
	if (!OPT_SERDES)
	begin
		assume(!i_cfg_ddr || i_cfg_spd > 1);
		assume(i_cfg_spd > 0);
	end

	always @(*)
	if (!i_reset)
		assume(i_cfg_width != 2'b11);

	////////

	always @(*)
	if (!i_reset)
		assert(cfg_period <= P_4D);

	always @(posedge i_clk)
	if (!i_reset && $past(tx_valid))
		assume(i_en);

	always @(posedge i_clk)
	if (!i_reset && (i_en || $past(i_en)))
	begin
		assume($stable(i_cfg_ddr));
		assume($stable(i_cfg_spd));
		assume($stable(i_cfg_width));
	end

	always @(posedge i_clk)
	if (!i_reset && i_en)
	begin
		assert(i_cfg_ddr   == cfg_ddr);
		assert(i_cfg_width == cfg_width);
	end

	always @(*)
	if (!i_reset)
		assert(cfg_width != 2'b11);


	always @(*)
	if (!i_reset && pstate != P_IDLE)
	begin
		if (cfg_period == P_4D)
			assert(cfg_ddr);
	end

	always @(posedge i_clk)
	if (!i_reset && i_en)
	begin
		if (i_cfg_ddr && i_cfg_spd == 0)
		begin
			assert(cfg_period == 2'b10);
		end else if ((i_cfg_ddr && i_cfg_spd == 1)
			||(!i_cfg_ddr && i_cfg_spd == 0))
		begin
			assert(cfg_period == 2'b01);
		end else begin
			assert(cfg_period == 2'b00);
		end
	end

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Clock interface
	// {{{

	always @(*)
	if (!OPT_SERDES)
		assume(!i_ckstb || !i_hlfck);

	initial	f_pending_half = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		f_pending_half <= 1'b0;
	else if (i_ckstb)
		f_pending_half <= !i_hlfck;
	else if (i_hlfck)
		f_pending_half <= 1'b0;

	always @(*)
	if (i_en) case(i_cfg_spd)
	0: assume(i_ckstb && i_hlfck);
	1: assume(i_ckstb && i_hlfck);
	2: assume(i_ckstb ^ i_hlfck);
	default: assume(!i_ckstb || !i_hlfck);
	endcase

	always @(*)
	if (i_en && i_cfg_spd == 2)
		assume({ i_ckstb, i_hlfck } == (f_pending_half ? 2'b01:2'b10));

	always @(*)
	if (f_pending_half)
		assume(!i_ckstb);
	else if (i_hlfck)
		assume(i_ckstb);

	always @(*)
	if (!i_reset)
	begin
		if (cfg_period == P_1D)
		begin
			assume(!i_ckstb || (!cfg_ddr || !i_hlfck));
		end else
			assume(i_ckstb && i_hlfck);	// On every clock period
	end

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// IO properties
	// {{{

	// Only change on a clock
	// {{{
	always @(posedge i_clk)
	if (!f_past_valid || $past(i_reset))
		assert(!tx_valid);
	else if (!$past(i_ckstb) && !$past(i_hlfck && cfg_ddr))
	begin
		assert($stable(tx_valid));
		assert($stable(tx_data));
	end
	// }}}

	// Unused bits to be set to 1'b1
	// {{{
	always @(*)
	if (!i_reset)
	begin
		if (!tx_valid)
			assert(&tx_data);
		else case(cfg_width)
		WIDTH_1W: begin
			assert(tx_data[31:25] == 7'h7f);
			assert(tx_data[23:17] == 7'h7f);
			assert(tx_data[15: 9] == 7'h7f);
			assert(tx_data[ 7: 1] == 7'h7f);
			end
		WIDTH_4W: begin
			assert(tx_data[31:28] == 4'hf);
			assert(tx_data[23:20] == 4'hf);
			assert(tx_data[15:12] == 4'hf);
			assert(tx_data[ 7: 4] == 4'hf);
			end
		default: begin end
		endcase
	end
	// }}}

	// CFG_PERIOD requires repeated bits
	// {{{
	always @(*)
	if (!i_reset && tx_valid)
	case(cfg_period)
	P_1D: begin
		assert(tx_data[31:24] == tx_data[ 7: 0]);
		assert(tx_data[23:16] == tx_data[ 7: 0]);
		assert(tx_data[15: 8] == tx_data[ 7: 0]);
		end
	P_2D: begin
		assert(tx_data[31:24] == tx_data[23:16]);
		assert(tx_data[15: 8] == tx_data[ 7: 0]);
		end
	default: begin end
	endcase
	// }}}

	always @(posedge i_clk)
	if (!i_reset && pstate == P_CRC || pstate == P_DATA)
		assert(tx_valid && pre_valid);

	always @(posedge i_clk)
	if (!i_reset && pstate == P_IDLE)
		assert(!tx_valid);
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// AXI Stream inputs
	// {{{

	// Enable
	// {{{
	always @(posedge i_clk)
	if (!i_reset && (S_VALID || tx_valid))// || pstate != P_IDLE))
		assume(i_en);

	always @(*)
	if (!i_en)
		assume(!S_VALID);

	// always @(posedge i_clk)
	// if (fs_last)
	//	assume(!i_en);

	always @(posedge i_clk)
	if (!i_reset && pstate == P_IDLE)
		assert(fs_count == 0);

	always @(*)
	if (!i_reset)
	begin
		if (!fs_last)
		begin
			assert(fcrc_count == fs_count);
		end else
			assert(fcrc_count >= fs_count);
	end
	// }}}

	always @(posedge i_clk)
	if (!f_past_valid || $past(i_reset))
	begin
		assume(!S_VALID);
		assume(!i_en);
	end else if ($past(S_VALID && !S_READY))
	begin
		assume(S_VALID);
		assume($stable(S_DATA));
		assume($stable(S_LAST));
	end else if ($past(S_VALID && !S_LAST))
		assume(S_VALID);

	always @(*)
	if (fs_last)
		assume(!S_VALID);

	always @(*)
	if (fs_count == 10'h3df)
		assume(!S_VALID || S_LAST);

	always @(*)
	if (!i_reset && fs_count >= 10'h3e0)
		assert(fs_last);

	always @(*)
	if (!i_reset && fs_count==0)
		assert(!fs_last);

	always @(posedge i_clk)
	if (!i_reset && (pstate == P_CRC || pstate == P_LAST))
		assert(fs_last);

	always @(posedge i_clk)
	if (!i_reset && pstate == P_DATA)
		assert(!fs_last && S_VALID && fs_count > 0);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Contract checking
	// {{{

	always @(*)
	if (S_VALID && fs_count == fc_posn)
		assume(fc_data == S_DATA);

	// Start bit checking
	// {{{
	always @(*)
	if (!i_reset && tx_valid && fb_count < fd_offset)
	begin
		if (!f_step)
		begin
			case({(cfg_ddr && !f_pending_half), cfg_width})
			{1'b0,WIDTH_1W}: assert(fb_count==1);
			{1'b1,WIDTH_1W}: assert(fb_count==2);
			{1'b0,WIDTH_4W}: assert(fb_count==4);
			{1'b1,WIDTH_1W}: assert(fb_count==8);
			{1'b0,WIDTH_8W}: assert(fb_count==8);
			{1'b1,WIDTH_8W}: assert(fb_count==16);
			default: assert(0);
			endcase
		end
		assert(ck_counts == ((cfg_ddr && f_pending_half) ? 1:0));
		assert(fs_count <= 1);
		assert(fd_count == 0);
		assert(pstate == P_DATA || (pstate == P_CRC && fs_count == 1));
		case(cfg_period)
		P_1D: case(cfg_width)
			WIDTH_1W: assert((cfg_ddr && !f_pending_half)
				|| ({ tx_data[24], tx_data[16], tx_data[8], tx_data[0] } == 4'b0));
			WIDTH_4W: assert((cfg_ddr && !f_pending_half)
				|| ({ tx_data[27:24], tx_data[19:16],
					tx_data[11:8], tx_data[3:0] } == 16'b0));
			WIDTH_8W: assert((cfg_ddr && !f_pending_half)
				|| tx_data == 32'h0);
			default: begin end
			endcase
		P_2D: case(cfg_width)
			WIDTH_1W: assert({ tx_data[24], tx_data[16], tx_data[8], tx_data[0] }
					== (cfg_ddr) ? 4'b0000 : 4'b1100);
			WIDTH_4W:	assert({ tx_data[27:24], tx_data[19:16],
					tx_data[11:8], tx_data[3:0] }
					== (cfg_ddr) ? 16'h00 : 16'hff00);
			WIDTH_8W:	assert(tx_data == (cfg_ddr) ? 32'h00 : 32'hffff_0000);
			default: begin end
			endcase
		P_4D: case(cfg_width)
			WIDTH_1W: assert({ tx_data[24], tx_data[16], tx_data[8], tx_data[0] } == 4'b1100);
			WIDTH_4W: assert({ tx_data[27:24], tx_data[19:16],
					tx_data[11:8], tx_data[3:0] } == 16'hff00);
			WIDTH_8W: assert(tx_data == 32'hffff_0000);
			default: begin end
			endcase
		endcase
	end
	// }}}

	assign	fp_count=((pstate == P_DATA && pre_valid) || (pstate == P_CRC))
			? fs_count-1 : fs_count;

	always @(*)
	if (pre_valid)
	begin
		assert(pstate != P_IDLE);
		if (fp_count == fc_posn && pstate == P_DATA)
			assert(pre_data == fc_data);
	end else begin
		assert(pstate == P_IDLE || pstate == P_LAST);
	end

	// Verify pre_count
	// {{{
	always @(*)
	if (!i_reset)
		assert(pre_count <= 7);

	always @(*)
	if (!i_reset && pstate == P_DATA)
		assert(pre_valid);

	always @(*)
	if (!i_reset && pstate == P_DATA)
	begin
		case(cfg_width)
		WIDTH_1W: assert(pre_count == 0);
		WIDTH_4W: assert(pre_count == (cfg_ddr) ? 3 : 1);
		default: // WIDTH_8W
			assert(pre_count == (cfg_ddr) ? 7 : 3);
		endcase
	end else if (!i_reset && pstate == P_CRC)
	begin
		assert(pre_valid);
		case(cfg_width)
		WIDTH_1W: assert(pre_count == 0);
		WIDTH_4W: assert(pre_count <= (cfg_ddr) ? 3 : 1);
		default: // WIDTH_8W
			assert(pre_count <= (cfg_ddr) ? 7 : 3);
		endcase
	end else if (!i_reset && pstate == P_LAST)
	begin
		assert(pre_count == 0);
	end
	// }}}

	always @(*)
	if (!i_reset && pstate == P_DATA)
	begin
		if (fs_count < 2)
		begin
			assert(fd_count == 0);
		end else begin
			assert(fs_count == (pre_valid ? 1:0) + f_loaded_count[14:5]);
		end
	end

	always @(*)
	if (!i_reset && pstate == P_CRC)
	begin
		assert(pre_valid);
		assert(fcrc_count == 1 + f_loaded_count[14:5]);

		case(cfg_width)
		WIDTH_1W: assert(fcrc_count == fs_count);
		WIDTH_4W: assert(fcrc_count == fs_count + (((cfg_ddr) ? 3 : 1)-pre_count));
		WIDTH_8W: assert(fcrc_count == fs_count + (((cfg_ddr) ? 7 : 3)-pre_count));
		endcase
	end

	always @(*)
	if (!i_reset && pstate == P_LAST)
	begin
		case(cfg_width)
		WIDTH_1W: assert(fcrc_count == fs_count + 1 + (pre_valid ? 0:1));
		WIDTH_4W: assert(fcrc_count == fs_count + 1 + (pre_valid ? 0:1)
				+ (((cfg_ddr) ? 3 : 1)-pre_count));
		WIDTH_8W: assert(fcrc_count == fs_count + 1 + (pre_valid ? 0:1)
				+ (((cfg_ddr) ? 7 : 3)-pre_count));
		endcase
	end

	always @(*)
	if (!i_reset && (pstate == P_IDLE || !tx_valid))
		assert(ck_counts == 0);

	always @(*)
	if (!i_reset && fb_count >= fd_offset)
	case(cfg_period)
	P_1D: case(cfg_width)
		// {{{
		WIDTH_1W: begin end
		WIDTH_4W: begin
				assert(ck_counts <= 7);
			end
		WIDTH_8W: begin
				assert(ck_counts <= 3);
			end
		endcase
		// }}}
	P_2D: case(cfg_width)
		// {{{
		WIDTH_1W: begin
				assert(ck_counts <= 15);
			end
		WIDTH_4W: begin
				assert(ck_counts <= 3);
			end
		WIDTH_8W: begin
				assert(ck_counts <= 1);
			end
		endcase
		// }}}
	P_4D: case(cfg_width)
		// {{{
		WIDTH_1W: begin
				assert(ck_counts <= 7);
			end
		WIDTH_4W: begin
				assert(ck_counts <= 1);
			end
		WIDTH_8W: begin
			assert(ck_counts == 0);
			if (pstate == P_DATA) begin
				assert(fd_count + 32 == { fp_count, 5'h0 });
				if (fd_count == { fc_posn, 5'h0 })
					assert(ck_data == fc_data);
			end end
		endcase
		// }}}
	endcase

	// Verify fb_count modulo step is always zero
	// {{{
	always @(*)
	if (!i_reset)
	begin
		case(cfg_period)
		P_1D: case(cfg_width)
			// {{{
			WIDTH_1W: begin end
			WIDTH_4W: assert(fb_count[1:0] == 2'b0);
			WIDTH_8W: assert(fb_count[2:0] == 3'b0);
			endcase
			// }}}
		P_2D: case(cfg_width)
			// {{{
			WIDTH_1W: assert(fb_count[0] == 1'b0);
			WIDTH_4W: assert(fb_count[2:0] == 3'b0);
			WIDTH_8W: assert(fb_count[3:0] == 4'b0);
			endcase
			// }}}
		P_4D: case(cfg_width)
			// {{{
			WIDTH_1W: assert(fb_count[1:0] == 2'h0);
			WIDTH_4W: assert(fb_count[3:0] == 4'h0);
			WIDTH_8W: assert(fb_count[4:0] == 5'h0);
			endcase
			// }}}
		endcase
	end
	// }}}

	// Verify f_loaded_count[4:0]
	// {{{
	always @(*)
	if (!i_reset)
	begin
		// assert(f_loaded_count[4:0] == 0);
		if (pstate == P_DATA || pstate == P_CRC) case(cfg_period)
		P_1D: case(cfg_width)
			WIDTH_1W: assert(f_loaded_count[4:0] == 5'h00);
			WIDTH_4W: assert(f_loaded_count[4:0] == 5'h00);
			WIDTH_8W: assert(f_loaded_count[4:0] == 5'h00);
			default: begin end
			endcase
		P_2D: case(cfg_width)
			WIDTH_1W: assert(f_loaded_count[4:0] == (f_step ? 5'h00 : 5'h04));
			WIDTH_4W: assert(f_loaded_count[4:0] == (f_step ? 5'h00 : 5'h08));
			WIDTH_8W: assert(f_loaded_count[4:0] == 5'h0);
			default: begin end
			endcase
		P_4D: case(cfg_width)
			WIDTH_1W: assert(f_loaded_count[4:0] == (f_step ? 5'h00 : 5'h08));
			WIDTH_4W: assert(f_loaded_count[4:0] == (f_step ? 5'h00 : 5'h10));
			WIDTH_8W: assert(f_loaded_count[4:0] == 5'h0);
			default: begin end
			endcase
		default: begin end
		endcase
	end
	// }}}

	// Verify ck_count[LSB] for DDR
	// {{{
	always @(*)
	if (!i_reset && tx_valid && cfg_ddr && cfg_period == P_1D)
	begin
		assert(ck_counts[0] == f_pending_half
			|| (!pre_valid && pstate == P_LAST && ck_counts==0));
	end
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Cover checks
	// {{{

	// Pre-contract cover check: Can we start a packet in each mode?
	// {{{
	always @(posedge i_clk)
	if (!i_reset && !$past(i_reset) && tx_valid)
	begin
		case(cfg_period)
		P_1D: case(cfg_width)
			// {{{
			WIDTH_1W: cover(1);
			WIDTH_4W: cover(1);
			WIDTH_8W: cover(1);
			default: begin end
			endcase
			// }}}
		P_2D: if(cfg_ddr)
			// {{{
			begin
				case(cfg_width)
				WIDTH_1W: cover(1);
				WIDTH_4W: cover(1);
				WIDTH_8W: cover(1);
				default: begin end
				endcase
			end else begin
				case(cfg_width)
				WIDTH_1W: cover(1);
				WIDTH_4W: cover(1);
				WIDTH_8W: cover(1);
				default: begin end
				endcase
			end
			// }}}
		P_4D: case(cfg_width)
			// {{{
			WIDTH_1W: cover(1);
			WIDTH_4W: begin
				cover(1);
				cover(fs_count == 1);
				cover(fs_count == 2);
				cover(fs_count == 3);		// !!!
				cover(fs_count == 4);		// !!!
				cover(S_VALID && S_LAST);
				cover(!S_VALID);
				cover($fell(pre_valid));
				cover(pstate == P_CRC);
				cover(pstate == P_LAST);	// !!!
				cover(!pre_valid);		// !!!
				end
			WIDTH_8W: cover(1);
			default: begin end
			endcase
			// }}}
		endcase
	end
	// }}}

	// Contract covers: can we complete a packet in the first place?
	// {{{
	always @(posedge i_clk)
	if (!i_reset && !$past(i_reset) && $fell(tx_valid))
	begin
		case(cfg_period)
		P_1D: case(cfg_width)
			// {{{
			WIDTH_1W: cover(1);		// !!!
			WIDTH_4W: cover(1);		// !!!
			WIDTH_8W: cover(1);		// !!!
			default: begin end
			endcase
			// }}}
		P_2D: if(cfg_ddr)
			// {{{
			begin
				case(cfg_width)
				WIDTH_1W: cover(1);		// !!!
				WIDTH_4W: cover(1);
				WIDTH_8W: cover(1);
				default: begin end
				endcase
			end else begin
				case(cfg_width)
				WIDTH_1W: cover(1);		// !!!
				WIDTH_4W: cover(1);
				WIDTH_8W: cover(1);
				default: begin end
				endcase
			end
			// }}}
		P_4D: case(cfg_width)
			// {{{
			WIDTH_1W: cover(1);		// !!!
			WIDTH_4W: cover(1);		// !!!
			WIDTH_8W: cover(1);
			default: begin end
			endcase
			// }}}
		endcase
	end
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// "Careless" assumptions
	// {{{

	// always @(*)
	// if (!i_reset && tx_valid && fs_count == 0)
	//	assume(fb_count <= fd_offset);

	// Without the following assertion, f_loaded_count gets out of synch,
	// and the proof fails.  With the assertion, it passes.
	// always @(*) assume(i_ckstb || i_hlfck);
	// always @(*) assume(!i_cfg_ddr && i_cfg_spd >= 1);

	// The following assertion just prevents overflow within the formal
	// accounting.  It's unnecessary otherwise.
	always @(*) assume(fb_count < 15'h7fd0);

	// The following assertions are crutches, that have been removed now
	// that the proof passes.
	// always @(*) assume(pstate != P_LAST);
	// always @(*) if (cfg_period == P_1D) assume(!cfg_ddr);
	// always @(*) if (pstate == P_IDLE) assume(!S_VALID || !S_LAST);
	// }}}
`endif	// FORMAL
// }}}
endmodule

