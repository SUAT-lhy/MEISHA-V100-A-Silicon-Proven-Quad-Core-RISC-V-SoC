`uvm_analysis_imp_decl(_master)
`uvm_analysis_imp_decl(_slave)

class axi_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(axi_scoreboard)

    
    // Components
    uvm_analysis_imp_master#(axi_transaction, axi_scoreboard) m_ap_imp;
    uvm_analysis_imp_slave#(axi_transaction, axi_scoreboard) s_ap_imp;

    // Variables
    axi_transaction m_wtrans[$], m_rtrans[$], s_wtrans[$], s_rtrans[$],
    s_wtrans_pop_front,m_wtrans_pop_front,s_rtrans_pop_front,m_rtrans_pop_front;
    bit [1:0] w_rcvd, r_rcvd;
    int passCnt, failCnt;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        m_rtrans={};
        m_rtrans={};
        s_wtrans={};
        s_rtrans={};
    endfunction //new()

    // initial begin
    //     m_rtrans={};
    //     m_rtrans={};
    //     s_wtrans={};
    //     s_rtrans={};
    // end
    task run_phase(uvm_phase phase);
        fork
            forever begin
                master_slave_check_write();
            end
            forever begin
                master_slave_check_read();
            end
        join
    endtask: run_phase

    function void write_master(axi_transaction trans);

        if(trans.id[8]) begin
            m_rtrans.push_back(trans);
        end
            
        else begin
            m_wtrans.push_back(trans);
        end
    endfunction

    function void write_slave(axi_transaction trans);

        if(trans.id[8]) begin
            s_rtrans.push_back(trans);
        end
            
        else begin
            s_wtrans.push_back(trans);
        end
    endfunction

    task  master_slave_check_write();
        while((s_wtrans.size() == 0) || (m_wtrans.size() == 0)) begin
            #20ns;
        end  
        s_wtrans_pop_front=s_wtrans.pop_front();
        m_wtrans_pop_front=m_wtrans.pop_front();
       
        if(m_wtrans_pop_front.compare(s_wtrans_pop_front)) begin
            `uvm_info("SCB", $sformatf("write ID %0d: PASSED", m_wtrans_pop_front.id), UVM_NONE);
            passCnt++;
        end
        else begin
            `uvm_info("SCB", $sformatf("m_wtrans_ID:%0d m_wtrans:%s", m_wtrans_pop_front.id,m_wtrans_pop_front.sprint()), UVM_NONE);
            `uvm_info("SCB", $sformatf("s_wtrans_ID:%0d s_wtrans:%s", s_wtrans_pop_front.id,s_wtrans_pop_front.sprint()), UVM_NONE);
            `uvm_error("SCB", $sformatf("ID %0d: FAILED", m_wtrans_pop_front.id));
            failCnt++;
        end
    endtask

    task  master_slave_check_read();
        while((s_rtrans.size() == 0) || (m_rtrans.size() == 0)) begin
            #20ns;
        end 
        s_rtrans_pop_front=s_rtrans.pop_front();
        m_rtrans_pop_front=m_rtrans.pop_front();

        if(m_rtrans_pop_front.compare(s_rtrans_pop_front)) begin
            `uvm_info("SCB", $sformatf("read ID %0d: PASSED", m_rtrans_pop_front.id), UVM_NONE);
            passCnt++;
        end
        else begin
            `uvm_info("SCB", $sformatf("m_wtrans_ID:%0d m_wtrans:%s", m_rtrans_pop_front.id,m_rtrans_pop_front.sprint()), UVM_NONE);
            `uvm_info("SCB", $sformatf("s_wtrans_ID:%0d s_wtrans:%s", s_rtrans_pop_front.id,s_rtrans_pop_front.sprint()), UVM_NONE);
            `uvm_error("SCB", $sformatf("ID %0d: FAILED", m_rtrans_pop_front.id));
            failCnt++;
        end
    endtask
    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
endclass //axi_scoreboard extends uvm_scoreboard

function void axi_scoreboard::build_phase(uvm_phase phase);
    /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
    /*  For more information see UVM Cookbook v1800.2 p.503  */
    //super.build_phase(phase);

    m_ap_imp = new("m_ap_imp", this);
    s_ap_imp = new("s_ap_imp", this);
endfunction: build_phase
