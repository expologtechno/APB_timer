//----------------------------------------INTERFACE-----------------------

interface apb_intf(input bit pclk);
	
logic pclkg;
logic presetn;
logic psel ;	
logic [11:2] paddr;
logic penable;
logic pwrite ;
logic [31:0] pwdata;
logic [3:0] ecorevnum;
logic [31:0] prdata;
logic pready;
logic pslverr;
logic extin;
logic timerint;
	
//------------------driver_cb-----------------
	
clocking drv_cb @(posedge pclk);
	default input #0 output #0;
output pclk;
output pclkg;
output presetn;
output psel ;	
output paddr;
output penable;
output pwrite ;
output pwdata;
output ecorevnum;
input  prdata;
input pready;
input pslverr;
output extin;
input timerint;	
endclocking


//-----------------mon_cb-------------------
clocking mon_cb@(posedge pclk);
	default input #1 output #1;
input pclk;
input pclkg;
input presetn;
input psel ;	
input paddr;
input penable;
input pwrite ;
input pwdata;
input ecorevnum;
input prdata;
input pready;
input pslverr;
input extin;
input timerint;
endclocking
//----------------MODPORT------------

modport mon_mp(clocking mon_cb);
modport drv_mp(clocking drv_cb);
	
	

endinterface



