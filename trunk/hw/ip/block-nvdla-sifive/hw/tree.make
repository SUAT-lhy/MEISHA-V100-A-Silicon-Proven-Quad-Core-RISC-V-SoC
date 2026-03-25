## ================================================================
## NVDLA Open Source Project
## 
## Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
## NVDLA Open Hardware License; Check LICENSE which comes with     
## this distribution for more information. 
## ================================================================


##======================= 										  
## Project Name Setup, multiple projects supported			  	  
##======================= 										  
PROJECTS := nv_small nv_small_256 nv_small_256_full nv_medium_512 nv_medium_1024_full nv_large
  																  
##======================= 										  
##Linux Environment Setup 										  
##======================= 										  
  																  
USE_DESIGNWARE      := 1
DESIGNWARE_DIR      := /usr/synopsys/dc-L-2016.03-SP1/dw/sim_ver
CPP      := /usr/bin/cpp-4.8
GCC      := /usr/bin/gcc-4.8
CXX      := /usr/bin/g++-4.8
PERL     := /usr/bin/perl
JAVA     := /usr/synopsys/verdi-L-2016.06-1/bin/java
SYSTEMC  := /work/install/systemc-2.3.4
PYTHON   := /usr/bin/python
VERDI_HOME := /usr/synopsys/verdi-L-2016.06-1
NOVAS_HOME := /usr/synopsys/verdi-L-2016.06-1
VCS_HOME   := /usr/synopsys/vcs-L-2016.06
CLANG      := /usr/bin/clang
VERILATOR  := verilator
