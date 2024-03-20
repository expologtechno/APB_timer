//======================================= MONITOR ====================================/

class apb_monitor extends uvm_monitor;
	`uvm_component_utils(apb_monitor)

	virtual apb_intf intf_h;
	apb_transaction trans;
uvm_analysis_port#(apb_transaction) analysis_port;
 

//-------------------constructor-----------------------
function new(string name="apb_monitor",uvm_component parent);
	super.new(name,parent);

	analysis_port = new("analysis_port",this);
endfunction
	
//-----------------------build_phase----------------------
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	trans=apb_transaction::type_id::create("trans");
    	if(!uvm_config_db#(virtual apb_intf)::get(this, " ", "apb_intf", intf_h))
     	 `uvm_fatal("MONITOR", "***** Could not get apb_intf *****")


endfunction


//----------------------run_phase-------------------------------
task run_phase(uvm_phase phase);

endtask



endclass
