`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/22 10:55:23
// Design Name: 
// Module Name: lvds_tx
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


module lvds_tx(
	input			rst_n,
	input			lvds_clk,
	input			tx_flag,
	
	output	reg		lvds_data_out
    );
	
	parameter AHEAD = "SFDK";
	
	reg		[4:0]	cnt;
	reg				state;
	reg		[31:0]	temp;
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			state <= 0;
		else
			case (state)
				0	:	if (tx_flag)
							state <= 1;
						else
							state <= 0;
				
				1	:	if (cnt == 31)
							state <= 0;
						else
							state <= 1;
			endcase
	end 
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			cnt <= 0;
		else if (state == 1)
			cnt <= cnt + 1;
		else
			cnt <= 0;
	end
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			temp <= 0;
		else if (state == 1)
			temp <= temp << 1;
		else
			temp <= AHEAD;
	end
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			lvds_data_out <= 0;
		else if (state == 1)
			lvds_data_out <= temp[31];
	end
	
endmodule
