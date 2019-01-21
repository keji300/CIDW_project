`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/22 09:36:42
// Design Name: 
// Module Name: lvds_rx
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

module lvds_rx(
	input			rst_n,
	input			clk_ps,
	input			lvds_clk,
	input			lvds_data_in,
	input			ram_rd_en,
	
	output	[31:0]	ads_data
    );
	
	parameter WAIT	= 1'D0;
	parameter REC	= 1'D1;
	
	reg				state;
	reg		[31:0]	temp;
	reg		[4:0]	cnt;
	reg		[2:0]	num;
	
	reg				ram_wr_en;
	reg		[3:0]	ram_wr_addr;
	reg		[31:0]	ram_wr_data;
	
	//reg				ram_rd_state;
	//reg 			ram_rd_en;
	reg		[3:0]	ram_rd_addr;
	wire	[31:0]	ram_rd_data;
	
	/* ila_0 ILA(
		.clk(lvds_clk), // input wire clk
		.probe0({
				ram_wr_data,
				ram_wr_en,
				temp,
				cnt,
				num
				}) // input wire [99:0] probe0
	); */
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			temp <= 0;
		else
			temp <= {temp[30:0],lvds_data_in};
	end 
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			state <= WAIT;
		else
			case (state)
				WAIT	:	if (temp == "SFDK")
								state <= REC;
							else
								state <= WAIT;
								
				REC		:	if (num == 7 && cnt == 31)
								state <= WAIT;
							else
								state <= REC;
			endcase
	end
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			cnt <= 0;
		else if (state == REC)
			cnt <= cnt + 1'd1;
		else
			cnt <= 0;
	end
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			num <= 0;
		else if (state == REC)
			if (cnt == 31)
				num <= num + 1'd1;
			else
				num <= num;
		else
			num <= 0;
	end
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			ram_wr_en <= 0;
		else if (cnt == 31)
			ram_wr_en <= 1;
		else
			ram_wr_en <= 0;
	end
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			ram_wr_addr <= 0;
		else if (ram_wr_en)
			if (ram_wr_addr == 8 - 1)
				ram_wr_addr <= 0;
			else
				ram_wr_addr <= ram_wr_addr + 1'd1;
		else
			ram_wr_addr <= ram_wr_addr;
	end
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			ram_wr_data <= 0;
		else if (cnt == 31)
			ram_wr_data <= temp;
		else
			ram_wr_data <= ram_wr_data;
	end
	
	dual_ram_w32xd16 dual_ram_w32xd16_inst (
		.clka	(lvds_clk),  
		.ena	(ram_wr_en),    
		.wea	(1'b1),    
		.addra	(ram_wr_addr),
		.dina	(ram_wr_data),  
		.clkb	(clk_ps),  
		.enb	(ram_rd_en),    
		.addrb	(ram_rd_addr),
		.doutb	(ram_rd_data) 
	);
	
	always @ (posedge clk_ps, negedge rst_n)
	begin
		if (!rst_n)
			ram_rd_addr <= 0;
		else if (ram_rd_en)
			if (ram_rd_addr == 8 - 1)
				ram_rd_addr <= 0;
			else
				ram_rd_addr <= ram_rd_addr + 1'd1;
		else
			ram_rd_addr <= ram_rd_addr;
	end
	
	assign ads_data = ram_rd_data;
	
endmodule
