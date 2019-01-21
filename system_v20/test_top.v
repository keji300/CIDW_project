`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/04 10:35:28
// Design Name: 
// Module Name: test_top
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


module test_top(
	input			pl_rst_n,			//pl_clkʱ����λ  ���߼� 0����λ   1����λ
	input			pl_clk,				//pl_ddr3ʱ��100M
	input			ps_rst_n,			//ps_clkʱ����λ  ���߼� 0����λ   1����λ
	input			ps_clk,				//ps_ddr3ʱ��150M
	
	input	[31:0]	lvds_data,			//pl_clkʱ�����ź�   lvds�ϴ�����
	input			lvds_data_en,		//pl_clkʱ�����ź�   lvds�ϴ�����ʹ�ܣ�������ͬ��
	
	//pl ddr3 signals ʱ����Ϊpl_clk
	input			pl_ddr_busy,		//1��æ     0������    ֻ���ڷ���д����ʱ�жϼ���
	//write pl ddr3
	input			pl_ddr_wr_finish,	//д������Ϊ�������ź� �����Լ����źŵ�������  д����Ժ����һ��CLK�ĸߵ�ƽ
	output			pl_ddr_wr_start,	//����д�źţ���������Ч
	output	[31:0]	pl_ddr_wr_addr,		//������ʼ��ַ  д�����б��ֲ��䣬�����Ժ���Ըı䣬�ɲ�����ַ��Χ0~1G
	output	[31:0]	pl_ddr_wr_length,	//����������λ:B  д�����б��ֲ��䣬�����Ժ���Ըı䣬���Ϊ32K
	output	[31:0]	pl_ddr_wr_data,		//д����
	output			pl_ddr_wr_en,		//д����ʹ�ܣ�������ͬ��
	//read pl ddr3
	input			pl_ddr_rd_finish,	//��������Ϊ�������źţ����Լ����źŵ�������   д����Ժ��������CLK�ĸߵ�ƽ
	input	[31:0]	pl_ddr_rd_data,		//�������
	input			pl_ddr_rd_en,		//�������
	output			pl_ddr_rd_start,	//����д�źţ���������Ч
	output	[31:0]	pl_ddr_rd_addr,		//�������
	output	[31:0]	pl_ddr_rd_length,	//�������
	
	//ps ddr3 signals  ʱ����Ϊps_clk
	input			ps_ddr_busy,		//��PL����
	input			ps_ddr_wr_finish,	//��PL����
	output			ps_ddr_wr_start,	//��PL����
	output	[31:0]	ps_ddr_wr_addr,		//��PL���ƣ�������ַ��ΧΪ��0x3c00_0000��0x3fef_ffff
	output	[31:0]	ps_ddr_wr_length,	//��PL����
	output	[31:0]	ps_ddr_wr_data,		//��PL����
	output			ps_ddr_wr_en,		//��PL����
	input			ps_ddr_rd_finish,	//��PL����
	input	[31:0]	ps_ddr_rd_data,		//��PL����
	input			ps_ddr_rd_en,		//��PL����
	output			ps_ddr_rd_start,	//��PL����
	output	[31:0]	ps_ddr_rd_addr,		//��PL���ƣ�������ַ��ΧΪ��0x3ff0_0000��0x3fff_ffff
	output	[31:0]	ps_ddr_rd_length,	//��PL����
	input   [31:0] data2ps   ,
	input          valid2ps  ,
	output  [1:0]   wt_ps_state,
	output  [31:0]   rd_cont,
	output [79:0]  fifo_state,
	output          wt_finish
    );
    
    wire valid_out;
    wire [31:0] data_out;
	down_sample my_down_sample (
        	.clk(pl_clk), 
        	.rst(pl_rst_n), 
        	.data_in(lvds_data), 
        	.valid_in(lvds_data_en), 
        	.data_out(data_out), 
        	.valid_out(valid_out)
        );
	wr_data_ctrl wr_pl_ddr(
		.rst				(~pl_rst_n			),
		.pl_clk				(pl_clk				),
		.lvds_data_en		(valid_out		),
		.lvds_data			(data_out			),
		.pl_ddr_wr_start	(pl_ddr_wr_start	),
		.pl_ddr_wr_length	(pl_ddr_wr_length	),
		.pl_ddr_wr_addr		(pl_ddr_wr_addr		),
		.pl_ddr_wr_en		(pl_ddr_wr_en		),
		.pl_ddr_wr_data		(pl_ddr_wr_data		)
	);
	
	rd_data_ctrl rd_pl_ddr(
		.rst				(~pl_rst_n			),
		.pl_clk				(pl_clk				),
		.pl_ddr_wr_finish	(pl_ddr_wr_finish	),
		.pl_ddr_rd_finish	(pl_ddr_rd_finish	),
		//.pl_ddr_rd_en		(pl_ddr_rd_en		),
		//.pl_ddr_rd_data		(pl_ddr_rd_data		),
		.pl_ddr_rd_start	(pl_ddr_rd_start	),
		.pl_ddr_rd_length	(pl_ddr_rd_length	),
		.pl_ddr_rd_addr		(pl_ddr_rd_addr		)
	);
	
	wr_ps_ctrl wr_ps_ctrl_inst(
		.pl_rst				(pl_rst_n			),
		.pl_clk				(pl_clk				),
		.ps_rst				(ps_rst_n			),
		.ps_clk				(ps_clk				),
		.ps_busy             (ps_ddr_busy),
		.pl_ddr_rd_en		(valid2ps 		),
		.pl_ddr_rd_data		(data2ps		),
		.ps_ddr_wr_finish	(ps_ddr_wr_finish	),
		.ps_ddr_wr_start	(ps_ddr_wr_start	),
		.ps_ddr_wr_addr		(ps_ddr_wr_addr		),
		.ps_ddr_wr_length	(ps_ddr_wr_length	),
		.ps_ddr_wr_en		(ps_ddr_wr_en		),
		.ps_ddr_wr_data		(ps_ddr_wr_data		),
		.state_out(wt_ps_state),
		.rd_cont (rd_cont),
		.fifo_state(fifo_state),
		.wt_finish(wt_finish)
    );
	
endmodule
