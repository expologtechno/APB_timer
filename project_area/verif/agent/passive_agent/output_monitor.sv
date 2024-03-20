//======================================= MONITOR ====================================/

class output_monitor extends uvm_monitor;
	`uvm_component_utils(output_monitor)

	virtual apb_intf intf_h;
	output_transaction trans;	

uvm_analysis_port#(output_transaction) analysis_pass_port;

//-------------------constructor-----------------------
function new(string name="output_monitor",uvm_component parent);
	super.new(name,parent);
	analysis_pass_port = new("analysis_pass_port",this);
endfunction
	
//-----------------------build_phase----------------------
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
    	if(!uvm_config_db#(virtual apb_intf)::get(this, " ", "apb_intf", intf_h))
     	 `uvm_fatal("OUTPUT MONITOR", "***** Could not get apb_intf *****")
	
endfunction


//----------------------run_phase-------------------------------
task run_phase(uvm_phase phase);

endtask


endclass


