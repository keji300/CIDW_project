`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/04 16:39:58
// Design Name: 
// Module Name: pspl_reg_ctrl
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


module pspl_reg_ctrl(
	input			rst,
	input			clk_ps,
	input			ps_ddr_wr_finish,
	input	[31:0]	ps_ddr_wr_addr,
	input	[31:0]	ps_ddr_wr_length,
	
	input			ps_rx_finish,
	output	reg			pl_tx_finish,
	output	reg	[31:0]	pl_tx_addr,
	output	reg [31:0]	pl_tx_length,
	
	input			ps_ddr_rd_finish,
	input			ps_ddr_rd_en,
	input	[31:0]	ps_ddr_rd_data,
	output	reg			ps_ddr_rd_start,
	output	reg [31:0]	ps_ddr_rd_addr,
	output	reg	[31:0]	ps_ddr_rd_length,
	
	input			ps_tx_finish,
	input	[31:0]	ps_tx_addr,
	input	[31:0]	ps_tx_length,
	output	reg			pl_rx_finish,
	output	reg	[31:0]	pl_rx_cnt_error
    );
	
	reg				rx_finish_catch,rx_finish_sync;
	wire			rx_finish_rise;
	
	reg				ps_tx_finish_catch,ps_tx_finish_sync;
	wire			ps_tx_finish_rise;
	
	reg		[31:0]	temp;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
		begin
			pl_tx_addr <= 0;
			pl_tx_length <= 0;
		end
		else if (ps_ddr_wr_finish)
		begin
			pl_tx_addr <= ps_ddr_wr_addr;
			pl_tx_length <= ps_ddr_wr_length;
		end
		else
		begin
			pl_tx_addr <= pl_tx_addr;
			pl_tx_length <= pl_tx_length;
		end
	end 
	
	always @ (posedge clk_ps)
	begin
		rx_finish_catch <= ps_rx_finish;
		rx_finish_sync <= rx_finish_catch;
	end
	
	assign rx_finish_rise = ~rx_finish_sync && rx_finish_catch;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			pl_tx_finish <= 0;
		else if (ps_ddr_wr_finish)
			pl_tx_finish <= 1;
		else if (rx_finish_rise)
			pl_tx_finish <= 0;
		else
			pl_tx_finish <= pl_tx_finish;
	end
	
	always @ (posedge clk_ps)
	begin
		ps_tx_finish_catch <= ps_tx_finish;
		ps_tx_finish_sync <= ps_tx_finish_catch;
	end
	
	assign ps_tx_finish_rise = ~ps_tx_finish_sync && ps_tx_finish_catch;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			ps_ddr_rd_start <= 0;
		else
			ps_ddr_rd_start <= ps_tx_finish_rise;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			ps_ddr_rd_addr <= 0;
		else
			ps_ddr_rd_addr <= ps_tx_addr;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			ps_ddr_rd_length <= 0;
		else
			ps_ddr_rd_length <= ps_tx_length;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			pl_rx_finish <= 0;
		else if (ps_ddr_rd_finish)
			pl_rx_finish <= 1;
		else if (ps_tx_finish_rise)
			pl_rx_finish <= 0;
		else
			pl_rx_finish <= pl_rx_finish;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			temp <= 0;
		else if (ps_tx_finish_rise)
			temp <= 0;
		else if (ps_ddr_rd_en)
			temp <= temp + 1;
		else
			temp <= temp;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			pl_rx_cnt_error <= 0;
		else if (ps_tx_finish_rise)
			pl_rx_cnt_error <= 0;
		else if (ps_ddr_rd_en) 
			if (temp !== ps_ddr_rd_data)
				pl_rx_cnt_error <= pl_rx_cnt_error + 1;
			else
				pl_rx_cnt_error <= pl_rx_cnt_error;
		else
			pl_rx_cnt_error <= pl_rx_cnt_error;
	end
	
endmodule
