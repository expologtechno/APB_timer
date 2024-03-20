/************  AGENT ********************/

class output_agent extends uvm_agent;

	`uvm_component_utils(output_agent)
       virtual apb_intf intf_h;	
	output_monitor monitor;

//---------constructor------------------
function new(string name = "output_agent",uvm_component parent);
	super.new(name,parent);
endfunction

//---------------------build_phase----------------------
function void build_phase(uvm_phase phase);
	super.build_phase(phase);

	`uvm_info("OUTPUT AGENT",$sformatf("AGENT - ENTERED BUILD PHASE"),UVM_MEDIUM)
     
if(!uvm_config_db#(virtual apb_intf)::get(this," ","apb_intf",intf_h))
      `uvm_fatal("AGENT", "***** Could not get vif *****")
uvm_config_db#(virtual apb_intf)::set(this,"*","apb_intf",intf_h);


	monitor = output_monitor::type_id::create("monitor",this);


endfunction

endclass
