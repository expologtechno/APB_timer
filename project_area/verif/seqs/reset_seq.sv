//---------------------------------------------------------------------------------------//
/*------------------------------reset_sequence-------------------------------------------*/
//---------------------------------------------------------------------------------------//
class reset_seq extends base_sequence;

	`uvm_object_utils(reset_seq)
	reset_transaction tx;
extern function new(string name ="reset_seq");
extern task body();

endclass
//--------------constructor--------------------------
function reset_seq:: new(string name="reset_seq");
	super.new(name);
endfunction

//-----------------------task body------------------------------
task reset_seq::body();
begin
		tx=reset_transaction::type_id::create("tx");
	
		start_item(tx);
			assert(tx.randomize() with {  
				tx.presetn == 1'b0;
			tx.psel <= 0;   
			tx.presetn <= 0;
			tx.paddr <= 0;
			tx.penable <= 0;
			tx.pwrite <=0;
			tx.pwdata <=0;
			tx.ecorevnum <= 0;
			tx.extin <= 0;
				
				});
		finish_item(tx);

		start_item(tx);
			//assert(tx.randomize() with {  
				tx.presetn = 1'b1;
			//	});
		finish_item(tx);

	

	end	
endtask
