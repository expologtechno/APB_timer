//----------------------------RESET_AGENT-------------------------------

class reset_agent extends uvm_agent;
	`uvm_component_utils(reset_agent)

	virtual apb_intf intf_h;
	reset_driver driver_h;
	reset_sequencer reset_sequencer_h;
//---------------------------constructor-----------------------------	
function new(string name="reset_agent", uvm_component parent=null);
    super.new(name, parent);
endfunction

//-----------------------------biuld_phase-------------------------
function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    driver_h    = reset_driver::type_id::create("driver_h",this);
    reset_sequencer_h = reset_sequencer::type_id::create("reset_sequencer_h",this);

	`uvm_info("AGENT",$sformatf("AGENT - ENTERED BUILD PHASE"),UVM_MEDIUM)
     
if(!uvm_config_db#(virtual apb_intf)::get(this," ","apb_intf",intf_h))
      `uvm_fatal("AGENT", "***** Could not get vif *****")
uvm_config_db#(virtual apb_intf)::set(this,"*","apb_intf",intf_h);

endfunction

//------------------------------connect_phase-------------------------
function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver_h.seq_item_port.connect(reset_sequencer_h.seq_item_export);
endfunction

endclass
