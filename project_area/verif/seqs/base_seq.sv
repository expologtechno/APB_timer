//-----------------------------------SEQUENCE------------------------------------------

class base_sequence extends uvm_sequence#(apb_transaction);
	`uvm_object_utils(base_sequence)
	
	apb_transaction trans;
	
//-------------------------------------constructor-------------------------------------
function new(string name ="base_sequence");
	super.new(name);
endfunction

//--------------------------------------task_body---------------------------------------
task pre_body();
    if(starting_phase != null) starting_phase.raise_objection(this);
  endtask

  task post_body();
    if(starting_phase != null) starting_phase.drop_objection(this);
  endtask
endclass


