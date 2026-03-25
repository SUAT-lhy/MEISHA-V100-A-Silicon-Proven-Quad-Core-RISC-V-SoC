//  Class: axi_read_seq
//
class axi_read_seq extends uvm_sequence;
    `uvm_object_param_utils(axi_read_seq);
    
    //  Group: Variables
    int no_of_trans;
    int incr_addr;
    bit [31:0] base_addr;
    bit [2:0] max_burst_size = 3;
    bit[7:0] id;
    
    axi_transaction trans_q[$];
    

    //  Constructor: new
    function new(string name = "axi_read_seq");
        super.new(name);
        no_of_trans = 100;
        incr_addr  = 32'h1000; 
    endfunction: new

    //  Task: body
    //  This is the user-defined task where the main sequence code resides.
    extern virtual task body();
    
endclass: axi_read_seq

task axi_read_seq::body();
    int cnt = 0;
    repeat(no_of_trans) begin
        axi_transaction trans;
        id++;
        trans = axi_transaction::type_id::create("trans");
        trans.addr_val_align.constraint_mode(0);
        trans.addr_val_unalign.constraint_mode(0);
        trans.addr_val.constraint_mode(1);
        start_item(trans);
        `uvm_info("DEBUG", $sformatf("axi_read_seq(), finish_item id = %0d", id), UVM_DEBUG);
        assert(trans.randomize() with {
            b_size == max_burst_size; 
            b_len == 0;
            b_type == Incr;
        });
        trans.addr = base_addr + (cnt++) * incr_addr;
        trans.id = {1'b1,id};//1, 
        finish_item(trans);        
        trans_q.push_back(trans);
        `uvm_info("DEBUG", $sformatf("axi_read_seq(), finish_item id = %0d", id), UVM_DEBUG);
        //trans.print();
        #10;
    end
endtask: body
