
`timescale 1 ns / 1 ps

	module myip_v1_0_S00_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 8
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
(*keep="true"*)		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
(*keep="true"*)		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
    		// privilege and security level of the transaction, and whether
    		// the transaction is a data access or an instruction access.
(*keep="true"*)		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
    		// valid write address and control information.
(*keep="true"*)		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
(*keep="true"*)		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA ,
		
		
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA0 ,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA1 ,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA2 ,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA3 ,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA4 ,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA5 ,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA6 ,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA7 ,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA8 ,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA9 ,
	
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA10,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA11,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA12,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA13,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA14,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA15,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA16,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA17,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA18,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA19,
	
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA20,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA21,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA22,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA23,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA24,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA25,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA26,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA27,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA28,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA29,
	
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA30,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA31,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA32,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA33,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA34,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA35,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA36,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA37,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA38,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA39,
	
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA40,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA41,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA42,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA43,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA44,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA45,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA46,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA47,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA48,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA49,
	
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA50,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA51,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA52,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA53,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA54,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA55,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA56,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA57,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA58,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA59,
	
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA60,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA61,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA62,
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA63,

		
		// Write strobes. This signal indicates which byte lanes hold
    		// valid data. There is one write strobe bit for each eight
    		// bits of the write data bus.    
(*keep="true"*)		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
    		// data and strobes are available.
(*keep="true"*)		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    		// can accept the write data.
(*keep="true"*)		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
    		// of the write transaction.
(*keep="true"*)		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
    		// is signaling a valid write response.
(*keep="true"*)		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    		// can accept a write response.
(*keep="true"*)		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
(*keep="true"*)		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
(*keep="true"*)		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
(*keep="true"*)		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
(*keep="true"*)		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
(*keep="true"*)		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,   //地址00
		
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA0,   
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA1,   
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA2,   
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA3,   
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA4 ,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA5 ,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA6 ,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA7 ,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA8 ,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA9 ,  

(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA10,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA11,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA12,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA13,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA14,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA15,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA16,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA17,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA18,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA19,  

(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA20,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA21,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA22,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA23,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA24,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA25,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA26,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA27,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA28,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA29,  

(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA30,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA31,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA32,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA33,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA34,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA35,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA36,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA37,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA38,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA39,  

(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA40,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA41,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA42,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA43,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA44,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA45,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA46,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA47,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA48,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA49,  

(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA50,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA51,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA52,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA53,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA54,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA55,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA56,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA57,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA58,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA59,  

(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA60,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA61,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA62,  
(*keep="true"*)		output reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA63,  


		// Read response. This signal indicates the status of the
    		// read transfer.
(*keep="true"*)		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
(*keep="true"*)		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
(*keep="true"*)		input wire  S_AXI_RREADY
	);

	// AXI4LITE signals
(*keep="true"*)	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
(*keep="true"*)	reg  	axi_awready;
(*keep="true"*)	reg  	axi_wready;
(*keep="true"*)	reg [1 : 0] 	axi_bresp;
(*keep="true"*)	reg  	axi_bvalid;
(*keep="true"*)	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
(*keep="true"*)	reg  	axi_arready;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
(*keep="true"*)	reg [1 : 0] 	axi_rresp;
(*keep="true"*)	reg  	axi_rvalid;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 3;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 16
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg4;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg5 ;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg6 ;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg7 ;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg8 ;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg9 ;

(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg10;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg11;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg12;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg13;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg14;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg15;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg16;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg17;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg18;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg19;

(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg20;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg21;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg22;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg23;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg24;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg25;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg26;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg27;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg28;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg29;

(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg30;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg31;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg32;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg33;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg34;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg35;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg36;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg37;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg38;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg39;

(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg40;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg41;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg42;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg43;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg44;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg45;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg46;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg47;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg48;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg49;

(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg50;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg51;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg52;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg53;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg54;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg55;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg56;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg57;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg58;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg59;

(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg60;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg61;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg62;
(*keep="true"*)	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg63;

	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	
	assign S_AXI_RDATA	= axi_rdata;
	
	
	
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.
	
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	        end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID)
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      slv_reg0 <= 0;
	      slv_reg1 <= 0;
	      slv_reg2 <= 0;
	      slv_reg3 <= 0;
	      slv_reg4 <= 0;
	      slv_reg5 <= 0;
	      slv_reg6 <= 0;
	      slv_reg7 <= 0;
	      slv_reg8 <= 0;
	      slv_reg9 <= 0;
		  
	      slv_reg10 <= 0;
	      slv_reg11 <= 0;
	      slv_reg12 <= 0;
	      slv_reg13 <= 0;
	      slv_reg14 <= 0;
	      slv_reg15 <= 0;
		  slv_reg16 <= 0;
	      slv_reg17 <= 0;
	      slv_reg18 <= 0;
	      slv_reg19 <= 0;
		  
		  slv_reg20 <= 0;
	      slv_reg21 <= 0;
	      slv_reg22 <= 0;
	      slv_reg23 <= 0;
	      slv_reg24 <= 0;
	      slv_reg25 <= 0;
		  slv_reg26 <= 0;
	      slv_reg27 <= 0;
	      slv_reg28 <= 0;
	      slv_reg29 <= 0;
		  
		  slv_reg30 <= 0;
	      slv_reg31 <= 0;
	      slv_reg32 <= 0;
	      slv_reg33 <= 0;
	      slv_reg34 <= 0;
	      slv_reg35 <= 0;
		  slv_reg36 <= 0;
	      slv_reg37 <= 0;
	      slv_reg38 <= 0;
	      slv_reg39 <= 0;
		  
		  slv_reg40 <= 0;
	      slv_reg41 <= 0;
	      slv_reg42 <= 0;
	      slv_reg43 <= 0;
	      slv_reg44 <= 0;
	      slv_reg45 <= 0;
		  slv_reg46 <= 0;
	      slv_reg47 <= 0;
	      slv_reg48 <= 0;
	      slv_reg49 <= 0;
		  
		  slv_reg50 <= 0;
	      slv_reg51 <= 0;
	      slv_reg52 <= 0;
	      slv_reg53 <= 0;
	      slv_reg54 <= 0;
	      slv_reg55 <= 0;
		  slv_reg56 <= 0;
	      slv_reg57 <= 0;
	      slv_reg58 <= 0;
	      slv_reg59 <= 0;
		  
		  slv_reg60 <= 0;
	      slv_reg61 <= 0;
	      slv_reg62 <= 0;
	      slv_reg63 <= 0;
	    end 
	  else begin
	    if (slv_reg_wren)
	      begin
	        //case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	        case ( axi_awaddr[7:2] )
	          6'h0:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                slv_reg0[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'h1:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 1
	                slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	         6'h2:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 2
	                slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'h3:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 3
	                slv_reg3[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'h4:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 4
	                slv_reg4[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'h5:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 5
	                slv_reg5[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'h6:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 6
	                slv_reg6[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'h7:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 7
	                slv_reg7[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	         6'h8:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 8
	                slv_reg8[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'h9:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 9
	                slv_reg9[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'hA:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 10
	                slv_reg10[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'hB:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 11
	                slv_reg11[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'hC:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 12
	                slv_reg12[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'hD:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 13
	                slv_reg13[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'hE:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 14
	                slv_reg14[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          6'hF:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg15[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
			6'd16:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg16[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd17:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg17[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd18:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg18[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd19:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg19[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			
			6'd20:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg20[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd21:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg21[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd22:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg22[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd23:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg23[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd24:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg24[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd25:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg25[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd26:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg26[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd27:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg27[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd28:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg28[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd29:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg29[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			
			6'd30:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg30[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd31:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg31[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd32:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg32[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd33:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg33[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd34:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg34[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd35:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg35[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd36:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg36[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd37:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg37[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd38:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg38[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd39:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg39[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			
			6'd40:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg40[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd41:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg41[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd42:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg42[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd43:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg43[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd44:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg44[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd45:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg45[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd46:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg46[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd47:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg47[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd48:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg48[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd49:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg49[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			
			6'd50:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg50[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd51:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg51[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd52:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg52[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd53:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg53[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd54:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg54[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd55:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg55[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd56:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg56[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd57:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg57[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd58:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg58[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd59:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg59[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			
			6'd60:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg60[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd61:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg61[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd62:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg62[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
			6'd63:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg63[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
	          default : begin
	                      slv_reg0 <= slv_reg0;
	                      slv_reg1 <= slv_reg1;
	                      slv_reg2 <= slv_reg2;
	                      slv_reg3 <= slv_reg3;
	                      slv_reg4 <= slv_reg4;
	                      slv_reg5 <= slv_reg5;
	                      slv_reg6 <= slv_reg6;
	                      slv_reg7 <= slv_reg7;
	                      slv_reg8 <= slv_reg8;
	                      slv_reg9 <= slv_reg9;
						  
	                      slv_reg10 <= slv_reg10;
	                      slv_reg11 <= slv_reg11;
	                      slv_reg12 <= slv_reg12;
	                      slv_reg13 <= slv_reg13;
	                      slv_reg14 <= slv_reg14;
	                      slv_reg15 <= slv_reg15;
						  slv_reg16 <= slv_reg16;
	                      slv_reg17 <= slv_reg17;
	                      slv_reg18 <= slv_reg18;
	                      slv_reg19 <= slv_reg19;
						  
						  slv_reg20 <= slv_reg20;
	                      slv_reg21 <= slv_reg21;
	                      slv_reg22 <= slv_reg22;
	                      slv_reg23 <= slv_reg23;
	                      slv_reg24 <= slv_reg24;
	                      slv_reg25 <= slv_reg25;
						  slv_reg26 <= slv_reg26;
	                      slv_reg27 <= slv_reg27;
	                      slv_reg28 <= slv_reg28;
	                      slv_reg29 <= slv_reg29;
						  
						  slv_reg30 <= slv_reg30;
	                      slv_reg31 <= slv_reg31;
	                      slv_reg32 <= slv_reg32;
	                      slv_reg33 <= slv_reg33;
	                      slv_reg34 <= slv_reg34;
	                      slv_reg35 <= slv_reg35;
						  slv_reg36 <= slv_reg36;
	                      slv_reg37 <= slv_reg37;
	                      slv_reg38 <= slv_reg38;
	                      slv_reg39 <= slv_reg39;
						  
						  slv_reg40 <= slv_reg40;
	                      slv_reg41 <= slv_reg41;
	                      slv_reg42 <= slv_reg42;
	                      slv_reg43 <= slv_reg43;
	                      slv_reg44 <= slv_reg44;
	                      slv_reg45 <= slv_reg45;
						  slv_reg46 <= slv_reg46;
	                      slv_reg47 <= slv_reg47;
	                      slv_reg48 <= slv_reg48;
	                      slv_reg49 <= slv_reg49;
						  
						  slv_reg50 <= slv_reg50;
	                      slv_reg51 <= slv_reg51;
	                      slv_reg52 <= slv_reg52;
	                      slv_reg53 <= slv_reg53;
	                      slv_reg54 <= slv_reg54;
	                      slv_reg55 <= slv_reg55;
						  slv_reg56 <= slv_reg56;
	                      slv_reg57 <= slv_reg57;
	                      slv_reg58 <= slv_reg58;
	                      slv_reg59 <= slv_reg59;
						  
						  slv_reg60 <= slv_reg60;
	                      slv_reg61 <= slv_reg61;
	                      slv_reg62 <= slv_reg62;
	                      slv_reg63 <= slv_reg63;
	                    end
	        endcase
	      end
	  end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 6'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	      // Address decoding for reading registers
	      case ( axi_araddr[7:2] )
	        6'h0   : reg_data_out <= S_AXI_WDATA0;
	        6'h1   : reg_data_out <= S_AXI_WDATA1;
	        6'h2   : reg_data_out <= S_AXI_WDATA2;
	        6'h3   : reg_data_out <= S_AXI_WDATA3;
	        6'h4   : reg_data_out <= S_AXI_WDATA4;
	        6'h5   : reg_data_out <= S_AXI_WDATA5;
	        6'h6   : reg_data_out <= S_AXI_WDATA6;
	        6'h7   : reg_data_out <= S_AXI_WDATA7;
	        6'h8   : reg_data_out <= S_AXI_WDATA8;
	        6'h9   : reg_data_out <= S_AXI_WDATA9;
			
	        6'd10   : reg_data_out <= S_AXI_WDATA10;
	        6'd11   : reg_data_out <= S_AXI_WDATA11;
	        6'd12   : reg_data_out <= S_AXI_WDATA12;
	        6'd13   : reg_data_out <= S_AXI_WDATA13;
	        6'd14   : reg_data_out <= S_AXI_WDATA14;
	        6'd15   : reg_data_out <= S_AXI_WDATA15;
			6'd16   : reg_data_out <= S_AXI_WDATA16;
	        6'd17   : reg_data_out <= S_AXI_WDATA17;
	        6'd18   : reg_data_out <= S_AXI_WDATA18;
	        6'd19   : reg_data_out <= S_AXI_WDATA19;
	       
			6'd20   : reg_data_out <= S_AXI_WDATA20;
	        6'd21   : reg_data_out <= S_AXI_WDATA21;
	        6'd22   : reg_data_out <= S_AXI_WDATA22;
	        6'd23   : reg_data_out <= S_AXI_WDATA23;
	        6'd24   : reg_data_out <= S_AXI_WDATA24;
	        6'd25   : reg_data_out <= S_AXI_WDATA25;
			6'd26   : reg_data_out <= S_AXI_WDATA26;
	        6'd27   : reg_data_out <= S_AXI_WDATA27;
	        6'd28   : reg_data_out <= S_AXI_WDATA28;
	        6'd29   : reg_data_out <= S_AXI_WDATA29;
			
			6'd30   : reg_data_out <= S_AXI_WDATA30;
	        6'd31   : reg_data_out <= S_AXI_WDATA31;
	        6'd32   : reg_data_out <= S_AXI_WDATA32;
	        6'd33   : reg_data_out <= S_AXI_WDATA33;
	        6'd34   : reg_data_out <= S_AXI_WDATA34;
	        6'd35   : reg_data_out <= S_AXI_WDATA35;
			6'd36   : reg_data_out <= S_AXI_WDATA36;
	        6'd37   : reg_data_out <= S_AXI_WDATA37;
	        6'd38   : reg_data_out <= S_AXI_WDATA38;
	        6'd39   : reg_data_out <= S_AXI_WDATA39;
			
			6'd40   : reg_data_out <= S_AXI_WDATA40;
	        6'd41   : reg_data_out <= S_AXI_WDATA41;
	        6'd42   : reg_data_out <= S_AXI_WDATA42;
	        6'd43   : reg_data_out <= S_AXI_WDATA43;
	        6'd44   : reg_data_out <= S_AXI_WDATA44;
	        6'd45   : reg_data_out <= S_AXI_WDATA45;
			6'd46   : reg_data_out <= S_AXI_WDATA46;
	        6'd47   : reg_data_out <= S_AXI_WDATA47;
	        6'd48   : reg_data_out <= S_AXI_WDATA48;
	        6'd49   : reg_data_out <= S_AXI_WDATA49;
			
			6'd50   : reg_data_out <= S_AXI_WDATA50;
	        6'd51   : reg_data_out <= S_AXI_WDATA51;
	        6'd52   : reg_data_out <= S_AXI_WDATA52;
	        6'd53   : reg_data_out <= S_AXI_WDATA53;
	        6'd54   : reg_data_out <= S_AXI_WDATA54;
	        6'd55   : reg_data_out <= S_AXI_WDATA55;
			6'd56   : reg_data_out <= S_AXI_WDATA56;
	        6'd57   : reg_data_out <= S_AXI_WDATA57;
	        6'd58   : reg_data_out <= S_AXI_WDATA58;
	        6'd59   : reg_data_out <= S_AXI_WDATA59;
			
			6'd60   : reg_data_out <= S_AXI_WDATA60;
	        6'd61   : reg_data_out <= S_AXI_WDATA61;
	        6'd62   : reg_data_out <= S_AXI_WDATA62;
	        6'd63   : reg_data_out <= S_AXI_WDATA63;
	        default : reg_data_out <= 0;
	      endcase
	end

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    

	// Add user logic here

	// User logic ends

	always @( posedge S_AXI_ACLK )
	begin
		S_AXI_RDATA0<=slv_reg0;
		S_AXI_RDATA1<=slv_reg1;
		S_AXI_RDATA2<=slv_reg2;
		S_AXI_RDATA3<=slv_reg3;
		S_AXI_RDATA4<=slv_reg4;
		S_AXI_RDATA5<=slv_reg5;
		S_AXI_RDATA6<=slv_reg6;
		S_AXI_RDATA7<=slv_reg7;
		S_AXI_RDATA8<=slv_reg8;
		S_AXI_RDATA9<=slv_reg9;
		
		S_AXI_RDATA10<=slv_reg10;
		S_AXI_RDATA11<=slv_reg11;
		S_AXI_RDATA12<=slv_reg12;
		S_AXI_RDATA13<=slv_reg13;
		S_AXI_RDATA14<=slv_reg14;
		S_AXI_RDATA15<=slv_reg15;
		S_AXI_RDATA16<=slv_reg16;
		S_AXI_RDATA17<=slv_reg17;
		S_AXI_RDATA18<=slv_reg18;
		S_AXI_RDATA19<=slv_reg19;
		
		S_AXI_RDATA20<=slv_reg20;
		S_AXI_RDATA21<=slv_reg21;
		S_AXI_RDATA22<=slv_reg22;
		S_AXI_RDATA23<=slv_reg23;
		S_AXI_RDATA24<=slv_reg24;
		S_AXI_RDATA25<=slv_reg25;
		S_AXI_RDATA26<=slv_reg26;
		S_AXI_RDATA27<=slv_reg27;
		S_AXI_RDATA28<=slv_reg28;
		S_AXI_RDATA29<=slv_reg29;
		
		S_AXI_RDATA30<=slv_reg30;
		S_AXI_RDATA31<=slv_reg31;
		S_AXI_RDATA32<=slv_reg32;
		S_AXI_RDATA33<=slv_reg33;
		S_AXI_RDATA34<=slv_reg34;
		S_AXI_RDATA35<=slv_reg35;
		S_AXI_RDATA36<=slv_reg36;
		S_AXI_RDATA37<=slv_reg37;
		S_AXI_RDATA38<=slv_reg38;
		S_AXI_RDATA39<=slv_reg39;
		
		S_AXI_RDATA40<=slv_reg40;
		S_AXI_RDATA41<=slv_reg41;
		S_AXI_RDATA42<=slv_reg42;
		S_AXI_RDATA43<=slv_reg43;
		S_AXI_RDATA44<=slv_reg44;
		S_AXI_RDATA45<=slv_reg45;
		S_AXI_RDATA46<=slv_reg46;
		S_AXI_RDATA47<=slv_reg47;
		S_AXI_RDATA48<=slv_reg48;
		S_AXI_RDATA49<=slv_reg49;
		
		S_AXI_RDATA50<=slv_reg50;
		S_AXI_RDATA51<=slv_reg51;
		S_AXI_RDATA52<=slv_reg52;
		S_AXI_RDATA53<=slv_reg53;
		S_AXI_RDATA54<=slv_reg54;
		S_AXI_RDATA55<=slv_reg55;
		S_AXI_RDATA56<=slv_reg56;
		S_AXI_RDATA57<=slv_reg57;
		S_AXI_RDATA58<=slv_reg58;
		S_AXI_RDATA59<=slv_reg59;
		
		S_AXI_RDATA60<=slv_reg60;
		S_AXI_RDATA61<=slv_reg61;
		S_AXI_RDATA62<=slv_reg62;
		S_AXI_RDATA63<=slv_reg63;
	end
	
endmodule
