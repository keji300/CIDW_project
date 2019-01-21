`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/22 11:53:18
// Design Name: 
// Module Name: timer
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


module timer(
	input			rst_n,
	input			lvds_clk,
	input			clk_ps,
	input	[31:0]	start,	
	
	output	reg			data_ddr_flag,
	output	reg 		tx_flag,
	output	reg			interrupt_flag,
	output		[31:0]	interrupt_reg
    );
	
	parameter T_100khz = 500;// 50MHz/100KHz=500
	
	reg		[8:0]	cnt;
	reg		[31:0]	temp;
	
	wire	[31:0]	start_en;

	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			cnt <= 0;
		else if (start_en[0])
			if (cnt == T_100khz - 1)
				cnt <= 0;
			else
				cnt <= cnt + 1'd1;
		else
			cnt <= 0;
	end 
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			tx_flag <= 0;
		else if (cnt == 0 && start_en[0])
			tx_flag <= 1;
		else
			tx_flag <= 0;
	end
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			data_ddr_flag <= 0;
		else if (cnt == 399)
			data_ddr_flag <= 1;
		else
			data_ddr_flag <= 0;
	end
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			interrupt_flag <= 0;
		else if (start_en[0])
			if((cnt > 248) && (cnt < 499))
				interrupt_flag <= 1;
			else
				interrupt_flag <= 0;
		else
			interrupt_flag <= interrupt_flag;
	end
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			temp <= 0;
		else if (cnt >= 249 && cnt < 500)
			temp <= 1;
		else
			temp <= 0;
	end
	
	cross_clock interrupt_reg_inst(
		.rst		(~rst_n),
		.wr_clk		(lvds_clk),
		.wr_data	(temp),
		.rd_clk		(clk_ps),
		.rd_data	(interrupt_reg)
    );
	
	cross_clock start_inst(
		.rst		(~rst_n),
		.wr_clk		(clk_ps),
		.wr_data	(start),
		.rd_clk		(lvds_clk),
		.rd_data	(start_en)
    );
	
endmodule
