//  Class: axi_write_seq
//
class axi_write_seq extends uvm_sequence;
    `uvm_object_param_utils(axi_write_seq);
    
    //  Group: Variables
    int no_of_trans;
    bit [31:0] incr_addr;
    bit [31:0] base_addr;
    bit [2:0] max_burst_size = 3;
    bit[7:0] id;
    rand bit wstrb [][];
    axi_transaction trans_q[$];

    //  Constructor: new
    function new(string name = "axi_write_seq");
        super.new(name);
        
        no_of_trans = 100;
        incr_addr  = 32'h1000; 
    endfunction: new

    //  Task: body
    //  This is the user-defined task where the main sequence code resides.
    extern virtual task body();
    
endclass: axi_write_seq

task axi_write_seq::body();
    int cnt = 0;
    repeat(no_of_trans) begin
        axi_transaction trans;
        id++;
        trans = axi_transaction::type_id::create("trans");
        trans.addr_val_align.constraint_mode(0);
        trans.addr_val_unalign.constraint_mode(0);
        trans.addr_val.constraint_mode(1);
        
        `uvm_info("DEBUG", $sformatf("axi_write_seq(), start_item"), UVM_MEDIUM);
        start_item(trans);

        assert(trans.randomize() with {
            foreach (wstrb[i]) {
                foreach (wstrb[i][j]) {  // full strb
                    wstrb[i][j] == 1'b1;
                }
            }
            b_type == Incr;
            b_size == max_burst_size;  // fix burst_size ,becase vip send strb maybe illegal
            b_len == 0;   // fix burst_length ,becase vip send strb maybe illegal
        });
        foreach (trans.data[i]) begin
            foreach (trans.data[i][j]) begin
                trans.data[i][j] = $urandom;
            end
        end
        trans.addr = base_addr + (cnt++) * incr_addr;

        trans.id = {1'b0, id};
        `uvm_info("DEBUG", $sformatf("axi_write_seq(), start_item id = %0d, \n:%0s", id, trans.sprint()), UVM_MEDIUM);
        finish_item(trans);
        trans_q.push_back(trans);
        `uvm_info("DEBUG", $sformatf("axi_write_seq(), finish_item id = %0d", id), UVM_DEBUG);
        //trans.print();
        #10ns;
    end
endtask: body
