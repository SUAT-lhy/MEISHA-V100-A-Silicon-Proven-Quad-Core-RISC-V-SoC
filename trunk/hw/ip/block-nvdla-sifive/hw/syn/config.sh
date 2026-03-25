# ===================================================================
# File: syn/templates/config.sh
# NVDLA Open Source Project
# Template configuration file for reference synthesis methodology
#
# Copyright (c) 2016 – 2017 NVIDIA Corporation. Licensed under the
# NVDLA Open Hardware License; see the "LICENSE.txt" file that came
# with this distribution for more information.
# ===================================================================
# ===========================
# DESIGN RELATED VARIABLES
# ===========================

export LIB_ROOT_PATH="/work"
pvt=ss0p99v125c
pvt_io=ss0p99v1p62v125c
track=I
lower_track=i
vt=L

export TOP_NAMES="NV_NVDLA_partition_a NV_NVDLA_partition_c NV_NVDLA_partition_o NV_NVDLA_partition_m NV_NVDLA_partition_p"
#export TOP_NAMES="nvdla_small"
export TOP_NAMES="NV_nvdla"


export TB_PATH="top.nvdla_top"
TOP_INSTS_NV_NVDLA_partition_a="u_partition_a"
TOP_INSTS_NV_NVDLA_partition_c="u_partition_c"
TOP_INSTS_NV_NVDLA_partition_o="u_partition_o"
TOP_INSTS_NV_NVDLA_partition_m="u_partition_ma u_partition_mb"
TOP_INSTS_NV_NVDLA_partition_p="u_partition_p"

export NVDLA_ROOT="..";

# Where do I find the RTL source verilog/system verilog files?
export RTL_SEARCH_PATH=" \
    $(ls -d ${NVDLA_ROOT}/outdir/${PROJECT}/vmod/nvdla/*) \
    ${NVDLA_ROOT}/outdir/${PROJECT}/vmod/rams/fpga/model \
    ${NVDLA_ROOT}/outdir/${PROJECT}/vmod/vlibs \
"
export RTL_SEARCH_PATH=" \
    $(ls -d ${LIB_ROOT_PATH}/svn/riscv/trunk/hw/ip/block-nvdla-sifive/vsrc/small/vmod/nvdla/*) \
    ${NVDLA_ROOT}/vsrc/small/vmod/rams/fpga/model \
    ${NVDLA_ROOT}/vsrc/small/vmod/vlibs \
    ${NVDLA_ROOT}/vsrc/small \
"
export RTL_SEARCH_PATH=" \
    $(ls -d ${LIB_ROOT_PATH}/svn/riscv/trunk/hw/ip/block-nvdla-sifive/vsrc/small/vmod/nvdla/*) \
    ${LIB_ROOT_PATH}/svn/riscv/trunk/hw/ip/block-nvdla-sifive/vsrc/ram_model_u40/output_verilog \
    ${NVDLA_ROOT}/vsrc/small/vmod/vlibs \
    ${NVDLA_ROOT}/vsrc/small \
"

# For verilog source files that do not match the module name. 
export EXTRA_RTL=" \
    ${NVDLA_ROOT}/outdir/${PROJECT}/vmod/nvdla/nocif/NV_NVDLA_XXIF_libs.v \
"

# If there are verilog header files, where do I find them?
export RTL_INCLUDE_SEARCH_PATH=" \
    ${NVDLA_ROOT}/outdir/${PROJECT}/vmod/include \
"

export RTL_INCLUDE_SEARCH_PATH=" \
    ${NVDLA_ROOT}/vsrc/small/vmod/include \
"

# File extensions for source files...
export RTL_EXTENSIONS=".v .sv .gv"
export RTL_INCLUDE_EXTENSIONS=".vh .svh"

# FLoorplans and constraints
export DEF="def"
export CONS="cons"

# Power related files
#export SAIF_FILE="$NVDLA_ROOT/outdir/nv_large/verif/synth_tb_sim/googlenet_conv2_3x3_int16/top0.snps.saif"
export SAIF_FILE=""

# ===========================
# TOOL RELATED VARIABLES
# ===========================


# Design Compiler Installation - Where do I find the dc_shell executable
export DC_PATH="/usr/synopsys/dc-L-2016.03-SP1/amd64/syn/bin"
export PT_PATH="/usr/synopsys/pt-M-2016.12-SP1/amd64/syn/bin"


# ===========================
# LIBRARY RELATED VARIABLES
# ===========================

#export RELEASE_DIR="/home/libs/t194_syn/11399272_08212017"
#export RAM_LIB_DIR="../tools/data"
#export TARGET_LIB="${RELEASE_DIR}/std_cell/nvstd/syn.A01/nvstd_stdcell_tsmc16ff_t9_po4svt_std_ssg_0c_0p72v.db"

