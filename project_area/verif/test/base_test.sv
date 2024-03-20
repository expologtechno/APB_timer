class base_test extends uvm_test;
  `uvm_component_utils(base_test)
	
  apb_env env_h;
 	 
  extern function new(string name="base_test",uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);

endclass

//------------------CONSTRUCTOR----------------------

function base_test:: new(string name="base_test",uvm_component parent);
  super.new(name,parent);
endfunction

//------------BUILD PHASE------------
function void base_test:: build_phase(uvm_phase phase);
  super.build_phase(phase);
	`uvm_info("TEST",$sformatf("TEST - ENTERED BUILD PHASE"),UVM_MEDIUM)
 
    env_h=apb_env::type_id::create("env_h",this);
endfunction


//-------------------end_of_elaboration---------------------------
function void base_test::end_of_elaboration_phase(uvm_phase phase);
    uvm_factory factory = uvm_factory::get();
  uvm_top.print_topology();
endfunction




