////---------------------------------------------------------------------------------------//
////---------------------------reset_test------------------------------------------------//
////---------------------------------------------------------------------------------------//

class reset_test extends base_test;

	`uvm_component_utils(reset_test)

virt_reset_seq v_reset_seq_h;


extern function new(string name="reset_test", uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);

endclass  

//*********** constructor****************

function reset_test::new(string name="reset_test", uvm_component parent);
  super.new(name,parent);
endfunction	


//************** build phase*************

function void reset_test:: build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction 

//*********** run phase****************


task reset_test::run_phase(uvm_phase phase);
	super.run_phase(phase);
`uvm_info("TEST","RUN_PHASE",UVM_MEDIUM)

  phase.raise_objection(this);
  v_reset_seq_h=virt_reset_seq::type_id::create("v_reset_seq_h");
  v_reset_seq_h.start(env_h.v_seqr);
  #500;
  phase.drop_objection(this);

endtask
