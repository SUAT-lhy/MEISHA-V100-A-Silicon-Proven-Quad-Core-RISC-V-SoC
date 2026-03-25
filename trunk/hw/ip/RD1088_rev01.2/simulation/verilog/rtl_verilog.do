-- Simulate the design
asim -L ovi_ecp3 -L pcsd_work -PL pmi_work +access +r SD_CONTROLLER_TOP_TB
add wave *
run 500 us
