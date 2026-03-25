################################################################################
##
## Filename: 	
## {{{
## Project:	SD-Card controller, using a shared SPI interface
##
## Purpose:	
##
## Creator:	Dan Gisselquist, Ph.D.
##		Gisselquist Technology, LLC
##
################################################################################
## }}}
## Copyright (C) 2023, Gisselquist Technology, LLC
## {{{
## This program is free software (firmware): you can redistribute it and/or
## modify it under the terms of the GNU General Public License as published
## by the Free Software Foundation, either version 3 of the License, or (at
## your option) any later version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
## FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
## for more details.
##
## You should have received a copy of the GNU General Public License along
## with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
## target there if the PDF file isn't present.)  If not, see
## <http://www.gnu.org/licenses/> for a copy.
## }}}
## License:	GPL, v3, as defined and found on www.gnu.org,
## {{{
##		http://www.gnu.org/licenses/gpl.html
##
##
################################################################################
##
## }}}
RTL := ../../rtl
CPU := $(HOME)/work/rnd/zipcpu/trunk
vcs_option := +define+UVM +define+UVM_NO_DEPRECATED +define+UVM_REGEX_NO_DPI +define+UVM_REG_ADDR_WIDTH=32 +define+UVM_REG_DATA_WIDTH=32 +define+UVM_REG_BYTENABLE_WIDTH=4 +define+SIMULATION -sverilog -full64 -licqueue -kdb -lca -ntb_opts uvm-1.2 -timescale=1ns/1ps  +warn=SV-NFIVC +warn=noUII-L +warn=noLCA_FEATURES_ENABLED -assert svaext -xlrm uniq_prior_final  -CFLAGS --std=c++11 -LDFLAGS -Wl,--no-as-needed -debug_access+f -debug_region=cell+lib +define+VCS +nospecify +notimingcheck -error=IPDW -error=UPF_ISPND -error=IGPA -error=PCSRMIO -error=AOUP -error=ELW_UNBOUND -error=IUWI -error=INAV -error=SV-ISC -error=OSVF-NPVIUFPI -error=DPIMI -error=IPDASP -error=CM-HIER-FNF -error=CWUC -error=MATN -error=STASKW_NDTAZ1 -error=TMPO -error=SV-OHCM +error+100 -error=IOPCWM -debug_access+all 
#vcs_option := +define+VCS +define+SIMULATION -sverilog -full64 -licqueue -kdb -lca -timescale=1ns/1ps +warn=SV-NFIVC +warn=noUII-L +warn=noLCA_FEATURES_ENABLED  -CFLAGS --std=c++11 -LDFLAGS -Wl,--no-as-needed -debug_access+f -debug_region=cell+lib +define+VCS +nospecify +notimingcheck -error=IPDW -error=UPF_ISPND -error=IGPA -error=PCSRMIO -error=AOUP -error=ELW_UNBOUND -error=IUWI -error=INAV -error=SV-ISC -error=OSVF-NPVIUFPI -error=DPIMI -error=IPDASP -error=CM-HIER-FNF -error=CWUC -error=MATN -error=STASKW_NDTAZ1 -error=TMPO -error=SV-OHCM +error+100 -error=IOPCWM -debug_access+all 
vcs_run_option := -ucli -do fsdb_run.tcl +ntb_random_seed=111 -assert nopostproc


tb_sdckgen: $(RTL)/sdckgen.v tb_sdckgen.v
	#iverilog -g2012 $^ -o $@
	vcs $(vcs_option) -top $@  $^ -o $@

tb_txframe: $(RTL)/sdckgen.v $(RTL)/sdtxframe.v tb_txframe.v
	#iverilog -g2012 $^ -o $@
	vcs $(vcs_option)  -top $@ $^ -o $@

obj_dir/Vtb_cpu.h:
	verilator -Wall -Wno-TIMESCALEMOD -y $(RTL) -y . -y $(CPU)/rtl -y $(CPU)/rtl/core -y $(CPU)/rtl/peripherals -y $(CPU)/rtl/zipdma -y $(CPU)/rtl/ex -y $(CPU)/sim/rtl -cc tb_cpu.v

.PHONY: test_ckgen
test_ckgen: tb_sdckgen
	./tb_sdckgen

.PHONY: test_txframe
test_txframe: tb_txframe
	./tb_txframe

.PHONY: test_all
test_all: test_txframe test_ckgen
	perl sim_sdio.pl all

.PHONY: test
test: 
	perl sim_sdio.pl vcs all '$(vcs_option) -top tb_sdio'
