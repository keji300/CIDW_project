`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/29 17:35:40
// Design Name: 
// Module Name: wr_data_ctrl
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


module wr_data_ctrl(
	input			rst,				//��λ�źţ����߼�
	input			pl_clk,				//DDR������ʱ��
	input			lvds_data_en,		//lvds����ʹ��
	input	[31:0]	lvds_data,			//lvds����
	
	output	reg 		pl_ddr_wr_start,			//����д
	output	reg [31:0]	pl_ddr_wr_length,		//������
	output	reg [31:0]	pl_ddr_wr_addr,		//��ʼ��ַ
	output	reg 		pl_ddr_wr_en,		//Ҫд��DDR�����ݣ����ӵ��ҷ�ģ�����������ʹ�ܣ�wr_pl/ps_ddr3ģ�飩
	output	reg [31:0]	pl_ddr_wr_data		//Ҫд��DDR�����ݵ�����ʹ�ܣ����ӵ��ҷ�ģ�����������wr_pl/ps_ddr3ģ�飩
	);

	reg		[12:0]	cnt_en;
	
	always @ (posedge pl_clk, posedge rst)
	begin
		if (rst)
			cnt_en <= 0;
		else if (lvds_data_en)
			if (cnt_en == 7999)
				cnt_en <= 0;
			else
				cnt_en <= cnt_en + 1'd1;
		else
			cnt_en <= cnt_en;
	end 
	
	always @ (posedge pl_clk, posedge rst)
	begin
		if (rst)
			pl_ddr_wr_start <= 0;
		else if (cnt_en == 0 && lvds_data_en)
			pl_ddr_wr_start <= 1;
		else
			pl_ddr_wr_start <= 0;
	end
	
	always @ (posedge pl_clk, posedge rst)
	begin
		if (rst)
			pl_ddr_wr_addr <= 0;
		else if (cnt_en == 7999 && lvds_data_en)
			if (pl_ddr_wr_addr == 100_000*6*320 - 32000)
				pl_ddr_wr_addr <= 0;
			else
				pl_ddr_wr_addr <= pl_ddr_wr_addr + 32000;
		else
			pl_ddr_wr_addr <= pl_ddr_wr_addr;
	end
	
	always @ (posedge pl_clk, posedge rst)
	begin
		if (rst)
			pl_ddr_wr_length <= 0;
		else
			pl_ddr_wr_length <= 32000;
	end
	
	always @ (posedge pl_clk, posedge rst)
	begin
		if (rst)
			pl_ddr_wr_en <= 0;
		else
			pl_ddr_wr_en <= lvds_data_en;
	end
	
	always @ (posedge pl_clk, posedge rst)
	begin
		if (rst)
			pl_ddr_wr_data <= 0;
		//else if (pl_ddr_wr_en)
		//	pl_ddr_wr_data <= pl_ddr_wr_data + 1;
		else
			pl_ddr_wr_data <= lvds_data;
	end
	
endmodule
