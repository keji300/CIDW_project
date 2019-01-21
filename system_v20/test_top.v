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
	input			pl_rst_n,			//pl_clk时钟域复位  负逻辑 0：复位   1：置位
	input			pl_clk,				//pl_ddr3时钟100M
	input			ps_rst_n,			//ps_clk时钟域复位  负逻辑 0：复位   1：置位
	input			ps_clk,				//ps_ddr3时钟150M
	
	input	[31:0]	lvds_data,			//pl_clk时钟域信号   lvds上传数据
	input			lvds_data_en,		//pl_clk时钟域信号   lvds上传数据使能，与数据同步
	
	//pl ddr3 signals 时钟域为pl_clk
	input			pl_ddr_busy,		//1：忙     0：空闲    只需在发读写命令时判断即可
	//write pl ddr3
	input			pl_ddr_wr_finish,	//写结束，为高脉冲信号 ，可以检测此信号的上升沿  写完成以后会有一个CLK的高电平
	output			pl_ddr_wr_start,	//启动写信号，上升沿有效
	output	[31:0]	pl_ddr_wr_addr,		//数据起始地址  写过程中保持不变，结束以后可以改变，可操作地址范围0~1G
	output	[31:0]	pl_ddr_wr_length,	//数据量，单位:B  写过程中保持不变，结束以后可以改变，最大为32K
	output	[31:0]	pl_ddr_wr_data,		//写数据
	output			pl_ddr_wr_en,		//写数据使能，与数据同步
	//read pl ddr3
	input			pl_ddr_rd_finish,	//读结束，为高脉冲信号，可以检测此信号的上升沿   写完成以后会有数个CLK的高电平
	input	[31:0]	pl_ddr_rd_data,		//与读类似
	input			pl_ddr_rd_en,		//与读类似
	output			pl_ddr_rd_start,	//读动写信号，上升沿有效
	output	[31:0]	pl_ddr_rd_addr,		//与读类似
	output	[31:0]	pl_ddr_rd_length,	//与读类似
	
	//ps ddr3 signals  时钟域为ps_clk
	input			ps_ddr_busy,		//与PL类似
	input			ps_ddr_wr_finish,	//与PL类似
	output			ps_ddr_wr_start,	//与PL类似
	output	[31:0]	ps_ddr_wr_addr,		//与PL类似，操作地址范围为：0x3c00_0000到0x3fef_ffff
	output	[31:0]	ps_ddr_wr_length,	//与PL类似
	output	[31:0]	ps_ddr_wr_data,		//与PL类似
	output			ps_ddr_wr_en,		//与PL类似
	input			ps_ddr_rd_finish,	//与PL类似
	input	[31:0]	ps_ddr_rd_data,		//与PL类似
	input			ps_ddr_rd_en,		//与PL类似
	output			ps_ddr_rd_start,	//与PL类似
	output	[31:0]	ps_ddr_rd_addr,		//与PL类似，操作地址范围为：0x3ff0_0000到0x3fff_ffff
	output	[31:0]	ps_ddr_rd_length,	//与PL类似
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
