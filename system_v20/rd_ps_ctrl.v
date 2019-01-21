`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/10 14:39:44
// Design Name: 
// Module Name: rd_ps_ctrl
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


module rd_ps_ctrl(
	input			ps_rst,
	input			ps_clk,
	
	input			ps_ddr_rd_finish,
	input			ps_ddr_rd_en,
	input	[31:0]	ps_ddr_rd_data,
	output	reg 		ps_ddr_rd_start,
	output	reg [31:0]	ps_ddr_rd_addr,
	output	reg [31:0]	ps_ddr_rd_length
    );
	
	
	
	
	
	
endmodule
