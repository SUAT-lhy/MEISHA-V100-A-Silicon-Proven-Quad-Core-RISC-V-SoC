
read_file -type gateslib /work/umc40/wnsmd/std_cel_io/FOH0L_QRS25/ftclib/liberty/nldm_io/foh0l_qrs25/src/foh0l_qrs25_io_tt1p1v3p3v25c.lib

read_file -type gateslib  /work/umc40/wnsmd/std_cel_io/FSHOL_YHS/ftclib/liberty/ccsn/fsh0l_yhs/src/fsh0l_yhs_core_tt1p1v25c.ccsnlib
read_file -type gateslib  /work/umc40/wnsmd/std_cel_io/FSHOL_YRS/ftclib/liberty/ccsn/fsh0l_yrs/src/fsh0l_yrs_core_tt1p1v25c.ccsnlib
read_file -type gateslib  /work/umc40/wnsmd/std_cel_io/FSHOL_YLS/ftclib/liberty/ccsn/fsh0l_yls/src/fsh0l_yls_core_tt1p1v25c.ccsnlib


read_file -type gateslib  /work/umc40/wnsmd/std_cel_io/FSHOL_IHS/ftclib/liberty/ccsn/fsh0l_ihs/src/fsh0l_ihs_core_tt1p1v25c.ccsnlib
read_file -type gateslib  /work/umc40/wnsmd/std_cel_io/FSHOL_IRS/ftclib/liberty/ccsn/fsh0l_irs/src/fsh0l_irs_core_tt1p1v25c.ccsnlib
read_file -type gateslib  /work/umc40/wnsmd/std_cel_io/FSHOL_ILS/ftclib/liberty/ccsn/fsh0l_ils/src/fsh0l_ils_core_tt1p1v25c.ccsnlib

read_file -type gateslib  /work/svn/riscv/trunk/backend/foundry/u40lp/memory/SJLA40_8192X8X8CM8_lib/SJLA40_8192X8X8CM8_tt1p1v25c.lib
read_file -type gateslib  /work/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_512X8X8CM4_lib/SYLB40_512X8X8CM4_tt1p1v25c.lib
read_file -type gateslib  /work/svn/riscv/trunk/backend/foundry/u40lp/memory/SZLB40_512X8X4CM4_lib/SZLB40_512X8X4CM4_tt1p1v25c.lib
read_file -type gateslib  /work/svn/riscv/trunk/backend/foundry/u40lp/memory/SPLB40_2048X32BM1A_lib/SPLB40_2048X32BM1A_tt1p1v25c.lib
read_file -type gateslib  /work/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_512X32X4CM2b1_lib/SYLB40_512X32X4CM2b1_tt1p1v25c.lib
read_file -type gateslib  /work/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_256X32X4CM2b1_lib/SYLB40_256X32X4CM2b1_tt1p1v25c.lib
read_file -type gateslib  /work/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_64X21X4CM2_lib/SYLB40_64X21X4CM2_tt1p1v25c.lib
read_file -type gateslib  /work/svn/riscv/trunk/backend/foundry/u40lp/memory/SYLB40_64X22X4CM2_lib/SYLB40_64X22X4CM2_tt1p1v25c.lib
read_file -type gateslib  /work/svn/riscv/trunk/backend/foundry/u40lp/memory/SHLB40_8192X8X8CM8_lib/SHLB40_8192X8X8CM8_tt1p1v25c.lib

read_file -type gateslib  /work/svn/riscv/trunk/backend/foundry/u40lp/memory/SQLVTLG40_512X8X8CM4b1_lib/SQLVTLG40_512X8X8CM4b1_tt1p1v25c.lib
read_file -type gateslib  /work/svn/riscv/trunk/backend/foundry/u40lp/memory/SQLVTLG40_64X21X4CM2b1_lib/SQLVTLG40_64X21X4CM2b1_tt1p1v25c.lib
read_file -type gateslib  /work/svn/riscv/trunk/backend/foundry/u40lp/memory/SHLVTLB40_8192X8X8CM8b1_lib/SHLVTLB40_8192X8X8CM8b1_tt1p1v25c.lib

read_file -type sourcelist  /work/svn/riscv/trunk/hw/d2dv100_top/rtl/soc_iram.lst
read_file -type sourcelist  /work/svn/riscv/trunk/hw/d2dv100_top/rtl/nvdla.lst
read_file -type sourcelist  /work/svn/riscv/trunk/hw/d2dv100_top/rtl/top/RocketTile.lst
read_file -type sourcelist  /work/svn/riscv/trunk/hw/d2dv100_top/rtl/meishav100_top.lst


set_option enableSV09 yes
set_option designread_enable_synthesis yes
set_option designread_synthesis_mode base

set_option top MEISHAV100_TOP

set goal_arrays "lint/lint_rtl lint/lint_rtl lint/lint_functional_rtl lint/lint_abstract cdc/cdc_setup_check cdc/clock_reset_integrity cdc/cdc_verify_struct cdc/cdc_verify cdc/cdc_abstract cdc/cdc_verify_jitter cdc/ rdc/rdc_verify_struct"


foreach goal $goal_arrays {
  current_goal $goal -top MEISHAV100_TOP
  run_goal
}

write_aggregate_report datasheet
 
write_aggregate_report dashboard

# compile_design
# source ../hw/d2dv100_top/spyglass_run.tcl