#${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SHLB40_8192X8X8CM8_lib/SYLB40_64X21X4CM2_${pvt}.db

export TARGET_LIB="\
    ${LIB_ROOT_PATH}/umc40/wnsmd/std_cel_io/FSHOL_${track}LS/ftclib/liberty/ccsn/fsh0l_${lower_track}ls/prim/fsh0l_${lower_track}ls_core_${pvt}.ccsndb \
    ${LIB_ROOT_PATH}/umc40/wnsmd/std_cel_io/FSHOL_${track}HS/ftclib/liberty/ccsn/fsh0l_${lower_track}hs/prim/fsh0l_${lower_track}hs_core_${pvt}.ccsndb \
    ${LIB_ROOT_PATH}/umc40/wnsmd/std_cel_io/FSHOL_${track}RS/ftclib/liberty/ccsn/fsh0l_${lower_track}rs/prim/fsh0l_${lower_track}rs_core_${pvt}.ccsndb \
    ${LIB_ROOT_PATH}/umc40/wnsmd/std_cel_io/FOH0L_QRS25/ftclib/liberty/nldm_io/foh0l_qrs25/prim/foh0l_qrs25_io_${pvt_io}.db \
    ${LIB_ROOT_PATH}/svn/riscv/trunk/hw/ip/INNO_PKG_PLL_PRJ2410CCI1_S2410_UMC40LP_V2P0_R20241106/FRONTEND/LIB/db/INNO_FNPLL_TOP_ss_cmin_125.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SHLB40_8192X8X8CM8_lib/SHLB40_8192X8X8CM8_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SHLVTLB40_8192X8X8CM8b1_lib/SHLVTLB40_8192X8X8CM8b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SJLA40_512X32X1CM4_lib/SJLA40_512X32X1CM4_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SJLA40_8192X8X8CM8_lib/SJLA40_8192X8X8CM8_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SPLB40_2048X32BM1A_lib/SPLB40_2048X32BM1A_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SPLB40_2048X32BM1b1A_lib/SPLB40_2048X32BM1b1A_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SQLVTLG40_256X8X4CM2b1_lib/SQLVTLG40_256X8X4CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SQLVTLG40_256X8X8CM2b1_lib/SQLVTLG40_256X8X8CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SQLVTLG40_512X32X4CM2b1_lib/SQLVTLG40_512X32X4CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SQLVTLG40_512X8X4CM4b1_lib/SQLVTLG40_512X8X4CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SQLVTLG40_512X8X8CM4b1_lib/SQLVTLG40_512X8X8CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SQLVTLG40_64X21X4CM2b1_lib/SQLVTLG40_64X21X4CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_256X32X4CM2b1_lib/SYLB40_256X32X4CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_256X8X4CM4_lib/SYLB40_256X8X4CM4_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_256X8X8CM2_lib/SYLB40_256X8X8CM2_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_512X32X4CM2b1_lib/SYLB40_512X32X4CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_512X8X4CM4_lib/SYLB40_512X8X4CM4_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_512X8X8CM4_lib/SYLB40_512X8X8CM4_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_64X21X4CM2_lib/SYLB40_64X21X4CM2_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_64X22X4CM2_lib/SYLB40_64X22X4CM2_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLB40_512X8X4CM4_lib/SZLB40_512X8X4CM4_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_128X256X1CM1b1_lib/SZLVTLB40_128X256X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_128X258X1CM1b1_lib/SZLVTLB40_128X258X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_160X258X1CM1b1_lib/SZLVTLB40_160X258X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_16X128X1CM1b1_lib/SZLVTLB40_16X128X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_16X256X1CM1b1_lib/SZLVTLB40_16X256X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_16X272X1CM1b1_lib/SZLVTLB40_16X272X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_16X64X1CM1b1_lib/SZLVTLB40_16X64X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_16X66X1CM1b1_lib/SZLVTLB40_16X66X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_20X146X1CM1b1_lib/SZLVTLB40_20X146X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_20X80X1CM1b1_lib/SZLVTLB40_20X80X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_248X258X1CM1b1_lib/SZLVTLB40_248X258X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_256X256X1CM1b1_lib/SZLVTLB40_256X256X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_256X258X1CM1b1_lib/SZLVTLB40_256X258X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_32X128X1CM1b1_lib/SZLVTLB40_32X128X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_32X130X1CM1b1_lib/SZLVTLB40_32X130X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_32X256X1CM1b1_lib/SZLVTLB40_32X256X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_32X272X1CM1b1_lib/SZLVTLB40_32X272X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_32X64X1CM1b1_lib/SZLVTLB40_32X64X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_4X128X1CM1b1_lib/SZLVTLB40_4X128X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_4X64X1CM1b1_lib/SZLVTLB40_4X64X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_60X168X1CM1b1_lib/SZLVTLB40_60X168X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_60X84X1CM1b1_lib/SZLVTLB40_60X84X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_64X116X1CM1b1_lib/SZLVTLB40_64X116X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_64X128X1CM1b1_lib/SZLVTLB40_64X128X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_64X130X1CM1b1_lib/SZLVTLB40_64X130X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_64X256X1CM1b1_lib/SZLVTLB40_64X256X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_64X258X1CM1b1_lib/SZLVTLB40_64X258X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_64X272X1CM1b1_lib/SZLVTLB40_64X272X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_64X64X1CM1b1_lib/SZLVTLB40_64X64X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_64X66X1CM1b1_lib/SZLVTLB40_64X66X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_80X256X1CM1b1_lib/SZLVTLB40_80X256X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_80X258X1CM1b1_lib/SZLVTLB40_80X258X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_8X130X1CM1b1_lib/SZLVTLB40_8X130X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_8X258X1CM1b1_lib/SZLVTLB40_8X258X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLB40_8X66X1CM1b1_lib/SZLVTLB40_8X66X1CM1b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_128X11X1CM4b1_lib/SZLVTLL40_128X11X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_128X128X1CM2b1_lib/SZLVTLL40_128X128X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_128X18X1CM2b1_lib/SZLVTLL40_128X18X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_128X32X1CM2b1_lib/SZLVTLL40_128X32X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_128X60X1CM2b1_lib/SZLVTLL40_128X60X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_128X64X1CM2b1_lib/SZLVTLL40_128X64X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_128X6X1CM4b1_lib/SZLVTLL40_128X6X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_160X16X1CM4b1_lib/SZLVTLL40_160X16X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_160X65X1CM2b1_lib/SZLVTLL40_160X65X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_16X14X1CM2b1_lib/SZLVTLL40_16X14X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_16X16X1CM2b1_lib/SZLVTLL40_16X16X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_24X16X1CM2b1_lib/SZLVTLL40_24X16X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_24X32X1CM2b1_lib/SZLVTLL40_24X32X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_24X4X1CM2b1_lib/SZLVTLL40_24X4X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_24X8X1CM2b1_lib/SZLVTLL40_24X8X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_256X11X1CM4b1_lib/SZLVTLL40_256X11X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_256X128X1CM2b1_lib/SZLVTLL40_256X128X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_256X14X1CM4b1_lib/SZLVTLL40_256X14X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_256X16X1CM4b1_lib/SZLVTLL40_256X16X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_256X3X1CM8b1_lib/SZLVTLL40_256X3X1CM8b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_256X64X1CM2b1_lib/SZLVTLL40_256X64X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_256X7X1CM4b1_lib/SZLVTLL40_256X7X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_256X8X1CM4b1_lib/SZLVTLL40_256X8X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_32X16X1CM2b1_lib/SZLVTLL40_32X16X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_32X32X1CM2b1_lib/SZLVTLL40_32X32X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_512X128X1CM2b1_lib/SZLVTLL40_512X128X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_512X64X1CM2b1_lib/SZLVTLL40_512X64X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_64X10X1CM4b1_lib/SZLVTLL40_64X10X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_64X14X1CM4b1_lib/SZLVTLL40_64X14X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_64X16X1CM4b1_lib/SZLVTLL40_64X16X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_64X18X1CM4b1_lib/SZLVTLL40_64X18X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_64X21X1CM4b1_lib/SZLVTLL40_64X21X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_64X32X1CM2b1_lib/SZLVTLL40_64X32X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_64X42X1CM2b1_lib/SZLVTLL40_64X42X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_80X14X1CM4b1_lib/SZLVTLL40_80X14X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_80X15X1CM4b1_lib/SZLVTLL40_80X15X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_80X16X1CM4b1_lib/SZLVTLL40_80X16X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_80X17X1CM4b1_lib/SZLVTLL40_80X17X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_80X18X1CM4b1_lib/SZLVTLL40_80X18X1CM4b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_80X36X1CM2b1_lib/SZLVTLL40_80X36X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_80X65X1CM2b1_lib/SZLVTLL40_80X65X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_80X72X1CM2b1_lib/SZLVTLL40_80X72X1CM2b1_${pvt}.db \
${LIB_ROOT_PATH}/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLVTLL40_80X9X1CM4b1_lib/SZLVTLL40_80X9X1CM4b1_${pvt}.db \
    ${DC_PATH}/../../../libraries/syn/dw_foundation.sldb \
    ${DC_PATH}/../../../libraries/syn/standard.sldb \
"

