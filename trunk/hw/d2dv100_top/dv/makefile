vcs:
	vcs -full64 -sverilog -f ./files.f +vcs+fsdbon

cmp:
	verilator --cc VC707_U500.v --top-module VC707BaseShell


verdi:
	verdi -f ./files.f -ssf ./novas.fsdb

clean:
	rm -rf AN.DB DVEfiles csrc simv.* *simv inter.vpd ucli.key *.log verdiLog nWaveLog
