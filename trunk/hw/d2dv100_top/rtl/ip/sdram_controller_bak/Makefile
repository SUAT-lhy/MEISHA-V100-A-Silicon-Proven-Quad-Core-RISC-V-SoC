run:
	vcs -xlrm uniq_prior_final -CFLAGS --std=c++11 -LDFLAGS -Wl,--no-as-needed -sverilog -full64 -debug_all -R -lca -timescale=1ns/1ps bridge_64to32.sv cbb_fifo.sv fifo.sv tb_bridge_64to32.sv -o simv -l vcs.log -top tb_sram_bridge_64to32
xrun:
	xrun -access +rwc -64bit -timescale 1ns/1ps bridge_64to32.sv cbb_fifo.sv fifo.sv tb_bridge_64to32.sv -l xrun.log -top tb_sram_bridge_64to32
clean:
	rm -fr simv.daidir vfastLog nWaveLog csrc novas*