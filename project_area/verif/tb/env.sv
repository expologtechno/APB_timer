//-------------------------------ENVIRONMENT-------------------------------------

class apb_env extends uvm_env;

	`uvm_component_utils(apb_env)
	
	apb_agent agent_h;
	reset_agent reset_agent_h;
	output_agent o_agent_h;
  	virtual_sequencer v_seqr;
	apb_sequencer sequencer_h;
	reset_sequencer reset_sequencer_h;


extern function new(string name="apb_env",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern function void report();	
endclass

//------------------CONSTRUCTOR---------------------

function apb_env::new(string name="apb_env",uvm_component parent);
	super.new(name,parent);
endfunction

//---------------------BUILD PHASE--------------------

function void apb_env::build_phase(uvm_phase phase);
	super.build_phase(phase);
	agent_h=apb_agent::type_id::create("agent_h",this);
	reset_agent_h=reset_agent::type_id::create("reset_agent_h",this);
	o_agent_h=output_agent::type_id::create("o_agent_h",this);
	`uvm_info("ENV",$sformatf("ENV - ENTERED BUILD PHASE"),UVM_MEDIUM)
	v_seqr=virtual_sequencer::type_id::create("v_seqr",this);

endfunction


//-----------------------------connect_phase------------------------
function void apb_env::connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	v_seqr.sequencer_h=agent_h.sequencer_h;
	v_seqr.reset_sequencer_h=reset_agent_h.reset_sequencer_h;
endfunction


//*********************************Report for checking error************************************************
function void apb_env::report();
uvm_report_server reportserver=uvm_report_server::get_server();
$display("***************************************************************************************************************************************************************");
$display("--------------------------------------------------------------------test_summary-------------------------------------------------------------------------------");
$display("***************************************************************************************************************************************************************");

$display("***************************************************************************************************************************************************************");
report_header();
report_summarize();
$display("****************************************************************************************************************************************************************");

$display("--------final test stauts--------");
if(reportserver.get_severity_count(UVM_FATAL)==0 && reportserver.get_severity_count(UVM_ERROR)==0)
begin
$display("============================================================================================================");
$display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!!TEST PASSED!!!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
$display("");
$display("");
$display("******  ******  ****** ******         ****** 	******  ******  ******              ");
$display("   *	  *       *        *            *    * 	*    *  *       *                   ");
$display("   *	  *       *        *            *    * 	*    *  *       *                   ");
$display("   *	  ******  ******   *            ****** 	******  ******  ******              ");
$display("   *	  *            *   *            *       *    *       *       *              ");
$display("   *	  *            *   *            *       *    *       *       *              ");
$display("   *	  ******  ******   *            *       *    *  ******  ******              ");
$display("");
$display("");
$display("============================================================================================================");
end
else
begin
$display("============================================================================================================");
$display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!!TEST FAILED!!!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
$display("");
$display("");
$display("          ******  ******  ****** ******  	****** 	******  ******  *              	");
$display("            *	    *	    *        *	       	*    	*    *    *     *               ");
$display("            *	    *	    *        *	       	*    	*    *    *     *               ");
$display("            *	    ******  ******   *	       	******	******    *     *              	");
$display("            *	    *	         *   *	       	*  	*    *    *     *              	");
$display("            *	    *	         *   *	       	*  	*    *    *     *              	");
$display("            *	    ******  ******   *	       	*  	*    *  ******  ******          ");
$display("");
$display("");
$display("============================================================================================================");
end
endfunction

