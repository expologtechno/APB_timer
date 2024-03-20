//--------------- ---SEQUENCER------------------------------------------

class apb_sequencer extends uvm_sequencer#(apb_transaction);
`uvm_component_utils(apb_sequencer)

	apb_transaction trans;
	
//---------------------constructor----------------------------		
function new(string name="apb_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction


endclass
