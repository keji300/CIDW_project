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
	input			rst,				//��λ�źţ����߼�
	input			pl_clk,				//DDR������ʱ��
	input			pl_ddr_wr_finish,	//wr_ddr finish
	input			pl_ddr_rd_finish,	//rd_ddr finish
	//input			pl_ddr_rd_en,	//��DDR���������ݣ����ӵ��ҷ�ģ����������ʹ�ܣ�rd_pl/ps_ddr3ģ�飩
	//input	[31:0]	pl_ddr_rd_data,		//��DDR���������ݵ�����ʹ�ܣ����ӵ��ҷ�ģ������������rd_pl/ps_ddr3ģ�飩
	
	output	reg 		pl_ddr_rd_start,			//����д
	output	reg [31:0]	pl_ddr_rd_length,		//������
	output	reg [31:0]	pl_ddr_rd_addr		//��ʼ��ַ
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

