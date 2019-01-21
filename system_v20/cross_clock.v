`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/06 11:43:44
// Design Name: 
// Module Name: cross_clock
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


module cross_clock(
	input			rst,
	input			wr_clk,
	input	[31:0]	wr_data,
	input			rd_clk,
	
	output	[31:0]	rd_data
    );
	
	wire			empty;
	
	first_fifo_32x16 first_fifo_32x16_inst (
		.wr_clk		(wr_clk),            
		.wr_rst		(rst),            
		.rd_clk		(rd_clk),            
		.rd_rst		(rst),            
		.din		(wr_data),                  
		.wr_en		(1'b1),              
		.rd_en		(~empty),              
		.dout		(rd_data),                
		.full		(),                
		.empty		(empty)
	);
	
endmodule
