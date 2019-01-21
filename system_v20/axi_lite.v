`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/25 17:17:34
// Design Name: 
// Module Name: axi_lite
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


module axi_lite(
	input			rst_n,
	input			clk_ps,
	
	output			ps_ddr_busy		,
	input			ps_ddr_wr_start	,	
	input	[31:0]	ps_ddr_wr_addr	,		
	input	[31:0]	ps_ddr_wr_length,		
	input			ps_ddr_wr_en	,	
	input	[31:0]	ps_ddr_wr_data	,		
	output			ps_ddr_wr_finish,

	input			ps_ddr_rd_start	,	
	input	[31:0]	ps_ddr_rd_addr	,		
	input	[31:0]	ps_ddr_rd_length,		
	output			ps_ddr_rd_en	,	
	output	[31:0]	ps_ddr_rd_data	,	
	output			ps_ddr_rd_finish,	
	//m_axi_s2mm
	input			m_axi_s2mm_awready,
	input	[1:0]	m_axi_s2mm_bresp,
	input			m_axi_s2mm_bvalid,
	input			m_axi_s2mm_wready,	
	
	output	[31:0]	m_axi_s2mm_awaddr ,
	output	[1:0]	m_axi_s2mm_awburst,
	output	[3:0]	m_axi_s2mm_awcache,
	output	[3:0]	m_axi_s2mm_awid   ,
	output	[7:0]	m_axi_s2mm_awlen  ,
	output	[2:0]	m_axi_s2mm_awprot ,
	output	[2:0]	m_axi_s2mm_awsize ,
	output	[3:0]	m_axi_s2mm_awuser ,
	output			m_axi_s2mm_awvalid,
	output			m_axi_s2mm_bready ,
	output	[63:0]	m_axi_s2mm_wdata  ,
	output			m_axi_s2mm_wlast  ,
	output	[7:0]	m_axi_s2mm_wstrb  ,
	output			m_axi_s2mm_wvalid ,
	
	//m_axi_mm2s
	input			m_axi_mm2s_arready,
	input	[63:0]	m_axi_mm2s_rdata,
	input			m_axi_mm2s_rlast,
	input	[1:0]	m_axi_mm2s_rresp,
	input			m_axi_mm2s_rvalid,

	output	[31:0]	m_axi_mm2s_araddr ,
	output	[1:0]	m_axi_mm2s_arburst,
	output	[3:0]	m_axi_mm2s_arcache,
	output	[3:0]	m_axi_mm2s_arid,
	output	[7:0]	m_axi_mm2s_arlen,
	output	[2:0]	m_axi_mm2s_arprot,
	output	[2:0]	m_axi_mm2s_arsize,
	output	[3:0]	m_axi_mm2s_aruser,
	output			m_axi_mm2s_arvalid,
	output			m_axi_mm2s_rready
    );
	
	wire			s_axis_mm2s_cmd_tvalid	;	
	wire			s_axis_mm2s_cmd_tready	;	
	wire	[71:0]	s_axis_mm2s_cmd_tdata	;	
	
	wire			m_axis_mm2s_tready		;
	wire	[31:0]	m_axis_mm2s_tdata		;
	wire	[3:0]	m_axis_mm2s_tkeep		;
	wire			m_axis_mm2s_tlast		;
	wire			m_axis_mm2s_tvalid		;
	
	
	wire			s_axis_s2mm_cmd_tready	;
	wire			s_axis_s2mm_cmd_tvalid	;
	wire	[71:0]	s_axis_s2mm_cmd_tdata	;
	
	wire			s_axis_s2mm_tready		;
	wire			s_axis_s2mm_tlast		;
	wire			s_axis_s2mm_tvalid		;
	wire	[7:0]	s_axis_s2mm_tkeep		;
	wire	[63:0]	s_axis_s2mm_tdata		;
	
	wire	[7:0]	m_axis_mm2s_sts_tdata;
	wire	[0:0]	m_axis_mm2s_sts_tkeep;
	wire			m_axis_mm2s_sts_tlast;	
	wire			m_axis_mm2s_sts_tvalid;	
	wire			m_axis_mm2s_sts_tready;	
	wire			mm2s_pass;    
	wire			mm2s_fail;    
	wire	[3:0]	read_tag;     
	wire			read_fail_ack;
	
	wire			m_axis_s2mm_sts_tvalid;
	wire			m_axis_s2mm_sts_tready;
	wire	[7:0] 	m_axis_s2mm_sts_tdata ;
	wire	[0:0] 	m_axis_s2mm_sts_tkeep ;
	wire	      	m_axis_s2mm_sts_tlast ;
	wire			s2mm_pass;     
	wire			s2mm_fail;     
	wire	[3:0]	s2mm_tag;      
	wire			write_fail_ack;

	assign ps_ddr_busy = s_axis_s2mm_cmd_tready;
	assign ps_ddr_wr_finish = s_axis_s2mm_tlast;
	assign ps_ddr_rd_finish = m_axis_mm2s_tlast;
	
	wr_ps_ddr3 wr_ps_ddr3_inst(
		.rst							(~rst_n					),
		.clk_ps							(clk_ps					),
		.ps_ddr_wr_start				(ps_ddr_wr_start		),
		.ps_ddr_wr_addr					(ps_ddr_wr_addr			),
		.ps_ddr_wr_length				(ps_ddr_wr_length		),
		.ps_ddr_wr_en					(ps_ddr_wr_en			),
		.ps_ddr_wr_data					(ps_ddr_wr_data			),
		.s_axis_s2mm_cmd_tready			(s_axis_s2mm_cmd_tready	),
		.s_axis_s2mm_cmd_tvalid			(s_axis_s2mm_cmd_tvalid	),
		.s_axis_s2mm_cmd_tdata			(s_axis_s2mm_cmd_tdata	),
		.s_axis_s2mm_tready				(s_axis_s2mm_tready		),
		.s_axis_s2mm_tdata				(s_axis_s2mm_tdata		),
		.s_axis_s2mm_tkeep				(s_axis_s2mm_tkeep		),
		.s_axis_s2mm_tlast				(s_axis_s2mm_tlast		),
		.s_axis_s2mm_tvalid				(s_axis_s2mm_tvalid		)
    );
	
	rd_ps_ddr3 rd_ps_ddr3_inst(
		.rst							(~rst_n					),
		.clk_ps							(clk_ps					),
		.ps_ddr_rd_start				(ps_ddr_rd_start		),
		.ps_ddr_rd_addr					(ps_ddr_rd_addr			),
		.ps_ddr_rd_length				(ps_ddr_rd_length		),
		.ps_ddr_rd_en					(ps_ddr_rd_en			),
		.ps_ddr_rd_data					(ps_ddr_rd_data			),
		.s_axis_mm2s_cmd_tready			(s_axis_mm2s_cmd_tready	),
		.s_axis_mm2s_cmd_tvalid			(s_axis_mm2s_cmd_tvalid	),
		.s_axis_mm2s_cmd_tdata			(s_axis_mm2s_cmd_tdata	),
		.m_axis_mm2s_tlast				(m_axis_mm2s_tlast		),
		.m_axis_mm2s_tvalid				(m_axis_mm2s_tvalid		),
		.m_axis_mm2s_tkeep				(m_axis_mm2s_tkeep		),
		.m_axis_mm2s_tdata				(m_axis_mm2s_tdata		),
		.m_axis_mm2s_tready				(m_axis_mm2s_tready		)
    );
	
	axi_datamover_0 axi_datamover_0_inst(	
		.m_axi_mm2s_aclk				(clk_ps						),
		.m_axi_mm2s_aresetn				(rst_n						),
		.mm2s_err						(							),
		
		.m_axis_mm2s_cmdsts_aclk		(clk_ps						),
		.m_axis_mm2s_cmdsts_aresetn		(rst_n						),
		
		.s_axis_mm2s_cmd_tvalid			(s_axis_mm2s_cmd_tvalid		),
		.s_axis_mm2s_cmd_tready			(s_axis_mm2s_cmd_tready		),
		.s_axis_mm2s_cmd_tdata			(s_axis_mm2s_cmd_tdata		),
		
		.m_axis_mm2s_sts_tvalid			(m_axis_mm2s_sts_tvalid		),
		.m_axis_mm2s_sts_tready			(m_axis_mm2s_sts_tready		),
		.m_axis_mm2s_sts_tdata			(m_axis_mm2s_sts_tdata		),
		.m_axis_mm2s_sts_tkeep			(m_axis_mm2s_sts_tkeep		),
		.m_axis_mm2s_sts_tlast			(m_axis_mm2s_sts_tlast		),
		
		.m_axi_mm2s_arid				(m_axi_mm2s_arid			),
		.m_axi_mm2s_araddr				(m_axi_mm2s_araddr			),
		.m_axi_mm2s_arlen				(m_axi_mm2s_arlen			),
		.m_axi_mm2s_arsize				(m_axi_mm2s_arsize			),
		.m_axi_mm2s_arburst				(m_axi_mm2s_arburst			),
		.m_axi_mm2s_arprot				(m_axi_mm2s_arprot			),
		.m_axi_mm2s_arcache				(m_axi_mm2s_arcache			),
		.m_axi_mm2s_aruser				(m_axi_mm2s_aruser			),
		.m_axi_mm2s_arvalid				(m_axi_mm2s_arvalid			),
		.m_axi_mm2s_arready				(m_axi_mm2s_arready			),
		.m_axi_mm2s_rdata				(m_axi_mm2s_rdata			),
		.m_axi_mm2s_rresp				(m_axi_mm2s_rresp			),
		.m_axi_mm2s_rlast				(m_axi_mm2s_rlast			),
		.m_axi_mm2s_rvalid				(m_axi_mm2s_rvalid			),
		.m_axi_mm2s_rready				(m_axi_mm2s_rready			),
		
		.m_axis_mm2s_tdata				(m_axis_mm2s_tdata			),
		.m_axis_mm2s_tkeep				(m_axis_mm2s_tkeep			),
		.m_axis_mm2s_tlast				(m_axis_mm2s_tlast			),
		.m_axis_mm2s_tvalid				(m_axis_mm2s_tvalid			),
		.m_axis_mm2s_tready				(m_axis_mm2s_tready			),
		.m_axi_s2mm_aclk				(clk_ps						),
		.m_axi_s2mm_aresetn				(rst_n						),
		.s2mm_err						(							),
		.m_axis_s2mm_cmdsts_awclk		(clk_ps						),
		.m_axis_s2mm_cmdsts_aresetn		(rst_n						),
		
		.s_axis_s2mm_cmd_tvalid			(s_axis_s2mm_cmd_tvalid		),
		.s_axis_s2mm_cmd_tready			(s_axis_s2mm_cmd_tready		),
		.s_axis_s2mm_cmd_tdata			(s_axis_s2mm_cmd_tdata		),
		
		.m_axis_s2mm_sts_tvalid			(m_axis_s2mm_sts_tvalid		),
		.m_axis_s2mm_sts_tready			(m_axis_s2mm_sts_tready		),
		.m_axis_s2mm_sts_tdata			(m_axis_s2mm_sts_tdata		),
		.m_axis_s2mm_sts_tkeep			(m_axis_s2mm_sts_tkeep		),
		.m_axis_s2mm_sts_tlast			(m_axis_s2mm_sts_tlast		),
		
		.m_axi_s2mm_awid				(m_axi_s2mm_awid			),
		.m_axi_s2mm_awaddr				(m_axi_s2mm_awaddr			),
		.m_axi_s2mm_awlen				(m_axi_s2mm_awlen			),
		.m_axi_s2mm_awsize				(m_axi_s2mm_awsize			),
		.m_axi_s2mm_awburst				(m_axi_s2mm_awburst			),
		.m_axi_s2mm_awprot				(m_axi_s2mm_awprot			),
		.m_axi_s2mm_awcache				(m_axi_s2mm_awcache			),
		.m_axi_s2mm_awuser				(m_axi_s2mm_awuser			),
		.m_axi_s2mm_awvalid				(m_axi_s2mm_awvalid			),
		.m_axi_s2mm_awready				(m_axi_s2mm_awready			),
		.m_axi_s2mm_wdata				(m_axi_s2mm_wdata			),
		.m_axi_s2mm_wstrb				(m_axi_s2mm_wstrb			),
		.m_axi_s2mm_wlast				(m_axi_s2mm_wlast			),
		.m_axi_s2mm_wvalid				(m_axi_s2mm_wvalid			),
		.m_axi_s2mm_wready				(m_axi_s2mm_wready			),
		.m_axi_s2mm_bresp				(m_axi_s2mm_bresp			),
		.m_axi_s2mm_bvalid				(m_axi_s2mm_bvalid			),
		.m_axi_s2mm_bready				(m_axi_s2mm_bready			),
		
		.s_axis_s2mm_tdata				(s_axis_s2mm_tdata			),
		.s_axis_s2mm_tkeep				(s_axis_s2mm_tkeep			),
		.s_axis_s2mm_tlast				(s_axis_s2mm_tlast			),
		.s_axis_s2mm_tvalid				(s_axis_s2mm_tvalid			),
		.s_axis_s2mm_tready				(s_axis_s2mm_tready			)
	);
	
	s2mm_sts_monitor write_status_monitor (
		.s_axi_clk			(clk_ps), 
		.s_axi_resetn		(rst_n), 
		.s_axis_tdata		(m_axis_s2mm_sts_tdata), 
		.s_axis_tvalid		(m_axis_s2mm_sts_tvalid), 
		.s_axis_tkeep		(m_axis_s2mm_sts_tkeep), 
		.s_axis_tlast		(m_axis_s2mm_sts_tlast), 
		.m_axis_tready		(m_axis_s2mm_sts_tready), 
		.pass				(s2mm_pass       ), 
		.fail				(s2mm_fail      ), 
		.tag				(s2mm_tag        ),
		.ack 				(write_fail_ack )
    );
	
	mm2s_sts_monitor read_status_monitor (
		.s_axi_clk			(clk_ps), 
		.s_axi_resetn		(rst_n), 
		.s_axis_tdata 		(m_axis_mm2s_sts_tdata), 
		.s_axis_tvalid		(m_axis_mm2s_sts_tvalid),
		.s_axis_tkeep 		(m_axis_mm2s_sts_tkeep), 
		.s_axis_tlast 		(m_axis_mm2s_sts_tlast), 
		.m_axis_tready		(m_axis_mm2s_sts_tready), 
		.pass				(mm2s_pass), 
		.fail				(mm2s_fail), 
		.tag				(read_tag),
		.ack 				(read_fail_ack)
	); 
	
endmodule
