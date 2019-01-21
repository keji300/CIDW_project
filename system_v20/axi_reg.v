`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/25 17:07:09
// Design Name: 
// Module Name: axi_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module axi_reg(
//	input			pl_tx_finish,
//	input	[31:0]	pl_tx_addr,
//	input	[31:0]	pl_tx_length,
//	output			ps_rx_finish,
	
//	input			pl_rx_finish,
//	input	[31:0]	pl_rx_cnt_error,
//	output			ps_tx_finish,
//	output	[31:0]	ps_tx_addr,
//	output	[31:0]	ps_tx_length,
input [79:0] fifo_state,
	input           ps_ddr_wr_start,
	input           ps_ddr_wr_en,
	input           ps_ddr_wr_finish,
	input      [31:0]     rd_cont,
	output			select,
	output			wd_en,
	output	[31:0]	start,
	input [31:0]   lvds_data        ,
	input         lvds_data_en     ,
	input    [31:0]      data2ps          ,
	input         valid2ps         ,
	input	  [1:0]			wt_ps_state,
	input     [31:0]         pl_ddr_w_addr,
	input     [31:0]         ps_ddr_w_addr,
	input 					wt_finish,
	input					s00_axi_aclk,
	input					s00_axi_aresetn,
	input	[7 : 0]			s00_axi_awaddr,
	input	[2 : 0]			s00_axi_awprot,
	input					s00_axi_awvalid,
	input	[32-1 : 0]		s00_axi_wdata,
	output					s00_axi_awready,
	input	[(32/8)-1 : 0]	s00_axi_wstrb,
	input					s00_axi_wvalid,
	output					s00_axi_wready,
	output	[1:0]			s00_axi_bresp,
	output					s00_axi_bvalid,
	input					s00_axi_bready,
	input	[7 : 0]			s00_axi_araddr,
	input	[2 : 0]			s00_axi_arprot,
	input					s00_axi_arvalid,
	output					s00_axi_arready,
	output	[32-1 : 0]		s00_axi_rdata,
	output	[1 : 0]			s00_axi_rresp,
	output					s00_axi_rvalid,
	input					s00_axi_rready
    );
	
	parameter VERSION = 32'D17;
	
	wire	[31:0]	rd_data00;
	wire	[31:0]	rd_data01;
	wire	[31:0]	rd_data02;
	wire	[31:0]	rd_data03;
	wire	[31:0]	rd_data04;
	wire	[31:0]	rd_data05;
	wire	[31:0]	rd_data06;
	wire	[31:0]	rd_data07;
	wire	[31:0]	rd_data08;
	wire	[31:0]	rd_data09;
	
	wire	[31:0]	rd_data10;
	wire	[31:0]	rd_data11;
	wire	[31:0]	rd_data12;
	wire	[31:0]	rd_data13;
	wire	[31:0]	rd_data14;
	wire	[31:0]	rd_data15;
	wire	[31:0]	rd_data16;
	wire	[31:0]	rd_data17;
	wire	[31:0]	rd_data18;
	wire	[31:0]	rd_data19;
	
	wire	[31:0]	rd_data20;
	wire	[31:0]	rd_data21;
	wire	[31:0]	rd_data22;
	wire	[31:0]	rd_data23;
	wire	[31:0]	rd_data24;
	wire	[31:0]	rd_data25;
	wire	[31:0]	rd_data26;
	wire	[31:0]	rd_data27;
	wire	[31:0]	rd_data28;
	wire	[31:0]	rd_data29;
	
	wire	[31:0]	rd_data30;
	wire	[31:0]	rd_data31;
	wire	[31:0]	rd_data32;
	wire	[31:0]	rd_data33;
	wire	[31:0]	rd_data34;
	wire	[31:0]	rd_data35;
	wire	[31:0]	rd_data36;
	wire	[31:0]	rd_data37;
	wire	[31:0]	rd_data38;
	wire	[31:0]	rd_data39;
	
	wire	[31:0]	rd_data40;
	wire	[31:0]	rd_data41;
	wire	[31:0]	rd_data42;
	wire	[31:0]	rd_data43;
	wire	[31:0]	rd_data44;
	wire	[31:0]	rd_data45;
	wire	[31:0]	rd_data46;
	wire	[31:0]	rd_data47;
	wire	[31:0]	rd_data48;
	wire	[31:0]	rd_data49;
	
	wire	[31:0]	rd_data50;
	wire	[31:0]	rd_data51;
	wire	[31:0]	rd_data52;
	wire	[31:0]	rd_data53;
	wire	[31:0]	rd_data54;
	wire	[31:0]	rd_data55;
	wire	[31:0]	rd_data56;
	wire	[31:0]	rd_data57;
	wire	[31:0]	rd_data58;
	wire	[31:0]	rd_data59;
	
	wire	[31:0]	rd_data60;
	wire	[31:0]	rd_data61;
	wire	[31:0]	rd_data62;
	wire	[31:0]	rd_data63;
	
	reg 	[31:0]	wr_data11;
	reg 	[31:0]	wr_data12;
	reg 	[31:0]	wr_data13;
	reg 	[31:0]	wr_data14;
	reg 	[31:0]	wr_data15;
	reg 	[31:0]	wr_data28;
	reg 	[31:0]	wr_data29;
	reg 	[31:0]	wr_data30;
	reg 	[31:0]	wr_data32;
	reg 	[31:0]	wr_data33;
	reg 	[31:0]	wr_data34;
	
	
	assign select = rd_data00[0];
	assign wd_en = rd_data01[0];
	assign start = rd_data02;
//	assign ps_rx_finish = rd_data05[0];
//	assign ps_tx_addr = rd_data08;
//	assign ps_tx_length = rd_data09;
//	assign ps_tx_finish = rd_data10;
	reg [31:0]wt00;
	always @ (posedge s00_axi_aclk)
	begin
		if (! s00_axi_aresetn)
		begin
			wt00 <= 0;
		end
		else
		begin
			if (wt_finish)
				wt00[0] <= 1;
			else if (wt00[0] )
				wt00[0] <= !rd_data05[0]; 
		end
	end
	reg lv_data_en;
	reg [31:0] lv_data_cont;
	always @  (posedge s00_axi_aclk or negedge s00_axi_aresetn)
	begin
		if (! s00_axi_aresetn)
		begin
			lv_data_en <= 0;
			lv_data_cont <= 0;
		end
		else
		begin
			lv_data_en <= lvds_data_en | lv_data_en;
			lv_data_cont <= lv_data_cont + lvds_data_en;
		end
	end
	reg [31:0] ps_wt_en_start;
	always @  (posedge s00_axi_aclk or negedge s00_axi_aresetn)
	begin
		if (! s00_axi_aresetn)
		begin
			ps_wt_en_start <= 0;
		end
		else
		begin
			ps_wt_en_start [0] <= ps_wt_en_start[0] | ps_ddr_wr_start;
			ps_wt_en_start [1] <= ps_wt_en_start[1] | ps_ddr_wr_en;
			ps_wt_en_start [2] <= ps_wt_en_start[2] | ps_ddr_wr_finish;
		end
	end
	myip_v1_0_S00_AXI myip_v1_0_S00_AXI_inst(
		.S_AXI_ACLK			(s00_axi_aclk),
		.S_AXI_ARESETN		(s00_axi_aresetn),
		.S_AXI_AWADDR		(s00_axi_awaddr),
		.S_AXI_AWPROT		(s00_axi_awprot),
		.S_AXI_AWVALID		(s00_axi_awvalid),
		.S_AXI_AWREADY		(s00_axi_awready),
		.S_AXI_WDATA		(s00_axi_wdata),
		
		.S_AXI_WDATA0		(rd_data00),
		.S_AXI_WDATA1		(rd_data01),
		.S_AXI_WDATA2		(rd_data02),		
		.S_AXI_WDATA3		(VERSION),
		
		.S_AXI_WDATA4		(wt00),
		.S_AXI_WDATA5		(rd_data05),
		.S_AXI_WDATA6		(rd_data06),		
		.S_AXI_WDATA7		(rd_data07),
		
		.S_AXI_WDATA8 		({30'b0,wt_ps_state}),
		.S_AXI_WDATA9 		(fifo_state[31:0]),
		.S_AXI_WDATA10		(fifo_state[63:32]),
		
		.S_AXI_WDATA11		(fifo_state[79:64]),
		.S_AXI_WDATA12		(rd_data12),		
		.S_AXI_WDATA13		(rd_data13),
		.S_AXI_WDATA14		(rd_data14),
		.S_AXI_WDATA15		(rd_data15),
		
		.S_AXI_WDATA16		(ps_wt_en_start),		
		.S_AXI_WDATA17		(rd_data17),	
		.S_AXI_WDATA18 		(rd_data18),
		.S_AXI_WDATA19 		(rd_data19),
		
		.S_AXI_WDATA20		(rd_data20),
		.S_AXI_WDATA21		(rd_data21),
		.S_AXI_WDATA22		(rd_data22),		
		.S_AXI_WDATA23		(rd_data23),
		
		.S_AXI_WDATA24		(rd_data24),
		.S_AXI_WDATA25		(rd_data25),
		.S_AXI_WDATA26		(rd_data26),		
		.S_AXI_WDATA27		(rd_data27),
		
		.S_AXI_WDATA28 		(rd_data28),
		.S_AXI_WDATA29 		(rd_data29),
		.S_AXI_WDATA30		(rd_data30),
		.S_AXI_WDATA31		(rd_data31),
		
		.S_AXI_WDATA32		(rd_data32),		
		.S_AXI_WDATA33		(rd_data33),
		.S_AXI_WDATA34		(rd_data34),
		.S_AXI_WDATA35		(rd_data35),
		
		.S_AXI_WDATA36		(rd_data36),		
		.S_AXI_WDATA37		(rd_data37),	
		.S_AXI_WDATA38 		(rd_data38),
		.S_AXI_WDATA39 		(rd_data39),
		
		.S_AXI_WDATA40		(rd_data40),
		.S_AXI_WDATA41		(rd_data41),
		.S_AXI_WDATA42		(rd_data42),		
		.S_AXI_WDATA43		(rd_data43),
		.S_AXI_WDATA44		(rd_data44),
		.S_AXI_WDATA45		(rd_data45),
		.S_AXI_WDATA46		(rd_data46),		
		.S_AXI_WDATA47		(rd_data47),
		
		.S_AXI_WDATA48 		(rd_data48),
		.S_AXI_WDATA49 		(rd_data49),
		.S_AXI_WDATA50		(rd_data50),
		.S_AXI_WDATA51		(rd_data51),
		.S_AXI_WDATA52		(rd_data52),		
		.S_AXI_WDATA53		(rd_data53),
		.S_AXI_WDATA54		(rd_data54),
		.S_AXI_WDATA55		(rd_data55),
		.S_AXI_WDATA56		(rd_data56),		
		.S_AXI_WDATA57		(rd_data57),	
		.S_AXI_WDATA58 		(rd_data58),
		.S_AXI_WDATA59 		(rd_data59),
		
		.S_AXI_WDATA60		(rd_data60),
		.S_AXI_WDATA61		(rd_data61),
		.S_AXI_WDATA62		(rd_data62),		
		.S_AXI_WDATA63		(rd_data63),
		
		.S_AXI_WSTRB		(s00_axi_wstrb),
		.S_AXI_WVALID		(s00_axi_wvalid),
		.S_AXI_WREADY		(s00_axi_wready),
		.S_AXI_BRESP		(s00_axi_bresp),
		.S_AXI_BVALID		(s00_axi_bvalid),
		.S_AXI_BREADY		(s00_axi_bready),
		.S_AXI_ARADDR		(s00_axi_araddr),
		.S_AXI_ARPROT		(s00_axi_arprot),
		.S_AXI_ARVALID		(s00_axi_arvalid),
		.S_AXI_ARREADY		(s00_axi_arready),
		.S_AXI_RDATA		(s00_axi_rdata),
		
		.S_AXI_RDATA0		(rd_data00),
		.S_AXI_RDATA1		(rd_data01),
		.S_AXI_RDATA2		(rd_data02),
		.S_AXI_RDATA3		(rd_data03),
		.S_AXI_RDATA4		(rd_data04),	
		.S_AXI_RDATA5		(rd_data05),			
		.S_AXI_RDATA6		(rd_data06),			
		.S_AXI_RDATA7		(rd_data07),			
		.S_AXI_RDATA8 		(rd_data08),			
		.S_AXI_RDATA9 		(rd_data09),		
		
		.S_AXI_RDATA10		(rd_data10),
		.S_AXI_RDATA11		(rd_data11),
		.S_AXI_RDATA12		(rd_data12),
		.S_AXI_RDATA13		(rd_data13),
		.S_AXI_RDATA14		(rd_data14),	
		.S_AXI_RDATA15		(rd_data15),			
		.S_AXI_RDATA16		(rd_data16),			
		.S_AXI_RDATA17		(rd_data17),			
		.S_AXI_RDATA18 		(rd_data18),			
		.S_AXI_RDATA19 		(rd_data19),
		
		.S_AXI_RDATA20		(rd_data20),
		.S_AXI_RDATA21		(rd_data21),
		.S_AXI_RDATA22		(rd_data22),
		.S_AXI_RDATA23		(rd_data23),
		.S_AXI_RDATA24		(rd_data24),	
		.S_AXI_RDATA25		(rd_data25),			
		.S_AXI_RDATA26		(rd_data26),			
		.S_AXI_RDATA27		(rd_data27),			
		.S_AXI_RDATA28 		(rd_data28),			
		.S_AXI_RDATA29 		(rd_data29),
		
		.S_AXI_RDATA30		(rd_data30),
		.S_AXI_RDATA31		(rd_data31),
		.S_AXI_RDATA32		(rd_data32),
		.S_AXI_RDATA33		(rd_data33),
		.S_AXI_RDATA34		(rd_data34),	
		.S_AXI_RDATA35		(rd_data35),			
		.S_AXI_RDATA36		(rd_data36),			
		.S_AXI_RDATA37		(rd_data37),			
		.S_AXI_RDATA38 		(rd_data38),			
		.S_AXI_RDATA39 		(rd_data39),
		
		.S_AXI_RDATA40		(rd_data40),
		.S_AXI_RDATA41		(rd_data41),
		.S_AXI_RDATA42		(rd_data42),
		.S_AXI_RDATA43		(rd_data43),
		.S_AXI_RDATA44		(rd_data44),	
		.S_AXI_RDATA45		(rd_data45),			
		.S_AXI_RDATA46		(rd_data46),			
		.S_AXI_RDATA47		(rd_data47),			
		.S_AXI_RDATA48 		(rd_data48),			
		.S_AXI_RDATA49 		(rd_data49),
		
		.S_AXI_RDATA50		(rd_data50),
		.S_AXI_RDATA51		(rd_data51),
		.S_AXI_RDATA52		(rd_data52),
		.S_AXI_RDATA53		(rd_data53),
		.S_AXI_RDATA54		(rd_data54),	
		.S_AXI_RDATA55		(rd_data55),			
		.S_AXI_RDATA56		(rd_data56),			
		.S_AXI_RDATA57		(rd_data57),			
		.S_AXI_RDATA58 		(rd_data58),			
		.S_AXI_RDATA59 		(rd_data59),
		
		.S_AXI_RDATA60		(rd_data60),
		.S_AXI_RDATA61		(rd_data61),
		.S_AXI_RDATA62		(rd_data62),
		.S_AXI_RDATA63		(rd_data63),
		
		.S_AXI_RRESP		(s00_axi_rresp),
		.S_AXI_RVALID		(s00_axi_rvalid),
		.S_AXI_RREADY		(s00_axi_rready)
	);
	
endmodule
