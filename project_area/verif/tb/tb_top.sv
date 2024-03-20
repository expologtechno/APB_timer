`include "uvm_macros.svh"
import uvm_pkg::*;

`include "package.svh"

module tb_top;

  bit pclk = 0;
  bit pclkg = 0;
  bit presetn;

  //-------------------- clock_generation --------------------
  always #5 pclk = ~pclk;
  always #5 pclkg = ~pclkg;
	
 initial begin
    intf_h.presetn=0;
    #50;
    intf_h.presetn=1;

    if ($test$plusargs("TOGGLE_RESET"))begin
	    #2;
    intf_h.presetn=0;
    #10;
    intf_h.presetn=1;
    end
 end

  apb_intf    intf_h( pclk );

  //-------------------- dut_instantiation --------------------
 cmsdk_apb_timer dut (
 			.PCLK		(intf_h.pclk),		
			.PCLKG		(intf_h.pclkg),
			.PRESETn		(intf_h.presetn),
			.PSEL		(intf_h.psel),
			.PADDR		(intf_h.paddr),
			.PENABLE		(intf_h.penable),
			.PWDATA		(intf_h.pwdata),
			.PWRITE		(intf_h.pwrite),
			.ECOREVNUM	(intf_h.ecorevnum),
			.PREADY		(intf_h.pready),
			.PSLVERR		(intf_h.pslverr),
			.PRDATA		(intf_h.prdata),
			.EXTIN		(intf_h.extin),
			.TIMERINT	(intf_h.timerint)
 
 );                   

initial begin

	uvm_config_db #(virtual apb_intf)::set(null,"*","apb_intf",intf_h);
	`uvm_info("TOP",$sformatf("ENTERED TOP"),UVM_MEDIUM)

run_test();
end


endmodule
