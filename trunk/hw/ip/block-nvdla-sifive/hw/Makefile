#!/usr/bin/env make

## VARIABLES
TREE_MAKE := tree.make

##
## _default should always be the first dependency (you can add extra local actions with default::)
##

USE_NV_ENV ?= 0
USE_VM_ENV ?= 0

NV_USE_DESIGNWARE ?= 1
NV_DESIGNWARE_DIR ?= /usr/synopsys/dc-L-2016.03-SP1/dw/sim_ver
NV_CPP  ?= /usr/bin/cpp-4.8
NV_GCC  ?= /usr/bin/gcc-4.8
NV_CXX  ?= /usr/bin/g++-4.8
NV_PERL ?= /usr/bin/perl
NV_JAVA ?= /usr/synopsys/verdi-L-2016.06-1/bin/java
NV_SYSTEMC ?=  /work/install/systemc-2.3.4
NV_PROJ ?= nv_small nv_small_256 nv_small_256_full nv_medium_512 nv_medium_1024_full nv_large
NV_PYTHON 	?= /usr/bin/python
NV_VERDI_HOME ?= /usr/synopsys/verdi-L-2016.06-1
NV_NOVAS_HOME ?= /usr/synopsys/verdi-L-2016.06-1
NV_VCS_HOME   ?= /usr/synopsys/vcs-L-2016.06
NV_VERILATOR  ?= verilator
NV_CLANG      ?= /usr/bin/clang

default: $(TREE_MAKE)
$(TREE_MAKE): Makefile
	@echo "Creating tree.make to setup your working environment and projects"
	@echo "## ================================================================" >  $@
	@echo "## NVDLA Open Source Project" >> $@
	@echo "## " >> $@
	@echo "## Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the" >> $@
	@echo "## NVDLA Open Hardware License; Check LICENSE which comes with     " >> $@
	@echo "## this distribution for more information. " >> $@
	@echo "## ================================================================" >> $@
	@echo "" >> $@ 	
	@echo "" >> $@ 	
	@echo "##======================= 										  " >> $@ 	
	@echo "## Project Name Setup, multiple projects supported			  	  " >> $@
	@echo "##======================= 										  " >> $@ 	
ifeq (1,$(USE_NV_ENV))
	@echo "PROJECTS := $(NV_PROJ)" 		>> $@
else 
ifeq (1,$(USE_VM_ENV))
	@echo "PROJECTS := $(VM_PROJ)" 		>> $@
else
	@read -p "Enter project names      (Press ENTER if use: $(NV_PROJ)):" opt; if [ "_$$opt" = "_" ]; then echo "PROJECTS := $(NV_PROJ)" >> $@;  else echo "PROJECTS := $$opt" >> $@; fi
endif
endif
	@echo "  																  " >> $@ 	
	@echo "##======================= 										  " >> $@ 	
	@echo "##Linux Environment Setup 										  " >> $@ 	
	@echo "##======================= 										  " >> $@ 	
	@echo "  																  " >> $@ 	
ifeq (1,$(USE_NV_ENV))
	@echo "USE_DESIGNWARE      := $(NV_USE_DESIGNWARE)" 		>> $@
	@echo "DESIGNWARE_DIR      := $(NV_DESIGNWARE_DIR)" 		>> $@
	@echo "CPP      := $(NV_CPP)" 		>> $@
	@echo "GCC      := $(NV_GCC)" 		>> $@
	@echo "CXX      := $(NV_CXX)" 		>> $@
	@echo "PERL     := $(NV_PERL)" 		>> $@
	@echo "JAVA     := $(NV_JAVA)" 		>> $@
	@echo "SYSTEMC  := $(NV_SYSTEMC)" 	>> $@
	@echo "PYTHON   := $(NV_PYTHON)" 	>> $@
	@echo "VERDI_HOME := $(NV_VERDI_HOME)" >> $@
	@echo "NOVAS_HOME := $(NV_NOVAS_HOME)" >> $@
	@echo "VCS_HOME   := $(NV_VCS_HOME)"   >> $@
	@echo "CLANG      := $(NV_CLANG)"      >> $@
	@echo "VERILATOR  := $(NV_VERILATOR)"  >> $@
else 
ifeq (1,$(USE_VM_ENV))
	@echo "USE_DESIGNWARE      := $(VM_USE_DESIGNWARE)" 		>> $@
	@echo "DESIGNWARE_DIR      := $(VM_DESIGNWARE_DIR)" 		>> $@
	@echo "CPP      := $(VM_CPP)" 		>> $@
	@echo "GCC      := $(VM_GCC)" 		>> $@
	@echo "CXX      := $(VM_CXX)" 		>> $@
	@echo "PERL     := $(VM_PERL)" 		>> $@
	@echo "JAVA     := $(VM_JAVA)" 		>> $@
	@echo "SYSTEMC  := $(VM_SYSTEMC)" 	>> $@
	@echo "PYTHON   := $(VM_PYTHON)" 	>> $@
	@echo "VERDI_HOME := $(VM_VERDI_HOME)" >> $@
	@echo "NOVAS_HOME := $(VM_NOVAS_HOME)" >> $@
	@echo "VCS_HOME   := $(VM_VCS_HOME)"   >> $@
	@echo "CLANG      := $(VM_CLANG)"      >> $@
	@echo "VERILATOR  := $(VM_VERILATOR)"  >> $@
