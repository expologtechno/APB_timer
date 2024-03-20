//================================= DRIVER ==========================================/
class apb_driver extends uvm_driver#(apb_transaction);
	`uvm_component_utils(apb_driver)
	 
	virtual apb_intf intf_h;
	apb_transaction trans;


//-------------------------------constructor-----------------------------------------	 
function new(string name="apb_driver",uvm_component parent);
	super.new(name,parent);
endfunction

//-----------------------------build_phase-------------------------------------------
function void build_phase(uvm_phase phase);
	super.build_phase(phase);

	trans=apb_transaction::type_id::create("trans");

    	if(!uvm_config_db#(virtual apb_intf)::get(this, " ", "apb_intf", intf_h))
     	 `uvm_fatal("DRIVEr", "***** Could not get apb_intf *****")


	
endfunction


//------------------------------run_phase ------------------------------------------
task run_phase(uvm_phase phase);
endtask
	 
endclass


