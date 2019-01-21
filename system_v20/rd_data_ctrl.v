`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/29 17:36:03
// Design Name: 
// Module Name: rd_data_ctrl
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


module rd_data_ctrl(
	input			rst,				//复位信号，正逻辑
	input			pl_clk,				//DDR给出的时钟
	input			pl_ddr_wr_finish,	//wr_ddr finish
	input			pl_ddr_rd_finish,	//rd_ddr finish
	//input			pl_ddr_rd_en,	//从DDR读出的数据，连接到我方模块的数据输出使能（rd_pl/ps_ddr3模块）
	//input	[31:0]	pl_ddr_rd_data,		//从DDR读出的数据的数据使能，连接到我方模块的数据输出（rd_pl/ps_ddr3模块）
	
	output	reg 		pl_ddr_rd_start,			//启动写
	output	reg [31:0]	pl_ddr_rd_length,		//数据量
	output	reg [31:0]	pl_ddr_rd_addr		//起始地址
	);
	
	reg				pl_ddr_rd_finish_del;
	/* reg		[6:0]	cnt;
	
	always @ (posedge pl_clk, posedge rst)
	begin
		if (rst)
			cnt <= 0;
		else if (pl_ddr_wr_finish)
			if (cnt == 99)
				cnt <= 0;
			else
				cnt <= cnt + 1'd1;
		else
			cnt <= cnt;
	end */
	
	always @ (posedge pl_clk, posedge rst)
	begin
		if (rst)
			pl_ddr_rd_start <= 0;
		else if (pl_ddr_wr_finish)
			pl_ddr_rd_start <= 1;
		else
			pl_ddr_rd_start <= 0;
	end 
	
	always @ (posedge pl_clk) pl_ddr_rd_finish_del <= pl_ddr_rd_finish;
	
	always @ (posedge pl_clk, posedge rst)
	begin
		if (rst)
			pl_ddr_rd_addr <= 0;
		else if (~pl_ddr_rd_finish_del && pl_ddr_rd_finish)
			if (pl_ddr_rd_addr == 100_000*6*320 - 32000)
				pl_ddr_rd_addr <= 0;
			else
				pl_ddr_rd_addr <= pl_ddr_rd_addr + 32000;
		else
			pl_ddr_rd_addr <= pl_ddr_rd_addr;
	end
	
	always @ (posedge pl_clk, posedge rst)
	begin
		if (rst)
			pl_ddr_rd_length <= 0;
		else
			pl_ddr_rd_length <= 32000;
	end
	
endmodule