else
	@read -p "Using designware or not [1 for use/0 for not use] (Press ENTER if use: $(NV_USE_DESIGNWARE)):" opt; if [ "_$$opt" = "_" ]; then echo "USE_DESIGNWARE  := $(NV_USE_DESIGNWARE)" >> $@;  else echo "USE_DESIGNWARE  := $$opt" >> $@; fi
	@read -p "Enter design ware path (Press ENTER if use: $(NV_DESIGNWARE_DIR)):" opt; if [ "_$$opt" = "_" ]; then echo "DESIGNWARE_DIR  := $(NV_DESIGNWARE_DIR)" >> $@;  else echo "DESIGNWARE_DIR  := $$opt" >> $@; fi
	@read -p "Enter c pre-processor path (Press ENTER if use: $(NV_CPP)):" opt; if [ "_$$opt" = "_" ]; then echo "CPP  := $(NV_CPP)" >> $@;  else echo "CPP  := $$opt" >> $@; fi
	@read -p "Enter gcc path             (Press ENTER if use: $(NV_GCC)):" opt; if [ "_$$opt" = "_" ]; then echo "GCC  := $(NV_GCC)" >> $@;  else echo "GCC  := $$opt" >> $@; fi
	@read -p "Enter g++ path             (Press ENTER if use: $(NV_CXX)):" opt; if [ "_$$opt" = "_" ]; then echo "CXX  := $(NV_CXX)" >> $@;  else echo "CXX  := $$opt" >> $@; fi
	@read -p "Enter perl path            (Press ENTER if use: $(NV_PERL)):" opt; if [ "_$$opt" = "_" ]; then echo "PERL := $(NV_PERL)" >> $@;  else echo "PERL := $$opt" >> $@; fi
	@read -p "Enter java path            (Press ENTER if use: $(NV_JAVA)):" opt; if [ "_$$opt" = "_" ]; then echo "JAVA := $(NV_JAVA)" >> $@;  else echo "JAVA := $$opt" >> $@; fi
	@read -p "Enter systemc path         (Press ENTER if use: $(NV_SYSTEMC)):" opt; if [ "_$$opt" = "_" ]; then echo "SYSTEMC := $(NV_SYSTEMC)" >> $@;  else echo "SYSTEMC := $$opt" >> $@; fi
	@read -p "Enter python path          (Press ENTER if use: $(NV_PYTHON)):" opt; if [ "_$$opt" = "_" ]; then echo "PYTHON := $(NV_PYTHON)" >> $@;  else echo "PYTHON := $$opt" >> $@; fi
	@read -p "Enter vcs_home path        (Press ENTER if use: $(NV_VCS_HOME)):" opt; if [ "_$$opt" = "_" ]; then echo "VCS_HOME := $(NV_VCS_HOME)" >> $@;  else echo "VCS_HOME := $$opt" >> $@; fi
	@read -p "Enter novas_home path      (Press ENTER if use: $(NV_NOVAS_HOME)):" opt; if [ "_$$opt" = "_" ]; then echo "NOVAS_HOME := $(NV_NOVAS_HOME)" >> $@;  else echo "NOVAS_HOME := $$opt" >> $@; fi
	@read -p "Enter verdi_home path      (Press ENTER if use: $(NV_VERDI_HOME)):" opt; if [ "_$$opt" = "_" ]; then echo "VERDI_HOME := $(NV_VERDI_HOME)" >> $@;  else echo "VERDI_HOME := $$opt" >> $@; fi
	@read -p "OPTIONAL: Enter verilator path (Press ENTER to use: $(NV_VERILATOR)):" opt_verilator; if [ "_$$opt_verilator" = "_" ]; then echo "VERILATOR := $(NV_VERILATOR)" >> $@;  else echo "VERILATOR := $$opt_verilator" >> $@; fi
	@read -p "OPTIONAL: Enter clang path     (Press ENTER to use: $(NV_CLANG)):" opt_clang; if [ "_$$opt_clang" = "_" ]; then echo "CLANG := $(NV_CLANG)" >> $@;  else echo "CLANG := $$opt_clang" >> $@; fi
endif
endif
	@echo "====================================================================="
	@echo "$@ is created successfully, and you can edit $@ manually if necessary"
	@echo "====================================================================="

$(TREE_MAKE): Makefile

CURRENT_DIR := $(shell pwd)
# ln -s /usr/bin/make /usr/bin/gmake

b_r:
	@echo "Current working directory: $(CURRENT_DIR)"
	export DESIGNWARE_HOME=/usr/synopsys/dc-L-2016.03-SP1/dw;export PYTHONPATH=$PYTHONPATH:$(CURRENT_DIR)/verif/tools/local_python_libs;python verif/regression/scripts/run_regression.py --project nv_small --kind sanity

r:
	@echo "Current working directory: $(CURRENT_DIR)"
	export DESIGNWARE_HOME=/usr/synopsys/dc-L-2016.03-SP1/dw;export PYTHONPATH=$PYTHONPATH:$(CURRENT_DIR)/verif/tools/local_python_libs;python verif/regression/scripts/run_regression.py --skip_build --project nv_small --kind sanity
	
r_all:
	@echo "Current working directory: $(CURRENT_DIR)"
	export DESIGNWARE_HOME=/usr/synopsys/dc-L-2016.03-SP1/dw;export PYTHONPATH=$PYTHONPATH:$(CURRENT_DIR)/verif/tools/local_python_libs;python verif/regression/scripts/run_regression.py --skip_build --project nv_small --kind all