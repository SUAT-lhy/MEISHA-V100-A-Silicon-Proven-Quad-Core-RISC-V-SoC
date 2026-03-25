// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: axi_base_scoreboard 
// Date Created: 2022.04.26 
// Version		: V1.0
// -------------------------------------------------------------------------------------------------
// File description	:
// -------------------------------------------------------------------------------------------------
// Revision History :
// *************************************************************************************************

//--------------------------------------------------------------------------------------------------
// module declaration
//--------------------------------------------------------------------------------------------------
typedef bit [top_pkg::MAX_ID_WIDTH-1:0] id_type;

class axi_base_scoreboard extends cip_base_pkg::cip_base_scoreboard #(.CFG_T(axi_base_env_cfg),
                                                              .RAL_T(axi_base_reg_block),
                                                              .COV_T(axi_base_env_cov));

    memory_map_info_pkg::memory_map_info mem_map_info;
    
    // Variables
    
    axi_transaction expect_queue_write[string][id_type][$];
    axi_transaction actual_queue_write[string][id_type][$];
    axi_transaction expect_queue_read[string][id_type][$];
    axi_transaction actual_queue_read[string][id_type][$];
    semaphore sem[string];
    bit [1:0] w_rcvd, r_rcvd;
    int passCnt, failCnt;
    
    

    `uvm_component_utils(axi_base_scoreboard)
    //----------------------------------------------------------------------------------------------
    // Parameter Define
    //----------------------------------------------------------------------------------------------

    // Constructor: new
    function new(string name, uvm_component parent);
        super.new(name, parent);
        mem_map_info = memory_map_info_pkg::memory_map_info::type_id::create("mem_map_info");
        `uvm_info(get_type_name(), $sformatf("create axi_base_scoreboard instance %s", name), UVM_DEBUG);
        sem["expect_queue_write"] = new(1);
        sem["expect_queue_read"] = new(1);
        sem["actual_queue_write"] = new(1);
        sem["actual_queue_read"] = new(1);
        // foreach(mem_map_info.slv_port[i]) begin
        //     expect_queue_write[i][id_type][$] = {};
        //     actual_queue_write[i][id_type][$] = {};
        //     expect_queue_read[i][id_type][$] = {};
        //     actual_queue_read[i][id_type][$] = {};
        // end
    endfunction: new
    extern function void check_phase(uvm_phase phase);

    task run_phase(uvm_phase phase);
        fork
            get_from_mst_mon();
            get_from_slv_mon();
            master_slave_check_write();
            master_slave_check_read();
        join
    endtask: run_phase

    task get_from_mst_mon();
        foreach(exp_port[i]) begin
            automatic string idx = i;
            automatic uvm_sequence_item get_expect;
            automatic string mst_port_name, slv_port_name;
            automatic bit [top_pkg::MAX_ID_WIDTH-1:0] slv_id;
            automatic axi_transaction expect_trans, actual_trans;
            fork
                while(1) begin
                    `uvm_info("get_from_mst_mon", $sformatf("begin get mst port tr at port %s", idx), UVM_DEBUG);
                    exp_port[idx].get(get_expect);
                    `uvm_info("get_from_mst_mon", $sformatf("port %s get mst tr: %s", idx, get_expect.sprint()), UVM_DEBUG);
                    assert($cast(expect_trans, get_expect));
                    mst_port_name = mem_map_info.get_mst_port_name(idx);
                    slv_port_name = mem_map_info.get_slv_name(mst_port_name, expect_trans.id, expect_trans.addr);
                    slv_id = mem_map_info.get_slv_id(mst_port_name, expect_trans.id, expect_trans.addr);
                    expect_trans.id = slv_id;
                    if(expect_trans.dir == axi_dec_pkg::Write) begin
                        expect_queue_write[slv_port_name][slv_id].push_back(expect_trans);
                    end
                    else begin
                        expect_queue_read[slv_port_name][slv_id].push_back(expect_trans);
                    end
                end
            join_none
            #2ns;
        end
    endtask

    task get_from_slv_mon();
        
        foreach(act_port[i]) begin
            automatic string idx = i;
            automatic uvm_sequence_item get_actual;
            automatic string slv_port_name;
            automatic axi_transaction actual_trans;
            fork
                begin 
                    while(1) begin
                        `uvm_info("get_from_slv_mon", $sformatf("begin get slv port tr at port %s", idx), UVM_DEBUG);
                        act_port[idx].get(get_actual);
                        `uvm_info("get_from_slv_mon", $sformatf("port %s get slv tr: %s", idx, get_actual.sprint()), UVM_DEBUG);
                        assert($cast(actual_trans, get_actual));
                        slv_port_name = mem_map_info.get_slv_port_name(idx);
                        if(actual_trans.dir == axi_dec_pkg::Write) begin
                            actual_queue_write[slv_port_name][actual_trans.id].push_back(actual_trans);
                        end
                        else begin
                            actual_queue_read[slv_port_name][actual_trans.id].push_back(actual_trans);
                        end
                    end
                end
            join_none
            #2ns;
        end
    endtask

    task  master_slave_check_write();
        while(1) begin
            foreach(expect_queue_write[i_index,j_index]) begin
                automatic string i = i_index;
                automatic id_type j = j_index;
                    begin
                        automatic axi_transaction expect_trans_pop_front_write, actual_trans_pop_front_write;
                        //`uvm_info(get_type_name(), $sformatf("check queue[%s][%0h] empty", i, j), UVM_NONE);
                        if((expect_queue_write[i][j].size() > 0) && (actual_queue_write[i][j].size() > 0)) begin
                            //`uvm_info(get_type_name(), $sformatf("check queue[%s][%0h], size %0d - %0d, ", i, j, expect_queue_write[i][j].size(), actual_queue_write[i][j].size()), UVM_NONE);
                            sem["actual_queue_write"].get();
                            actual_trans_pop_front_write = actual_queue_write[i][j].pop_front();
                            sem["actual_queue_write"].put();
                            sem["expect_queue_write"].get();
                            expect_trans_pop_front_write = expect_queue_write[i][j].pop_front();
                            sem["expect_queue_write"].put();
                            if(expect_trans_pop_front_write.compare(actual_trans_pop_front_write)) begin
                                `uvm_info("SCB", $sformatf("write ID %0d: PASSED", expect_trans_pop_front_write.id), UVM_NONE);
                                passCnt++;
                            end
                            else begin
                                `uvm_error("SCB", $sformatf("m_wtrans_ID:%0d m_wtrans:%s, s_wtrans_ID:%0d s_wtrans:%s slv_port_name %s", expect_trans_pop_front_write.id,expect_trans_pop_front_write.sprint(), actual_trans_pop_front_write.id,actual_trans_pop_front_write.sprint(), i));
                                failCnt++;
                            end
                        end
                    end
            end
            #20ns;
        end
    endtask

    task  master_slave_check_read();
        while(1) begin
            foreach(expect_queue_read[i_index, j_index]) begin
                automatic string i = i_index;
                automatic id_type j = j_index;
                    begin
                        automatic axi_transaction expect_trans_pop_front_read, actual_trans_pop_front_read;
                        if((expect_queue_read[i][j].size() > 0) && (actual_queue_read[i][j].size() > 0)) begin
                            sem["actual_queue_read"].get();
                            actual_trans_pop_front_read = actual_queue_read[i][j].pop_front();
                            sem["actual_queue_read"].put();
                            sem["expect_queue_read"].get();
                            expect_trans_pop_front_read = expect_queue_read[i][j].pop_front();
                            sem["expect_queue_read"].put();
                            if(expect_trans_pop_front_read.compare(actual_trans_pop_front_read)) begin
                                `uvm_info("SCB", $sformatf("read ID %0d: PASSED", expect_trans_pop_front_read.id), UVM_NONE);
                                passCnt++;
                            end
                            else begin
                                `uvm_error("SCB", $sformatf("m_rtrans_ID:%0h m_rtrans:%s, s_rtrans_ID:%0h s_rtrans:%s slv_port_name %s" , expect_trans_pop_front_read.id,expect_trans_pop_front_read.sprint(), actual_trans_pop_front_read.id,actual_trans_pop_front_read.sprint(), i));
                                failCnt++;
                            end
                        end
                    end
            end
            #20ns;
        end
    endtask

