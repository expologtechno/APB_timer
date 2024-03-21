//---------------------------------------------------------------------------------------//
/*------------------------------sanity_sequence-------------------------------------------*/
//---------------------------------------------------------------------------------------//
class sanity_seq extends base_sequence;

	`uvm_object_utils(sanity_seq)
extern function new(string name ="sanity_seq");
extern task body();

endclass
//--------------constructor--------------------------
function sanity_seq:: new(string name="sanity_seq");
	super.new(name);
endfunction

//-----------------------task body------------------------------
task sanity_seq::body();
begin
		trans=apb_transaction::type_id::create("trans");

	

		start_item(trans);
			assert(trans.randomize() with {  
				trans.pwrite == 1'b1;
				trans.paddr == 10'h2;
				//trans.pwdata == 32'hcafef00d;
			//	trans.ecorevnum == 4'h000;
			        trans.extin == 1;	
				});
		finish_item(trans);
		get_response(rsp);


		start_item(trans);
			assert(trans.randomize() with {  
				trans.pwrite == 1'b0;
				trans.paddr == 10'h2;
				trans.ecorevnum == 4'h000;
			        trans.extin == 1;	
				});
		finish_item(trans);
		get_response(rsp);
	


end	
	
endtask
