//----------------------------------VIRTUAL_SEQUENCE-------------------------------
class virtual_sequence extends uvm_sequence#(apb_transaction);
  	`uvm_object_utils(virtual_sequence)
	
	//apb_env env_h;
  	virtual_sequencer v_seqr;
	apb_sequencer sequencer_h;

//------------------------------------constructor--------------------------------
function new(string name="virtual_sequence");
    super.new(name);
  endfunction 
  

virtual task pre_body();
    if(starting_phase != null) starting_phase.raise_objection(this);
 endtask

virtual task body();
    //env_h=apb_env::type_id::create("env_h");

    assert($cast(v_seqr,m_sequencer))
    else begin
      `uvm_fatal("virt sequence","casting failed")
    end 
    sequencer_h = v_seqr.sequencer_h;	
endtask	
  
  
virtual task post_body();
    if(starting_phase != null) starting_phase.drop_objection(this);
endtask

endclass  


