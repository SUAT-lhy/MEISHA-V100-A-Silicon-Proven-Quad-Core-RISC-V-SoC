#export PWD=$(shell pwd)
export REPO_TOP=$(PWD)

VCS_EXE_FILE=$(shell which vcs)
VERDI_EXE_FILE=$(shell which verdi)

export SHLVL=2
export SIMULATOR=vcs
export SYNOPSYS=$(dir $(VCS_EXE_FILE))/../../
export TB_TOP=tb
export TERM=xterm
export TOOLCHAIN_PATH=/tools/riscv
export VCS_ARCH_OVERRIDE=linux
export VCS_HOME=$(dir $(VCS_EXE_FILE))/../
export VCS_LICENSE_WAIT=1
export VCS_LIC_EXPIRE_WARNING=1
export VCS_TARGET_ARCH=amd64
export VERDI_HOME=$(dir $(VERDI_EXE_FILE))/../
export VERIBLE_VERSION=v0.0-1213-g9e5c085
export GIT_VERSION=new_soc
export dv_root=$(proj_root)/hw/dv

ifeq ($(wave),)
	wave = fsdb
endif


export WAVES=$(wave)
export WAVE_FILE_NAME=$(wave_file_name)
export dut_instance=tb.dut
export _=./util/dvsim/dvsim.py