# export LINK_LIB_T16="\
#     ${RELEASE_DIR}/std_cell/nvstd/syn.A01/nvstd_stdcell_tsmc16ff_t9_po4svt_std_ssg_0c_0p72v.db \
#     ${RELEASE_DIR}/std_cell/nvstd/syn.A01/nvstd_stdcell_tsmc16ff_t9_hvt_std_ssg_0c_0p72v.db \
#     ${RELEASE_DIR}/std_cell/nvstd/syn.A01/nvstd_stdcell_tsmc16ff_t9_svt_std_ssg_0c_0p72v.db \
#     ${RELEASE_DIR}/std_cell/nvidia/syn.A01/nvidia_stdcell_tsmc16ff_t9_sup_std_ssg_0c_0p72v.db \
#     ${RELEASE_DIR}/std_cell/nvidia/syn.A01/nvidia_stdcell_tsmc16ff_t9_po4svt_std_ssg_0c_0p72v.db \
#     ${RELEASE_DIR}/std_cell/nvidia/syn.A01/nvidia_stdcell_tsmc16ff_t9_svt_std_ssg_0c_0p72v.db \
#     ${RAM_LIB_DIR}/nvgen_rams_tsmc16ff_cust_mixvt_std_ssg_0c_0p72v0p72v.db \
#     ${DC_PATH}/../libraries/syn/dw_foundation.sldb \
#     ${DC_PATH}/../libraries/syn/standard.sldb \
# "
export LINK_LIB=${TARGET_LIB}