endclass: axi_base_scoreboard


function void axi_base_scoreboard::check_phase(uvm_phase phase);
    automatic axi_transaction expect_trans_pop_front_read, actual_trans_pop_front_read;
    super.check_phase(phase);
    foreach(expect_queue_read[i,j]) begin
        if(expect_queue_read[i][j].size() != 0) begin
            `uvm_error("check_phase", $sformatf("expect_queue_read[%s][%0h] is not empty %0d", i, j, expect_queue_read[i][j].size()));
        end
    end
    foreach(actual_queue_read[i,j]) begin
        if(actual_queue_read[i][j].size() != 0) begin
            `uvm_error("check_phase", $sformatf("actual_queue_read[%s][%0h] is not empty %0d", i, j, actual_queue_read[i][j].size()));
        end 
    end
    foreach(expect_queue_write[i,j]) begin
        if(expect_queue_write[i][j].size() != 0) begin
            `uvm_error("check_phase", $sformatf("expect_queue_write[%s][%0h] is not empty %0d", i, j, expect_queue_write[i][j].size()));
        end
    end
    foreach(actual_queue_write[i,j]) begin
        if(actual_queue_write[i][j].size() != 0) begin
            `uvm_error("check_phase", $sformatf("actual_queue_write[%s][%0h] is not empty %0d", i, j, actual_queue_write[i][j].size()));
        end 
    end
    `uvm_info(get_type_name(), $sformatf("execute check_phase"), UVM_DEBUG);

endfunction