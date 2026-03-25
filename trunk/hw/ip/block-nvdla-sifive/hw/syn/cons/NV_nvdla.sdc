# ===================================================================
# File: syn/cons/NV_NVDLA_partition_o.sdc
# NVDLA Open Source Project
#
# Copyright (c) 2016 – 2017 NVIDIA Corporation. Licensed under the
# NVDLA Open Hardware License; see the "LICENSE.txt" file that came
# with this distribution for more information.
# ===================================================================

set_max_area 0
set_ideal_network [get_ports test_mode]
set_ideal_network [get_ports direct_reset_]
set_ideal_network [get_ports dla_reset_rstn]
set_ideal_network [get_ports dla_core_clk]
set_ideal_network [get_ports dla_csb_clk]
set_ideal_network -no_propagate [get_nets nvdla_core_rstn]
create_clock -name dla_core_clk [get_ports dla_core_clk]  -period 4 
set_clock_transition -max -rise 0.05 [get_clocks dla_core_clk]
set_clock_transition -max -fall 0.05 [get_clocks dla_core_clk]
set_clock_transition -min -rise 0.05 [get_clocks dla_core_clk]
set_clock_transition -min -fall 0.05 [get_clocks dla_core_clk]
create_clock -name dla_csb_clk [get_ports dla_csb_clk]  -period 8
set_clock_transition -max -rise 0.05 [get_clocks dla_csb_clk]
set_clock_transition -max -fall 0.05 [get_clocks dla_csb_clk]
set_clock_transition -min -rise 0.05 [get_clocks dla_csb_clk]
set_clock_transition -min -fall 0.05 [get_clocks dla_csb_clk]
set_false_path   -from [get_ports direct_reset_]
set_false_path   -from [get_ports test_mode]
set_false_path   -from [get_ports tmc2slcg_disable_clock_gating]
set_false_path   -from [get_ports global_clk_ovr_on]
set_false_path   -from [get_clocks dla_core_clk] -to [get_clocks dla_csb_clk]
set_false_path   -from [get_clocks dla_csb_clk] -to [get_clocks dla_core_clk]



set inst_arrays "u_partition_o/u_NV_NVDLA_cdp/u_slcg_core/nvdla_core_clk_slcg_0/p_clkgate_dont_touch/u_dont_touch_tc_clk_gating/Q u_partition_o/u_NV_NVDLA_pdp/u_rdma/u_slcg/nvdla_core_clk_slcg_0/p_clkgate_dont_touch/u_dont_touch_tc_clk_gating/Q"

foreach inst $inst_arrays {
  set_ideal_network -no_propagate [get_nets -of_objects [get_pins ${inst}]] 
  #set_dont_touch_network -no_propagate [get_nets -of_objects [get_pins ${inst}]] 
}

set_dont_touch [find design *dont_touch*]
set_dont_touch [get_cells *dont_touch*]
