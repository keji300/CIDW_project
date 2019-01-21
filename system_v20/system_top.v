`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/19 14:22:01
// Design Name: 
// Module Name: system_top
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


module system_top(
	input			clk20_p,
	input			clk20_n,
	input			clk_pl,
	
	input	[9:0]	lvds_data_in_p,
	input	[9:0]	lvds_data_in_n,
	
	inout			IIC_scl_io,
	inout			IIC_sda_io,
	inout	[14:0]	EMIO_tri_io,
	
	output	[9:0]	lvds_data_out_p,
	output	[9:0]	lvds_data_out_n,

	output			HDMI_CLK_N,
	output			HDMI_CLK_P,
	output			HDMI_D0_N,
	output			HDMI_D0_P,
	output			HDMI_D1_N,
	output			HDMI_D1_P,
	output			HDMI_D2_N,
	output			HDMI_D2_P,
	
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
	inout	[3:0]	ddr3_dqs_p	,
	//output			interrupt_flag,
	output			wd_en
    );
	
	//以下信号根据需求进行修改
	//lvds signals
	wire			lvds_data_en		;//ps_ddr时钟域信号
	wire	[31:0]	lvds_data			;//ps_ddr时钟域信号
	wire			data_out_en			;//pl_ddr时钟域信号
	wire	[31:0]	data_out			;//pl_ddr时钟域信号
	//pl_ps 交互寄存器
	wire			select				;
	wire	[31:0]	pack_num			;
	wire	[31:0]	start				;
	wire	[31:0]	interrupt_reg		;
	wire			interrupt_flag		;
	wire	[31:0]	pl_tx_addr			;
	wire	[31:0]	pl_tx_length		;
	wire			ps_rx_finish		;
	wire			pl_tx_finish		;
	wire	[31:0]	ps_tx_addr			;
	wire	[31:0]	ps_tx_length		;
	wire			ps_tx_finish		;
	wire			pl_rx_finish		;
	wire	[31:0]	pl_rx_cnt_error		;
	
	
	//以下信号不可更改
	wire			lvds_clk			;
	wire			lvds_clk_pn			;
	//pl ddr signals
	wire			pl_ddr_i_clk		;//DDR IP_CORE CLK
	wire			pl_ddr_i_rst_n		;//DDR IP_CORE RST_N  锁相环locked信号
	wire			user_clk			;//PL DDR USER CLK
	wire			user_rst			;//PL DDR USER RST
	wire			pl_ddr_busy			;
	wire			pl_ddr_wr_start		;
	wire	[31:0]	pl_ddr_wr_addr		;
	wire	[31:0]	pl_ddr_wr_length	;
	wire			pl_ddr_wr_en		;
	wire	[31:0]	pl_ddr_wr_data		;
	wire			pl_ddr_wr_finish	;
	wire			pl_ddr_rd_start		;
	wire	[31:0]	pl_ddr_rd_addr		;
	wire	[31:0]	pl_ddr_rd_length	;
	wire			pl_ddr_rd_en		;
	wire	[31:0]	pl_ddr_rd_data		;
	wire			pl_ddr_rd_finish	;
	//ps ddr signals
	wire			clk_ps				;
	wire			clk_ps_rst_n		;//PS给出的复位
	wire			ps_ddr_busy			;
	wire			ps_ddr_wr_start		;
	wire	[31:0]	ps_ddr_wr_addr		;
	wire	[31:0]	ps_ddr_wr_length	;
	wire			ps_ddr_wr_en		;
	wire	[31:0]	ps_ddr_wr_data		;
	wire			ps_ddr_wr_finish	;
	wire			ps_ddr_rd_start		;
	wire	[31:0]	ps_ddr_rd_addr		;
	wire	[31:0]	ps_ddr_rd_length	;
	wire			ps_ddr_rd_en		;
	wire	[31:0]	ps_ddr_rd_data		;
	wire			ps_ddr_rd_finish	;
	//AXI寄存器接口
	wire	[31:0]	s00_axi_awaddr	;
	wire	[2:0]	s00_axi_awprot	;
	wire			s00_axi_awvalid ;
	wire	[31:0]	s00_axi_wdata	;
	wire			s00_axi_awready ;
	wire	[3:0]	s00_axi_wstrb	;
	wire			s00_axi_wvalid	;
	wire			s00_axi_wready	;
	wire	[1:0]	s00_axi_bresp	;
	wire			s00_axi_bvalid	;
	wire			s00_axi_bready	;
	wire	[31:0]	s00_axi_araddr	;
	wire	[2:0]	s00_axi_arprot	;
	wire			s00_axi_arvalid ;
	wire			s00_axi_arready ;
	wire	[31:0]	s00_axi_rdata	;
	wire	[1:0]	s00_axi_rresp	;
	wire			s00_axi_rvalid	;
	wire			s00_axi_rready	;
	//HP0接口
	wire	[31:0]	S_AXI_HP0_araddr;
	wire	[1:0]	S_AXI_HP0_arburst;
	wire	[3:0]	S_AXI_HP0_arcache;
	wire	[3:0]	S_AXI_HP0_arid;
	wire	[7:0]	S_AXI_HP0_arlen;
	wire	[1:0]	S_AXI_HP0_arlock;
	wire	[2:0]	S_AXI_HP0_arprot;
	wire	[3:0]	S_AXI_HP0_arqos;
	wire			S_AXI_HP0_arready;
	wire	[2:0]	S_AXI_HP0_arsize;
	wire			S_AXI_HP0_arvalid;
	wire	[31:0]	S_AXI_HP0_awaddr;
	wire	[1:0]	S_AXI_HP0_awburst;
	wire	[3:0]	S_AXI_HP0_awcache;
	wire	[3:0]	S_AXI_HP0_awid;
	wire	[7:0]	S_AXI_HP0_awlen;
	wire	[1:0]	S_AXI_HP0_awlock;
	wire	[2:0]	S_AXI_HP0_awprot;
	wire	[3:0]	S_AXI_HP0_awqos;
	wire			S_AXI_HP0_awready;
	wire	[2:0]	S_AXI_HP0_awsize;
	wire			S_AXI_HP0_awvalid;
	wire	[5:0]	S_AXI_HP0_bid;
	wire 			S_AXI_HP0_bready;
	wire 	[1:0]	S_AXI_HP0_bresp;
	wire 			S_AXI_HP0_bvalid;
	wire 	[63:0]	S_AXI_HP0_rdata;
	wire 	[5:0]	S_AXI_HP0_rid;
	wire 			S_AXI_HP0_rlast;
	wire 			S_AXI_HP0_rready;
	wire 	[1:0]	S_AXI_HP0_rresp;
	wire 			S_AXI_HP0_rvalid;
	wire 	[63:0]	S_AXI_HP0_wdata;
	wire 	[5:0]	S_AXI_HP0_wid;
	wire		 	S_AXI_HP0_wlast;
	wire 			S_AXI_HP0_wready;
	wire 	[7:0]	S_AXI_HP0_wstrb;
	wire 			S_AXI_HP0_wvalid;
	wire            wt_finish;
	wire [1:0 ]    wt_ps_state;
	ila_0 ila_0_inst (
		.clk(clk_ps), // input wire clk
		.probe0({
				ps_tx_finish,
				ps_tx_addr
				}) // input wire [99:0] probe0
	);
	
	IBUFDS #(
		.IOSTANDARD("LVDS_25")	// 指定输入端口的电平标准，如果不确定，可设为DEFAULT
	) IBUFDS_inst (
		.O(lvds_clk_pn), 		// 时钟缓冲输出
		.I(clk20_p), 			// 差分时钟的正端输入，需要和顶层模块的端口直接连接
		.IB(clk20_n) 			// 差分时钟的负端输入，需要和顶层模块的端口直接连接
	); 
	
	BUFG BUFG_inst (
		.O(lvds_clk), 			// 时钟缓存输出信号
		.I(~lvds_clk_pn) 		// 时钟缓存输入信号
	); 
	
	clk_wiz_0 MY_PLL (
		.clk_out1	(pl_ddr_i_clk),
		.reset		(~clk_ps_rst_n),
		.locked		(pl_ddr_i_rst_n),
		.clk_in1	(clk_pl)
	);
	
	lvds_top LVDS(
		.rst_n				(clk_ps_rst_n		),
		.lvds_clk			(lvds_clk			),
		.clk_ps				(clk_ps				),
		.start				(start				),
		.lvds_data_in_p		(lvds_data_in_p		),
		.lvds_data_in_n		(lvds_data_in_n		),
		.lvds_data_out_p	(lvds_data_out_p	),
		.lvds_data_out_n	(lvds_data_out_n	),
		.data				(lvds_data			),
		.data_valid			(lvds_data_en		),
		.interrupt_flag		(interrupt_flag		),
		.interrupt_reg		(interrupt_reg		)
    );
	
	//实际应用中此模块可以不用，此模块用于功能验证和时钟域转换
	lvds_data_process DATA_TEST(
		.rst				(~clk_ps_rst_n		),
		.clk_ps				(clk_ps				),
		.user_clk			(user_clk			),
		.select				(0				    ),
		.lvds_data_en		(lvds_data_en		),
		.lvds_data			(lvds_data			),
		.data_out_en		(data_out_en		),
		.data_out			(data_out			)
    );
    
    
    wire [31:0] data2ps;
    wire        valid2ps;
	down_sample my_down_sampleps (
        	.clk(clk_ps), 
        	.rst(clk_ps_rst_n), 
        	.data_in  (lvds_data      ), 
        	.valid_in (lvds_data_en   ), 
        	.data_out (   data2ps     ), 
        	.valid_out(    valid2ps   )
        );
        wire [31:0] rd_cont;
        wire [79:0] fifo_state;
	//实际应用中请将下方注释去掉
	test_top TEST_TOP(
		.data2ps (data2ps),
		.valid2ps(valid2ps),
		.pl_rst_n			(~user_rst			),				
		.pl_clk				(user_clk			),
		.ps_rst_n			(clk_ps_rst_n		),				
		.ps_clk				(clk_ps				),	
		.lvds_data			(data_out			),			
		.lvds_data_en		(data_out_en		),		
		.pl_ddr_busy		(pl_ddr_busy		),	
		.pl_ddr_wr_finish	(pl_ddr_wr_finish	),	
		.pl_ddr_wr_start	(pl_ddr_wr_start	),	
		.pl_ddr_wr_addr		(pl_ddr_wr_addr		),		
		.pl_ddr_wr_length	(pl_ddr_wr_length	),	
		.pl_ddr_wr_data		(pl_ddr_wr_data		),		
		.pl_ddr_wr_en		(pl_ddr_wr_en		),	
		.pl_ddr_rd_finish	(pl_ddr_rd_finish	),	
		.pl_ddr_rd_start	(pl_ddr_rd_start	),	
		.pl_ddr_rd_addr		(pl_ddr_rd_addr		),		
		.pl_ddr_rd_length	(pl_ddr_rd_length	),	
		.pl_ddr_rd_data		(pl_ddr_rd_data		),		
		.pl_ddr_rd_en		(pl_ddr_rd_en		),		
		.ps_ddr_busy		(ps_ddr_busy		),		
		.ps_ddr_wr_finish	(ps_ddr_wr_finish	),	
		.ps_ddr_wr_start	(ps_ddr_wr_start	),	
		.ps_ddr_wr_addr		(ps_ddr_wr_addr		),		
		.ps_ddr_wr_length	(ps_ddr_wr_length	),	
		.ps_ddr_wr_data		(ps_ddr_wr_data		),		
		.ps_ddr_wr_en		(ps_ddr_wr_en		),		
		.ps_ddr_rd_finish	(ps_ddr_rd_finish	),
		//.ps_ddr_rd_start	(ps_ddr_rd_start	),	
		//.ps_ddr_rd_addr		(ps_ddr_rd_addr		),		
		//.ps_ddr_rd_length	(ps_ddr_rd_length	),	
		.ps_ddr_rd_data		(ps_ddr_rd_data		),		
		.ps_ddr_rd_en		(ps_ddr_rd_en		),
		.wt_finish   (wt_finish),
		.fifo_state(fifo_state),
		.rd_cont(rd_cont),
		.wt_ps_state (wt_ps_state)
    );
	
	pl_ddr3_top PL_DDR3(
		.sys_rst			(~pl_ddr_i_rst_n	),
		.sys_clk			(pl_ddr_i_clk		),
		.user_clk			(user_clk			),
		.user_rst			(user_rst			),
		.pl_ddr_busy		(pl_ddr_busy		),
		.pl_ddr_wr_start	(pl_ddr_wr_start	),
		.pl_ddr_wr_addr		(pl_ddr_wr_addr		),
		.pl_ddr_wr_length	(pl_ddr_wr_length	),
		.pl_ddr_wr_en		(pl_ddr_wr_en		),
		.pl_ddr_wr_data		(pl_ddr_wr_data		),
		.pl_ddr_wr_finish	(pl_ddr_wr_finish	),
		.pl_ddr_rd_start	(pl_ddr_rd_start	),
		.pl_ddr_rd_addr		(pl_ddr_rd_addr		),
		.pl_ddr_rd_length	(pl_ddr_rd_length	),
		.pl_ddr_rd_en		(pl_ddr_rd_en		),
		.pl_ddr_rd_data		(pl_ddr_rd_data		),
		.pl_ddr_rd_finish	(pl_ddr_rd_finish	),
		.ddr3_ck_n			(ddr3_ck_n			),
		.ddr3_ck_p			(ddr3_ck_p			),
		.ddr3_reset_n		(ddr3_reset_n		),
		.ddr3_cke			(ddr3_cke			),
		.ddr3_cs_n			(ddr3_cs_n			),
		.ddr3_we_n			(ddr3_we_n			),
		.ddr3_cas_n			(ddr3_cas_n			),
		.ddr3_ras_n			(ddr3_ras_n			),
		.ddr3_odt			(ddr3_odt			),
		.ddr3_ba			(ddr3_ba			),
		.ddr3_dm			(ddr3_dm			),
		.ddr3_addr			(ddr3_addr			),
		.ddr3_dq			(ddr3_dq			),
		.ddr3_dqs_n			(ddr3_dqs_n			),
		.ddr3_dqs_p			(ddr3_dqs_p			)
    );
	
	//实际应用中此模块可以不用，此模块功能是为了验证PS与PL命令通道
	pspl_reg_ctrl PS_PL(
		.rst				(~clk_ps_rst_n		),
		.clk_ps				(clk_ps				),
		.ps_ddr_wr_finish	(ps_ddr_wr_finish	),
		.ps_ddr_wr_addr		(ps_ddr_wr_addr		),
		.ps_ddr_wr_length	(ps_ddr_wr_length	),
		.ps_rx_finish		(ps_rx_finish		),
		.pl_tx_finish		(pl_tx_finish		),
		.pl_tx_addr			(pl_tx_addr			),
		.pl_tx_length		(pl_tx_length		),
		.ps_ddr_rd_finish	(ps_ddr_rd_finish	),
		.ps_ddr_rd_en		(ps_ddr_rd_en		),
		.ps_ddr_rd_data		(ps_ddr_rd_data		),
		.ps_ddr_rd_start	(ps_ddr_rd_start	),
		.ps_ddr_rd_addr		(ps_ddr_rd_addr		),
		.ps_ddr_rd_length	(ps_ddr_rd_length	),
		.ps_tx_finish		(ps_tx_finish		),
		.ps_tx_addr			(ps_tx_addr			),
		.ps_tx_length		(ps_tx_length		),
		.pl_rx_finish		(pl_rx_finish		),
		.pl_rx_cnt_error	(pl_rx_cnt_error	)
    );
	
	axi_reg AXI_REG(
//		.pl_tx_addr			(pl_tx_addr			),
//		.pl_tx_length		(pl_tx_length		),
//		.pl_tx_finish		(pl_tx_finish		),
//		.ps_rx_finish		(ps_rx_finish		),
//		.ps_tx_finish		(ps_tx_finish		),
//		.ps_tx_addr			(ps_tx_addr			),
//		.ps_tx_length		(ps_tx_length		),
//		.pl_rx_finish		(pl_rx_finish		),
//		.pl_rx_cnt_error	(pl_rx_cnt_error	),
.fifo_state(fifo_state),
.ps_ddr_wr_finish(ps_ddr_wr_finish),
.rd_cont(rd_cont),
		.ps_ddr_wr_en       (ps_ddr_wr_en       ),
		.ps_ddr_wr_start    (ps_ddr_wr_start   ),
		.select				(select				),
		.wd_en				(wd_en				),
		.start				(start				),
		.lvds_data          (lvds_data    ),
        .lvds_data_en       (lvds_data_en ),
        .data2ps            (data2ps      ),
        .valid2ps           (valid2ps     ),
		.wt_ps_state        (wt_ps_state         ),  
        .pl_ddr_w_addr      (     'h101010 ),
        .ps_ddr_w_addr      (     ps_ddr_wr_addr ),
    	.wt_finish           (wt_finish),
    	.s00_axi_aclk		(clk_ps				),
    	.s00_axi_aresetn	(clk_ps_rst_n		),
    	.s00_axi_awaddr		(s00_axi_awaddr[7:0]),
    	.s00_axi_awprot		(s00_axi_awprot		),
    	.s00_axi_awvalid	(s00_axi_awvalid	),
    	.s00_axi_wdata		(s00_axi_wdata		),
    	.s00_axi_awready	(s00_axi_awready	),
    	.s00_axi_wstrb		(s00_axi_wstrb		),
    	.s00_axi_wvalid		(s00_axi_wvalid		),
    	.s00_axi_wready		(s00_axi_wready		),
    	.s00_axi_bresp		(s00_axi_bresp		),
    	.s00_axi_bvalid		(s00_axi_bvalid		),
    	.s00_axi_bready		(s00_axi_bready		),
    	.s00_axi_araddr		(s00_axi_araddr[7:0]),
    	.s00_axi_arprot		(s00_axi_arprot		),
    	.s00_axi_arvalid	(s00_axi_arvalid	),
    	.s00_axi_arready	(s00_axi_arready	),
    	.s00_axi_rdata		(s00_axi_rdata		),
    	.s00_axi_rresp		(s00_axi_rresp		),
    	.s00_axi_rvalid		(s00_axi_rvalid		),
    	.s00_axi_rready		(s00_axi_rready		)
    );
	
	axi_lite AXI_LITE(
		.clk_ps				(clk_ps				),
		.rst_n				(clk_ps_rst_n		),
		.ps_ddr_busy		(ps_ddr_busy		),
		.ps_ddr_wr_start	(ps_ddr_wr_start	),	
		.ps_ddr_wr_addr		(ps_ddr_wr_addr		),		
		.ps_ddr_wr_length	(ps_ddr_wr_length	),		
		.ps_ddr_wr_en		(ps_ddr_wr_en		),	
		.ps_ddr_wr_data		(ps_ddr_wr_data		),		
		.ps_ddr_wr_finish	(ps_ddr_wr_finish	),
		.ps_ddr_rd_start	(ps_ddr_rd_start	),	
		.ps_ddr_rd_addr		(ps_ddr_rd_addr		),		
		.ps_ddr_rd_length	(ps_ddr_rd_length	),		
		.ps_ddr_rd_en		(ps_ddr_rd_en		),	
		.ps_ddr_rd_data		(ps_ddr_rd_data		),		
		.ps_ddr_rd_finish	(ps_ddr_rd_finish	),
		//m_axi_s2mm
		.m_axi_s2mm_awready	(S_AXI_HP0_awready),
		.m_axi_s2mm_bresp	(S_AXI_HP0_bresp),
		.m_axi_s2mm_bvalid	(S_AXI_HP0_bvalid),
		.m_axi_s2mm_wready	(S_AXI_HP0_wready),
		//m_axi_mm2s
		.m_axi_mm2s_arready	(S_AXI_HP0_arready),
		.m_axi_mm2s_rdata	(S_AXI_HP0_rdata),
		.m_axi_mm2s_rlast	(S_AXI_HP0_rlast),
		.m_axi_mm2s_rresp	(S_AXI_HP0_rresp),
		.m_axi_mm2s_rvalid	(S_AXI_HP0_rvalid),
		
		//m_axi_s2mm
		.m_axi_s2mm_awaddr	(S_AXI_HP0_awaddr),
		.m_axi_s2mm_awburst	(S_AXI_HP0_awburst),
		.m_axi_s2mm_awcache	(S_AXI_HP0_awcache),
		.m_axi_s2mm_awid	(S_AXI_HP0_awid),
		.m_axi_s2mm_awlen	(S_AXI_HP0_awlen),
		.m_axi_s2mm_awprot	(S_AXI_HP0_awprot),
		.m_axi_s2mm_awsize	(S_AXI_HP0_awsize),
		.m_axi_s2mm_awuser	(S_AXI_HP0_awqos),//S_AXI_HP0_awqos
		.m_axi_s2mm_awvalid	(S_AXI_HP0_awvalid),
		.m_axi_s2mm_bready	(S_AXI_HP0_bready),
		.m_axi_s2mm_wdata	(S_AXI_HP0_wdata),
		.m_axi_s2mm_wlast	(S_AXI_HP0_wlast),
		.m_axi_s2mm_wstrb	(S_AXI_HP0_wstrb),
		.m_axi_s2mm_wvalid	(S_AXI_HP0_wvalid),
		//m_axi_mm2s
		.m_axi_mm2s_araddr	(S_AXI_HP0_araddr),
		.m_axi_mm2s_arburst	(S_AXI_HP0_arburst),
		.m_axi_mm2s_arcache	(S_AXI_HP0_arcache),
		.m_axi_mm2s_arid	(S_AXI_HP0_arid),
		.m_axi_mm2s_arlen	(S_AXI_HP0_arlen),
		.m_axi_mm2s_arprot	(S_AXI_HP0_arprot),
		.m_axi_mm2s_arsize	(S_AXI_HP0_arsize),
		.m_axi_mm2s_aruser	(S_AXI_HP0_arqos),//S_AXI_HP0_arqos
		.m_axi_mm2s_arvalid	(S_AXI_HP0_arvalid),
		.m_axi_mm2s_rready	(S_AXI_HP0_rready)
    );
	
	system_wrapper PS_TOP(	
		.DDR_addr			(),
		.DDR_ba				(),
		.DDR_cas_n			(),
		.DDR_ck_n			(),
		.DDR_ck_p			(),
		.DDR_cke			(),
		.DDR_cs_n			(),
		.DDR_dm				(),
		.DDR_dq				(),
		.DDR_dqs_n			(),
		.DDR_dqs_p			(),
		.DDR_odt			(),
		.DDR_ras_n			(),
		.DDR_reset_n		(),
		.DDR_we_n			(),
		.EMIO_tri_io		(EMIO_tri_io),
		.FCLK_CLK0_0		(clk_ps),
		.FCLK_RESET0_N		(clk_ps_rst_n),
		.FIXED_IO_ddr_vrn	(),
		.FIXED_IO_ddr_vrp	(),
		.FIXED_IO_mio		(),
		.FIXED_IO_ps_clk	(),
		.FIXED_IO_ps_porb	(),
		.FIXED_IO_ps_srstb	(),
		.HDMI_CLK_N			(HDMI_CLK_N	),
		.HDMI_CLK_P			(HDMI_CLK_P	),
		.HDMI_D0_N			(HDMI_D0_N	),
		.HDMI_D0_P			(HDMI_D0_P	),
		.HDMI_D1_N			(HDMI_D1_N	),
		.HDMI_D1_P			(HDMI_D1_P	),
		.HDMI_D2_N			(HDMI_D2_N	),
		.HDMI_D2_P			(HDMI_D2_P	),
		.IIC_scl_io			(IIC_scl_io	),
		.IIC_sda_io			(IIC_sda_io	),
		
		.M02_AXI_araddr		(s00_axi_araddr	),
		.M02_AXI_arprot		(s00_axi_arprot	),
		.M02_AXI_arready	(s00_axi_arready),
		.M02_AXI_arvalid	(s00_axi_arvalid),
		.M02_AXI_awaddr		(s00_axi_awaddr	),
		.M02_AXI_awprot		(s00_axi_awprot	),
		.M02_AXI_awready	(s00_axi_awready),
		.M02_AXI_awvalid	(s00_axi_awvalid),
		.M02_AXI_bready		(s00_axi_bready	),
		.M02_AXI_bresp		(s00_axi_bresp	),
		.M02_AXI_bvalid		(s00_axi_bvalid	),
		.M02_AXI_rdata		(s00_axi_rdata	),
		.M02_AXI_rready		(s00_axi_rready	),
		.M02_AXI_rresp		(s00_axi_rresp	),
		.M02_AXI_rvalid		(s00_axi_rvalid	),
		.M02_AXI_wdata		(s00_axi_wdata	),
		.M02_AXI_wready		(s00_axi_wready	),
		.M02_AXI_wstrb		(s00_axi_wstrb	),
		.M02_AXI_wvalid		(s00_axi_wvalid	),
		
		.S_AXI_HP1_0_araddr		(S_AXI_HP0_araddr	),
		.S_AXI_HP1_0_arburst	(S_AXI_HP0_arburst	),
		.S_AXI_HP1_0_arcache	(S_AXI_HP0_arcache	),
		.S_AXI_HP1_0_arid		({2'd0,S_AXI_HP0_arid}	),
		.S_AXI_HP1_0_arlen		(S_AXI_HP0_arlen[3:0]	),
		.S_AXI_HP1_0_arlock		(1'b0				),
		.S_AXI_HP1_0_arprot		(S_AXI_HP0_arprot	),
		.S_AXI_HP1_0_arqos		(S_AXI_HP0_arqos	),
		.S_AXI_HP1_0_arready	(S_AXI_HP0_arready	),
		.S_AXI_HP1_0_arsize		(S_AXI_HP0_arsize	),
		.S_AXI_HP1_0_arvalid	(S_AXI_HP0_arvalid	),
		.S_AXI_HP1_0_awaddr		(S_AXI_HP0_awaddr	),
		.S_AXI_HP1_0_awburst	(S_AXI_HP0_awburst	),
		.S_AXI_HP1_0_awcache	(S_AXI_HP0_awcache	),
		.S_AXI_HP1_0_awid		({2'd0,S_AXI_HP0_awid}	),
		.S_AXI_HP1_0_awlen		(S_AXI_HP0_awlen[3:0]	),
		.S_AXI_HP1_0_awlock		(1'b0				),
		.S_AXI_HP1_0_awprot		(S_AXI_HP0_awprot	),
		.S_AXI_HP1_0_awqos		(S_AXI_HP0_awqos	),
		.S_AXI_HP1_0_awready	(S_AXI_HP0_awready	),
		.S_AXI_HP1_0_awsize		(S_AXI_HP0_awsize	),
		.S_AXI_HP1_0_awvalid	(S_AXI_HP0_awvalid	),
		.S_AXI_HP1_0_bid		(S_AXI_HP0_bid		),
		.S_AXI_HP1_0_bready		(S_AXI_HP0_bready	),
		.S_AXI_HP1_0_bresp		(S_AXI_HP0_bresp	),
		.S_AXI_HP1_0_bvalid		(S_AXI_HP0_bvalid	),
		.S_AXI_HP1_0_rdata		(S_AXI_HP0_rdata	),
		.S_AXI_HP1_0_rid		(S_AXI_HP0_rid		),
		.S_AXI_HP1_0_rlast		(S_AXI_HP0_rlast	),
		.S_AXI_HP1_0_rready		(S_AXI_HP0_rready	),
		.S_AXI_HP1_0_rresp		(S_AXI_HP0_rresp	),
		.S_AXI_HP1_0_rvalid		(S_AXI_HP0_rvalid	),
		.S_AXI_HP1_0_wdata		(S_AXI_HP0_wdata	),
		.S_AXI_HP1_0_wid		(6'd0		),
		.S_AXI_HP1_0_wlast		(S_AXI_HP0_wlast	),
		.S_AXI_HP1_0_wready		(S_AXI_HP0_wready	),
		.S_AXI_HP1_0_wstrb		(S_AXI_HP0_wstrb	),
		.S_AXI_HP1_0_wvalid		(S_AXI_HP0_wvalid	)
	);
	
endmodule