export MW_LIB="\
    ${RELEASE_DIR}/std_cell/nvstd/apollo.A01/nvstd_stdcell_tsmc16ff_t9_po4svt_std \
    ${RELEASE_DIR}/std_cell/nvstd/apollo.A01/nvstd_stdcell_tsmc16ff_t9_hvt_std \
    ${RELEASE_DIR}/std_cell/nvstd/apollo.A01/nvstd_stdcell_tsmc16ff_t9_svt_std \
    ${RELEASE_DIR}/std_cell/nvidia/apollo.A01/nvidia_stdcell_tsmc16ff_t9_sup_std \
    ${RELEASE_DIR}/std_cell/nvidia/apollo.A01/nvidia_stdcell_tsmc16ff_t9_po4svt_std \
    ${RELEASE_DIR}/std_cell/nvidia/apollo.A01/nvidia_stdcell_tsmc16ff_t9_svt_std \
    ${RAM_LIB_DIR}/nvgen_rams_tsmc16ff_cust_mixvt_std \
"

export TF_FILE="${RELEASE_DIR}/tech.A01/astro/v1d0_1e/N16_ICC_14M_4Xa1Xd6Xe2Z_UTRDL_1.0_1e.tf_vhv.20160404.production.pnr"
export TLUPLUS_FILE="${RELEASE_DIR}/tech.A01/star/plusv1d0p2/cln16ff+_1p14m_4xa1xd6xe2z_mim_ut-alrdl_typical.tluplus"
export TLUPLUS_MAPPING_FILE="${RELEASE_DIR}/tech.A01/star/mapping/cln16ff_14m_1x4xa1xd6xe2vm_tluplus.mapping"
export MIN_ROUTING_LAYER="M2A"
export MAX_ROUTING_LAYER="M12E"
export HORIZONTAL_LAYERS="M2A M4A M6D M8E M10E M12E VM1 RDL"
export VERTICAL_LAYERS="M1 M3A M5A M7E M9E M11E VM2 UBM"
export WIRELOAD_MODEL_NAME="" # set_wire_load_model
export WIRELOAD_MODEL_FILE=""
export DONT_USE_LIST="BUF*X1 INV*X1 INV*X0P BUF*X0P"


# ==========================
# MISCELLANEOUS VARIABLES 
#===========================
# Set host options in the DC session. 
export DC_NUM_CORES="1"

# Apply constraints to tighten CG enable paths to model post-CTS insertion delays
export TIGHTEN_CGE="1"

# Enable Area recovery (run optimize_netlist -area)
export AREA_RECOVERY="1"

# Number of incremental recompile loops
export INCREMENTAL_RECOMPILE_COUNT="2"

# For Job management
export COMMAND_PREFIX="qsub -q o_timing_cpu_32G -app syn -n 4 -R span[hosts=1] -oo <LOG>/<MODULE>.lsf.log -N "
export COMMAND_PREFIX=""
export PTPX_COMMAND_PREFIX="qsub -q o_timing_cpu_32G -app timing -n 2 -R span[hosts=1] -oo <LOG>/<MODULE>.ptpxb.log -N "

export CGLUT_FILE="$NVDLA_ROOT/templates/cg_latency_lut.tcl"
