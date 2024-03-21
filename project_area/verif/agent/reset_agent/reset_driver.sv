//================================= DRIVER ==========================================/
class reset_driver extends uvm_driver#(reset_transaction);
	`uvm_component_utils(reset_driver)
	 
	virtual apb_intf intf_h;
	reset_transaction trans;


//-------------------------------constructor-----------------------------------------	 
function new(string name="reset_driver",uvm_component parent);
	super.new(name,parent);
endfunction

//-----------------------------build_phase-------------------------------------------
function void build_phase(uvm_phase phase);
	super.build_phase(phase);

	trans=reset_transaction::type_id::create("trans");

    	if(!uvm_config_db#(virtual apb_intf)::get(this, " ", "apb_intf", intf_h))
     	 `uvm_fatal("DRIVEr", "***** Could not get apb_intf *****")
endfunction


//------------------------------run_phase ------------------------------------------
task run_phase(uvm_phase phase);
forever begin

		@(posedge intf_h.pclkg);
		seq_item_port.get_next_item(trans);
			intf_h.drv_cb.psel <=    trans.psel;
			intf_h.drv_cb.presetn <= trans.presetn;
			intf_h.drv_cb.paddr <= trans.paddr;
			intf_h.drv_cb.penable <= trans.penable;
			intf_h.drv_cb.pwrite <= trans.pwrite;
			intf_h.drv_cb.pwdata <= trans.pwdata;
			intf_h.drv_cb.ecorevnum <= trans.ecorevnum;
			intf_h.drv_cb.extin <= trans.extin;
			seq_item_port.item_done();
	end
endtask
endclass
