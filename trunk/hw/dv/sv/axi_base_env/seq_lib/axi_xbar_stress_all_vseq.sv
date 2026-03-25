// Vendor 		: 
// Author 		: ling
// Filename 	: bus_checker 
// Date Created: 2022.04.26 
// Version		: V1.0
// File description	:
// Revision History :

// combine all axi_base seqs (except below seqs) in one seq to run sequentially
// 1. csr seq, which requires scb to be disabled
// 2. axi_base_cfg_update_on_fly, which requires zero_delays as it's very timing sensitive
class axi_base_stress_all_vseq extends axi_base_base_vseq;
  `uvm_object_utils(axi_base_stress_all_vseq)

  `uvm_object_new

  // avoid simulation running for too long
  constraint num_trans_c {
    num_trans inside {[1:10]};
  }


  task body();
    string seq_names[] = {"axi_base_random_vseq",
                          "axi_base_disabled_vseq",
                          "axi_base_common_vseq"}; // for intr_test
    for (int i = 1; i <= num_trans; i++) begin
      uvm_sequence       seq;
      axi_base_base_vseq axi_base_vseq;
      uint               seq_idx = $urandom_range(0, seq_names.size - 1);

      seq = create_seq_by_name(seq_names[seq_idx]);
      `downcast(axi_base_vseq, seq)

      // dut_init (reset) can be skipped
      if (do_apply_reset) axi_base_vseq.do_apply_reset = $urandom_range(0, 1);
      else axi_base_vseq.do_apply_reset = 0;

      axi_base_vseq.set_sequencer(p_sequencer);
      `DV_CHECK_RANDOMIZE_FATAL(axi_base_vseq)
      if (seq_names[seq_idx] == "axi_base_common_vseq") begin
        axi_base_common_vseq common_vseq;
        `downcast(common_vseq, axi_base_vseq);
        common_vseq.common_seq_type = "intr_test";
      end

      axi_base_vseq.start(p_sequencer);
    end
  endtask : body

endclass
