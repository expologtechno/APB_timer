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
forever begin

			seq_item_port.get_next_item(trans);
				wait(intf_h.presetn);
					if(trans.pwrite)begin
						@(posedge intf_h.pclkg);
						intf_h.drv_cb.psel 	<= 0;
						intf_h.drv_cb.penable 	<= 0;
						@(posedge intf_h.pclkg);
						intf_h.drv_cb.psel 	<= 1;
						intf_h.drv_cb.pwrite 	<= trans.pwrite;
						intf_h.drv_cb.paddr  	<= trans.paddr;
						intf_h.drv_cb.pwdata 	<= trans.pwdata;
						intf_h.drv_cb.extin 	<= trans.extin;
						intf_h.drv_cb.ecorevnum <= trans.ecorevnum;
						@(posedge intf_h.pclkg);
						intf_h.drv_cb.penable 	<= 1;
						@(posedge intf_h.pclkg);
						intf_h.drv_cb.psel 	<= 0;
						intf_h.drv_cb.penable	<= 0;
						end
					else begin
						@(posedge intf_h.pclkg);
						intf_h.drv_cb.psel 	<= 0;
						intf_h.drv_cb.penable 	<= 0;
						@(posedge intf_h.pclkg);
						intf_h.drv_cb.psel 	<= 1;
						intf_h.drv_cb.pwrite 	<= trans.pwrite;
						intf_h.drv_cb.paddr 	<= trans.paddr;
						intf_h.drv_cb.ecorevnum <= trans.ecorevnum;
						intf_h.drv_cb.extin 	<= trans.extin;
						@(posedge intf_h.pclkg);
						intf_h.drv_cb.penable 	<= 1;
						trans.prdata 		<= intf_h.drv_cb.prdata;
						@(posedge intf_h.pclkg);
						intf_h.drv_cb.psel	 <= 0;
						intf_h.drv_cb.penable 	 <= 0;
						end
				rsp=trans;
				rsp.set_id_info(trans);
			seq_item_port.item_done(rsp);

end

endtask
	 
endclass


