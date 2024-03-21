//--------------- ---RESET_SEQUENCER------------------------------------------

class reset_sequencer extends uvm_sequencer#(reset_transaction);
`uvm_component_utils(reset_sequencer)

	reset_transaction trans;
	
//---------------------constructor----------------------------		
function new(string name="reset_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction


endclass
