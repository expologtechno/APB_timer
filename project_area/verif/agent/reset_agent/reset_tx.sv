//=======================RESET_TRANSACTION =====================================/
class reset_transaction extends uvm_sequence_item;
	`uvm_object_utils(reset_transaction)


	 bit presetn ;	
			bit psel;
			bit [11:2] paddr;
			bit penable;
			bit pwrite;
			bit [31:0] pwdata;
			bit [3:0]ecorevnum;
			bit extin;

//--------------------------constructor--------------------------------	
function new(string name="reset_transaction");
super.new(name);
endfunction

	
endclass

