//----------------------------APB_AGENT-------------------------------

class apb_agent extends uvm_agent;
	`uvm_component_utils(apb_agent)

	virtual apb_intf intf_h;
	apb_driver driver_h;
	apb_monitor monitor_h;
	apb_sequencer sequencer_h;
//---------------------------constructor-----------------------------	
function new(string name="apb_agent", uvm_component parent=null);
    super.new(name, parent);
endfunction

//-----------------------------biuld_phase-------------------------
function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    driver_h=apb_driver::type_id::create("driver_h",this);
    monitor_h=apb_monitor::type_id::create("monitor_h",this);
    sequencer_h=apb_sequencer::type_id::create("sequencer_h",this);

	`uvm_info("AGENT",$sformatf("AGENT - ENTERED BUILD PHASE"),UVM_MEDIUM)
     
if(!uvm_config_db#(virtual apb_intf)::get(this," ","apb_intf",intf_h))
      `uvm_fatal("AGENT", "***** Could not get vif *****")
uvm_config_db#(virtual apb_intf)::set(this,"*","apb_intf",intf_h);

endfunction

//------------------------------connect_phase-------------------------
function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
endfunction

endclass
