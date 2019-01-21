`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/29 17:20:59
// Design Name: 
// Module Name: pl_ddr3_top
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


module pl_ddr3_top(
	input			sys_rst		,	//系统复位
	input			sys_clk		,	//系统时钟，给PL端DDR3的时钟，200M
	output			user_clk	,	//PL端DDR3给出的用户时钟
	output			user_rst	,	//PL端DDR3给出的用户复位
	
	output			pl_ddr_busy			,
	//write control
	input			pl_ddr_wr_start		,
	input	[31:0]	pl_ddr_wr_addr		,
	input	[31:0]	pl_ddr_wr_length	,
	input			pl_ddr_wr_en		,
	input	[31:0]	pl_ddr_wr_data		,
	output			pl_ddr_wr_finish	,
	//read control
	input			pl_ddr_rd_start		,
	input	[31:0]	pl_ddr_rd_addr		,
	input	[31:0]	pl_ddr_rd_length	,
	output			pl_ddr_rd_en		,
	output	[31:0]	pl_ddr_rd_data		,
	output			pl_ddr_rd_finish	,
	
	output			ddr3_ck_n	,
	output			ddr3_ck_p	,
	output			ddr3_reset_n,
	output			ddr3_cke	,
	output			ddr3_cs_n	,
	output			ddr3_we_n	,
	output			ddr3_cas_n	,
	output			ddr3_ras_n	,
	output			ddr3_odt	,
	output	[2:0]	ddr3_ba		,
	output	[3:0]	ddr3_dm		,
	output	[14:0]	ddr3_addr	,
	inout	[31:0]	ddr3_dq		,
	inout	[3:0]	ddr3_dqs_n	,
	inout	[3:0]	ddr3_dqs_p	
    );
	
	//rd_cmd signals
	wire			s_axis_mm2s_cmd_tvalid	;	
	wire			s_axis_mm2s_cmd_tready	;	
	wire	[71:0]	s_axis_mm2s_cmd_tdata	;	
	//rd_data signals
	wire			m_axis_mm2s_tready		;
	wire	[31:0]	m_axis_mm2s_tdata		;
	wire	[3:0]	m_axis_mm2s_tkeep		;
	wire			m_axis_mm2s_tlast		;
	wire			m_axis_mm2s_tvalid		;
	//rd_monitor signals
	wire	[7:0]	m_axis_mm2s_sts_tdata	;
	wire	[0:0]	m_axis_mm2s_sts_tkeep	;
	wire			m_axis_mm2s_sts_tlast	;	
	wire			m_axis_mm2s_sts_tvalid	;	
	wire			m_axis_mm2s_sts_tready	;	
	
	//wr_cmd signals
	wire			s_axis_s2mm_cmd_tready	;
	wire			s_axis_s2mm_cmd_tvalid	;
	wire	[71:0]	s_axis_s2mm_cmd_tdata	;
	//wr_data signals
	wire			s_axis_s2mm_tready		;
	wire			s_axis_s2mm_tlast		;
	wire			s_axis_s2mm_tvalid		;
	wire	[3:0]	s_axis_s2mm_tkeep		;
	wire	[31:0]	s_axis_s2mm_tdata		;
	//wr_monitor signals
	wire			m_axis_s2mm_sts_tvalid	;
	wire			m_axis_s2mm_sts_tready	;
	wire	[7:0] 	m_axis_s2mm_sts_tdata 	;
	wire	[0:0] 	m_axis_s2mm_sts_tkeep 	;
	wire	      	m_axis_s2mm_sts_tlast 	;
	
	//axi_lite signals
	wire			m_axi_s2mm_bready 		;
	wire	[1:0]	m_axi_s2mm_bresp		;
	wire			m_axi_s2mm_bvalid		;
	wire			m_axi_s2mm_awready		;
	wire	[31:0]	m_axi_s2mm_awaddr 		;
	wire	[1:0]	m_axi_s2mm_awburst		;
	wire	[3:0]	m_axi_s2mm_awcache		;
	wire	[3:0]	m_axi_s2mm_awid   		;
	wire	[7:0]	m_axi_s2mm_awlen  		;
	wire	[2:0]	m_axi_s2mm_awprot 		;
	wire	[2:0]	m_axi_s2mm_awsize 		;
	wire	[3:0]	m_axi_s2mm_awuser 		;
	wire			m_axi_s2mm_awvalid		;
	wire			m_axi_s2mm_wready		;
	wire	[127:0]	m_axi_s2mm_wdata  		;
	wire			m_axi_s2mm_wlast  		;
	wire	[15:0]	m_axi_s2mm_wstrb  		;
	wire			m_axi_s2mm_wvalid 		;
	wire			m_axi_mm2s_rready		;
	wire	[127:0]	m_axi_mm2s_rdata		;
	wire			m_axi_mm2s_rlast		;
	wire	[1:0]	m_axi_mm2s_rresp		;
	wire			m_axi_mm2s_rvalid		;
	wire			m_axi_mm2s_arready		;
	wire	[31:0]	m_axi_mm2s_araddr 		;
	wire	[1:0]	m_axi_mm2s_arburst		;
	wire	[3:0]	m_axi_mm2s_arcache		;
	wire	[3:0]	m_axi_mm2s_arid			;
	wire	[7:0]	m_axi_mm2s_arlen		;
	wire	[2:0]	m_axi_mm2s_arprot		;
	wire	[2:0]	m_axi_mm2s_arsize		;
	wire	[3:0]	m_axi_mm2s_aruser		;
	wire			m_axi_mm2s_arvalid		;
	wire			ddr3_init_complet		;
	
	assign pl_ddr_busy = ~(ddr3_init_complet && s_axis_s2mm_cmd_tready && s_axis_mm2s_cmd_tready);
	assign pl_ddr_wr_finish = s_axis_s2mm_tlast;
	assign pl_ddr_rd_finish = m_axis_mm2s_tlast;
	
	assign m_axis_s2mm_sts_tready = 1'b1;
	assign m_axis_mm2s_sts_tready = 1'b1;
	
	wr_pl_ddr3 wr_pl_ddr3_inst(
		.clk					(user_clk				),
		.rst					(user_rst				),
		.ddr3_init_complet		(ddr3_init_complet		),
		.pl_ddr_wr_start		(pl_ddr_wr_start		),
		.pl_ddr_wr_addr			(pl_ddr_wr_addr			),
		.pl_ddr_wr_length		(pl_ddr_wr_length		),
		.pl_ddr_wr_en			(pl_ddr_wr_en			),
		.pl_ddr_wr_data			(pl_ddr_wr_data			),
		.s_axis_s2mm_cmd_tready	(s_axis_s2mm_cmd_tready	),
		.s_axis_s2mm_cmd_tvalid	(s_axis_s2mm_cmd_tvalid	),
		.s_axis_s2mm_cmd_tdata	(s_axis_s2mm_cmd_tdata	),
		.s_axis_s2mm_tready		(s_axis_s2mm_tready		),
		.s_axis_s2mm_tdata		(s_axis_s2mm_tdata		),
		.s_axis_s2mm_tkeep		(s_axis_s2mm_tkeep		),
		.s_axis_s2mm_tlast		(s_axis_s2mm_tlast		),
		.s_axis_s2mm_tvalid		(s_axis_s2mm_tvalid		)
    );

	rd_pl_ddr3 rd_pl_ddr3_inst(
		.clk					(user_clk				),
		.rst					(user_rst				),
		.ddr3_init_complet		(ddr3_init_complet		),
		.pl_ddr_rd_start		(pl_ddr_rd_start		),
		.pl_ddr_rd_addr			(pl_ddr_rd_addr			),
		.pl_ddr_rd_length		(pl_ddr_rd_length		),
		.pl_ddr_rd_en			(pl_ddr_rd_en			),
		.pl_ddr_rd_data			(pl_ddr_rd_data			),
		.s_axis_mm2s_cmd_tready	(s_axis_mm2s_cmd_tready	),
		.s_axis_mm2s_cmd_tvalid	(s_axis_mm2s_cmd_tvalid	),
		.s_axis_mm2s_cmd_tdata	(s_axis_mm2s_cmd_tdata	),
		.m_axis_mm2s_tlast		(m_axis_mm2s_tlast		),
		.m_axis_mm2s_tvalid		(m_axis_mm2s_tvalid		),
		.m_axis_mm2s_tkeep		(m_axis_mm2s_tkeep		),
		.m_axis_mm2s_tdata		(m_axis_mm2s_tdata		),
		.m_axis_mm2s_tready		(m_axis_mm2s_tready		)
    );
	
	mig_7series_0 mig_7series_0_inst (
		// Memory interface ports
		.ddr3_addr                      (ddr3_addr),  // output [14:0]		ddr3_addr
		.ddr3_ba                        (ddr3_ba),  // output [2:0]		ddr3_ba
		.ddr3_cas_n                     (ddr3_cas_n),  // output			ddr3_cas_n
		.ddr3_ck_n                      (ddr3_ck_n),  // output [0:0]		ddr3_ck_n
		.ddr3_ck_p                      (ddr3_ck_p),  // output [0:0]		ddr3_ck_p
		.ddr3_cke                       (ddr3_cke),  // output [0:0]		ddr3_cke
		.ddr3_ras_n                     (ddr3_ras_n),  // output			ddr3_ras_n
		.ddr3_reset_n                   (ddr3_reset_n),  // output			ddr3_reset_n
		.ddr3_we_n                      (ddr3_we_n),  // output			ddr3_we_n
		.ddr3_dq                        (ddr3_dq),  // inout [31:0]		ddr3_dq
		.ddr3_dqs_n                     (ddr3_dqs_n),  // inout [3:0]		ddr3_dqs_n
		.ddr3_dqs_p                     (ddr3_dqs_p),  // inout [3:0]		ddr3_dqs_p
		.init_calib_complete            (ddr3_init_complet),  // output			init_calib_complete
		.device_temp					(),
		.ddr3_cs_n                      (ddr3_cs_n),  // output [0:0]		ddr3_cs_n
		.ddr3_dm                        (ddr3_dm),  // output [3:0]		ddr3_dm
		.ddr3_odt                       (ddr3_odt),  // output [0:0]		ddr3_odt
		// Application interface ports
		.ui_clk                         (user_clk),  // output			ui_clk
		.ui_clk_sync_rst                (user_rst),  // output			ui_clk_sync_rst
		.mmcm_locked                    (),  // output			mmcm_locked
		.aresetn                        (~sys_rst),  // input			aresetn
		.app_sr_req                     (1'b0),  // input			app_sr_req
		.app_ref_req                    (1'b0),  // input			app_ref_req
		.app_zq_req                     (1'b0),  // input			app_zq_req
		.app_sr_active                  (),  // output			app_sr_active
		.app_ref_ack                    (),  // output			app_ref_ack
		.app_zq_ack                     (),  // output			app_zq_ack
		// Slave Interface Write Address Ports
		.s_axi_awid                     (m_axi_s2mm_awid),  // input [3:0]			s_axi_awid
		.s_axi_awaddr                   (m_axi_s2mm_awaddr[29:0]),  // input [29:0]			s_axi_awaddr
		.s_axi_awlen                    (m_axi_s2mm_awlen),  // input [7:0]			s_axi_awlen
		.s_axi_awsize                   (m_axi_s2mm_awsize),  // input [2:0]			s_axi_awsize
		.s_axi_awburst                  (m_axi_s2mm_awburst),  // input [1:0]			s_axi_awburst
		.s_axi_awlock                   (1'b0),  // input [0:0]			s_axi_awlock
		.s_axi_awcache                  (m_axi_s2mm_awcache),  // input [3:0]			s_axi_awcache
		.s_axi_awprot                   (m_axi_s2mm_awprot),  // input [2:0]			s_axi_awprot
		.s_axi_awqos                    (m_axi_s2mm_awuser),  // input [3:0]			s_axi_awqos
		.s_axi_awvalid                  (m_axi_s2mm_awvalid),  // input			s_axi_awvalid
		.s_axi_awready                  (m_axi_s2mm_awready),  // output			s_axi_awready
		// Slave Interface Write Data Ports
		.s_axi_wdata                    (m_axi_s2mm_wdata),  // input [255:0]			s_axi_wdata
		.s_axi_wstrb                    (m_axi_s2mm_wstrb),  // input [31:0]			s_axi_wstrb
		.s_axi_wlast                    (m_axi_s2mm_wlast),  // input			s_axi_wlast
		.s_axi_wvalid                   (m_axi_s2mm_wvalid),  // input			s_axi_wvalid
		.s_axi_wready                   (m_axi_s2mm_wready),  // output			s_axi_wready
		// Slave Interface Write Response Ports
		.s_axi_bid                      (),  // output [3:0]			s_axi_bid
		.s_axi_bresp                    (m_axi_s2mm_bresp),  // output [1:0]			s_axi_bresp
		.s_axi_bvalid                   (m_axi_s2mm_bvalid),  // output			s_axi_bvalid
		.s_axi_bready                   (m_axi_s2mm_bready),  // input			s_axi_bready
		// Slave Interface Read Address Ports
		.s_axi_arid                     (m_axi_mm2s_arid),  // input [3:0]			s_axi_arid
		.s_axi_araddr                   (m_axi_mm2s_araddr[29:0]),  // input [29:0]			s_axi_araddr
		.s_axi_arlen                    (m_axi_mm2s_arlen),  // input [7:0]			s_axi_arlen
		.s_axi_arsize                   (m_axi_mm2s_arsize),  // input [2:0]			s_axi_arsize
		.s_axi_arburst                  (m_axi_mm2s_arburst),  // input [1:0]			s_axi_arburst
		.s_axi_arlock                   (1'b0),  // input [0:0]			s_axi_arlock
		.s_axi_arcache                  (m_axi_mm2s_arcache),  // input [3:0]			s_axi_arcache
		.s_axi_arprot                   (m_axi_mm2s_arprot),  // input [2:0]			s_axi_arprot
		.s_axi_arqos                    (m_axi_mm2s_aruser),  // input [3:0]			s_axi_arqos
		.s_axi_arvalid                  (m_axi_mm2s_arvalid),  // input			s_axi_arvalid
		.s_axi_arready                  (m_axi_mm2s_arready),  // output			s_axi_arready
		// Slave Interface Read Data Ports
		.s_axi_rid                      (),  // output [3:0]			s_axi_rid
		.s_axi_rdata                    (m_axi_mm2s_rdata),  // output [255:0]			s_axi_rdata
		.s_axi_rresp                    (m_axi_mm2s_rresp),  // output [1:0]			s_axi_rresp
		.s_axi_rlast                    (m_axi_mm2s_rlast),  // output			s_axi_rlast
		.s_axi_rvalid                   (m_axi_mm2s_rvalid),  // output			s_axi_rvalid
		.s_axi_rready                   (m_axi_mm2s_rready),  // input			s_axi_rready
		// System Clock Ports
		.sys_clk_i                      (sys_clk),
		.sys_rst                        (sys_rst) // input sys_rst
    );
	
	axi_datamover_1 axi_datamover_1_inst(	
		.m_axi_mm2s_aclk			(user_clk				),
		.m_axi_mm2s_aresetn			(~user_rst				),
		.mm2s_err					(						),
		
		.m_axis_mm2s_cmdsts_aclk	(user_clk				),
		.m_axis_mm2s_cmdsts_aresetn	(~user_rst				),
		
		.s_axis_mm2s_cmd_tvalid		(s_axis_mm2s_cmd_tvalid	),
		.s_axis_mm2s_cmd_tready		(s_axis_mm2s_cmd_tready	),
		.s_axis_mm2s_cmd_tdata		(s_axis_mm2s_cmd_tdata	),
		
		.m_axis_mm2s_sts_tvalid		(m_axis_mm2s_sts_tvalid	),
		.m_axis_mm2s_sts_tready		(m_axis_mm2s_sts_tready	),
		.m_axis_mm2s_sts_tdata		(m_axis_mm2s_sts_tdata	),
		.m_axis_mm2s_sts_tkeep		(m_axis_mm2s_sts_tkeep	),
		.m_axis_mm2s_sts_tlast		(m_axis_mm2s_sts_tlast	),
		
		.m_axi_mm2s_arid			(m_axi_mm2s_arid		),
		.m_axi_mm2s_araddr			(m_axi_mm2s_araddr		),
		.m_axi_mm2s_arlen			(m_axi_mm2s_arlen		),
		.m_axi_mm2s_arsize			(m_axi_mm2s_arsize		),
		.m_axi_mm2s_arburst			(m_axi_mm2s_arburst		),
		.m_axi_mm2s_arprot			(m_axi_mm2s_arprot		),
		.m_axi_mm2s_arcache			(m_axi_mm2s_arcache		),
		.m_axi_mm2s_aruser			(m_axi_mm2s_aruser		),
		.m_axi_mm2s_arvalid			(m_axi_mm2s_arvalid		),
		.m_axi_mm2s_arready			(m_axi_mm2s_arready		),
		.m_axi_mm2s_rdata			(m_axi_mm2s_rdata		),
		.m_axi_mm2s_rresp			(m_axi_mm2s_rresp		),
		.m_axi_mm2s_rlast			(m_axi_mm2s_rlast		),
		.m_axi_mm2s_rvalid			(m_axi_mm2s_rvalid		),
		.m_axi_mm2s_rready			(m_axi_mm2s_rready		),
		
		.m_axis_mm2s_tdata			(m_axis_mm2s_tdata		),
		.m_axis_mm2s_tkeep			(m_axis_mm2s_tkeep		),
		.m_axis_mm2s_tlast			(m_axis_mm2s_tlast		),
		.m_axis_mm2s_tvalid			(m_axis_mm2s_tvalid		),
		.m_axis_mm2s_tready			(m_axis_mm2s_tready		),
		.m_axi_s2mm_aclk			(user_clk				),
		.m_axi_s2mm_aresetn			(~user_rst				),
		.s2mm_err					(						),
		.m_axis_s2mm_cmdsts_awclk	(user_clk				),
		.m_axis_s2mm_cmdsts_aresetn	(~user_rst				),
		
		.s_axis_s2mm_cmd_tvalid		(s_axis_s2mm_cmd_tvalid	),
		.s_axis_s2mm_cmd_tready		(s_axis_s2mm_cmd_tready	),
		.s_axis_s2mm_cmd_tdata		(s_axis_s2mm_cmd_tdata	),
		
		.m_axis_s2mm_sts_tvalid		(m_axis_s2mm_sts_tvalid	),
		.m_axis_s2mm_sts_tready		(m_axis_s2mm_sts_tready	),
		.m_axis_s2mm_sts_tdata		(m_axis_s2mm_sts_tdata	),
		.m_axis_s2mm_sts_tkeep		(m_axis_s2mm_sts_tkeep	),
		.m_axis_s2mm_sts_tlast		(m_axis_s2mm_sts_tlast	),
		
		.m_axi_s2mm_awid			(m_axi_s2mm_awid		),
		.m_axi_s2mm_awaddr			(m_axi_s2mm_awaddr		),
		.m_axi_s2mm_awlen			(m_axi_s2mm_awlen		),
		.m_axi_s2mm_awsize			(m_axi_s2mm_awsize		),
		.m_axi_s2mm_awburst			(m_axi_s2mm_awburst		),
		.m_axi_s2mm_awprot			(m_axi_s2mm_awprot		),
		.m_axi_s2mm_awcache			(m_axi_s2mm_awcache		),
		.m_axi_s2mm_awuser			(m_axi_s2mm_awuser		),
		.m_axi_s2mm_awvalid			(m_axi_s2mm_awvalid		),
		.m_axi_s2mm_awready			(m_axi_s2mm_awready		),
		.m_axi_s2mm_wdata			(m_axi_s2mm_wdata		),
		.m_axi_s2mm_wstrb			(m_axi_s2mm_wstrb		),
		.m_axi_s2mm_wlast			(m_axi_s2mm_wlast		),
		.m_axi_s2mm_wvalid			(m_axi_s2mm_wvalid		),
		.m_axi_s2mm_wready			(m_axi_s2mm_wready		),
		.m_axi_s2mm_bresp			(m_axi_s2mm_bresp		),
		.m_axi_s2mm_bvalid			(m_axi_s2mm_bvalid		),
		.m_axi_s2mm_bready			(m_axi_s2mm_bready		),
		
		.s_axis_s2mm_tdata			(s_axis_s2mm_tdata		),
		.s_axis_s2mm_tkeep			(s_axis_s2mm_tkeep		),
		.s_axis_s2mm_tlast			(s_axis_s2mm_tlast		),
		.s_axis_s2mm_tvalid			(s_axis_s2mm_tvalid		),
		.s_axis_s2mm_tready			(s_axis_s2mm_tready		)
	);
	
endmodule
