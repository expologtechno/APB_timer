//=====================================SCOREBOARD========================================/

class apb_scoreboard extends uvm_scoreboard;
  	`uvm_component_utils(apb_scoreboard)



apb_transaction trans;


uvm_tlm_analysis_fifo#(apb_transaction) analy_fifo;

//---------------------------------constructor---------------------------------------------
function new(string name="ahb_scoreboard", uvm_component parent);
	super.new(name,parent);
endfunction

//-----------------------------------build_phase-------------------------------------------
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	analy_fifo = new("analy_fifo",this);
endfunction


//--------------------------------------run_phase---------------------------------------------
virtual task run_phase(uvm_phase phase);
endtask


endclass

























