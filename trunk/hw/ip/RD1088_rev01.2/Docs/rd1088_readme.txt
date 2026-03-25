	SD_CARD_CONTROLLER Reference Design
===============================================================================
 
1. RD1088/docs/sd_card_controller.pdf                 			--> Design document
   RD1088/docs/sd_card_controller_readme.txt          			--> Read me file (this file)
   
2. RD1088/Project/SD_controller_top_tb.udo_example          --> vital glitch removal example
   RD1088/project/sd_card_controller.lpf                    --> preference file   
   
3. RD1088/Source/Verilog/SD_controller_top.v                --> Source file
   RD1088/Source/Verilog/SD_Bd.v                            --> Source file
   RD1088/Source/Verilog/SD_cmd_master.v                    --> Source file
   RD1088/Source/Verilog/SD_cmd_serial_host.v               --> Source file
   RD1088/Source/Verilog/SD_controller_wb.v                 --> Source file
   RD1088/Source/Verilog/SD_crc_7.v                         --> Source file
   RD1088/Source/Verilog/SD_crc_16.v                        --> Source file
   RD1088/Source/Verilog/SD_data_host.v                     --> Source file
   RD1088/Source/Verilog/SD_data_master.v                   --> Source file
   RD1088/Source/Verilog/SD_defines.v                       --> Parameter file
   RD1088/Source/Verilog/SD_FIFO_RX_Filler.v                --> Source file
   RD1088/Source/Verilog/SD_FIFO_TX_Filler.v                --> Source file
   RD1088/Source/Verilog/smii_rx_fifo.v                     --> Source file
   RD1088/Source/Verilog/smii_tx_fifo.v                     --> Source file

4. RD1088/Testbench/verilog/SD_controller_top_tb.v          --> Testbench for simulation
   RD1088/Testbench/verilog/sdModel.v                       --> SD card behavioral model
   RD1088/Testbench/verilog/wb_bus_mon.v                    --> Wishbone master model
   RD1088/Testbench/verilog/wb_master32.v                   --> Testbench for simulation
   RD1088/Testbench/verilog/wb_master_behavioral.v          --> SD card behavioral model
   RD1088/Testbench/verilog/wb_model_defines.v              --> Wishbone master model 
   RD1088/Testbench/verilog/wb_slave_behavioral.v           --> Wishbone master model 
   RD1088/Testbench/verilog/FLASH.txt                       --> initialization file
   RD1088/Testbench/verilog/wb_memory.txt                   --> initialization file
   
   RD1088/Testbench/verilog/log/eth_tb_host.log             --> log file,record eth_tb_host information
   RD1088/Testbench/verilog/log/eth_tb_phy.log    	    --> log file,record	eth_tb_phy information
   RD1088/Testbench/verilog/log/eth_tb_wb_m_mon.log   	    --> log file,record eth_tb_wb_m_mon information
   RD1088/Testbench/verilog/log/eth_tb_wb_s_mon.log   	    --> log file,record eth_tb_wb_s_mon information
   RD1088/Testbench/verilog/log/sd_model.log   		    --> log file,record sd_model information
   RD1088/Testbench/verilog/log/sd_tb_memory.log	    --> log file,record sd_tb_memory information
   RD1088/Testbench/verilog/log/sdc_tb.log		    --> log file,record sd testbench information	 
   
===================================================================================================  
!!IMPORTANT NOTES:!!
1. Unzip the RD1088_revyy.y.zip file using the existing folder names, where yy.y is the current
   version of the zip file
2. Must copy the file, FLASH.txt,wb_memory.txt,eth_tb_host.log,eth_tb_phy.log,eth_tb_wb_m_mon.log,
   eth_tb_wb_s_mon.log,sd_model.log,sd_tb_memory.log and sdc_tb.log to the local directories for 
   successful simulation
3. If there is lpf file or lci file available for the reference design:
	3.1 use Constraint Files >> Add >> Exiting File to import the lpf to Diamond project and set it to be active,
	 
4. If there is sty file (strategy file for Diamond) available for the design, go to File List tab on the left 
   side of the GUI. Right click on Strategies >> Add >> Existing File. Then right click on the imported file 
   name and select "Set as Active Strategy".

---------------------------------------------------------------------------------------------------

===================================================================================================  
Using Diamond Software
---------------------------------------------------------------------------------------------------  
HOW TO CREATE A PROJECT IN DIAMOND:
1. Launch Diamond software, in the GUI, select File >> New Project, click Next
2. In the New Project popup, select the Project location and provide a Project name and implementation 
   name, click Next.
3. Add the necessary source files from the RD1088\source directory, click Next
4. Select the desired part and speedgrade. You may use RD1088.pdf to see which device and speedgrade 
   can be selected to achieve the published timing result 
5. Click Finish. Now the project is successfully created. 
6. MAKE SURE the provided lpf and/or sty files are used in the current directory. 
      
----------------------------------------------------------------------------------------------------      
HOW TO RUN SIMULATION UNDER DIAMOND:
0. Make sure the FLASH.txt,wb_memory.txt,eth_tb_host.log,eth_tb_phy.log,eth_tb_wb_m_mon.log,
   eth_tb_wb_s_mon.log,sd_model.log,sd_tb_memory.log and sdc_tb.log is in the same directory as the project file (.ldf)
1. Bring up the Simulation Wizard under the Tools menu 
2. Next provide a name for simulation project, and select RTL or post-route simulation
	2.1 For post-route simulation, must export verilog simulation file after Place and Route
3. Next add the test bench files form the RD1088\TestBench directory 
4. Next click Finish, this will bring up the Aldec simulator automatically
5. In Aldec environment, you can manually activate the simulation or you can use a script
	5.1 Use the provided script in the RD1088\Simulation\<language> directory
	  a. For functional simulation, change the library name to the device family
	  	i) MachXO2: ovi_machxo2 for verilog
	  	ii) MachXO: ovi_machxo for verilog
	  	iii)XP2: ovi_xp2 for verilog
                iv) ECP3:ovi_ecp3 for verilog
		b. For POST-ROUTE simulation, open the script and change the following:
			i) The sdf file name and the path pointing to your sdf file.
		   The path usually looks like "./<implementation_name>/<sdf_file_name>.sdf"
		  ii) Change the library name using the library name described above
		c. Click Tools > Execute Macro and select the xxx.do file to run the simulation
		d. This will run the simulation until finish
	5.2 Manually activate the simulation
		a. Click Simulation > Initialize Simulation
		b. Click File > New > Waveform, this will bring up the Waveform panel
		c. Click on the top-level testbench, drag all the signals into the Waveform panel
		d. At the Console panel, type "run 500us" 
		e. For timing simulation, you must manually add 
		   -sdfmax sd_controller_top_0="../test/test_test_vo.sdf"(i.e. location of your sdf file)
		   into the asim or vsim command. Use the command in timing_xxx.do as an example
  
