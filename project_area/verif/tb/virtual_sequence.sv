//----------------------------------VIRTUAL_SEQUENCE-------------------------------
class virtual_sequence extends uvm_sequence#(apb_transaction);
  	`uvm_object_utils(virtual_sequence)
	
  	virtual_sequencer v_seqr;
	apb_sequencer sequencer_h;
	reset_sequencer reset_sequencer_h;

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
    reset_sequencer_h = v_seqr.reset_sequencer_h;	
endtask	
  
  
virtual task post_body();
    if(starting_phase != null) starting_phase.drop_objection(this);
endtask

endclass  

////---------------------------------------------------------------------------------------//
///************************* reset_sequence************************************************/
//---------------------------------------------------------------------------------------//
class virt_reset_seq extends virtual_sequence; 
  `uvm_object_utils(virt_reset_seq)
  
reset_seq reset_seq_h;


//------------------- constructor----------------------------
function new(string name="virt_reset_seq");
  super.new(name);
endfunction	

//------------------------- body--------------------------------
task  body();
  super.body();
  $display(" reset sequence task body started");
  reset_seq_h=reset_seq::type_id::create("reset_seq_h");  
  reset_seq_h.start(reset_sequencer_h);
  $display(" reset sequence task body ended");	
endtask 
endclass

////---------------------------------------------------------------------------------------//
///************************* sanity_sequence************************************************/
//---------------------------------------------------------------------------------------//
class virt_sanity_seq extends virtual_sequence; 
  `uvm_object_utils(virt_sanity_seq)
  
sanity_seq sanity_seq_h;


//------------------- constructor----------------------------
function new(string name="virt_sanity_seq");
  super.new(name);
endfunction	

//------------------------- body--------------------------------
task  body();
  super.body();
  $display(" sanity sequence task body started");
  sanity_seq_h=sanity_seq::type_id::create("sanity_seq_h");  
  sanity_seq_h.start(sequencer_h);
  $display(" sanity sequence task body ended");	
endtask 
endclass
