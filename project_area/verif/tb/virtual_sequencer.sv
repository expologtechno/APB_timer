//------------------------------VIRTUAL_SEQUENCER---------------------
class virtual_sequencer extends  uvm_sequencer;
  `uvm_component_utils(virtual_sequencer)
    
 apb_sequencer sequencer_h; 
	reset_sequencer reset_sequencer_h;
   
    extern function new(string name="virtual_sequencer", uvm_component parent);
    extern function void build_phase(uvm_phase phase);
endclass


/***************** constructor**************************/
function virtual_sequencer::new(string name="virtual_sequencer", uvm_component parent);
  super.new(name,parent);
endfunction  

/******************** build phase******************/

function void virtual_sequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
   sequencer_h=apb_sequencer::type_id::create("sequencer_h",this);
   reset_sequencer_h=reset_sequencer::type_id::create("reset_sequencer_h",this);
 
  	  
endfunction   
