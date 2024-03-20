//======================= TRANSACTION =====================================/
class apb_transaction extends uvm_sequence_item;
	`uvm_object_utils(apb_transaction)


	rand bit psel ;	
	rand bit [11:2] paddr;
	rand bit penable;
	rand bit pwrite ;
	rand bit [31:0] pwdata;
	rand bit [3:0] ecorevnum;
	     bit [31:0] prdata;
	     bit pready;
	     bit pslverr;
	rand bit extin;
	     bit timerint;


//--------------------------constructor--------------------------------	
function new(string name="apb_transaction");
super.new(name);
endfunction

	
endclass

