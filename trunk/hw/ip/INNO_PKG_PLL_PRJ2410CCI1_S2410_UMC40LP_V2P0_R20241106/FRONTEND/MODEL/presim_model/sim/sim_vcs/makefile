# vcs sim
vcs:
	vcs 	-P \
			$(DEBUSSY_HOME)/share/PLI/VCS/LINUX64/novas.tab \
	    	$(DEBUSSY_HOME)/share/PLI/VCS/LINUX64/pli.a \
	    	+notimingcheck \
	    	-full64 \
	    	-R \
	    	-Mupdate=1 \
			-sverilog \
	    	-l test.log \
	    	-file ./filelist_parameter_define \
	    	+vpi \
			+debug_all \
			+cli+4 \
			+v2k \
			-override_timescale=1ns/1fs \
			&



# verdi debug
verdi:
	verdi 	-sv \
			-file ./filelist_parameter_define \
			-ssf *.fsdb \
			-rcFile ~/.novas.rc \
			&


# delete all data file
clean:
	rm -rf 	simv*  log* novas* \
			ucli.key verdiLog \
			*fsdb* *.vf  *.log \
			core* test.sim_command \
			csrc .diagnose.oneSearch \
			*.dat dsi_display_in.v \
			*.txt \
			DebussyLog *nLint*
