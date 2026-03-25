-- simulate the design
-- !!CHANGE THE PATH POINTING TO YOUR SDF FILE!!
vsim -L ovi_ecp3 -L pcsd_work -PL pmi_work +access +r SD_CONTROLLER_TOP_TB -noglitch +no_tchk_msg -sdfmax sd_controller_top_0="./RD1088_rev01/Project/test/test_test_vo.sdf"
add wave *
run 500 us
